Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E37782D9A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 17:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B268A10E102;
	Mon, 21 Aug 2023 15:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87A2110E102
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 15:56:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E81242F4;
 Mon, 21 Aug 2023 08:57:04 -0700 (PDT)
Received: from [10.57.34.4] (unknown [10.57.34.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1A273F64C;
 Mon, 21 Aug 2023 08:56:22 -0700 (PDT)
Message-ID: <bb52b872-e41b-3894-285e-b52cfc849782@arm.com>
Date: Mon, 21 Aug 2023 16:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] drm/panfrost: Add fdinfo support to Panfrost
Content-Language: en-GB
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 robh@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20230808222240.1016623-1-adrian.larumbe@collabora.com>
 <20230808222240.1016623-2-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230808222240.1016623-2-adrian.larumbe@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/08/2023 23:22, Adrián Larumbe wrote:
> We calculate the amount of time the GPU spends on a job with ktime samples,
> and then add it to the cumulative total for the open DRM file, which is
> what will be eventually exposed through the 'fdinfo' DRM file descriptor.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 12 ++++++++
>  drivers/gpu/drm/panfrost/panfrost_device.h | 10 +++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 32 +++++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  6 ++++
>  drivers/gpu/drm/panfrost/panfrost_job.h    |  3 ++
>  5 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index fa1a086a862b..67a5e894d037 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -401,6 +401,18 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>  	panfrost_job_enable_interrupts(pfdev);
>  }
>  
> +struct drm_info_gpu panfrost_device_get_counters(struct panfrost_device *pfdev,
> +						 struct panfrost_file_priv *panfrost_priv)
> +{
> +	struct drm_info_gpu gpu_info;
> +
> +	gpu_info.engine =  panfrost_priv->elapsed_ns;
> +	gpu_info.cycles =  panfrost_priv->elapsed_ns * clk_get_rate(pfdev->clock);
> +	gpu_info.maxfreq =  clk_get_rate(pfdev->clock);

First, calling clk_get_rate() twice here is inefficient.

Second, I'm not sure it's really worth producing these derived values.
As I understand it the purpose of cycles/maxfreq is to be able to
provide a utilisation value which accounts for DVFS. I.e. if the GPU is
clocked down the utilisation of cycles/maxfreq is low even if the GPU is
active for the whole sample period.

What we therefore need to report is the *maximum* frequency in
clk_get_rate(). Also rather than just multiplying elapsed_ns by the
current clock rate, we need to sum up cycles over time as the clock
frequency changes. Alternatively it might be possible to use the actual
GPU register (CYCLE_COUNT_LO/CYCLE_COUNT_HI at offset 0x90,0x94) -
although note that this is reset when the GPU is reset.

Finally I doubt elapsed_ns is actually what user space is expecting. The
GPU has multiple job slots (3, but only 2 are used in almost all cases)
so can be running more than one job at a time. So there's going to be
some double counting going on here.

Sorry to poke holes in this, I think this would be a good feature. But
if we're going to return information we want it to be at least
reasonably correct.

Thanks,

Steve

> +
> +	return gpu_info;
> +}
> +
>  static int panfrost_device_resume(struct device *dev)
>  {
>  	struct panfrost_device *pfdev = dev_get_drvdata(dev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index b0126b9fbadc..4621a2ece1bb 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -141,6 +141,14 @@ struct panfrost_file_priv {
>  	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
>  
>  	struct panfrost_mmu *mmu;
> +
> +	uint64_t elapsed_ns;
> +};
> +
> +struct drm_info_gpu {
> +	unsigned long long engine;
> +	unsigned long long cycles;
> +	unsigned int maxfreq;
>  };
>  
>  static inline struct panfrost_device *to_panfrost_device(struct drm_device *ddev)
> @@ -172,6 +180,8 @@ int panfrost_unstable_ioctl_check(void);
>  int panfrost_device_init(struct panfrost_device *pfdev);
>  void panfrost_device_fini(struct panfrost_device *pfdev);
>  void panfrost_device_reset(struct panfrost_device *pfdev);
> +struct drm_info_gpu panfrost_device_get_counters(struct panfrost_device *pfdev,
> +						 struct panfrost_file_priv *panfrost_priv);
>  
>  extern const struct dev_pm_ops panfrost_pm_ops;
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index a2ab99698ca8..65fdc0e4c7cb 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -3,6 +3,7 @@
>  /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
>  /* Copyright 2019 Collabora ltd. */
>  
> +#include "drm/drm_file.h"
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pagemap.h>
> @@ -267,6 +268,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	job->requirements = args->requirements;
>  	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
>  	job->mmu = file_priv->mmu;
> +	job->priv = file_priv;
>  
>  	slot = panfrost_job_get_slot(job);
>  
> @@ -523,7 +525,34 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
>  };
>  
> -DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
> +
> +static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> +				     struct panfrost_file_priv *panfrost_priv,
> +				     struct drm_printer *p)
> +{
> +	struct drm_info_gpu gpu_info;
> +
> +	gpu_info = panfrost_device_get_counters(pfdev, panfrost_priv);
> +
> +	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", gpu_info.engine);
> +	drm_printf(p, "drm-cycles-gpu:\t%llu\n", gpu_info.cycles);
> +	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu_info.maxfreq);
> +}
> +
> +static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_device *dev = file->minor->dev;
> +	struct panfrost_device *pfdev = dev->dev_private;
> +
> +	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
> +
> +}
> +
> +static const struct file_operations panfrost_drm_driver_fops = {
> +	.owner = THIS_MODULE,
> +	DRM_GEM_FOPS,
> +	.show_fdinfo = drm_show_fdinfo,
> +};
>  
>  /*
>   * Panfrost driver version:
> @@ -535,6 +564,7 @@ static const struct drm_driver panfrost_drm_driver = {
>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
>  	.open			= panfrost_open,
>  	.postclose		= panfrost_postclose,
> +	.show_fdinfo		= panfrost_show_fdinfo,
>  	.ioctls			= panfrost_drm_driver_ioctls,
>  	.num_ioctls		= ARRAY_SIZE(panfrost_drm_driver_ioctls),
>  	.fops			= &panfrost_drm_driver_fops,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..d0063cac9f72 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -157,6 +157,11 @@ static struct panfrost_job *
>  panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
>  {
>  	struct panfrost_job *job = pfdev->jobs[slot][0];
> +	job->priv->elapsed_ns +=
> +		ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
> +
> +	/* Reset in case the job has to be requeued */
> +	job->start_time = 0;
>  
>  	WARN_ON(!job);
>  	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
> @@ -233,6 +238,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  	subslot = panfrost_enqueue_job(pfdev, js, job);
>  	/* Don't queue the job if a reset is in progress */
>  	if (!atomic_read(&pfdev->reset.pending)) {
> +		job->start_time = ktime_get();
>  		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
>  		dev_dbg(pfdev->dev,
>  			"JS: Submitting atom %p to js[%d][%d] with head=0x%llx AS %d",
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> index 8becc1ba0eb9..b4318e476694 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -32,6 +32,9 @@ struct panfrost_job {
>  
>  	/* Fence to be signaled by drm-sched once its done with the job */
>  	struct dma_fence *render_done_fence;
> +
> +	struct panfrost_file_priv *priv;
> +	ktime_t start_time;
>  };
>  
>  int panfrost_job_init(struct panfrost_device *pfdev);

