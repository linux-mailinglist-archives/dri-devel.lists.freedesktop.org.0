Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3774EA64464
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 08:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912B010E345;
	Mon, 17 Mar 2025 07:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VRmLEKwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623A910E345
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 07:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742198088;
 bh=MrqHrpOxtBdNPctpsoz+sTFWqBqGBrTaNSgz51e6ycY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VRmLEKwHK+OW2XCnum5+CrFE3OuRsYISsNPm4mkpo38z8ti8p/xhcc4gOjBn4aSMj
 oMKCVGTBoco54jWF2b577qm3azcR5A3uuFgokEYp1cirgLphdne5fea4MeeVyY4TKi
 DeCZoNwemkLRCgaoJUSI00VeH0TpuqSz17jngPXItiOBSNs+wR9JoehsB9EBslnfYj
 mZBAEqVT9dxckEl9iiLG9CjQr8xOEbFxsFufFlL0Az6Qj2H/0z4j81UMkqB7xcRH2A
 NO3IE67Njvu4/HGpe0wcf5UXcW7UwySm1viDuso/gB9V9VHZIP8JH/nLCFCgYCeYfK
 i1Wnb1wfR+LoQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DD49B17E05C8;
 Mon, 17 Mar 2025 08:54:47 +0100 (CET)
Date: Mon, 17 Mar 2025 08:54:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Message-ID: <20250317085436.35edbf47@collabora.com>
In-Reply-To: <20250316215139.3940623-3-adrian.larumbe@collabora.com>
References: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
 <20250316215139.3940623-3-adrian.larumbe@collabora.com>
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

On Sun, 16 Mar 2025 21:51:33 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Allow UM to label a BO for which it possesses a DRM handle.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 31 +++++++++++++++++++++++++++
>  include/uapi/drm/panthor_drm.h        | 14 ++++++++++++
>  2 files changed, 45 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 310bb44abe1a..f41b8946258f 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1330,6 +1330,35 @@ static int panthor_ioctl_vm_get_state(struct drm_d=
evice *ddev, void *data,
>  	return 0;
>  }
> =20
> +static int panthor_ioctl_label_bo(struct drm_device *ddev, void *data,
> +				  struct drm_file *file)
> +{
> +	struct drm_panthor_label_bo *args =3D data;
> +	struct drm_gem_object *obj;
> +	const char *label;
> +	int ret =3D 0;
> +
> +	obj =3D drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->len && args->label) {

We probably want to have a limit on the label length (PAGE_SIZE or
less?). I would also return -EINVAL if the length is not zero and the
label is NULL instead of silently setting the label to NULL.

> +		label =3D strndup_user(u64_to_user_ptr(args->label), args->len + 1);
> +		if (IS_ERR(label)) {
> +			ret =3D PTR_ERR(label);
> +			goto err_label;
> +		}
> +	} else
> +		label =3D NULL;

	} else {
		label =3D NULL;
	}
> +
> +	panthor_gem_label_bo(obj, label);
> +
> +err_label:
> +	drm_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
