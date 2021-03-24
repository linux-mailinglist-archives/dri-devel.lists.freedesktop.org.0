Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E8A3484D2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E8A6EAA6;
	Wed, 24 Mar 2021 22:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459CC6EAB0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:46:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3FDC561A1D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616625972;
 bh=U/UBPw5zROdfIvndg2Qo+fiIqw0/F6rS12sDqZ9yU0w=;
 h=From:To:Subject:Date:From;
 b=P0eT29ImA4mblKk5iBnQkkAPTxRs3AMsiekmtVOtb5VWaAr0C9ZUCqjJjyVLVLKPX
 Y53otrBnd52ZAUu2u55MOSWaOHow8p7GQwKEafA4hx/LB4qYUN7rxlPTXxXvjPKIP6
 eGiGqyYr+rpxCrdObpCDPq5MopUcat9KKIMrbJ8dw/bHE2DUHQ4GpilbpJj5xqtqDU
 9z34w/88lLmpYKDQvIBnUwVOaN3y5LNbNpSw8XfNzEWkmvT2kET+uobhw4gAYG9tCf
 LcXKft9G92yOioYTvvP28tiXG7clAC2Yw1PBaNwYuMekgBlVvuU3Wo7V4FVnK9qdaa
 rRHut2Bz5VfmA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3360362AB8; Wed, 24 Mar 2021 22:46:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212427] New: [AMDGPU] Multiple ttm_bo_release warnings
Date: Wed, 24 Mar 2021 22:46:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rankincj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212427-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212427

            Bug ID: 212427
           Summary: [AMDGPU] Multiple ttm_bo_release warnings
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.9
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rankincj@yahoo.com
        Regression: No

Created attachment 296037
  --> https://bugzilla.kernel.org/attachment.cgi?id=296037&action=edit
Full dmesg log from 5.11.9

After upgrading from 5.11.8 to 5.11.9, I am seeing warnings like this in my
dmesg log:

[   43.393574] WARNING: CPU: 2 PID: 1268 at drivers/gpu/drm/ttm/ttm_bo.c:517
ttm_bo_release+0x172/0x282 [ttm]
[   43.401940] Modules linked in: nf_nat_ftp nf_conntrack_ftp cfg80211
af_packet nft_ct nft_chain_nat nf_tables ebtable_nat ebtable_broute
ip6table_nat ip6table_mangle ip6table_raw iptable_nat nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_raw nfnetlink
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter bnep it87
hwmon_vid snd_hda_codec_realtek dm_mod dax snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel btusb btbcm btintel bluetooth uvcvideo
videobuf2_vmalloc snd_usb_audio ecdh_generic videobuf2_memops videobuf2_v4l2
videobuf2_common input_leds led_class rfkill videodev snd_usbmidi_lib mc joydev
ecc coretemp kvm_intel kvm snd_intel_dspcfg irqbypass snd_hda_codec
snd_virtuoso snd_oxygen_lib snd_hwdep snd_hda_core snd_mpu401_uart snd_rawmidi
snd_seq snd_seq_device snd_pcm r8169 mxm_wmi snd_hrtimer iTCO_wdt gpio_ich
psmouse realtek i2c_i801 pcspkr tiny_power_button snd_timer mdio_devres libphy
i2c_smbus wmi snd i7core_edac
[   43.402051]  button soundcore acpi_cpufreq lpc_ich binfmt_misc nfsd
auth_rpcgss nfs_acl lockd fuse grace configfs sunrpc zram zsmalloc ip_tables
x_tables ext4 crc32c_generic crc16 mbcache jbd2 sr_mod cdrom sd_mod usbhid
uhci_hcd ehci_pci ehci_hcd amdgpu xhci_pci xhci_hcd drm_ttm_helper pata_jmicron
ttm ahci mfd_core gpu_sched libahci firewire_ohci i2c_algo_bit firewire_core
libata crc_itu_t drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect
sysimgblt fb_sys_fops crc32c_intel serio_raw cfbcopyarea scsi_mod usbcore
usb_common drm drm_panel_orientation_quirks msr sha256_ssse3 sha256_generic
libsha256 ipv6
[   43.541960] CPU: 2 PID: 1268 Comm: gnome-shell Tainted: G          I      
5.11.9 #1
[   43.548677] Hardware name: Gigabyte Technology Co., Ltd.
EX58-UD3R/EX58-UD3R, BIOS FB  05/04/2009
[   43.556556] RIP: 0010:ttm_bo_release+0x172/0x282 [ttm]
[   43.560568] Code: 75 05 e8 dd e0 e6 e0 41 ff c5 eb d4 e8 0f c9 b9 e0 c6 43
58 01 48 c7 c7 68 2a 50 a0 e8 08 8e fa e0 83 bb 9c 00 00 00 00 74 20 <0f> 0b c7
83 9c 00 00 00 00 00 00 00 4c 89 e7 e8 29 fc ff ff 48 8d
[   43.578854] RSP: 0000:ffffc900017e3bc8 EFLAGS: 00010202
[   43.582956] RAX: 0000000000000000 RBX: ffff8881076ca580 RCX:
0000000000000007
[   43.589041] RDX: 0000000000000001 RSI: 0000000000000246 RDI:
ffffffffa0502a68
[   43.595121] RBP: ffff88810b525638 R08: ffff888101f84f78 R09:
ffffc900017e3a80
[   43.601213] R10: 0000000040042000 R11: 0000000000000000 R12:
ffff8881076ca400
[   43.607331] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000
[   43.613469] FS:  00007fb19706e480(0000) GS:ffff888343c80000(0000)
knlGS:0000000000000000
[   43.620568] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.625221] CR2: 00007fb1940ff2e0 CR3: 00000001291fe000 CR4:
00000000000006e0
[   43.631329] Call Trace:
[   43.632488]  ttm_bo_move_accel_cleanup+0x109/0x238 [ttm]
[   43.636662]  amdgpu_bo_move+0x3c3/0x507 [amdgpu]
[   43.640332]  ttm_bo_handle_move_mem+0x73/0xf9 [ttm]
[   43.644141]  ttm_bo_validate+0xfa/0x16d [ttm]
[   43.647303]  amdgpu_bo_fault_reserve_notify+0xb7/0x134 [amdgpu]
[   43.652246]  amdgpu_ttm_fault+0x27/0x7c [amdgpu]
[   43.655730]  __do_fault+0x49/0x64
[   43.657826]  handle_mm_fault+0xb19/0xbf8
[   43.660564]  exc_page_fault+0x226/0x32b
[   43.663243]  ? asm_exc_page_fault+0x8/0x30
[   43.666128]  asm_exc_page_fault+0x1e/0x30
[   43.668951] RIP: 0033:0x7fb19b11b1ee
[   43.671328] Code: 4d 29 c1 4c 29 c2 48 3b 15 27 dc 11 00 0f 87 af 00 00 00
0f 10 01 0f 10 49 f0 0f 10 51 e0 0f 10 59 d0 48 83 e9 40 48 83 ea 40 <41> 0f 29
01 41 0f 29 49 f0 41 0f 29 51 e0 41 0f 29 59 d0 49 83 e9
[   43.689572] RSP: 002b:00007fffc11ae478 EFLAGS: 00010202
[   43.693662] RAX: 00007fb1940ff200 RBX: 00000000000000f8 RCX:
000055886456a1e4
[   43.699826] RDX: 00000000000000b0 RSI: 000055886456a144 RDI:
00007fb1940ff200
[   43.705952] RBP: 0000558864563380 R08: 0000000000000008 R09:
00007fb1940ff2e0
[   43.712042] R10: 0000000000000088 R11: 00007fb1940ff2e8 R12:
000055886456a144
[   43.718128] R13: 00007fb17ae55b00 R14: 0000558864563380 R15:
0000558864565d98

