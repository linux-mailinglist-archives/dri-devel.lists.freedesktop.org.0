Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F56BD9787
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46AF10E604;
	Tue, 14 Oct 2025 12:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpGkuh4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F7910E603;
 Tue, 14 Oct 2025 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760446530; x=1791982530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nl8bti9up9XBOcPDI2OCvFj8JIemVJo96FQH8gC9tmk=;
 b=HpGkuh4MXtV4QwZtl2jiLp2zAA3s4WqtMG17lFbdnm9BxS/lC1qTpjIW
 +MMllvdNF4GPKmWCg0/f6h9PfkF5BINp9XfCesFuRiPFlrHfC+aha2l3+
 04XRGeLCsLGM3OP4hMiFd6956WZzfMpqx5rfMkywZ6RtXKz5diE8MbJQ5
 fSNtSUzl5VqAyBHv5fUwB0j4Na3dGFg3dkWyBDb0F56esgckLTXJa+qfD
 nReeQld8lsnxHqsxeygyOxgnYa8tU2JpG7fAPWniIgUmudlfVZYF8K5Rp
 lHsKJMRnWQtE6yJfHB2od9239bPWppcyxIJmNR9HBzAaYV4WZ2ykFR1ho w==;
X-CSE-ConnectionGUID: 6KxamqrUQa+L1c2O+e2Png==
X-CSE-MsgGUID: MhL8q6FzRce4sT5op0Vx0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61813311"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="61813311"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 05:55:30 -0700
X-CSE-ConnectionGUID: JxeV1nq2S0Wye6+sJ20BPg==
X-CSE-MsgGUID: G3jjimh8Q0Ofiu/uo+D7FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181096673"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.230])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 05:55:27 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v2 1/3] drm/i915: Avoid lock inversion when pinning to GGTT
Date: Tue, 14 Oct 2025 14:47:36 +0200
Message-ID: <20251014125504.14804-6-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
References: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
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

On completion of i915_vma_pin_ww(), a synchronous variant of
dma_fence_work_commit() is called.  When pinning a VMA to GGTT address
space on a Cherry View family processor, or on a Broxton generation SoC
with VTD enabled, i.e., when stop_machine() is then called from
intel_ggtt_bind_vma(), that can potentially lead to lock inversion among
reservation_ww and cpu_hotplug locks.

