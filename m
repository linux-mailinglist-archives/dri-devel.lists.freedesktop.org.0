Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE30379364D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 09:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA66310E141;
	Wed,  6 Sep 2023 07:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4231B10E122;
 Wed,  6 Sep 2023 07:32:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1282F6606EE0;
 Wed,  6 Sep 2023 08:32:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693985577;
 bh=Suut8+s0FHTKuSqrkmmDOEiABmt5dMjN+myE+DMpao4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hP3EMHCEoghTEeD4tl3WsCO1XIdu67KmZR38wNRd/4Wagzj0jsM64RYBvocyOkqi8
 srNX9OgvWK+ZK4m4IE9GC5MKtDN+OocUlJKLPABGFt9Z+WOqPKRrW+tTNyD+NUdX+0
 6s2o+NSbS053mRwxzD39ECWOQFvTVwHyB6VmiWchab/BTcT5pikQbkbw5E7op8jy49
 yl+EcMYPDY4M7aWfaPLr1uoW0Z92iso8bX4ZG4edIvZiCPoRKlOV+a7t6kkrV/KZmj
 YSwc2Lm7D792dIbXofG1+zPQzNO9+KFRY1J98SG1/CNyqxh48DlQF1YdHToecvVIwu
 KjHRkzuCOawtQ==
Date: Wed, 6 Sep 2023 09:32:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v3 3/8] drm/panfrost: Enable debugfs toggling of cycle
 counter register
Message-ID: <20230906093254.1f078b88@collabora.com>
In-Reply-To: <20230905184533.959171-4-adrian.larumbe@collabora.com>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
 <20230905184533.959171-4-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  5 Sep 2023 19:45:19 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Allow user space to decide whether the cycle counting register should be
> enabled. The main goal is letting tools like nvtop or IGT's gputop access
> this information in debug builds to obtain engine utilisation numbers.

Given you add a debugfs knob, I would simply drop the module param
introduced in the previous patch, it's just redundant, and I'd expect
people who care about profiling to have DEBUGFS enabled anyway.

>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/Makefile           |  2 +
>  drivers/gpu/drm/panfrost/panfrost_debugfs.c | 51 +++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_debugfs.h | 13 ++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c     |  5 ++
>  4 files changed, 71 insertions(+)
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
>=20
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost=
/Makefile
> index 7da2b3f02ed9..2c01c1e7523e 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -12,4 +12,6 @@ panfrost-y :=3D \
>  	panfrost_perfcnt.o \
>  	panfrost_dump.o
> =20
> +panfrost-$(CONFIG_DEBUG_FS) +=3D panfrost_debugfs.o
> +
>  obj-$(CONFIG_DRM_PANFROST) +=3D panfrost.o
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/dr=
m/panfrost/panfrost_debugfs.c
> new file mode 100644
> index 000000000000..48d5ddfcb1c6
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2023 Collabora ltd. */
> +
> +#include <linux/debugfs.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_file.h>
> +#include <drm/panfrost_drm.h>
> +
> +#include "panfrost_device.h"
> +#include "panfrost_gpu.h"
> +#include "panfrost_debugfs.h"
> +
> +static int
> +profile_get(void *data, u64 *val)
> +{
> +	struct drm_device *dev =3D data;
> +	struct panfrost_device *pfdev =3D dev->dev_private;
> +
> +	*val =3D atomic_read(&pfdev->profile_mode);
> +
> +	return 0;
> +}
> +
> +static int
> +profile_set(void *data, u64 val)
> +{
> +	struct drm_device *dev =3D data;
> +	struct panfrost_device *pfdev =3D dev->dev_private;
> +
> +	if (atomic_read(&pfdev->profile_mode) =3D=3D val)
> +		return 0;
> +
> +	if (val =3D=3D false)
> +		panfrost_cycle_counter_stop(pfdev);

I don't think we want to stop the counter immediately. We should
instead let the job logic switch it off when all jobs with profiling
enabled are done.

> +	else
> +		atomic_set(&pfdev->profile_mode, 1);
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(profile_fops,
> +			 profile_get, profile_set,
> +			 "%llu\n");
> +
> +void panfrost_debugfs_init(struct drm_minor *minor)
> +{
> +	struct drm_device *dev =3D minor->dev;
> +
> +	debugfs_create_file("profile", 0600, minor->debugfs_root,
> +		dev, &profile_fops);

With the panfrost_cycle_counter_stop() call in profile_set() dropped,
you should be able to use debugfs_create_atomic_t() here.

> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/dr=
m/panfrost/panfrost_debugfs.h
> new file mode 100644
> index 000000000000..db1c158bcf2f
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2023 Collabora ltd.
> + */
> +
> +#ifndef PANFROST_DEBUGFS_H
> +#define PANFROST_DEBUGFS_H
> +
> +#ifdef CONFIG_DEBUG_FS
> +void panfrost_debugfs_init(struct drm_minor *minor);
> +#endif
> +
> +#endif  /* PANFROST_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index a2ab99698ca8..2dfd9f79a31b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -20,6 +20,7 @@
>  #include "panfrost_job.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_perfcnt.h"
> +#include "panfrost_debugfs.h"
> =20
>  static bool unstable_ioctls;
>  module_param_unsafe(unstable_ioctls, bool, 0600);
> @@ -546,6 +547,10 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
> =20
>  	.gem_create_object	=3D panfrost_gem_create_object,
>  	.gem_prime_import_sg_table =3D panfrost_gem_prime_import_sg_table,
> +
> +#ifdef CONFIG_DEBUG_FS
> +	.debugfs_init		=3D panfrost_debugfs_init,
> +#endif
>  };
> =20
>  static int panfrost_probe(struct platform_device *pdev)

