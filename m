Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7C69BD15
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C32810E033;
	Sat, 18 Feb 2023 21:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B28C10E033
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 21:24:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9358DB8074E
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 21:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62141C4339B
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 21:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676755476;
 bh=ZZrWJg3/hHaSpCvew8zAyh1mC9aP7RJ+d24CcCcJV+U=;
 h=From:To:Subject:Date:From;
 b=nubijjwWhU0JVEUCbrPkctxc2HpO5hVGHGYlI+HI4j9WnuMP3y1ntZlPOAbPrgHhy
 fKQ2FcLDbtjXB4j6ME2PIe64am5aYNb6wjmEnKlbbAY94zFqbBswcfI2FAG5ivIX6b
 iHuYuGQDwa6rQMhxAU/3OuK6Eox1t0gazHvbCx7NwvveNyXoO5DkzrzZvTKHi1Ddj4
 F3BFldXYYyVmipQplDC+msemyxqBH4D87MG4bPrXuAorMauFw6k860293tTBLn/qh3
 /3TWZHoARCgRNQf5RjVn/WvF/SFP5c4qG1izeqZQW+j3CkfFiyIcZv8ej90UI3nbh3
 adt54MqdCZH2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 46160C43143; Sat, 18 Feb 2023 21:24:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217058] New: amdgpu resets
Date: Sat, 18 Feb 2023 21:24:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: towo@siduction.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217058-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217058

            Bug ID: 217058
           Summary: amdgpu resets
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.x, 6.1.x, 6.2-rcX
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: towo@siduction.org
        Regression: No

On watching iptv or video with mpv, after some random times, the whole desk=
top
resets and im find myself on login screen.

dmesg is showing then:

