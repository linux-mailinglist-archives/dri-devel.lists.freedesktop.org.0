Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5546BA4684
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 17:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEB210EA88;
	Fri, 26 Sep 2025 15:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFxPq/JS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD6510EA88
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758900415; x=1790436415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DZLjejbVyj6O2lAYBRuAG7go30kjw9LM7LEDGPnP3AI=;
 b=RFxPq/JSkD5LZeOeOBm4OlKfI+v7U6vPUlV/aqEQv0ZJ736R1wfi7dVn
 uO7GUp5obsyM4msZzOu11ppxh+My9gSXvAxRpF8t7qbW4482+3fSG+8yy
 oguEP2yPEqmQAUKgAO/0n7Io/4OTvr9Ge4e0BC6ddzntfKp00rNu6eKCj
 5xmpyVpBc98wikgaDBJl9qG0mON4MYT1mQZZf0/9qnN17CFJ+wABlWgQc
 ZYVf/hpNd5v0PrTUdP0E6hieNndxL906uTr/cu3aKBLqVfC4aNnHxdM67
 J8QmWIFWHqL2WYlwi/bu1o7T1X/2ZNzCJCd9tOX0j9eDI6rQFY8kZBFMo w==;
X-CSE-ConnectionGUID: DfGj3E+lRYS3LDwvvK8yaQ==
X-CSE-MsgGUID: zvyTxLTjQxC4WIS9g7mYKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="71482762"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="71482762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:26:55 -0700
X-CSE-ConnectionGUID: U+n2SbwzSZOCv7OBAArKIA==
X-CSE-MsgGUID: JEGkg85qQ62GxNrwkJakYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177232699"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.244.246])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:26:52 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] drm/vgem-fence: Fix potential deadlock on release
Date: Fri, 26 Sep 2025 17:26:27 +0200
Message-ID: <20250926152628.2165080-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

A timer that expires a vgem fence automatically in 10 seconds is now
released with timer_delete_sync() from fence->ops.release() called on last
dma_fence_put().  In some scenarios, it can run in IRQ context, which is
not safe unless TIMER_IRQSAFE is used.  One potentially risky scenario was
demonstrated in Intel DRM CI trybot, BAT run on machine bat-adlp-6, while
working on new IGT subtests syncobj_timeline@stress-* as user space
replacements of some problematic test cases of a dma-fence-chain selftest
[1].

[117.004338] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[117.004340] WARNING: inconsistent lock state
[117.004342] 6.17.0-rc7-CI_DRM_17270-g7644974e648c+ #1 Tainted: G S   U
[117.004346] --------------------------------
[117.004347] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
[117.004349] swapper/0/0 [HC1[1]:SC1[1]:HE0:SE0] takes:
[117.004352] ffff888138f86aa8 ((&fence->timer)){?.-.}-{0:0}, at: __timer_de=
lete_sync+0x4b/0x190
[117.004361] {HARDIRQ-ON-W} state was registered at:
[117.004363]   lock_acquire+0xc4/0x2e0
[117.004366]   call_timer_fn+0x80/0x2a0
[117.004368]   __run_timers+0x231/0x310
[117.004370]   run_timer_softirq+0x76/0xe0
[117.004372]   handle_softirqs+0xd4/0x4d0
[117.004375]   __irq_exit_rcu+0x13f/0x160
[117.004377]   irq_exit_rcu+0xe/0x20
[117.004379]   sysvec_apic_timer_interrupt+0xa0/0xc0
[117.004382]   asm_sysvec_apic_timer_interrupt+0x1b/0x20
[117.004385]   cpuidle_enter_state+0x12b/0x8a0
[117.004388]   cpuidle_enter+0x2e/0x50
[117.004393]   call_cpuidle+0x22/0x60
[117.004395]   do_idle+0x1fd/0x260
[117.004398]   cpu_startup_entry+0x29/0x30
[117.004401]   start_secondary+0x12d/0x160
[117.004404]   common_startup_64+0x13e/0x141
[117.004407] irq event stamp: 2282669
[117.004409] hardirqs last  enabled at (2282668): [<ffffffff8289db71>] _raw=
_spin_unlock_irqrestore+0x51/0x80
[117.004414] hardirqs last disabled at (2282669): [<ffffffff82882021>] sysv=
ec_irq_work+0x11/0xc0
[117.004419] softirqs last  enabled at (2254702): [<ffffffff8289fd00>] __do=
_softirq+0x10/0x18
[117.004423] softirqs last disabled at (2254725): [<ffffffff813d4ddf>] __ir=
q_exit_rcu+0x13f/0x160
[117.004426]
other info that might help us debug this:
[117.004429]  Possible unsafe locking scenario:
[117.004432]        CPU0
[117.004433]        ----
[117.004434]   lock((&fence->timer));
[117.004436]   <Interrupt>
[117.004438]     lock((&fence->timer));
[117.004440]
 *** DEADLOCK ***
