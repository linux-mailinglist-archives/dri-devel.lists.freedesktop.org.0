Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66140721169
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 19:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CB110E104;
	Sat,  3 Jun 2023 17:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02DF10E104
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jun 2023 17:48:20 +0000 (UTC)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 156991EC0842;
 Sat,  3 Jun 2023 19:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1685814499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YExremYVsBTKp2qLehG2IpYwL7nkoYMRX4ld2c/IOrQ=;
 b=n/jvtaGbyfnkz0k/1ok1L39ZHko7Cz8Pon8A0cBY7JqUyANXY0L8JSDmEiGsntBurj6Bwy
 ZJfAXVjs1pDK1sxo/fB3eQL7LTTmTZC5ULaw44gNGM2wgunRVAys3gJlBT8cCGPYG5xgOM
 oSPhnEJcZI5gxZKub/d+8IiQ2iwxrSs=
Date: Sat, 3 Jun 2023 19:48:14 +0200
From: Borislav Petkov <bp@alien8.de>
To: amd-gfx@lists.freedesktop.org
Subject: WARNING: CPU: 5 PID: 1464 at drivers/gpu/drm/ttm/ttm_bo.c:326
 ttm_bo_release+0x27e/0x2d0 [ttm]
Message-ID: <20230603174814.GCZHt83pN+wNjf63sC@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this below triggers with the latest Linus tree:

51f269a6ecc7 ("Merge tag 'probes-fixes-6.4-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")

