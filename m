Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53A35FA38C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 20:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656A510E2DF;
	Mon, 10 Oct 2022 18:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4D710E2DF;
 Mon, 10 Oct 2022 18:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665427574; x=1696963574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IFaE6bCPAFgcWOp/D8w3vO+h4+GFNJNpqDIgqE8q15U=;
 b=kpnX+UmXZuSUuOoeXr7bSD194dAlenQocoB/NaS7KuddaB9nCKz/RLJl
 vhA6dI9gLg4TAQ3iiNRDzrbl9A21VOHkEYYf76kPa06HJNXCKYB3vBCsq
 k+54jMdGxcd4vPlbI3ie/3nE6prXkeHSElKFuEaAW6DKopyDEGnNlY09/
 V52ln8/frfw6pPsenodKLCpih5A93BbK0y7H6LwH4edYxQcOzdCc4Smdy
 GHyC8HXAkpEIxy9MMUWxBZ2m0g07Ex+T49Oaabz2I0qixe42tr3j1ddoD
 ozWggz4nnTCYVYFBOay9IDurakIswoaRg4LnRpQSwPISJ086ENGlVoxvj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="287548364"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="287548364"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 11:46:13 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="955022275"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="955022275"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 11:46:12 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/huc: bump timeout for delayed load and reduce
 print verbosity
Date: Mon, 10 Oct 2022 11:48:12 -0700
Message-Id: <20221010184812.1576601-1-daniele.ceraolospurio@intel.com>
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
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're observing sporadic HuC delayed load timeouts in CI, due to mei_pxp
binding completing later than we expected. HuC is still loaded when the
bind occurs, but in the meantime i915 has started allowing submission to
the VCS engines even if HuC is not there.
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

v2: use separate prints for MEI GSC and MEI PXP init timeouts (John)

References: https://gitlab.freedesktop.org/drm/intel/-/issues/7033
Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 4d1cc383b681..41c032ab34b3 100644
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
@@ -104,8 +106,12 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
 	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
 
 	if (!intel_huc_is_authenticated(huc)) {
-		drm_err(&huc_to_gt(huc)->i915->drm,
-			"timed out waiting for GSC init to load HuC\n");
+		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
+			drm_notice(&huc_to_gt(huc)->i915->drm,
+				   "timed out waiting for MEI GSC init to load HuC\n");
+		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
+			drm_notice(&huc_to_gt(huc)->i915->drm,
+				   "timed out waiting for MEI PXP init to load HuC\n");
 
 		__gsc_init_error(huc);
 	}
-- 
2.37.3