[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu: [mmhub] page fault
(src_id:0 ring:24 vmid:4 pasid:32781, for process mpv pid 16088 thread mpv:=
cs0
pid 16100)
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   in page starting at
address 0x0000800104364000 from client 0x12 (VMC)
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00405631
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   Faulty UTCL2 client
ID: VCN0 (0x2b)
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   MORE_FAULTS: 0x1
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   WALKER_ERROR: 0x0
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   PERMISSION_FAULTS:=
 0x3
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   MAPPING_ERROR: 0x0
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   RW: 0x0
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu: [mmhub] page fault
(src_id:0 ring:24 vmid:4 pasid:32781, for process mpv pid 16088 thread mpv:=
cs0
pid 16100)
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   in page starting at
address 0x0000800104369000 from client 0x12 (VMC)
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   Faulty UTCL2 client
ID: unknown (0x0)
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   MORE_FAULTS: 0x0
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   WALKER_ERROR: 0x0
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   PERMISSION_FAULTS:=
 0x0
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   MAPPING_ERROR: 0x0
[Sa Feb 18 21:37:38 2023] amdgpu 0000:0b:00.0: amdgpu:   RW: 0x0
[Sa Feb 18 21:37:49 2023] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
vcn_dec_0 timeout, signaled seq=3D81848, emitted seq=3D81850
[Sa Feb 18 21:37:49 2023] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process mpv pid 16088 thread mpv:cs0 pid 16100
[Sa Feb 18 21:37:49 2023] amdgpu 0000:0b:00.0: amdgpu: GPU reset begin!
[Sa Feb 18 21:37:49 2023] [drm] Register(0) [mmUVD_POWER_STATUS] failed to
reach value 0x00000001 !=3D 0x00000002
[Sa Feb 18 21:37:49 2023] [drm] Register(0) [mmUVD_RBC_RB_RPTR] failed to r=
each
value 0x00000130 !=3D 0x000000d0
[Sa Feb 18 21:37:49 2023] [drm] Register(0) [mmUVD_POWER_STATUS] failed to
reach value 0x00000001 !=3D 0x00000002
[Sa Feb 18 21:37:49 2023] amdgpu 0000:0b:00.0: amdgpu: MODE1 reset
[Sa Feb 18 21:37:49 2023] amdgpu 0000:0b:00.0: amdgpu: GPU mode1 reset
[Sa Feb 18 21:37:49 2023] amdgpu 0000:0b:00.0: amdgpu: GPU smu mode1 reset
[Sa Feb 18 21:37:49 2023] amdgpu 0000:0b:00.0: AMD-Vi: Event logged
[IO_PAGE_FAULT domain=3D0x0012 address=3D0x467380 flags=3D0x0000]
[Sa Feb 18 21:37:49 2023] amdgpu 0000:0b:00.0: AMD-Vi: Event logged
[IO_PAGE_FAULT domain=3D0x0012 address=3D0x4673c0 flags=3D0x0000]
[Sa Feb 18 21:37:49 2023] amdgpu 0000:0b:00.0: AMD-Vi: Event logged
[IO_PAGE_FAULT domain=3D0x0012 address=3D0x467400 flags=3D0x0000]
[Sa Feb 18 21:37:49 2023] amdgpu 0000:0b:00.0: AMD-Vi: Event logged
[IO_PAGE_FAULT domain=3D0x0012 address=3D0x467440 flags=3D0x0000]
[Sa Feb 18 21:37:49 2023] amdgpu 0000:0b:00.0: AMD-Vi: Event logged
[IO_PAGE_FAULT domain=3D0x0012 address=3D0x467480 flags=3D0x0000]
[Sa Feb 18 21:37:50 2023] amdgpu 0000:0b:00.0: amdgpu: GPU reset succeeded,
trying to resume
[Sa Feb 18 21:37:50 2023] [drm] PCIE GART of 512M enabled (table at
0x00000081FEB00000).
[Sa Feb 18 21:37:50 2023] [drm] VRAM is lost due to GPU reset!
[Sa Feb 18 21:37:50 2023] [drm] PSP is resuming...
[Sa Feb 18 21:37:50 2023] [drm] reserve 0xa00000 from 0x81fd000000 for PSP =
TMR
[Sa Feb 18 21:37:50 2023] amdgpu 0000:0b:00.0: amdgpu: RAS: optional ras ta
ucode is not available
[Sa Feb 18 21:37:50 2023] amdgpu 0000:0b:00.0: amdgpu: SECUREDISPLAY:
securedisplay ta ucode is not available
[Sa Feb 18 21:37:50 2023] amdgpu 0000:0b:00.0: amdgpu: SMU is resuming...
[Sa Feb 18 21:37:50 2023] amdgpu 0000:0b:00.0: amdgpu: smu driver if versio=
n =3D
0x0000000f, smu fw if version =3D 0x00000013, smu fw program =3D 0, version=
 =3D
0x003b2a00 (59.42.0)
[Sa Feb 18 21:37:50 2023] amdgpu 0000:0b:00.0: amdgpu: SMU driver if version
not matched
[Sa Feb 18 21:37:50 2023] amdgpu 0000:0b:00.0: amdgpu: use vbios provided
pptable
[Sa Feb 18 21:37:50 2023] amdgpu 0000:0b:00.0: amdgpu: SMU is resumed
successfully!
[Sa Feb 18 21:37:50 2023] [drm] DMUB hardware initialized: version=3D0x0202=
0017
[Sa Feb 18 21:37:51 2023] [drm] kiq ring mec 2 pipe 1 q 0
[Sa Feb 18 21:37:51 2023] [drm] VCN decode and encode initialized
successfully(under DPG Mode).
[Sa Feb 18 21:37:51 2023] [drm] JPEG decode initialized successfully.
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring gfx_0.0.0 uses =
VM
inv eng 0 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.0.0 uses=
 VM
inv eng 1 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.1.0 uses=
 VM
inv eng 4 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.2.0 uses=
 VM
inv eng 5 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.3.0 uses=
 VM
inv eng 6 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.0.1 uses=
 VM
inv eng 7 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.1.1 uses=
 VM
inv eng 8 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.2.1 uses=
 VM
inv eng 9 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.3.1 uses=
 VM
inv eng 10 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring kiq_2.1.0 uses =
VM
inv eng 11 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring sdma0 uses VM i=
nv
eng 12 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring sdma1 uses VM i=
nv
eng 13 on hub 0
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring vcn_dec_0 uses =
VM
inv eng 0 on hub 1
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring vcn_enc_0.0 use=
s VM
inv eng 1 on hub 1
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring vcn_enc_0.1 use=
s VM
inv eng 4 on hub 1
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: ring jpeg_dec uses VM
inv eng 5 on hub 1
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: recover vram bo from
shadow start
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: recover vram bo from
shadow done
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] amdgpu 0000:0b:00.0: amdgpu: GPU reset(2) succeed=
ed!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm] Skip scheduling IBs!
[Sa Feb 18 21:37:51 2023] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
initialize parser -125!
[Sa Feb 18 21:37:51 2023] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERRO=
R*
got no status for stream 00000000cf78e5f6 on acrtc0000000056f62870
[Sa Feb 18 21:37:51 2023] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERRO=
R*
got no status for stream 0000000092068d11 on acrtc00000000ee859d94

Kernel i have tryed: 6.0.x, 6.1.x and at the moment 6.2-rc8.
Grapics: Radeon RX 6600 XT
CPU: AMD Ryzen 7 2700X

The whole Problem seems VA-API related.

If you need more info, i will give it to you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
