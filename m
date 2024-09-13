Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805197825E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 16:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3846A10E26E;
	Fri, 13 Sep 2024 14:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="grFFlzVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A72110E26E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726236930;
 bh=RGw0lEAw6Q3c2E5t/Y4Swyzy0jqID9BnPloR4rRI+Zg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=grFFlzVUmIYWKK+sw2Iuk0PKOuRNbN05NY3gUU7bGxrGTUook6PyaFbrIK5YyuwB7
 IRQQSNUOpmS+xYF/F1pxs00iSMfuyrOcSIPOUj9wCA/HQxugHut9htlFCEPvtUfNUy
 GiBkHK87jpY2AWYQ5UVMyHLHm/j1M8QbczhMdFn76gaHsW1rzEP23TkbImL4sllWkG
 QC71G8SzNA2JWHSIxvKFIlHwteQ+Vk39SK6vJtzMq+/t1nY5zzTXkXtL9oF/sNI1ZG
 tkExfHMq8tpNoNbmIuJlZiu90piSL4ETbdl38SHJZ5zMr2hvBhV2OVHt25R0fSA0Kz
 EDV9strlr2oQQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2442D17E1524;
 Fri, 13 Sep 2024 16:15:30 +0200 (CEST)
Date: Fri, 13 Sep 2024 16:15:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 3/5] drm/panthor: add DRM fdinfo support
Message-ID: <20240913161524.6cb47b91@collabora.com>
In-Reply-To: <20240913124857.389630-4-adrian.larumbe@collabora.com>
References: <20240913124857.389630-1-adrian.larumbe@collabora.com>
 <20240913124857.389630-4-adrian.larumbe@collabora.com>
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

