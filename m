Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCC93A0826
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 02:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ABD6E199;
	Wed,  9 Jun 2021 00:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42FC6E199
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 00:09:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AE7276108E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 00:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623197354;
 bh=UvXcUcZ2SULSo8CtcrHGgCWAlZLC1Ix+TBcB2vR9APs=;
 h=From:To:Subject:Date:From;
 b=gAHGbZDbQyEShY09RQB/Ax1Le9q3+adLx/ZbDdESEGlGSjBP8FCzyvvXSLZFVrkQz
 F7BT1DnmdQ8o5/qAMla/665ZEHXu0Z64ur/v4RKjGKjidPXERge8YUfg64OfqIWStA
 e03C4TQ5OUuBmPq0tXUBKo4p5g2WGLKr17xEP5ktodWwPBsFZE1Bb+DgKq4Rs6/mf+
 spWCVSbiaP8iVe/9cPbMIX+MVNFEGvVSjman7zuHZJSuRE3zrc4tTcovXKBjb9L5LH
 tuX+WQiPI1OgIo76fra1O6+1yAVl6mDhLazACnoOzXDM7dUxvO5F8wBTgXO2OturAm
 U+/Z7oZRKrNYg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A3C69610D2; Wed,  9 Jun 2021 00:09:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213373] New: [drm] [radeon] memory leak at parsing
 radeon_atombios_parse_power_table
Date: Wed, 09 Jun 2021 00:09:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213373-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213373

            Bug ID: 213373
           Summary: [drm] [radeon] memory leak at parsing
                    radeon_atombios_parse_power_table
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13-rc5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 297247
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297247&action=3Dedit
output of /sys/kernel/debug/kmemleak

Radeon driver on this machine was defunct from 5.6.x on until the issue was
fixed in bug #211537. What remains after the fix is this memory leak:

unreferenced object 0xffff88810e6c3dc8 (size 96):
  comm "systemd-udevd", pid 136, jiffies 4294895831 (age 1145.117s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 40 56 fe 08 80 88 ff ff  ........@V......
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000010cd8f43>] __kmalloc+0x163/0x1d4
    [<00000000f14786c6>] radeon_atombios_parse_power_table_1_3+0x43f/0x1b1f
[radeon]
    [<00000000638c7538>] radeon_atombios_get_power_modes+0x144/0x1888 [rade=
on]
    [<00000000db824f7d>] radeon_pm_init+0xffd/0x18cc [radeon]
    [<000000007dfbb45f>] rs690_init+0x76e/0x84a [radeon]
    [<0000000035475290>] radeon_device_init+0x1c1a/0x21c1 [radeon]
    [<00000000f4096cf8>] radeon_driver_load_kms+0xf5/0x30b [radeon]
    [<00000000b3f3c46b>] drm_dev_register+0x255/0x4a0 [drm]
    [<00000000da8d532e>] radeon_pci_probe+0x246/0x2f6 [radeon]
    [<00000000667a4010>] pci_device_probe+0x1aa/0x294
    [<00000000435523ff>] really_probe+0x30e/0x850
    [<0000000016679ebc>] driver_probe_device+0x112/0x161
    [<00000000e75e3390>] device_driver_attach+0xc1/0xf8
    [<0000000078c4dcd6>] __driver_attach+0x16b/0x172
    [<000000007d3f0ac0>] bus_for_each_dev+0xfa/0x146
    [<000000008ee66f7b>] bus_add_driver+0x2b3/0x447
unreferenced object 0xffff888008fe5640 (size 64):
  comm "systemd-udevd", pid 136, jiffies 4294895831 (age 1145.117s)
  hex dump (first 32 bytes):
    00 00 00 00 40 9c 00 00 00 00 00 00 00 00 00 00  ....@...........
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000006edcc7c8>] kmem_cache_alloc_trace+0x10f/0x15e
    [<0000000079a5480d>] radeon_atombios_parse_power_table_1_3+0x546/0x1b1f
[radeon]
    [<00000000638c7538>] radeon_atombios_get_power_modes+0x144/0x1888 [rade=
on]
    [<00000000db824f7d>] radeon_pm_init+0xffd/0x18cc [radeon]
    [<000000007dfbb45f>] rs690_init+0x76e/0x84a [radeon]
    [<0000000035475290>] radeon_device_init+0x1c1a/0x21c1 [radeon]
    [<00000000f4096cf8>] radeon_driver_load_kms+0xf5/0x30b [radeon]
    [<00000000b3f3c46b>] drm_dev_register+0x255/0x4a0 [drm]
    [<00000000da8d532e>] radeon_pci_probe+0x246/0x2f6 [radeon]
    [<00000000667a4010>] pci_device_probe+0x1aa/0x294
    [<00000000435523ff>] really_probe+0x30e/0x850
    [<0000000016679ebc>] driver_probe_device+0x112/0x161
    [<00000000e75e3390>] device_driver_attach+0xc1/0xf8
    [<0000000078c4dcd6>] __driver_attach+0x16b/0x172
    [<000000007d3f0ac0>] bus_for_each_dev+0xfa/0x146
    [<000000008ee66f7b>] bus_add_driver+0x2b3/0x447


 # lspci -vv -s 01:05.0
01:05.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
RS690M [Radeon Xpress 1200/1250/1270] (prog-if 00 [VGA controller])
        Subsystem: Gateway, Inc. RS690M [Radeon Xpress 1200/1250/1270]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 32 bytes
        Interrupt: pin A routed to IRQ 26
        Region 0: Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Region 2: Memory at f0100000 (64-bit, non-prefetchable) [size=3D64K]
        Region 4: I/O ports at 9400 [size=3D256]
        Region 5: Memory at f0000000 (32-bit, non-prefetchable) [size=3D1M]
        Expansion ROM at 000c0000 [virtual] [disabled] [size=3D128K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [80] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee01004  Data: 0025
        Kernel driver in use: radeon
        Kernel modules: radeon

 # inxi -bz
System:    Kernel: 5.13.0-rc5-E620 x86_64 bits: 64 Console: tty 0=20
           Distro: Gentoo Base System release 2.7=20
Machine:   Type: Laptop System: eMachines product: eMachines E620 v: V1.03
serial: <filter>=20
           Mobo: eMachines model: Nile serial: <filter> BIOS: eMachines v: =
1.03
date: 09/30/2008=20
Battery:   ID-1: BAT1 charge: N/A condition: N/A=20
CPU:       Info: Dual Core AMD Athlon X2 3250e [MCP] speed: 1496 MHz=20
Graphics:  Device-1: AMD RS690M [Radeon Xpress 1200/1250/1270] driver: rade=
on
v: kernel=20
           Display: server: X.org 1.20.11 driver: ati,radeon unloaded:
fbdev,modesetting tty: 104x57=20
           Message: Advanced graphics data unavailable in console for root.=
=20
Network:   Device-1: Qualcomm Atheros AR242x / AR542x Wireless Network Adap=
ter
driver: ath5k=20
           Device-2: Realtek RTL810xE PCI Express Fast Ethernet driver: r81=
69

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
