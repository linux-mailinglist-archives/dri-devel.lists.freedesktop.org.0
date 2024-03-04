Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1185870674
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981E91122D3;
	Mon,  4 Mar 2024 16:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F351E1122D4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:04:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C5BB1FB;
 Mon,  4 Mar 2024 08:05:03 -0800 (PST)
Received: from [10.57.13.242] (unknown [10.57.13.242])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 551883F73F;
 Mon,  4 Mar 2024 08:04:24 -0800 (PST)
Message-ID: <51167b19-5a2c-4749-8b8c-b2a0e6050a33@arm.com>
Date: Mon, 4 Mar 2024 16:04:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/panfrost: Replace fdinfo's profiling debugfs
 knob with sysfs
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20240302154845.3223223-2-adrian.larumbe@collabora.com>
 <20240302154845.3223223-3-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240302154845.3223223-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 02/03/2024 15:48, Adrián Larumbe wrote:
> Debugfs isn't always available in production builds that try to squeeze
> every single byte out of the kernel image, but we still need a way to
> toggle the timestamp and cycle counter registers so that jobs can be
> profiled for fdinfo's drm engine and cycle calculations.
> 
> Drop the debugfs knob and replace it with a sysfs file that accomplishes
> the same functionality, and document its ABI in a separate file.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

I'm happy with this.

Reviewed-by: Steven Price <steven.price@arm.com>

Boris: are you happy with the sysfs ABI, or would you like to
investigate further the implications of leaving the counters enabled all
the time during execution before committing to the sysfs ABI?

Steve

