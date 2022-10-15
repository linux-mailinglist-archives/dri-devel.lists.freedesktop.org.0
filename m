Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721365FFA8B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 16:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D8210E4D3;
	Sat, 15 Oct 2022 14:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0642810E4D3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 14:34:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B73BB802C8
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 14:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B4CFC433D6
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665844452;
 bh=vbntyGctpae0ViuHYrlIGH+2/V2bFr22hf7QbgFNR7Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GQcttkCoJs8dpsYWjSl0WGMUB72ionyFIdYgNalOe/1iAwtiX8NQhz9QZNDjxexEL
 MlDhq79u5LvjF/JXaLuP6CnBCn6muMXFYfFKvT8tMtbnHp27mMfi4wEtSYIDi/u0cp
 nyWIsl3ORl+7AbsVRAWIZgee4TKoCMJ7y9hiuH3fWuQZdY70xmBMg7lUcW2pE4rLeu
 gmCLpEspUyuX3IbE4+KvxxHbyOgeuQMizbjETYbeXMktCqDgoJ/wg8pjxGMq6SfIyy
 x1VjxjF7vGyS0Gr+fwCTQzNRz+xwUFXyDX56j7on3wqquMGA0RYSjhsg394khmeugK
 NNit+FDf2XKpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 26E17C433E7; Sat, 15 Oct 2022 14:34:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214425] [drm][amdgpu][TTM] Page pool memory never gets freed
Date: Sat, 15 Oct 2022 14:34:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rafael.ristovski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214425-2300-n8aEJjtwZJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214425-2300@https.bugzilla.kernel.org/>
References: <bug-214425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214425

Rafael Ristovski (rafael.ristovski@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rafael.ristovski@gmail.com

--- Comment #1 from Rafael Ristovski (rafael.ristovski@gmail.com) ---
According to amdgpu devs, this is a feature where the allocated pages are k=
ept
around in case they are needed later on. TTM is able to release the memory =
in
case the memory pressure increases.

See comment here:
https://gitlab.freedesktop.org/drm/amd/-/issues/1942#note_1311016

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
