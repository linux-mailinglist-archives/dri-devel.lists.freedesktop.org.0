Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9FA3B1CBF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 16:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B276E91A;
	Wed, 23 Jun 2021 14:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9985B6E91A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 14:41:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A14CC60FEE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624459270;
 bh=G/KMo5RUg0HaFlVG6ZfrwgSsR5TXKF8kN53QPZxS1Vw=;
 h=From:To:Subject:Date:From;
 b=kL/DR0kP0BrKQOjOZhzvMFJRWxlYB0GFOxcsyfqFx5rbEUC3AihIaXg+3px8rov8m
 f2yxHvZGDzGvIEKCbGGQ6SM3BB67/OGUYRTK1d7//t5ORtUmgraL/ql9gPFg6SFRLn
 rf+889YNBBEED0M/2xXhu0Vj2dG8cEjPJi62iuPMq1cWW5/aRt/Lu4lZgdxLtrDmoA
 /h9VWC/kCpXJnV6nYacvhm4lcGZdkq4qrvI0xEtYW1aGFolWdleH623rZq4/5aBVcB
 36sZswcpybAOJDYS24suRbF7u71M/KQ0AkFg3dSlu+503A/3fhPsaLCy2d8Q2cl8ze
 E7/3ACvuPVEEw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 96DC3612AD; Wed, 23 Jun 2021 14:41:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] New: [bisected] AMD GPU can no longer idle state after
 commit 1c0b0efd148d5b24c4932ddb3fa03c8edd6097b3
Date: Wed, 23 Jun 2021 14:41:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

            Bug ID: 213561
           Summary: [bisected] AMD GPU can no longer idle state after
                    commit 1c0b0efd148d5b24c4932ddb3fa03c8edd6097b3
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13rc7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: untaintableangel@hotmail.co.uk
        Regression: No

Nature of the problem: RX 5700 is unable to enter low power state at idle (=
see
below for usual behaviour)

Sensors at idle prior to the commit:
amdgpu-pci-0f00
Adapter: PCI adapter
vddgfx:      775.00 mV=20
fan1:           0 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +48.0=C2=B0C  (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +105.0=C2=B0C)
junction:     +48.0=C2=B0C  (crit =3D +110.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +115.0=C2=B0C)
mem:          +52.0=C2=B0C  (crit =3D +105.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +110.0=C2=B0C)
power1:        8.00 W  (cap =3D 165.00 W)

After the commit, the lowest is:
amdgpu-pci-0f00
Adapter: PCI adapter
vddgfx:        1.03 V=20=20
fan1:           0 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +54.0=C2=B0C  (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +105.0=C2=B0C)
junction:     +56.0=C2=B0C  (crit =3D +110.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +115.0=C2=B0C)
mem:          +52.0=C2=B0C  (crit =3D +105.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +110.0=C2=B0C)
power1:       31.00 W  (cap =3D 165.00 W)


This problem wasn't present in rc6 but is present in 5.13rc7 and bisects to:

1c0b0efd148d5b24c4932ddb3fa03c8edd6097b3 is the first bad commit
commit 1c0b0efd148d5b24c4932ddb3fa03c8edd6097b3
Author: Yifan Zhang <yifan1.zhang@amd.com>
Date:   Thu Jun 10 10:10:07 2021 +0800

    drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover full
doorbell.

    If GC has entered CGPG, ringing doorbell > first page doesn't wakeup GC.
    Enlarge CP_MEC_DOORBELL_RANGE_UPPER to workaround this issue.

    Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
    Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    Cc: stable@vger.kernel.org


The device is a Sapphire Pulse RX5700 and this problem is seen even with one
monitor set at 60Hz.
GPU: 0f:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Navi 10 [Radeon RX 5600 OEM/5600 XT / 5700/5700 XT] [1002:731f] (=
rev
c4)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
