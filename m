Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35320B49B1A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FCE10E5CC;
	Mon,  8 Sep 2025 20:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ndFPLmXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789C110E5CC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:31:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1521941B54
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7DA4C4CEF1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757363505;
 bh=lv89xySVgzs5vviDMDOk3geltvWHM09RV6s9ccmevMs=;
 h=From:To:Subject:Date:From;
 b=ndFPLmXS6dycEeyc3LUwW1OTZjYmVJDRDjCGMb7DVAIw3f73Ln5owtkV6mAGygo/L
 35BuK0foSYHxANnvCGeibM7ykm+LMT6S+3En978OZ7OAdIkV4vm6yerp3xtwdZOUSx
 sVxkqk1QyXCBJq94cE6Lo9ISQ9hHs1IbSTQ6c3FuXQBkmTHc+knRww+yMbc0Tz53wk
 kWd949g+GAt6xQww7NgnafT+V5leVe4sqdMnfG5aBeVD5bInIyvPIDfxrKRFd5hwuT
 mlhxOGaHSanXnzhXXSVUK1VNG70VFA0tEiiDLI4NLbRR5DwLvRXQ5EMtT0KhCoGwes
 BXCoHqTv2DtQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DDE30C41612; Mon,  8 Sep 2025 20:31:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220553] New: Suspend to mem fails on rx5600xt (regression in
 6.16.2)
Date: Mon, 08 Sep 2025 20:31:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rbmccav@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220553-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220553

            Bug ID: 220553
           Summary: Suspend to mem fails on rx5600xt (regression in
                    6.16.2)
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rbmccav@gmail.com
        Regression: No

Created attachment 308637
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308637&action=3Dedit
git diff that demonstrates what fixed it for me

The GPU reset fails when attempting to suspend.  First noticed in 6.16.2 (on
arch) and it still occurs with 6.17.0-rc5.  This in the dmesg:

[   25.934105] amdgpu 0000:2d:00.0: amdgpu: MODE1 reset
[   25.934111] amdgpu 0000:2d:00.0: amdgpu: GPU mode1 reset
[   25.934172] amdgpu 0000:2d:00.0: amdgpu: GPU psp mode1 reset
[   26.656776] amdgpu 0000:2d:00.0: amdgpu: psp reg (0x16061) wait timed ou=
t,
mask: 8000ffff, read: ffffffff exp: 80000000
[   26.656780] [drm] psp mode 1 reset failed!
[   26.656782] amdgpu 0000:2d:00.0: amdgpu: GPU mode1 reset failed
[   26.656783] amdgpu 0000:2d:00.0: PM: pci_pm_suspend_noirq():
amdgpu_pmops_suspend_noirq [amdgpu] returns -22
[   26.656944] amdgpu 0000:2d:00.0: PM: dpm_run_callback():
pci_pm_suspend_noirq returns -22
[   26.656949] amdgpu 0000:2d:00.0: PM: failed to suspend async noirq: error
-22
[   26.706582] PM: noirq suspend of devices failed

I tracked it down to commit 8345a71fc54b which replaces numbers with named
constants, but it has several errors in which named constant is used, and t=
he
two introduced MASKs are the same when only one should include the STATUS_M=
ASK.
 Note that the preexisting comment on some of the psp_wait_for actually did=
 not
reflect what the code was doing and that may have caused the error in this
commit.

Restoring the numbers back to the original values solves my problem.  To he=
lp
out, I have attached the patch I used.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
