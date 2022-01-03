Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A6483568
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0E689612;
	Mon,  3 Jan 2022 17:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC7689612
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:12:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 733D461169
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDF77C36AF3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641229958;
 bh=B3G9ZKYLT78TQMCwkLsTQOt/H2kX0jFT0uYvBtQfHN8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iw6sbGBjiys/QX3KKZeltUmHqXnfCwcLZRB55XJWo/3EtDTPIEiuIW9jmVbOY9+ew
 FXOmyb08T3NHcx/r03Ibpzc31R3fFYYEZJcYUny+zHZcd9hgSmFXeSz6ykcCNZ8T/v
 9qtVzh6IWV3CgmUT7DCCtb/CZaYD6tCbpvemrXMVbA7SCKfnN2K+UY7a16+CAlCIth
 qN3vZj028J0gD4QbQyc8/AP1/JBy03rrGi0BsZQFjTduYaIp3mbXwzCOs2VGxVuWlp
 c9+dogEq5o3LTCDBPUDp/7K3T8RqRc2vdAZyuZYVq/SRgpvXvwHlXibZjc4nPZY3gy
 reE9en70vPnNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C93B9C05FCF; Mon,  3 Jan 2022 17:12:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Mon, 03 Jan 2022 17:12:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-CeWFRbtVuI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

--- Comment #16 from spasswolf@web.de ---
Added a dev_info:

