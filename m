Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C48E1BA5A3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 16:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CE48938B;
	Mon, 27 Apr 2020 14:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0868938B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 14:01:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207463] [amdgpu] System freeze / corrupted graphics
Date: Mon, 27 Apr 2020 14:01:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rokups+kernel-bugs@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207463-2300-b5Bm4EEula@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207463-2300@https.bugzilla.kernel.org/>
References: <bug-207463-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207463

--- Comment #1 from Rokas Kupstys (rokups+kernel-bugs@zoho.com) ---
Tested 5.4.35-1-lts kernel as well, corruption does happen, but looks bit
different visually. Also i can access another VT without issues, rendering is
ok there. Restarting X11 does not help to recover system, reboot is still
needed.

I also forgot to specify my GPU: AMD RX 580

Kernel command line: initrd=\amd-ucode.img initrd=\initramfs-linux-lts.img
rd.luks.name=<...>=cryptolvm rd.luks.options=discard,keyfile-timeout=10s
rd.luks.key=<...>=/keys/root.key:UUID=<...> root=/dev/mapper/system-root
resume=/dev/mapper/system-swap fastboot rw amd_iommu=on amd_iommu=pt
nohz_full=8-15,24-31 rcu_nocbs=8-15,24-31 rcu_nocb_poll user_namespace.enable=1

And some info from early boot, should it be useful:

bal. 27 15:46:49 archlinux kernel: [drm] amdgpu kernel modesetting enabled.
bal. 27 15:46:49 archlinux kernel: fb0: switching to amdgpudrmfb from EFI VGA
bal. 27 15:46:49 archlinux kernel: amdgpu 0000:08:00.0: vgaarb: deactivate vga
console
bal. 27 15:46:49 archlinux kernel: [drm] initializing kernel modesetting
(POLARIS10 0x1002:0x67DF 0x1462:0x3417 0xE7).
bal. 27 15:46:49 archlinux kernel: [drm] register mmio base: 0xF7C00000
bal. 27 15:46:49 archlinux kernel: [drm] register mmio size: 262144
bal. 27 15:46:49 archlinux kernel: [drm] add ip block number 0 <vi_common>
bal. 27 15:46:49 archlinux kernel: [drm] add ip block number 1 <gmc_v8_0>
bal. 27 15:46:49 archlinux kernel: [drm] add ip block number 2 <tonga_ih>
bal. 27 15:46:49 archlinux kernel: [drm] add ip block number 3 <gfx_v8_0>
bal. 27 15:46:49 archlinux kernel: [drm] add ip block number 4 <sdma_v3_0>
bal. 27 15:46:49 archlinux kernel: [drm] add ip block number 5 <powerplay>
bal. 27 15:46:49 archlinux kernel: [drm] add ip block number 6 <dm>
bal. 27 15:46:49 archlinux kernel: [drm] add ip block number 7 <uvd_v6_0>
bal. 27 15:46:49 archlinux kernel: [drm] add ip block number 8 <vce_v3_0>
bal. 27 15:46:49 archlinux kernel: amdgpu 0000:08:00.0: No more image in the
PCI ROM
bal. 27 15:46:49 archlinux kernel: [drm] UVD is enabled in VM mode
bal. 27 15:46:49 archlinux kernel: [drm] UVD ENC is enabled in VM mode
bal. 27 15:46:49 archlinux kernel: [drm] VCE enabled in VM mode
bal. 27 15:46:49 archlinux kernel: [drm] vm size is 512 GB, 2 levels, block
size is 10-bit, fragment size is 9-bit
bal. 27 15:46:49 archlinux kernel: amdgpu 0000:08:00.0: VRAM: 8192M
0x000000F400000000 - 0x000000F5FFFFFFFF (8192M used)
bal. 27 15:46:49 archlinux kernel: amdgpu 0000:08:00.0: GART: 256M
0x000000FF00000000 - 0x000000FF0FFFFFFF
bal. 27 15:46:49 archlinux kernel: [drm] Detected VRAM RAM=8192M, BAR=256M
bal. 27 15:46:49 archlinux kernel: [drm] RAM width 256bits GDDR5
bal. 27 15:46:49 archlinux kernel: [drm] amdgpu: 8192M of VRAM memory ready
bal. 27 15:46:49 archlinux kernel: [drm] amdgpu: 8192M of GTT memory ready.
bal. 27 15:46:49 archlinux kernel: [drm] GART: num cpu pages 65536, num gpu
pages 65536
bal. 27 15:46:49 archlinux kernel: [drm] PCIE GART of 256M enabled (table at
0x000000F400300000).
bal. 27 15:46:49 archlinux kernel: [drm] Chained IB support enabled!
bal. 27 15:46:49 archlinux kernel: amdgpu: [powerplay] hwmgr_sw_init smu backed
is polaris10_smu
bal. 27 15:46:49 archlinux kernel: [drm] Found UVD firmware Version: 1.130
Family ID: 16
bal. 27 15:46:49 archlinux kernel: [drm] Found VCE firmware Version: 53.26
Binary ID: 3
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB: values for Engine clock
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         300000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         600000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         927000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         1179000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         1251000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         1294000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         1339000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         1380000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB: Validation clocks:
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:    engine_max_clock: 138000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:    memory_max_clock: 200000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:    level           : 8
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB: values for Memory clock
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         300000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         1000000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:         2000000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB: Validation clocks:
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:    engine_max_clock: 138000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:    memory_max_clock: 200000
bal. 27 15:46:49 archlinux kernel: [drm] DM_PPLIB:    level           : 8
bal. 27 15:46:49 archlinux kernel: [drm] Display Core initialized with v3.2.69!
bal. 27 15:46:49 archlinux kernel: [drm] Supports vblank timestamp caching Rev
2 (21.10.2013).
bal. 27 15:46:49 archlinux kernel: [drm] Driver supports precise vblank
timestamp query.
bal. 27 15:46:49 archlinux kernel: [drm] UVD and UVD ENC initialized
successfully.
bal. 27 15:46:49 archlinux kernel: [drm] VCE initialized successfully.
bal. 27 15:46:49 archlinux kernel: [drm] fb mappable at 0xE0830000
bal. 27 15:46:49 archlinux kernel: [drm] vram apper at 0xE0000000
bal. 27 15:46:49 archlinux kernel: [drm] size 14745600
bal. 27 15:46:49 archlinux kernel: [drm] fb depth is 24
bal. 27 15:46:49 archlinux kernel: [drm]    pitch is 10240
bal. 27 15:46:49 archlinux kernel: fbcon: amdgpudrmfb (fb0) is primary device
bal. 27 15:46:49 archlinux kernel: amdgpu 0000:08:00.0: fb0: amdgpudrmfb frame
buffer device
bal. 27 15:46:49 archlinux systemd-modules-load[471]: Inserted module 'amdgpu'
bal. 27 15:46:49 archlinux kernel: [drm] Initialized amdgpu 3.36.0 20150101 for
0000:08:00.0 on minor 0
bal. 27 15:46:54 rk-PC systemd[1]: Condition check resulted in Load Kernel
Module drm being skipped.
bal. 27 15:46:55 rk-PC kernel: snd_hda_intel 0000:08:00.1: bound 0000:08:00.0
(ops amdgpu_dm_audio_component_bind_ops [amdgpu])
bal. 27 15:46:58 rk-PC kernel: amdgpu 0000:08:00.0: vgaarb: changed VGA
decodes: olddecodes=io+mem,decodes=none:owns=io+mem

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
