Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3763B5264
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jun 2021 09:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7816E10C;
	Sun, 27 Jun 2021 07:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE2A6E10C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 07:14:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 51DB4619D1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 07:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624778091;
 bh=jlg0TYSnxdBo3672vvsMu59s/3Tj7FXikJYupHEkWHE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gunYQIqvLY8pGwIGvPH/9DVFlOkXB5bXHF/fKAPxAuysBVm6OC/ZqeyBVMpCUqTAD
 9+7c22G8Lp7ix1B0Jdu5xvs5RBVGXBjmBWIllvWzIDibAw0pXY6rvWbrojfoLf48WF
 /5611qeONfQUwSYRg8dJnNaNt346+XOZMuclT2mAlcaPEmsfp0zvZvuZxGNYweSGWg
 /2ta9sfdGXc+yinaHSR0MhbPNwHxT0/X04TNLHqHcbQVKQHHQqwZWPwBMbOBNadFxi
 caO87+T7OXAqztXW75b1IvIoZ5PJUtYlXfKgG0bhWbUbIXxoCzSGA1Uor4TYG5qgkg
 pvpZvsh7pqkcw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 465A261246; Sun, 27 Jun 2021 07:14:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213569] Amdgpu temperature reaching dangerous levels
Date: Sun, 27 Jun 2021 07:14:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fkrueger@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213569-2300-XebLQJugIu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213569-2300@https.bugzilla.kernel.org/>
References: <bug-213569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213569

Frank Kruger (fkrueger@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fkrueger@mailbox.org

--- Comment #4 from Frank Kruger (fkrueger@mailbox.org) ---
(In reply to miloog from comment #1)
> I can confirm.
>=20
> But in a different scenario. I'm using debian bullseye with lts kernel and
> latest amdgpu firmware. I don't change any fan control mechanism.
>=20
> 5.10.44 and 5.10.45 works fine but 5.10.46 if i'm only start sway (wayland
> window manager) my gpu usage is at 100% without doing anything.
>=20
> It's a vega 56.

You are probably hit by a recent regression introduced with kernel 5.10.46 =
and
5.12.13 (cf. https://bugzilla.kernel.org/show_bug.cgi?id=3D213561), where p=
atches
are on its way
(https://lists.freedesktop.org/archives/amd-gfx/2021-June/065612.html). Thi=
s is
not related to the original bug report here, I presume.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
