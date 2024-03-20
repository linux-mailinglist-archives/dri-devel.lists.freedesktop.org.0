Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C49188101B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 11:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830B410F6E4;
	Wed, 20 Mar 2024 10:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVAkGY3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE0B10F6E4;
 Wed, 20 Mar 2024 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710931308; x=1742467308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XRnG/EuaAL9L2uwDg393vcd0tX8rmWc+RlcJBgmJmec=;
 b=IVAkGY3WCWBip2sr6qNIocE2O4XWVIqBb0i3mUkS38nHT6oQXcKhNxJl
 ZXVrjZE2e57y7OnCQAPimWW7Jol/ob4v4NeQehf9uf2jHSKY7sonVT+ti
 HyF5wXVxPsK/EQGi3E1aeVQEXVivUmlrQiRgq0qVGMF/mQKBc/BPvvU+p
 QxDWIIoyckXCxFn5+fs10NEJSw2heKlFJ7l7xX3QYWvGpZ0jMBeFxbffp
 NkXqcJth0yW/APfeWVl59vIdNZFMQaW6zzxyPalrkmHOcktDrAbvNFqs/
 V6zlDBd+TnRV1FmRvUKidkBeZVLjxhtMvHMSNtMZtRdePjwmHce7J7jxc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9663665"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="9663665"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="18855143"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:41:46 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [RFC 0/2] drm/xe: Support PCIe FLR
Date: Wed, 20 Mar 2024 16:14:24 +0530
Message-Id: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

PCI subsystem provides callbacks to inform the driver about a request to
do function level reset by user, initiated by writing to sysfs entry
/sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
without the need to do unbind and rebind as the driver needs to
reinitialize the device afresh post FLR.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

we get the below splat but the device has recovered, have executed an
IGT post FLR.

[ 3107.473420] xe 0000:aa:00.0: preparing for PCIe FLR reset
[ 3107.473440] xe 0000:aa:00.0: [drm] removing device access to
userspace
[ 3107.477232] ------------[ cut here ]------------
[ 3107.477241] xe 0000:aa:00.0: [drm] Assertion `guc_read_stopped(guc)
== 1` failed!
               platform: 8 subplatform: 1
               graphics: Xe_HPC 12.60 step C0
               media: none 0.00 step **
