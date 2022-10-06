Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6849D5F6CA1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 19:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E02810E65B;
	Thu,  6 Oct 2022 17:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF97810E658;
 Thu,  6 Oct 2022 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665076748; x=1696612748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u6QVCQbZj0bZ/t8wMtuvGCA39vQxgBOFxqW0TCP2GqE=;
 b=NkQYIxd20gfxJzOELf/pUA3SS7XtEeCAmUKnoxc7q4VsSriL4Lk4pRkD
 t//PbQbhItwsuiGrLWqq6DztvXtfCgz8Ms+Wm8qLs3S9nL6KtVbgIJwQv
 cItpvJ94OTNuKRViULpPEpn5zs22GVzq3/MfPk7xZa1BzF1izTD5Zb4V4
 5I1N40MtuJ+Eb64r/1RRqF0s8oPTPQqIvk3DBbuKdghxnE7TjRloNnI+l
 Hg2iqJfwZLSbqnKigdHs2F7cO8Eun5Eu8qFnuBDDtNS52ZkppgsJ0TUBO
 BQjxYL9QWRkpaPI5iQn61zgVLUu3fNae51qqzQcIuKioQPUTW5JpPYed4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="283879415"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="283879415"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 10:19:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="869931652"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="869931652"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 10:19:07 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/huc: bump timeout for delayed load and reduce print
 verbosity
Date: Thu,  6 Oct 2022 10:20:56 -0700
Message-Id: <20221006172056.1381588-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Tony Ye <tony.ye@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're observing sporadic HuC delayed load timeouts in CI, due to mei_pxp
binding completing later than we expected. HuC is still still loaded
when the bind occurs, but in the meantime i915 has started allowing
submission to the VCS engines even if HuC is not there.
In most of the cases I've observed, the timeout was due to the
init/resume of another driver between i915 and mei hitting errors and
thus adding an extra delay, but HuC was still loaded before userspace
could submit, because the whole resume process time was increased by the
delays.

Given that there is no upper bound to the delay that can be introduced
by other drivers, I've reached the following compromise with the media
team:

1) i915 is going to bump the timeout to 5s, to reduce the probability
of reaching it. We still expect HuC to be loaded before userspace
starts submitting, so increasing the timeout should have no impact on
normal operations, but in case something weird happens we don't want to
stall video submissions for too long.

2) The media driver will cope with the failing submissions that manage
to go through between i915 init/resume complete and HuC loading, if any
ever happen. This could cause a small corruption of video playback
immediately after a resume (we should be safe on boot because the media
driver polls the HUC_STATUS ioctl before starting submissions).

Since we're accepting the timeout as a valid outcome, I'm also reducing
the print verbosity from error to notice.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/7033
Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 4d1cc383b681..73a6a2fae637 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -52,10 +52,12 @@
  * guaranteed for this to happen during boot, so the big timeout is a safety net
  * that we never expect to need.
  * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs to be resumed
- * and/or reset, this can take longer.
+ * and/or reset, this can take longer. Note that the kernel might schedule
+ * other work between the i915 init/resume and the MEI one, which can add to
+ * the delay.
  */
 #define GSC_INIT_TIMEOUT_MS 10000
-#define PXP_INIT_TIMEOUT_MS 2000
+#define PXP_INIT_TIMEOUT_MS 5000
 
 static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
 				 enum i915_sw_fence_notify state)
@@ -104,8 +106,8 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
 	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
 
 	if (!intel_huc_is_authenticated(huc)) {
-		drm_err(&huc_to_gt(huc)->i915->drm,
-			"timed out waiting for GSC init to load HuC\n");
+		drm_notice(&huc_to_gt(huc)->i915->drm,
+			   "timed out waiting for GSC init to load HuC\n");
 
 		__gsc_init_error(huc);
 	}
-- 
2.37.3

