Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F98F6A0E77
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 18:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B9110E4EA;
	Thu, 23 Feb 2023 17:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37A610E4EA;
 Thu, 23 Feb 2023 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677172458; x=1708708458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=APrng5LoHzOPzPCjAS414IxAsFvbCm+rmqXEhaj/je0=;
 b=Ter1ieOYKpiL9IB+hho03XgPRs7YArCkP/sJf/YkKdQd4mVluUhkE+Dj
 imyaSzLUeUTmycmdrAvj6n8UZECsznfp0hbggnH39yUwQ6GJiHCwdelEJ
 mEKaQNZIPWnGiMfPPrWbW4pYmInWYwBum5HZEHc0dawP8vpq6yAmNXpZp
 tORaeWKGmQe18GyO56q5jo5I5w5Zn2yDYFoIA+zh547jW4tUfFZWOzYp9
 nToHmHstwYTBikIZwOVQnOTdEvApcSKiBOLf7BY0Gv3tHe9Cm63MFytHQ
 66k/B27LBun7RehvOm/WSyaUVFKfgo9XUO27PbDeod2QSJ6EiZxQ9V+n/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331944922"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="331944922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 09:14:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="1001489607"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="1001489607"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 09:14:17 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gsc: flush the GSC worker before wedging on
 unload
Date: Thu, 23 Feb 2023 09:21:19 -0800
Message-Id: <20230223172120.3304293-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230223172120.3304293-1-daniele.ceraolospurio@intel.com>
References: <20230223172120.3304293-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we unload the driver and wedge before the GSC worker is complete,
the worker will hit an error on its submission to the GSC engine and
then exit. This is hard to hit for a user, but it is reproducible
with skipping selftests. The error is handled gracefully by the
worker, so there are no functional issues, but we still end up with
an error message in dmesg, which is something we want to avoid as
this is a supported scenario. We could modify the worker to better
handle a wedging occurring during its execution, but that gets
complicated for a couple of reasons:
- We do want the error on runtime wedging, because there are
  implications for subsystems outside of GT (i.e., PXP, HDCP), it's
  only the error on driver unload that we want to silence.
- The worker is responsible for multiple submissions (GSC FW load,
  HuC auth, SW proxy), so all of those will have to be adapted to
  handle the wedged_on_fini scenario.
Therefore, it's much simpler to just wait for the worker to be done
before wedging on driver removal, also considering that the worker
will likely already be idle in the great majority of non-selftest
scenarios.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c        | 23 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  2 +-
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index f7f271708fc7..89ccb95e146c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -784,6 +784,29 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 	intel_rps_driver_unregister(&gt->rps);
 	intel_gsc_fini(&gt->gsc);
 
+	/*
+	 * If we unload the driver and wedge before the GSC worker is complete,
+	 * the worker will hit an error on its submission to the GSC engine and
+	 * then exit. This is hard to hit for a user, but it is reproducible
+	 * with skipping selftests. The error is handled gracefully by the
+	 * worker, so there are no functional issues, but we still end up with
+	 * an error message in dmesg, which is something we want to avoid as
+	 * this is a supported scenario. We could modify the worker to better
+	 * handle a wedging occurring during its execution, but that gets
+	 * complicated for a couple of reasons:
+	 * - We do want the error on runtime wedging, because there are
+	 *   implications for subsystems outside of GT (i.e., PXP, HDCP), it's
+	 *   only the error on driver unload that we want to silence.
+	 * - The worker is responsible for multiple submissions (GSC FW load,
+	 *   HuC auth, SW proxy), so all of those will have to be adapted to
+	 *   handle the wedged_on_fini scenario.
+	 * Therefore, it's much simpler to just wait for the worker to be done
+	 * before wedging on driver removal, also considering that the worker
+	 * will likely already be idle in the great majority of non-selftest
+	 * scenarios.
+	 */
+	intel_gsc_uc_flush_work(&gt->uc.gsc);
+
 	/*
 	 * Upon unregistering the device to prevent any new users, cancel
 	 * all in-flight requests so that we can quickly unbind the active
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index 8afd42cbded9..92e1571fdc46 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -116,7 +116,7 @@ void intel_gsc_uc_fini(struct intel_gsc_uc *gsc)
 	intel_uc_fw_fini(&gsc->fw);
 }
 
-void intel_gsc_uc_suspend(struct intel_gsc_uc *gsc)
+void intel_gsc_uc_flush_work(struct intel_gsc_uc *gsc)
 {
 	if (!intel_uc_fw_is_loadable(&gsc->fw))
 		return;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
index 03fd0a8e8db1..c8b025343ea6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
@@ -26,6 +26,7 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc);
 int intel_gsc_uc_init(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_fini(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_suspend(struct intel_gsc_uc *gsc);
+void intel_gsc_uc_flush_work(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc);
 
 static inline bool intel_gsc_uc_is_supported(struct intel_gsc_uc *gsc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 6648691bd645..5fa5c0999212 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -672,7 +672,7 @@ void intel_uc_suspend(struct intel_uc *uc)
 	int err;
 
 	/* flush the GSC worker */
-	intel_gsc_uc_suspend(&uc->gsc);
+	intel_gsc_uc_flush_work(&uc->gsc);
 
 	if (!intel_guc_is_ready(guc)) {
 		guc->interrupts.enabled = false;
-- 
2.37.3

