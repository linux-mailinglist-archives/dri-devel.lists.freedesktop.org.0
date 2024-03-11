Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155A3877B83
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 09:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1282410F485;
	Mon, 11 Mar 2024 08:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7tOLlB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD3410E03D;
 Mon, 11 Mar 2024 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710144456; x=1741680456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I7u9annVMHjI9g9xtP+CG+L80OiPWZVm/RFQY+6KBQE=;
 b=i7tOLlB9Bk/LN5g1IH7LrZU2s75CyV50sExqbs9p+dy4PnBE/rdc2hHI
 cLHun+/hEb2/vH6pOXbIhIbLgUksmmsD5V4GpMz3sk/cz+WPB9OZkUQPV
 4fYe1aIAT5FW1pPhOSc6zyzFrqJDgrbyxdGQzqfCgO7KzYsk+pENQ54ko
 EmRLSVW1GCGGuzOboNaQOTloSxgjuEh0KTXlnqs2fnlmSY043EMBc64Zd
 AaqBMCDMvzhnjiMuPK9V/k2KmK/CyRO9G4RLxxJZIyfgnjXnQM8E1kqHL
 5bFbb8bPF5VQqMHy53EqQbAkYNWjSuuT2LPHzsDN7ZEdTmWvKpCnkoEVt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4716568"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4716568"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 01:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15582890"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.25.93])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 01:07:31 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Dale B Stimson <dale.b.stimson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/i915/hwmon: Fix locking inversion in sysfs getter
Date: Mon, 11 Mar 2024 09:06:46 +0100
Message-ID: <20240311080717.421152-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

In i915 hwmon sysfs getter path we now take a hwmon_lock, then acquire an
rpm wakeref.  That results in lock inversion:

<4> [197.079335] ======================================================
<4> [197.085473] WARNING: possible circular locking dependency detected
<4> [197.091611] 6.8.0-rc7-Patchwork_129026v7-gc4dc92fb1152+ #1 Not tainted
<4> [197.098096] ------------------------------------------------------
<4> [197.104231] prometheus-node/839 is trying to acquire lock:
<4> [197.109680] ffffffff82764d80 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc+0x9a/0x350
<4> [197.116939]
but task is already holding lock:
<4> [197.122730] ffff88811b772a40 (&hwmon->hwmon_lock){+.+.}-{3:3}, at: hwm_energy+0x4b/0x100 [i915]
<4> [197.131543]
which lock already depends on the new lock.
...
<4> [197.507922] Chain exists of:
  fs_reclaim --> &gt->reset.mutex --> &hwmon->hwmon_lock
<4> [197.518528]  Possible unsafe locking scenario:
<4> [197.524411]        CPU0                    CPU1
<4> [197.528916]        ----                    ----
<4> [197.533418]   lock(&hwmon->hwmon_lock);
<4> [197.537237]                                lock(&gt->reset.mutex);
<4> [197.543376]                                lock(&hwmon->hwmon_lock);
<4> [197.549682]   lock(fs_reclaim);
...
<4> [197.632548] Call Trace:
<4> [197.634990]  <TASK>
<4> [197.637088]  dump_stack_lvl+0x64/0xb0
<4> [197.640738]  check_noncircular+0x15e/0x180
<4> [197.652968]  check_prev_add+0xe9/0xce0
<4> [197.656705]  __lock_acquire+0x179f/0x2300
<4> [197.660694]  lock_acquire+0xd8/0x2d0
<4> [197.673009]  fs_reclaim_acquire+0xa1/0xd0
<4> [197.680478]  __kmalloc+0x9a/0x350
<4> [197.689063]  acpi_ns_internalize_name.part.0+0x4a/0xb0
<4> [197.694170]  acpi_ns_get_node_unlocked+0x60/0xf0
<4> [197.720608]  acpi_ns_get_node+0x3b/0x60
<4> [197.724428]  acpi_get_handle+0x57/0xb0
<4> [197.728164]  acpi_has_method+0x20/0x50
<4> [197.731896]  acpi_pci_set_power_state+0x43/0x120
<4> [197.736485]  pci_power_up+0x24/0x1c0
<4> [197.740047]  pci_pm_default_resume_early+0x9/0x30
<4> [197.744725]  pci_pm_runtime_resume+0x2d/0x90
<4> [197.753911]  __rpm_callback+0x3c/0x110
<4> [197.762586]  rpm_callback+0x58/0x70
<4> [197.766064]  rpm_resume+0x51e/0x730
<4> [197.769542]  rpm_resume+0x267/0x730
<4> [197.773020]  rpm_resume+0x267/0x730
<4> [197.776498]  rpm_resume+0x267/0x730
<4> [197.779974]  __pm_runtime_resume+0x49/0x90
<4> [197.784055]  __intel_runtime_pm_get+0x19/0xa0 [i915]
<4> [197.789070]  hwm_energy+0x55/0x100 [i915]
<4> [197.793183]  hwm_read+0x9a/0x310 [i915]
<4> [197.797124]  hwmon_attr_show+0x36/0x120
<4> [197.800946]  dev_attr_show+0x15/0x60
<4> [197.804509]  sysfs_kf_seq_show+0xb5/0x100

However, the lock is only intended to protect either a hwmon overflow
counter or rmw hardware operations.  There is no need to hold the lock,
only the wakeref, while reading from hardware.

Acquire the lock after hardware read under rpm wakeref.

Fixes: c41b8bdcc297 ("drm/i915/hwmon: Show device level energy usage")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/i915/i915_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 8c3f443c8347e..faf7670de6e06 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -136,11 +136,11 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
 	else
 		rgaddr = hwmon->rg.energy_status_all;
 
-	mutex_lock(&hwmon->hwmon_lock);
-
 	with_intel_runtime_pm(uncore->rpm, wakeref)
 		reg_val = intel_uncore_read(uncore, rgaddr);
 
+	mutex_lock(&hwmon->hwmon_lock);
+
 	if (reg_val >= ei->reg_val_prev)
 		ei->accum_energy += reg_val - ei->reg_val_prev;
 	else
-- 
2.43.0

