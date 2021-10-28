Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5943E845
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 20:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241CE6E834;
	Thu, 28 Oct 2021 18:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268D56E834
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 18:23:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EE4B6610E5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 18:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635445388;
 bh=ue/1FHhva4A42R8RzTofLzxUrxxIJsA00TNQpcS1wpg=;
 h=From:To:Subject:Date:From;
 b=o4LQVtsgafNgoqUWgkktujLTyCQrUOH90ADG3dmFveb06jPAohYQ6N5hlFSz/LEUX
 2hAvGNW4jj/kyUUJ6rWDnSnVC1cc8t4r+stR7zZm2YM8d2wwpblfEus+uFoW8XZvYi
 orHHuK4Bxf7kNtK3dkuGBuSHY6P0SSu756YJOLBnc85sEQpGjynYsuMB/nUOJBGHSP
 9CNEmE/zYgLou41TtZnM7aCeLV/epGovorR4NlxCZPrVBR0V8gi48dvaHrqLkogmDZ
 mXxdN2n7jciqiGLY7Zw2dab15yYiYkmi/N7qAlPrRlKnSndJhd+/ooPI22huneuc5J
 RgzEPJeGmAvfg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E460C61100; Thu, 28 Oct 2021 18:23:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214859] New: drm-amdgpu-init-iommu~fd-device-init.patch
 introduce bug
Date: Thu, 28 Oct 2021 18:23:07 +0000
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
Message-ID: <bug-214859-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214859

            Bug ID: 214859
           Summary: drm-amdgpu-init-iommu~fd-device-init.patch introduce
                    bug
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.15
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: towo@siduction.org
        Regression: No

After commit d60096b3b2c2..cd8cc7d31b49 100644
drm-amdgpu-init-iommu~fd-device-init.patch

Kernel 5.14.15 on most Ryzen Notebooks X cant't start really.
There is a long time, before x is starting, dmesg is spammed with failure
messages like

Okt 28 10:28:08 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: failed to wr=
ite
reg 28b4 wait reg 28c6
Okt 28 10:28:21 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: failed to wr=
ite
reg 1a6f4 wait reg 1a706
Okt 28 10:28:34 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: failed to wr=
ite
reg 28b4 wait reg 28c6
Okt 28 10:28:47 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: failed to wr=
ite
reg 1a6f4 wait reg 1a706
Okt 28 10:29:01 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: failed to wr=
ite
reg 28b4 wait reg 28c6
Okt 28 10:29:14 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: failed to wr=
ite
reg 1a6f4 wait reg 1a706
Okt 28 10:29:27 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: failed to wr=
ite
reg 28b4 wait reg 28c6
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: failed to wr=
ite
reg 1a6f4 wait reg 1a706

and/or

Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: [gfxhub0]
no-retry page fault (src_id:0 ring:128 vmid:0 pasid:0, for process  pid 0
thread  pid 0)
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:   in page
starting at address 0x0000000000872000 from IH client 0x1b (UTCL2)
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00040D00
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:          Fau=
lty
UTCL2 client ID: CPG (0x6)
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
MORE_FAULTS: 0x0
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
WALKER_ERROR: 0x0
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
PERMISSION_FAULTS: 0x0
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
MAPPING_ERROR: 0x1
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:          RW:=
 0x1
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu: [gfxhub0]
no-retry page fault (src_id:0 ring:128 vmid:0 pasid:0, for process  pid 0
thread  pid 0)
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:   in page
starting at address 0x0000000000872000 from IH client 0x1b (UTCL2)
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00040D00
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:          Fau=
lty
UTCL2 client ID: CPG (0x6)
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
MORE_FAULTS: 0x0
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
WALKER_ERROR: 0x0
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
PERMISSION_FAULTS: 0x0
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
MAPPING_ERROR: 0x1
Okt 28 10:29:40 kernel: ^[[0;1;39mamdgpu 0000:04:00.0: amdgpu:          RW:=
 0x1

Reverting that commit and the kernel is back working normal.
Here the related reports from our users (ignore the nvidia posts).
https://forum.siduction.org/index.php?topic=3D8439.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
