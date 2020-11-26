Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E702C4F11
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 08:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D8D6E59B;
	Thu, 26 Nov 2020 07:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3E26E59B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 07:03:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210369] amdgpu fails to resume from suspend
Date: Thu, 26 Nov 2020 07:03:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sevenever@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210369-2300-NUyY6PjvC9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210369-2300@https.bugzilla.kernel.org/>
References: <bug-210369-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210369

--- Comment #1 from sevenever (sevenever@gmail.com) ---
lspci output:
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Root Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Renoir IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host
Bridge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host
Bridge
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge
00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge
00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge
00:02.6 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge
00:02.7 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host
Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe GPP
Bridge to Bus
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 51)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev 51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device 24:
Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device 24:
Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device 24:
Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device 24:
Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device 24:
Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device 24:
Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device 24:
Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device 24:
Function 7
01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD
Controller SM981/PM981/PM983
02:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411
PCI Express Gigabit Ethernet Controller (rev 0e)
02:00.1 Serial controller: Realtek Semiconductor Co., Ltd. Device 816a (rev 0e)
02:00.2 Serial controller: Realtek Semiconductor Co., Ltd. Device 816b (rev 0e)
02:00.3 IPMI Interface: Realtek Semiconductor Co., Ltd. Device 816c (rev 0e)
02:00.4 USB controller: Realtek Semiconductor Co., Ltd. Device 816d (rev 0e)
03:00.0 Network controller: Intel Corporation Wi-Fi 6 AX200 (rev 1a)
04:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS522A PCI
Express Card Reader (rev 01)
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411
PCI Express Gigabit Ethernet Controller (rev 15)
06:00.0 USB controller: Renesas Technology Corp. uPD720202 USB 3.0 Host
Controller (rev 02)
07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Renoir (rev d1)
07:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Device 1637
07:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 17h
(Models 10h-1fh) Platform Security Processor
07:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir USB 3.1
07:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir USB 3.1
07:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
Raven/Raven2/FireFlight/Renoir Audio Processor (rev 01)
07:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h (Models
10h-1fh) HD Audio Controller

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
