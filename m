Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D624838B7E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9BD10E75E;
	Tue, 23 Jan 2024 10:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14410E74A;
 Tue, 23 Jan 2024 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706004938; x=1737540938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VsAKzQTjWrB/fdWeMlJRwIxVXlZHOl6RR8fK5n41VXE=;
 b=dPoIB39aRzOu39mIlIa5Am2Q10srf496okDqwzSI8znPIv9bufon4qMB
 kDazjQkEG7lZWZGLyq+GAyieM74NyT76GN/cmkKn34HEDx4krgpTdZjY1
 t561/gTlXsqdbsxpEC58s/OcP80tuGhfMUoYY9jYQpNaVS8KNz6nJ2GaL
 19YHn+9LOiKXIhEtk8gQTHltdDyhvA28W0KIxGEKvpEHGBwncytU/rB6p
 RfS/PVYr7qIdDkeIDzRDpd0Set1jh2Ec9FzHh2cfA6fsS/DEvW82VKiiF
 NdZHeE2EcM5aX3gcRix0XhTtnSbqXlOkUBAJbRc0nfvf+RRiCEtISWS9T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="14828947"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="14828947"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1117206787"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="1117206787"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:15:31 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 3795611FC49;
 Tue, 23 Jan 2024 11:58:24 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-pm@vger.kernel.org
Subject: [PATCH v4 2/3] pm: runtime: Make pm_runtime_get_if_conditional()
 private
Date: Tue, 23 Jan 2024 11:58:23 +0200
Message-Id: <20240123095823.97346-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123095642.97303-1-sakari.ailus@linux.intel.com>
References: <20240123095642.97303-1-sakari.ailus@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 intel-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop offering pm_runtime_get_if_conditional() API function for drivers,
instead require them to use pm_runtime_get_if_{active,in_use}. Also
convert the only user, the i915 driver, to use the said functions.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/base/power/runtime.c            | 34 ++++++++++++++++++++--
 drivers/gpu/drm/i915/intel_runtime_pm.c |  5 +++-
 include/linux/pm_runtime.h              | 38 ++-----------------------
 3 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 83e0cd2a19e7..d2c17e29567d 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1197,7 +1197,7 @@ EXPORT_SYMBOL_GPL(__pm_runtime_resume);
  * The caller is responsible for decrementing the runtime PM usage counter of
  * @dev after this function has returned a positive value for it.
  */
-int pm_runtime_get_conditional(struct device *dev, bool ign_usage_count)
+static int pm_runtime_get_conditional(struct device *dev, bool ign_usage_count)
 {
 	unsigned long flags;
 	int retval;
@@ -1218,7 +1218,37 @@ int pm_runtime_get_conditional(struct device *dev, bool ign_usage_count)
 
 	return retval;
 }
-EXPORT_SYMBOL_GPL(pm_runtime_get_conditional);
+
+/**
+ * pm_runtime_get_if_active - Bump up runtime PM usage counter if the device is
+ *			      in active state
+ * @dev: Target device.
+ *
+ * Increment the runtime PM usage counter of @dev if its runtime PM status is
+ * %RPM_ACTIVE, in which case it returns 1. If the device is in a different
+ * state, 0 is returned. -EINVAL is returned if runtime PM is disabled for the
+ * device.
+ */
+int pm_runtime_get_if_active(struct device *dev)
+{
+	return pm_runtime_get_conditional(dev, true);
+}
+EXPORT_SYMBOL_GPL(pm_runtime_get_if_active);
+
+/**
+ * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
+ * @dev: Target device.
+ *
+ * Increment the runtime PM usage counter of @dev if its runtime PM status is
+ * %RPM_ACTIVE and its runtime PM usage counter is greater than 0, in which case
+ * it returns 1. If the device is in a different state or its usage_count is 0,
+ * 0 is returned. -EINVAL is returned if runtime PM is disabled for the device.
+ */
+int pm_runtime_get_if_in_use(struct device *dev)
+{
+	return pm_runtime_get_conditional(dev, false);
+}
+EXPORT_SYMBOL_GPL(pm_runtime_get_if_in_use);
 
 /**
  * __pm_runtime_set_status - Set runtime PM status of a device.
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index b5f8abd2a22b..d4e844128826 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -246,7 +246,10 @@ static intel_wakeref_t __intel_runtime_pm_get_if_active(struct intel_runtime_pm
 		 * function, since the power state is undefined. This applies
 		 * atm to the late/early system suspend/resume handlers.
 		 */
-		if (pm_runtime_get_conditional(rpm->kdev, ignore_usecount) <= 0)
+		if ((ignore_usecount &&
+		     pm_runtime_get_if_active(rpm->kdev) <= 0) ||
+		    (!ignore_usecount &&
+		     pm_runtime_get_if_in_use(rpm->kdev) <= 0))
 			return 0;
 	}
 
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index a212b3008ade..436baa167498 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -72,8 +72,8 @@ extern int pm_runtime_force_resume(struct device *dev);
 extern int __pm_runtime_idle(struct device *dev, int rpmflags);
 extern int __pm_runtime_suspend(struct device *dev, int rpmflags);
 extern int __pm_runtime_resume(struct device *dev, int rpmflags);
-extern int pm_runtime_get_conditional(struct device *dev,
-					bool ign_usage_count);
+extern int pm_runtime_get_if_active(struct device *dev);
+extern int pm_runtime_get_if_in_use(struct device *dev);
 extern int pm_schedule_suspend(struct device *dev, unsigned int delay);
 extern int __pm_runtime_set_status(struct device *dev, unsigned int status);
 extern int pm_runtime_barrier(struct device *dev);
@@ -95,35 +95,6 @@ extern void pm_runtime_release_supplier(struct device_link *link);
 
 extern int devm_pm_runtime_enable(struct device *dev);
 
-/**
- * pm_runtime_get_if_active - Bump up runtime PM usage counter if the device is
- *			      in active state
- * @dev: Target device.
- *
- * Increment the runtime PM usage counter of @dev if its runtime PM status is
- * %RPM_ACTIVE, in which case it returns 1. If the device is in a different
- * state, 0 is returned. -EINVAL is returned if runtime PM is disabled for the
- * device.
- */
-static inline int pm_runtime_get_if_active(struct device *dev)
-{
-	return pm_runtime_get_conditional(dev, true);
-}
-
-/**
- * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
- * @dev: Target device.
- *
- * Increment the runtime PM usage counter of @dev if its runtime PM status is
- * %RPM_ACTIVE and its runtime PM usage counter is greater than 0, in which case
- * it returns 1. If the device is in a different state or its usage_count is 0,
- * 0 is returned. -EINVAL is returned if runtime PM is disabled for the device.
- */
-static inline int pm_runtime_get_if_in_use(struct device *dev)
-{
-	return pm_runtime_get_conditional(dev, false);
-}
-
 /**
  * pm_suspend_ignore_children - Set runtime PM behavior regarding children.
  * @dev: Target device.
@@ -297,11 +268,6 @@ static inline int pm_runtime_get_if_active(struct device *dev)
 {
 	return -EINVAL;
 }
-static inline int pm_runtime_get_conditional(struct device *dev,
-					     bool ign_usage_count)
-{
-	return -EINVAL;
-}
 static inline int __pm_runtime_set_status(struct device *dev,
 					    unsigned int status) { return 0; }
 static inline int pm_runtime_barrier(struct device *dev) { return 0; }
-- 
2.39.2