> ---
>  .../testing/sysfs-driver-panfrost-profiling   | 10 +++
>  Documentation/gpu/panfrost.rst                |  9 +++
>  drivers/gpu/drm/panfrost/Makefile             |  5 +-
>  drivers/gpu/drm/panfrost/panfrost_debugfs.c   | 21 ------
>  drivers/gpu/drm/panfrost/panfrost_debugfs.h   | 14 ----
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  5 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 14 ++--
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_sysfs.c     | 70 +++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_sysfs.h     | 15 ++++
>  10 files changed, 120 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-panfrost-profiling
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_sysfs.c
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_sysfs.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-panfrost-profiling b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> new file mode 100644
> index 000000000000..889527b71b9d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/.../drivers/panfrost/.../drm/../profiling/status
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
> diff --git a/Documentation/gpu/panfrost.rst b/Documentation/gpu/panfrost.rst
> index b80e41f4b2c5..be4ac282ef63 100644
> --- a/Documentation/gpu/panfrost.rst
> +++ b/Documentation/gpu/panfrost.rst
> @@ -38,3 +38,12 @@ the currently possible format options:
>  
>  Possible `drm-engine-` key names are: `fragment`, and  `vertex-tiler`.
>  `drm-curfreq-` values convey the current operating frequency for that engine.
> +
> +Users must bear in mind that engine and cycle sampling are disabled by default,
> +because of power saving concerns. `fdinfo` users and benchmark applications which
> +query the fdinfo file must make sure to toggle the job profiling status of the
> +driver by writing into the appropriate sysfs node::
> +
> +    echo <N> > /sys/bus/platform/drivers/panfrost/[a-f0-9]*.gpu/drm/card1/profiling
> +
> +Where `N` is either `0` or `1`, depending on the desired enablement status.
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
> index 2c01c1e7523e..6e718595d8a6 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -10,8 +10,7 @@ panfrost-y := \
>  	panfrost_job.o \
>  	panfrost_mmu.o \
>  	panfrost_perfcnt.o \
> -	panfrost_dump.o
> -
> -panfrost-$(CONFIG_DEBUG_FS) += panfrost_debugfs.o
> +	panfrost_dump.o \
> +	panfrost_sysfs.o
>  
>  obj-$(CONFIG_DRM_PANFROST) += panfrost.o
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
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
> -	struct drm_device *dev = minor->dev;
> -	struct panfrost_device *pfdev = platform_get_drvdata(to_platform_device(dev->dev));
> -
> -	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->profile_mode);
> -}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
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
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 62f7e3527385..2f3580c7ba0d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -130,7 +130,10 @@ struct panfrost_device {
>  	struct list_head scheduled_jobs;
>  
>  	struct panfrost_perfcnt *perfcnt;
> -	atomic_t profile_mode;
> +	struct kobj_profiling {
> +		struct kobject base;
> +		bool profile_mode;
> +	} profiling;
>  
>  	struct mutex sched_lock;
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index a926d71e8131..6db1ea453514 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -20,7 +20,7 @@
>  #include "panfrost_job.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_perfcnt.h"
> -#include "panfrost_debugfs.h"
> +#include "panfrost_sysfs.h"
>  
>  static bool unstable_ioctls;
>  module_param_unsafe(unstable_ioctls, bool, 0600);
> @@ -600,10 +600,6 @@ static const struct drm_driver panfrost_drm_driver = {
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
> -
> -#ifdef CONFIG_DEBUG_FS
> -	.debugfs_init		= panfrost_debugfs_init,
> -#endif
>  };
>  
>  static int panfrost_probe(struct platform_device *pdev)
> @@ -663,8 +659,14 @@ static int panfrost_probe(struct platform_device *pdev)
>  	if (err)
>  		goto err_out2;
>  
> +	err = panfrost_sysfs_init(pfdev);
> +	if (err)
> +		goto err_out3;
> +
>  	return 0;
>  
> +err_out3:
> +	panfrost_gem_shrinker_cleanup(ddev);
>  err_out2:
>  	drm_dev_unregister(ddev);
>  err_out1:
> @@ -681,6 +683,8 @@ static void panfrost_remove(struct platform_device *pdev)
>  	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
>  	struct drm_device *ddev = pfdev->ddev;
>  
> +	panfrost_sysfs_cleanup(pfdev);
> +
>  	drm_dev_unregister(ddev);
>  	panfrost_gem_shrinker_cleanup(ddev);
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 0c2dbf6ef2a5..1be9c31b2b61 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -243,7 +243,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  	subslot = panfrost_enqueue_job(pfdev, js, job);
>  	/* Don't queue the job if a reset is in progress */
>  	if (!atomic_read(&pfdev->reset.pending)) {
> -		if (atomic_read(&pfdev->profile_mode)) {
> +		if (pfdev->profiling.profile_mode) {
>  			panfrost_cycle_counter_get(pfdev);
>  			job->is_profiled = true;
>  			job->start_time = ktime_get();
> diff --git a/drivers/gpu/drm/panfrost/panfrost_sysfs.c b/drivers/gpu/drm/panfrost/panfrost_sysfs.c
> new file mode 100644
> index 000000000000..380d74e61611
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_sysfs.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2023 Collabora ltd. */
> +/* Copyright 2023 Amazon.com, Inc. or its affiliates. */
> +
> +#include <linux/platform_device.h>
> +#include <drm/drm_file.h>
> +#include <drm/panfrost_drm.h>
> +
> +#include "panfrost_device.h"
> +#include "panfrost_gpu.h"
> +#include "panfrost_sysfs.h"
> +
> +static ssize_t
> +profiling_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	bool *profile_mode =
> +		&container_of(kobj, struct panfrost_device,
> +			      profiling.base)->profiling.profile_mode;
> +
> +	return sysfs_emit(buf, "%d\n", *profile_mode);
> +}
> +
> +static ssize_t
> +profiling_store(struct kobject *kobj, struct kobj_attribute *attr,
> +	       const char *buf, size_t count)
> +{
> +	bool *profile_mode =
> +		&container_of(kobj, struct panfrost_device,
> +			      profiling.base)->profiling.profile_mode;
> +	int err, value;
> +
> +	err = kstrtoint(buf, 0, &value);
> +	if (err)
> +		return err;
> +
> +	*profile_mode = !!value;
> +
> +	return count;
> +}
> +
> +static const struct kobj_attribute profiling_status =
> +__ATTR(status, 0644, profiling_show, profiling_store);
> +
> +static const struct kobj_type kobj_profile_type = {
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +int panfrost_sysfs_init(struct panfrost_device *pfdev)
> +{
> +	struct device *kdev = pfdev->ddev->primary->kdev;
> +	int err;
> +
> +	kobject_init(&pfdev->profiling.base, &kobj_profile_type);
> +
> +	err = kobject_add(&pfdev->profiling.base, &kdev->kobj, "%s", "profiling");
> +	if (err)
> +		return err;
> +
> +	err = sysfs_create_file(&pfdev->profiling.base, &profiling_status.attr);
> +	if (err)
> +		kobject_del(&pfdev->profiling.base);
> +
> +	return err;
> +}
> +
> +void panfrost_sysfs_cleanup(struct panfrost_device *pfdev)
> +{
> +	sysfs_remove_file(&pfdev->profiling.base, &profiling_status.attr);
> +	kobject_del(&pfdev->profiling.base);
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_sysfs.h b/drivers/gpu/drm/panfrost/panfrost_sysfs.h
> new file mode 100644
> index 000000000000..5fc9c8c1091a
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_sysfs.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2023 Collabora ltd.
> + * Copyright 2023 Amazon.com, Inc. or its affiliates.
> + */
> +
> +#ifndef PANFROST_SYSFS_H
> +#define PANFROST_SYSFS_H
> +
> +struct panfrost_device;
> +
> +int panfrost_sysfs_init(struct panfrost_device *pfdev);
> +void panfrost_sysfs_cleanup(struct panfrost_device *pfdev);
> +
> +#endif  /* PANFROST_SYSFS_H */

