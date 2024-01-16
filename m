Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3FA82EF70
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F06610E504;
	Tue, 16 Jan 2024 13:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F83910E504;
 Tue, 16 Jan 2024 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410508; x=1736946508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IfNlx1RE/YXmIyF/lO6zvXK1Uhhve+SgANQXCE1xkAU=;
 b=Zr/pnxLuslHXyjtfnI0ATAW45i/UYM4jG7VKPJoNBOLc0z648+3XPNMb
 qxfo0B+ZEXz8UdE8dGuCtMEf2lFnn9w+1FplfRYsHERa+12AqBUj7Z/aQ
 SIkAmRUN8tYJ5J6bPHzxippB1O7pYbqhSJvuMGa7bMfrqgo31HoKWX5nN
 UJNk5sRUkJvq8bWqPOSmMI+isUDVy1DZGnvDmoaHrMJU/oAotboq1ItTt
 WuUEQN3jxqOTQh1qW+KxdRYIuYkKX8c9f/Zhpbs1Vm51O8BOuVVHgjO8w
 KNi3vcocj0C5CvsJ9odu0ZjsQGLIq6qaGhei02w1V5IFRXc0bRyTBcZso w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="397015930"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="397015930"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="760181485"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="760181485"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] drm/i915: switch from drm_debug_printer() to device
 specific drm_dbg_printer()
Date: Tue, 16 Jan 2024 15:07:32 +0200
Message-Id: <f2614dfcba295be20c650cdab24c3979d265f422.1705410327.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
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
index ecf9cb74734b..e733f7c4c6c6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -518,7 +518,8 @@ int intel_display_driver_probe(struct drm_i915_private *i915)
 
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
index 6801f8b95c53..c8e9aa41fdea 100644
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
index 270b56fc85e2..e6f48aa967c2 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1236,7 +1236,8 @@ static void __set_mcr_steering(struct i915_wa_list *wal,
 
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
index a951050f6a75..9ee902d5b72c 100644
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

