Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC372AA439
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 10:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C756E24E;
	Sat,  7 Nov 2020 09:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DF86E24E
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Nov 2020 09:20:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210095] New: amdgpu : hibernate failed on A12-9700P (R7 bristol
 ridge) - ASUS X555 Q
Date: Sat, 07 Nov 2020 09:19:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alvin@ximple.ga
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210095-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210095

            Bug ID: 210095
           Summary: amdgpu : hibernate failed on A12-9700P (R7 bristol
                    ridge) - ASUS X555 Q
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.0-52-generic #57-Ubuntu SMP Thu Oct 15 10:57:00
                    UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: alvin@ximple.ga
        Regression: No

Created attachment 293529
  --> https://bugzilla.kernel.org/attachment.cgi?id=293529&action=edit
dmesg

Hi! Dear maintainer, 

I have a problem getting hibernate from this machine. After issuing hibernate
command via kernel 'echo disk > /sys/power/state' or systemd 'systemctl
hibernate', the screen is black but still powered on. After like 20secs, fan
speed ramp up to max. If I disconnect the power (mind that my laptop battery is
detected bad) it's instantly turned off (like if I disconnect power on bios
menu) -- my guesses is the blank state is likely stuck on the bios mode/side(?)

I've tried to located the problem by blocking amdgpu modules from booting and I
found out that amdgpu likely the problem. I tried upgrade kernel on ubuntu to
5.8 but no amdgpu loaded but using LLVMpipe mode, the hibernate can happen
normally 

There is no/I don't know where the - serial port on this device as this is a 
laptop and I have limited knowledge/resources to find that out.

I guess that's useless to attach dmesg, as system is not recording any logs
occur after hibernate issued.

Another thing I get is from the Magic number (PM_TRACE), they said some error
on random 'memory48' or sometimes 'memoryXXX'. I think this may be just false
positive
[    0.984201] kernel: PM:   Magic number: 11:0:0
[    0.984292] kernel: memory memory48: hash matches

Here's some device details.

Thank you.

*-cpu
          description: CPU
          product: AMD A12-9700P RADEON R7, 10 COMPUTE CORES 4C+6G
          vendor: Advanced Micro Devices [AMD]
          physical id: 1b
          bus info: cpu@0
          version: AMD A12-9700P RADEON R7, 10 COMPUTE CORES 4C+6G
          slot: P0
          size: 1306MHz
          capacity: 2500MHz
          width: 64 bits
          clock: 100MHz

 *-display
             description: VGA compatible controller
             product: Wani [Radeon R5/R6/R7 Graphics]
             vendor: Advanced Micro Devices, Inc. [AMD/ATI]
             physical id: 1
             bus info: pci@0000:00:01.0
             version: c9
             width: 64 bits
             clock: 33MHz
             capabilities: pm pciexpress msi vga_controller bus_master cap_list
rom
             configuration: driver=amdgpu latency=0
             resources: irq:44 memory:d0000000-dfffffff
memory:f0000000-f07fffff ioport:f000(size=256) memory:feb00000-feb3ffff
memory:c0000-dffff

        *-pci:2
             description: PCI bridge
             product: Family 15h (Models 60h-6fh) Processor Root Port
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 3.1
             bus info: pci@0000:00:03.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master
cap_list
             configuration: driver=pcieport
             resources: irq:29 ioport:d000(size=4096) memory:fe800000-fe8fffff
ioport:e0000000(size=268435456)
           *-display
                description: Display controller
                product: Sun XT [Radeon HD 8670A/8670M/8690M / R5 M330 / M430 /
Radeon 520 Mobile]
                vendor: Advanced Micro Devices, Inc. [AMD/ATI]
                physical id: 0
                bus info: pci@0000:03:00.0
                version: 83
                width: 64 bits
                clock: 33MHz
                capabilities: pm pciexpress msi bus_master cap_list rom
                configuration: driver=radeon latency=0
                resources: irq:43 memory:e0000000-efffffff
memory:fe800000-fe83ffff ioport:d000(size=256) memory:fe840000-fe85ffff

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
