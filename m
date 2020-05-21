Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7301DD4B5
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 19:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFDC6E952;
	Thu, 21 May 2020 17:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A66C6E952
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 17:46:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207833] New: Brightness control not working on ASUS TUF FA506IU
 (AMD Ryzen 7 4800H / Nvidia GTX 1660 Ti)
Date: Thu, 21 May 2020 17:46:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: julen.pardo@outlook.es
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207833-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207833

            Bug ID: 207833
           Summary: Brightness control not working on ASUS TUF FA506IU
                    (AMD Ryzen 7 4800H / Nvidia GTX 1660 Ti)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.12-1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: julen.pardo@outlook.es
        Regression: No

Hello,

I've just bought an ASUS TUF FA506IU with and AMD Ryzen 7 4800H / Nvidia GTX
1660 Ti setup. Even if this is quite new hardware, I'd say that the only thing
that is not working at all is the brightness control. It's not working with the
function keys, nor from the energy settings, nor with xbacklight.

Actually, it's working a little; I can find a subtle difference between the max
value and the last 5 values, but that's it. Setting it to the minimum still
makes it way too bright.

I've noticed that this could be a range mismatch between "brightness" and
"max_brightness", and "actual_brightness". First are in 8 bit ranges, whereas
the actual brightness is in 16 bit range. I've tried some luck patching the
kernel to return an 8-bit value
(https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/amd/display/dc/dce/dce_abm.c#L299),
but doing just that doesn't work (even if the "actual_brightness" was showing
an 8 bit value). In my case, the full path is
"/sys/class/backlight/amdgpu_bl1/".

I've also tried different acpi_backlight parameters with no luck.

I leave the output of lsmod | grep asus:


asus_wmi               40960  0
sparse_keymap          16384  1 asus_wmi
rfkill                 28672  9 asus_wmi,bluetooth,cfg80211
battery                24576  1 asus_wmi
wmi                    36864  2 asus_wmi,wmi_bmof
asus_wireless          20480  0


inxi -F:

System:    Host: TUF-FA506IU Kernel: 5.6.12-1-MANJARO x86_64 bits: 64 Desktop:
KDE Plasma 5.18.5 Distro: Manjaro Linux 
Machine:   Type: Laptop System: ASUSTeK product: TUF Gaming FA506IU_FA506IU v:
1.0 serial: <root required> 
           Mobo: ASUSTeK model: FA506IU v: 1.0 serial: <root required> UEFI:
American Megatrends v: FA506IU.302 
           date: 03/04/2020 
Battery:   ID-1: BAT1 charge: 47.9 Wh condition: 47.9/48.1 Wh (100%) 
CPU:       Topology: 8-Core model: AMD Ryzen 7 4800H with Radeon Graphics bits:
64 type: MT MCP L2 cache: 4096 KiB 
           Speed: 2405 MHz min/max: 1400/2900 MHz Core speeds (MHz): 1: 1875 2:
2497 3: 1397 4: 1397 5: 1397 6: 1397 7: 1397 
           8: 1397 9: 1397 10: 1396 11: 2963 12: 1673 13: 1800 14: 1548 15:
1397 16: 1396 
Graphics:  Device-1: NVIDIA TU116M [GeForce GTX 1660 Ti Mobile] driver: nvidia
v: 440.82 
           Device-2: Advanced Micro Devices [AMD/ATI] Renoir driver: amdgpu v:
kernel 
           Display: x11 server: X.Org 1.20.8 driver: amdgpu,nvidia resolution:
1920x1080~144Hz, 2560x1440~60Hz 
           OpenGL: renderer: AMD RENOIR (DRM 3.36.0 5.6.12-1-MANJARO LLVM
10.0.0) v: 4.6 Mesa 20.0.6 
Audio:     Device-1: NVIDIA TU116 High Definition Audio driver: snd_hda_intel 
           Device-2: Advanced Micro Devices [AMD/ATI] driver: snd_hda_intel 
           Device-3: Advanced Micro Devices [AMD]
Raven/Raven2/FireFlight/Renoir Audio Processor driver: N/A 
           Device-4: Advanced Micro Devices [AMD] Family 17h HD Audio driver:
snd_hda_intel 
           Sound Server: ALSA v: k5.6.12-1-MANJARO 
Network:   Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
driver: r8169 
           IF: enp2s0 state: down mac: a8:5e:45:36:94:32 
           Device-2: Realtek RTL8822CE 802.11ac PCIe Wireless Network Adapter
driver: rtw_pci 
           IF: wlp3s0 state: up mac: 70:66:55:09:8c:e3 
Drives:    Local Storage: total: 476.94 GiB used: 32.41 GiB (6.8%) 
           ID-1: /dev/nvme0n1 vendor: Kingston model: OM8PCP3512F-AB size:
476.94 GiB 
Partition: ID-1: / size: 48.97 GiB used: 25.95 GiB (53.0%) fs: ext4 dev:
/dev/nvme0n1p5 
           ID-2: /home size: 108.67 GiB used: 6.46 GiB (5.9%) fs: ext4 dev:
/dev/nvme0n1p7 
           ID-3: swap-1 size: 3.03 GiB used: 0 KiB (0.0%) fs: swap dev:
/dev/nvme0n1p8 
Sensors:   Message: No sensors data was found. Is sensors configured? 
Info:      Processes: 349 Uptime: 27m Memory: 7.20 GiB used: 3.04 GiB (42.2%)
Shell: zsh inxi: 3.0.37

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
