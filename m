Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC84812A8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 13:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8718B10EB4E;
	Wed, 29 Dec 2021 12:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292BB10EB4E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 12:28:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E858DB81896
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 12:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C210EC36AE9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640780931;
 bh=otXDC0cgRZ2JJowgbnNVtxO0grccAhJxNb8sHaQKuKw=;
 h=From:To:Subject:Date:From;
 b=Xa1hrgdP4kAX4J5MEluU++xZmWSxyub6B58C1e+dJYjdAonDCoLHW1nU7lT2mu5R/
 xKmmzaaGyfN6yZeTHx8CxkPLNcv7xeYKE5AtL89g+H2bWuNgepDf2L5nuHWLp1LlSC
 BtDPui19mx8Ns7vtZnINSIzAouD3ZddDVq9XF6nb8FUR7H8yL8rzJw5QeQIYBvybL1
 ovpmmhVIg/4173kkM9veS7MjaEibwMfxQccxsSYRSNBhechNu+3u29jTcJgfiwXXgU
 OJpT2zNzk1MO3+C+jA7oPBUB/K+62DRAu8Ok/aEniLb1Yf6htFpUZfD2FvLVaAlUjD
 CYTmy6jhEL/uA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A7404C05FCB; Wed, 29 Dec 2021 12:28:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] New: admgpu: suspend and resuming from suspend don't work
Date: Wed, 29 Dec 2021 12:28:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

            Bug ID: 215436
           Summary: admgpu: suspend and resuming from suspend don't work
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16-rc{1-7}
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: spasswolf@web.de
        Regression: No

Created attachment 300180
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300180&action=3Dedit
full kern.log from boot to reboot

System:
MSI Alpha 15 B5EEK Lapttop with newest BIOS
lspci -nn
00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezan=
ne
Root Complex [1022:1630]
00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne IOM=
MU
[1022:1631]
00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge [1022:1632]
00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe G=
PP
Bridge [1022:1633]
00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge [1022:1632]
00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge [1022:1634]
00:02.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge [1022:1634]
00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge [1022:1634]
00:02.4 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge [1022:1634]
00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge [1022:1632]
00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir Intern=
al
PCIe GPP Bridge to Bus [1022:1635]
00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controll=
er
[1022:790b] (rev 51)
00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge
[1022:790e] (rev 51)
00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 0 [1022:166a]
00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 1 [1022:166b]
00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 2 [1022:166c]
00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 3 [1022:166d]
00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 4 [1022:166e]
00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 5 [1022:166f]
00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 6 [1022:1670]
00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 7 [1022:1671]
01:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Upstream Port of PCI Express Switch [1002:1478] (rev c3)
02:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Downstream Port of PCI Express Switch [1002:1479]
03:00.0 Display controller [0380]: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
23 [Radeon RX 6600/6600 XT/6600M] [1002:73ff] (rev c3)
03:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21
HDMI Audio [Radeon RX 6800/6800 XT / 6900 XT] [1002:ab28]
04:00.0 Network controller [0280]: MEDIATEK Corp. Device [14c3:0608]
05:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev =
15)
06:00.0 Non-Volatile memory controller [0108]: Micron/Crucial Technology P1
NVMe PCIe SSD [c0a9:2263] (rev 03)
07:00.0 Non-Volatile memory controller [0108]: Kingston Technology Company,
Inc. Device [2646:500c] (rev 01)
08:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Cezanne [1002:1638] (rev c5)
08:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Renoir
Radeon High Definition Audio Controller [1002:1637]
08:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Fa=
mily
17h (Models 10h-1fh) Platform Security Processor [1022:15df]
08:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne USB 3.1 [1022:1639]
08:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne USB 3.1 [1022:1639]
08:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD]
Raven/Raven2/FireFlight/Renoir Audio Processor [1022:15e2] (rev 01)
08:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 17h
(Models 10h-1fh) HD Audio Controller [1022:15e3]
08:00.7 Signal processing controller [1180]: Advanced Micro Devices, Inc. [=
AMD]
Raven/Raven2/Renoir Sensor Fusion Hub [1022:15e4]
When going into suspend on the above System suspend does not work properly
Dec 29 13:12:38 lisa kernel: [   52.085072] [drm] Register(0)
[mmUVD_POWER_STATUS] failed to reach value 0x00000001 !=3D 0x00000002
Dec 29 13:12:38 lisa kernel: [   52.407841] [drm] Register(0)
[mmUVD_POWER_STATUS] failed to reach value 0x00000001 !=3D 0x00000002
resuming from suspend freezes the System:
Dec 29 13:12:38 lisa kernel: [   53.663566] [drm] reserve 0xa00000 from
0x81fe000000 for PSP TMR
Dec 29 13:12:38 lisa kernel: [   53.715562] amdgpu 0000:08:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring sdma0 test failed (-110)
Dec 29 13:12:38 lisa kernel: [   53.715805] [drm:amdgpu_device_ip_resume_ph=
ase2
[amdgpu]] *ERROR* resume of IP block <sdma_v4_0> failed -110
Dec 29 13:12:38 lisa kernel: [   53.716007] amdgpu 0000:08:00.0: amdgpu:
amdgpu_device_ip_resume failed (-110).
Dec 29 13:12:38 lisa kernel: [   53.716010] PM: dpm_run_callback():
pci_pm_resume+0x0/0xe0 returns -110
Dec 29 13:12:38 lisa kernel: [   53.716023] amdgpu 0000:08:00.0: PM: failed=
 to
