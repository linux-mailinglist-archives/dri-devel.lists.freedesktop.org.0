Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AABBD388
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 09:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9661B10E2F9;
	Mon,  6 Oct 2025 07:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PoQ/YiiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057DF10E2F9;
 Mon,  6 Oct 2025 07:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759736090;
 bh=cyJ5srnHpafo4ER0mz30QQ3DiJ+SG1hcqAgPohc0gWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PoQ/YiiMvz9JD0Hb2DlORjF32GeBQwm7MmS6druJoNptw3EwNamn/Z0oO9tzIvLRv
 hLw+gK9eAYt4GxcA08aws73XWzFgJwl/UAQCVRHPiBHBzslqXRSVFCEq/vazN+TXzz
 DPHdwPkR1uqUBaTM5QzP1qHfx6lfuHEyh0jqTgU1BlWU1jZrigD//eidkOss/R+0O7
 yKngUsRiMKYisxTVLwNVxj7IcAbFrSceEmq9rPgtmqxwvkdjxrxMIquDI6Rfli1MFa
 NT/VB1RL0trcZaqMKJ6ZOhoTveHq+sHWPDIgcnZUcq+OXSwOxSJRCvv8X8Jita3C2c
 LE6T/vymqWWkQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BCDB17E0B83;
 Mon,  6 Oct 2025 09:34:49 +0200 (CEST)
Date: Mon, 6 Oct 2025 09:34:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Christopher Healy <healych@amazon.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, kernel@collabora.com
Subject: Re: [PATCH v3 07/10] drm/panthor: Introduce huge tmpfs mount point
 option
Message-ID: <20251006093446.2e1fd0a8@fedora>
In-Reply-To: <20251004093054.21388-8-loic.molinari@collabora.com>
References: <20251004093054.21388-1-loic.molinari@collabora.com>
 <20251004093054.21388-8-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Sat,  4 Oct 2025 11:30:50 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Introduce the 'panthor.transparent_hugepage' boolean module parameter
> (false by default). When the parameter is set to true, a new tmpfs
> mount point is created and mounted using the 'huge=3Dwithin_size'
> option. It's then used at GEM object creation instead of the default
> 'shm_mnt' mount point in order to enable Transparent Hugepage (THP)
> for the object (without having to rely on a system wide parameter).
>=20
> v3:
> - use huge tmpfs mountpoint in drm_device
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  3 +++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  7 +++++++
>  drivers/gpu/drm/panthor/panthor_drv.h    | 11 +++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.c    | 19 +++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h    |  2 ++
>  5 files changed, 42 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_drv.h
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index 81df49880bd8..3c0387156bb9 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -17,6 +17,7 @@
>  #include "panthor_devfreq.h"
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
> +#include "panthor_gem.h"
>  #include "panthor_gpu.h"
>  #include "panthor_hw.h"
>  #include "panthor_mmu.h"
> @@ -269,6 +270,8 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		goto err_unplug_fw;
> =20
> +	panthor_gem_init(ptdev);
> +
>  	/* ~3 frames */
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>  	pm_runtime_use_autosuspend(ptdev->base.dev);
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index fdbe89ef7f43..a2be3b904ca2 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1556,6 +1556,7 @@ static const struct file_operations panthor_drm_dri=
ver_fops =3D {
>  	.read =3D drm_read,
>  	.llseek =3D noop_llseek,
>  	.mmap =3D panthor_mmap,
> +	.get_unmapped_area =3D drm_gem_get_unmapped_area,
>  	.show_fdinfo =3D drm_show_fdinfo,
>  	.fop_flags =3D FOP_UNSIGNED_OFFSET,
>  };
> @@ -1623,6 +1624,12 @@ static const struct drm_driver panthor_drm_driver =
=3D {
>  #endif
>  };
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +bool panthor_transparent_hugepage;
> +module_param_named(transparent_hugepage, panthor_transparent_hugepage, b=
ool, 0400);
> +MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount poin=
t with Transparent Hugepage enabled (false =3D default)");
> +#endif
> +
>  static int panthor_probe(struct platform_device *pdev)
>  {
>  	struct panthor_device *ptdev;
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.h b/drivers/gpu/drm/pant=
hor/panthor_drv.h
> new file mode 100644
> index 000000000000..27fe9b6f77bd
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_drv.h
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2025 Amazon.com, Inc. or its affiliates */
> +
> +#ifndef __PANTHOR_DRV_H__
> +#define __PANTHOR_DRV_H__
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +extern bool panthor_transparent_hugepage;
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 156c7a0b62a2..49b7d288bfdf 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  /* Copyright 2023 Collabora ltd. */
> +/* Copyright 2025 Amazon.com, Inc. or its affiliates */
> =20
>  #include <linux/cleanup.h>
>  #include <linux/dma-buf.h>
> @@ -11,10 +12,28 @@
>  #include <drm/panthor_drm.h>
> =20
>  #include "panthor_device.h"
> +#include "panthor_drv.h"
>  #include "panthor_fw.h"
>  #include "panthor_gem.h"
>  #include "panthor_mmu.h"
> =20
> +void panthor_gem_init(struct panthor_device *ptdev)
> +{
> +	int err;
> +
> +	if (!panthor_transparent_hugepage)
> +		return;
> +
> +	err =3D drm_gem_huge_mnt_create(&ptdev->base, "within_size");
> +	if (err && err !=3D -EEXIST) {
> +		drm_warn(&ptdev->base, "Can't use Transparent Hugepage (%d)\n",
> +			 -err);
> +		return;
> +	}
> +
> +	drm_info(&ptdev->base, "Using Transparent Hugepage\n");

	if (err)
		drm_warn(&ptdev->base, "Can't use Transparent Hugepage (err=3D%d)\n", err=
);
	else
		drm_info(&ptdev->base, "Using Transparent Hugepage\n");

> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
>  {
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 80c6e24112d0..2eefe9104e5e 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -136,6 +136,8 @@ struct panthor_gem_object *to_panthor_bo(struct drm_g=
em_object *obj)
>  	return container_of(to_drm_gem_shmem_obj(obj), struct panthor_gem_objec=
t, base);
>  }
> =20
> +void panthor_gem_init(struct panthor_device *ptdev);
> +
>  struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev=
, size_t size);
> =20
>  int

