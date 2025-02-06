Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83470A2AFE2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBED10E3AA;
	Thu,  6 Feb 2025 18:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kp5AFh7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A39D10E3AA;
 Thu,  6 Feb 2025 18:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738865407; x=1770401407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=53ifa0HyDdLJAwEUhx5Dp3FgqypHMMW76JaTcV0fVOI=;
 b=Kp5AFh7MtVMCVFOjbk43Q+CRrxz47tL4AhHhXTrxi/ClI/tjKSRXoeHQ
 nZwwZGJxib3MSyNi7uoE4eMI4hmqDGYLf2y7IAy2POCsXt3cSTD/2dZeY
 eKcZVdFRhZDGMsXgdfh7g0bX1oAFe81emCaKjsdmNOu8BlM3+ye+WWBnX
 rpUUNueL3USxJc8lXAQdw7dYSY6zfKobmDgUy6gGJV9bP4taLAUfUUk6Q
 Dovj/RjHxUXGBoYKJEE8eZhS61jtctfWi2pHX0A18n602tamUfNCss2Fo
 +XZDHnMPYs76Fj7oRAgtuDOslX46R7pIZTWOEVC+C7PdhMQuXGF8Uu5IO Q==;
X-CSE-ConnectionGUID: 5tU/xx22RxOsBw4bCKfn4w==
X-CSE-MsgGUID: d2d2qdiQSl+ti2PHijq3DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61965289"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="61965289"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:10:07 -0800
X-CSE-ConnectionGUID: bUdXySVnQkazzH1SeC/aUQ==
X-CSE-MsgGUID: q9JUQi5HTgmSbdnPldPcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111889308"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.55])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:10:04 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 1/3] drm/i915: Fix PM reference not released if device
 register fails
Date: Thu,  6 Feb 2025 19:07:39 +0100
Message-ID: <20250206180927.2237256-6-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
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

We return immediately from i915_driver_register() if drm_dev_register()
fails, skipping remaining registration steps.  However, the _unregister()
counterpart called at device remove knows nothing about that skip and
executes reverts for all those steps.  For that to work correctly, those
revert functions must be resistant to being called even on uninitialized
objects, or we must not skip their initialization.

In case of intel_power_domains_enable() being skipped, then a reference to
runtime PM dedicated to power domains not put, its _disable() counterpart,
which expects that dedicated PM reference not held, emits a warning that
taints the kernel:

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

It seems safe to enable runtime management of power domains (and put the
dedicated PM reference) even if a device registration step fails.  Go for
it.  Move calls to intel_power_domains_disable/enable() one level up, out
of i915_driver_register/unregister() where they hardly seem to belong.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 91a7748f44926..91191125fa8e6 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -654,7 +654,6 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 
 	intel_display_driver_register(display);
 
-	intel_power_domains_enable(display);
 	intel_runtime_pm_enable(&dev_priv->runtime_pm);
 
 	intel_register_dsm_handler();
@@ -678,7 +677,6 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 	intel_unregister_dsm_handler();
 
 	intel_runtime_pm_disable(&dev_priv->runtime_pm);
-	intel_power_domains_disable(display);
 
 	intel_display_driver_unregister(display);
 
@@ -839,6 +837,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915_driver_register(i915);
 
+	intel_power_domains_enable(display);
+
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
 
 	i915_welcome_messages(i915);
@@ -885,6 +885,8 @@ void i915_driver_remove(struct drm_i915_private *i915)
 
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
+	intel_power_domains_disable(display);
+
 	i915_driver_unregister(i915);
 
 	/* Flush any external code that still may be under the RCU lock */
-- 
2.47.1