[117.004443] 1 lock held by swapper/0/0:
[117.004445]  #0: ffffc90000003d50 ((&fence->timer)){?.-.}-{0:0}, at: call_=
timer_fn+0x7a/0x2a0
[117.004450]
stack backtrace:
[117.004453] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S   U         =
     6.17.0-rc7-CI_DRM_17270-g7644974e648c+ #1 PREEMPT(voluntary)
[117.004455] Tainted: [S]=3DCPU_OUT_OF_SPEC, [U]=3DUSER
[117.004455] Hardware name: Intel Corporation Alder Lake Client Platform/Al=
derLake-P DDR4 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
[117.004456] Call Trace:
[117.004456]  <IRQ>
[117.004457]  dump_stack_lvl+0x91/0xf0
[117.004460]  dump_stack+0x10/0x20
[117.004461]  print_usage_bug.part.0+0x260/0x360
[117.004463]  mark_lock+0x76e/0x9c0
[117.004465]  ? register_lock_class+0x48/0x4a0
[117.004467]  __lock_acquire+0xbc3/0x2860
[117.004469]  lock_acquire+0xc4/0x2e0
[117.004470]  ? __timer_delete_sync+0x4b/0x190
[117.004472]  ? __timer_delete_sync+0x4b/0x190
[117.004473]  __timer_delete_sync+0x68/0x190
[117.004474]  ? __timer_delete_sync+0x4b/0x190
[117.004475]  timer_delete_sync+0x10/0x20
[117.004476]  vgem_fence_release+0x19/0x30 [vgem]
[117.004478]  dma_fence_release+0xc1/0x3b0
[117.004480]  ? dma_fence_release+0xa1/0x3b0
[117.004481]  dma_fence_chain_release+0xe7/0x130
[117.004483]  dma_fence_release+0xc1/0x3b0
[117.004484]  ? _raw_spin_unlock_irqrestore+0x27/0x80
[117.004485]  dma_fence_chain_irq_work+0x59/0x80
[117.004487]  irq_work_single+0x75/0xa0
[117.004490]  irq_work_run_list+0x33/0x60
[117.004491]  irq_work_run+0x18/0x40
[117.004493]  __sysvec_irq_work+0x35/0x170
[117.004494]  sysvec_irq_work+0x47/0xc0
[117.004496]  asm_sysvec_irq_work+0x1b/0x20
[117.004497] RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
[117.004499] Code: 00 75 1c 65 ff 0d d9 34 68 01 74 20 5b 41 5c 5d 31 c0 31=
 d2 31 c9 31 f6 31 ff c3 cc cc cc cc e8 7f 9d d3 fe fb 0f 1f 44 00 00 <eb> =
d7 0f 1f 44 00 00 5b 41 5c 5d 31 c0 31 d2 31 c9 31 f6 31 ff c3
[117.004499] RSP: 0018:ffffc90000003cf0 EFLAGS: 00000246
[117.004500] RAX: 0000000000000000 RBX: ffff888155e94c40 RCX: 0000000000000=
000
[117.004501] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000=
000
[117.004502] RBP: ffffc90000003d00 R08: 0000000000000000 R09: 0000000000000=
000
[117.004502] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000=
246
[117.004502] R13: 0000000000000001 R14: 0000000000000246 R15: ffff888155e94=
c80
[117.004506]  dma_fence_signal+0x49/0xb0
[117.004507]  ? __pfx_vgem_fence_timeout+0x10/0x10 [vgem]
[117.004508]  vgem_fence_timeout+0x12/0x20 [vgem]
[117.004509]  call_timer_fn+0xa1/0x2a0
[117.004512]  ? __pfx_vgem_fence_timeout+0x10/0x10 [vgem]
[117.004513]  __run_timers+0x231/0x310
[117.004514]  ? tmigr_handle_remote+0x2ac/0x560
[117.004517]  timer_expire_remote+0x46/0x70
[117.004518]  tmigr_handle_remote+0x433/0x560
[117.004520]  ? __run_timers+0x239/0x310
[117.004521]  ? run_timer_softirq+0x21/0xe0
[117.004522]  ? lock_release+0xce/0x2a0
[117.004524]  run_timer_softirq+0xcf/0xe0
[117.004525]  handle_softirqs+0xd4/0x4d0
[117.004526]  __irq_exit_rcu+0x13f/0x160
[117.004527]  irq_exit_rcu+0xe/0x20
[117.004528]  sysvec_apic_timer_interrupt+0xa0/0xc0
[117.004529]  </IRQ>
[117.004529]  <TASK>
[117.004529]  asm_sysvec_apic_timer_interrupt+0x1b/0x20
[117.004530] RIP: 0010:cpuidle_enter_state+0x12b/0x8a0
[117.004532] Code: 48 0f a3 05 97 ce 0e 01 0f 82 2e 03 00 00 31 ff e8 8a 41=
 bd fe 80 7d d0 00 0f 85 11 03 00 00 e8 8b 06 d5 fe fb 0f 1f 44 00 00 <45> =
