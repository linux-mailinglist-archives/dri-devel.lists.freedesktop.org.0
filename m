Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DE14D838
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 10:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62E16F933;
	Thu, 30 Jan 2020 09:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FAE6F933
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 09:24:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206351] New: RX 5600 XT Not Correctly Recognized, Max Memory
 Frequency Below Where it Should Be
Date: Thu, 30 Jan 2020 09:24:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gardotd426@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206351-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206351

            Bug ID: 206351
           Summary: RX 5600 XT Not Correctly Recognized, Max Memory
                    Frequency Below Where it Should Be
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.0, 5.4.14
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: gardotd426@gmail.com
        Regression: No

Created attachment 287033
  --> https://bugzilla.kernel.org/attachment.cgi?id=287033&action=edit
glxinfo output

NOTE: I hope DRI- non-intel is the correct component for this bug. I wasn't
sure whether to file it under that, or under console/framebuffers

My 5600 XT is not correctly recognized as such by my Arch Linux system. Some
applications and system utilities report it as "UNKNOWN AMD GPU," Some report
it just as "RADV/NAVI10 GPU," "AMD NAVI10" by glxinfo, and others, such as
inxi, report it as a "RADEON RX 5700 / 5700 XT." This occurs regardless of
vBIOS version, on both performance and silent vBIOS, also on both the original
vBIOS and the "upgraded" one AMD pushed out right before launch. Also, the max
memory frequency on this card is supposed to be 1500MHz, which it shows in
Windows, but on Linux the memory range is shown as 625-930MHz (and that's with
amdgpu.ppfeaturemask set). There are also multiple rendering issues, but I've
filed a report with mesa for those.


I know there's supposed to be a new firmware release that's supposed to fix the
performance issues with the new vBIOS, but this isn't a performance issue, and
it's present even with the original vBIOS (that had no reported performance
issues). It seems this is a matter of the 5600 XT's compatibility  not properly
being built into the kernel yet (which is to be expected since it's so new).
However I will say that with my 3200G Ryzen processor that I got within a month
of it's launch, it was properly recognized and it's frequency limits were also
properly recognized and implemented. 

inxi -Gxxz:
Graphics:
  Device-1: AMD Navi 10 [Radeon RX 5700 / 5700 XT] vendor: Sapphire Limited 
  driver: amdgpu v: kernel bus ID: 09:00.0 chip ID: 1002:731f 
  Display: x11 server: X.Org 1.20.7 driver: amdgpu compositor: kwin_x11 
  resolution: 1366x768~60Hz, 1920x1080~60Hz 
  OpenGL: renderer: AMD NAVI10 (DRM 3.36.0 5.5.0-3-tkg-pds LLVM 9.0.1) 
  v: 4.6 Mesa 20.0.0-devel (git-6e1411c9e8) direct render: Yes

sudo cat /sys/class/drm/card0/device/pp_od_clk_voltage:
 OD_SCLK:
0: 800Mhz
1: 1780Mhz
OD_MCLK:
1: 900MHz
OD_VDDC_CURVE:
0: 800MHz @ 0mV
1: 1290MHz @ 0mV
2: 1780MHz @ 0mV
OD_RANGE:
SCLK:     800Mhz       1820Mhz
MCLK:     625Mhz        930Mhz
VDDC_CURVE_SCLK[0]:     800Mhz       1820Mhz
VDDC_CURVE_VOLT[0]:     800mV        1050mV
VDDC_CURVE_SCLK[1]:     800Mhz       1820Mhz
VDDC_CURVE_VOLT[1]:     800mV        1050mV
VDDC_CURVE_SCLK[2]:     800Mhz       1820Mhz
VDDC_CURVE_VOLT[2]:     800mV        1050mV


vulkaninfo | grep -i "AMD GPU":
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
                GPU id  : 0 (Unknown AMD GPU)
                GPU id  : 1 (Unknown AMD GPU)
GPU id : 0 (Unknown AMD GPU):
GPU id : 1 (Unknown AMD GPU):
GPU id : 0 (Unknown AMD GPU):
GPU id : 1 (Unknown AMD GPU):
                        Unknown AMD GPU (ID: 0)
                Unknown AMD GPU (ID: 0)
                        Unknown AMD GPU (ID: 0)
                        Unknown AMD GPU (ID: 0)
                Unknown AMD GPU (ID: 0)
                        Unknown AMD GPU (ID: 0)
        deviceName     = Unknown AMD GPU
        deviceName     = Unknown AMD GPU


sudo pacman -Q linux-firmware:
linux-firmware 20191220.6871bff-1


Kernels: issue persists across at least 5 different kernels. linux-zen-5.4.14,
linux-fsync-5.4.14, linux-5.4.14, linux-amd-staging-drm-next-git-5.5,
linux-55-tkg-pds (TK-Glitch custom kernel). I've also attached the output of
glxinfo, as it was far to long to include in this post and it still be
readable. I'm happy to provide any other information needed, as well as help
with testing patches or doing any debugging necessary. Whatever I can do to
help.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
