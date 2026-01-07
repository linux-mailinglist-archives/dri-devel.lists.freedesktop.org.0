Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEECFD577
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 12:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8C10E051;
	Wed,  7 Jan 2026 11:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JeNoit3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4262210E051
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767784359;
 bh=SIuRCY5B8G6/Y2yx+ABwBLAUOem5XagaWTiCtTcbOjc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JeNoit3p9aAFYtexMiWlGc1tcmle7WtaOqKBFi0v3JuFfssyZE4oC5T88IMM2NVgG
 l/D1z5XM7MZRkLULiv9YcVOqI0lId8FeKHheA30g7jsWcYnfygP8bVZnf+3qglMbZV
 xiJpbkyvWcK+TyPNrvYn9Wa1nPoMvQfj5SRKHlyDTGvCewfNFOvCq71apQpw0zHcQt
 6q9FQdC/KbUYilLD6sJ+IUkn+g/3Gg41isoE+vDLms7yGcE7JYh2Y7rxIfWchukqVz
 UguqfIdPxCz45K/dfK1yxB8lubtfTHGvChGBRU1L2KWqmcpOxcZpcCeTu06Ium4JHb
 fN1hv1H0gsqRA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 79D0617E1340;
 Wed,  7 Jan 2026 12:12:39 +0100 (CET)
Date: Wed, 7 Jan 2026 12:12:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel@collabora.com, =?UTF-8?B?TG/Dr2M=?= Molinari
 <loic.molinari@collabora.com>
Subject: Re: [PATCH] drm/gem: Fix a GEM leak in drm_gem_get_unmapped_area()
Message-ID: <20260107121232.6e1efae5@fedora>
In-Reply-To: <20260106164935.409765-1-boris.brezillon@collabora.com>
References: <20260106164935.409765-1-boris.brezillon@collabora.com>
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

On Tue,  6 Jan 2026 17:49:35 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> drm_gem_object_lookup_at_offset() can return a valid object with
> filp or filp->f_op->get_unmapped_area set to NULL. Make sure we still
> release the ref we acquired on such objects.
>=20
> Cc: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() fop")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 36c8af123877..f7cbf6e8d1e0 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1298,11 +1298,13 @@ unsigned long drm_gem_get_unmapped_area(struct fi=
le *filp, unsigned long uaddr,
>  	unsigned long ret;
> =20
>  	obj =3D drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
> -	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> -		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
> +	if (IS_ERR(obj))
> +		obj =3D NULL;
> =20
> -	ret =3D obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
> -						 flags);
> +	if (!obj || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> +		ret =3D mm_get_unmapped_area(filp, uaddr, len, 0, flags);

Also, I'm wondering if we shouldn't pass pgoff instead of zero here to
have the exact same behavior that existed before
drm_gem_get_unmapped_area() was introduced.

> +	else
> +		ret =3D obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0, f=
lags);
> =20
>  	drm_gem_object_put(obj);
> =20

