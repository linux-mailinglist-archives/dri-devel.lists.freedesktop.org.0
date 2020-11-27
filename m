Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8694F2C6587
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE006ED98;
	Fri, 27 Nov 2020 12:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59D66ED87;
 Fri, 27 Nov 2020 12:12:13 +0000 (UTC)
IronPort-SDR: rja1tNbTqQ3awvL6mtXtagMndIL5Kz6Q+0jFIsPOOIIG45VgnIZGlN7ZY5ufPuSToi6Ljfollz
 LXN0mnLaohtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883845"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883845"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:13 -0800
IronPort-SDR: 3iVmnPsWPskOqBj3n8qgQxsAMxN/egX+UJQ0uiko+7+unW2z48e+4x9+CL9qJSdQPAyRtm78Ex
 54ju6tdpEKOw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030008"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:11 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 148/162] drm/i915: suspend/resume enable blitter eviction
Date: Fri, 27 Nov 2020 12:07:04 +0000
Message-Id: <20201127120718.454037-149-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

In suspend mode use blitter eviction before disable the runtime
interrupts and in resume use blitter after the gem resume happens.

Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 36 +++++++++++++--------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 7115f4db5043..eb5383e4a30b 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1110,13 +1110,6 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
 	struct intel_memory_region *mem;
 	int id, ret = 0;
 
-	/*
-	 * FIXME: Presently using memcpy,
-	 * will replace with blitter once
-	 * fix the issues.
-	 */
-	i915->params.enable_eviction = 1;
-
 	for_each_memory_region(mem, i915, id) {
 		struct list_head still_in_list;
 		INIT_LIST_HEAD(&still_in_list);
@@ -1173,7 +1166,6 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
 			mutex_unlock(&mem->objects.lock);
 		}
 	}
-	i915->params.enable_eviction = 3;
 	return ret;
 }
 
@@ -1235,6 +1227,18 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	intel_dp_mst_suspend(dev_priv);
 
+	if (HAS_LMEM(dev_priv))	{
+		ret = intel_dmem_evict_buffers(dev, true);
+		if (ret)
+			return ret;
+
+		i915_teardown_blt_windows(dev_priv);
+
+		ret = i915_gem_suspend_ppgtt_mappings(dev_priv);
+		if (ret)
+			return ret;
+	}
+
 	intel_runtime_pm_disable_interrupts(dev_priv);
 	intel_hpd_cancel_work(dev_priv);
 
@@ -1251,18 +1255,6 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	intel_fbdev_set_suspend(dev, FBINFO_STATE_SUSPENDED, true);
 
-	if (HAS_LMEM(dev_priv))	{
-		ret = intel_dmem_evict_buffers(dev, true);
-		if (ret)
-			return ret;
-
-		i915_teardown_blt_windows(dev_priv);
-
-		ret = i915_gem_suspend_ppgtt_mappings(dev_priv);
-		if (ret)
-			return ret;
-	}
-
 	dev_priv->suspend_count++;
 
 	intel_csr_ucode_suspend(dev_priv);
@@ -1418,6 +1410,8 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	drm_mode_config_reset(dev);
 
+	i915_gem_resume(dev_priv);
+
 	if (HAS_LMEM(dev_priv)) {
 		i915_gem_restore_ppgtt_mappings(dev_priv);
 
@@ -1430,8 +1424,6 @@ static int i915_drm_resume(struct drm_device *dev)
 			DRM_ERROR("i915_resume:i915_gem_object_pin_pages failed with err=%d\n", ret);
 	}
 
-	i915_gem_resume(dev_priv);
-
 	intel_modeset_init_hw(dev_priv);
 	intel_init_clock_gating(dev_priv);
 	intel_hpd_init(dev_priv);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
