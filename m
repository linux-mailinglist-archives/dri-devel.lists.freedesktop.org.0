Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A2149867
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2020 02:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869E16E0F7;
	Sun, 26 Jan 2020 01:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7886E0F7
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 01:41:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206309] New: Experimental amdgpu w/ Dell E6540 with HD 8790M
 (MARS XTX), massive performance improvement after ACPI suspend
Date: Sun, 26 Jan 2020 01:41:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: changhaitravis@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206309-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206309

            Bug ID: 206309
           Summary: Experimental amdgpu w/ Dell E6540 with HD 8790M (MARS
                    XTX), massive performance improvement after ACPI
                    suspend
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.12-200.fc31.x86_64
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: changhaitravis@gmail.com
        Regression: No

Hi, 
I have a Dell E6540 with HD 8790M (MARS XTX)
I also have the `radeon.si_support=0 amdgpu.si_support=1` kernel flags set to
enable experimental amdgpu support.

I run games such as Insurgency, Tomb Raider (2013), Talos Principle, and
Half-Life 2 Episode 1 from it with the `DRI_PRIME=1` env variable.

On all of these games, they seem to perform underwhelmingly (under 30fps for
most games), until I suspend the computer and wake it from suspension. (This
even works while in game).

Here are some things I've noticed:
1. setting the `amdgpu.dpm=0` kernel flag makes it so that suspending the
computer and waking it up DOES NOT double/triple the gaming graphics
performance like it usually does.
2. setting `/sys/class/drm/card1/device/power_dpm_force_performance_level` or
`/sys/class/drm/card1/device/power_dpm_state` before having suspended the
computer does not noticeably impact performance.
3. If I reboot the computer after having suspended it, instead of shutting down
or hibernating, it seems to at least sometime hold on to its gaming graphics
performance so that I don't need to suspend the computer once more while
playing a game.
4. This suspend-wakeup performance improvement does not seem reproducible on
RadeonSI (`radeon.si_support=1`), although I can't tell if it's lower
performance or higher, since it'll perform well in Half-Life 2, but closer to
the reduced (pre-suspend) performance state in many other games.
5. Wayland or X11 makes no difference.
6. Games using the Intel IGP are not affected by suspend + wake.

In the below Log's dmesg, I suspend and wake up the computer at ~1588

LOG:
[travis@Claes ~]$ dmesg | grep -E -i "dpm|amdgpu|radeon"
[    0.000000] Command line:
BOOT_IMAGE=(hd0,msdos2)/vmlinuz-5.4.12-200.fc31.x86_64
root=/dev/mapper/altarus-root ro resume=/dev/mapper/altarus-swap
rd.lvm.lv=altarus/root rd.lvm.lv=altarus/swap rhgb quiet radeon.si_support=0
amdgpu.si_support=1 zswap.enabled=1 zswap.compressor=lz4 zswap.zpool=z3fold
amdgpu.dpm=1 amdgpu.dc=1
[    0.129882] Kernel command line:
BOOT_IMAGE=(hd0,msdos2)/vmlinuz-5.4.12-200.fc31.x86_64
root=/dev/mapper/altarus-root ro resume=/dev/mapper/altarus-swap
rd.lvm.lv=altarus/root rd.lvm.lv=altarus/swap rhgb quiet radeon.si_support=0
amdgpu.si_support=1 zswap.enabled=1 zswap.compressor=lz4 zswap.zpool=z3fold
amdgpu.dpm=1 amdgpu.dc=1
[    3.018497] [drm] radeon kernel modesetting enabled.
[    3.018785] radeon 0000:01:00.0: SI support disabled by module param
[    3.271878] [drm] amdgpu kernel modesetting enabled.
[    3.272148] amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: bar 0:
0xe0000000 -> 0xefffffff
[    3.272149] amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: bar 2:
0xf7c00000 -> 0xf7c3ffff
[    3.272158] amdgpu 0000:01:00.0: enabling device (0000 -> 0003)
[    3.272841] [drm] add ip block number 5 <si_dpm>
[    3.272843] amdgpu 0000:01:00.0: kfd not supported on this ASIC
[    3.306053] amdgpu 0000:01:00.0: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[    3.306054] amdgpu 0000:01:00.0: GART: 1024M 0x000000FF00000000 -
0x000000FF3FFFFFFF
[    3.306399] [drm] amdgpu: 2048M of VRAM memory ready
[    3.306401] [drm] amdgpu: 3072M of GTT memory ready.
[    3.306899] amdgpu 0000:01:00.0: PCIE GART of 1024M enabled (table at
0x000000F400000000).
[    3.307310] [drm] amdgpu: dpm initialized
[    3.307352] [drm] AMDGPU Display Connectors
[    3.878634] [drm] Initialized amdgpu 3.35.0 20150101 for 0000:01:00.0 on
minor 1
[   12.958605] amdgpu 0000:01:00.0: PCIE GART of 1024M enabled (table at
0x000000F400000000).
[   27.123524] amdgpu 0000:01:00.0: PCIE GART of 1024M enabled (table at
0x000000F400000000).
[ 1588.479472] amdgpu 0000:01:00.0: PCIE GART of 1024M enabled (table at
0x000000F400000000).
[ 1590.890634] amdgpu 0000:01:00.0: PCIE GART of 1024M enabled (table at
0x000000F400000000).
[ 1676.994027] amdgpu 0000:01:00.0: PCIE GART of 1024M enabled (table at
0x000000F400000000).

[travis@Claes ~]$ DRI_PRIME=1 glxinfo -B
name of display: :1
display: :1  screen: 0
direct rendering: Yes
Extended renderer info (GLX_MESA_query_renderer):
    Vendor: X.Org (0x1002)
    Device: AMD Radeon HD 8790M (OLAND, DRM 3.35.0, 5.4.12-200.fc31.x86_64,
LLVM 9.0.0) (0x6606)
    Version: 19.2.8
    Accelerated: yes
    Video memory: 2048MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.5
    Max compat profile version: 4.5
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.2
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2039 MB, largest block: 2039 MB
    VBO free aux. memory - total: 3055 MB, largest block: 3055 MB
    Texture free memory - total: 2039 MB, largest block: 2039 MB
    Texture free aux. memory - total: 3055 MB, largest block: 3055 MB
    Renderbuffer free memory - total: 2039 MB, largest block: 2039 MB
    Renderbuffer free aux. memory - total: 3055 MB, largest block: 3055 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 2048 MB
    Total available memory: 5120 MB
    Currently available dedicated video memory: 2039 MB
OpenGL vendor string: X.Org
OpenGL renderer string: AMD Radeon HD 8790M (OLAND, DRM 3.35.0,
5.4.12-200.fc31.x86_64, LLVM 9.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.8
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.2.8
OpenGL shading language version string: 4.50
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile

OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.2.8
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20

[travis@Claes ~]$ lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor
Integrated Graphics Controller (rev 06)
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Mars
XTX [Radeon HD 8790M]

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
