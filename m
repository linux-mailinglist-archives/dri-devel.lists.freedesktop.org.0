Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5158793685
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 09:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B324010E58D;
	Wed,  6 Sep 2023 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8289410E58C;
 Wed,  6 Sep 2023 07:44:05 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A8386600B9D;
 Wed,  6 Sep 2023 08:44:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693986244;
 bh=Yb3PbnjHGtaOtlltClP2zec0jrw8Lz1Ybb8D6Tr/9Gc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ic9SZIwCKjAR5qklQnygX8i5aXKflFdXeMUwhjGOIhSsGbzSBV0HTwKWps0dV5sSQ
 4IuGtjbiqgCyvdipYWEwlgtH6Ojma3p6fUE493wjrSD68L65BqGdyAhtfoYlj5mqrr
 KLV2Iszhwa1UdmX4oQgv5xqpbkYe3icfbf9ie0CHVIR5pIE/DCc0K2qZ6a3b0LB44P
 0XQotqw9xylL5MhL4t8v6FyMw3wesFmjauL4srHs3YW/eVmx+bBiCINgfurI7zJc+W
 HJxPfW5CYE3sh9/W+TzK7L17AGa5uju9boi1PIMvswqPqxDG0YLvEC4bCTJ7SfunQM
 y/yBbQo07/HOA==
Date: Wed, 6 Sep 2023 09:44:00 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v3 4/8] drm/panfrost: Add fdinfo support GPU load metrics
Message-ID: <20230906094400.725361d2@collabora.com>
In-Reply-To: <20230905184533.959171-5-adrian.larumbe@collabora.com>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
 <20230905184533.959171-5-adrian.larumbe@collabora.com>
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

