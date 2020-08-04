Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3809123C105
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 22:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C1B6E4B6;
	Tue,  4 Aug 2020 20:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826AE6E4B6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 20:51:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208811] New: AMDGPU on-load null pointer dereference
Date: Tue, 04 Aug 2020 20:51:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sid@aeam.us
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208811-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208811

            Bug ID: 208811
           Summary: AMDGPU on-load null pointer dereference
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.0
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: sid@aeam.us
        Regression: No

Created attachment 290771
  --> https://bugzilla.kernel.org/attachment.cgi?id=290771&action=edit
kernel config

Originally encountered on 5.4.48, updated to 5.8 to see if persists.

03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Picasso (rev c1)

I receive a similar error with a NAVI10 device. Possible relation to #206519.

[  104.139682] [drm] amdgpu kernel modesetting enabled.
[  104.139754] checking generic (e0000000 7f0000) vs hw (e0000000 10000000)
[  104.139755] fb0: switching to amdgpudrmfb from EFI VGA
[  104.139952] Console: switching to colour dummy device 80x25
[  104.139985] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
[  104.140073] amdgpu 0000:03:00.0: enabling device (0006 -> 0007)
[  104.140237] [drm] initializing kernel modesetting (RAVEN 0x1002:0x15D8
0x1043:0x1B71 0xC1).
[  104.140241] amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ) feature
disabled as experimental (default)
[  104.140330] [drm] register mmio base: 0xFE700000
[  104.140331] [drm] register mmio size: 524288
[  104.140345] [drm] add ip block number 0 <soc15_common>
[  104.140346] [drm] add ip block number 1 <gmc_v9_0>
[  104.140347] [drm] add ip block number 2 <vega10_ih>
[  104.140348] [drm] add ip block number 3 <psp>
[  104.140349] [drm] add ip block number 4 <gfx_v9_0>
[  104.140349] [drm] add ip block number 5 <sdma_v4_0>
[  104.140350] [drm] add ip block number 6 <powerplay>
[  104.140351] [drm] add ip block number 7 <dm>
[  104.140351] [drm] add ip block number 8 <vcn_v1_0>
[  104.141800] amdgpu: ATOM BIOS: 113-PICASSO-116
[  104.142877] [drm] VCN decode is enabled in VM mode
[  104.142878] [drm] VCN encode is enabled in VM mode
[  104.142878] [drm] JPEG decode is enabled in VM mode
[  104.142907] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,
fragment size is 9-bit
[  104.142913] amdgpu 0000:03:00.0: amdgpu: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[  104.142915] amdgpu 0000:03:00.0: amdgpu: GART: 1024M 0x0000000000000000 -
0x000000003FFFFFFF
[  104.142916] amdgpu 0000:03:00.0: amdgpu: AGP: 267419648M 0x000000F800000000
- 0x0000FFFFFFFFFFFF
[  104.142919] [drm] Detected VRAM RAM=2048M, BAR=2048M
[  104.142920] [drm] RAM width 128bits DDR4
[  104.142974] [TTM] Zone  kernel: Available graphics memory: 7134942 KiB
[  104.142975] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[  104.142975] [TTM] Initializing pool allocator
[  104.142979] [TTM] Initializing DMA pool allocator
[  104.143038] [drm] amdgpu: 2048M of VRAM memory ready
[  104.143041] [drm] amdgpu: 3072M of GTT memory ready.
[  104.143042] software IO TLB: Memory encryption is active and system is using
DMA bounce buffers
[  104.143044] [drm] GART: num cpu pages 262144, num gpu pages 262144
[  104.143290] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
[  104.162120] amdgpu: hwmgr_sw_init smu backed is smu10_smu
[  104.166452] [drm] Found VCN firmware Version ENC: 1.9 DEC: 1 VEP: 0
Revision: 28
[  104.166465] [drm] PSP loading VCN firmware
[  104.207801] [drm] reserve 0x400000 from 0xf47fc00000 for PSP TMR
[  104.219109] [drm] failed to load ucode id (0) 
[  104.219110] [drm] psp command (0x6) failed and response status is
(0xFFFF300F)
[  104.222108] [drm] failed to load ucode id (8) 
[  104.222109] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.225109] [drm] failed to load ucode id (9) 
[  104.225110] [drm] psp command (0x6) failed and response status is
(0xFFFF300F)
[  104.228108] [drm] failed to load ucode id (10) 
[  104.228109] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.234110] [drm] failed to load ucode id (11) 
[  104.234111] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.237109] [drm] failed to load ucode id (12) 
[  104.237110] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.243111] [drm] failed to load ucode id (13) 
[  104.243112] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.246109] [drm] failed to load ucode id (14) 
[  104.246110] [drm] psp command (0x6) failed and response status is
(0xFFFF300F)
[  104.249109] [drm] failed to load ucode id (17) 
[  104.249110] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.252110] [drm] failed to load ucode id (18) 
[  104.252111] [drm] psp command (0x6) failed and response status is
(0xFFFF300F)
[  104.255109] [drm] failed to load ucode id (19) 
[  104.255110] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.258109] [drm] failed to load ucode id (20) 
[  104.258110] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.264104] [drm] failed to load ucode id (26) 
[  104.264105] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.267109] [drm] failed to load ucode id (28) 
[  104.267110] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.270109] [drm] failed to load ucode id (29) 
[  104.270110] [drm] psp command (0x6) failed and response status is
(0xFFFF000F)
[  104.318109] [drm] psp command (0x4) failed and response status is (0x34)
[  104.318113] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is not
available
[  104.324110] [drm] psp command (0x1) failed and response status is (0x34)
[  104.327106] [drm] psp command (0x1) failed and response status is (0x34)
[  104.328567] amdgpu 0000:03:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:221 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[  104.328569] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000000000 from client 27
[  104.328570] amdgpu 0000:03:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000BBA
[  104.328571] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID: 0x5
[  104.328572] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[  104.328572] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x5
[  104.328573] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0xb
[  104.328574] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x1
[  104.328574] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[  104.328630] amdgpu 0000:03:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:72 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[  104.328631] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000001000 from client 27
[  104.328632] amdgpu 0000:03:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000A90
[  104.328633] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID: 0x5
[  104.328633] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[  104.328634] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[  104.328635] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x9
[  104.328635] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[  104.328636] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[  104.328687] [drm] kiq ring mec 2 pipe 1 q 0
[  105.364077] amdgpu 0000:03:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[  105.364154] [drm:amdgpu_gfx_enable_kcq.cold [amdgpu]] *ERROR* KCQ enable
failed
[  105.364233] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* hw_init of IP
block <gfx_v9_0> failed -110
[  105.364235] amdgpu 0000:03:00.0: amdgpu: amdgpu_device_ip_init failed
[  105.364237] amdgpu 0000:03:00.0: amdgpu: Fatal error during GPU init
[  105.364256] [drm] amdgpu: finishing device.
[  105.367111] [drm] psp command (0x2) failed and response status is (0x11A)
[  105.370114] [drm] psp command (0x2) failed and response status is (0x11A)
[  105.373116] [drm] psp command (0x2) failed and response status is (0x11A)
[  105.373117] [drm] free PSP TMR buffer
[  105.459143] [TTM] Finalizing pool allocator
[  105.459147] [TTM] Finalizing DMA pool allocator
[  105.459250] [TTM] Zone  kernel: Used memory at exit: 0 KiB
[  105.459253] [TTM] Zone   dma32: Used memory at exit: 0 KiB
[  105.459254] [drm] amdgpu: ttm finalized
[  105.459414] [drm] Initialized amdgpu 3.38.0 20150101 for 0000:03:00.0 on
minor 0
[  105.459420] BUG: kernel NULL pointer dereference, address: 0000000000000008
[  105.459425] #PF: supervisor read access in kernel mode
[  105.459427] #PF: error_code(0x0000) - not-present page
[  105.459429] PGD 0 P4D 0 
[  105.459432] Oops: 0000 [#1] SMP NOPTI
[  105.459435] CPU: 3 PID: 2936 Comm: modprobe Not tainted 5.8.0-gentoo-r1 #1
[  105.459437] Hardware name: ASUSTeK COMPUTER INC. ZenBook
UX434DA_UM433DA/UX434DA, BIOS UX434DA_UM433DA.302 09/05/2019
[  105.459528] RIP: 0010:amdgpu_debugfs_init+0x7/0x2b0 [amdgpu]
[  105.459531] Code: 74 04 85 db 74 b2 48 89 84 dd 28 03 00 00 83 fa 08 75 c4
5b 31 c0 5d 41 5c c3 66 0f 1f 84 00 00 00 00 00 41 54 55 48 89 fd 53 <48> 8b 45
08 48 89 e9 49 c7 c0 40 fd 9c c0 be 80 01 00 00 48 c7 c7
[  105.459536] RSP: 0018:ffffa2a742a57af0 EFLAGS: 00010246
[  105.459538] RAX: 0000000000000000 RBX: ffffffffc09ccf00 RCX:
0000000000000000
[  105.459541] RDX: ffff9c6a8957aac0 RSI: 0000000000000092 RDI:
0000000000000000
[  105.459543] RBP: 0000000000000000 R08: 0000000000000001 R09:
00000000000003be
[  105.459546] R10: 0000000000013754 R11: 0000000000000001 R12:
0000000000000000
[  105.459549] R13: 0000000000000000 R14: ffff9c6a8a3c5000 R15:
ffffffffc0b99fd0
[  105.459553] FS:  00007f07d2140740(0000) GS:ffff9c6a90ec0000(0000)
knlGS:0000000000000000
[  105.459556] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  105.459559] CR2: 0000000000000008 CR3: 00008003c613a000 CR4:
00000000003406e0
[  105.459562] Call Trace:
[  105.459660]  amdgpu_pci_probe+0x14e/0x170 [amdgpu]
[  105.459668]  local_pci_probe+0x3d/0x70
[  105.459673]  pci_device_probe+0xd0/0x150
[  105.459678]  really_probe+0xd9/0x2a0
[  105.459682]  driver_probe_device+0x4a/0xa0
[  105.459685]  device_driver_attach+0x4e/0x60
[  105.459689]  __driver_attach+0x4d/0xc0
[  105.459692]  ? device_driver_attach+0x60/0x60
[  105.459695]  bus_for_each_dev+0x75/0xc0
[  105.459699]  bus_add_driver+0x172/0x1c0
[  105.459703]  driver_register+0x68/0xc0
[  105.459706]  ? 0xffffffffc05c3000
[  105.459711]  do_one_initcall+0x44/0x1e0
[  105.459715]  ? _cond_resched+0x10/0x20
[  105.459720]  ? kmem_cache_alloc_trace+0x196/0x220
[  105.459724]  do_init_module+0x56/0x200
[  105.459728]  load_module+0x2424/0x26b0
[  105.459733]  ? __do_sys_finit_module+0xc6/0xe0
[  105.459737]  __do_sys_finit_module+0xc6/0xe0
[  105.459742]  do_syscall_64+0x42/0x70
[  105.459746]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  105.459750] RIP: 0033:0x7f07d2239789
[  105.459753] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d d7 06 0c 00 f7 d8 64 89 01 48
[  105.459760] RSP: 002b:00007fff5e8f9c48 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[  105.459764] RAX: ffffffffffffffda RBX: 000055dac6747a80 RCX:
00007f07d2239789
[  105.459767] RDX: 0000000000000000 RSI: 000055dac504d390 RDI:
0000000000000006
[  105.459770] RBP: 0000000000040000 R08: 0000000000000000 R09:
0000000000000000
[  105.459773] R10: 0000000000000006 R11: 0000000000000246 R12:
000055dac504d390
[  105.459775] R13: 0000000000000000 R14: 000055dac6747b00 R15:
000055dac6747a80
[  105.459779] Modules linked in: amdgpu(+) mfd_core gpu_sched ttm iwlmvm
uvcvideo kvm_amd videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
videobuf2_common kvm videodev ax88179_178a mc irqbypass usbnet
snd_hda_codec_realtek snd_hda_codec_hdmi iwlwifi efivarfs
[  105.459797] CR2: 0000000000000008
[  105.459800] ---[ end trace 2525194e592c9997 ]---
[  105.459904] RIP: 0010:amdgpu_debugfs_init+0x7/0x2b0 [amdgpu]
[  105.459908] Code: 74 04 85 db 74 b2 48 89 84 dd 28 03 00 00 83 fa 08 75 c4
5b 31 c0 5d 41 5c c3 66 0f 1f 84 00 00 00 00 00 41 54 55 48 89 fd 53 <48> 8b 45
08 48 89 e9 49 c7 c0 40 fd 9c c0 be 80 01 00 00 48 c7 c7
[  105.459914] RSP: 0018:ffffa2a742a57af0 EFLAGS: 00010246
[  105.459917] RAX: 0000000000000000 RBX: ffffffffc09ccf00 RCX:
0000000000000000
[  105.459920] RDX: ffff9c6a8957aac0 RSI: 0000000000000092 RDI:
0000000000000000
[  105.459922] RBP: 0000000000000000 R08: 0000000000000001 R09:
00000000000003be
[  105.459924] R10: 0000000000013754 R11: 0000000000000001 R12:
0000000000000000
[  105.459927] R13: 0000000000000000 R14: ffff9c6a8a3c5000 R15:
ffffffffc0b99fd0
[  105.459930] FS:  00007f07d2140740(0000) GS:ffff9c6a90ec0000(0000)
knlGS:0000000000000000
[  105.459933] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  105.459935] CR2: 0000000000000008 CR3: 00008003c613a000 CR4:
00000000003406e0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
