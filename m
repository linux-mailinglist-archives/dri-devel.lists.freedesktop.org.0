Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5686656927
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 10:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466E710E158;
	Tue, 27 Dec 2022 09:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1601010E158
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 09:53:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A47F61005
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 09:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBD7AC433B4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672134749;
 bh=/3mDkEmrnQOo9fEJ3Iy2bKG4BZcuGtGOBZ4tP+awRNs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nf0iJPYVIkxeQVpwr7kuVCGQZrDmMexoAJ7bAH+vBbhSjEA3hSp3E3k6IUNN/hjtW
 P5Y9k7vaa4fRxOamaKRLduurLdpD/QTSzyscQFRV+Y4PNni9jgZMq2dtQNSXUrlpN+
 2SUs4kE5ZTWT+j1bglqPBuW/fzkU16WseXSv6W3FTeSkkHODxzTHhYeKySezxAG1gp
 cy7QZ4QtFttJZTTtdy/ElMguevG1RIlkaghk10TjxTOgIcXqsBdhiGRXHhHZXDT98l
 qO7MpUlQr2pSau4m7dZ5/ovvcTG6hchJVy8+KVh6wvKOFjReMPSi+BVOuDm/cwl3yB
 YJd9mo+U92aGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D9A7BC070C6; Tue, 27 Dec 2022 09:52:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Tue, 27 Dec 2022 09:52:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: milasudril@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-Xk82bMyVkp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

milasudril@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |milasudril@gmail.com

--- Comment #51 from milasudril@gmail.com ---
Too me, it appears that the problem is related to driver initialization. It=
 may
start in a "good" state: Everything works normally. In "bad" state, the des=
ktop
hangs almost immediately. Trying to restart the display server by issuing

sudo service lightdm stop
sudo service lightdm start

from a separate TTY, makes it possible to log in again, but interaction with
the desktop is locked (tried to restart lightdm twice on the same boot).
However rebooting the machine

sudo shutdown -r now

solves the issue.

Output from glmark2 (working session)

$ glmark2 --fullscreen
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    glmark2 2021.02
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    OpenGL Information
    GL_VENDOR:     AMD
    GL_RENDERER:   AMD RENOIR (LLVM 13.0.1, DRM 3.42, 5.15.0-56-generic)
    GL_VERSION:    4.6 (Compatibility Profile) Mesa 22.0.5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[build] use-vbo=3Dfalse: FPS: 5844 FrameTime: 0.171 ms
[build] use-vbo=3Dtrue: FPS: 6231 FrameTime: 0.160 ms
[texture] texture-filter=3Dnearest: FPS: 3976 FrameTime: 0.252 ms
[texture] texture-filter=3Dlinear: FPS: 4048 FrameTime: 0.247 ms
[texture] texture-filter=3Dmipmap: FPS: 3958 FrameTime: 0.253 ms
[shading] shading=3Dgouraud: FPS: 4050 FrameTime: 0.247 ms
[shading] shading=3Dblinn-phong-inf: FPS: 3709 FrameTime: 0.270 ms
[shading] shading=3Dphong: FPS: 3674 FrameTime: 0.272 ms
...


Output from neofetch:

OS: Linux Mint 21 x86_64=20
Kernel: 5.15.0-56-generic=20
Uptime: 31 mins=20
Packages: 2846 (dpkg)=20
Shell: bash 5.1.16=20
Resolution: 1920x1200=20
DE: Xfce 4.16=20
WM: Xfwm4=20
WM Theme: Kokodi=20
Theme: Adwaita [GTK2], Mint-Y [GTK3]=20
Icons: elementary-xfce [GTK2/3]=20
Terminal: xfce4-terminal=20
Terminal Font: Monospace 12=20
CPU: AMD Ryzen 5 5600G with Radeon Graphics (12) @ 4.464GHz=20
GPU: AMD ATI 06:00.0 Cezanne=20
Memory: 2713MiB / 31392MiB


Kernel log (successful session):

[    0.000000] Linux version 5.15.0-56-generic (buildd@lcy02-amd64-004) (gcc
(Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.3=
8)
#62-Ubuntu SMP Tue Nov 22 19:54:14 UTC 2022 (Ubuntu 5.15.0-56.62-generic
5.15.64)
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-5.15.0-56-generic
root=3DUUID=3Db0fcb5e6-59cb-4170-b692-4a944660fea9 ro quiet splash


AMD related messages in kernel log (successful session):

