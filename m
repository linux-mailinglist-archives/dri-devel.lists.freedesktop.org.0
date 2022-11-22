Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C15633913
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 10:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CE710E1CE;
	Tue, 22 Nov 2022 09:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8677010E1CE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 09:53:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0206615D2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 09:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A0FBC433D6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669110815;
 bh=SrBjxnGnQ0HZ2llthhzylw5FZdrVcDnygMu6dWiCQII=;
 h=From:To:Subject:Date:From;
 b=UMkbNe5lkrAz6Kurdo7Ypu9CLTwb4oDI94YOFRsOXHjfCHZIofpqXSma5rpxVfuWK
 OF0OD/NMwEk0FDXE3qIfooSHV6Urk3MREQT6D0EXkkUOl9wOSxBAxTs1UMDrceOrs0
 EY/Z/JOXdosFVkvNrMlU7pbPR11kLJ/VBb4MIthKXdhcvqf9NYmHdSP8RJenOPmkHx
 YvLRV4fMBkEw5dR7C/ffCKXdq0Ke0ECgHUqxzANDmHmDQrIkFNDTaN4kPaLA9j9hgd
 mxHmM6lXuTEQgRaYue2ahoGrNolPKD1dsw5QuJ8k6HHMZilsTS9RFuaD62SiRQDxif
 JVwYqw3ZXAgKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 48462C433E4; Tue, 22 Nov 2022 09:53:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216727] New: Failure to wake up from suspend to RAM
Date: Tue, 22 Nov 2022 09:53:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216727-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216727

            Bug ID: 216727
           Summary: Failure to wake up from suspend to RAM
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.9
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: martin.tk@gmx.com
        Regression: No

Created attachment 303261
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303261&action=3Dedit
errors and tracess logged when the issue occured

I've had this issue at least twice so far. The previous time it was on kern=
el
version 5.19.17.

When I tried waking up my computer from sleep I was greeted with corrupt
graphics. Was able to login via ssh and reboot.

I'm on Slackware-current. CPU is AMD Phenom II X4 965 Black=C2=A0Edition. G=
PU is AMD
Radeon RX 550 / 550 Series

Both time this happened I had a process running and using up all the memory=
 and
eventually being killed by "out of memory". Though first time I experienced
this issue the out of memory happend the day beofre. The issue occured only=
 on
wake up the next day.

I'm attaching some logs (some minor comments in the attached log file), I h=
ope
it's not too much but I didn't want to miss any relevant information. Apolo=
gies
in advance.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
