Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E677A777E5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6937C10E539;
	Tue,  1 Apr 2025 09:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bU+d4FUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724E510E0A8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743500385;
 bh=Ah+mV8yuvZRy/olIXu1yJ6+e1HLEkDn2tSZ5n3RQDuI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bU+d4FUYY/c4bGEcpy0FZircnLalG2hJ+JQfnaYRxkTK72wUc91t/EY0QeWe/E6UM
 ydNAWupakCbIwl6WR4jP4SAxdtwQQcnATpUZaOlJ6nr0teQNacsbtsZGAPjwLxm+4M
 ARFq9yzY55L0SeNjp3CuCf8CXt0XMX6AaIFaPmaulfo6tTrM/zktPxGE+ma7qumUd0
 s7BTxsb6hzi2vMvmFMgxOodb0UeTjF2TieJd97ISIzq+NRq6pWXHSXkvDh0sBBLGKl
 9vpC0F9+4V4yOt0ttxHC/L5ogRSxR29DYO39z+AmuehX8Kaqbf4cgMihGlNX8Yu/wq
 n3nYTAtbKTlTg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7273017E0CD1;
 Tue,  1 Apr 2025 11:39:44 +0200 (CEST)
Date: Tue, 1 Apr 2025 11:39:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v2 6/6] drm/panfrost/panthor: Take sparse objects
 into account for fdinfo
Message-ID: <20250401113940.089e4e14@collabora.com>
In-Reply-To: <20250326021433.772196-7-adrian.larumbe@collabora.com>
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
 <20250326021433.772196-7-adrian.larumbe@collabora.com>
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

On Wed, 26 Mar 2025 02:14:26 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Make use of the new shmem helper for deciding whether a GEM object has
> backing pages.

This should be done in patch 4, otherwise the series is not bisectible.

>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
>  drivers/gpu/drm/panthor/panthor_gem.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 0cda2c4e524f..2c6d73a7b5e5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -200,7 +200,7 @@ static enum drm_gem_object_status panfrost_gem_status=
(struct drm_gem_object *obj
>  	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
>  	enum drm_gem_object_status res =3D 0;
> =20
> -	if (bo->base.base.import_attach || bo->base.pages)
> +	if (drm_gem_shmem_is_populated(&bo->base))
>  		res |=3D DRM_GEM_OBJECT_RESIDENT;
> =20
>  	if (bo->base.madv =3D=3D PANFROST_MADV_DONTNEED)
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 8244a4e6c2a2..48930fe7b398 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -155,7 +155,7 @@ static enum drm_gem_object_status panthor_gem_status(=
struct drm_gem_object *obj)
>  	struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>  	enum drm_gem_object_status res =3D 0;
> =20
> -	if (bo->base.base.import_attach || bo->base.pages)
> +	if (drm_gem_shmem_is_populated(&bo->base))
>  		res |=3D DRM_GEM_OBJECT_RESIDENT;
> =20
>  	return res;

