Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D3DBBD37B
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 09:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1210E065;
	Mon,  6 Oct 2025 07:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="frPhOAL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E987310E065;
 Mon,  6 Oct 2025 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759736032;
 bh=JN355CCyCVKvUpgMjATr9ZWbBiGHbvnXdiVQNUERFYg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=frPhOAL8JAjtRfCY41p0+tUStstyq2+cTGabzZX6jdO8BwpAzqmjmN6541GXDLYvm
 5IJXI1yDrGUot6bFS9DIxsoL8LQu35b+sUnYk9Cnwt8R2+/kLTJEEUAw2iPJAPRnsg
 J1p5zI1PI1n000TCUJVMmcJMG/iAfE37SD4A+cysHJp0XM5PU6ZjUV2ZxMmKTPGyCb
 +BFlRatiA9+SbxINJvvV8fERS9FMmgNz6HTRTdZrCc76Tf3DDXrmhtjCBQll522VO9
 5djNQua/PgXxlS2Jv3l1tU8XRvg7bpiIPKsh7VR1OJ/q7szUKSzgR/2EZ00pWY2L91
 6t3VDn0pBfMxg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 681EF17E127C;
 Mon,  6 Oct 2025 09:33:51 +0200 (CEST)
Date: Mon, 6 Oct 2025 09:33:47 +0200
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
Subject: Re: [PATCH v3 09/10] drm/panfrost: Introduce huge tmpfs mount point
 option
Message-ID: <20251006093347.74ea0f51@fedora>
In-Reply-To: <20251004093054.21388-10-loic.molinari@collabora.com>
References: <20251004093054.21388-1-loic.molinari@collabora.com>
 <20251004093054.21388-10-loic.molinari@collabora.com>
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

On Sat,  4 Oct 2025 11:30:52 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Introduce the 'panfrost.transparent_hugepage' boolean module parameter
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

A couple minor nits below.

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c |  3 +++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  6 ++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.h    | 11 +++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.c    | 19 +++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h    |  2 ++
>  5 files changed, 41 insertions(+)
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_drv.h
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index 04bec27449cb..a189bfaac959 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -12,6 +12,7 @@
>  #include "panfrost_device.h"
>  #include "panfrost_devfreq.h"
>  #include "panfrost_features.h"
> +#include "panfrost_gem.h"
>  #include "panfrost_issues.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_job.h"
> @@ -266,6 +267,8 @@ int panfrost_device_init(struct panfrost_device *pfde=
v)
>  	if (err)
>  		goto out_job;
> =20
> +	panfrost_gem_init(pfdev);
> +
>  	return 0;
>  out_job:
>  	panfrost_job_fini(pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 22350ce8a08f..e376e70a3379 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -862,6 +862,12 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
>  #endif
>  };
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +bool panfrost_transparent_hugepage;
> +module_param_named(transparent_hugepage, panfrost_transparent_hugepage, =
bool, 0400);
> +MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount poin=
t with Transparent Hugepage enabled (false =3D default)");

Same here, I'd go for [panfrost_]enable_thp.

> +#endif
> +
>  static int panfrost_probe(struct platform_device *pdev)
>  {
>  	struct panfrost_device *pfdev;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.h b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.h
> new file mode 100644
> index 000000000000..60454611b6a6
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.h
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2025 Amazon.com, Inc. or its affiliates */
> +
> +#ifndef __PANFROST_DRV_H__
> +#define __PANFROST_DRV_H__
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +extern bool panfrost_transparent_hugepage;
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 85d6289a6eda..c3883a639e13 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> +/* Copyright 2025 Amazon.com, Inc. or its affiliates */
> =20
>  #include <linux/cleanup.h>
>  #include <linux/err.h>
> @@ -9,9 +10,27 @@
> =20
>  #include <drm/panfrost_drm.h>
>  #include "panfrost_device.h"
> +#include "panfrost_drv.h"
>  #include "panfrost_gem.h"
>  #include "panfrost_mmu.h"
> =20
> +void panfrost_gem_init(struct panfrost_device *pfdev)
> +{
> +	int err;
> +
> +	if (!panfrost_transparent_hugepage)
> +		return;
> +
> +	err =3D drm_gem_huge_mnt_create(pfdev->ddev, "within_size");
> +	if (err && err !=3D -EEXIST) {
> +		drm_warn(pfdev->ddev, "Can't use Transparent Hugepage (%d)\n",
> +			 -err);

I think errors are printed as negative values elsewhere, so I'd stick to err
not -err here.

> +		return;
> +	}
> +
> +	drm_info(pfdev->ddev, "Using Transparent Hugepage\n");


Here's a shorter version of the same thing (I dropped the EEXIST based on
my comment on patch 3).

	if (err)
		drm_warn(pfdev->ddev, "Can't use Transparent Hugepage (err=3D%d)\n", err);
	else
		drm_info(pfdev->ddev, "Using Transparent Hugepage\n");

> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static void panfrost_gem_debugfs_bo_add(struct panfrost_device *pfdev,
>  					struct panfrost_gem_object *bo)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index 8de3e76f2717..1a62529ff06f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -124,6 +124,8 @@ drm_mm_node_to_panfrost_mapping(struct drm_mm_node *n=
ode)
>  	return container_of(node, struct panfrost_gem_mapping, mmnode);
>  }
> =20
> +void panfrost_gem_init(struct panfrost_device *pfdev);
> +
>  struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev=
, size_t size);
> =20
>  struct drm_gem_object *

