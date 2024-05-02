Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A818B9515
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A975B10EC84;
	Thu,  2 May 2024 07:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jaUGu14h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8691110EC84;
 Thu,  2 May 2024 07:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714633778;
 bh=ADRmS8f5vU4gR759YBeJrW1kSqxBWwnLaBbxtr3BdyI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jaUGu14hawcP302lr4k1pmDYsIMtScgmJrmTM3oV8z5BRSe5xRJX5ocGShY45do0k
 gDq9AFrNCJYrXfYKal5XGxtqL0lFFBmgc4pUSoaGA74WFb/XiQRDDAtIgZt1Wqvo6t
 Qapry2plpOfsZoof4zhQBV2CUi5Xgz3tJe+eeZeyuxfuMtI/Qeiop+8KmISga7Rij2
 X09JNsTZQx1/GCWEmcazxIKbS7+Xt2Vy9IAV+8oZ0qMGR8BV3dYVj4UJUyx+VJAGLh
 rWvlWtAV0chkeUQM3MWiMX4nIgTbwMaR9G+TQxLm5iSr9WpszLnEAQXrPHb5Qxz5po
 yB9XQVTPTvfKA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 67BD3378001E;
 Thu,  2 May 2024 07:09:37 +0000 (UTC)
Date: Thu, 2 May 2024 09:09:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Qiang Yu <yuq825@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig= <christian.koenig@amd.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 1/2] drm/panfrost: Fix dma_resv deadlock at drm
 object pin time
Message-ID: <20240502090936.2156c025@collabora.com>
In-Reply-To: <20240501065650.2809530-2-adrian.larumbe@collabora.com>
References: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
 <20240501065650.2809530-2-adrian.larumbe@collabora.com>
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

On Wed,  1 May 2024 07:55:59 +0100
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

You should probably mention that drm_gem_shmem_object_pin() assumes the
lock to be held, thus explaining the drm_gem_shmem_pin() ->
drm_gem_shmem_object_pin() transition.

Oh, and the commit message refers explicitly to Panfrost in a few places
even though you're fixing Lima as well.

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
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

With the commit message adjusted as suggested,

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/lima/lima_gem.c         | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_=
gem.c
> index 7ea244d876ca..c4e0f9faaa47 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -185,7 +185,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
>  	if (bo->heap_size)
>  		return -EINVAL;
> =20
> -	return drm_gem_shmem_pin(&bo->base);
> +	return drm_gem_shmem_object_pin(obj);
>  }
> =20
>  static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *m=
ap)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index d47b40b82b0b..f268bd5c2884 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -192,7 +192,7 @@ static int panfrost_gem_pin(struct drm_gem_object *ob=
j)
>  	if (bo->is_heap)
>  		return -EINVAL;
> =20
> -	return drm_gem_shmem_pin(&bo->base);
> +	return drm_gem_shmem_object_pin(obj);
>  }
> =20
>  static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_obj=
ect *obj)