On Tue,  5 Sep 2023 19:45:20 +0100
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
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 +++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ++
>  drivers/gpu/drm/panfrost/panfrost_device.h  | 13 +++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c     | 59 ++++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_job.c     | 27 ++++++++++
>  drivers/gpu/drm/panfrost/panfrost_job.h     |  4 ++
>  6 files changed, 113 insertions(+), 1 deletion(-)
>=20
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
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index 5c09c9f3ae08..7ad3973b1a3a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -24,6 +24,7 @@ struct panfrost_perfcnt;
> =20
>  #define NUM_JOB_SLOTS 3
>  #define MAX_PM_DOMAINS 5
> +#define MAX_SLOT_NAME_LEN 25
> =20
>  struct panfrost_features {
>  	u16 id;
> @@ -141,12 +142,24 @@ struct panfrost_mmu {
>  	struct list_head list;
>  };
> =20
> +struct drm_info_gpu {
> +	unsigned long maxfreq;
> +
> +	struct engine_info {

Uh, I'm not a huge fan of nested struct definitions. If you really need
struct engine_info, move it out of drm_info_gpu please.

> +		unsigned long long elapsed_ns;
> +		unsigned long long cycles;
> +		char name[MAX_SLOT_NAME_LEN];

I think we can drop this field (see below).

> +	} engines[NUM_JOB_SLOTS];
> +};
> +
>  struct panfrost_file_priv {
>  	struct panfrost_device *pfdev;
> =20
>  	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
> =20
>  	struct panfrost_mmu *mmu;
> +
> +	struct drm_info_gpu fdinfo;
>  };
> =20
>  static inline struct panfrost_device *to_panfrost_device(struct drm_devi=
ce *ddev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 2dfd9f79a31b..94787f4aee27 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -268,6 +268,7 @@ static int panfrost_ioctl_submit(struct drm_device *d=
ev, void *data,
>  	job->requirements =3D args->requirements;
>  	job->flush_id =3D panfrost_gpu_get_latest_flush_id(pfdev);
>  	job->mmu =3D file_priv->mmu;
> +	job->priv =3D file_priv;
> =20
>  	slot =3D panfrost_job_get_slot(job);
> =20
> @@ -484,6 +485,14 @@ panfrost_open(struct drm_device *dev, struct drm_fil=
e *file)
>  		goto err_free;
>  	}
> =20
> +	snprintf(panfrost_priv->fdinfo.engines[0].name, MAX_SLOT_NAME_LEN, "fra=
gment");
> +	snprintf(panfrost_priv->fdinfo.engines[1].name, MAX_SLOT_NAME_LEN, "ver=
tex-tiler");
> +/* Not exposed to userspace yet */
> +#if 0
> +	snprintf(panfrost_priv->fdinfo.engines[2].name, MAX_SLOT_NAME_LEN, "com=
pute-only");
> +#endif
> +	panfrost_priv->fdinfo.maxfreq =3D pfdev->pfdevfreq.fast_rate;
> +
>  	ret =3D panfrost_job_open(panfrost_priv);
>  	if (ret)
>  		goto err_job;
> @@ -524,7 +533,54 @@ static const struct drm_ioctl_desc panfrost_drm_driv=
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
> +	for (i =3D 0; i < NUM_JOB_SLOTS - 1; i++) {
> +		struct engine_info *ei =3D &panfrost_priv->fdinfo.engines[i];

I'd drop the name field in engine_info and add a

		static const char *names[] =3D {
			"fragment", "vertex-tiler", "compute-only"
		};

and then just use names[i] to get the engine name.

> +
> +		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
> +			   ei->name, ei->elapsed_ns);
> +		drm_printf(p, "drm-cycles-%s:\t%llu\n",
> +			   ei->name, ei->cycles);
> +		drm_printf(p, "drm-maxfreq-%s:\t%lu Hz\n",
> +			   ei->name, panfrost_priv->fdinfo.maxfreq);
> +		drm_printf(p, "drm-curfreq-%s:\t%lu Hz\n",
> +			   ei->name, pfdev->pfdevfreq.current_frequency);
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
> +
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
> @@ -536,6 +592,7 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
>  	.driver_features	=3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
>  	.open			=3D panfrost_open,
>  	.postclose		=3D panfrost_postclose,
> +	.show_fdinfo		=3D panfrost_show_fdinfo,
>  	.ioctls			=3D panfrost_drm_driver_ioctls,
>  	.num_ioctls		=3D ARRAY_SIZE(panfrost_drm_driver_ioctls),
>  	.fops			=3D &panfrost_drm_driver_fops,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 8b1bf6ac48f8..8a02e1ee9f9b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -159,6 +159,25 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, =
int slot)
>  	struct panfrost_job *job =3D pfdev->jobs[slot][0];
> =20
>  	WARN_ON(!job);
> +	if (job->priv) {
> +		struct engine_info *engine_info =3D &job->priv->fdinfo.engines[slot];
> +
> +		if (atomic_read(&pfdev->profile_mode)) {
> +			engine_info->elapsed_ns +=3D
> +				ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
> +			engine_info->cycles +=3D
> +				panfrost_cycle_counter_read(pfdev) - job->start_cycles;
> +
> +			/* Reset in case the job has to be requeued */
> +			job->start_time =3D 0;
> +			/* A GPU reset puts the Cycle Counter register back to 0 */
> +			job->start_cycles =3D atomic_read(&pfdev->reset.pending) ?
> +				0 : panfrost_cycle_counter_read(pfdev);
> +		}
> +	} else
> +		dev_WARN(pfdev->dev, "Panfrost DRM file closed when job was on flight\=
n");
> +
> +
>  	pfdev->jobs[slot][0] =3D pfdev->jobs[slot][1];
>  	pfdev->jobs[slot][1] =3D NULL;
> =20
> @@ -233,6 +252,11 @@ static void panfrost_job_hw_submit(struct panfrost_j=
ob *job, int js)
>  	subslot =3D panfrost_enqueue_job(pfdev, js, job);
>  	/* Don't queue the job if a reset is in progress */
>  	if (!atomic_read(&pfdev->reset.pending)) {
> +		if (atomic_read(&pfdev->profile_mode)) {
> +			job->start_time =3D ktime_get();
> +			job->start_cycles =3D panfrost_cycle_counter_read(pfdev);
> +		}
> +
>  		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
>  		dev_dbg(pfdev->dev,
>  			"JS: Submitting atom %p to js[%d][%d] with head=3D0x%llx AS %d",
> @@ -936,6 +960,9 @@ void panfrost_job_close(struct panfrost_file_priv *pa=
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
> index 2aa0add35459..63bc830e057d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -32,7 +32,11 @@ struct panfrost_job {
> =20
>  	/* Fence to be signaled by drm-sched once its done with the job */
>  	struct dma_fence *render_done_fence;
> +
> +	struct panfrost_file_priv *priv;
>  	bool is_profiled;
> +	ktime_t start_time;
> +	u64 start_cycles;
>  };
> =20
>  int panfrost_job_init(struct panfrost_device *pfdev);

