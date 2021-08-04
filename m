Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425913E0156
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 14:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472846E329;
	Wed,  4 Aug 2021 12:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A776E329
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 12:43:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C9F360F43
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628081008;
 bh=siJy3Gl6j+rVHskrmTTbbs4uh5ZC5SBbf6gvQakpAL0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EN/C2dtLOSD0WoVFVGFbYNHRoFFZNtSdVEtCNcxP4tytzQ4jkxdd36/MWuy+YLVyi
 47ymKLXBF+soOFoMv0WLa0p3IYY+Uo/K8OqvFUAl38+Xmwj8Q+NT8wESIC4MzW4K6z
 llXFPwXLaOrhbWPpjsUdlcZmlLXIALTP6r9jObFFvXT/i+n/EhYbRpUQrGJSpUqNyU
 3cjI2pUe4dMY3sArJ9XqosNF7iqyQfQDY8utGAS6zcutbzlrOiCagaPPnEC0adqmsU
 k0iqPxdcDDffhUEeo2CLHz2uKH3sCIS2EdPNkUIN+7E2nFpEC7mszryvEKWPxtfRDW
 pFW/L4p+kkpSQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 79DCE603BE; Wed,  4 Aug 2021 12:43:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 04 Aug 2021 12:43:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-p8ETNzbsW6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #35 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 298193
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298193&action=3Dedit
/var/log/kern.log running amd-drm-next-5.14-2021-05-12 (ae30d41eb) with Xorg

Sorry for the long delay.
I've tested:


1. Current Debian-11 testing Linux-5.10.0-8 with amdgpu.ip_block_mask=3D0x0=
ff
while running Xorg.
Result: everything ok


2. amd-drm-next-5.14-2021-05-12* (ae30d41eb) without any special kernel opt=
ions
while running Xorg.
Result:
- crashes
- also the screen starts flickering about every 10 seconds after second res=
ume
  - flickering also happens with using a8f768874^ (before the first fix-com=
mit
by Alex D.)
- log attached: 5.12.0-rc7-original-ae30d41eb_crash.txt


3. Upstream Linux-5.14.0-rc4.
Result: Still broken.


----


*
amd-drm-next-5.14-2021-05-12
https://gitlab.freedesktop.org/agd5f/linux/-/tree/amd-drm-next-5.14-2021-05=
-12
ae30d41eb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
