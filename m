Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0A514A40
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 15:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9717E10ECD6;
	Fri, 29 Apr 2022 13:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6AC10ECD6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 13:08:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 222086227E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 13:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 830C0C385A4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651237706;
 bh=BuEnUpHRCa5BLuX1gOIqogPw04iu7jxZ2fflNgRGyxQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DJBTw2xT8WJRYNVackXyrAM2Wb5/pN0akHcKM8ht0h3EF36Utu5g+xZ4kTDQl0V65
 KbaihXU//U7UrV8mST5MnEu3WWu9+BgVZ4oxlJC9A4bgWvSw4rB5o1M6Rm4unGvPSm
 DSIawc35bYjfL5DRy/J9AQq/6H1Ls6mRS1ss+hf3Sio4PZaSXOdtVDprhJAnnUYKHk
 PbkBcCidIXdrOgkRt6eoOaH0DlD1iho6UpAjOzq+u+IlPJXy98sNqQ5fMQtc7Jm4UP
 0pfZaFzGAI11o/cP+9Xct5J8jR5661swM+LPoQstiVfAecfHR/iPaEPMHTp2JxKkw9
 bSEQ3ZqTPqxvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 64D26C05FD0; Fri, 29 Apr 2022 13:08:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201991] amdgpu: clock management is disabled for the 4K
 resolution with polaris 10
Date: Fri, 29 Apr 2022 13:08:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201991-2300-W97rF4HDeC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201991-2300@https.bugzilla.kernel.org/>
References: <bug-201991-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201991

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #5 from Alex Deucher (alexdeucher@gmail.com) ---
The driver set minimum required clocks to meet the required bandwidth and
voltage  for the attached displays.  When you enable overclocking (via the =
bit
in ppfeaturemask), that gets partially disabled to allow the user to manual=
ly
adjust the clocks at their own risk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