I have a "BONNAIRE" R7 360:

02:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Tobago PRO [Radeon R7 360 / R9 360 OEM] (rev 81) (prog-if 00 [VGA controller])
        Subsystem: XFX Pine Group Inc. Radeon R7 360
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 42
        Region 0: Memory at b0000000 (64-bit, prefetchable) [size=256M]
        Region 2: Memory at cf800000 (64-bit, prefetchable) [size=8M]
        Region 4: I/O ports at ce00 [size=256]
        Region 5: Memory at fbc80000 (32-bit, non-prefetchable) [size=256K]
        Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0-,D1+,D2+,D3hot+,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [58] Express (v2) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1
unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM L0s L1 Enabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s (downgraded), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-
NROPrPrP- LTR-
                         10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR-
OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer-
2Retimers- DRS-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee20004  Data: 0024
        Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
        Capabilities: [150 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [200 v1] Physical Resizable BAR
                BAR 0: current size: 256MB, supported: 256MB 512MB 1GB 2GB 4GB
        Capabilities: [270 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [2b0 v1] Address Translation Service (ATS)
                ATSCap: Invalidate Queue Depth: 00
                ATSCtl: Enable-, Smallest Translation Unit: 00
        Capabilities: [2c0 v1] Page Request Interface (PRI)
                PRICtl: Enable- Reset-
                PRISta: RF- UPRGI- Stopped+
                Page Request Capacity: 00000020, Page Request Allocation:
00000000
        Capabilities: [2d0 v1] Process Address Space ID (PASID)
                PASIDCap: Exec+ Priv+, Max PASID Width: 10
                PASIDCtl: Enable- Exec- Priv-
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

02:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Tobago HDMI Audio
[Radeon R7 360 / R9 360 OEM]
        Subsystem: XFX Pine Group Inc. Device aac0
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 45
        Region 0: Memory at fbcfc000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [58] Express (v2) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1
unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s (downgraded), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-
NROPrPrP- LTR-
                         10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR-
OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee08004  Data: 0024
        Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
        Capabilities: [150 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