[    0.004719] ACPI: IVRS 0x00000000C453D000 0000D0 (v02 AMD    AmdTable
00000001 AMD  00000001)
[    0.004721] ACPI: SSDT 0x00000000C4535000 00723C (v02 AMD    Artic=20=20=
=20
00000002 MSFT 04000000)
[    0.004723] ACPI: SSDT 0x00000000C4531000 003B1B (v01 AMD    AMD AOD=20
00000001 INTL 20120913)
[    0.004733] ACPI: VFCT 0x00000000C4510000 00D884 (v01 ALASKA A M I=20=20=
=20
00000001 AMD  31504F47)
[    0.004740] ACPI: SSDT 0x00000000C4430000 003E88 (v02 AMD    AmdTable
00000001 AMD  00000001)
[    0.004742] ACPI: CRAT 0x00000000C442F000 000B68 (v01 AMD    AmdTable
00000001 AMD  00000001)
[    0.004744] ACPI: CDIT 0x00000000C442E000 000029 (v01 AMD    AmdTable
00000001 AMD  00000001)
[    0.004745] ACPI: SSDT 0x00000000C442D000 000D53 (v01 AMD    ArticIG2
00000001 INTL 20120913)
[    0.004747] ACPI: SSDT 0x00000000C442B000 0010AC (v01 AMD    ArticTPX
00000001 INTL 20120913)
[    0.004749] ACPI: SSDT 0x00000000C4427000 003EAC (v01 AMD    ArticN=20=20
00000001 INTL 20120913)
[    0.004754] ACPI: SSDT 0x00000000C4424000 00007D (v01 AMD    ArticDIS
00000001 INTL 20120913)
[    0.004756] ACPI: SSDT 0x00000000C4423000 0000BF (v01 AMD    AmdTable
00001000 INTL 20120913)
[    0.281466] smpboot: CPU0: AMD Ryzen 5 5600G with Radeon Graphics (famil=
y:
0x19, model: 0x50, stepping: 0x0)
[    0.281562] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.354135] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters support=
ed
[    0.355644] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    0.355646] AMD-Vi: Extended features (0x206d73ef22254ade): PPR X2APIC N=
X GT
IA GA PC GA_vAPIC
[    0.355650] AMD-Vi: Interrupt remapping enabled
[    0.355650] AMD-Vi: Virtual APIC enabled
[    0.355651] AMD-Vi: X2APIC enabled
[    0.668679] perf: AMD IBS detected (0x000003ff)
[    0.668689] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4
counters/bank).
[    0.911894] powernow_k8: WTF driver: amd-pstate
[    3.455327] AMD-Vi: AMD IOMMUv2 loaded and initialized
[    3.541930] [drm] amdgpu kernel modesetting enabled.
[    3.547290] amdgpu: Virtual CRAT table created for CPU
[    3.547297] amdgpu: Topology: Add CPU node
[    3.547424] amdgpu 0000:06:00.0: vgaarb: deactivate vga console
[    3.547457] amdgpu 0000:06:00.0: enabling device (0006 -> 0007)
[    3.547487] amdgpu 0000:06:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re
enabled
[    3.548618] amdgpu 0000:06:00.0: amdgpu: Fetched VBIOS from VFCT
[    3.548619] amdgpu: ATOM BIOS: 113-CEZANNE-018
[    3.548662] amdgpu 0000:06:00.0: amdgpu: VRAM: 512M 0x000000F400000000 -
0x000000F41FFFFFFF (512M used)
[    3.548663] amdgpu 0000:06:00.0: amdgpu: GART: 1024M 0x0000000000000000 -
0x000000003FFFFFFF
[    3.548664] amdgpu 0000:06:00.0: amdgpu: AGP: 267419648M 0x000000F800000=
000
- 0x0000FFFFFFFFFFFF
[    3.548692] [drm] amdgpu: 512M of VRAM memory ready
[    3.548693] [drm] amdgpu: 3072M of GTT memory ready.
[    3.548950] amdgpu 0000:06:00.0: amdgpu: PSP runtime database doesn't ex=
ist
[    3.549881] amdgpu 0000:06:00.0: amdgpu: Will use PSP to load VCN firmwa=
re
[    4.356150] amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[    4.364793] amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot
available
[    4.364794] amdgpu 0000:06:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[    4.365686] amdgpu 0000:06:00.0: amdgpu: SMU is initialized successfully!
[    4.407573] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    4.432951] amdgpu: HMM registered 512MB device memory
[    4.432973] amdgpu: SRAT table not found
[    4.432974] amdgpu: Virtual CRAT table created for GPU
[    4.433026] amdgpu: Topology: Add dGPU node [0x1638:0x1002]
[    4.433029] kfd kfd: amdgpu: added device 1002:1638
[    4.433141] amdgpu 0000:06:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 8,
active_cu_number 7
[    4.434102] fbcon: amdgpudrmfb (fb0) is primary device
[    4.434104] amdgpu 0000:06:00.0: [drm] fb0: amdgpudrmfb frame buffer dev=
ice
[    4.455810] amdgpu 0000:06:00.0: amdgpu: ring gfx uses VM inv eng 0 on h=
ub 0
[    4.455813] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1
on hub 0
[    4.455814] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4
on hub 0
[    4.455814] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 5
on hub 0
[    4.455815] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 6
on hub 0
[    4.455815] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 7
on hub 0
[    4.455816] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 8
on hub 0
[    4.455817] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 9
on hub 0
[    4.455817] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 10
on hub 0
[    4.455818] amdgpu 0000:06:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng =
11
on hub 0
[    4.455824] amdgpu 0000:06:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on=
 hub
1
[    4.455824] amdgpu 0000:06:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 =
on
hub 1
[    4.455825] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4=
 on
hub 1
[    4.455826] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5=
 on
hub 1
[    4.455827] amdgpu 0000:06:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6=
 on
hub 1
[    4.456973] [drm] Initialized amdgpu 3.42.0 20150101 for 0000:06:00.0 on
minor 0
[   12.556190] snd_hda_intel 0000:06:00.1: bound 0000:06:00.0 (ops
amdgpu_dm_audio_component_bind_ops [amdgpu])

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
