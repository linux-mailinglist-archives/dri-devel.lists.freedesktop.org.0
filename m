Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5943D375
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870716E903;
	Wed, 27 Oct 2021 21:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98FF6E903
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 21:02:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F423610A3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 21:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635368556;
 bh=U7qZeJCNeZC4xR80AVyynbJhlm2DxY/8XwtEgiDFuks=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WFMln1qmghRBa41phd2h5rCnILoU0wnh3UJtFJZwbaaSpmE4AKn1tVqqtoOMEmtV0
 1X6YJkcESO2YUcvcnODCbisJWa45X8fsN7oc3982CvqVin7eYcmZQ50j2kRbC3Wjjv
 lCprXbp65H8q4jwAPL0B3qgD9zeQSBhDSAolXx0y0io0/QJ84ZpwNhwPzLqyeS4bph
 Z3JBwGbY0pjwTFIF0pKzZKgl3RM0VTKKkabxbIzF9IoHKf98JPq2uFdwxZ2zyzgTB0
 cCJULwpzXDVLtNaIRmxZeDFWTvwgbZTMRkLqK6YSkejEwzJ4JctICUl1nezB2Ka70Q
 ctPQaNrrya4LQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 97C7B610FC; Wed, 27 Oct 2021 21:02:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214853] [amdgpu] UBSAN shows several null-ptr-deref in
 ../dc/bios/command_table2.c some array-index-out-of-bounds in
 ../dc/bios/bios_parser2.c and an invalid-load in ../amdgpu_dm/amdgpu_dm.c
Date: Wed, 27 Oct 2021 21:02:36 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214853-2300-clvQ8PN2Ty@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214853-2300@https.bugzilla.kernel.org/>
References: <bug-214853-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214853

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299339
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299339&action=3Dedit
kernel config (kernel 5.15-rc7, AMD FX-8370)

 # lspci=20
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD9x0/RX980 Host
Bridge (rev 02)
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD/ATI] RD890S/RD990 I/O Memo=
ry
Management Unit (IOMMU)
00:02.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GFX port 0)
00:04.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 0)
00:06.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 2)
00:09.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 4)
00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 SATA Controller [AHCI mode] (rev 40)
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
00:15.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB700/SB800/SB900
PCI to PCI bridge (PCIE port 0)
00:16.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:16.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 5
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstr=
eam
Port of PCI Express Switch (rev c5)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Downstream Port of PCI Express Switch
03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
14 [Radeon RX 5500/5500M / Pro 5500M] (rev c5)
03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 HDMI A=
udio
04:00.0 USB controller: Renesas Technology Corp. uPD720201 USB 3.0 Host
Controller (rev 03)
05:00.0 Non-Volatile memory controller: Shenzhen Longsys Electronics Co., L=
td.
SM2263EN/SM2263XT-based OEM SSD (rev 03)
06:00.0 USB controller: ASMedia Technology Inc. ASM1143 USB 3.1 Host Contro=
ller
08:00.0 Ethernet controller: Qualcomm Atheros Killer E2400 Gigabit Ethernet
Controller (rev 10)


 # lspci -vv -s 03:00.0
03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
14 [Radeon RX 5500/5500M / Pro 5500M] (rev c5) (prog-if 00 [VGA controller])
        Subsystem: ASRock Incorporation Navi 14 [Radeon RX 5500/5500M / Pro
5500M]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 54
        Region 0: Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Region 2: Memory at d0000000 (64-bit, prefetchable) [size=3D2M]
        Region 4: I/O ports at e000 [size=3D256]
        Region 5: Memory at fe500000 (32-bit, non-prefetchable) [size=3D512=
K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1+,D2+,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [64] Express (v2) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us=
, L1
unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr+ NonFatalErr+ FatalErr- UnsupReq+ AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 16GT/s (ok), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrP=
rP-
LTR+
                         10BitTagComp+ 10BitTagReq+ OBFF Not Supported, Ext=
Fmt+
EETLPPrefix+, MaxEETLPPrefixes 1
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+
OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Reti=
mer+
2Retimers+ DRS-
                LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedD=
is-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
                         EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee40004  Data: 0024
        Capabilities: [100 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D010 <?>
        Capabilities: [150 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                AERCap: First Error Pointer: 14, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 40001010 000000ff c0b6d300 00000000
        Capabilities: [200 v1] Physical Resizable BAR
                BAR 0: current size: 256MB, supported: 256MB 512MB 1GB 2GB =
4GB
8GB
                BAR 2: current size: 2MB, supported: 2MB 4MB 8MB 16MB 32MB =
64MB
128MB 256MB
        Capabilities: [240 v1] Power Budgeting <?>
        Capabilities: [270 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [2a0 v1] Access Control Services
                ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamF=
wd-
EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamF=
wd-
EgressCtrl- DirectTrans-
        Capabilities: [2b0 v1] Address Translation Service (ATS)
                ATSCap: Invalidate Queue Depth: 00
                ATSCtl: Enable-, Smallest Translation Unit: 00
        Capabilities: [2c0 v1] Page Request Interface (PRI)
                PRICtl: Enable- Reset-
                PRISta: RF- UPRGI- Stopped+
                Page Request Capacity: 00000100, Page Request Allocation:
00000000
        Capabilities: [2d0 v1] Process Address Space ID (PASID)
                PASIDCap: Exec+ Priv+, Max PASID Width: 10
                PASIDCtl: Enable- Exec- Priv-
        Capabilities: [320 v1] Latency Tolerance Reporting
                Max snoop latency: 1048576ns
                Max no snoop latency: 1048576ns
        Capabilities: [400 v1] Data Link Feature <?>
        Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
        Capabilities: [440 v1] Lane Margining at the Receiver <?>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
