Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC308B94F8
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C4510ED3E;
	Thu,  2 May 2024 07:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FjEkK6MI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E01A10ECA2;
 Thu,  2 May 2024 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714633311;
 bh=ye0z1gvg/13+dE7aKuIpgiRz56aWOAjKJk0D7Jw1sUo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FjEkK6MIljTrW0uRzXQtKQ1y+L14noagP3H/HU6s67kg11Ms7psh0xBb+Uy8Vxp/0
 m3W/xptTS4qVG6ogj0md1BNlSq/ovLmjiE28jRYKCpcBgPxZuXqnLJj7J3TbaD8cCK
 LcX3zoQNgKeOabzgC+q415bkgSvNDwGBf+Xs6EyP/sAwjw7Ch7m2c9OELBUWiWECNx
 SVRgHGQqDCS9w/740n9hXChe/oZbLvS2Ea33E7KRMKGAUoq0RObgbyVHGtJjNipn8d
 6FYWxYhjaH0LOBfsOgj5VFcKhlbWA7Gd9rHqmNE9BAdIfgYEr6p7QpArQ3yDz+Muo6
 KuN8lPAhZp5wA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4D2F378001E;
 Thu,  2 May 2024 07:01:50 +0000 (UTC)
Date: Thu, 2 May 2024 09:01:49 +0200
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
Subject: Re: [PATCH v3 2/2] drm/gem-shmem: Add import attachment warning to
 locked pin function
Message-ID: <20240502090149.6b33817e@collabora.com>
In-Reply-To: <20240501065650.2809530-3-adrian.larumbe@collabora.com>
References: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
 <20240501065650.2809530-3-adrian.larumbe@collabora.com>
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

On Wed,  1 May 2024 07:56:00 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit ec144244a43f ("drm/gem-shmem: Acquire reservation lock in GEM
> pin/unpin callbacks") moved locking DRM object's dma reservation to
> drm_gem_shmem_object_pin, and made drm_gem_shmem_pin_locked public, so we
> need to make sure the non-NULL check warning is also added to the latter.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 177773bcdbfd..ad5d9f704e15 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -233,6 +233,8 @@ int drm_gem_shmem_pin_locked(struct drm_gem_shmem_obj=
ect *shmem)
> =20
>  	dma_resv_assert_held(shmem->base.resv);
> =20
> +	drm_WARN_ON(shmem->base.dev, shmem->base.import_attach);

If we add a WARN_ON() here, we can probably drop the one in
drm_gem_shmem_pin(), and do the same for drm_gem_shmem_unpin[_locked]()
to keep things consistent.

> +
>  	ret =3D drm_gem_shmem_get_pages(shmem);
> =20
>  	return ret;

