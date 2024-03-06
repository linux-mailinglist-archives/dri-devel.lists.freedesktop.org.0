Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D58730F7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7D9112FFD;
	Wed,  6 Mar 2024 08:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aV419pLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA7B112FFD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709714504;
 bh=jLL7uw3QShSfenzcCONrHzlC6p7IGRjNmLgssHBdP38=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aV419pLugC34HPHE6Z+jNMPXUuQMHsIRJNiFXT2GxQO0JXM0htamhKHpdKYhO+xgL
 fbMvWHbQcM1E6H0bOCUz/alBK6REMPbzpBofzr8yUVujmbSjs6cP+eD4zv0suIb8lU
 ix3W9ewCkopBERxZ9Mi3SiJn6zgtnwB0KcpXi0pgJEXHXRrHiHhmUSIe+kzw6MVmsR
 JdJXYerZb8OeXmybTtjg267MPJwPURT3IPb9vU2Hl9wK8WWbjIMFx6rkgiprPDhapx
 PQAWXdoaXzeO5oU0X9OBXWG+iv4CYv2kcmTO91TiysFgPmE/E5gzCz6j0ryLshmDqp
 X49REkkngs72g==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5505937811D4;
 Wed,  6 Mar 2024 08:41:43 +0000 (UTC)
Date: Wed, 6 Mar 2024 09:41:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: robh@kernel.org, steven.price@arm.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/1] drm/panfrost: Replace fdinfo's profiling debugfs
 knob with sysfs
Message-ID: <20240306094142.70c7c974@collabora.com>
In-Reply-To: <20240306015819.822128-2-adrian.larumbe@collabora.com>
References: <20240306015819.822128-1-adrian.larumbe@collabora.com>
 <20240306015819.822128-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Wed,  6 Mar 2024 01:56:36 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Debugfs isn't always available in production builds that try to squeeze