dev_info(adev->dev, "adev->in_s0ix =3D %d\n", adev->in_s0ix);
if (display_count =3D=3D 0 && (adev->in_s0ix || !hpd_state)) {

with the result:
It seems that adev->in_s0ix =3D 0 during suspend. Only later during resume =
(after
ACPI: EC: interrupt unblocked) do we have adev->in_s0ix =3D 1.=20

Jan  3 18:00:24 lisa kernel: [   40.367310] wlp4s0: deauthenticating from
54:67:51:3d:a2:e0 by local choice (Reason: 3=3DDEAUTH_LEAVING)
Jan  3 18:00:24 lisa kernel: [   40.437382] amdgpu 0000:08:00.0: amdgpu:
adev->in_s0ix =3D 0
Jan  3 18:00:27 lisa kernel: [   44.031004] PM: suspend entry (s2idle)
Jan  3 18:00:28 lisa kernel: [   44.252353] Filesystems sync: 0.221 seconds
Jan  3 18:00:58 lisa kernel: [   44.253185] Freezing user space processes .=
..
(elapsed 0.002 seconds) done.
Jan  3 18:00:58 lisa kernel: [   44.255407] OOM killer disabled.
Jan  3 18:00:58 lisa kernel: [   44.255407] Freezing remaining freezable ta=
sks
... (elapsed 0.000 seconds) done.
Jan  3 18:00:58 lisa kernel: [   44.256406] printk: Suspending console(s) (=
use
no_console_suspend to debug)
Jan  3 18:00:58 lisa kernel: [   44.277805] queueing ieee80211 work while g=
oing
to suspend
Jan  3 18:00:58 lisa kernel: [   44.831434] [drm] PCIE GART of 512M enabled
(table at 0x0000008000000000).
Jan  3 18:00:58 lisa kernel: [   44.831464] [drm] PSP is resuming...
Jan  3 18:00:58 lisa kernel: [   45.019729] [drm] reserve 0xa00000 from
0x81fe000000 for PSP TMR
Jan  3 18:00:58 lisa kernel: [   45.091174] amdgpu 0000:03:00.0: amdgpu: RA=
S:
optional ras ta ucode is not available
Jan  3 18:00:58 lisa kernel: [   45.100301] amdgpu 0000:03:00.0: amdgpu:
SECUREDISPLAY: securedisplay ta ucode is not available
Jan  3 18:00:58 lisa kernel: [   45.100305] amdgpu 0000:03:00.0: amdgpu: SM=
U is
resuming...
Jan  3 18:00:58 lisa kernel: [   45.100308] amdgpu 0000:03:00.0: amdgpu: smu
driver if version =3D 0x0000000f, smu fw if version =3D 0x00000013, smu fw =
version
=3D 0x003b2500 (59.37.0)
Jan  3 18:00:58 lisa kernel: [   45.100311] amdgpu 0000:03:00.0: amdgpu: SMU
driver if version not matched
Jan  3 18:00:58 lisa kernel: [   45.151255] amdgpu 0000:03:00.0: amdgpu: SM=
U is
resumed successfully!
Jan  3 18:00:58 lisa kernel: [   45.152433] [drm] DMUB hardware initialized:
version=3D0x02020007
Jan  3 18:00:58 lisa kernel: [   45.194058] [drm] kiq ring mec 2 pipe 1 q 0
Jan  3 18:00:58 lisa kernel: [   45.198331] [drm] VCN decode and encode
initialized successfully(under DPG Mode).
Jan  3 18:00:58 lisa kernel: [   45.198603] [drm] JPEG decode initialized
successfully.
Jan  3 18:00:58 lisa kernel: [   45.198652] amdgpu 0000:03:00.0: amdgpu: ri=
ng
gfx_0.0.0 uses VM inv eng 0 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198654] amdgpu 0000:03:00.0: amdgpu: ri=
ng
comp_1.0.0 uses VM inv eng 1 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198655] amdgpu 0000:03:00.0: amdgpu: ri=
ng
comp_1.1.0 uses VM inv eng 4 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198655] amdgpu 0000:03:00.0: amdgpu: ri=
ng
comp_1.2.0 uses VM inv eng 5 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198656] amdgpu 0000:03:00.0: amdgpu: ri=
ng
comp_1.3.0 uses VM inv eng 6 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198657] amdgpu 0000:03:00.0: amdgpu: ri=
ng
comp_1.0.1 uses VM inv eng 7 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198658] amdgpu 0000:03:00.0: amdgpu: ri=
ng
comp_1.1.1 uses VM inv eng 8 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198659] amdgpu 0000:03:00.0: amdgpu: ri=
ng
comp_1.2.1 uses VM inv eng 9 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198659] amdgpu 0000:03:00.0: amdgpu: ri=
ng
comp_1.3.1 uses VM inv eng 10 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198660] amdgpu 0000:03:00.0: amdgpu: ri=
ng
kiq_2.1.0 uses VM inv eng 11 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198661] amdgpu 0000:03:00.0: amdgpu: ri=
ng
sdma0 uses VM inv eng 12 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198661] amdgpu 0000:03:00.0: amdgpu: ri=
ng
sdma1 uses VM inv eng 13 on hub 0
Jan  3 18:00:58 lisa kernel: [   45.198662] amdgpu 0000:03:00.0: amdgpu: ri=
ng
vcn_dec_0 uses VM inv eng 0 on hub 1
Jan  3 18:00:58 lisa kernel: [   45.198662] amdgpu 0000:03:00.0: amdgpu: ri=
ng
vcn_enc_0.0 uses VM inv eng 1 on hub 1
Jan  3 18:00:58 lisa kernel: [   45.198663] amdgpu 0000:03:00.0: amdgpu: ri=
ng
vcn_enc_0.1 uses VM inv eng 4 on hub 1
Jan  3 18:00:58 lisa kernel: [   45.198663] amdgpu 0000:03:00.0: amdgpu: ri=
ng
jpeg_dec uses VM inv eng 5 on hub 1
Jan  3 18:00:58 lisa kernel: [   45.202326] amdgpu 0000:03:00.0: [drm] Cann=
ot
find any crtc or sizes
Jan  3 18:00:58 lisa kernel: [   45.527398] [drm] Register(0)
[mmUVD_POWER_STATUS] failed to reach value 0x00000001 !=3D 0x00000002
Jan  3 18:00:58 lisa kernel: [   45.844705] [drm] Register(0)
[mmUVD_POWER_STATUS] failed to reach value 0x00000001 !=3D 0x00000002
Jan  3 18:00:58 lisa kernel: [   45.889752] [drm] free PSP TMR buffer
Jan  3 18:00:58 lisa kernel: [   45.939048] amdgpu 0000:03:00.0: amdgpu: MO=
DE1
reset
Jan  3 18:00:58 lisa kernel: [   45.939052] amdgpu 0000:03:00.0: amdgpu: GPU
mode1 reset
Jan  3 18:00:58 lisa kernel: [   45.939132] amdgpu 0000:03:00.0: amdgpu: GPU
smu mode1 reset
Jan  3 18:00:58 lisa kernel: [   46.450444] ACPI: EC: interrupt blocked
Jan  3 18:00:58 lisa kernel: [   46.472489] xhci_hcd 0000:08:00.3: refused =
to
change power state from D0 to D3hot
Jan  3 18:00:58 lisa kernel: [   55.081262] ACPI: EC: interrupt unblocked
Jan  3 18:00:58 lisa kernel: [   55.632167] pci 0000:00:00.2: can't derive
routing for PCI INT A
Jan  3 18:00:58 lisa kernel: [   55.632172] pci 0000:00:00.2: PCI INT A: no=
 GSI
