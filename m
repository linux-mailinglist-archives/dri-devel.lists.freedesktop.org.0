Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D3666103A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 17:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B33B10E308;
	Sat,  7 Jan 2023 16:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E250B10E308
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 16:28:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA483B810B5
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 16:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92EF8C433EF
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673108892;
 bh=PuoARtTmGwTmBFRdY5MwbxtyQsvQi2EXQNCEmXAYj4k=;
 h=From:To:Subject:Date:From;
 b=msznHwyir5mhj1K4qswsP+51vjFHuB+QSNVYjzsQRsL470DmuqziC3KhGXIuxbqzM
 DLs1T5l+Sr5fyTw8tznVq/DhyIUQieXpGoa8nHylXoMjz/xi9PoQ9eJOzx4a5/oTZ9
 PiMliYSDIY/Rfa083i/0mMymBUmaJuciLJNVu6S1VW4P6N9nKtUBl8qtTud5unLMe5
 9cxvpkCa7kzQAZA30CD8FEU0W6X+PzEN7xNm/lZAsSNU6wnlxE4RNyG0LrHKzr2cWt
 4S2yjW3+eknyW8S9Db6TS6SMJaXNzHK5HrEc0grHGtFFlhi09ka50twoo0s2NFgVOy
 mqAAFh0nHBxLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7E932C43141; Sat,  7 Jan 2023 16:28:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216899] New: amdgpu ring timeout after gfxoff on Navi 24
 beige_goby
Date: Sat, 07 Jan 2023 16:28:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dylan-kernel@dylex.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216899-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216899

            Bug ID: 216899
           Summary: amdgpu ring timeout after gfxoff on Navi 24 beige_goby
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.2-gentoo
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dylan-kernel@dylex.net
        Regression: No

Created attachment 303547
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303547&action=3Dedit
boot messages and pci info

I have a new Powercolor AMD Radeon RX 6400 ITX and whenever the screen is
blanked (DPMS or X blanking -- I haven't tried non-X) with gfxoff enabled, =
the
whole system hangs (or at least network and alt-sysrq are unresponsive, tho=
ugh
there seems to be some activity):

Jan  7 01:12:29 talula kernel: [drm:amdgpu_job_timedout] *ERROR* ring gfx_0=
.0.0
timeout, signaled seq=3D23406, emitted seq=3D23407
Jan  7 01:12:29 talula kernel: [drm:amdgpu_job_timedout] *ERROR* Process
information: process X pid 3404 thread X:cs0 pid 3412
Jan  7 01:12:29 talula kernel: amdgpu 0000:75:00.0: amdgpu: GPU reset begin!
Jan  7 01:12:32 talula kernel: amdgpu 0000:75:00.0: amdgpu: SMU: I'm not do=
ne
with your previous command: SMN_C2PMSG_66:0x00000029 SMN_C2PMSG_82:0x000000=
00
Jan  7 01:12:32 talula kernel: amdgpu 0000:75:00.0: amdgpu: Failed to disab=
le
gfxoff!

Setting amdgpu_gfxoff to 0 in debugfs prevents this, and everything works
correctly.  I've tried this on 5.15.80 and checked I have the most recent
firmware.  Happy to provide any additional info or try additional diagnosti=
cs.=20
Full boot messages and pci info for card attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
