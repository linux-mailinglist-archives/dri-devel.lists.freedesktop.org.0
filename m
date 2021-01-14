Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F76F2F6AC7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 20:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5C989F92;
	Thu, 14 Jan 2021 19:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8207D89F92
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 19:20:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0764423B40;
 Thu, 14 Jan 2021 19:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610652058;
 bh=RqVCL5R8u/uiaCf/QQG+CR/jl+1+F4XOpwQKBqz7ZEU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=I2PivtTkIbmElL1nDEsoNWNYVisYbzDom+ou3cor+tQigc1unPLaILWshIO5lt080
 qZU8hLPX0sX7CmqHoFoPScbFBXZWVE55zGaoFIFmj3/vNLrpwOprVoZAvrEVdNmlzV
 JfnW1B5BwoTLF7mPFKGYCE2XpnJ3WCAXeT5oiUfsr7Mn7plBcnV/otXX0J9PasUkQw
 5WOs2fRrS9Baafg1vL87ORZaIfavot2zQl5B1wT1suukPbi6T2tuZDBqjpjfmSUucw
 rNL13dvKOxLsNSX6HGujdLNbtTKTbcdLFPxqDQtl+qXZG4KYUpBXjVj4eFS3II2wqj
 jU5dGSedjy5sQ==
Date: Thu, 14 Jan 2021 13:20:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Dominik Mierzejewski <dominik@greysector.net>
Subject: Re: [Bug 211189] New: vgaarb overrides boot device unexpectedly with
 Intel and discrete AMDGPU
Message-ID: <20210114192056.GA2013381@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-211189-41252@https.bugzilla.kernel.org/>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[cc'd efifb and vgaarb maintainers on bugzilla, but not sure whether
people pay attention to that]

On Thu, Jan 14, 2021 at 10:42:53AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D211189
> =

>             Bug ID: 211189
>            Summary: vgaarb overrides boot device unexpectedly with Intel
>                     and discrete AMDGPU
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.10.7-200.fc33.x86_64
>           Hardware: x86-64
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: PCI
>           Assignee: drivers_pci@kernel-bugs.osdl.org
>           Reporter: dominik@greysector.net
>         Regression: No
> =

> The system is a MSI Z77A-GD65 mainboard configured to boot in UEFI mode.
> Despite setting integrated GPU (from i5-3570K CPU) as the default in firm=
ware
> setup, the kernel sets the discrete GPU (Radeon HD 7950) as boot_vga. This
> results in wrong order in e.g. switcherooctl:
> $ switcherooctl list
> Device: 0
>   Name:        Advanced Micro Devices, Inc. [AMD=AE/ATI] Tahiti PRO [Rade=
on HD
> 7950/8950 OEM / R9 280]
>   Default:     yes
>   Environment: DRI_PRIME=3Dpci-0000_01_00_0
> =

> Device: 1
>   Name:        Intel=AE HD Graphics 4000
>   Default:     no
>   Environment: DRI_PRIME=3Dpci-0000_00_02_0
> $ lspci -vnn
> ...
> 00:02.0 VGA compatible controller [0300]: Intel Corporation Xeon E3-1200 =
v2/3rd
> Gen Core processor Graphics Controller [8086:0162] (rev 09) (prog-if 00 [=
VGA
> controller])
>         DeviceName:  Onboard IGD
>         Subsystem: Micro-Star International Co., Ltd. [MSI] Device [1462:=
2111]
>         Flags: bus master, fast devsel, latency 0, IRQ 31
>         Memory at f7800000 (64-bit, non-prefetchable) [size=3D4M]
>         Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
>         I/O ports at f000 [size=3D64]
>         Capabilities: [90] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
>         Capabilities: [d0] Power Management version 2
>         Capabilities: [a4] PCI Advanced Features
>         Kernel driver in use: i915
>         Kernel modules: i915
> ...
> 01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
> [AMD/ATI] Tahiti PRO [Radeon HD 7950/8950 OEM / R9 280] [1002:679a] (prog=
-if 00
> [VGA controller])
>         Subsystem: Micro-Star International Co., Ltd. [MSI] Device [1462:=
2761]
>         Flags: bus master, fast devsel, latency 0, IRQ 32
>         Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
>         Memory at f7d00000 (64-bit, non-prefetchable) [size=3D256K]
>         I/O ports at e000 [size=3D256]
>         Expansion ROM at 000c0000 [disabled] [size=3D128K]
>         Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
>         Capabilities: [50] Power Management version 3
>         Capabilities: [58] Express Legacy Endpoint, MSI 00
>         Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
>         Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D=
1 Len=3D010
> <?>
>         Capabilities: [150] Advanced Error Reporting
>         Capabilities: [270] Secondary PCI Express
>         Capabilities: [2b0] Address Translation Service (ATS)
>         Capabilities: [2c0] Page Request Interface (PRI)
>         Capabilities: [2d0] Process Address Space ID (PASID)
>         Kernel driver in use: amdgpu
>         Kernel modules: radeon, amdgpu
> =

> $ for f in /sys/bus/pci/devices/*/boot_vga ; do echo -n "$f:" ; cat $f ; =
done
> /sys/bus/pci/devices/0000:00:02.0/boot_vga:0
> /sys/bus/pci/devices/0000:01:00.0/boot_vga:1
> =

> $ dmesg
> ...
> [    0.267216] pci 0000:01:00.0: BAR 0: assigned to efifb

This is from drivers/video/fbdev/efifb.c and makes me wonder if this
is a firmware defect.  You set 00:02.0 to be the default in firmware
setup, but apparently the EFI FB is using 01:00.0?

> [    0.268571] pci 0000:00:02.0: vgaarb: setting as boot VGA device
> [    0.268571] pci 0000:00:02.0: vgaarb: VGA device added:
> decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
> [    0.268571] pci 0000:01:00.0: vgaarb: VGA device added:
> decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
> [    0.268571] pci 0000:00:02.0: vgaarb: no bridge control possible
> [    0.268571] pci 0000:01:00.0: vgaarb: bridge control possible
> [    0.268571] pci 0000:01:00.0: vgaarb: overriding boot device
> [    0.268571] vgaarb: loaded
> [    0.754748] efifb: probing for efifb
> [    0.754766] efifb: No BGRT, not showing boot graphics
> [    0.754768] efifb: framebuffer at 0xe0000000, using 8100k, total 8100k
> [    0.754769] efifb: mode is 1920x1080x32, linelength=3D7680, pages=3D1
> [    0.754770] efifb: scrolling: redraw
> [    0.754772] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
> [    2.984727] i915 0000:00:02.0: vgaarb: changed VGA decodes:
> olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
> [    3.011601] [drm] Initialized i915 1.6.0 20200917 for 0000:00:02.0 on =
minor
> 0
> [    3.213870] [drm] amdgpu kernel modesetting enabled.
> [    3.275739] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer device
> [    3.275972] fb0: switching to amdgpudrmfb from EFI VGA
> [    3.276112] amdgpu 0000:01:00.0: vgaarb: deactivate vga console
> [    3.276240] [drm] initializing kernel modesetting (TAHITI 0x1002:0x679A
> 0x1462:0x2761 0x00).
> ...
> [    4.069577] amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmfb frame buffer d=
evice
> [    4.351324] [drm] Initialized amdgpu 3.40.0 20150101 for 0000:01:00.0 =
on
> minor 1
> =

> -- =

> You may reply to this email to add a comment.
> =

> You are receiving this mail because:
> You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
