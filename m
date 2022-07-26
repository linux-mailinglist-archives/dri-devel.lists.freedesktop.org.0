Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7CA581687
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 17:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BF691069;
	Tue, 26 Jul 2022 15:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8405990FF1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 15:35:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E87B560BDE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 15:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57C12C43470
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658849714;
 bh=b/g/8ryzkzWRC3FGtyQZe/ay/u2tt/E+OPOXJ9TGTDk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LKi5LoBVVm3c0q8+mOkpJK2eyFmalrLgLG2OMxHBJ+9Y47D5lc4YeKhE0GOu1rpZT
 wmnf5YaI51l7FV2Wch6CpfuiMMy6brP9H7Y0Kkvi5U/OZm1oYhH8YjnGH61LG59rWl
 4qSYo67L+xQa21HqOR1f+ChKhxrmrziBJhy0QByGEr2KgPHjEmj7BeaTMGbDPW19kw
 4sVJlXIQoB61w4ylGgROvKU0XbpqKe8iCQx6jHUI0q6hiD9LOWEA8vBkGUA1N0LVwn
 QVpGexYS5w03tE1tFmF16NnP1tn4pmoIRrB3HaKoHILi/r/673bfvUC4dmcGcucSUp
 N9Mb3hgTDxawQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 41DC0C433EA; Tue, 26 Jul 2022 15:35:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216277] X11 doesn't wait for amdgpu driver to be up
Date: Tue, 26 Jul 2022 15:35:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dark_sylinc@yahoo.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216277-2300-l0FNa6tgeH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216277-2300@https.bugzilla.kernel.org/>
References: <bug-216277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216277

--- Comment #6 from dark_sylinc@yahoo.com.ar ---
OK today it happened again so changing 78-graphics-card.rules did not fix i=
t.

I just found this:

https://bbs.archlinux.org/viewtopic.php?id=3D260525

Which leads me to this:

https://github.com/sddm/sddm/issues/1316

Apparently SDDM was having the same issue and the "fix" was to add
QThread::sleep(1);

Does the Kernel have an interface to know if a GPU driver will be or is bei=
ng
loaded and get notified when it's done?

I assumed there was, but looking at those threads it appears there is not a=
nd
graphical initialization is basically just YOLO?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
