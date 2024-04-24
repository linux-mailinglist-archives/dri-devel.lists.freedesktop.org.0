Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31A8B02D6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 09:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFAC112569;
	Wed, 24 Apr 2024 07:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JDXd0AkD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D430E10FDAA;
 Wed, 24 Apr 2024 07:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713942272;
 bh=nJVKTHFvXTmcgK94/e0JrZRbtF6RLuWFoyU5TaTbIOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JDXd0AkDQ8uya67kE3ZEEZf2wWXQRYf3Hz75PsC7+NlvLgkn1NHD+ydLruToXEkSZ
 0ETIuuGd33BQ3FKDRAmYj30rOV6Zzsm9LiPqTLaJppVDkYkKiv1d1T5cYrHytjamZM
 eOKf8WpDo+YbKUcQzl+GLdftGAklXTvsk9D9Sp5xqQ5QrYyhupoISuBbBY05J9YR8M
 nQROEkUSxZvYCEvQxIIEQ0il0EY8Ga6rU9Mt0VbIOv6pZ+pVOszvqTYzatt7fMGo3S
 RXHeif6d9ORwnABYkV+QzXebbfQubxOeZYNWQiz7TXTKrIUABcDvQfoOOsCkC8XlI4
 dy6KOnttCY2ZQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 64FA63781182;
 Wed, 24 Apr 2024 07:04:31 +0000 (UTC)
Date: Wed, 24 Apr 2024 09:04:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Qiang Yu <yuq825@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] drm/panfrost: Fix dma_resv deadlock at drm object
 pin time
Message-ID: <20240424090429.57de7d1c@collabora.com>
In-Reply-To: <20240423224651.138163-1-adrian.larumbe@collabora.com>
References: <20240423224651.138163-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Tue, 23 Apr 2024 23:46:23 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> When Panfrost must pin an object that is being prepared a dma-buf
> attachment for on behalf of another driver, the core drm gem object pinni=
ng
> code already takes a lock on the object's dma reservation.
>=20
> However, Panfrost GEM object's pinning callback would eventually try taki=
ng
> the lock on the same dma reservation when delegating pinning of the object
> onto the shmem subsystem, which led to a deadlock.
>=20
> This can be shown by enabling CONFIG_DEBUG_WW_MUTEX_SLOWPATH, which throws
> the following recursive locking situation:
>=20
> weston/3440 is trying to acquire lock:
> ffff000000e235a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_sh=
mem_pin+0x34/0xb8 [drm_shmem_helper]
> but task is already holding lock:
> ffff000000e235a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_pi=
n+0x2c/0x80 [drm]
>=20
> Fix it by assuming the object's reservation had already been locked by the
> time we reach panfrost_gem_pin.
>=20
> Do the same thing for the Lima driver, as it most likely suffers from the
> same issue.
>=20
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/u=
npin}()")
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/lima/lima_gem.c         | 9 +++++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 8 +++++++-
>  2 files changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_=
gem.c
> index 7ea244d876ca..8a5bcf498ef6 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -184,8 +184,13 @@ static int lima_gem_pin(struct drm_gem_object *obj)
> =20
>  	if (bo->heap_size)
>  		return -EINVAL;
> -
> -	return drm_gem_shmem_pin(&bo->base);
> +	/*
> +	 * Pinning can only happen in response to a prime attachment request
> +	 * from another driver, but dma reservation locking is already being
> +	 * handled by drm_gem_pin

This comment looks a bit weird now that you call a function that
doesn't have the _locked suffix. I'd be tempted to drop it, or clarify
the fact drm_gem_shmem_object_pin() expects the resv lock to be held.

> +	 */
> +	drm_WARN_ON(obj->dev, obj->import_attach);

Should this be moved to drm_gem_shmem_[un]pin_locked() instead of being
duplicated in all overloads of ->[un]pin()?

> +	return drm_gem_shmem_object_pin(obj);
>  }
> =20
>  static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *m=
ap)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index d47b40b82b0b..e3fbcb020617 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -192,7 +192,13 @@ static int panfrost_gem_pin(struct drm_gem_object *o=
bj)
>  	if (bo->is_heap)
>  		return -EINVAL;
> =20
> -	return drm_gem_shmem_pin(&bo->base);
> +	/*
> +	 * Pinning can only happen in response to a prime attachment request
> +	 * from another driver, but dma reservation locking is already being
> +	 * handled by drm_gem_pin
> +	 */
> +	drm_WARN_ON(obj->dev, obj->import_attach);
> +	return drm_gem_shmem_object_pin(obj);
>  }
> =20
>  static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_obj=
ect *obj)