...
[   16.173593] [drm] radeon kernel modesetting enabled.
[   16.173743] radeon 0000:29:00.0: vgaarb: deactivate vga console
[   16.174300] MCE: In-kernel MCE decoding enabled.
[   16.175695] EDAC DEBUG: umc_read_base_mask:   DCSB0[0]=0x00000001 reg: 0x50000
[   16.175698] EDAC DEBUG: umc_read_base_mask:     DCSB_SEC0[0]=0x00000000 reg: 0x50010
[   16.175700] EDAC DEBUG: umc_read_base_mask:   DCSB0[1]=0x00000000 reg: 0x50004
[   16.175702] EDAC DEBUG: umc_read_base_mask:     DCSB_SEC0[1]=0x00000000 reg: 0x50014
[   16.175703] EDAC DEBUG: umc_read_base_mask:   DCSB0[2]=0x00000201 reg: 0x50008
[   16.175705] EDAC DEBUG: umc_read_base_mask:     DCSB_SEC0[2]=0x00000000 reg: 0x50018
[   16.175706] EDAC DEBUG: umc_read_base_mask:   DCSB0[3]=0x00000000 reg: 0x5000c
[   16.175707] EDAC DEBUG: umc_read_base_mask:     DCSB_SEC0[3]=0x00000000 reg: 0x5001c
[   16.175709] EDAC DEBUG: umc_read_base_mask:   DCSM0[0]=0x03fffdfe reg: 0x50020
[   16.175710] EDAC DEBUG: umc_read_base_mask:     DCSM_SEC0[0]=0x00000000 reg: 0x50028
[   16.175712] EDAC DEBUG: umc_read_base_mask:   DCSM0[1]=0x03fffdfe reg: 0x50024
[   16.175713] EDAC DEBUG: umc_read_base_mask:     DCSM_SEC0[1]=0x00000000 reg: 0x5002c
[   16.175715] EDAC DEBUG: umc_read_base_mask:   DCSB1[0]=0x00000001 reg: 0x150000
[   16.175716] EDAC DEBUG: umc_read_base_mask:     DCSB_SEC1[0]=0x00000000 reg: 0x150010
[   16.175718] EDAC DEBUG: umc_read_base_mask:   DCSB1[1]=0x00000000 reg: 0x150004
[   16.175719] EDAC DEBUG: umc_read_base_mask:     DCSB_SEC1[1]=0x00000000 reg: 0x150014
[   16.175720] EDAC DEBUG: umc_read_base_mask:   DCSB1[2]=0x00000201 reg: 0x150008
[   16.175722] EDAC DEBUG: umc_read_base_mask:     DCSB_SEC1[2]=0x00000000 reg: 0x150018
[   16.175723] EDAC DEBUG: umc_read_base_mask:   DCSB1[3]=0x00000000 reg: 0x15000c
[   16.175725] EDAC DEBUG: umc_read_base_mask:     DCSB_SEC1[3]=0x00000000 reg: 0x15001c
[   16.175726] EDAC DEBUG: umc_read_base_mask:   DCSM1[0]=0x03fffdfe reg: 0x150020
[   16.175728] EDAC DEBUG: umc_read_base_mask:     DCSM_SEC1[0]=0x00000000 reg: 0x150028
[   16.175729] EDAC DEBUG: umc_read_base_mask:   DCSM1[1]=0x03fffdfe reg: 0x150024
[   16.175730] EDAC DEBUG: umc_read_base_mask:     DCSM_SEC1[1]=0x00000000 reg: 0x15002c
[   16.175741] EDAC DEBUG: umc_determine_memory_type:   UMC0 DIMM type: Unbuffered-DDR4
[   16.175742] EDAC DEBUG: umc_determine_memory_type:   UMC1 DIMM type: Unbuffered-DDR4
[   16.177514] Console: switching to colour dummy device 80x25
[   16.177693] [drm] initializing kernel modesetting (CEDAR 0x1002:0x68E1 0x174B:0x3000 0x00).
[   16.177733] ATOM BIOS: AMD
[   16.177795] radeon 0000:29:00.0: VRAM: 1024M 0x0000000000000000 - 0x000000003FFFFFFF (1024M used)
[   16.177798] radeon 0000:29:00.0: GTT: 1024M 0x0000000040000000 - 0x000000007FFFFFFF
[   16.177800] [drm] Detected VRAM RAM=1024M, BAR=256M
[   16.177802] [drm] RAM width 64bits DDR
[   16.177835] [drm] radeon: 1024M of VRAM memory ready
[   16.177836] [drm] radeon: 1024M of GTT memory ready.
[   16.177839] [drm] Loading CEDAR Microcode
[   16.179106] [drm] Internal thermal controller without fan control
[   16.199812] [drm] radeon: dpm initialized
[   16.200179] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   16.200399] [drm] enabling PCIE gen 2 link speeds, disable with radeon.pcie_gen2=0
[   16.218135] [drm] PCIE GART of 1024M enabled (table at 0x000000000014C000).
[   16.218239] radeon 0000:29:00.0: WB enabled
[   16.218240] radeon 0000:29:00.0: fence driver on ring 0 use gpu addr 0x0000000040000c00
[   16.218242] radeon 0000:29:00.0: fence driver on ring 3 use gpu addr 0x0000000040000c0c
[   16.218606] radeon 0000:29:00.0: fence driver on ring 5 use gpu addr 0x000000000005c418
[   16.218657] radeon 0000:29:00.0: radeon: MSI limited to 32-bit
[   16.218689] radeon 0000:29:00.0: radeon: using MSI.
[   16.218707] [drm] radeon: irq initialized.
[   16.234730] [drm] ring test on 0 succeeded in 0 usecs
[   16.234738] [drm] ring test on 3 succeeded in 2 usecs
[   16.317725] r8169 0000:25:00.0 eth0: Link is Down
[   16.410486] [drm] ring test on 5 succeeded in 1 usecs
[   16.410492] [drm] UVD initialized successfully.
[   16.410555] [drm] ib test on ring 0 succeeded in 0 usecs
[   16.410596] [drm] ib test on ring 3 succeeded in 0 usecs
[   17.077422] [drm] ib test on ring 5 succeeded
[   17.077581] [drm] Radeon Display Connectors
[   17.077584] [drm] Connector 0:
[   17.077585] [drm]   HDMI-A-1
[   17.077586] [drm]   HPD4
[   17.077588] [drm]   DDC: 0x6440 0x6440 0x6444 0x6444 0x6448 0x6448 0x644c 0x644c
[   17.077590] [drm]   Encoders:
[   17.077591] [drm]     DFP1: INTERNAL_UNIPHY1
[   17.077593] [drm] Connector 1:
[   17.077594] [drm]   DVI-I-1
[   17.077595] [drm]   HPD1
[   17.077597] [drm]   DDC: 0x6460 0x6460 0x6464 0x6464 0x6468 0x6468 0x646c 0x646c
[   17.077599] [drm]   Encoders:
[   17.077600] [drm]     DFP2: INTERNAL_UNIPHY
[   17.077601] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[   17.077602] [drm] Connector 2:
[   17.077604] [drm]   VGA-1
[   17.077605] [drm]   DDC: 0x6430 0x6430 0x6434 0x6434 0x6438 0x6438 0x643c 0x643c
[   17.077607] [drm]   Encoders:
[   17.077608] [drm]     CRT2: INTERNAL_KLDSCP_DAC2
[   17.083149] [drm] Initialized radeon 2.50.0 20080528 for 0000:29:00.0 on minor 0
[   17.127260] [drm] fb mappable at 0xE034D000
[   17.127269] [drm] vram apper at 0xE0000000
[   17.127270] [drm] size 7299072
[   17.127271] [drm] fb depth is 24
[   17.127272] [drm]    pitch is 6912
[   17.127298] fbcon: radeondrmfb (fb0) is primary device
[   17.167352] Console: switching to colour frame buffer device 210x65
[   17.170226] radeon 0000:29:00.0: [drm] fb0: radeondrmfb frame buffer device
[   17.193431] Console: switching to colour dummy device 80x25
[   17.217406] ------------[ cut here ]------------
[   17.217408] WARNING: CPU: 5 PID: 1464 at drivers/gpu/drm/ttm/ttm_bo.c:326 ttm_bo_release+0x27e/0x2d0 [ttm]
[   17.217418] Modules linked in: edac_mce_amd radeon(+) drm_ttm_helper ttm video drm_suballoc_helper drm_display_helper kvm irqbypass drm_kms_helper syscopyarea crc32_pclmul sysfillrect sha512_ssse3 sysimgblt sha512_generic cfbfillrect cfbimgblt wmi_bmof aesni_intel cfbcopyarea crypto_simd cryptd k10temp acpi_cpufreq wmi dm_mod
[   17.217432] CPU: 5 PID: 1464 Comm: systemd-udevd Not tainted 6.4.0-rc4+ #1
[   17.217436] Hardware name: Micro-Star International Co., Ltd. MS-7A38/B450M PRO-VDH MAX (MS-7A38), BIOS B.G0 07/26/2022
[   17.217438] RIP: 0010:ttm_bo_release+0x27e/0x2d0 [ttm]
[   17.217444] Code: 48 89 43 38 48 89 43 40 48 8b 5c 24 30 48 8b b5 40 08 00 00 48 8b 6c 24 38 48 83 c4 58 e9 7a 49 f7 e0 48 89 ef e9 6c fe ff ff <0f> 0b 48 83 7b 20 00 0f 84 b7 fd ff ff 0f 0b 0f 1f 00 e9 ad fd ff
[   17.217448] RSP: 0018:ffffc9000095fbb0 EFLAGS: 00010202
[   17.217451] RAX: 0000000000000001 RBX: ffff8881052c8de0 RCX: 0000000000000000
[   17.217453] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff8881052c8de0
[   17.217455] RBP: ffff888104a66e00 R08: ffff8881052c8de0 R09: ffff888104a7cf08
[   17.217457] R10: ffffc9000095fbe0 R11: ffffc9000095fbe8 R12: ffff8881052c8c78
[   17.217458] R13: ffff8881052c8c78 R14: dead000000000100 R15: ffff88810528b108
[   17.217460] FS:  00007f319fcbb8c0(0000) GS:ffff88881a540000(0000) knlGS:0000000000000000
[   17.217463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   17.217464] CR2: 000055dc8b0224a0 CR3: 000000010373d000 CR4: 0000000000750ee0
[   17.217466] PKRU: 55555554
[   17.217468] Call Trace:
[   17.217470]  <TASK>
[   17.217472]  ? __warn+0x97/0x160
[   17.217476]  ? ttm_bo_release+0x27e/0x2d0 [ttm]
[   17.217481]  ? report_bug+0x1ec/0x200
[   17.217487]  ? handle_bug+0x3c/0x70
[   17.217490]  ? exc_invalid_op+0x1f/0x90
[   17.217493]  ? preempt_count_sub+0xb5/0x100
[   17.217496]  ? asm_exc_invalid_op+0x16/0x20
[   17.217500]  ? ttm_bo_release+0x27e/0x2d0 [ttm]
[   17.217505]  ? ttm_resource_move_to_lru_tail+0x1ab/0x1d0 [ttm]
[   17.217511]  radeon_bo_unref+0x1a/0x30 [radeon]
[   17.217547]  radeon_gem_object_free+0x20/0x30 [radeon]
[   17.217579]  radeon_fbdev_fb_destroy+0x57/0x90 [radeon]
[   17.217616]  unregister_framebuffer+0x72/0x110
[   17.217620]  drm_client_dev_unregister+0x6d/0xe0
[   17.217623]  drm_dev_unregister+0x2e/0x90
[   17.217626]  drm_put_dev+0x26/0x90
[   17.217628]  pci_device_remove+0x44/0xc0
[   17.217631]  really_probe+0x257/0x340
[   17.217635]  __driver_probe_device+0x73/0x120
[   17.217638]  driver_probe_device+0x2c/0xb0
[   17.217641]  __driver_attach+0xa0/0x150
[   17.217643]  ? __pfx___driver_attach+0x10/0x10
[   17.217646]  bus_for_each_dev+0x67/0xa0
[   17.217649]  bus_add_driver+0x10e/0x210
[   17.217651]  driver_register+0x5c/0x120
[   17.217653]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
[   17.217681]  do_one_initcall+0x44/0x220
[   17.217684]  ? kmalloc_trace+0x37/0xc0
[   17.217688]  do_init_module+0x64/0x240
[   17.217691]  __do_sys_finit_module+0xb2/0x100
[   17.217694]  do_syscall_64+0x3b/0x90
[   17.217697]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[   17.217700] RIP: 0033:0x7f319feaa5a9
[   17.217702] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 27 08 0d 00 f7 d8 64 89 01 48
[   17.217706] RSP: 002b:00007ffc6bf3e7f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   17.217709] RAX: ffffffffffffffda RBX: 00005607204f3170 RCX: 00007f319feaa5a9
[   17.217710] RDX: 0000000000000000 RSI: 00007f31a002eefd RDI: 0000000000000018
[   17.217712] RBP: 00007f31a002eefd R08: 0000000000000000 R09: 00005607204f1860
[   17.217714] R10: 0000000000000018 R11: 0000000000000246 R12: 0000000000020000
[   17.217716] R13: 0000000000000000 R14: 0000560720522450 R15: 0000560720255899
[   17.217718]  </TASK>
[   17.217719] ---[ end trace 0000000000000000 ]---
[   17.233548] BUG: kernel NULL pointer dereference, address: 00000000000000f8
[   17.233550] #PF: supervisor read access in kernel mode
[   17.233552] #PF: error_code(0x0000) - not-present page
[   17.233553] PGD 0 P4D 0 
[   17.233555] Oops: 0000 [#1] PREEMPT SMP
[   17.233557] CPU: 5 PID: 1464 Comm: systemd-udevd Tainted: G        W          6.4.0-rc4+ #1
[   17.233559] Hardware name: Micro-Star International Co., Ltd. MS-7A38/B450M PRO-VDH MAX (MS-7A38), BIOS B.G0 07/26/2022
[   17.233561] RIP: 0010:atombios_crtc_disable+0x3f/0x2f0 [radeon]
[   17.233584] Code: ec 48 48 8b 07 48 8b 58 38 e8 cd fc ff ff 48 8b 85 80 00 00 00 48 8b 80 a8 00 00 00 48 85 c0 74 71 4c 8b a0 a8 00 00 00 31 f6 <49> 8b bc 24 f8 00 00 00 4d 8d 6c 24 88 e8 6f 7c 4a e1 83 f8 fc 0f
[   17.233586] RSP: 0018:ffffc9000095fa78 EFLAGS: 00010246
[   17.233588] RAX: ffff888104228600 RBX: ffff888104a7c000 RCX: 0000000000000005
[   17.233590] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888104a7de10
[   17.233591] RBP: ffff88810528d000 R08: 0000000000000c24 R09: 0000000000030002
[   17.233592] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[   17.233594] R13: ffff88810528b2a8 R14: 0000000000000000 R15: ffff88810528b000
[   17.233595] FS:  00007f319fcbb8c0(0000) GS:ffff88881a540000(0000) knlGS:0000000000000000
[   17.233597] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   17.233598] CR2: 00000000000000f8 CR3: 000000010373d000 CR4: 0000000000750ee0
[   17.233600] PKRU: 55555554
[   17.233601] Call Trace:
[   17.233602]  <TASK>
[   17.233603]  ? __die+0x2d/0x80
[   17.233606]  ? page_fault_oops+0x15e/0x450
[   17.233609]  ? __pfx_cail_reg_read+0x10/0x10 [radeon]
[   17.233629]  ? __pfx_cail_reg_write+0x10/0x10 [radeon]
[   17.233647]  ? __pfx_cail_reg_read+0x10/0x10 [radeon]
[   17.233665]  ? __pfx_cail_reg_write+0x10/0x10 [radeon]
[   17.233683]  ? atom_put_dst+0x544/0x580 [radeon]
[   17.233704]  ? exc_page_fault+0x464/0x8a0
[   17.233706]  ? asm_exc_page_fault+0x22/0x30
[   17.233709]  ? atombios_crtc_disable+0x3f/0x2f0 [radeon]
[   17.233728]  ? atombios_crtc_disable+0x23/0x2f0 [radeon]
[   17.233746]  ? radeon_atom_encoder_dpms_avivo+0x8b/0x270 [radeon]
[   17.233780]  ? radeon_atom_encoder_dpms+0xd2/0x1d0 [radeon]
[   17.233806]  __drm_helper_disable_unused_functions+0x81/0xe0 [drm_kms_helper]
[   17.233817]  drm_crtc_helper_set_config+0x63c/0x980 [drm_kms_helper]
[   17.233824]  ? _raw_spin_unlock+0x15/0x40
[   17.233827]  ? d_walk+0x1be/0x2b0
[   17.233830]  ? preempt_count_sub+0xb5/0x100
[   17.233832]  radeon_crtc_set_config+0x4c/0x120 [radeon]
[   17.233857]  __drm_mode_set_config_internal+0x8f/0x140
[   17.233861]  drm_helper_force_disable_all+0x8e/0xc0 [drm_kms_helper]
[   17.233869]  radeon_modeset_fini+0x7f/0xb0 [radeon]
[   17.233890]  radeon_driver_unload_kms+0x36/0xa0 [radeon]
[   17.233911]  drm_dev_unregister+0x5c/0x90
[   17.233913]  drm_put_dev+0x26/0x90
[   17.233914]  pci_device_remove+0x44/0xc0
[   17.233916]  really_probe+0x257/0x340
[   17.233918]  __driver_probe_device+0x73/0x120
[   17.233920]  driver_probe_device+0x2c/0xb0
[   17.233923]  __driver_attach+0xa0/0x150
[   17.233925]  ? __pfx___driver_attach+0x10/0x10
[   17.233927]  bus_for_each_dev+0x67/0xa0
[   17.233928]  bus_add_driver+0x10e/0x210
[   17.233930]  driver_register+0x5c/0x120
[   17.233932]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
[   17.233951]  do_one_initcall+0x44/0x220
[   17.233953]  ? kmalloc_trace+0x37/0xc0
[   17.233955]  do_init_module+0x64/0x240
[   17.233957]  __do_sys_finit_module+0xb2/0x100
[   17.233959]  do_syscall_64+0x3b/0x90
[   17.233961]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[   17.233963] RIP: 0033:0x7f319feaa5a9
[   17.233965] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 27 08 0d 00 f7 d8 64 89 01 48
[   17.233968] RSP: 002b:00007ffc6bf3e7f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   17.233970] RAX: ffffffffffffffda RBX: 00005607204f3170 RCX: 00007f319feaa5a9
[   17.233971] RDX: 0000000000000000 RSI: 00007f31a002eefd RDI: 0000000000000018
[   17.233972] RBP: 00007f31a002eefd R08: 0000000000000000 R09: 00005607204f1860
[   17.233974] R10: 0000000000000018 R11: 0000000000000246 R12: 0000000000020000
[   17.233975] R13: 0000000000000000 R14: 0000560720522450 R15: 0000560720255899
[   17.233977]  </TASK>
[   17.233978] Modules linked in: edac_mce_amd radeon(+) drm_ttm_helper ttm video drm_suballoc_helper drm_display_helper kvm irqbypass drm_kms_helper syscopyarea crc32_pclmul sysfillrect sha512_ssse3 sysimgblt sha512_generic cfbfillrect cfbimgblt wmi_bmof aesni_intel cfbcopyarea crypto_simd cryptd k10temp acpi_cpufreq wmi dm_mod
[   17.233988] Dumping ftrace buffer:
[   17.233993]    (ftrace buffer empty)
[   17.233994] CR2: 00000000000000f8
[   17.233995] ---[ end trace 0000000000000000 ]---
[   17.233996] RIP: 0010:atombios_crtc_disable+0x3f/0x2f0 [radeon]
[   17.234017] Code: ec 48 48 8b 07 48 8b 58 38 e8 cd fc ff ff 48 8b 85 80 00 00 00 48 8b 80 a8 00 00 00 48 85 c0 74 71 4c 8b a0 a8 00 00 00 31 f6 <49> 8b bc 24 f8 00 00 00 4d 8d 6c 24 88 e8 6f 7c 4a e1 83 f8 fc 0f
[   17.234020] RSP: 0018:ffffc9000095fa78 EFLAGS: 00010246
[   17.234021] RAX: ffff888104228600 RBX: ffff888104a7c000 RCX: 0000000000000005
[   17.234023] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888104a7de10
[   17.234024] RBP: ffff88810528d000 R08: 0000000000000c24 R09: 0000000000030002
[   17.234025] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[   17.234027] R13: ffff88810528b2a8 R14: 0000000000000000 R15: ffff88810528b000
[   17.234028] FS:  00007f319fcbb8c0(0000) GS:ffff88881a540000(0000) knlGS:0000000000000000
[   17.234030] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   17.234031] CR2: 00000000000000f8 CR3: 000000010373d000 CR4: 0000000000750ee0
[   17.234033] PKRU: 55555554
[   17.234034] note: systemd-udevd[1464] exited with irqs disabled
[   17.282192] Adding 15624188k swap on /dev/sda1.  Priority:-2 extents:1 across:15624188k SS
[   17.287243] EXT4-fs (sda2): re-mounted b522b1ae-f9dc-4183-be36-d06ce4b0fec6 r/w. Quota mode: disabled.
[   17.377499] EXT4-fs (sdb1): mounted filesystem 5bb158ff-89fa-4860-9c06-772eef540132 r/w with ordered data mode. Quota mode: disabled.
[   17.377534] /dev/home1: Can't open blockdev
[   17.523358] NET: Registered PF_INET6 protocol family
[   17.523513] Segment Routing with IPv6
[   17.523517] In-situ OAM (IOAM) with IPv6
[   19.738875] r8169 0000:25:00.0 eth0: Link is Up - 1Gbps/Full - flow control rx/tx
[   19.738892] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
