Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9A18CD1EF
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475F510E2E7;
	Thu, 23 May 2024 12:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qxj091ez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A3410E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716466403;
 bh=+CYaVxTzq0ceeLUfwVvZ2nYbnTRs9uaqpHkH+8hVsI0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qxj091ezU6J4Fi5axDKhXEY+6AH4RF97BlNBObMD0d/Ay46uRPApd+bV4Lr1KjFHX
 Li3b/WIjk7MOYGGrAdiDyXsUGz+UBC3PzkQXaLSJnQA/Sf9HxeF+zLa2guF3Z+jZni
 8pVnuArxpFyYW/fD5SVpinh4yknPtWU0z08URfYJIDvmSacZLL6jWEP4NB/AjIzieD
 XyLvj59Eu175MLhJSTLZQ/9dgSG3SEYmNBte/u+rd/QfHeCaBwmNNnB5ZMk6Gd4sNp
 HTf+ikygIrjujcfXwy7BW3xmlOjL0Mdmx+xSWfQ5/wBn4jy00OP+mU3oAiWttWr5o+
 3QS9nFpM729XA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5EC473782039;
 Thu, 23 May 2024 12:13:22 +0000 (UTC)
Date: Thu, 23 May 2024 14:13:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/3] drm/lima: Fix dma_resv deadlock at drm object
 pin time
Message-ID: <20240523141321.52ea7224@collabora.com>
In-Reply-To: <20240523113236.432585-3-adrian.larumbe@collabora.com>
References: <20240523113236.432585-1-adrian.larumbe@collabora.com>
 <20240523113236.432585-3-adrian.larumbe@collabora.com>
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

On Thu, 23 May 2024 12:32:18 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit a78027847226 ("drm/gem: Acquire reservation lock in
> drm_gem_{pin/unpin}()") moved locking the DRM object's dma reservation to
> drm_gem_pin(), but Lima's pin callback kept calling drm_gem_shmem_pin,
> which also tries to lock the same dma_resv, leading to a double lock
> situation.
>=20
> As was already done for Panfrost in the previous commit, fix it by
> replacing drm_gem_shmem_pin() with its locked variant.
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
>  drivers/gpu/drm/lima/lima_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_=
gem.c
> index 7ea244d876ca..9bb997dbb4b9 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -185,7 +185,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
>  	if (bo->heap_size)
>  		return -EINVAL;
> =20
> -	return drm_gem_shmem_pin(&bo->base);
> +	return drm_gem_shmem_pin_locked(&bo->base);
>  }
> =20
>  static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *m=
ap)

