Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AEE785830
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 14:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611D110E420;
	Wed, 23 Aug 2023 12:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE1910E420
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 12:55:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 210D0660719F;
 Wed, 23 Aug 2023 13:55:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692795355;
 bh=lgOgN139uxXcjd6RNEem+LPADW5ZrfVkqlencwM/hcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lwLLbsCR4KJ7AEjjSqtX/ExHd20yjSh20cvySWpzsgQXZS7LrpGdW3XZaAp0Ap2Mk
 6kF/3slwW5h3hTA8V+RbiLLxPTvNbGxiq8Bd+fkdS+Uqp5xXS5K5w0vmDDKeu8LzTG
 OpJKXw9HY+Zvv4yUo/Jdp/b354UTRvK9ybFQco8j42D4m7moeWgZVuq/qt72gVcwdX
 0+1sIFk+apDOKiGUL7hfsDZny/HpwVBKSwcYkKXNA51u5+wJyuUqMmkc4rPCfPbbt+
 3WA0nlvsUhccFfD/4d+gDduZ8vq1HTTFF4vs+brLizmwCfqBpo3zC+bc3jJm+SX6rp
 4Dy7Iq/8Ah2dA==
Date: Wed, 23 Aug 2023 13:55:52 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 1/2] drm/panfrost: Add fdinfo support to Panfrost
Message-ID: <6hxuw437w4vclpho2tekexj2bud55zvaduurjklg3x4lcpekch@ugroq7daqu5v>
References: <20230808222240.1016623-1-adrian.larumbe@collabora.com>
 <20230808222240.1016623-2-adrian.larumbe@collabora.com>
 <bb52b872-e41b-3894-285e-b52cfc849782@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb52b872-e41b-3894-285e-b52cfc849782@arm.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, Boris Brezillon <boris.brezillon@collabora.com>,
 kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven, thanks for your feedback.

