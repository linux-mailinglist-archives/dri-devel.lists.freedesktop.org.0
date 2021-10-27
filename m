Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCFC43D316
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F1A6E8FC;
	Wed, 27 Oct 2021 20:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202436E8FC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 20:45:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DACC4610A3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 20:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635367526;
 bh=X40w+ctKRyAFH1CHuAzSQkUVbLePA6rPpuxlea7QpNY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UT1En0QmVWHY8o802Z1V3WwQGd5PyIZz0dfnpNe4DAQuSgYKsGpCKJqBB9TSUfO1a
 wD1Lnnv2iY3CX/MEiKQdL8hbjD76yl0umIpptSkRg/Sz3SW7SvaoVJXjRTlWN75UIl
 pZTtjZK4Za1j3ktHbfaf9UPEQeOeXYsANtUXMG/GX8vkia5YA9RgU8tESjiSkc7A3G
 Ah+CpLYbEY5yDdnZSZRwJsQSk2TTxWbpMdwyqFSfvExaKwiI0OyT65He30d+Gk5h1J
 7NmhNsIcvMn9VeuHXio2oMjTNUclDo6gV6OVPQt3nmNJRyWOIRikrPdAPC3WyK7UBJ
 jPne69Pg4esww==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D07D0610FC; Wed, 27 Oct 2021 20:45:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214847] [radeon] UBSAN shows several null-ptr-deref in
 drm/radeon/atom.c, radeon_atombios.c, atombios_encoders.c, atombios_crtc.c
Date: Wed, 27 Oct 2021 20:45:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214847-2300-XbTHeIHt4U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214847-2300@https.bugzilla.kernel.org/>
References: <bug-214847-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214847

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
 # lspci=20
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
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse Device 24:
Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse Device 24:
Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse Device 24:
Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse Device 24:
Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse Device 24:
Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse Device 24:
Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse Device 24:
Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse Device 24:
Function 7
01:00.0 Non-Volatile memory controller: Sandisk Corp WD Blue SN550 NVMe SSD
(rev 01)
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
07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] R=
V516
[Radeon X1300/X1550 Series]
07:00.1 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] RV516
[Radeon X1300/X1550 Series] (Secondary)
08:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Starship/Matisse PCIe Dummy Function
09:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Starship/Matisse Reserved SPP
09:00.1 Encryption controller: Advanced Micro Devices, Inc. [AMD]
Starship/Matisse Cryptographic Coprocessor PSPCPP
09:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 =
Host
Controller


 # lspci -vv -s 07:00.0
07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] R=
V516
[Radeon X1300/X1550 Series] (prog-if 00 [VGA controller])
        Subsystem: PC Partner Limited / Sapphire Technology RV516 [Radeon
X1300/X1550 Series]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 57
        IOMMU group: 2
        Region 0: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Region 2: Memory at fce30000 (64-bit, non-prefetchable) [size=3D64K]
        Region 4: I/O ports at e000 [size=3D256]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [58] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <4us=
, L1
unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE- FLReset-
SlotPowerLimit 75.000W
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        Capabilities: [80] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Kernel driver in use: radeon
        Kernel modules: radeon

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
