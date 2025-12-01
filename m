Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFE8C963C8
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FAF10E335;
	Mon,  1 Dec 2025 08:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="P+rbz0D0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3543C10E335;
 Mon,  1 Dec 2025 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764578847;
 bh=kCd2RoLHIKSGnTYHHhQCfrIODg8yida9mwlOxzq6AzU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P+rbz0D0Vl2Wk5t3Fpiq/s5CAqaBFu2e23HkTAI45xU8RBmdb1N8hntNks7Ah3bRO
 KoEgbcP8rd2dzn3Hw+kBEBBnVp9WjTwolUyxMyJNekfAbwxxmrZ852hxw3D06xqWwe
 Qk3boA6lSxqrTitZqBlu8R/dKS27RaR138IwolvQdm785PHTJcF3RlyUKvTyE/Inu3
 Gr1l01ZcFaIfN17VUozoRuil+RpiA6lKlfeRfuI538axj2u9eCu4r71FEHzJ82we47
 0rfe/5gbRCOMCUTlMr4pbownGyeI7RYr2XvzqCkF1/YO1x1m3hAhdYaLs8hhuVUxD1
 6ir5SEg7HAqJA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B43B517E06C3;
 Mon,  1 Dec 2025 09:47:26 +0100 (CET)
Date: Mon, 1 Dec 2025 09:47:20 +0100
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
 Jonathan Corbet <corbet@lwn.net>, Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v10 09/10] drm/panfrost: Introduce huge tmpfs mountpoint
 option
Message-ID: <20251201094720.692e18e2@fedora>
In-Reply-To: <20251128185252.3092-10-loic.molinari@collabora.com>
References: <20251128185252.3092-1-loic.molinari@collabora.com>
 <20251128185252.3092-10-loic.molinari@collabora.com>
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

On Fri, 28 Nov 2025 19:52:51 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Introduce the 'panfrost.transparent_hugepage' boolean module parameter
> (false by default). When the parameter is set to true, a new tmpfs
> mountpoint is created and mounted using the 'huge=3Dwithin_size'
> option. It's then used at GEM object creation instead of the default
> 'shm_mnt' mountpoint in order to enable Transparent Hugepage (THP) for
> the object (without having to rely on a system wide parameter).
>=20
> v3:
> - use huge tmpfs mountpoint in drm_device
>=20
> v4:
> - fix builds with CONFIG_TRANSPARENT_HUGEPAGE=3Dn
> - clean up mountpoint creation error handling
> - print negative error value
>=20
> v5:
> - use drm_gem_has_huge_tmp() helper
> - get rid of CONFIG_TRANSPARENT_HUGEPAGE ifdefs
>=20
> v9:
> - replace drm_gem_has_huge_tmp() by drm_gem_get_huge_tmp()
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c |  3 +++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  6 ++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.h    |  9 +++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.c    | 18 ++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h    |  2 ++
>  5 files changed, 38 insertions(+)
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_drv.h
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index c61b97af120c..dedc13e56631 100644
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
> @@ -267,6 +268,8 @@ int panfrost_device_init(struct panfrost_device *pfde=
v)
>  	if (err)
>  		goto out_job;
> =20
> +	panfrost_gem_init(pfdev);
> +
>  	return 0;
>  out_job:
>  	panfrost_jm_fini(pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 7d8c7c337606..7f59568faa05 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -858,6 +858,12 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
>  #endif
>  };
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +bool panfrost_transparent_hugepage;

Same here, if there's no downside to enabling THP support, make it the
default.

> +module_param_named(transparent_hugepage, panfrost_transparent_hugepage, =
bool, 0400);
> +MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount poin=
t with Transparent Hugepage enabled (false =3D default)");
> +#endif
> +
>  static int panfrost_probe(struct platform_device *pdev)
>  {
>  	struct panfrost_device *pfdev;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.h b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.h
> new file mode 100644
> index 000000000000..edeb093eb6da
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.h
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2025 Amazon.com, Inc. or its affiliates */
> +
> +#ifndef __PANFROST_DRV_H__
> +#define __PANFROST_DRV_H__
> +
> +extern bool panfrost_transparent_hugepage;
> +
> +#endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 8041b65c6609..c1688a542ec2 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> +/* Copyright 2025 Amazon.com, Inc. or its affiliates */
> =20
>  #include <linux/cleanup.h>
>  #include <linux/err.h>
> @@ -10,9 +11,26 @@
>  #include <drm/panfrost_drm.h>
>  #include <drm/drm_print.h>
>  #include "panfrost_device.h"
> +#include "panfrost_drv.h"
>  #include "panfrost_gem.h"
>  #include "panfrost_mmu.h"
> =20
> +void panfrost_gem_init(struct panfrost_device *pfdev)
> +{
> +	int err;
> +
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
> +	    !panfrost_transparent_hugepage)
> +		return;
> +
> +	err =3D drm_gem_huge_mnt_create(&pfdev->base, "within_size");
> +	if (drm_gem_get_huge_mnt(&pfdev->base))
> +		drm_info(&pfdev->base, "Using Transparent Hugepage\n");
> +	else if (err)
> +		drm_warn(&pfdev->base, "Can't use Transparent Hugepage (%d)\n",
> +			 err);
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

