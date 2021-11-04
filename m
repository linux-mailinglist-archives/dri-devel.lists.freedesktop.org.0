Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC044516C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 11:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD2E89F41;
	Thu,  4 Nov 2021 10:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E0D89F41
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 10:09:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 02C286121E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636020564;
 bh=rC5iwfSLpIiy9WMeZkcoWf6jYex4lxtTvANCj8mZdVw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=naCVFZILnhs7DfI2tBzCbHaOxd+GIe3qOiRS19ljmpcppfJkWGOWGiFvj49k5vc7Q
 6EkteRAH/xnoP1tGQerr8ahzOL1K2Mw1y5zrB5hkcCs9TTQxL10F/H6cldV7rJQ2iH
 WWd+J52Bah0aPmpssX9dBYqvfJFN2SQLjnq50d5BXXfZnoJ1+EGhgWVGL22FOPJAtm
 21lTLKPiBcJ2vIyeywP0vn0iNryUNSK8ldHJ0cd5DJDQcWQaCHM7W8sk0YfPuXUuqP
 yQ37lFsJkwpOYt+vddo0lB6di3iO9756p3LBL0FJhRPPIlw2dyRgXLGccY9kVIEohX
 0V/K1uhXeHP/w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0007960F48; Thu,  4 Nov 2021 10:09:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Thu, 04 Nov 2021 10:09:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Lang.Yu@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-D9XyWNxUoo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #10 from Lang Yu (Lang.Yu@amd.com) ---
(In reply to Christian K=C3=B6nig from comment #9)
> (In reply to Lang Yu from comment #8)
> > (In reply to Christian K=C3=B6nig from comment #7)
> > > Yeah, that won't work. As far as I can see the problem is not inside
> > amdgpu,
> > > but rather inside the driver which is importing buffers from amdgpu.
> >=20
> > At least, we should call drm_prime_gem_destroy() to detach dma-buf(if
> > exists) before WARN_ON_ONCE(bo->pin_count).
>=20
> Nope, that's incorrect. You are mixing things up here.
>=20
> This is for the case when amdgpu imports a buffer, but the warning happens
> when amdgpu exports a buffer.
>=20
> And on import you indeed only want to drop the attachment after the BO is
> really destroyed or not when the GEM handle is destroyed. Otherwise you
> could potentially unmap memory while it is still used by the hardware.
>=20
> > And do you think if clients don't unmap/detach amdgpu dma-buf properly,
> > should amdgpu do that work? Thanks!
>=20
> No. That rather looks like the importer is messing up some reference count
> and forgets to destroy the attachment before the dma-buf. There is
> absolutely nothing the exporter can do in that situation.
>=20
> There is the slightly chance that the bug is indeed somewhere inside amdg=
pu
> or the dma-buf framework itself (Michel and I are huntin a similar issue =
at
> the moment), but it does work with other driver combinations.

Thanks for your clarification. Seems hard to reproduce the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
