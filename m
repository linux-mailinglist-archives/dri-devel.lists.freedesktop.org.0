Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A347F7420
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C76A10E7E0;
	Fri, 24 Nov 2023 12:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB3610E7DD;
 Fri, 24 Nov 2023 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700829880; x=1732365880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+VjZ7uZojJvr14RcYGF9jRgvwA/BHTpYzyr1pyIH0B0=;
 b=TxgOQ/Wb/hf7dJi9Szobg1rxjWtARCnM3AWk8D4oFKQ1eJergvYCDUt5
 HW11ydjDuKclagAO+4N1cytd0I2pHnj+BfGMSafMimDzjE1O8INyfM+ba
 WzH+HGylYEamCzB5dAGEow649JaIVG2b689PYw7xAxjyn42EK1r/xhWUV
 EcqLJ/CSabWZq7I1eeYfOgOye7wrr12HK1lQZLETttqyy3LPtjLpFevox
 CQt9q30t01rfvTRVQfvlJSbziEajbF9q6P0ZF3e0gFuEg5kyyXBAt+ar2
 ZVO2z/8l2nnovQePxxxiwxJAUp6H4CL34GtmbIM0ahmlxL4DX1jQ5hLtg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478626975"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="478626975"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833688066"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="833688066"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915: switch from drm_debug_printer() to device
 specific drm_dbg_printer()
Date: Fri, 24 Nov 2023 14:44:01 +0200
Message-Id: <f6164ba24b8a4fdce4b8dd24ae6c670389c1be48.1700829750.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1700829750.git.jani.nikula@intel.com>
References: <cover.1700829750.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the device specific debug printer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 3 ++-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c    | 3 ++-
 drivers/gpu/drm/i915/gt/intel_reset.c               | 3 ++-
 drivers/gpu/drm/i915/gt/intel_workarounds.c         | 3 ++-
 drivers/gpu/drm/i915/gt/selftest_context.c          | 3 ++-
 drivers/gpu/drm/i915/i915_driver.c                  | 3 ++-
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 62f7b10484be..b6e7d66f895d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -387,7 +387,8 @@ int intel_display_driver_probe(struct drm_i915_private *i915)
 
 void intel_display_driver_register(struct drm_i915_private *i915)
 {
-	struct drm_printer p = drm_debug_printer("i915 display info:");
+	struct drm_printer p = drm_dbg_printer(&i915->drm, DRM_UT_KMS,
+					       "i915 display info:");
 
 	if (!HAS_DISPLAY(i915))
 		return;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 1a8e2b7db013..0f6406f0cca0 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -96,7 +96,8 @@ static void heartbeat_commit(struct i915_request *rq,
 static void show_heartbeat(const struct i915_request *rq,
 			   struct intel_engine_cs *engine)
 {
-	struct drm_printer p = drm_debug_printer("heartbeat");
+	struct drm_printer p = drm_dbg_printer(&rq->i915->drm, DRM_UT_DRIVER,
+					       "heartbeat");
 
 	if (!rq) {
 		intel_engine_dump(engine, &p,
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index d5ed904f355d..5909d8115eb6 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1015,7 +1015,8 @@ void intel_gt_set_wedged(struct intel_gt *gt)
 	mutex_lock(&gt->reset.mutex);
 
 	if (GEM_SHOW_DEBUG()) {
-		struct drm_printer p = drm_debug_printer(__func__);
+		struct drm_printer p = drm_dbg_printer(&gt->i915->drm,
+						       DRM_UT_DRIVER, __func__);
 		struct intel_engine_cs *engine;
 		enum intel_engine_id id;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 9bc0654efdc0..66aea33ed894 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1230,7 +1230,8 @@ static void __set_mcr_steering(struct i915_wa_list *wal,
 
 static void debug_dump_steering(struct intel_gt *gt)
 {
-	struct drm_printer p = drm_debug_printer("MCR Steering:");
+	struct drm_printer p = drm_dbg_printer(&gt->i915->drm, DRM_UT_DRIVER,
+					       "MCR Steering:");
 
 	if (drm_debug_enabled(DRM_UT_DRIVER))
 		intel_gt_mcr_report_steering(&p, gt, false);
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 47070cba7eb1..12eca750f7d0 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -285,7 +285,8 @@ static int __live_active_context(struct intel_engine_cs *engine)
 	intel_engine_pm_flush(engine);
 
 	if (intel_engine_pm_is_awake(engine)) {
-		struct drm_printer p = drm_debug_printer(__func__);
+		struct drm_printer p = drm_dbg_printer(&engine->i915->drm,
+						       DRM_UT_DRIVER, __func__);
 
 		intel_engine_dump(engine, &p,
 				  "%s is still awake:%d after idle-barriers\n",
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 15e58b8ef027..1d99a1fb4093 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -681,7 +681,8 @@ i915_print_iommu_status(struct drm_i915_private *i915, struct drm_printer *p)
 static void i915_welcome_messages(struct drm_i915_private *dev_priv)
 {
 	if (drm_debug_enabled(DRM_UT_DRIVER)) {
-		struct drm_printer p = drm_debug_printer("i915 device info:");
+		struct drm_printer p = drm_dbg_printer(&dev_priv->drm, DRM_UT_DRIVER,
+						       "device info:");
 		struct intel_gt *gt;
 		unsigned int i;
 
-- 
2.39.2