> every single byte out of the kernel image, but we still need a way to
> toggle the timestamp and cycle counter registers so that jobs can be
> profiled for fdinfo's drm engine and cycle calculations.
>=20
> Drop the debugfs knob and replace it with a sysfs file that accomplishes
> the same functionality, and document its ABI in a separate file.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  .../testing/sysfs-driver-panfrost-profiling   | 10 +++++
>  Documentation/gpu/panfrost.rst                |  9 ++++
>  drivers/gpu/drm/panfrost/Makefile             |  2 -
>  drivers/gpu/drm/panfrost/panfrost_debugfs.c   | 21 ----------
>  drivers/gpu/drm/panfrost/panfrost_debugfs.h   | 14 -------
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 41 ++++++++++++++++---
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
>  8 files changed, 57 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-panfrost-profi=
ling
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-panfrost-profiling b/=
Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> new file mode 100644
> index 000000000000..1d8bb0978920
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/platform/drivers/panfrost/.../profiling
> +Date:		February 2024
> +KernelVersion:	6.8.0
> +Contact:	Adrian Larumbe <adrian.larumbe@collabora.com>
> +Description:
> +		Get/set drm fdinfo's engine and cycles profiling status.
> +		Valid values are:
> +		0: Don't enable fdinfo job profiling sources.
> +		1: Enable fdinfo job profiling sources, this enables both the GPU's
> +		   timestamp and cycle counter registers.
> \ No newline at end of file
> diff --git a/Documentation/gpu/panfrost.rst b/Documentation/gpu/panfrost.=
rst
> index b80e41f4b2c5..51ba375fd80d 100644
> --- a/Documentation/gpu/panfrost.rst
> +++ b/Documentation/gpu/panfrost.rst
> @@ -38,3 +38,12 @@ the currently possible format options:
> =20
>  Possible `drm-engine-` key names are: `fragment`, and  `vertex-tiler`.
>  `drm-curfreq-` values convey the current operating frequency for that en=
gine.
> +
> +Users must bear in mind that engine and cycle sampling are disabled by d=
efault,
> +because of power saving concerns. `fdinfo` users and benchmark applicati=
ons which
> +query the fdinfo file must make sure to toggle the job profiling status =
of the
> +driver by writing into the appropriate sysfs node::
> +
> +    echo <N> > /sys/bus/platform/drivers/panfrost/[a-f0-9]*.gpu/profiling
> +
> +Where `N` is either `0` or `1`, depending on the desired enablement stat=
us.
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost=
/Makefile
> index 2c01c1e7523e..7da2b3f02ed9 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -12,6 +12,4 @@ panfrost-y :=3D \
>  	panfrost_perfcnt.o \
>  	panfrost_dump.o
> =20
> -panfrost-$(CONFIG_DEBUG_FS) +=3D panfrost_debugfs.o
> -
>  obj-$(CONFIG_DRM_PANFROST) +=3D panfrost.o
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/dr=
m/panfrost/panfrost_debugfs.c
> deleted file mode 100644
> index 72d4286a6bf7..000000000000
> --- a/drivers/gpu/drm/panfrost/panfrost_debugfs.c
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/* Copyright 2023 Collabora ltd. */
> -/* Copyright 2023 Amazon.com, Inc. or its affiliates. */
> -
> -#include <linux/debugfs.h>
> -#include <linux/platform_device.h>
> -#include <drm/drm_debugfs.h>
> -#include <drm/drm_file.h>
> -#include <drm/panfrost_drm.h>
> -
> -#include "panfrost_device.h"
> -#include "panfrost_gpu.h"
> -#include "panfrost_debugfs.h"
> -
> -void panfrost_debugfs_init(struct drm_minor *minor)
> -{
> -	struct drm_device *dev =3D minor->dev;
> -	struct panfrost_device *pfdev =3D platform_get_drvdata(to_platform_devi=
ce(dev->dev));
> -
> -	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->p=
rofile_mode);
> -}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/dr=
m/panfrost/panfrost_debugfs.h
> deleted file mode 100644
> index c5af5f35877f..000000000000
> --- a/drivers/gpu/drm/panfrost/panfrost_debugfs.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright 2023 Collabora ltd.
> - * Copyright 2023 Amazon.com, Inc. or its affiliates.
> - */
> -
> -#ifndef PANFROST_DEBUGFS_H
> -#define PANFROST_DEBUGFS_H
> -
> -#ifdef CONFIG_DEBUG_FS
> -void panfrost_debugfs_init(struct drm_minor *minor);
> -#endif
> -
> -#endif  /* PANFROST_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index 62f7e3527385..cffcb0ac7c11 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -130,7 +130,7 @@ struct panfrost_device {
>  	struct list_head scheduled_jobs;
> =20
>  	struct panfrost_perfcnt *perfcnt;
> -	atomic_t profile_mode;
> +	bool profile_mode;
> =20
>  	struct mutex sched_lock;
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index a926d71e8131..9696702800a4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -20,7 +20,6 @@
>  #include "panfrost_job.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_perfcnt.h"
> -#include "panfrost_debugfs.h"
> =20
>  static bool unstable_ioctls;
>  module_param_unsafe(unstable_ioctls, bool, 0600);
> @@ -600,10 +599,6 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
> =20
>  	.gem_create_object	=3D panfrost_gem_create_object,
>  	.gem_prime_import_sg_table =3D panfrost_gem_prime_import_sg_table,
> -
> -#ifdef CONFIG_DEBUG_FS
> -	.debugfs_init		=3D panfrost_debugfs_init,
> -#endif
>  };
> =20
>  static int panfrost_probe(struct platform_device *pdev)
> @@ -692,6 +687,41 @@ static void panfrost_remove(struct platform_device *=
pdev)
>  	drm_dev_put(ddev);
>  }
> =20
> +static ssize_t profiling_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", pfdev->profile_mode);
> +}
> +
> +
> +static ssize_t profiling_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t len)
> +{
> +	struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> +	bool value;
> +	int err;
> +
> +	err =3D kstrtobool(buf, &value);
> +	if (err)
> +		return err;
> +
> +	pfdev->profile_mode =3D value;
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR_RW(profiling);
> +
> +static struct attribute *panfrost_attrs[] =3D {
> +	&dev_attr_profiling.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(panfrost);
> +
>  /*
>   * The OPP core wants the supply names to be NULL terminated, but we nee=
d the
>   * correct num_supplies value for regulator core. Hence, we NULL termina=
te here
> @@ -789,6 +819,7 @@ static struct platform_driver panfrost_driver =3D {
>  		.name	=3D "panfrost",
>  		.pm	=3D pm_ptr(&panfrost_pm_ops),
>  		.of_match_table =3D dt_match,
> +		.dev_groups =3D panfrost_groups,
>  	},
>  };
>  module_platform_driver(panfrost_driver);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 0c2dbf6ef2a5..a61ef0af9a4e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -243,7 +243,7 @@ static void panfrost_job_hw_submit(struct panfrost_jo=
b *job, int js)
>  	subslot =3D panfrost_enqueue_job(pfdev, js, job);
>  	/* Don't queue the job if a reset is in progress */
>  	if (!atomic_read(&pfdev->reset.pending)) {
> -		if (atomic_read(&pfdev->profile_mode)) {
> +		if (pfdev->profile_mode) {
>  			panfrost_cycle_counter_get(pfdev);
>  			job->is_profiled =3D true;
>  			job->start_time =3D ktime_get();

