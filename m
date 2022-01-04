Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24130483FB4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 11:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2426E89E47;
	Tue,  4 Jan 2022 10:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3833F89E47
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 10:17:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D414A612E9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 10:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C3F9C36AF3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641291457;
 bh=mLICzlWhtYO+7cR+eP2C+4W6DjbYkry6rI+AhVKDXRc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=svMk5Py+UsF5FkbkfZBDFWZMLo4a7io2FV2YsvY/D8Na/ZfLv1tT1JNuwmjv7hHUV
 VEtQR1uSL4COzxP/1/1x/J7v4vW5fCj5qo3o5H1NFPjUEApJGMHpPjz/EYEbgyxjI5
 x9vupuIFtyGesWrsglI6ikOsuhfK0xANvR9jwtcCTT0sJU9mmFhD0draKOPMZxILIY
 kxZWQeEmp+Q8ZdvEqNbJhskR9XFS/YgFShPE5sZYDBLtfN+LVDK2Jdo9+a9romp/tv
 Kawo+YiCjP27UXB54cGe9n52hGYFPAoMyhgcTRfnw7C0Wc98gHU7KyBMsedjb3j6jf
 fRc8v+poTNxiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2DE5CC05FD4; Tue,  4 Jan 2022 10:17:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Tue, 04 Jan 2022 10:17:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215436-2300-YDfk4SAg52@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

--- Comment #19 from spasswolf@web.de ---
Created attachment 300222
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300222&action=3Dedit
debugging patch

I added some more dev_info calls to figure out where things are called:
[   34.946911] wlp4s0: deauthenticating from 54:67:51:3d:a2:e0 by local cho=
ice
(Reason: 3=3DDEAUTH_LEAVING)
[   35.079021] amdgpu 0000:08:00.0: amdgpu: Calling update_clocks from
dcn10_set_clock
[   35.079026] amdgpu 0000:08:00.0: amdgpu: adev->in_s0ix =3D 0
[   35.079027] amdgpu 0000:08:00.0: amdgpu: calling
rn_vbios_smu_set_dcn_low_power
[   39.030889] PM: suspend entry (s2idle)
[   39.270864] Filesystems sync: 0.239 seconds
[   39.271929] Freezing user space processes ... (elapsed 0.002 seconds) do=
ne.
[   39.274694] OOM killer disabled.
The WLAN message is the first message one gets after initiating suspend. The
interesting thing is that rn_vbios_set_dc_low_power is called before suspend
entry (and there's also a long 4s gap).
   I also have no idea where dcn10_set_clock is called. The only place I fo=
und
is from within dc_set_clock, but dc_set_clock is called nowhere in the enti=
re
amdgpu module.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
