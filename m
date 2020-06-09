Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1011F4875
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 22:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2BD6E340;
	Tue,  9 Jun 2020 20:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7160D6E33F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 20:59:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208115] New: amdgpu (likely) - power management and display
 connection problems with an RX590 card
Date: Tue, 09 Jun 2020 20:59:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h_mailinglists@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208115-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208115

            Bug ID: 208115
           Summary: amdgpu (likely) - power management and display
                    connection problems with an RX590 card
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.x.x
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: h_mailinglists@posteo.de
        Regression: No

Created attachment 289583
  --> https://bugzilla.kernel.org/attachment.cgi?id=289583&action=edit
excerpt from dmesg grepping amdgpu

Bug report - power management and display connection problems with an RX590
card

Hello developer team
Please bear with me, it is my first bug report on the actual kernel. 

It _might_ partially be related to
https://bugzilla.kernel.org/show_bug.cgi?id=201139


background / generic info:
I have an AMD RX 590,  which is giving me some severe troubles.

I have a multitude of ATI/AMD cards/APUs in use for years, mostly Gentoo Linux,
a few Deb. derivatives and W32.
RX 590 (PCIe)
RX 560 (PCIe)
HD 5770 (PCIe)
HD 5670 (PCIe)
HD 5450 and the likes (PCI, PCIe)
HD 3870 (PCIe)
Kabini (Athlon 5350) (AM1)
Kabini E-2100 (soldered/BGA)
E-350 (soldered/BGA)
Geode LX ;-)  (soldered/BGA / companion chip)
and more

the very chip/card in question:

Sapphire Nitro+ Radeon RX 590 8G 50th Anniversary, 8192 MB GDDR5
(the golden one)

the following setup it is currently dysfunctional:

RX 590
Zen+ 2700
MSI PC-Mate B-350 (latest FW)
16 GiB RAM
PSU BeQuiet DarkPowerPro 550 (should be strong enough, and problems are on the
low power state side)
Monitor: Eizo EV2436W hooked up via DP

The setup works _nicely_ with a different GPU (e.g. HD 5450, okay, that's not
amdgpu driver, but anyway).
My other actual amdgpu card, the RX 560 (Polaris 11) works like a charm in an
FX 6300 setup.
The very (Eizo) screen also works flawless on my Kabini (though there I have to
use a HDMI-2-DVI adapter connection); also an old Geode LX runs fairly well via
VGA.


software
(Gentoo) Linux (5.x.x kernel; tried various versions over time, dind't really
get much better), libdrm 2.4.9x / 2.4.10x, mesa 19.3.2 or later,
xf86-video-amdgpu 19.1.0


I built a box based on a Ryzen Zen+ 2700, MSI PC-Mate B-350 mainboard. 
While I was setting it up I ran my elderly HD 5670 in it and everything was
fine.
All other cards in that ZEN+ system I tried so far worked like a charm. Severe
video transcoding (CPU based), just "desktopping around", severe compiling
(<-Gentoo): No problem! Power management? No problem!

With the RX 590 it's a sheer pain.


problems:
* GPU not coming back once monitor goes into powersaving
* link lost on every second power save (screen blanking / suspend / off / BACO)
        relation to #201139 ?
* reading EDID problems message I found once in dmesg could be a hint (but it
seems all others (cards or different boxes) can obtain the EDID)
* Sometimes it seems I can still send commands via keyboard / work blindly and
thus I might try to start a xrandr script to switch on/off ("reset") the
digital outputs?
* occasionally switching to VT (and back) helps, sometimes not, and the
hardware is frozen; even REISUB (!) won't work.
* once I also got it back - but - in max. 800 x 600 resolution
* sometimes I can re-gain a signal by
    replugging the cable
    switching monitor on/off

* freezes (which seem power management related)
e.g. running a standard compile job
host system had little to do, compilation was running inside a chroot env.
(amd64 on amd64)
next morning: LEDs on mainboard/GPU still glowing, fans spinning, system
entirely frozen, not even REISUB would help
nothing in the logs
from /var/log/emerge.log it must have stopped somewhere in the middle of a
harmless compile (iirc. it was sys-fs/fuse or something), and I don't use
strange CFLAGs which might throw illegeal opcodes or something


* power consumption is too high during idle
* strange power readings in "sensors" at least 33 W (should be 10 W on idling
and 3 W in BACO / zero core)
* hint: also the W32 / W64 blob showed quite high consumption during desktop
idle (AMD blob / GPU-Z)
* wall measured might be slightly better but whole system (Zen+, GPU, 2 SSDs
and one HDD, hardly any USB periphery no other cards in slots one BD/DVD/CDROM)
never drops below 55 W, it's rather higher


Is there something I might have missed?
Should I try to obtain more verbose logs? Is there any "x-trace" tool that I
could run? Radeontop information outputs?


I'll attach one of the few logs I could obtain which might contains some hints
towards what is happening.

on my to-do list: 
* try a different monitor (though that very EIZO monitor worked like a charm
with everything else I threw at it)
* try HDMI instead of DP, but I think I don't have HDMI monitors at hand
* try the RX590 in  a different box (e.g. my FX 6300 unit, which currently runs
flawless with an RX 560) - and see if it still misbehaves... 

Sorry for the wall of text.

keywords: link lost, power management problems, powerplay, device reset
reinitialization, system freeze, x86-64 amd64, amdgpu, AMD RX 590 RX590 Polaris

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