[ 3107.477286] WARNING: CPU: 57 PID: 11844 at
drivers/gpu/drm/xe/xe_guc_submit.c:1490 xe_guc_submit_stop+0x436/0x450
[xe]
[ 3107.477434] Modules linked in: xe(O) drm_gpuvm video drm_ttm_helper
ttm gpu_sched drm_suballoc_helper drm_kunit_helpers drm_exec
drm_display_helper kunit drm_buddy cfbfillrect cfbimgblt fb_io_fops
cfbcopyarea nfnetlink br_netfilter overlay x86_pkg_temp_thermal coretemp
kvm_intel pmt_telemetry pmt_class kvm irqbypass snd_hda_codec_realtek
snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_hda_codec
snd_hwdep snd_hda_core snd_pcm intel_vsec acpi_power_meter fuse
ip_tables x_tables ast i2c_algo_bit drm_shmem_helper crct10dif_pclmul
crc32_pclmul ghash_clmulni_intel i2c_i801 drm_kms_helper i2c_smbus
syscopyarea sysfillrect sysimgblt fb_sys_fops fb fbdev i2c_ismt igc drm
ptp drm_panel_orientation_quirks pps_core wmi ax88179_178a usbnet mii
[last unloaded: xe(O)]
[ 3107.477652] CPU: 57 PID: 11844 Comm: bash Tainted: G     U  W  O
6.8.0-rc3-xe #5
[ 3107.477664] Hardware name: Intel Corporation ArcherCity/ArcherCity,
BIOS EGSDCRB1.86B.0087.D13.2208261706 08/26/2022
[ 3107.477668] RIP: 0010:xe_guc_submit_stop+0x436/0x450 [xe]
[ 3107.477769] Code: 41 52 8b 4c 24 3c 51 48 c7 c1 3b b5 8e a0 53 4c 8b
5c 24 50 41 53 44 8b 4c 24 60 44 8b 44 24 64 48 8b 54 24 68 e8 5a ca 9e
e0 <0f> 0b 48 83 c4 40 e9 f8 fb ff ff e8 1a 29 77 e1 66 2e 0f 1f 84 00
[ 3107.477775] RSP: 0018:ffa000002ae27cc8 EFLAGS: 00010286
[ 3107.477783] RAX: 0000000000000000 RBX: 000000000000000c RCX:
0000000000000027
[ 3107.477787] RDX: 0000000000000027 RSI: 00000000fff7ffff RDI:
ff11003fffaaca48
[ 3107.477792] RBP: 0000000000000000 R08: 0000000000000000 R09:
ffa000002ae27b60
[ 3107.477796] R10: 0000000000000001 R11: 0000000000000001 R12:
ff1100208e579930
[ 3107.477799] R13: 0000000000000000 R14: ff11002094358000 R15:
ffffffffa08ec49b
[ 3107.477803] FS:  00007f5a7dfeb740(0000) GS:ff11003fffa80000(0000)
knlGS:0000000000000000
[ 3107.477808] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3107.477812] CR2: 000055a4fa2df5c8 CR3: 000000018b5ee001 CR4:
0000000000f71ef0
[ 3107.477817] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 3107.477821] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7:
0000000000000400
[ 3107.477825] PKRU: 55555554
[ 3107.477828] Call Trace:
[ 3107.477833]  <TASK>
[ 3107.477837]  ? __warn+0x84/0x170
[ 3107.477852]  ? xe_guc_submit_stop+0x436/0x450 [xe]
[ 3107.477950]  ? report_bug+0x1bd/0x1d0
[ 3107.477965]  ? handle_bug+0x3c/0x70
[ 3107.477975]  ? exc_invalid_op+0x18/0x70
[ 3107.477984]  ? asm_exc_invalid_op+0x1a/0x20
[ 3107.478004]  ? xe_guc_submit_stop+0x436/0x450 [xe]
[ 3107.478099]  ? xe_guc_submit_stop+0x436/0x450 [xe]
[ 3107.478196]  xe_idle_gt+0x3d/0x60 [xe]
[ 3107.478267]  xe_pci_reset_prepare+0xc2/0x270 [xe]
[ 3107.478354]  pci_dev_save_and_disable+0x29/0x60
[ 3107.478362]  pci_reset_function+0x3b/0x80
[ 3107.478367]  reset_store+0x5b/0xa0
[ 3107.478374]  kernfs_fop_write_iter+0x12e/0x1d0
[ 3107.478380]  vfs_write+0x321/0x550
[ 3107.478390]  ksys_write+0x69/0xf0
[ 3107.478394]  do_syscall_64+0x6f/0x140
[ 3107.478400]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[ 3107.478404] RIP: 0033:0x7f5a7dd14a37
[ 3107.478408] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f
1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f
05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[ 3107.478412] RSP: 002b:00007fffbff218e8 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[ 3107.478417] RAX: ffffffffffffffda RBX: 0000000000000002 RCX:
00007f5a7dd14a37
[ 3107.478419] RDX: 0000000000000002 RSI: 000055a4fa300f90 RDI:
0000000000000001
[ 3107.478421] RBP: 000055a4fa300f90 R08: 00007f5a7ddd1460 R09:
000000007fffffff
[ 3107.478424] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000002
[ 3107.478426] R13: 00007f5a7de1a780 R14: 00007f5a7de16600 R15:
00007f5a7de15a00
[ 3107.478434]  </TASK>
[ 3107.478436] irq event stamp: 34064143
[ 3107.478438] hardirqs last  enabled at (34064149):
[<ffffffff81181ee5>] console_unlock+0x115/0x130
[ 3107.478444] hardirqs last disabled at (34064154):
[<ffffffff81181eca>] console_unlock+0xfa/0x130
[ 3107.478446] softirqs last  enabled at (34062134):
[<ffffffff81e7902b>] __do_softirq+0x2ab/0x360
[ 3107.478452] softirqs last disabled at (34062125):
[<ffffffff810e271f>] irq_exit_rcu+0x7f/0xa0
[ 3107.478458] ---[ end trace 0000000000000000 ]---
[ 3107.694394] xe 0000:aa:00.0: PCI device went through FLR, reenabling
the device
[ 3107.699786] xe 0000:aa:00.0: [drm] *ERROR* GuC RC enable failed:
-ECANCELED
[ 3107.699863] ------------[ cut here ]------------
[ 3107.699866] WARNING: CPU: 57 PID: 11844 at
drivers/gpu/drm/xe/xe_guc_pc.c:931 xe_guc_pc_fini+0x71/0x80 [xe]
[ 3107.699949] Modules linked in: xe(O) drm_gpuvm video drm_ttm_helper
ttm gpu_sched drm_suballoc_helper drm_kunit_helpers drm_exec
drm_display_helper kunit drm_buddy cfbfillrect cfbimgblt fb_io_fops
cfbcopyarea nfnetlink br_netfilter overlay x86_pkg_temp_thermal coretemp
kvm_intel pmt_telemetry pmt_class kvm irqbypass snd_hda_codec_realtek
snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_hda_codec
snd_hwdep snd_hda_core snd_pcm intel_vsec acpi_power_meter fuse
ip_tables x_tables ast i2c_algo_bit drm_shmem_helper crct10dif_pclmul
crc32_pclmul ghash_clmulni_intel i2c_i801 drm_kms_helper i2c_smbus
syscopyarea sysfillrect sysimgblt fb_sys_fops fb fbdev i2c_ismt igc drm
ptp drm_panel_orientation_quirks pps_core wmi ax88179_178a usbnet mii
[last unloaded: xe(O)]
[ 3107.700034] CPU: 57 PID: 11844 Comm: bash Tainted: G     U  W  O
6.8.0-rc3-xe #5
[ 3107.700037] Hardware name: Intel Corporation ArcherCity/ArcherCity,
BIOS EGSDCRB1.86B.0087.D13.2208261706 08/26/2022
[ 3107.700040] RIP: 0010:xe_guc_pc_fini+0x71/0x80 [xe]
[ 3107.700091] Code: fe ff ff 85 c0 75 1f 4c 89 e7 5d be ff ff 00 00 41
5c e9 c2 62 fe ff 5d 48 8d be e8 db ff ff 41 5c e9 13 eb fe ff 0f 0b eb
dd <0f> 0b eb cd 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
[ 3107.700094] RSP: 0018:ffa000002ae27d08 EFLAGS: 00010282
[ 3107.700098] RAX: 00000000ffffff83 RBX: ff11002094358000 RCX:
0000000000000000
[ 3107.700100] RDX: ff11003fffab8dd0 RSI: ff11003fffaaca40 RDI:
ff11003fffaaca40
[ 3107.700102] RBP: ff1100208e57a440 R08: 0000000000000000 R09:
ffa000002ae27aa0
[ 3107.700104] R10: 0000000000000001 R11: 0000000000000001 R12:
ff1100208e578058
[ 3107.700106] R13: ff11002086dd6c40 R14: dead000000000122 R15:
dead000000000100
[ 3107.700108] FS:  00007f5a7dfeb740(0000) GS:ff11003fffa80000(0000)
knlGS:0000000000000000
[ 3107.700110] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3107.700112] CR2: 000055a4fa2df5c8 CR3: 000000018b5ee001 CR4:
0000000000f71ef0
[ 3107.700115] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 3107.700117] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7:
0000000000000400
[ 3107.700119] PKRU: 55555554
[ 3107.700121] Call Trace:
[ 3107.700123]  <TASK>
[ 3107.700125]  ? __warn+0x84/0x170
[ 3107.700133]  ? xe_guc_pc_fini+0x71/0x80 [xe]
[ 3107.700180]  ? report_bug+0x1bd/0x1d0
[ 3107.700188]  ? handle_bug+0x3c/0x70
[ 3107.700192]  ? exc_invalid_op+0x18/0x70
[ 3107.700196]  ? asm_exc_invalid_op+0x1a/0x20
[ 3107.700205]  ? xe_guc_pc_fini+0x71/0x80 [xe]
[ 3107.700256]  ? xe_guc_pc_fini+0x3e/0x80 [xe]
[ 3107.700302]  drm_managed_release+0xb5/0x160 [drm]
[ 3107.700364]  drm_dev_release+0x33/0x40 [drm]
[ 3107.700392]  ? __pfx_devm_action_release+0x10/0x10
[ 3107.700399]  devres_release+0x28/0x60
[ 3107.700403]  devm_release_action+0x3c/0x70
[ 3107.700407]  ? __pfx_devm_drm_dev_init_release+0x10/0x10 [drm]
[ 3107.700436]  xe_pci_reset_done+0x86/0xc0 [xe]
[ 3107.700529]  pci_reset_function+0x4e/0x80
[ 3107.700538]  reset_store+0x5b/0xa0
[ 3107.700546]  kernfs_fop_write_iter+0x12e/0x1d0
[ 3107.700554]  vfs_write+0x321/0x550
[ 3107.700566]  ksys_write+0x69/0xf0
[ 3107.700571]  do_syscall_64+0x6f/0x140
[ 3107.700579]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[ 3107.700585] RIP: 0033:0x7f5a7dd14a37
[ 3107.700589] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f
1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f
05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[ 3107.700593] RSP: 002b:00007fffbff218e8 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[ 3107.700600] RAX: ffffffffffffffda RBX: 0000000000000002 RCX:
00007f5a7dd14a37
[ 3107.700604] RDX: 0000000000000002 RSI: 000055a4fa300f90 RDI:
0000000000000001
[ 3107.700608] RBP: 000055a4fa300f90 R08: 00007f5a7ddd1460 R09:
000000007fffffff
[ 3107.700612] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000002
[ 3107.700615] R13: 00007f5a7de1a780 R14: 00007f5a7de16600 R15:
00007f5a7de15a00
[ 3107.700624]  </TASK>
[ 3107.700627] irq event stamp: 34067435
[ 3107.700631] hardirqs last  enabled at (34067441):
[<ffffffff81181ee5>] console_unlock+0x115/0x130
[ 3107.700638] hardirqs last disabled at (34067446):
[<ffffffff81181eca>] console_unlock+0xfa/0x130
[ 3107.700642] softirqs last  enabled at (34066658):
[<ffffffff81e7902b>] __do_softirq+0x2ab/0x360
[ 3107.700649] softirqs last disabled at (34066519):
[<ffffffff810e271f>] irq_exit_rcu+0x7f/0xa0
[ 3107.700656] ---[ end trace 0000000000000000 ]---
[ 3107.700661] xe 0000:aa:00.0: [drm] *ERROR* GuC PC shutdown -ECANCELED
[ 3107.700707] ------------[ cut here ]------------
[ 3107.700710] WARNING: CPU: 57 PID: 11844 at
drivers/gpu/drm/xe/xe_guc_pc.c:932 xe_guc_pc_fini+0x6d/0x80 [xe]
[ 3107.700761] Modules linked in: xe(O) drm_gpuvm video drm_ttm_helper
ttm gpu_sched drm_suballoc_helper drm_kunit_helpers drm_exec
drm_display_helper kunit drm_buddy cfbfillrect cfbimgblt fb_io_fops
cfbcopyarea nfnetlink br_netfilter overlay x86_pkg_temp_thermal coretemp
kvm_intel pmt_telemetry pmt_class kvm irqbypass snd_hda_codec_realtek
snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_hda_codec
snd_hwdep snd_hda_core snd_pcm intel_vsec acpi_power_meter fuse
ip_tables x_tables ast i2c_algo_bit drm_shmem_helper crct10dif_pclmul
crc32_pclmul ghash_clmulni_intel i2c_i801 drm_kms_helper i2c_smbus
syscopyarea sysfillrect sysimgblt fb_sys_fops fb fbdev i2c_ismt igc drm
ptp drm_panel_orientation_quirks pps_core wmi ax88179_178a usbnet mii
[last unloaded: xe(O)]
[ 3107.700860] CPU: 57 PID: 11844 Comm: bash Tainted: G     U  W  O
6.8.0-rc3-xe #5
[ 3107.700863] Hardware name: Intel Corporation ArcherCity/ArcherCity,
BIOS EGSDCRB1.86B.0087.D13.2208261706 08/26/2022
[ 3107.700865] RIP: 0010:xe_guc_pc_fini+0x6d/0x80 [xe]
[ 3107.700914] Code: 89 ef e8 36 fe ff ff 85 c0 75 1f 4c 89 e7 5d be ff
ff 00 00 41 5c e9 c2 62 fe ff 5d 48 8d be e8 db ff ff 41 5c e9 13 eb fe
ff <0f> 0b eb dd 0f 0b eb cd 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90
[ 3107.700917] RSP: 0018:ffa000002ae27d08 EFLAGS: 00010282
[ 3107.700920] RAX: 00000000ffffff83 RBX: ff11002094358000 RCX:
0000000000000000
[ 3107.700923] RDX: 0000000000000027 RSI: 00000000fff7ffff RDI:
ff11003fffaaca48
[ 3107.700925] RBP: ff1100208e57a440 R08: 0000000000000000 R09:
ffa000002ae27ab0
[ 3107.700927] R10: 0000000000000001 R11: 0000000000000001 R12:
ff1100208e578058
[ 3107.700929] R13: ff11002086dd6c40 R14: dead000000000122 R15:
dead000000000100
[ 3107.700931] FS:  00007f5a7dfeb740(0000) GS:ff11003fffa80000(0000)
knlGS:0000000000000000
[ 3107.700933] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3107.700936] CR2: 000055a4fa2df5c8 CR3: 000000018b5ee001 CR4:
0000000000f71ef0
[ 3107.700939] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 3107.700941] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7:
0000000000000400
[ 3107.700944] PKRU: 55555554
[ 3107.700946] Call Trace:
[ 3107.700949]  <TASK>
[ 3107.700951]  ? __warn+0x84/0x170
[ 3107.700956]  ? xe_guc_pc_fini+0x6d/0x80 [xe]
[ 3107.701005]  ? report_bug+0x1bd/0x1d0
[ 3107.701011]  ? handle_bug+0x3c/0x70
[ 3107.701015]  ? exc_invalid_op+0x18/0x70
[ 3107.701019]  ? asm_exc_invalid_op+0x1a/0x20
[ 3107.701026]  ? xe_guc_pc_fini+0x6d/0x80 [xe]
[ 3107.701076]  ? xe_guc_pc_fini+0x4a/0x80 [xe]
[ 3107.701125]  drm_managed_release+0xb5/0x160 [drm]
[ 3107.701160]  drm_dev_release+0x33/0x40 [drm]
[ 3107.701189]  ? __pfx_devm_action_release+0x10/0x10
[ 3107.701193]  devres_release+0x28/0x60
[ 3107.701198]  devm_release_action+0x3c/0x70
[ 3107.701202]  ? __pfx_devm_drm_dev_init_release+0x10/0x10 [drm]
[ 3107.701229]  xe_pci_reset_done+0x86/0xc0 [xe]
[ 3107.701286]  pci_reset_function+0x4e/0x80
[ 3107.701289]  reset_store+0x5b/0xa0
[ 3107.701295]  kernfs_fop_write_iter+0x12e/0x1d0
[ 3107.701300]  vfs_write+0x321/0x550
[ 3107.701308]  ksys_write+0x69/0xf0
[ 3107.701313]  do_syscall_64+0x6f/0x140
[ 3107.701318]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[ 3107.701321] RIP: 0033:0x7f5a7dd14a37
[ 3107.701325] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f
1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f
05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[ 3107.701327] RSP: 002b:00007fffbff218e8 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[ 3107.701331] RAX: ffffffffffffffda RBX: 0000000000000002 RCX:
00007f5a7dd14a37
[ 3107.701333] RDX: 0000000000000002 RSI: 000055a4fa300f90 RDI:
0000000000000001
[ 3107.701335] RBP: 000055a4fa300f90 R08: 00007f5a7ddd1460 R09:
000000007fffffff
[ 3107.701337] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000002
[ 3107.701340] R13: 00007f5a7de1a780 R14: 00007f5a7de16600 R15:
00007f5a7de15a00
[ 3107.701348]  </TASK>
[ 3107.701351] irq event stamp: 34068201
[ 3107.701352] hardirqs last  enabled at (34068207):
[<ffffffff81181ee5>] console_unlock+0x115/0x130
[ 3107.701355] hardirqs last disabled at (34068212):
[<ffffffff81181eca>] console_unlock+0xfa/0x130
[ 3107.701358] softirqs last  enabled at (34066658):
[<ffffffff81e7902b>] __do_softirq+0x2ab/0x360
[ 3107.701362] softirqs last disabled at (34066519):
[<ffffffff810e271f>] irq_exit_rcu+0x7f/0xa0
[ 3107.701364] ---[ end trace 0000000000000000 ]---
[ 3114.508489] xe 0000:aa:00.0: [drm] tile_count: 2, reduced_tile_count
1
[ 3114.511963] xe 0000:aa:00.0: [drm] Using GuC firmware from
xe/pvc_guc_70.9.1.bin version 70.9.1
[ 3114.542830] xe 0000:aa:00.0: [drm] VISIBLE VRAM: 0x00002c7000000000,
0x0000001000000000
[ 3114.542855] xe 0000:aa:00.0: [drm] VRAM[0, 0]: Actual physical size
0x0000000c00000000, usable size exclude stolen 0x0000000bff000000, CPU
accessible size 0x0000000bff000000
[ 3114.542858] xe 0000:aa:00.0: [drm] VRAM[0, 0]: DPA range:
[0x0000000000000000-c00000000], io range:
[0x00002c7000000000-2c7bff000000]
[ 3114.542862] xe 0000:aa:00.0: [drm] Total VRAM: 0x00002c7000000000,
0x0000000c00000000
[ 3114.542865] xe 0000:aa:00.0: [drm] Available VRAM:
0x00002c7000000000, 0x0000000bff000000
[ 3114.773724] xe 0000:aa:00.0: [drm] bcs6 fused off
[ 3114.773728] xe 0000:aa:00.0: [drm] bcs7 fused off
[ 3114.806777] xe 0000:aa:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[ 3114.808267] [drm] Initialized xe 1.1.0 20201103 for 0000:aa:00.0 on
minor 1
[ 3159.484345] Console: switching to colour dummy device 80x25
[ 3159.484422] [IGT] xe_exec_basic: executing
[ 3159.502594] [IGT] xe_exec_basic: starting subtest once-basic
[ 3159.526649] [IGT] xe_exec_basic: finished subtest once-basic, SUCCESS
[ 3159.526929] [IGT] xe_exec_basic: exiting, ret=0

Aravind Iddamsetty (2):
  drm: add devm release action
  drm/xe/FLR: Support PCIe FLR

 drivers/gpu/drm/drm_drv.c            |  6 ++
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 +
 drivers/gpu/drm/xe/xe_gt.c           | 31 ++++++---
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_pci.c          | 53 ++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.h          |  6 +-
 drivers/gpu/drm/xe/xe_pci_err.c      | 94 ++++++++++++++++++++++++++++
 include/drm/drm_drv.h                |  4 ++
 9 files changed, 184 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c

-- 
2.25.1

