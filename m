Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849E79CBBA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A6A10E078;
	Tue, 12 Sep 2023 09:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006F710E078;
 Tue, 12 Sep 2023 09:28:33 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 01E366606F85;
 Tue, 12 Sep 2023 10:28:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694510912;
 bh=6lI0v+MPutpYwYbjamsFbEVTyoRAjcSizPdz3wmSm4s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lEIuF5obioNoQlnLSS/WJuU9OEY70vGZKXvqHHReMWHH/P7y8SaOXck5Q0GvSpTMd
 d0dlpsgp7VuocIuCdqSRTYV2Oj9sVhWo6qN3Yk6Hw3WurYRzZw0EjdgDEiam7fHdQv
 Df32Yt1/agNKuhS4x7H4+4Sotb9+DW7kKsI+5jfpfg5w9xXEYlvy5wj7h/qmOperL6
 nR9o7wIXDOcPe5H+7pTItdEQTAEi8VFqpW79uwvET/DssbNdJaI2mw3dX5YMKBxKHd
 dp9YWkofhLXP8kH+l2X8R86vHm9pBCl7fTUw9oeCoydsOUviNsyo3tPmYQAIrpSni4
 3nlyWzQoyO1Tw==
Date: Tue, 12 Sep 2023 11:28:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v4 2/6] drm/panfrost: Add fdinfo support GPU load metrics
Message-ID: <20230912112829.15ae9658@collabora.com>
In-Reply-To: <20230912084044.955864-3-adrian.larumbe@collabora.com>
References: <20230912084044.955864-1-adrian.larumbe@collabora.com>
 <20230912084044.955864-3-adrian.larumbe@collabora.com>
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

