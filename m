Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20DD0930E
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 13:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A455110E8A9;
	Fri,  9 Jan 2026 12:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VrFMd+0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B1A10E8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 12:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767960150;
 bh=wj0vveR25kaX8yWy/lFG+v+P+7tYmaklUTSQKJWmb3c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VrFMd+0gHV6qr0oxB+XhSMespbpFK6/MK3HoO5nr04+PnIHYVb2xsa8ePDInLlPq4
 xVOzC/k7RGipcJSP/r9SNAfBQ21kc8tNZBsK9r+cEzMK54CzAL0OJozm2DAPt9mpvA
 SMgbjiuUvjGQWg29AbB4BE6mqQm0iUFa2PPlBKGgQBzafOpsDkRDDvoAJToc/WErmJ
 /GPpYc1nuZtM6QPgOt1q1BbLm4cC7MEr51yOeDxphbpowN1x5N3HvH9cXhMF0Aca1O
 0a6RRrFayVeWtgMvBasM88bFTlkUGMU2TFnFEkfeKT+LieOQNvVYToUzc2DAhzf+w7
 BnUdq26lwpgKw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5060917E1380;
 Fri,  9 Jan 2026 13:02:30 +0100 (CET)
Date: Fri, 9 Jan 2026 13:02:24 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel@collabora.com, =?UTF-8?B?TG/Dr2M=?= Molinari
 <loic.molinari@collabora.com>
Subject: Re: [PATCH] drm/gem: Fix a GEM leak in drm_gem_get_unmapped_area()
Message-ID: <20260109130224.741d463f@fedora>
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

Queued to drm-misc-next.

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
> +	else
> +		ret =3D obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0, f=
lags);
> =20
>  	drm_gem_object_put(obj);
> =20