85 f6 0f 88 67 02 00 00 4d 63 ee 49 83 fd 0a 0f 83 34 06 00 00
[117.004532] RSP: 0018:ffffffff83403d88 EFLAGS: 00000246
[117.004533] RAX: 0000000000000000 RBX: ffff88888f046440 RCX: 0000000000000=
000
[117.004533] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000=
000
[117.004534] RBP: ffffffff83403dd8 R08: 0000000000000000 R09: 0000000000000=
000
[117.004534] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff837cb=
e80
[117.004534] R13: 0000000000000004 R14: 0000000000000004 R15: 0000001ad1df4=
66b
[117.004537]  ? cpuidle_enter_state+0x125/0x8a0
[117.004538]  ? sched_clock_noinstr+0x9/0x10
[117.004540]  cpuidle_enter+0x2e/0x50
[117.004542]  call_cpuidle+0x22/0x60
[117.004542]  do_idle+0x1fd/0x260
[117.004544]  cpu_startup_entry+0x29/0x30
[117.004546]  rest_init+0x104/0x200
[117.004548]  start_kernel+0x93d/0xbd0
[117.004550]  ? load_ucode_intel_bsp+0x2a/0x90
[117.004551]  ? sme_unmap_bootdata+0x14/0x80
[117.004554]  x86_64_start_reservations+0x18/0x30
[117.004555]  x86_64_start_kernel+0xfd/0x150
[117.004556]  ? soft_restart_cpu+0x14/0x14
[117.004558]  common_startup_64+0x13e/0x141
[117.004560]  </TASK>
[117.004565] ------------[ cut here ]------------
[117.004692] WARNING: CPU: 0 PID: 0 at kernel/time/timer.c:1610 __timer_del=
ete_sync+0x126/0x190
[117.004697] Modules linked in: vgem snd_hda_codec_intelhdmi snd_hda_codec_=
hdmi i915 prime_numbers ttm drm_buddy drm_display_helper cec rc_core i2c_al=
go_bit hid_sensor_custom hid_sensor_hub hid_generic intel_ishtp_hid hid int=
el_uncore_frequency intel_uncore_frequency_common x86_pkg_temp_thermal inte=
l_powerclamp cmdlinepart ee1004 r8153_ecm spi_nor coretemp cdc_ether mei_px=
p mei_hdcp usbnet mtd intel_rapl_msr wmi_bmof kvm_intel snd_hda_intel snd_i=
ntel_dspcfg processor_thermal_device_pci kvm snd_hda_codec processor_therma=
l_device irqbypass processor_thermal_wt_hint polyval_clmulni platform_tempe=
rature_control snd_hda_core ghash_clmulni_intel processor_thermal_rfim spi_=
pxa2xx_platform snd_hwdep aesni_intel processor_thermal_rapl dw_dmac snd_pc=
m dw_dmac_core intel_rapl_common r8152 rapl mii intel_cstate spi_pxa2xx_cor=
e i2c_i801 processor_thermal_wt_req snd_timer i2c_mux mei_me intel_ish_ipc =
processor_thermal_power_floor e1000e snd i2c_smbus spi_intel_pci processor_=
thermal_mbox mei soundcore intel_ishtp thunderbolt idma64
[117.004733]  spi_intel int340x_thermal_zone igen6_edac binfmt_misc intel_s=
kl_int3472_tps68470 intel_pmc_core tps68470_regulator video clk_tps68470 pm=
t_telemetry pmt_discovery nls_iso8859_1 pmt_class intel_pmc_ssram_telemetry=
 intel_skl_int3472_discrete int3400_thermal intel_hid intel_skl_int3472_com=
