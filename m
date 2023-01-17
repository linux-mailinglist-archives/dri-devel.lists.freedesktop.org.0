Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0E866E2A9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 16:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D8610E4A7;
	Tue, 17 Jan 2023 15:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F2410E4A7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 15:46:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EBDD61491
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 15:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2BA6C433EF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673970415;
 bh=T/1bNzzjOvrSpvHMQJn0UeTgBm5IZL3GD+3L7O0MMSE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pvwDoJW7duWgOErhzi2LORNPvi9ot4xoRYZ9uPWcY188KW94l1HGjHLgowZkEFQSo
 G6xF169y3mpYJ/nUeMurXqGgZp0Drf3e3gSW50D7QLtZgRZ8V++kBY7JhYN5+P1WN4
 gUrjW3agNQJaKcA5Yz53NFns1jICHoXzmwQs+LuyKULB53SNIm74r6HMN3YjIf81cg
 aw3RKIrEKw1RJuv9cNJI3Vy+ZnAcBLQV/aCydyT6tfRThFUI3VA7e1TCE7d4yHohNv
 i3lWtgzxsafg3zHY/o8WpFcox+TN68lEkmG/m3biWIGhd7J9+HCVUo8IAm9b7y01Wq
 jL7d9wqzfY72w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C7E3AC43142; Tue, 17 Jan 2023 15:46:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Tue, 17 Jan 2023 15:46:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-CDTAeBADXf@https.bugzilla.kernel.org/>
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

--- Comment #26 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Rainer Fiebig from comment #25)
> (In reply to Alex Deucher from comment #23)
> > I'll just revert it.  It is more important for kernels with the the
> > drm_buddy changes.
>=20
> Would the following be equivalent to what you intended with your commit?
> Looks a bit awkward but hibernate/resume work with it for 6.0.19 (and a
> Ryzen 5600G):
>=20
>=20
> uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>                                           uint32_t domain)
> {
>       if (domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT))=
 {
>               domain =3D AMDGPU_GEM_DOMAIN_VRAM;
>               if ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_ty=
pe =3D=3D
> CHIP_STONEY))
> {
>                       if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THRESHO=
LD)
>                               domain =3D AMDGPU_GEM_DOMAIN_GTT;
>               }
>       }
>       return domain;
> }
>=20
>=20
> Let me know whether this is worth persuing. I could then test it with
> 5.15.88 and 6.1.6.

Nope.  What my patch does is allow display buffers to be in either system
memory (GTT) or carve out (VRAM) depending on what is available.  Without t=
he
patch, the driver picks either VRAM or GTT depending on how much VRAM is
available on the system.  This can lead to memory exhaustion in some cases =
with
multiple large resolution monitors depending on memory fragmentation.

What your patch does is just always use VRAM unless the chip is Carrizo or
Stoney.  So it is effectively just reverting the commit (depending on how m=
uch
VRAM your system has).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