On Tue, 12 Sep 2023 09:36:56 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> The drm-stats fdinfo tags made available to user space are drm-engine,
> drm-cycles, drm-max-freq and drm-curfreq, one per job slot.
>=20
> This deviates from standard practice in other DRM drivers, where a single
> set of key:value pairs is provided for the whole render engine. However,
> Panfrost has separate queues for fragment and vertex/tiler jobs, so a
> decision was made to calculate bus cycles and workload times separately.
>=20
> Maximum operating frequency is calculated at devfreq initialisation time.
> Current frequency is made available to user space because nvtop uses it
> when performing engine usage calculations.
>=20
> It is important to bear in mind that both GPU cycle and kernel time numbe=
rs
> provided are at best rough estimations, and always reported in excess from
> the actual figure because of two reasons:
>  - Excess time because of the delay between the end of a job processing,
>    the subsequent job IRQ and the actual time of the sample.
>  - Time spent in the engine queue waiting for the GPU to pick up the next
>    job.
>=20
> To avoid race conditions during enablement/disabling, a reference counting
> mechanism was introduced, and a job flag that tells us whether a given job
> increased the refcount. This is necessary, because user space can toggle
> cycle counting through a debugfs file, and a given job might have been in
> flight by the time cycle counting was disabled.
>=20
> The main goal of the debugfs cycle counter knob is letting tools like nvt=
op
> or IGT's gputop switch it at any time, to avoid power waste in case no
> engine usage measuring is necessary.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Mostly happy with this version, once you've my new comments you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/Makefile           |  2 +
>  drivers/gpu/drm/panfrost/panfrost_debugfs.c | 20 ++++++++
>  drivers/gpu/drm/panfrost/panfrost_debugfs.h | 13 +++++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 +++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ++
>  drivers/gpu/drm/panfrost/panfrost_device.c  |  2 +
>  drivers/gpu/drm/panfrost/panfrost_device.h  | 13 +++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c     | 57 ++++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_gpu.c     | 41 +++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.h     |  6 +++
>  drivers/gpu/drm/panfrost/panfrost_job.c     | 39 ++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_job.h     |  5 ++
>  12 files changed, 208 insertions(+), 1 deletion(-)
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
> index 000000000000..cc14eccba206
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2023 Collabora ltd. */
> +
> +#include <linux/debugfs.h>
> +#include <linux/platform_device.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_file.h>
> +#include <drm/panfrost_drm.h>
> +
> +#include "panfrost_device.h"
> +#include "panfrost_gpu.h"
> +#include "panfrost_debugfs.h"
> +
> +void panfrost_debugfs_init(struct drm_minor *minor)
> +{
> +	struct drm_device *dev =3D minor->dev;
> +	struct panfrost_device *pfdev =3D platform_get_drvdata(to_platform_devi=
ce(dev->dev));
> +
> +	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->p=
rofile_mode);
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
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/dr=
m/panfrost/panfrost_devfreq.c
> index 58dfb15a8757..28caffc689e2 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -58,6 +58,7 @@ static int panfrost_devfreq_get_dev_status(struct devic=
e *dev,
>  	spin_lock_irqsave(&pfdevfreq->lock, irqflags);
> =20
>  	panfrost_devfreq_update_utilization(pfdevfreq);
> +	pfdevfreq->current_frequency =3D status->current_frequency;
> =20
>  	status->total_time =3D ktime_to_ns(ktime_add(pfdevfreq->busy_time,
>  						   pfdevfreq->idle_time));
> @@ -117,6 +118,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfd=
ev)
>  	struct devfreq *devfreq;
>  	struct thermal_cooling_device *cooling;
>  	struct panfrost_devfreq *pfdevfreq =3D &pfdev->pfdevfreq;
> +	unsigned long freq =3D ULONG_MAX;
> =20
>  	if (pfdev->comp->num_supplies > 1) {
>  		/*
> @@ -172,6 +174,12 @@ int panfrost_devfreq_init(struct panfrost_device *pf=
dev)
>  		return ret;
>  	}
> =20
> +	/* Find the fastest defined rate  */
> +	opp =3D dev_pm_opp_find_freq_floor(dev, &freq);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +	pfdevfreq->fast_rate =3D freq;
> +
>  	dev_pm_opp_put(opp);
> =20
>  	/*
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/dr=
m/panfrost/panfrost_devfreq.h
> index 1514c1f9d91c..48dbe185f206 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
> @@ -19,6 +19,9 @@ struct panfrost_devfreq {
>  	struct devfreq_simple_ondemand_data gov_data;
>  	bool opp_of_table_added;
> =20
> +	unsigned long current_frequency;
> +	unsigned long fast_rate;
> +
>  	ktime_t busy_time;
>  	ktime_t idle_time;
>  	ktime_t time_last_update;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index fa1a086a862b..9a140af97b24 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -207,6 +207,8 @@ int panfrost_device_init(struct panfrost_device *pfde=
v)
> =20
>  	spin_lock_init(&pfdev->as_lock);
> =20
> +	atomic_set(&pfdev->profile_mode, false);

Atomics should be initialized to 0 thanks to kzalloc().

> +
>  	err =3D panfrost_clk_init(pfdev);
>  	if (err) {
>  		dev_err(pfdev->dev, "clk init failed %d\n", err);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index b0126b9fbadc..1e85656dc2f7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -107,6 +107,7 @@ struct panfrost_device {
>  	struct list_head scheduled_jobs;
> =20
>  	struct panfrost_perfcnt *perfcnt;
> +	atomic_t profile_mode;
> =20
>  	struct mutex sched_lock;
> =20
> @@ -121,6 +122,11 @@ struct panfrost_device {
>  	struct shrinker shrinker;
> =20
>  	struct panfrost_devfreq pfdevfreq;
> +
> +	struct {
> +		atomic_t use_count;
> +		spinlock_t lock;
> +	} cycle_counter;
>  };
> =20
>  struct panfrost_mmu {
> @@ -135,12 +141,19 @@ struct panfrost_mmu {
>  	struct list_head list;
>  };
> =20
> +struct panfrost_engine_usage {
> +	unsigned long long elapsed_ns[NUM_JOB_SLOTS];
> +	unsigned long long cycles[NUM_JOB_SLOTS];
> +};
> +
>  struct panfrost_file_priv {
>  	struct panfrost_device *pfdev;
> =20
>  	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
> =20
>  	struct panfrost_mmu *mmu;
> +
> +	struct panfrost_engine_usage engine_usage;
>  };
> =20
>  static inline struct panfrost_device *to_panfrost_device(struct drm_devi=
ce *ddev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index a2ab99698ca8..2d9c115821a7 100644
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
> @@ -267,6 +268,7 @@ static int panfrost_ioctl_submit(struct drm_device *d=
ev, void *data,
>  	job->requirements =3D args->requirements;
>  	job->flush_id =3D panfrost_gpu_get_latest_flush_id(pfdev);
>  	job->mmu =3D file_priv->mmu;
> +	job->priv =3D file_priv;

As I said before, passing file_priv to the job is a bad idea because
it's not refcounted, and you can end up with jobs outliving the FD
context. I know you added NULL checks in the code, but if we start
passing panfrost_file_priv around, I'm sure we'll forget about this
constraint and end up with new code using ->priv without checking for
the NULL situation. I think I'd be more comfortable if you were passing
panfrost_engine_usage instead.

> =20
>  	slot =3D panfrost_job_get_slot(job);
> =20
> @@ -523,7 +525,55 @@ static const struct drm_ioctl_desc panfrost_drm_driv=
er_ioctls[] =3D {
>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
>  };
> =20
> -DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
> +
> +static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> +				     struct panfrost_file_priv *panfrost_priv,
> +				     struct drm_printer *p)
> +{
> +	int i;
> +
> +	/*
> +	 * IMPORTANT NOTE: drm-cycles and drm-engine measurements are not
> +	 * accurate, as they only provide a rough estimation of the number of
> +	 * GPU cycles and CPU time spent in a given context. This is due to two
> +	 * different factors:
> +	 * - Firstly, we must consider the time the CPU and then the kernel
> +	 *   takes to process the GPU interrupt, which means additional time and
> +	 *   GPU cycles will be added in excess to the real figure.
> +	 * - Secondly, the pipelining done by the Job Manager (2 job slots per
> +	 *   engine) implies there is no way to know exactly how much time each
> +	 *   job spent on the GPU.
> +	 */
> +
> +	static const char * const engine_names[] =3D {
> +		"fragment", "vertex-tiler", "compute-only"
> +	};
> +
> +	for (i =3D 0; i < NUM_JOB_SLOTS - 1; i++) {
> +		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
> +			   engine_names[i], panfrost_priv->engine_usage.cycles[i]);
> +		drm_printf(p, "drm-cycles-%s:\t%llu\n",
> +			   engine_names[i], panfrost_priv->engine_usage.elapsed_ns[i]);
> +		drm_printf(p, "drm-maxfreq-%s:\t%lu Hz\n",
> +			   engine_names[i], pfdev->pfdevfreq.fast_rate);
> +		drm_printf(p, "drm-curfreq-%s:\t%lu Hz\n",
> +			   engine_names[i], pfdev->pfdevfreq.current_frequency);
> +	}
> +}
> +
> +static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file =
*file)
> +{
> +	struct drm_device *dev =3D file->minor->dev;
> +	struct panfrost_device *pfdev =3D dev->dev_private;
> +
> +	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
> +}
> +
> +static const struct file_operations panfrost_drm_driver_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	DRM_GEM_FOPS,
> +	.show_fdinfo =3D drm_show_fdinfo,
> +};
> =20
>  /*
>   * Panfrost driver version:
> @@ -535,6 +585,7 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
>  	.driver_features	=3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
>  	.open			=3D panfrost_open,
>  	.postclose		=3D panfrost_postclose,
> +	.show_fdinfo		=3D panfrost_show_fdinfo,
>  	.ioctls			=3D panfrost_drm_driver_ioctls,
>  	.num_ioctls		=3D ARRAY_SIZE(panfrost_drm_driver_ioctls),
>  	.fops			=3D &panfrost_drm_driver_fops,
> @@ -546,6 +597,10 @@ static const struct drm_driver panfrost_drm_driver =
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
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gpu.c
> index 2faa344d89ee..f0be7e19b13e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -73,6 +73,13 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pf=
dev)
>  	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
>  	gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL);
> =20
> +	/*
> +	 * All in-flight jobs should have released their cycle
> +	 * counter references upon reset, but let us make sure
> +	 */
> +	if (drm_WARN_ON(pfdev->ddev, atomic_read(&pfdev->cycle_counter.use_coun=
t) !=3D 0))
> +		atomic_set(&pfdev->cycle_counter.use_count, 0);
> +
>  	return 0;
>  }
> =20
> @@ -321,6 +328,40 @@ static void panfrost_gpu_init_features(struct panfro=
st_device *pfdev)
>  		 pfdev->features.shader_present, pfdev->features.l2_present);
>  }
> =20
> +void panfrost_cycle_counter_get(struct panfrost_device *pfdev)
> +{
> +	if (atomic_inc_not_zero(&pfdev->cycle_counter.use_count))
> +		return;
> +
> +	spin_lock(&pfdev->cycle_counter.lock);
> +	if (atomic_inc_return(&pfdev->cycle_counter.use_count) =3D=3D 1)
> +		gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_START);
> +	spin_unlock(&pfdev->cycle_counter.lock);
> +}
> +
> +void panfrost_cycle_counter_put(struct panfrost_device *pfdev)
> +{
> +	if (atomic_add_unless(&pfdev->cycle_counter.use_count, -1, 1))
> +		return;
> +
> +	spin_lock(&pfdev->cycle_counter.lock);
> +	if (atomic_dec_return(&pfdev->cycle_counter.use_count) =3D=3D 0)
> +		gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_STOP);
> +	spin_unlock(&pfdev->cycle_counter.lock);
> +}
> +
> +unsigned long long panfrost_cycle_counter_read(struct panfrost_device *p=
fdev)
> +{
> +	u32 hi, lo;
> +
> +	do {
> +		hi =3D gpu_read(pfdev, GPU_CYCLE_COUNT_HI);
> +		lo =3D gpu_read(pfdev, GPU_CYCLE_COUNT_LO);
> +	} while (hi !=3D gpu_read(pfdev, GPU_CYCLE_COUNT_HI));
> +
> +	return ((u64)hi << 32) | lo;
> +}
> +
>  void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gpu.h
> index 468c51e7e46d..4d62e8901c79 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> @@ -16,6 +16,12 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pf=
dev);
>  void panfrost_gpu_power_on(struct panfrost_device *pfdev);
>  void panfrost_gpu_power_off(struct panfrost_device *pfdev);
> =20
> +void panfrost_stop_cycle_counter(struct panfrost_device *pfdev);
> +void panfrost_cycle_counter_get(struct panfrost_device *pfdev);
> +void panfrost_cycle_counter_stop(struct panfrost_device *pfdev);
> +void panfrost_cycle_counter_put(struct panfrost_device *pfdev);
> +unsigned long long panfrost_cycle_counter_read(struct panfrost_device *p=
fdev);
> +
>  void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
> =20
>  #endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 033f5e684707..b6d3c5309a8c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -159,6 +159,23 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, =
int slot)
>  	struct panfrost_job *job =3D pfdev->jobs[slot][0];
> =20
>  	WARN_ON(!job);
> +	if (job->priv) {
> +		if (job->is_profiled) {
> +			job->priv->engine_usage.elapsed_ns[slot] +=3D
> +				ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
> +			job->priv->engine_usage.cycles[slot] +=3D
> +				panfrost_cycle_counter_read(pfdev) - job->start_cycles;
> +
> +			/* Reset in case the job has to be requeued */
> +			job->start_time =3D 0;
> +			/* A GPU reset puts the Cycle Counter register back to 0 */
> +			job->start_cycles =3D atomic_read(&pfdev->reset.pending) ?
> +				0 : panfrost_cycle_counter_read(pfdev);

Reading start_cycles here is useless, you'll read it again when
resubmitting. Same for the start_time, I'd expect the re-submission to
set this field.

> +		}
> +	} else {
> +		dev_WARN(pfdev->dev, "Panfrost DRM file closed when job was in-flight\=
n");

I'd drop this warning, it's a valid situation.

> +	}
> +
>  	pfdev->jobs[slot][0] =3D pfdev->jobs[slot][1];
>  	pfdev->jobs[slot][1] =3D NULL;
> =20
> @@ -233,6 +250,13 @@ static void panfrost_job_hw_submit(struct panfrost_j=
ob *job, int js)
>  	subslot =3D panfrost_enqueue_job(pfdev, js, job);
>  	/* Don't queue the job if a reset is in progress */
>  	if (!atomic_read(&pfdev->reset.pending)) {
> +		if (atomic_read(&pfdev->profile_mode)) {
> +			panfrost_cycle_counter_get(pfdev);
> +			job->is_profiled =3D true;
> +			job->start_time =3D ktime_get();
> +			job->start_cycles =3D panfrost_cycle_counter_read(pfdev);
> +		}
> +
>  		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
>  		dev_dbg(pfdev->dev,
>  			"JS: Submitting atom %p to js[%d][%d] with head=3D0x%llx AS %d",
> @@ -404,6 +428,9 @@ static void panfrost_job_handle_err(struct panfrost_d=
evice *pfdev,
>  	const char *exception_name =3D panfrost_exception_name(js_status);
>  	bool signal_fence =3D true;
> =20
> +	if (job->is_profiled)
> +		panfrost_cycle_counter_put(job->pfdev);

Can we move that to panfrost_dequeue_job(), so we don't have to do it
in both panfrost_job_handle_err() and panfrost_job_handle_done()?

> +
>  	if (!panfrost_exception_is_fault(js_status)) {
>  		dev_dbg(pfdev->dev, "js event, js=3D%d, status=3D%s, head=3D0x%x, tail=
=3D0x%x",
>  			js, exception_name,
> @@ -453,6 +480,9 @@ static void panfrost_job_handle_err(struct panfrost_d=
evice *pfdev,
>  static void panfrost_job_handle_done(struct panfrost_device *pfdev,
>  				     struct panfrost_job *job)
>  {
> +	if (job->is_profiled)
> +		panfrost_cycle_counter_put(job->pfdev);
> +
>  	/* Set ->jc to 0 to avoid re-submitting an already finished job (can
>  	 * happen when we receive the DONE interrupt while doing a GPU reset).
>  	 */
> @@ -660,10 +690,14 @@ panfrost_reset(struct panfrost_device *pfdev,
>  	 * stuck jobs. Let's make sure the PM counters stay balanced by
>  	 * manually calling pm_runtime_put_noidle() and
>  	 * panfrost_devfreq_record_idle() for each stuck job.
> +	 * Let's also make sure the cycle counting register's refcnt is
> +	 * kept balanced to prevent it from running forever
>  	 */
>  	spin_lock(&pfdev->js->job_lock);
>  	for (i =3D 0; i < NUM_JOB_SLOTS; i++) {
>  		for (j =3D 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++=
) {
> +			if (pfdev->jobs[i][j]->is_profiled)
> +				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
>  			pm_runtime_put_noidle(pfdev->dev);
>  			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
>  		}
> @@ -842,6 +876,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		}
>  	}
> =20
> +	spin_lock_init(&pfdev->cycle_counter.lock);

Ah, so this is where you're initializing the lock. Was searching for
this in panfrost_device_init().

> +
>  	panfrost_job_enable_interrupts(pfdev);
> =20
>  	return 0;
> @@ -926,6 +962,9 @@ void panfrost_job_close(struct panfrost_file_priv *pa=
nfrost_priv)
>  			}
> =20
>  			job_write(pfdev, JS_COMMAND(i), cmd);
> +
> +			/* Jobs can outlive their file context */
> +			job->priv =3D NULL;
>  		}
>  	}
>  	spin_unlock(&pfdev->js->job_lock);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/pa=
nfrost/panfrost_job.h
> index 8becc1ba0eb9..63bc830e057d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -32,6 +32,11 @@ struct panfrost_job {
> =20
>  	/* Fence to be signaled by drm-sched once its done with the job */
>  	struct dma_fence *render_done_fence;
> +
> +	struct panfrost_file_priv *priv;
> +	bool is_profiled;
> +	ktime_t start_time;
> +	u64 start_cycles;
>  };
> =20
>  int panfrost_job_init(struct panfrost_device *pfdev);

