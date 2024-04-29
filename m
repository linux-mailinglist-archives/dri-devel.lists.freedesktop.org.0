Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274BB8B50AF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 07:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B835310FB84;
	Mon, 29 Apr 2024 05:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dFYdQUpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1AE10FB84
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 05:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8jWqz91P72bLK1vNTSXP2I03BK7xRmxKpwYI3P6sU3I=; b=dFYdQUpxRt5qBu2t1YxISxUa43
 Fygu1YMdSMVRh04R10V4Z6degiD5mIJKgKIC2zx+g49XV9D0rzYCmNGox6kvUMRClCWaEZFdBhMRO
 54Q6s9EaZhkm/oAtcymMfiylH8YZpqZSTI13kSidjbf/ycJsI9P3Hvzclou4dseDaIpzop80UARcW
 jayy2Xe5dHj7I/Me1Y/o+xGqJgOiof23J5qVvl+PJxuXwAVJKz7f/EwFEELxpuz5aeuJSo73wBStt
 TN9jGO8KlS0AD+IQ5zNSSNbA5djfgNTlFvurI+N9/LS3eL1WDxhzV9g3n602mbNWWVlE+vy5watnz
 oWSdRKgg==;
Received: from 62.117.230.7.dyn.user.ono.com ([62.117.230.7]
 helo=[192.168.0.101]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s1JTG-0014bJ-MV; Mon, 29 Apr 2024 07:22:34 +0200
Message-ID: <0a966cc891b388133013b37820b7e0e7d982654c.camel@igalia.com>
Subject: Re: [PATCH v4 7/8] drm/v3d: Use gemfs/THP in BO creation if available
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Date: Mon, 29 Apr 2024 07:22:33 +0200
In-Reply-To: <20240428124426.309096-8-mcanal@igalia.com>
References: <20240428124426.309096-1-mcanal@igalia.com>
 <20240428124426.309096-8-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
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

Hi Ma=C3=ADra,=20

a question below:

El dom, 28-04-2024 a las 09:40 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Although Big/Super Pages could appear naturally, it would be quite
> hard
> to have 1MB or 64KB allocated contiguously naturally. Therefore, we
> can
> force the creation of large pages allocated contiguously by using a
> mountpoint with "huge=3Dwithin_size" enabled.
>=20
> Therefore, as V3D has a mountpoint with "huge=3Dwithin_size" (if user
> has
> THP enabled), use this mountpoint for BO creation if available. This
> will allow us to create large pages allocated contiguously and make
> use
> of Big/Super Pages.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>=20

(...)

> @@ -130,10 +140,17 @@ struct v3d_bo *v3d_bo_create(struct drm_device
> *dev, struct drm_file *file_priv,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 size_t unaligned_size)
> =C2=A0{
> =C2=A0	struct drm_gem_shmem_object *shmem_obj;
> +	struct v3d_dev *v3d =3D to_v3d_dev(dev);
> =C2=A0	struct v3d_bo *bo;
> =C2=A0	int ret;
> =C2=A0
> -	shmem_obj =3D drm_gem_shmem_create(dev, unaligned_size);
> +	/* Let the user opt out of allocating the BOs with THP */
> +	if (v3d->gemfs)
> +		shmem_obj =3D drm_gem_shmem_create_with_mnt(dev,
> unaligned_size,
> +							=C2=A0 v3d-
> >gemfs);
> +	else
> +		shmem_obj =3D drm_gem_shmem_create(dev,
> unaligned_size);
> +
> =C2=A0	if (IS_ERR(shmem_obj))
> =C2=A0		return ERR_CAST(shmem_obj);
> =C2=A0	bo =3D to_v3d_bo(&shmem_obj->base);


if I read this correctly when we have THP we always allocate with that,
Even objects that are smaller than 64KB. I was wondering if there is
any benefit/downside to this or if the behavior for small allocations
is the same we had without the new mount point.

Iago
