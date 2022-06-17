Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A323054FF77
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 23:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA87610E0D2;
	Fri, 17 Jun 2022 21:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4A910E0D2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:44:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7365CB82BAF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30B52C3411D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655502286;
 bh=8yvQED+1vCGHcCR41OKVlH94FxBhNRwPJqDSasBwjRA=;
 h=From:To:Subject:Date:From;
 b=hdiB1G63CnMLTbAelrnC8rHNO3dsM4CiAhD8oSDZOgIB8AZHMajt9PNf/or7zZka6
 H7aamHNlIYfnuFp19a5fT5llXbS15U/0/rMl7G1MTLZHxdq6ya4f691OjzJdo9Os++
 L032WcOVVO7v7xdzdu+XkEwU32K0fiODCeF5ryLnWtcojwXrduBU9EAMpKHyGmn868
 W8FsvAqDOANRoThRq0xnUg6cZdECN9J32a+tUCKwLNIdco1ppHb8BigzK7T+CsiWqi
 7pfVYWRQQKB7zBIkBUY3yWHkfeQASCR6PO5LRZovgE3fVQuptXirfxRXid745yZNfm
 5nYNYWa8l0j2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1A50ACC13B1; Fri, 17 Jun 2022 21:44:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] New: [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Fri, 17 Jun 2022 21:44:45 +0000
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
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

            Bug ID: 216143
           Summary: [bisected] garbled screen when starting X + dmesg
                    cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR*
                    Failed in the dependencies handling -1431655766!"
           Product: Drivers
           Version: 2.5
    Kernel Version: v5.19-rc2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: airlied@linux.ie
        Regression: Yes

Created attachment 301196
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301196&action=3Dedit
kernel dmesg (kernel 5.19-rc2, AMD Ryzen 9 5950X)

Starting with kernel v5.18 series I get a severly garbled screen on my syst=
em
and lotsa "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies
handling -1431655766!" in dmesg. Kernel v5.19-rc2 still got this flaw.

Kernel dmesg looks like that:
[...]
[drm] Initialized amdgpu 3.47.0 20150101 for 0000:09:00.0 on minor 0
fbcon: amdgpudrmfb (fb0) is primary device
[drm] DSC precompute is not needed.
Console: switching to colour frame buffer device 240x67
amdgpu 0000:09:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling =
-22!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[...]

Apart from that the machine runs fine without X. Xorg.0.log states X also g=
ets
started, seeminlgy without problems.

Kernel v5.17 series was all good so I did a bisect which revealed this as 1=
st
bad commit:

 # git bisect good
c18a2a280c073f70569a91ef0d7434d12e66e200 is the first bad commit
commit c18a2a280c073f70569a91ef0d7434d12e66e200
Merge: 70da382e1c5b 94f4c4965e55
Author: Dave Airlie <airlied@redhat.com>
Date:   Sat Apr 23 15:00:33 2022 +1000

    Merge tag 'drm-misc-fixes-2022-04-22' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

    Two fixes for the raspberrypi panel initialisation, one fix for a logic
    inversion in radeon, a build and pm refcounting fix for vc4, two reverts
    for drm_of_get_bridge that caused a number of regression and a locking
    regression for amdgpu.

    Signed-off-by: Dave Airlie <airlied@redhat.com>

    From: Maxime Ripard <maxime@cerno.tech>
    Link:
https://patchwork.freedesktop.org/patch/msgid/20220422084403.2xrhf3jusdej5y=
o4@houat

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |   1 +
 drivers/gpu/drm/drm_of.c                           |  84 +++----
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |  13 +-
 drivers/gpu/drm/radeon/radeon_sync.c               |   2 +-
 drivers/gpu/drm/vc4/Kconfig                        |   3 +
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  43 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   7 +-
 include/linux/dma-buf-map.h                        | 266 -----------------=
----
 12 files changed, 94 insertions(+), 358 deletions(-)
 delete mode 100644 include/linux/dma-buf-map.h


Some data about the machine:

 # lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse Ro=
ot
Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Starship/Matisse IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse GPP
Bridge
00:01.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse GPP
Bridge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse GPP
Bridge
00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:05.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:07.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:07.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse
Internal PCIe GPP Bridge 0 to bus[E:B]
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse
Internal PCIe GPP Bridge 0 to bus[E:B]
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 61)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 7
01:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc. A=
2000
NVMe SSD (rev 03)
02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 400 Series Chips=
et
USB 3.1 XHCI Controller (rev 01)
02:00.1 SATA controller: Advanced Micro Devices, Inc. [AMD] 400 Series Chip=
set
SATA Controller (rev 01)
02:00.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset P=
CIe
Bridge (rev 01)
03:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset P=
CIe
Port (rev 01)
03:01.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset P=
CIe
Port (rev 01)
03:04.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset P=
CIe
Port (rev 01)
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411
PCI Express Gigabit Ethernet Controller (rev 15)
07:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstr=
eam
Port of PCI Express Switch (rev c5)
08:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Downstream Port of PCI Express Switch
09:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
14 [Radeon RX 5500/5500M / Pro 5500M] (rev c5)
09:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 HDMI A=
udio
0a:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Starship/Matisse PCIe Dummy Function
0b:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Starship/Matisse Reserved SPP
0b:00.1 Encryption controller: Advanced Micro Devices, Inc. [AMD]
Starship/Matisse Cryptographic Coprocessor PSPCPP
0b:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 =
Host
Controller
0b:00.4 Audio device: Advanced Micro Devices, Inc. [AMD] Starship/Matisse HD
Audio Controller

 # lspci -v -s 09:00.0
09:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
14 [Radeon RX 5500/5500M / Pro 5500M] (rev c5) (prog-if 00 [VGA controller])
        Subsystem: ASRock Incorporation Navi 14 [Radeon RX 5500/5500M / Pro
5500M]
        Flags: bus master, fast devsel, latency 0, IRQ 81, IOMMU group 18
        Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D2M]
        I/O ports at e000 [size=3D256]
        Memory at c0300000 (32-bit, non-prefetchable) [size=3D512K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [200] Physical Resizable BAR
        Capabilities: [240] Power Budgeting <?>
        Capabilities: [270] Secondary PCI Express
        Capabilities: [2a0] Access Control Services
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Capabilities: [320] Latency Tolerance Reporting
        Capabilities: [400] Data Link Feature <?>
        Capabilities: [410] Physical Layer 16.0 GT/s <?>
        Capabilities: [440] Lane Margining at the Receiver <?>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

 # inxi -bZ
System:
  Host: supah Kernel: 5.19.0-rc2-Zen3 x86_64 bits: 64 Console: pty pts/0
    Distro: Gentoo Base System release 2.8
Machine:
  Type: Desktop Mobo: ASRock model: B450M Steel Legend serial: M80-D1005301=
508
    UEFI: American Megatrends v: P4.30 date: 02/25/2022
CPU:
  Info: 16-core AMD Ryzen 9 5950X [MT MCP] speed (MHz): avg: 616 min/max:
550/5084
Graphics:
  Device-1: AMD Navi 14 [Radeon RX 5500/5500M / Pro 5500M] driver: amdgpu v:
kernel
  Display: server: X.org 1.21.1.3 driver: loaded: amdgpu,ati unloaded:
fbdev,modesetting,radeon
    tty: 211x54
  Message: Advanced graphics data unavailable in console for root.
Network:
  Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet driver:
r8169

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