Jan  3 18:00:58 lisa kernel: [   55.635561] [drm] PCIE GART of 512M enabled
(table at 0x0000008000000000).
Jan  3 18:00:58 lisa kernel: [   55.637155] [drm] PSP is resuming...
Jan  3 18:00:58 lisa kernel: [   55.637252] [drm] PCIE GART of 1024M enable=
d.
Jan  3 18:00:58 lisa kernel: [   55.637254] [drm] PTB located at
0x000000F400900000
Jan  3 18:00:58 lisa kernel: [   55.637769] amdgpu 0000:08:00.0: amdgpu: SM=
U is
resuming...
Jan  3 18:00:58 lisa kernel: [   55.640076] amdgpu 0000:08:00.0: amdgpu: dpm
has been disabled
Jan  3 18:00:58 lisa kernel: [   55.643194] amdgpu 0000:08:00.0: amdgpu: SM=
U is
resumed successfully!
Jan  3 18:00:58 lisa kernel: [   55.649205] [drm] DMUB hardware initialized:
version=3D0x0101001C
Jan  3 18:00:58 lisa kernel: [   55.661720] nvme nvme0: 15/0/0
default/read/poll queues
Jan  3 18:00:58 lisa kernel: [   55.702951] nvme nvme1: Shutdown timeout se=
t to
10 seconds
Jan  3 18:00:58 lisa kernel: [   55.704396] nvme nvme1: 8/0/0 default/read/=
poll
queues
Jan  3 18:00:58 lisa kernel: [   55.737425] amdgpu 0000:08:00.0: amdgpu:
adev->in_s0ix =3D 1
Jan  3 18:00:58 lisa kernel: [   55.828624] [drm] reserve 0xa00000 from
0x81fe000000 for PSP TMR
Jan  3 18:00:58 lisa kernel: [   55.898619] amdgpu 0000:03:00.0: amdgpu: RA=
S:
optional ras ta ucode is not available
Jan  3 18:00:58 lisa kernel: [   55.907754] amdgpu 0000:03:00.0: amdgpu:
SECUREDISPLAY: securedisplay ta ucode is not available
Jan  3 18:00:58 lisa kernel: [   55.907757] amdgpu 0000:03:00.0: amdgpu: SM=
U is
resuming...
Jan  3 18:00:58 lisa kernel: [   55.907761] amdgpu 0000:03:00.0: amdgpu: smu
driver if version =3D 0x0000000f, smu fw if version =3D 0x00000013, smu fw =
version
=3D 0x003b2500 (59.37.0)
Jan  3 18:00:58 lisa kernel: [   55.907767] amdgpu 0000:03:00.0: amdgpu: SMU
driver if version not matched
Jan  3 18:00:58 lisa kernel: [   55.958092] amdgpu 0000:03:00.0: amdgpu: SM=
U is
resumed successfully!
Jan  3 18:00:58 lisa kernel: [   55.959299] [drm] DMUB hardware initialized:
version=3D0x02020007
Jan  3 18:00:58 lisa kernel: [   55.968918] amdgpu 0000:08:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring sdma0 test failed (-110)
Jan  3 18:00:58 lisa kernel: [   55.969120] [drm:amdgpu_device_ip_resume_ph=
ase2
[amdgpu]] *ERROR* resume of IP block <sdma_v4_0> failed -110
Jan  3 18:00:58 lisa kernel: [   55.969298] amdgpu 0000:08:00.0: amdgpu:
amdgpu_device_ip_resume failed (-110).
Jan  3 18:00:58 lisa kernel: [   55.969301] PM: dpm_run_callback():
pci_pm_resume+0x0/0xd0 returns -110
Jan  3 18:00:58 lisa kernel: [   55.969313] amdgpu 0000:08:00.0: PM: failed=
 to
resume async: error -110

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