mon acpi_thermal_rel intel_vsec wmi pinctrl_tigerlake acpi_tad sparse_keyma=
p acpi_pad dm_multipath msr nvme_fabrics fuse efi_pstore nfnetlink autofs4
[117.004782] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S   U         =
     6.17.0-rc7-CI_DRM_17270-g7644974e648c+ #1 PREEMPT(voluntary)
[117.004787] Tainted: [S]=3DCPU_OUT_OF_SPEC, [U]=3DUSER
[117.004789] Hardware name: Intel Corporation Alder Lake Client Platform/Al=
derLake-P DDR4 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
[117.004793] RIP: 0010:__timer_delete_sync+0x126/0x190
[117.004795] Code: 31 c0 45 31 c9 c3 cc cc cc cc 48 8b 75 d0 45 84 f6 74 63=
 49 c7 45 18 00 00 00 00 48 89 c7 e8 51 46 39 01 f3 90 e9 66 ff ff ff <0f> =
0b e9 5f ff ff ff e8 ee e4 0c 00 49 8d 5d 28 45 31 c9 31 c9 4c
[117.004801] RSP: 0018:ffffc90000003a40 EFLAGS: 00010046
[117.004804] RAX: ffffffff815093fb RBX: ffff888138f86aa8 RCX: 0000000000000=
000
[117.004807] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000=
000
[117.004809] RBP: ffffc90000003a70 R08: 0000000000000000 R09: 0000000000000=
000
[117.004812] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff81509=
3fb
[117.004814] R13: ffff888138f86a80 R14: 0000000000000000 R15: 0000000000000=
000
[117.004817] FS:  0000000000000000(0000) GS:ffff88890b0f7000(0000) knlGS:00=
00000000000000
[117.004820] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[117.004823] CR2: 00005db8131eb7f0 CR3: 0000000003448000 CR4: 0000000000f52=
ef0
[117.004826] PKRU: 55555554
[117.004827] Call Trace:
[117.004829]  <IRQ>
[117.004831]  timer_delete_sync+0x10/0x20
[117.004833]  vgem_fence_release+0x19/0x30 [vgem]
[117.004836]  dma_fence_release+0xc1/0x3b0
[117.004838]  ? dma_fence_release+0xa1/0x3b0
[117.004841]  dma_fence_chain_release+0xe7/0x130
[117.004844]  dma_fence_release+0xc1/0x3b0
[117.004847]  ? _raw_spin_unlock_irqrestore+0x27/0x80
[117.004850]  dma_fence_chain_irq_work+0x59/0x80
[117.004853]  irq_work_single+0x75/0xa0
[117.004857]  irq_work_run_list+0x33/0x60
[117.004860]  irq_work_run+0x18/0x40
[117.004863]  __sysvec_irq_work+0x35/0x170
[117.004865]  sysvec_irq_work+0x47/0xc0
[117.004868]  asm_sysvec_irq_work+0x1b/0x20
[117.004871] RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
[117.004874] Code: 00 75 1c 65 ff 0d d9 34 68 01 74 20 5b 41 5c 5d 31 c0 31=
 d2 31 c9 31 f6 31 ff c3 cc cc cc cc e8 7f 9d d3 fe fb 0f 1f 44 00 00 <eb> =
