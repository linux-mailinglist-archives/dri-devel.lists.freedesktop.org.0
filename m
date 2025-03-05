Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A599A50B2C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 20:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5C189C86;
	Wed,  5 Mar 2025 19:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2FdmGyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8961C89CB3;
 Wed,  5 Mar 2025 19:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741201953; x=1772737953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mFBtAcqmJJti0U04z7ZkL9DY6nvUjHAUrPJJl73xe0=;
 b=I2FdmGyDtYJWFlY4l30y0Pm619jcu4U1yqM9hh6zRVs01Cl2WyTWIM8s
 lI+KTXGjqzUZWTTzYRlsV/ukyL2ZVkmJVDsEgS742EaL23JzX3awYU0Op
 gUPS34BJYE1/1z64pupBuqDGnBPqIZP7OIrS8Q6rWXEgf3R88xTQOb1BE
 RB6F1IpuIUiJtoeh1ulkuPkclwIlSr+Mf9fspBAEp8sWVjaukkLx67anM
 d1UD8jdRVm+UEGx5WrIV9tYB2KvPlOsGYuXYy7Tx6axP0cFdbrg2GrQ4y
 9IEGOzOWKca/aHcXUeJTC9i7ws+lzEJ3BXeP9xr92DGeC0VBvr/hopWYl Q==;
X-CSE-ConnectionGUID: qDiXCtvsQdyndINKGC/ClA==
X-CSE-MsgGUID: iOb8O2k5TYan7M3JUnH1Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46110888"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="46110888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:12:33 -0800
X-CSE-ConnectionGUID: UPtdUfhAR8mCg0Yutwww1A==
X-CSE-MsgGUID: Z5dUwSzJTtOFd8EIyb/svA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118803028"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.58])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:12:24 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v3 2/4] drm/i915: Omit unnecessary driver unregister steps
Date: Wed,  5 Mar 2025 20:11:11 +0100
Message-ID: <20250305191152.164615-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305191152.164615-6-janusz.krzysztofik@linux.intel.com>
References: <20250305191152.164615-6-janusz.krzysztofik@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have a flag that indicates device registration status, when
unregistering the driver, jump over reverts of driver registration steps
that were not called due to device registration failure.

Unfortunately, not all steps of i915_driver_unregister() are limited only
to reverting changes introduced by their corresponding steps of
i915_driver_register(), and some are called out of order (not in reverse
order of what was called / skipped during driver registration.

One example is intel_gt_driver_unregister() called for each GT.  For clean
driver removal, a step of that function -- intel_gsc_uc_flush_work() --
occurred required even if intel_gt_driver_register() was not called due to
device registration failure.  That call was added to
intel_gt_driver_unregister() with commit b09f9670b13038 ("drm/i915/gsc:
flush the GSC worker before wedging on unload").

Another exception is intel_pxp_fini().  It seems to be a counterpart of
intel_pxp_init(), called directly from i915_driver_probe(), rather than of
intel_pxp_debugfs_register().  However, it still needs to be called before
intel_gt_driver_unregister()->intel_gsc_uc_flush_work() for clean driver
removal.  The call to intel_pxp_fini() was added to
i915_driver_unregister() with commit f67986b0119c04 ("drm/i915/pxp:
Promote pxp subsystem to top-level of i915").

Also, drm_dev_unplug() must be called even if drm_dev_register() failed.
It not only does more than drm_dev_unregister() but also, some of its
initial steps might have been called and not unwound even if an error then
occurred, so they must be reverted on driver unregister.

Last, i915_pmu_unregister(), a counterpart of i915_pmu_register() always
called from i915_driver_register(), must be called unconditionally from
i915_driver_register().  However, since it is called a few steps before
drm_dev_unplug(), it also requires special handling.  BTW, its placement
within i915_driver_unregister() hasn't changes since the immediate return
from i915_driver_register() on device registration failure was introduced.

To avoid unexpected side effects, execution order of unregister steps is
strictly preserved, which potentially makes the code changes sub-optimal.
That will be addressed in follow-up patches.

v3: Don't limit the scope to fixing a subset of what needs to be handled
    properly (hwmon? gt? debugfs?). (Andi)
v2: Check in _unregister whether the drm_dev_register has succeeded and
    skip some of the _unregister() steps. (Andi)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c |  9 +++++++--
 drivers/gpu/drm/i915/i915_driver.c | 17 +++++++++++++----
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 77eb9305a1ff8..17e2ccd8b1a92 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -783,8 +783,10 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 {
 	intel_wakeref_t wakeref;
 
-	if (gt->i915->do_unregister)
-		intel_gt_sysfs_unregister(gt);
+	if (!gt->i915->do_unregister)
+		goto not_registered;
+
+	intel_gt_sysfs_unregister(gt);
 	intel_rps_driver_unregister(&gt->rps);
 	intel_gsc_fini(&gt->gsc);
 
@@ -809,7 +811,10 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 	 * will likely already be idle in the great majority of non-selftest
 	 * scenarios.
 	 */
+not_registered:
 	intel_gsc_uc_flush_work(&gt->uc.gsc);
+	if (!gt->i915->do_unregister)
+		return;
 
 	/*
 	 * Upon unregistering the device to prevent any new users, cancel
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 2caaeeab1f0f6..d865e90f54704 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -672,26 +672,35 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 	struct intel_gt *gt;
 	unsigned int i;
 
+	if (!dev_priv->do_unregister)
+		goto do_pxp_gt;
+
 	i915_switcheroo_unregister(dev_priv);
 
 	intel_runtime_pm_disable(&dev_priv->runtime_pm);
-	if (dev_priv->do_unregister)
-		intel_power_domains_disable(display);
+	intel_power_domains_disable(display);
 
 	intel_display_driver_unregister(display);
 
+do_pxp_gt:
 	intel_pxp_fini(dev_priv);
 
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_unregister(gt);
 
+	if (!dev_priv->do_unregister)
+		goto do_pmu;
+
 	i915_hwmon_unregister(dev_priv);
 
 	i915_perf_unregister(dev_priv);
+do_pmu:
 	i915_pmu_unregister(dev_priv);
+	if (!dev_priv->do_unregister)
+		goto do_unplug;
 
-	if (dev_priv->do_unregister)
-		i915_teardown_sysfs(dev_priv);
+	i915_teardown_sysfs(dev_priv);
+do_unplug:
 	drm_dev_unplug(&dev_priv->drm);
 
 	i915_gem_driver_unregister(dev_priv);
-- 
2.48.1