resume async: error -110
Dec 29 13:12:38 lisa kernel: [   53.734885] amdgpu 0000:03:00.0: amdgpu: RA=
S:
optional ras ta ucode is not available
Dec 29 13:12:38 lisa kernel: [   53.744042] amdgpu 0000:03:00.0: amdgpu:
SECUREDISPLAY: securedisplay ta ucode is not available
Dec 29 13:12:38 lisa kernel: [   53.744048] amdgpu 0000:03:00.0: amdgpu: SM=
U is
resuming...
Dec 29 13:12:38 lisa kernel: [   53.744053] amdgpu 0000:03:00.0: amdgpu: smu
driver if version =3D 0x0000000f, smu fw if version =3D 0x00000012, smu fw =
version
=3D 0x003b2200 (59.34.0)
Dec 29 13:12:38 lisa kernel: [   53.744059] amdgpu 0000:03:00.0: amdgpu: SMU
driver if version not matched
Dec 29 13:12:38 lisa kernel: [   53.794983] amdgpu 0000:03:00.0: amdgpu: SM=
U is
resumed successfully!
Suspend and resume used to work with linux.5.15.11, the first bad commit is
commit 2a50edbf10c8c56e930bfb53d8f9f00a33fd837e
Author: Qingqing Zhuo <qingqing.zhuo@amd.com>
Date:   Tue Aug 17 16:29:07 2021 -0400

    drm/amd/display: Apply w/a for hard hang on HPD

    [Why]
    HPD disable and enable sequences are not mutually exclusive
    on Linux. For HPDs that spans under 1s (i.e. HPD low =3D 1s),
    part of the disable sequence (specifically, a request to SMU
    to lower refclk) could come right before the call to PHY
    enablement, causing DMUB to access an irresponsive PHY
    and thus a hard hang on the system.

    [How]
    Disable 48mhz refclk off when there is any HPD status in
    connected state.

    Reviewed-by: Hersen Wu <hersenwu@amd.com>
    Acked-by: Mikita Lipski <mikita.lipski@amd.com>
    Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  | 12 ++++++++++-
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   | 25 ++++++++++++++++++=
++++
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.h   |  2 ++
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |  4 ++++
 5 files changed, 43 insertions(+), 2 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
