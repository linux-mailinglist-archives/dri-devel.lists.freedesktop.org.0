Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFCA61D3E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 21:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA6A10E276;
	Fri, 14 Mar 2025 20:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvw8eYDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ED910E1D3;
 Fri, 14 Mar 2025 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741985552; x=1773521552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZApZh87iKGQtM3T1w/UBXcON7GcnmKASzhkfuj2XpIs=;
 b=nvw8eYDJ6dkcNVniBNKStQ9W3CsY6FrvQOImEvqFFQdmxjhdoF72JVX3
 fFQ/5kxbxDBqiPeAbwwt1Bz0hoDQaX9imfgqKuUGicXbe7/uabu80JuqK
 MygQ06UVFUONQRZfSEkWlpYnJyv7ETLcBinojwJGbBO7bGM2/4MJ5NSfE
 cKv0AAMB/n5Wea6x8PIwLpfzFxpUAhRKLD8DmfarJBFDQN/OyZDzGGVjY
 zSL0/MF1vZDU5pccap9Zgy5B8/N0q6R8U/8NTQQGkjwiZXxXTePTq/smu
 kZavTFrkSNtXN2b2nJW+6fBwCiNmyS3UQuctNwfJmKzB89tZYFas27gKo w==;
X-CSE-ConnectionGUID: 2NA0/SDbQhWu/3sO7isRpg==
X-CSE-MsgGUID: cxFNT2b7TaSr2GKt6l4rww==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43284812"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43284812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 13:52:32 -0700
X-CSE-ConnectionGUID: qu55u+TJRMWxpWmBEGKq+Q==
X-CSE-MsgGUID: Ft4etAQuQ3iQLckMmPmDnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121578458"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.206])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 13:52:29 -0700
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
Subject: [PATCH v5 3/3] drm/i915: Fix harmful driver register/unregister
 asymmetry
Date: Fri, 14 Mar 2025 21:38:35 +0100
Message-ID: <20250314205202.809563-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
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
skip and executes reverts of all those steps.  As a consequence, a number
of kernel warnings that taint the kernel are triggered:

<3> [525.823143] i915 0000:00:02.0: [drm] *ERROR* Failed to register driver for userspace access!
...
<4> [525.831069] ------------[ cut here ]------------
<4> [525.831071] i915 0000:00:02.0: [drm] drm_WARN_ON(power_domains->init_wakeref)
<4> [525.831095] WARNING: CPU: 6 PID: 3440 at drivers/gpu/drm/i915/display/intel_display_power.c:2074 intel_power_domains_disable+0xc2/0xd0 [i915]
...
<4> [525.831328] CPU: 6 UID: 0 PID: 3440 Comm: i915_module_loa Tainted: G     U             6.14.0-rc1-CI_DRM_16076-g7a632b6798b6+ #1
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

Moreover, that unexpected PM reference is left untouched (not released)
but overwritten, then that triggers another kernel warning at driver
release phase:

<4> [526.685700] ------------[ cut here ]------------
<4> [526.685706] i915 0000:00:02.0: [drm] i915 raw-wakerefs=1 wakelocks=1 on cleanup
<4> [526.685734] WARNING: CPU: 1 PID: 3440 at drivers/gpu/drm/i915/intel_runtime_pm.c:443 intel_runtime_pm_driver_release+0x75/0x90 [i915]
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
probe and not released after device registration failure.  That wakeref is
then left held forever once its handle gets lost overwritten with another
wakeref, hence another WARN() is called from
intel_runtime_pm_driver_release().

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

v5: Drop unsigned keyword from ret variable declaration (Krzysztof),
  - keep the "Failed to register driver for userspace access" error
    message (Krzysztof),
  - split PXP cleanup addition to rewind path out to a separate patch.
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
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 10d1d4f3c11c4..cba56cf73b96e 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -622,11 +622,12 @@ static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
  * Perform any steps necessary to make the driver available via kernel
  * internal or userspace interfaces.
  */
-static void i915_driver_register(struct drm_i915_private *dev_priv)
+static int i915_driver_register(struct drm_i915_private *dev_priv)
 {
 	struct intel_display *display = &dev_priv->display;
 	struct intel_gt *gt;
 	unsigned int i;
+	int ret;
 
 	i915_gem_driver_register(dev_priv);
 	i915_pmu_register(dev_priv);
@@ -634,10 +635,14 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	intel_vgpu_register(dev_priv);
 
 	/* Reveal our presence to userspace */
-	if (drm_dev_register(&dev_priv->drm, 0)) {
+	ret = drm_dev_register(&dev_priv->drm, 0);
+	if (ret) {
 		i915_probe_error(dev_priv,
 				 "Failed to register driver for userspace access!\n");
-		return;
+		drm_dev_unregister(&dev_priv->drm);
+		i915_pmu_unregister(dev_priv);
+		i915_gem_driver_unregister(dev_priv);
+		return ret;
 	}
 
 	i915_debugfs_register(dev_priv);
@@ -660,6 +665,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 
 	if (i915_switcheroo_register(dev_priv))
 		drm_err(&dev_priv->drm, "Failed to register vga switcheroo!\n");
+
+	return 0;
 }
 
 /**
@@ -834,7 +841,9 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto out_cleanup_gem;
 
-	i915_driver_register(i915);
+	ret = i915_driver_register(i915);
+	if (ret)
+		goto out_cleanup_gem;
 
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
 
-- 
2.48.1