On 21.08.2023 16:56, Steven Price wrote:
>> We calculate the amount of time the GPU spends on a job with ktime samples,
>> and then add it to the cumulative total for the open DRM file, which is
>> what will be eventually exposed through the 'fdinfo' DRM file descriptor.
>> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/panfrost/panfrost_device.c | 12 ++++++++
>>  drivers/gpu/drm/panfrost/panfrost_device.h | 10 +++++++
>>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 32 +++++++++++++++++++++-
>>  drivers/gpu/drm/panfrost/panfrost_job.c    |  6 ++++
>>  drivers/gpu/drm/panfrost/panfrost_job.h    |  3 ++
>>  5 files changed, 62 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
>> index fa1a086a862b..67a5e894d037 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>> @@ -401,6 +401,18 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>>  	panfrost_job_enable_interrupts(pfdev);
>>  }
>>  
>> +struct drm_info_gpu panfrost_device_get_counters(struct panfrost_device *pfdev,
>> +						 struct panfrost_file_priv *panfrost_priv)
>> +{
>> +	struct drm_info_gpu gpu_info;
>> +
>> +	gpu_info.engine =  panfrost_priv->elapsed_ns;
>> +	gpu_info.cycles =  panfrost_priv->elapsed_ns * clk_get_rate(pfdev->clock);
>> +	gpu_info.maxfreq =  clk_get_rate(pfdev->clock);
>
>First, calling clk_get_rate() twice here is inefficient.
>
>Second, I'm not sure it's really worth producing these derived values.
>As I understand it the purpose of cycles/maxfreq is to be able to
>provide a utilisation value which accounts for DVFS. I.e. if the GPU is
>clocked down the utilisation of cycles/maxfreq is low even if the GPU is
>active for the whole sample period.

>What we therefore need to report is the *maximum* frequency in
>clk_get_rate(). Also rather than just multiplying elapsed_ns by the
>current clock rate, we need to sum up cycles over time as the clock
>frequency changes. Alternatively it might be possible to use the actual
>GPU register (CYCLE_COUNT_LO/CYCLE_COUNT_HI at offset 0x90,0x94) -
>although note that this is reset when the GPU is reset.

I've fixed this in a second version of the patch and now calculate the maximum
operating frequency during the driver initialisation stage in the following way:

unsigned long freq = ULONG_MAX;

/* Find the fastest defined rate  */
opp = dev_pm_opp_find_freq_floor(dev, &freq);
if (IS_ERR(opp))
	return PTR_ERR(opp);
pfdev->features.fast_rate = freq;

dev_pm_opp_put(opp);

Regarding the number of cycles, sampling CYCLE_COUNT would give us the most
accurate figure, however fdinfo must return values that are relative to the file
being queried, whereas that register would give us a raw count for all queues.

There's also the problem of clock frequencies being variable over time because
of DVFS. To get an accurate value for the number of cycles spent in a given
job, we would have to store clock frequencies together with their timestamps
every time there's a rate change, and then in the job deque function traverse
it, find the interval intersection and multiply every frequency by its
respective length. This sounds like too much work, so I think until I can come
up with something less complex I'm going to drop reporting of the drm-cycles
value altogether.

Although come think of it, maybe I could sample the number of cycles both at
the beginning and end of a job and add that to an overall per-file tally. 

>Finally I doubt elapsed_ns is actually what user space is expecting. The
>GPU has multiple job slots (3, but only 2 are used in almost all cases)
>so can be running more than one job at a time. So there's going to be
>some double counting going on here.
>
>Sorry to poke holes in this, I think this would be a good feature. But
>if we're going to return information we want it to be at least
>reasonably correct.

Thanks for pointing this out, I hadn't thought about that the same file could
have two simultaneous jobs running at the same time.

I've checked what other drivers do for reporting these values, and they print a
separate drm-engine value for each of their execution units (render, copy,
compute, etc).  In our case, because there are 2 or 3 queues, perhaps we should
do the same.

>Thanks,
>
>Steve
>
>> +
>> +	return gpu_info;
>> +}
>> +
>>  static int panfrost_device_resume(struct device *dev)
>>  {
>>  	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index b0126b9fbadc..4621a2ece1bb 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -141,6 +141,14 @@ struct panfrost_file_priv {
>>  	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
>>  
>>  	struct panfrost_mmu *mmu;
>> +
>> +	uint64_t elapsed_ns;
>> +};
>> +
>> +struct drm_info_gpu {
>> +	unsigned long long engine;
>> +	unsigned long long cycles;
>> +	unsigned int maxfreq;
>>  };
>>  
>>  static inline struct panfrost_device *to_panfrost_device(struct drm_device *ddev)
>> @@ -172,6 +180,8 @@ int panfrost_unstable_ioctl_check(void);
>>  int panfrost_device_init(struct panfrost_device *pfdev);
>>  void panfrost_device_fini(struct panfrost_device *pfdev);
>>  void panfrost_device_reset(struct panfrost_device *pfdev);
>> +struct drm_info_gpu panfrost_device_get_counters(struct panfrost_device *pfdev,
>> +						 struct panfrost_file_priv *panfrost_priv);
>>  
>>  extern const struct dev_pm_ops panfrost_pm_ops;
>>  
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index a2ab99698ca8..65fdc0e4c7cb 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -3,6 +3,7 @@
>>  /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
>>  /* Copyright 2019 Collabora ltd. */
>>  
>> +#include "drm/drm_file.h"
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/pagemap.h>
>> @@ -267,6 +268,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>>  	job->requirements = args->requirements;
>>  	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
>>  	job->mmu = file_priv->mmu;
>> +	job->priv = file_priv;
>>  
>>  	slot = panfrost_job_get_slot(job);
>>  
>> @@ -523,7 +525,34 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
>>  };
>>  
>> -DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
>> +
>> +static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
>> +				     struct panfrost_file_priv *panfrost_priv,
>> +				     struct drm_printer *p)
>> +{
>> +	struct drm_info_gpu gpu_info;
>> +
>> +	gpu_info = panfrost_device_get_counters(pfdev, panfrost_priv);
>> +
>> +	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", gpu_info.engine);
>> +	drm_printf(p, "drm-cycles-gpu:\t%llu\n", gpu_info.cycles);
>> +	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu_info.maxfreq);
>> +}
>> +
>> +static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>> +{
>> +	struct drm_device *dev = file->minor->dev;
>> +	struct panfrost_device *pfdev = dev->dev_private;
>> +
>> +	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
>> +
>> +}
>> +
>> +static const struct file_operations panfrost_drm_driver_fops = {
>> +	.owner = THIS_MODULE,
>> +	DRM_GEM_FOPS,
>> +	.show_fdinfo = drm_show_fdinfo,
>> +};
>>  
>>  /*
>>   * Panfrost driver version:
>> @@ -535,6 +564,7 @@ static const struct drm_driver panfrost_drm_driver = {
>>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
>>  	.open			= panfrost_open,
>>  	.postclose		= panfrost_postclose,
>> +	.show_fdinfo		= panfrost_show_fdinfo,
>>  	.ioctls			= panfrost_drm_driver_ioctls,
>>  	.num_ioctls		= ARRAY_SIZE(panfrost_drm_driver_ioctls),
>>  	.fops			= &panfrost_drm_driver_fops,
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index dbc597ab46fb..d0063cac9f72 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -157,6 +157,11 @@ static struct panfrost_job *
>>  panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
>>  {
>>  	struct panfrost_job *job = pfdev->jobs[slot][0];
>> +	job->priv->elapsed_ns +=
>> +		ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
>> +
>> +	/* Reset in case the job has to be requeued */
>> +	job->start_time = 0;
>>  
>>  	WARN_ON(!job);
>>  	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
>> @@ -233,6 +238,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>>  	subslot = panfrost_enqueue_job(pfdev, js, job);
>>  	/* Don't queue the job if a reset is in progress */
>>  	if (!atomic_read(&pfdev->reset.pending)) {
>> +		job->start_time = ktime_get();
>>  		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
>>  		dev_dbg(pfdev->dev,
>>  			"JS: Submitting atom %p to js[%d][%d] with head=0x%llx AS %d",
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
>> index 8becc1ba0eb9..b4318e476694 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
>> @@ -32,6 +32,9 @@ struct panfrost_job {
>>  
>>  	/* Fence to be signaled by drm-sched once its done with the job */
>>  	struct dma_fence *render_done_fence;
>> +
>> +	struct panfrost_file_priv *priv;
>> +	ktime_t start_time;
>>  };
>>  
>>  int panfrost_job_init(struct panfrost_device *pfdev);
