Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6460CA6957E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 17:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CDB10E1E0;
	Wed, 19 Mar 2025 16:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YYpmMW2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0516110E1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 16:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742403196;
 bh=lc83H2jIAcbgyTcXAGN7LemSssSPoEikt5FruQeTedo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YYpmMW2AMpR1CCk3Wd6S2kFNW7eO1c4hNGtNVHmqPUHU8dLM1tfqHPSC+90YHpzke
 3vtRtX8NOYakvxGV/W91FUR8YwiB38J1/U7LfWE+yDweJDDmrSuGJpnBljHP+DR3MT
 RT32ACMu1Mknt00sWAYcKnwLAiFwLNlB8kebNhX3yJqrnuOlG6BlAbZPOf8U2MqveB
 IQBxPqTKFTWBQqhfTRpyVMoztlelxcBRpLu7LI/ytsYHFTkU5KFWvzSt09XMhQN/fz
 T8Ow+HRkrrnPG4e8zDxxbKZHhyDEEUS5k1vxSB9ET9BhpQKasyZ4fg18IuZEQta7wo
 1rM09o/FoCzcg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 09A3F17E0848;
 Wed, 19 Mar 2025 17:53:16 +0100 (CET)
Date: Wed, 19 Mar 2025 17:53:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Message-ID: <20250319175312.5498b83f@collabora.com>
In-Reply-To: <20250319150953.1634322-3-adrian.larumbe@collabora.com>
References: <20250319150953.1634322-1-adrian.larumbe@collabora.com>
 <20250319150953.1634322-3-adrian.larumbe@collabora.com>
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

On Wed, 19 Mar 2025 15:03:17 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Allow UM to label a BO for which it possesses a DRM handle.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 37 +++++++++++++++++++++++++++
>  include/uapi/drm/panthor_drm.h        | 19 ++++++++++++++
>  2 files changed, 56 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 310bb44abe1a..e91acf132e06 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1330,6 +1330,41 @@ static int panthor_ioctl_vm_get_state(struct drm_d=
evice *ddev, void *data,
>  	return 0;
>  }
> =20
> +static int panthor_ioctl_bo_set_label(struct drm_device *ddev, void *dat=
a,
> +				  struct drm_file *file)
> +{
> +	struct drm_panthor_bo_set_label *args =3D data;
> +	struct drm_gem_object *obj;
> +	const char *label;
> +	unsigned long len;
> +	int ret =3D 0;
> +
> +	obj =3D drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->size && args->label) {
> +		len =3D (args->size < PAGE_SIZE) ? args->size : PAGE_SIZE;

Let's return -E2BIG or -EINVAL if args->size is bigger exceeds our limit
instead of pretending the label was stored.

> +		label =3D strndup_user(u64_to_user_ptr(args->label), len);
> +		if (IS_ERR(label)) {
> +			ret =3D PTR_ERR(label);
> +			goto err_label;
> +		}
> +	} else if (args->size && !args->label) {
> +		ret =3D -EINVAL;
> +		goto err_label;
> +	} else {
> +		label =3D NULL;
> +	}
> +
> +	panthor_gem_bo_set_label(obj, label);
> +
> +err_label:
> +	drm_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1399,6 +1434,7 @@ static const struct drm_ioctl_desc panthor_drm_driv=
er_ioctls[] =3D {
>  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>  };
> =20
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> @@ -1508,6 +1544,7 @@ static void panthor_debugfs_init(struct drm_minor *=
minor)
>   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
> + * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
>   */
>  static const struct drm_driver panthor_drm_driver =3D {
>  	.driver_features =3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_dr=
m.h
> index 97e2c4510e69..26b52f147360 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
> =20
>  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
> +
> +	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
> +	DRM_PANTHOR_BO_SET_LABEL,
>  };
> =20
>  /**
> @@ -977,6 +980,20 @@ struct drm_panthor_tiler_heap_destroy {
>  	__u32 pad;
>  };
> =20
> +/**
> + * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTH=
OR_BO_SET_LABEL
> + */
> +struct drm_panthor_bo_set_label {
> +	/** @handle: Handle of the buffer object to label. */
> +	__u32 handle;
> +
> +	/** @size: Length of the label, including the NULL terminator. */
> +	__u32 size;
> +
> +	/** @label: User pointer to a NULL-terminated string */
> +	__u64 label;
> +};
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1019,6 +1036,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
>  	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =3D
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> +	DRM_IOCTL_PANTHOR_BO_SET_LABEL =3D
> +		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>  };
> =20
>  #if defined(__cplusplus)

