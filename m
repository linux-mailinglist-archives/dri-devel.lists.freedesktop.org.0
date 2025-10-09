Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF65BCB040
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 00:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E234710E24B;
	Thu,  9 Oct 2025 22:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ljS2CHaj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65A710E24B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 22:06:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 449AA44790
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 22:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D7C6C4CEE7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760047601;
 bh=SReWxODZELon9STPitbRAI5oZoAcN4PqEDbR6qBKRY4=;
 h=From:To:Subject:Date:From;
 b=ljS2CHajP1cJ2CjnQ6RNFLqiowQsmnT6y34z2wlNAIOpydQubX3IDnKrys9oue7Ro
 6fd0CpuQ9Mm6LmVNxyiI3Q+qZtMZ7We0bkj5iJPV2VVQBJ4FJnjftnOp5JiJAdcEmE
 Q3N8ftR9rAztvpeKM/lHOrysa0iWy28fAdCxWItwzJxEbR+8dbod5l8T3+kNL3kTGO
 OIxeSsZMHhM+B09dq3+sjie4nItjjzaVUVcyL+61nfC5nLZqwVnZjn+8dsu4llVzI1
 4VLtLWcHoqBlQhhKcR8coHkCQCM02fWkMygrTUJvqt7dhUJ9EJrXPQXdLcHztzkBzc
 ynkM5WPzoPvcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 10653C53BBF; Thu,  9 Oct 2025 22:06:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220653] New: RX6700XT fails to do S3 resume, then hangup on
 recovery
Date: Thu, 09 Oct 2025 22:06:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blade@debian.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220653-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220653

            Bug ID: 220653
           Summary: RX6700XT fails to do S3 resume, then hangup on
                    recovery
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: blade@debian.org
        Regression: No

Created attachment 308784
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308784&action=3Dedit
S3 suspend failing for RX6700XT

Symptoms:

you try a suspend-to-rum (ACPI-S3) and the system simply doesn't do it, ins=
tead
some devices (hdd) wake up again after a few seconds but the system is "in =
the
limbo", semi-dead, only sync and reboot with magic-sysrq s/u/b works. See
attachment.


Good/bad versions:

Kernels v6.16.x were fine
Kernels v6.17.0-rc<something> started failing


Results of bi-secting: see below.

I didn't want to start bitching around but seriously, for me this kind of
suspend-resume-freeze-fu*up-in-a-RELEASED-kernel has happened a couple of t=
imes
now. Isn't there any kind of quality control in AMD's integration team for =
the
"older" RX 6xxx generation?


=C2=B1 git bisect bad
440cec4ca1c242d72e309a801995584a55af25c6 is the first bad commit
commit 440cec4ca1c242d72e309a801995584a55af25c6 (HEAD)
Author: Lijo Lazar <lijo.lazar@amd.com>
Date:   Fri Jul 18 18:50:58 2025 +0530

    drm/amdgpu: Wait for bootloader after PSPv11 reset

    Some PSPv11 SOCs take a longer time for PSP based mode-1 reset. Instead
    of checking for C2PMSG_33 status, add the callback wait_for_bootloader.
    Wait for bootloader to be back to steady state is already part of the
    generic mode-1 reset flow. Increase the retry count for bootloader wait
    and also fix the mask to prevent fake pass.

    Fixes: 8345a71fc54b ("drm/amdgpu: Add more checks to PSP mailbox")
    Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4531
    Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    (cherry picked from commit 32f73741d6ee41fd5db8791c1163931e313d0fdc)

 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
