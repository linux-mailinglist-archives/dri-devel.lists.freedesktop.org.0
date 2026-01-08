Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593AAD031EB
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9356010E729;
	Thu,  8 Jan 2026 13:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V/TT2UAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D11E10E729
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767879830;
 bh=8zfPaqX+0CQVCJHmHIWGRax0qrh8hIwIn4sBCLjMtTs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V/TT2UAmGCQeava9cll9+rbOz88b4UWE5MBvvw+fYhISOTcw67SW2G1FLqyVF7ztU
 Lz+vHzWHpUcy2TSRamofsVkmPumgV7vAvmT1CHeRhJGAE9/M/tOifmlA/VkfD23t3N
 Xk0wKtjLCnzBw1CbdROlzOreVnoMitkzEF/UnQCouC/9e03RJcPdCu/0MFyOHM2MK2
 SKaFC401H+MsiTZDeVDbw1r2HwCPNOkXXEMSSy9U9ULMm7kY/iF0w6QRwthUBNoIa1
 xrxhRQOQJZIBpNIF9hS6H9JW33R9OXqMeYv7utEiBNNZJfGF6Sqk2KBCDJExHsWhEl
 zVgAzDNwoj3OA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BBB917E0125;
 Thu,  8 Jan 2026 14:43:50 +0100 (CET)
Date: Thu, 8 Jan 2026 14:43:44 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@collabora.com
Subject: Re: [PATCH] drm/gem: Fix a GEM leak in drm_gem_get_unmapped_area()
Message-ID: <20260108144344.33952ddf@fedora>
In-Reply-To: <43836c92-d19e-43c9-8480-cb26c37bdfea@collabora.com>
References: <20260106164935.409765-1-boris.brezillon@collabora.com>
 <20260107121232.6e1efae5@fedora>
 <43836c92-d19e-43c9-8480-cb26c37bdfea@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 8 Jan 2026 14:25:01 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> On 07/01/2026 12:12, Boris Brezillon wrote:
> > On Tue,  6 Jan 2026 17:49:35 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >  =20
> >> drm_gem_object_lookup_at_offset() can return a valid object with
> >> filp or filp->f_op->get_unmapped_area set to NULL. Make sure we still
> >> release the ref we acquired on such objects.
> >>
> >> Cc: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> >> Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() f=
op")
> >> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >> ---
> >>   drivers/gpu/drm/drm_gem.c | 10 ++++++----
> >>   1 file changed, 6 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> >> index 36c8af123877..f7cbf6e8d1e0 100644
> >> --- a/drivers/gpu/drm/drm_gem.c
> >> +++ b/drivers/gpu/drm/drm_gem.c
> >> @@ -1298,11 +1298,13 @@ unsigned long drm_gem_get_unmapped_area(struct=
 file *filp, unsigned long uaddr,
> >>   	unsigned long ret;
> >>  =20
> >>   	obj =3D drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SH=
IFT);
> >> -	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> >> -		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
> >> +	if (IS_ERR(obj))
> >> +		obj =3D NULL;
> >>  =20
> >> -	ret =3D obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
> >> -						 flags);
> >> +	if (!obj || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> >> +		ret =3D mm_get_unmapped_area(filp, uaddr, len, 0, flags); =20
> >=20
> > Also, I'm wondering if we shouldn't pass pgoff instead of zero here to
> > have the exact same behavior that existed before
> > drm_gem_get_unmapped_area() was introduced.
> >  =20
>=20
> For mappings with a file (the DRM file in our case), if=20
> filp->f_op->get_unmapped_area isn't set then generic_get_unmapped_area()=
=20
> is used and it ignores the pgoff argument.

That's true for architectures that rely on the default implementation
(Arm64 for instance), but other architectures might have their own
implementation.


> So it wasn't 0 before but was=20
> ignored anyway.

Didn't check all of them but the Arm implementation does take this
pgoff into account if I read the code correctly [1]. The fact this
argument is passed around makes me think other architectures might take
this into account too. I know this pgoff is just a fake offset into the
/dev/dri pseudo-file, but if we want to err on the safe side, we'd
rather do exactly what was done before drm_gem_get_unmapped_area() was
introduced for the ->filp=3D=3DNULL case. That's just my 2 cts, of course.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v6.18.3/source/arch/arm/mm/mmap.c#L30
