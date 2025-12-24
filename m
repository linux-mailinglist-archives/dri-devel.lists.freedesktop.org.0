Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6851CDD132
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 22:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3067A10E3D5;
	Wed, 24 Dec 2025 21:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fi3VNGOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B5110E3D5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:41:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6724B60010
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC6C4C116C6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766612466;
 bh=8H/o0PZszVlMuaY8DOT7jGxZt7c4fgbfqG2JBLwj190=;
 h=From:To:Subject:Date:From;
 b=fi3VNGOZ2BsMAJcQwIVbGQbLZKnxap0gL3Sb4L83m/CP2O6IW7dDABzKDmeWBQxV/
 SdfCQHgz5dz2OTnSO+u03kJPNpuqaxlpl7iaT/STbkihFaofgxdb+kKkFOhhpKKPJC
 cfwW0AhZn5WpQfocxfp3VYQnuKkVuVpqbxjzqjDVGPYVm7/q04m9luEPBWfn/m/gVH
 ijPROwlb4j2FpFnpF/lWzokSED2Oa/5lU+VYMmzClNMxogkQOnz45zUiTNQTWi2THs
 FxnkSoknxx2W+kf2x31FJgEmodAuTwBW+4F6QvFOJPARIdxuMt25jlGwaBp+9El4+M
 pz5biGZ6W3XHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B2FB7C41614; Wed, 24 Dec 2025 21:41:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220906] New: Regression: 4K display output fails on ThinkPad
 Thunderbolt 4 Dock with AMD GPU (Worked in 6.17.1, broken in 6.17.11)
Date: Wed, 24 Dec 2025 21:41:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danandrei@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220906-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220906

            Bug ID: 220906
           Summary: Regression: 4K display output fails on ThinkPad
                    Thunderbolt 4 Dock with AMD GPU (Worked in 6.17.1,
                    broken in 6.17.11)
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: danandrei@gmail.com
        Regression: No

Created attachment 309076
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309076&action=3Dedit
dmesg boot output for 6.17.1 & 6.17.12

A regression in recent kernels prevents 4K output over a ThinkPad Thunderbo=
lt 4
Dock when using amdgpu.

After upgrading to kernel 6.17.11=E2=80=91300.fc43.x86_64 on a Lenovo T14s =
Gen 6 (AMD),
my 4K external monitor connected through a ThinkPad Thunderbolt 4 Dock no
longer works at 4K resolution. The display only shows output at lower
resolutions, and even those modes are effectively unusable.

This is a regression: the same hardware setup works correctly on kernel
6.17.1=E2=80=91300.fc43.x86_64, including the version shipped with
Fedora=E2=80=91KDE=E2=80=91Desktop=E2=80=91Live=E2=80=9143=E2=80=911.6.x86_=
64.iso. Booting back into 6.17.1 restores
full 4K functionality.

The issue is fully reproducible by using the affected kernel versions with =
this
hardware combination. No out=E2=80=91of=E2=80=91tree modules are installed;=
 this is a fresh
Fedora installation.

I also tested the latest Rawhide kernel (6.18 branch), and the problem pers=
ists
there as well.

When attempting to switch the display to 4K, the kernel logs repeatedly show
the following amdgpu messages:

```
journalctl -f | grep -i 'amdgpu'

Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:37 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:38 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:53 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
Dec 14 22:37:53 GOTO kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX=
 IRQ
callback: link_index=3D5
```

I noticed that Bug 219748 (Pluggable UD=E2=80=914VPD dock resetting on AMD =
hardware)
shows the same repeated [drm] DMUB HPD RX IRQ callback messages. The hardwa=
re
is similar and also involves a USB=E2=80=91C/Thunderbolt dock, so this may =
be related.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