[86.861179] ======================================================
[86.861193] WARNING: possible circular locking dependency detected
[86.861209] 6.15.0-rc5-CI_DRM_16515-gca0305cadc2d+ #1 Tainted: G     U
[86.861226] ------------------------------------------------------
[86.861238] i915_module_loa/1432 is trying to acquire lock:
[86.861252] ffffffff83489090 (cpu_hotplug_lock){++++}-{0:0}, at: stop_machine+0x1c/0x50
[86.861290]
but task is already holding lock:
[86.861303] ffffc90002e0b4c8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_vma_pin.constprop.0+0x39/0x1d0 [i915]
[86.862233]
which lock already depends on the new lock.
[86.862251]
the existing dependency chain (in reverse order) is:
[86.862265]
-> #5 (reservation_ww_class_mutex){+.+.}-{3:3}:
[86.862292]        dma_resv_lockdep+0x19a/0x390
[86.862315]        do_one_initcall+0x60/0x3f0
[86.862334]        kernel_init_freeable+0x3cd/0x680
[86.862353]        kernel_init+0x1b/0x200
[86.862369]        ret_from_fork+0x47/0x70
[86.862383]        ret_from_fork_asm+0x1a/0x30
[86.862399]
-> #4 (reservation_ww_class_acquire){+.+.}-{0:0}:
[86.862425]        dma_resv_lockdep+0x178/0x390
[86.862440]        do_one_initcall+0x60/0x3f0
[86.862454]        kernel_init_freeable+0x3cd/0x680
[86.862470]        kernel_init+0x1b/0x200
[86.862482]        ret_from_fork+0x47/0x70
[86.862495]        ret_from_fork_asm+0x1a/0x30
[86.862509]
-> #3 (&mm->mmap_lock){++++}-{3:3}:
[86.862531]        down_read_killable+0x46/0x1e0
[86.862546]        lock_mm_and_find_vma+0xa2/0x280
[86.862561]        do_user_addr_fault+0x266/0x8e0
[86.862578]        exc_page_fault+0x8a/0x2f0
[86.862593]        asm_exc_page_fault+0x27/0x30
[86.862607]        filldir64+0xeb/0x180
[86.862620]        kernfs_fop_readdir+0x118/0x480
[86.862635]        iterate_dir+0xcf/0x2b0
[86.862648]        __x64_sys_getdents64+0x84/0x140
[86.862661]        x64_sys_call+0x1058/0x2660
[86.862675]        do_syscall_64+0x91/0xe90
[86.862689]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[86.862703]
-> #2 (&root->kernfs_rwsem){++++}-{3:3}:
[86.862725]        down_write+0x3e/0xf0
[86.862738]        kernfs_add_one+0x30/0x3c0
[86.862751]        kernfs_create_dir_ns+0x53/0xb0
[86.862765]        internal_create_group+0x134/0x4c0
[86.862779]        sysfs_create_group+0x13/0x20
[86.862792]        topology_add_dev+0x1d/0x30
[86.862806]        cpuhp_invoke_callback+0x4b5/0x850
[86.862822]        cpuhp_issue_call+0xbf/0x1f0
[86.862836]        __cpuhp_setup_state_cpuslocked+0x111/0x320
[86.862852]        __cpuhp_setup_state+0xb0/0x220
[86.862866]        topology_sysfs_init+0x30/0x50
[86.862879]        do_one_initcall+0x60/0x3f0
[86.862893]        kernel_init_freeable+0x3cd/0x680
[86.862908]        kernel_init+0x1b/0x200
[86.862921]        ret_from_fork+0x47/0x70
[86.862934]        ret_from_fork_asm+0x1a/0x30
[86.862947]
-> #1 (cpuhp_state_mutex){+.+.}-{3:3}:
[86.862969]        __mutex_lock+0xaa/0xed0
[86.862982]        mutex_lock_nested+0x1b/0x30
[86.862995]        __cpuhp_setup_state_cpuslocked+0x67/0x320
[86.863012]        __cpuhp_setup_state+0xb0/0x220
[86.863026]        page_alloc_init_cpuhp+0x2d/0x60
[86.863041]        mm_core_init+0x22/0x2d0
[86.863054]        start_kernel+0x576/0xbd0
[86.863068]        x86_64_start_reservations+0x18/0x30
[86.863084]        x86_64_start_kernel+0xbf/0x110
[86.863098]        common_startup_64+0x13e/0x141
[86.863114]
-> #0 (cpu_hotplug_lock){++++}-{0:0}:
[86.863135]        __lock_acquire+0x1635/0x2810
[86.863152]        lock_acquire+0xc4/0x2f0
[86.863166]        cpus_read_lock+0x41/0x100
[86.863180]        stop_machine+0x1c/0x50
[86.863194]        bxt_vtd_ggtt_insert_entries__BKL+0x3b/0x60 [i915]
[86.863987]        intel_ggtt_bind_vma+0x43/0x70 [i915]
[86.864735]        __vma_bind+0x55/0x70 [i915]
[86.865510]        fence_work+0x26/0xa0 [i915]
[86.866248]        fence_notify+0xa1/0x140 [i915]
[86.866983]        __i915_sw_fence_complete+0x8f/0x270 [i915]
[86.867719]        i915_sw_fence_commit+0x39/0x60 [i915]
[86.868453]        i915_vma_pin_ww+0x462/0x1360 [i915]
[86.869228]        i915_vma_pin.constprop.0+0x133/0x1d0 [i915]
[86.870001]        initial_plane_vma+0x307/0x840 [i915]
[86.870774]        intel_initial_plane_config+0x33f/0x670 [i915]
[86.871546]        intel_display_driver_probe_nogem+0x1c6/0x260 [i915]
[86.872330]        i915_driver_probe+0x7fa/0xe80 [i915]
[86.873057]        i915_pci_probe+0xe6/0x220 [i915]
[86.873782]        local_pci_probe+0x47/0xb0
[86.873802]        pci_device_probe+0xf3/0x260
[86.873817]        really_probe+0xf1/0x3c0
[86.873833]        __driver_probe_device+0x8c/0x180
[86.873848]        driver_probe_device+0x24/0xd0
[86.873862]        __driver_attach+0x10f/0x220
[86.873876]        bus_for_each_dev+0x7f/0xe0
[86.873892]        driver_attach+0x1e/0x30
[86.873904]        bus_add_driver+0x151/0x290
[86.873917]        driver_register+0x5e/0x130
[86.873931]        __pci_register_driver+0x7d/0x90
[86.873945]        i915_pci_register_driver+0x23/0x30 [i915]
[86.874678]        i915_init+0x37/0x120 [i915]
[86.875347]        do_one_initcall+0x60/0x3f0
[86.875369]        do_init_module+0x97/0x2a0
[86.875385]        load_module+0x2c54/0x2d80
[86.875398]        init_module_from_file+0x96/0xe0
[86.875413]        idempotent_init_module+0x117/0x330
[86.875426]        __x64_sys_finit_module+0x77/0x100
[86.875440]        x64_sys_call+0x24de/0x2660
[86.875454]        do_syscall_64+0x91/0xe90
[86.875470]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[86.875486]
other info that might help us debug this:
[86.875502] Chain exists of:
  cpu_hotplug_lock --> reservation_ww_class_acquire --> reservation_ww_class_mutex
