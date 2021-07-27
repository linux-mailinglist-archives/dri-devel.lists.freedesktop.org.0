Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D669C3D7C39
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABE56E9EA;
	Tue, 27 Jul 2021 17:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136F16E5A5;
 Tue, 27 Jul 2021 17:35:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209383254"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="209383254"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 10:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="456193105"
Received: from bnilawar-ubuntu.iind.intel.com ([10.145.162.129])
 by orsmga007.jf.intel.com with ESMTP; 27 Jul 2021 10:35:11 -0700
From: badal.nilawar@intel.com
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915: dgfx cards need to wait on pcode's uncore init
 done
Date: Tue, 27 Jul 2021 23:03:38 +0530
Message-Id: <20210727173338.901264-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: jon.ewins@intel.com, Badal Nilawar <badal.nilawar@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Badal Nilawar <badal.nilawar@intel.com>

In discrete cards, the graphics driver shouldn't proceed with the probe
or resume unless PCODE indicated everything is done, including memory
training and gt bring up.

For this reason, the driver probe and resume paths needs to be blocked
until PCODE indicates it is done. Also, it needs to aborted if the
notification never arrives.

In general, the few miliseconds would be enough and the regular PCODE
recommendation for the timeout was 10 seconds. However there are some
rare cases where this initialization can take up to 1 minute. So,
PCODE has increased the recommendation to 3 minutes so we don't fully
block the device utilization when something just got delayed for
whatever reason. To be on the safest side, let's accept this
recommendation, since on the regular case it won't delay or block the
driver initialization and resume flows

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c       |  8 +++++++-
 drivers/gpu/drm/i915/intel_sideband.c | 13 +++++++++----
 drivers/gpu/drm/i915/intel_sideband.h |  2 +-
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index c43b698bf0b97..59fb4c710c8ca 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -620,7 +620,9 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 	intel_opregion_setup(dev_priv);
 
-	intel_pcode_init(dev_priv);
+	ret = intel_pcode_init(dev_priv);
+	if (ret)
+		goto err_msi;
 
 	/*
 	 * Fill the dram structure to get the system dram info. This will be
@@ -1231,6 +1233,10 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
+	ret = intel_pcode_init(dev_priv);
+	if (ret)
+		return ret;
+
 	sanitize_gpu(dev_priv);
 
 	ret = i915_ggtt_enable_hw(dev_priv);
diff --git a/drivers/gpu/drm/i915/intel_sideband.c b/drivers/gpu/drm/i915/intel_sideband.c
index f0a82b37bd1ac..e304bf44e1ff8 100644
--- a/drivers/gpu/drm/i915/intel_sideband.c
+++ b/drivers/gpu/drm/i915/intel_sideband.c
@@ -556,17 +556,22 @@ int skl_pcode_request(struct drm_i915_private *i915, u32 mbox, u32 request,
 #undef COND
 }
 
-void intel_pcode_init(struct drm_i915_private *i915)
+int intel_pcode_init(struct drm_i915_private *i915)
 {
-	int ret;
+	int ret = 0;
 
 	if (!IS_DGFX(i915))
-		return;
+		return ret;
 
 	ret = skl_pcode_request(i915, DG1_PCODE_STATUS,
 				DG1_UNCORE_GET_INIT_STATUS,
 				DG1_UNCORE_INIT_STATUS_COMPLETE,
-				DG1_UNCORE_INIT_STATUS_COMPLETE, 50);
+				DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
+
+	drm_dbg(&i915->drm, "PCODE init status %d\n", ret);
+
 	if (ret)
 		drm_err(&i915->drm, "Pcode did not report uncore initialization completion!\n");
+
+	return ret;
 }
diff --git a/drivers/gpu/drm/i915/intel_sideband.h b/drivers/gpu/drm/i915/intel_sideband.h
index 094c7b19c5d42..d1d14bcb8f56e 100644
--- a/drivers/gpu/drm/i915/intel_sideband.h
+++ b/drivers/gpu/drm/i915/intel_sideband.h
@@ -138,6 +138,6 @@ int sandybridge_pcode_write_timeout(struct drm_i915_private *i915, u32 mbox,
 int skl_pcode_request(struct drm_i915_private *i915, u32 mbox, u32 request,
 		      u32 reply_mask, u32 reply, int timeout_base_ms);
 
-void intel_pcode_init(struct drm_i915_private *i915);
+int intel_pcode_init(struct drm_i915_private *i915);
 
 #endif /* _INTEL_SIDEBAND_H */
-- 
2.25.1

