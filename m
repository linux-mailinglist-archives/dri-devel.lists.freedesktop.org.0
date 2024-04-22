Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06648AC468
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 08:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3AB1127F7;
	Mon, 22 Apr 2024 06:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gibkXzTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49551127F4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 06:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713768066;
 bh=xUjMhHWo1KCj813iX+NRGzOHabw3nJHC+HT2JFsDA9g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gibkXzTBd7/HutMZpceQR6hF9zf2UfcklwY+TiKaAFKwDHzSdGYoSGlqDZGXG1PVj
 /t71+Bjb6RuGZTcWCyK6mN4fjS6QSNw1rs8iwHJPOvEXoVyusi4Ts3LxgoBgajQlKY
 WSGyPpKozq9RuQJQpO4mblbPoYlrNLgJm7Dvoq2DKyRAngmaGsLCpR4GTogDYTdguo
 12gK9coZlA9SuxgYqVqxlB3vtkPbiE9m1bQrZvY0yCrXamM/pjetESCIom+h7sQjbU
 F7uPnMsQk47e+uPKhFZQo7k8m87rF5qgjShg2qR5SE4bLs6UuiqpUqVd9BT3BE3aZQ
 aLymzO/IIOF/g==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C97C1378001E;
 Mon, 22 Apr 2024 06:41:05 +0000 (UTC)
Date: Mon, 22 Apr 2024 08:41:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Zack Rusin <zack.rusin@broadcom.com>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/panfrost: Fix dma_resv deadlock at drm object pin time
Message-ID: <20240422084103.1a9fbef6@collabora.com>
In-Reply-To: <20240421163951.3398622-1-adrian.larumbe@collabora.com>
References: <20240421163951.3398622-1-adrian.larumbe@collabora.com>
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

On Sun, 21 Apr 2024 17:39:47 +0100
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
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/u=
npin}()")
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index d47b40b82b0b..6c26652d425d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -192,7 +192,12 @@ static int panfrost_gem_pin(struct drm_gem_object *o=
bj)
>  	if (bo->is_heap)
>  		return -EINVAL;
> =20
> -	return drm_gem_shmem_pin(&bo->base);
> +	/*
> +	 * Pinning can only happen in response to a prime attachment request fr=
om
> +	 * another driver, but that's already being handled by drm_gem_pin
> +	 */
> +	drm_WARN_ON(obj->dev, obj->import_attach);
> +	return drm_gem_shmem_pin_locked(&bo->base);
>  }
> =20
>  static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_obj=
ect *obj)
>=20
> base-commit: 04687bff66b8a4b22748aa7215d3baef0b318e5b