[86.875539]  Possible unsafe locking scenario:
[86.875552]        CPU0                    CPU1
[86.875563]        ----                    ----
[86.875573]   lock(reservation_ww_class_mutex);
[86.875588]                                lock(reservation_ww_class_acquire);
[86.875606]                                lock(reservation_ww_class_mutex);
[86.875624]   rlock(cpu_hotplug_lock);
[86.875637]
 *** DEADLOCK ***
[86.875650] 3 locks held by i915_module_loa/1432:
[86.875663]  #0: ffff888101f5c1b0 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x104/0x220
[86.875699]  #1: ffffc90002e0b4a0 (reservation_ww_class_acquire){+.+.}-{0:0}, at: i915_vma_pin.constprop.0+0x39/0x1d0 [i915]
[86.876512]  #2: ffffc90002e0b4c8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_vma_pin.constprop.0+0x39/0x1d0 [i915]
[86.877305]
stack backtrace:
[86.877326] CPU: 0 UID: 0 PID: 1432 Comm: i915_module_loa Tainted: G     U              6.15.0-rc5-CI_DRM_16515-gca0305cadc2d+ #1 PREEMPT(voluntary)
[86.877334] Tainted: [U]=USER
[86.877336] Hardware name:  /NUC5CPYB, BIOS PYBSWCEL.86A.0079.2020.0420.1316 04/20/2020
[86.877339] Call Trace:
[86.877344]  <TASK>
[86.877353]  dump_stack_lvl+0x91/0xf0
[86.877364]  dump_stack+0x10/0x20
[86.877369]  print_circular_bug+0x285/0x360
[86.877379]  check_noncircular+0x135/0x150
[86.877390]  __lock_acquire+0x1635/0x2810
[86.877403]  lock_acquire+0xc4/0x2f0
[86.877408]  ? stop_machine+0x1c/0x50
[86.877422]  ? __pfx_bxt_vtd_ggtt_insert_entries__cb+0x10/0x10 [i915]
[86.878173]  cpus_read_lock+0x41/0x100
[86.878182]  ? stop_machine+0x1c/0x50
[86.878191]  ? __pfx_bxt_vtd_ggtt_insert_entries__cb+0x10/0x10 [i915]
[86.878916]  stop_machine+0x1c/0x50
[86.878927]  bxt_vtd_ggtt_insert_entries__BKL+0x3b/0x60 [i915]
[86.879652]  intel_ggtt_bind_vma+0x43/0x70 [i915]
[86.880375]  __vma_bind+0x55/0x70 [i915]
[86.881133]  fence_work+0x26/0xa0 [i915]
[86.881851]  fence_notify+0xa1/0x140 [i915]
[86.882566]  __i915_sw_fence_complete+0x8f/0x270 [i915]
[86.883286]  i915_sw_fence_commit+0x39/0x60 [i915]
[86.884003]  i915_vma_pin_ww+0x462/0x1360 [i915]
[86.884756]  ? i915_vma_pin.constprop.0+0x6c/0x1d0 [i915]
[86.885513]  i915_vma_pin.constprop.0+0x133/0x1d0 [i915]
[86.886281]  initial_plane_vma+0x307/0x840 [i915]
[86.887049]  intel_initial_plane_config+0x33f/0x670 [i915]
[86.887819]  intel_display_driver_probe_nogem+0x1c6/0x260 [i915]
[86.888587]  i915_driver_probe+0x7fa/0xe80 [i915]
[86.889293]  ? mutex_unlock+0x12/0x20
[86.889301]  ? drm_privacy_screen_get+0x171/0x190
[86.889308]  ? acpi_dev_found+0x66/0x80
[86.889321]  i915_pci_probe+0xe6/0x220 [i915]
[86.890038]  local_pci_probe+0x47/0xb0
[86.890049]  pci_device_probe+0xf3/0x260
[86.890058]  really_probe+0xf1/0x3c0
[86.890067]  __driver_probe_device+0x8c/0x180
[86.890072]  driver_probe_device+0x24/0xd0
[86.890078]  __driver_attach+0x10f/0x220
[86.890083]  ? __pfx___driver_attach+0x10/0x10
[86.890088]  bus_for_each_dev+0x7f/0xe0
[86.890097]  driver_attach+0x1e/0x30
[86.890101]  bus_add_driver+0x151/0x290
[86.890107]  driver_register+0x5e/0x130
[86.890113]  __pci_register_driver+0x7d/0x90
[86.890119]  i915_pci_register_driver+0x23/0x30 [i915]
[86.890833]  i915_init+0x37/0x120 [i915]
[86.891482]  ? __pfx_i915_init+0x10/0x10 [i915]
[86.892135]  do_one_initcall+0x60/0x3f0
[86.892145]  ? __kmalloc_cache_noprof+0x33f/0x470
[86.892157]  do_init_module+0x97/0x2a0
[86.892164]  load_module+0x2c54/0x2d80
[86.892168]  ? __kernel_read+0x15c/0x300
[86.892185]  ? kernel_read_file+0x2b1/0x320
[86.892195]  init_module_from_file+0x96/0xe0
[86.892199]  ? init_module_from_file+0x96/0xe0
[86.892211]  idempotent_init_module+0x117/0x330
[86.892224]  __x64_sys_finit_module+0x77/0x100
[86.892230]  x64_sys_call+0x24de/0x2660
[86.892236]  do_syscall_64+0x91/0xe90
[86.892243]  ? irqentry_exit+0x77/0xb0
[86.892249]  ? sysvec_apic_timer_interrupt+0x57/0xc0
[86.892256]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[86.892261] RIP: 0033:0x7303e1b2725d
[86.892271] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8b bb 0d 00 f7 d8 64 89 01 48
[86.892276] RSP: 002b:00007ffddd1fdb38 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[86.892281] RAX: ffffffffffffffda RBX: 00005d771d88fd90 RCX: 00007303e1b2725d
[86.892285] RDX: 0000000000000000 RSI: 00005d771d893aa0 RDI: 000000000000000c
[86.892287] RBP: 00007ffddd1fdbf0 R08: 0000000000000040 R09: 00007ffddd1fdb80
[86.892289] R10: 00007303e1c03b20 R11: 0000000000000246 R12: 00005d771d893aa0
[86.892292] R13: 0000000000000000 R14: 00005d771d88f0d0 R15: 00005d771d895710
[86.892304]  </TASK>

Call asynchronous variant of dma_fence_work_commit() in that case.

Fixes: 7d1c2618eac59 ("drm/i915: Take reservation lock around i915_vma_pin.")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14985
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 25e97031d76e4..20deb01c0e5fe 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1595,8 +1595,14 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 err_vma_res:
 	i915_vma_resource_free(vma_res);
 err_fence:
-	if (work)
-		dma_fence_work_commit_imm(&work->base);
+	if (work) {
+		/* don't risk lockdep splat against stop_machine() */
+		if (i915_vma_is_ggtt(vma) &&
+		    intel_vm_no_concurrent_access_wa(vma->vm->i915))
+			dma_fence_work_commit(&work->base);
+		else
+			dma_fence_work_commit_imm(&work->base);
+	}
 err_rpm:
 	intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
 
-- 
2.51.0

