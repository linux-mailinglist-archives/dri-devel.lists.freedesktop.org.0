Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7973203E92
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 19:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC40A6E898;
	Mon, 22 Jun 2020 17:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FE56E898
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 17:57:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Mon, 22 Jun 2020 17:57:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rtmasura+kernel@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-In0rNBlZYI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207383

--- Comment #18 from rtmasura+kernel@hotmail.com ---
lspci:
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890 Northbridge
only single slot PCI-e GFX Hydra part (rev 02)
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD/ATI] RD890S/RD990 I/O Memory
Management Unit (IOMMU)
00:02.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GFX port 0)
00:04.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 0)
00:07.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 3)
00:0b.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD990 PCI to
PCI bridge (PCI Express GFX2 port 0)
00:0d.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP2 Port 0)
00:11.0 RAID bus controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 SATA Controller [RAID5 mode] (rev 40)
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus Controller
(rev 42)
00:14.2 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 Azalia
(Intel HDA) (rev 40)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0
LPC host controller (rev 40)
00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to PCI
Bridge (rev 40)
00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI2 Controller
00:16.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:16.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
HyperTransport Configuration
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
Address Map
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
DRAM Controller
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
Miscellaneous Control
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
Link Control
02:00.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:04.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:05.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:06.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:08.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:09.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
04:00.0 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
04:00.1 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
06:00.0 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
06:00.1 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
07:00.0 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
07:00.1 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
09:00.0 VGA compatible controller: NVIDIA Corporation GP104GL [Quadro P4000]
(rev a1)
09:00.1 Audio device: NVIDIA Corporation GP104 High Definition Audio Controller
(rev a1)
0a:00.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller (rev
03)
0b:00.0 SATA controller: JMicron Technology Corp. JMB363 SATA/IDE Controller
(rev 03)
0b:00.1 IDE interface: JMicron Technology Corp. JMB363 SATA/IDE Controller (rev
03)
0c:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 1470 (rev c3)
0d:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 1471
0e:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Vega
10 XL/XT [Radeon RX Vega 56/64] (rev c3)
0e:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Vega 10 HDMI Audio
[Radeon Vega 56/64]

A few notes on that: The AMD Vega56 is used for this PC, the Quadro P4000 is
disabled on my system and passed through to VMs. 

I haven't found any way to trigger it. Seems completely random. Sat down this
morning to update a VM (not the one with the nvidia passthrough) and it froze,
wasn't any real graphical things going on other than normal KDE stuff. 


lscpu:
Architecture:                    x86_64
CPU op-mode(s):                  32-bit, 64-bit
Byte Order:                      Little Endian
Address sizes:                   48 bits physical, 48 bits virtual
CPU(s):                          6
On-line CPU(s) list:             0-5
Thread(s) per core:              1
Core(s) per socket:              6
Socket(s):                       1
NUMA node(s):                    1
Vendor ID:                       AuthenticAMD
CPU family:                      16
Model:                           10
Model name:                      AMD Phenom(tm) II X6 1090T Processor
Stepping:                        0
CPU MHz:                         3355.192
BogoMIPS:                        6421.46
Virtualization:                  AMD-V
L1d cache:                       384 KiB
L1i cache:                       384 KiB
L2 cache:                        3 MiB
L3 cache:                        6 MiB
NUMA node0 CPU(s):               0-5
Vulnerability Itlb multihit:     Not affected
Vulnerability L1tf:              Not affected
Vulnerability Mds:               Not affected
Vulnerability Meltdown:          Not affected
Vulnerability Spec store bypass: Not affected
Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and
__user pointer sanitization
Vulnerability Spectre v2:        Mitigation; Full AMD retpoline, STIBP
disabled, RSB filling
Vulnerability Srbds:             Not affected
Vulnerability Tsx async abort:   Not affected
Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep
mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext
fxsr_
                                 opt pdpe1gb rdtscp lm 3dnowext 3dnow
constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf pni monitor
cx16 po
                                 pcnt lahf_lm cmp_legacy svm extapic cr8_legacy
abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt cpb hw_pstate vmmcall
                                  npt lbrv svm_lock nrip_save pausefilter


I would be happy to help with any testing, just let me know what information
you need.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
