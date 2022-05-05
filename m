Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99CD51C3B6
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BA610E1F6;
	Thu,  5 May 2022 15:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850A710E142
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:19:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D095461D40
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3D88C385B5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651763943;
 bh=bBGItYu2Oao/27GF222O3bB6guVN+aUo7qaAEM+0pJU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LHO8xDkuk33jIwzjvv7pHu7JMfpRv91W8wvixCPbPOytfO9fPcO8nhgxs8bn1/sr3
 /ZoCAxJTp56qvBqIy5Oro9UaI3pcIYWfubnDr8dyECHRT9+tbGE4CEyT9qPr527BpV
 E3euUvkODlfUHnNNMeYNegOr6snG0tb6zskaXLY3gQ8O5S81XazClTIqgO3kMrjtGc
 zalLj6jcfy466TK3YF4LrDIyVRh1Bnubd4cbxyoFKXlVVxcjtXpaaZNQfkWX01qmc9
 tmj/IU9XXfoAF5+D6WRL4mlHOISE69FbSacxtKuUKx8MjdFCBx0MZu19K/LrkP545i
 IXsH2FHOyxe3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 935AEC05FD2; Thu,  5 May 2022 15:19:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 05 May 2022 15:19:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: s48gs.w@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-lRqcRLVr35@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

Danil (s48gs.w@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |s48gs.w@gmail.com

--- Comment #68 from Danil (s48gs.w@gmail.com) ---
Had this problem with Ryzen3 3200 CPU (Vega8 integrated) on A320M-DVS R4.0
motherboard.=20
microcode: CPU: patch_level=3D0x08108109
microcode: Microcode Update Driver: v2.2.

I had 100% scenario to trigger freeze:
1. play video (in webbrowser or video player, should stay visible(dont hide=
 tab
or minimize window))
2. open shadertoy website (any shader, keep it rendering also keep window
visible)=20
3. open any OpenGL or Vulkan application (that use integrated GPU)
4. start pressing fullscreen/un-fullscreen button on shadertoy shader (~5 t=
imes
is enough to trigger bug, system will slowdown slowly in next 10-20 mins ti=
ll
freeze, just wait(visible on shadertoy FPS counter))
... and freeze

I use this PC for 2 years, every Linux kernel had this "freeze" when used
integrated GPU. Current kernel OpenSuse 5.17.4-1-default.
(my solution for all this time was obvious - disable integrated GPU in BIOS=
 and
use discrete only, and everything works)

Today I checked motherboard website -
https://asrock.com/MB/AMD/A320M-DVS%20R4.0/index.asp#BIOS they have 7.00 and
7.10 BIOS, I was on 4.00 BIOS
So I updated BIOS to 7.00 and 7.10 (now)... and everything works - no freez=
es
anymore.
So it was firmware problem (atleast for me) that fixed by BIOS update.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
