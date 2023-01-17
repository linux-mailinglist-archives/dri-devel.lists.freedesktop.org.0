Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553866E434
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AF510E5A9;
	Tue, 17 Jan 2023 16:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C1D10E590
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:57:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F082661265
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64CCCC433F2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673974639;
 bh=YvUx6vbEExKk2a6kWxrM5MtUZLNRQv49//PCBU/f784=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Lt7v1WTmhHY4KAdOtQppgI43Yuu8DOG2xLAVXcRiksdu35cbAT0xb+sYAJFtkVbSe
 r5tnFqznsADzAtIpB574ELonIbpR3SSRE/SmZGhbSmiE3gvc3SxvjIRQHeowAuO43m
 QLII2G0LXqceThjnv25N/d7wSqxr+aC9Zcunto1JFBeR2r+YmQbWkbCErvW1C3LZgr
 irlCoo9k3wPLGEQPu2Z0xviY5LFD3UMUu6+itar+QkYSmwfI/X8PrRGO7ZgkPUMwfB
 GflqH+6cor1yqZf5MYOiYHzt26qPaKtCYJHN0+TACHomO7b+JP8alH8zFCom7sNZx6
 MgzmMy7hYeR/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4EE62C43143; Tue, 17 Jan 2023 16:57:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Tue, 17 Jan 2023 16:57:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jrf@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-3dsJGkXVB0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #27 from Rainer Fiebig (jrf@mailbox.org) ---
(In reply to Alex Deucher from comment #26)
> (In reply to Rainer Fiebig from comment #25)
> > (In reply to Alex Deucher from comment #23)
> > > I'll just revert it.  It is more important for kernels with the the
> > > drm_buddy changes.
> >=20
> > Would the following be equivalent to what you intended with your commit?
> > Looks a bit awkward but hibernate/resume work with it for 6.0.19 (and a
> > Ryzen 5600G):
> >=20
> >=20
> > uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
> >                                           uint32_t domain)
> > {
> >       if (domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT=
)) {
> >               domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> >               if ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_=
type =3D=3D
> > CHIP_STONEY))
> > {
> >                       if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THRES=
HOLD)
> >                               domain =3D AMDGPU_GEM_DOMAIN_GTT;
> >               }
> >       }
> >       return domain;
> > }
> >=20
> >=20
> > Let me know whether this is worth persuing. I could then test it with
> > 5.15.88 and 6.1.6.
>=20
> Nope.  What my patch does is allow display buffers to be in either system
> memory (GTT) or carve out (VRAM) depending on what is available.  Without
> the patch, the driver picks either VRAM or GTT depending on how much VRAM=
 is
> available on the system.  This can lead to memory exhaustion in some cases
> with multiple large resolution monitors depending on memory fragmentation.
>=20
> What your patch does is just always use VRAM unless the chip is Carrizo or
> Stoney.  So it is effectively just reverting the commit (depending on how
> much VRAM your system has).

I see. Thanks a lot for the explanation!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