On Fri, 13 Sep 2024 13:42:11 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Drawing from the FW-calculated values in a previous commit, we can increa=
se
> the numbers for an open file by collecting them from finished jobs when
> updating their group synchronisation objects.
>=20
> Display of fdinfo key-value pairs is governed by a bitmask that is by
> default unset in the present commit, and supporting manual toggle of it
> will be the matter of a later commit.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.h |  8 ++++
>  drivers/gpu/drm/panthor/panthor_drv.c    | 34 ++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.c  | 56 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h  |  2 +
>  4 files changed, 100 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index 2109905813e8..0e68f5a70d20 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -192,6 +192,11 @@ struct panthor_device {
>  	unsigned long fast_rate;
>  };
> =20
> +struct panthor_gpu_usage {
> +	u64 time;
> +	u64 cycles;
> +};
> +
>  /**
>   * struct panthor_file - Panthor file
>   */
> @@ -204,6 +209,9 @@ struct panthor_file {
> =20
>  	/** @groups: Scheduling group pool attached to this file. */
>  	struct panthor_group_pool *groups;
> +
> +	/** @stats: cycle and timestamp measures for job execution. */
> +	struct panthor_gpu_usage stats;
>  };
> =20
>  int panthor_device_init(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 0caf9e9a8c45..233b265c0819 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -13,6 +13,7 @@
>  #include <linux/pagemap.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/time64.h>
> =20
>  #include <drm/drm_auth.h>
>  #include <drm/drm_debugfs.h>
> @@ -1414,6 +1415,37 @@ static int panthor_mmap(struct file *filp, struct =
vm_area_struct *vma)
>  	return ret;
>  }
> =20
> +static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
> +				    struct panthor_file *pfile,
> +				    struct drm_printer *p)
> +{
> +	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_ALL)
> +		panthor_fdinfo_gather_group_samples(pfile);
> +
> +	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
> +#ifdef CONFIG_ARM_ARCH_TIMER
> +		drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
> +			   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
> +					    arch_timer_get_cntfrq()));
> +#endif
> +	}
> +	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> +		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
> +
> +	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
> +	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequenc=
y);
> +}
> +
> +static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *=
file)
> +{
> +	struct drm_device *dev =3D file->minor->dev;
> +	struct panthor_device *ptdev =3D container_of(dev, struct panthor_devic=
e, base);
> +
> +	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
> +
> +	drm_show_memory_stats(p, file);
> +}
> +
>  static const struct file_operations panthor_drm_driver_fops =3D {
>  	.open =3D drm_open,
>  	.release =3D drm_release,
> @@ -1423,6 +1455,7 @@ static const struct file_operations panthor_drm_dri=
ver_fops =3D {
>  	.read =3D drm_read,
>  	.llseek =3D noop_llseek,
>  	.mmap =3D panthor_mmap,
> +	.show_fdinfo =3D drm_show_fdinfo,
>  };
> =20
>  #ifdef CONFIG_DEBUG_FS
> @@ -1442,6 +1475,7 @@ static const struct drm_driver panthor_drm_driver =
=3D {
>  			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
>  	.open =3D panthor_open,
>  	.postclose =3D panthor_postclose,
> +	.show_fdinfo =3D panthor_show_fdinfo,
>  	.ioctls =3D panthor_drm_driver_ioctls,
>  	.num_ioctls =3D ARRAY_SIZE(panthor_drm_driver_ioctls),
>  	.fops =3D &panthor_drm_driver_fops,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index bcba52558f1e..d822bf9b59fa 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -619,6 +619,18 @@ struct panthor_group {
>  	 */
>  	struct panthor_kernel_bo *syncobjs;
> =20
> +	/** @fdinfo: Per-file total cycle and timestamp values reference. */
> +	struct {
> +		/** @data: Total sampled values for jobs in queues from this group. */
> +		struct panthor_gpu_usage data;
> +
> +		/**
> +		 * @lock: Mutex to govern concurrent access from drm file's fdinfo cal=
lback
> +		 * and job post-completion processing function
> +		 */
> +		struct mutex lock;
> +	} fdinfo;
> +
>  	/** @state: Group state. */
>  	enum panthor_group_state state;
> =20
> @@ -889,6 +901,8 @@ static void group_release_work(struct work_struct *wo=
rk)
>  						   release_work);
>  	u32 i;
> =20
> +	mutex_destroy(&group->fdinfo.lock);
> +
>  	for (i =3D 0; i < group->queue_count; i++)
>  		group_free_queue(group, group->queues[i]);
> =20
> @@ -2811,6 +2825,44 @@ void panthor_sched_post_reset(struct panthor_devic=
e *ptdev, bool reset_failed)
>  	}
>  }
> =20
> +static void update_fdinfo_stats(struct panthor_job *job)
> +{
> +	struct panthor_group *group =3D job->group;
> +	struct panthor_queue *queue =3D group->queues[job->queue_idx];
> +	struct panthor_gpu_usage *fdinfo =3D &group->fdinfo.data;
> +	struct panthor_job_profiling_data *times;
> +
> +	times =3D (struct panthor_job_profiling_data *)
> +		((unsigned long) queue->profiling.slots->kmap +
> +		 (job->profiling.slot * sizeof(struct panthor_job_profiling_data)));
> +
> +	mutex_lock(&group->fdinfo.lock);
> +	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> +		fdinfo->cycles +=3D times->cycles.after - times->cycles.before;
> +	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> +		fdinfo->time +=3D times->time.after - times->time.before;
> +	mutex_unlock(&group->fdinfo.lock);
> +}
> +
> +void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
> +{
> +	struct panthor_group_pool *gpool =3D pfile->groups;
> +	struct panthor_group *group;
> +	unsigned long i;
> +
> +	if (IS_ERR_OR_NULL(gpool))
> +		return;
> +
> +	xa_for_each(&gpool->xa, i, group) {
> +		mutex_lock(&group->fdinfo.lock);
> +		pfile->stats.cycles +=3D group->fdinfo.data.cycles;
> +		pfile->stats.time +=3D group->fdinfo.data.time;
> +		group->fdinfo.data.cycles =3D 0;
> +		group->fdinfo.data.time =3D 0;
> +		mutex_unlock(&group->fdinfo.lock);
> +	}
> +}
> +
>  static void group_sync_upd_work(struct work_struct *work)
>  {
>  	struct panthor_group *group =3D
> @@ -2843,6 +2895,8 @@ static void group_sync_upd_work(struct work_struct =
*work)
>  	dma_fence_end_signalling(cookie);
> =20
>  	list_for_each_entry_safe(job, job_tmp, &done_jobs, node) {
> +		if (job->profiling.mask)
> +			update_fdinfo_stats(job);
>  		list_del_init(&job->node);
>  		panthor_job_put(&job->base);
>  	}
> @@ -3440,6 +3494,8 @@ int panthor_group_create(struct panthor_file *pfile,
>  	}
>  	mutex_unlock(&sched->reset.lock);
> =20
> +	mutex_init(&group->fdinfo.lock);
> +
>  	return gid;
> =20
>  err_put_group:
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/pa=
nthor/panthor_sched.h
> index 3a30d2328b30..5ae6b4bde7c5 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -47,4 +47,6 @@ void panthor_sched_resume(struct panthor_device *ptdev);
>  void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
>  void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 ev=
ents);
> =20
> +void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);
> +
>  #endif

