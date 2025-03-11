Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9971BA5D065
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 21:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0732F10E5E4;
	Tue, 11 Mar 2025 20:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4zIgW3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B26710E5E4;
 Tue, 11 Mar 2025 20:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741723599; x=1773259599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j++Pp4qFYKvS13RY5rEn03O8QfNNXMN6rHzvyz6X9+s=;
 b=P4zIgW3rw0d1JUSi6AHRBwXxYOxzp7j1E+5j3Rmeo3IO7syYiWVg+68q
 VIe0Qw1/Oz9+p8FD+FoT3ottv0NnvkWfCliMyeL0itq/9ZSI3zb6hjStE
 w0FenYI75RxM8sEHeDrf/9SFWZNPs5udWHIt4zNVtYseXgoUgarQmE7La
 AoqDV+auZqdzuBsgTR5Phmm6HywqZijbA5gnESur822kfsLRPijDvO/0W
 5qWGPniDLgsv6fawbyM7pFqxpoSGmbOxpZdMEUvZuUybAwfPRrdgOHAWn
 rITQLbYcRVPkiuKogzScTVcA27bGWHnJKjWl3Avqr3v+DKYTdkkbxUd4w g==;
X-CSE-ConnectionGUID: aPCLzM4hRYWsO2adySCKNQ==
X-CSE-MsgGUID: eJRfAySITTecKSA83M20Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42692081"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42692081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 13:06:39 -0700
X-CSE-ConnectionGUID: JyD2Hz/NQC6Z0FJVvX1oBA==
X-CSE-MsgGUID: ai9mz3yhQ8KG6qSC+5A41g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="125323940"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.197])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 13:06:35 -0700
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
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v4] drm/i915: Fix harmful driver register/unregister asymmetry
Date: Tue, 11 Mar 2025 21:04:56 +0100
Message-ID: <20250311200550.637383-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Starting with commit ec3e00b4ee27 ("drm/i915: stop registering if
drm_dev_register() fails"), we return from i915_driver_register()
immediately if drm_dev_register() fails, skipping remaining registration
steps, and continue only with remaining probe steps.  However, the
_unregister() counterpart called at driver remove knows nothing about that
skip and executes reverts of all those steps, with some of those reverts
possibly added or modified later.  As a consequence, a number of kernel
warnings that taint the kernel are triggered:

<3> [525.823143] i915 0000:00:02.0: [drm] *ERROR* Failed to register driver for
userspace access!
...
<4> [525.831069] ------------[ cut here ]------------
<4> [525.831071] i915 0000:00:02.0: [drm] drm_WARN_ON(power_domains->init_wakere
f)
<4> [525.831095] WARNING: CPU: 6 PID: 3440 at drivers/gpu/drm/i915/display/intel
_display_power.c:2074 intel_power_domains_disable+0xc2/0xd0 [i915]
...
<4> [525.831328] CPU: 6 UID: 0 PID: 3440 Comm: i915_module_loa Tainted: G     U
            6.14.0-rc1-CI_DRM_16076-g7a632b6798b6+ #1
...
<4> [525.831334] RIP: 0010:intel_power_domains_disable+0xc2/0xd0 [i915]
...
<4> [525.831483] Call Trace:
<4> [525.831484]  <TASK>
...
<4> [525.831943]  i915_driver_remove+0x4b/0x140 [i915]
<4> [525.832028]  i915_pci_remove+0x1e/0x40 [i915]
<4> [525.832099]  pci_device_remove+0x3e/0xb0
<4> [525.832103]  device_remove+0x40/0x80
<4> [525.832107]  device_release_driver_internal+0x215/0x280
...
<4> [525.947666] ------------[ cut here ]------------
<4> [525.947669] kobject: '(null)' (ffff88814f62a218): is not initialized, yet kobject_put() is being called.
<4> [525.947707] WARNING: CPU: 6 PID: 3440 at lib/kobject.c:734 kobject_put+0xe4/0x200
...
<4> [525.947875] RIP: 0010:kobject_put+0xe4/0x200
...
<4> [525.947909] Call Trace:
<4> [525.947911]  <TASK>
...
<4> [525.947963]  intel_gt_sysfs_unregister+0x25/0x40 [i915]
<4> [525.948133]  intel_gt_driver_unregister+0x14/0x80 [i915]
<4> [525.948291]  i915_driver_remove+0x6c/0x140 [i915]
<4> [525.948411]  i915_pci_remove+0x1e/0x40 [i915]
...
<4> [526.441186] ------------[ cut here ]------------
<4> [526.441191] kernfs: can not remove 'error', no directory
<4> [526.441211] WARNING: CPU: 1 PID: 3440 at fs/kernfs/dir.c:1684 kernfs_remove_by_name_ns+0xbc/0xc0
...
<4> [526.441536] RIP: 0010:kernfs_remove_by_name_ns+0xbc/0xc0
...
<4> [526.441578] Call Trace:
<4> [526.441581]  <TASK>
...
<4> [526.441686]  sysfs_remove_bin_file+0x17/0x30
<4> [526.441691]  i915_gpu_error_sysfs_teardown+0x1d/0x30 [i915]
<4> [526.442226]  i915_teardown_sysfs+0x1c/0x60 [i915]
<4> [526.442369]  i915_driver_remove+0x9d/0x140 [i915]
<4> [526.442473]  i915_pci_remove+0x1e/0x40 [i915]
...
<4> [526.685700] ------------[ cut here ]------------
<4> [526.685706] i915 0000:00:02.0: [drm] i915 raw-wakerefs=1 wakelocks=1 on cle
anup
<4> [526.685734] WARNING: CPU: 1 PID: 3440 at drivers/gpu/drm/i915/intel_runtime
_pm.c:443 intel_runtime_pm_driver_release+0x75/0x90 [i915]
...
<4> [526.686090] RIP: 0010:intel_runtime_pm_driver_release+0x75/0x90 [i915]
...
<4> [526.686294] Call Trace:
<4> [526.686296]  <TASK>
...
<4> [526.687025]  i915_driver_release+0x7e/0xb0 [i915]
<4> [526.687243]  drm_dev_put.part.0+0x47/0x90
<4> [526.687250]  devm_drm_dev_init_release+0x13/0x30
<4> [526.687255]  devm_action_release+0x12/0x30
<4> [526.687261]  release_nodes+0x3a/0x120
<4> [526.687268]  devres_release_all+0x97/0xe0
<4> [526.687277]  device_unbind_cleanup+0x12/0x80
<4> [526.687282]  device_release_driver_internal+0x23a/0x280
...

A call to intel_power_domains_disable() was already there.  It triggers
the drm_WARN_ON() when it finds a reference to a wakeref taken on device
probe and not released after device register failure.  That wakeref is
then left held forever once its handle gets lost overwritten with another
wakeref, hence the WARN() called from intel_runtime_pm_driver_release().

The WARN() triggered by kernfs_remove_by_name_ns() from
i915_teardown_sysfs()->i915_gpu_error_sysfs_teardown(), formerly
i915_teardown_error_capture(), was also there when the return was added.

A call to intel_gt_sysfs_unregister() that triggers the WARN() from
kobject_put() was added to intel_gt_driver_unregister() with commit
69d6bf5c3754ff ("drm/i915/gt: Fix memory leaks in per-gt sysfs").

Fix the asymmetry by failing the driver probe on device registration
failure and going through rewind paths.

For that to work as expected, we apparently need to start the rewind path
of i915_driver_register() with drm_dev_unregister(), even if
drm_dev_register() returned an error.

Also, in rewind path of the i915_driver_probe() we need to clean up PXP
initialization before it's safe to call other hardware cleanup routines.
The intel_pxp_init() without a corresponding cleanup was added to
i915_driver_probe() with commit f67986b0119c04 ("drm/i915/pxp: Promote pxp
subsystem to top-level of i915").

v4: Switch to taking an error rewind path on device registration failure
    (Krzysztof, Lucas).
v3: Based on Andi's commitment on introducing a flag, try to address
    Jani's "must find another way" by finding a better place and name for
    the flag (in hope that's what Jani had on mind),
  - split into a series of patches and limit the scope of the first (this)
    one to a minimum of omitting conditionally only those unregister
    (sub)steps that trigger kernel warnings when not registered.
v2: Check in _unregister whether the drm_dev_register has succeeded and
    skip some of the _unregister() steps. (Andi)

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ce3cc93ea211b..dcf723da8d409 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -622,11 +622,11 @@ static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
  * Perform any steps necessary to make the driver available via kernel
  * internal or userspace interfaces.
  */
-static void i915_driver_register(struct drm_i915_private *dev_priv)
+static int i915_driver_register(struct drm_i915_private *dev_priv)
 {
 	struct intel_display *display = &dev_priv->display;
 	struct intel_gt *gt;
-	unsigned int i;
+	unsigned int i, ret;
 
 	i915_gem_driver_register(dev_priv);
 	i915_pmu_register(dev_priv);
@@ -634,10 +634,12 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	intel_vgpu_register(dev_priv);
 
 	/* Reveal our presence to userspace */
-	if (drm_dev_register(&dev_priv->drm, 0)) {
-		drm_err(&dev_priv->drm,
-			"Failed to register driver for userspace access!\n");
-		return;
+	ret = drm_dev_register(&dev_priv->drm, 0);
+	if (ret) {
+		drm_dev_unregister(&dev_priv->drm);
+		i915_pmu_unregister(dev_priv);
+		i915_gem_driver_unregister(dev_priv);
+		return ret;
 	}
 
 	i915_debugfs_register(dev_priv);
@@ -660,6 +662,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 
 	if (i915_switcheroo_register(dev_priv))
 		drm_err(&dev_priv->drm, "Failed to register vga switcheroo!\n");
+
+	return 0;
 }
 
 /**
@@ -834,7 +838,9 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto out_cleanup_gem;
 
-	i915_driver_register(i915);
+	ret = i915_driver_register(i915);
+	if (ret)
+		goto out_cleanup_pxp;
 
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
 
@@ -844,6 +850,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	return 0;
 
+out_cleanup_pxp:
+	intel_pxp_fini(i915);
 out_cleanup_gem:
 	i915_gem_suspend(i915);
 	i915_gem_driver_remove(i915);
-- 
2.48.1