d7 0f 1f 44 00 00 5b 41 5c 5d 31 c0 31 d2 31 c9 31 f6 31 ff c3
[117.004879] RSP: 0018:ffffc90000003cf0 EFLAGS: 00000246
[117.004882] RAX: 0000000000000000 RBX: ffff888155e94c40 RCX: 0000000000000=
000
[117.004884] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000=
000
[117.004887] RBP: ffffc90000003d00 R08: 0000000000000000 R09: 0000000000000=
000
[117.004890] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000=
246
[117.004892] R13: 0000000000000001 R14: 0000000000000246 R15: ffff888155e94=
c80
[117.004897]  dma_fence_signal+0x49/0xb0
[117.004899]  ? __pfx_vgem_fence_timeout+0x10/0x10 [vgem]
[117.004902]  vgem_fence_timeout+0x12/0x20 [vgem]
[117.004904]  call_timer_fn+0xa1/0x2a0
[117.004908]  ? __pfx_vgem_fence_timeout+0x10/0x10 [vgem]
[117.004910]  __run_timers+0x231/0x310
[117.004913]  ? tmigr_handle_remote+0x2ac/0x560
[117.004917]  timer_expire_remote+0x46/0x70
[117.004919]  tmigr_handle_remote+0x433/0x560
[117.004923]  ? __run_timers+0x239/0x310
[117.004925]  ? run_timer_softirq+0x21/0xe0
[117.004928]  ? lock_release+0xce/0x2a0
[117.004931]  run_timer_softirq+0xcf/0xe0
[117.004933]  handle_softirqs+0xd4/0x4d0
[117.004936]  __irq_exit_rcu+0x13f/0x160
[117.004938]  irq_exit_rcu+0xe/0x20
[117.004940]  sysvec_apic_timer_interrupt+0xa0/0xc0
[117.004943]  </IRQ>
[117.004944]  <TASK>
[117.004946]  asm_sysvec_apic_timer_interrupt+0x1b/0x20
[117.004949] RIP: 0010:cpuidle_enter_state+0x12b/0x8a0
[117.004953] Code: 48 0f a3 05 97 ce 0e 01 0f 82 2e 03 00 00 31 ff e8 8a 41=
 bd fe 80 7d d0 00 0f 85 11 03 00 00 e8 8b 06 d5 fe fb 0f 1f 44 00 00 <45> =
85 f6 0f 88 67 02 00 00 4d 63 ee 49 83 fd 0a 0f 83 34 06 00 00
[117.004961] RSP: 0018:ffffffff83403d88 EFLAGS: 00000246
[117.004963] RAX: 0000000000000000 RBX: ffff88888f046440 RCX: 0000000000000=
000
[117.004966] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000=
000
[117.004968] RBP: ffffffff83403dd8 R08: 0000000000000000 R09: 0000000000000=
000
[117.004971] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff837cb=
e80
[117.004974] R13: 0000000000000004 R14: 0000000000000004 R15: 0000001ad1df4=
66b
[117.004978]  ? cpuidle_enter_state+0x125/0x8a0
[117.004981]  ? sched_clock_noinstr+0x9/0x10
[117.004985]  cpuidle_enter+0x2e/0x50
[117.004989]  call_cpuidle+0x22/0x60
[117.004991]  do_idle+0x1fd/0x260
[117.005001]  cpu_startup_entry+0x29/0x30
[117.005004]  rest_init+0x104/0x200
[117.005008]  start_kernel+0x93d/0xbd0
[117.005011]  ? load_ucode_intel_bsp+0x2a/0x90
[117.005014]  ? sme_unmap_bootdata+0x14/0x80
[117.005017]  x86_64_start_reservations+0x18/0x30
[117.005020]  x86_64_start_kernel+0xfd/0x150
[117.005023]  ? soft_restart_cpu+0x14/0x14
[117.005026]  common_startup_64+0x13e/0x141
[117.005030]  </TASK>
[117.005032] irq event stamp: 2282669
[117.005034] hardirqs last  enabled at (2282668): [<ffffffff8289db71>] _raw=
_spin_unlock_irqrestore+0x51/0x80
[117.005038] hardirqs last disabled at (2282669): [<ffffffff82882021>] sysv=
ec_irq_work+0x11/0xc0
[117.005043] softirqs last  enabled at (2254702): [<ffffffff8289fd00>] __do=
_softirq+0x10/0x18
[117.005047] softirqs last disabled at (2254725): [<ffffffff813d4ddf>] __ir=
q_exit_rcu+0x13f/0x160
[117.005051] ---[ end trace 0000000000000000 ]---

Make the timer IRQ safe.

[1] https://patchwork.freedesktop.org/series/154987/#rev2

Fixes: 4077798484459 ("drm/vgem: Attach sw fences to exported vGEM dma-buf =
(ioctl)")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_=
fence.c
index fd76730fd38c0..07db319c3d7f9 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -79,7 +79,7 @@ static struct dma_fence *vgem_fence_create(struct vgem_fi=
le *vfile,
 	dma_fence_init(&fence->base, &vgem_fence_ops, &fence->lock,
 		       dma_fence_context_alloc(1), 1);
=20
-	timer_setup(&fence->timer, vgem_fence_timeout, 0);
+	timer_setup(&fence->timer, vgem_fence_timeout, TIMER_IRQSAFE);
=20
 	/* We force the fence to expire within 10s to prevent driver hangs */
 	mod_timer(&fence->timer, jiffies + VGEM_FENCE_TIMEOUT);
--=20
2.51.0

