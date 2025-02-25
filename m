Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C87A443F3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0839010E70C;
	Tue, 25 Feb 2025 15:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gkULc+1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3727110E70C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740496152;
 bh=cIRZUoXqiqNLw/a/W7MMBUFb3l8m44OG4ew0GRkK8/A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gkULc+1AWxgA+2fDCzxKVIccOFF7MGJkzxjKdngHRbCKokB0+AmACmMgvauxBPmVR
 //HehxCYgm8QP7FD7o6nAO+h+TdqomEy5oRCYxLdCQIGalLNk2OKQmN8aID/ANgOBb
 uq2yakzXSxh+EzigpOkEl0OfbsS6HLiIpmzysgLQADdFtzjg8YRfKzBnTm95I8qYzV
 0iCf2ZV7x2NvcVminDhlT8G6gNicotp+xLDgxSMRCRUjBKog549jUGA2xq+xm+uD6X
 L+c8hhCTRlqxo5ifH7sUy6m6x91MpBSkfvyQJMQ/vREmUl0WSaEofoLQm+rVfHmgoL
 lYU/PEx6nkH9A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6245017E088B;
 Tue, 25 Feb 2025 16:09:12 +0100 (CET)
Date: Tue, 25 Feb 2025 16:09:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven
 Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Liviu Dudau
 <liviu.dudau@arm.com>, kernel@collabora.com
Subject: Re: [RFC PATCH 7/7] drm/panfrost/panthor: Take sparse objects into
 account for fdinfo
Message-ID: <20250225160908.4c5a8a41@collabora.com>
In-Reply-To: <20250218232552.3450939-8-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
 <20250218232552.3450939-8-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Tue, 18 Feb 2025 23:25:37 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Because of the alternative definition of the 'pages' field in shmem after=
 adding
> support for sparse allocations, the logic for deciding whether pages are
> available must be expanded.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 4 +++-
>  drivers/gpu/drm/panthor/panthor_gem.c   | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 0cda2c4e524f..ced2fdee74ab 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -200,7 +200,9 @@ static enum drm_gem_object_status panfrost_gem_status=
(struct drm_gem_object *obj
>  	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
>  	enum drm_gem_object_status res =3D 0;
> =20
> -	if (bo->base.base.import_attach || bo->base.pages)
> +	if (bo->base.base.import_attach ||
> +	    (!bo->base.sparse && bo->base.pages) ||
> +	    (bo->base.sparse && !xa_empty(&bo->base.xapages)))
>  		res |=3D DRM_GEM_OBJECT_RESIDENT;

Looks like we want some kind of drm_gem_shmem_is_populated() helper,
and have all drivers doing this pages !=3D NULL test patched to use this
new helper as part of the patch introducing sparse shmem GEMs.

> =20
>  	if (bo->base.madv =3D=3D PANFROST_MADV_DONTNEED)
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 8244a4e6c2a2..8dbaf766bd79 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -155,7 +155,9 @@ static enum drm_gem_object_status panthor_gem_status(=
struct drm_gem_object *obj)
>  	struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>  	enum drm_gem_object_status res =3D 0;
> =20
> -	if (bo->base.base.import_attach || bo->base.pages)
> +	if (bo->base.base.import_attach ||
> +	    (!bo->base.sparse && bo->base.pages) ||
> +	    (bo->base.sparse && !xa_empty(&bo->base.xapages)))
>  		res |=3D DRM_GEM_OBJECT_RESIDENT;
> =20
>  	return res;

