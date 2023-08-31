Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3121C78F619
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 01:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F2510E6FD;
	Thu, 31 Aug 2023 23:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF23810E6FD;
 Thu, 31 Aug 2023 23:23:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 24F3866071C9;
 Fri,  1 Sep 2023 00:23:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693524228;
 bh=k+Cu6Uqi2gfp3j/b0fMYa4TiSD0BST/N43cJgQ23aM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zllfplx4BKzczkFh+fLXpnBiQbPGhX3oLpq8UqRWim4WG8u/sLjEsCQS821Oj2Vyp
 6p8Cx6UNtljxxxiyEVMi7MxCQ8XTIqHbX627XDdlFtppFgCjITtH/cMG8fcFG4nyQQ
 /CAE2FYc9d4MDo1z08vyJpHfRZ2YnGU8kYdj+jMJCJICKUyYsrEHs80XfUmebXkFa1
 VnQgztXczTbvztGPNo9XkQXnQfLudWgbN2k/AsepgoI1b/LyUqfJDH0zICTJ92ZrU+
 YAe4K0LztuVJA6vfUeK2+FSkDCVJ+lvgVZf3Dyl8HBZTgwL6sA0W1F8UtUw0U3bEDh
 30lkYBnqeVi3A==
Date: Fri, 1 Sep 2023 00:23:45 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 2/6] drm/panfrost: Add fdinfo support GPU load metrics
Message-ID: <qv4k3i5lhbw5bkexeiw5mvbjkq7vgjtxrnxfa3bf5ht4gi5nyf@iyfhjdcw5eey>
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-3-adrian.larumbe@collabora.com>
 <20230830121743.15673d3d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230830121743.15673d3d@collabora.com>
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

On 30.08.2023 12:17, Boris Brezillon wrote:
>On Thu, 24 Aug 2023 02:34:45 +0100
>Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
>> The drm-stats fdinfo tags made available to user space are drm-engine,
>> drm-cycles, drm-max-freq and drm-curfreq, one per job slot.
>
>Pretty sure this has already been discussed, but it's probably worth
>mentioning that drm-cycles is not accurate, it just gives you a rough
>idea of how much GPU cycles were dedicated to a context (just like
>drm-engine elapsed-ns is giving you an approximation of the
>GPU utilization). This comes from 2 factors:
>
>1. We're dependent on the time the kernel/CPU takes to process the GPU
>interrupt.
>2. The pipelining done by the Job Manager (2 job slots per engine)
>implies that you can't really know how much time each job spent on the
>GPU. When these jobs are coming from the same context, that's not a
>problem, but when they don't, it's impossible to have a clear split.
>
>I'd really like to have that mentioned somewhere in the code+commit
>message to lower users expectation.
>
>> 
>> This deviates from standard practice in other DRM drivers, where a single
>> set of key:value pairs is provided for the whole render engine. However,
>> Panfrost has separate queues for fragment and vertex/tiler jobs, so a
>> decision was made to calculate bus cycles and workload times separately.
>> 
>> Maximum operating frequency is calculated at devfreq initialisation time.
>> Current frequency is made available to user space because nvtop uses it
>> when performing engine usage calculations.
>> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 ++++
>>  drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ++
>>  drivers/gpu/drm/panfrost/panfrost_device.h  | 13 ++++++
>>  drivers/gpu/drm/panfrost/panfrost_drv.c     | 45 ++++++++++++++++++++-
>>  drivers/gpu/drm/panfrost/panfrost_job.c     | 30 ++++++++++++++
>>  drivers/gpu/drm/panfrost/panfrost_job.h     |  4 ++
>>  6 files changed, 102 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> index 58dfb15a8757..28caffc689e2 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> @@ -58,6 +58,7 @@ static int panfrost_devfreq_get_dev_status(struct device *dev,
>>  	spin_lock_irqsave(&pfdevfreq->lock, irqflags);
>>  
>>  	panfrost_devfreq_update_utilization(pfdevfreq);
>> +	pfdevfreq->current_frequency = status->current_frequency;
>>  
>>  	status->total_time = ktime_to_ns(ktime_add(pfdevfreq->busy_time,
>>  						   pfdevfreq->idle_time));
>> @@ -117,6 +118,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>>  	struct devfreq *devfreq;
>>  	struct thermal_cooling_device *cooling;
>>  	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
>> +	unsigned long freq = ULONG_MAX;
>>  
>>  	if (pfdev->comp->num_supplies > 1) {
>>  		/*
>> @@ -172,6 +174,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>>  		return ret;
>>  	}
>>  
>> +	/* Find the fastest defined rate  */
>> +	opp = dev_pm_opp_find_freq_floor(dev, &freq);
>> +	if (IS_ERR(opp))
>> +		return PTR_ERR(opp);
>> +	pfdevfreq->fast_rate = freq;
>> +
>>  	dev_pm_opp_put(opp);
>>  
>>  	/*
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
>> index 1514c1f9d91c..48dbe185f206 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
>> @@ -19,6 +19,9 @@ struct panfrost_devfreq {
>>  	struct devfreq_simple_ondemand_data gov_data;
>>  	bool opp_of_table_added;
>>  
>> +	unsigned long current_frequency;
>> +	unsigned long fast_rate;
>> +
>>  	ktime_t busy_time;
>>  	ktime_t idle_time;
>>  	ktime_t time_last_update;
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index b0126b9fbadc..680f298fd1a9 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -24,6 +24,7 @@ struct panfrost_perfcnt;
>>  
>>  #define NUM_JOB_SLOTS 3
>>  #define MAX_PM_DOMAINS 5
>> +#define MAX_SLOT_NAME_LEN 10
>>  
>>  struct panfrost_features {
>>  	u16 id;
>> @@ -135,12 +136,24 @@ struct panfrost_mmu {
>>  	struct list_head list;
>>  };
>>  
>> +struct drm_info_gpu {
>> +	unsigned int maxfreq;
>> +
>> +	struct engine_info {
>> +		unsigned long long elapsed_ns;
>> +		unsigned long long cycles;
>> +		char name[MAX_SLOT_NAME_LEN];
>> +	} engines[NUM_JOB_SLOTS];
>> +};
>> +
>>  struct panfrost_file_priv {
>>  	struct panfrost_device *pfdev;
>>  
>>  	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
>>  
>>  	struct panfrost_mmu *mmu;
>> +
>> +	struct drm_info_gpu fdinfo;
>>  };
>>  
>>  static inline struct panfrost_device *to_panfrost_device(struct drm_device *ddev)
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index a2ab99698ca8..3fd372301019 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -267,6 +267,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>>  	job->requirements = args->requirements;
>>  	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
>>  	job->mmu = file_priv->mmu;
>> +	job->priv = file_priv;
>
>Uh, I'm not comfortable passing the file context here, unless you reset
>it to NULL in panfrost_job_close() and have code that's robust to
>job->priv being NULL. We've had cases in the past where jobs outlived
>the file context itself.
>
>>  
>>  	slot = panfrost_job_get_slot(job);
>>  
>> @@ -483,6 +484,14 @@ panfrost_open(struct drm_device *dev, struct drm_file *file)
>>  		goto err_free;
>>  	}
>>  
>> +	snprintf(panfrost_priv->fdinfo.engines[0].name, MAX_SLOT_NAME_LEN, "frg");
>> +	snprintf(panfrost_priv->fdinfo.engines[1].name, MAX_SLOT_NAME_LEN, "vtx");
>> +#if 0
>> +	/* Add compute engine in the future */
>> +	snprintf(panfrost_priv->fdinfo.engines[2].name, MAX_SLOT_NAME_LEN, "cmp");
>> +#endif
>> +	panfrost_priv->fdinfo.maxfreq = pfdev->pfdevfreq.fast_rate;
>> +
>>  	ret = panfrost_job_open(panfrost_priv);
>>  	if (ret)
>>  		goto err_job;
>> @@ -523,7 +532,40 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
>>  };
>>  
>> -DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
>> +
>> +static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
>> +				     struct panfrost_file_priv *panfrost_priv,
>> +				     struct drm_printer *p)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
>> +		struct engine_info *ei = &panfrost_priv->fdinfo.engines[i];
>> +
>> +		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
>> +			   ei->name, ei->elapsed_ns);
>> +		drm_printf(p, "drm-cycles-%s:\t%llu\n",
>> +			   ei->name, ei->cycles);
>> +		drm_printf(p, "drm-maxfreq-%s:\t%u Hz\n",
>> +			   ei->name, panfrost_priv->fdinfo.maxfreq);
>> +		drm_printf(p, "drm-curfreq-%s:\t%u Hz\n",
>> +			   ei->name, pfdev->pfdevfreq.current_frequency);
>> +	}
>> +}
>> +
>> +static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>> +{
>> +	struct drm_device *dev = file->minor->dev;
>> +	struct panfrost_device *pfdev = dev->dev_private;
>> +
>> +	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
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
>> @@ -535,6 +577,7 @@ static const struct drm_driver panfrost_drm_driver = {
>>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
>>  	.open			= panfrost_open,
>>  	.postclose		= panfrost_postclose,
>> +	.show_fdinfo		= panfrost_show_fdinfo,
>>  	.ioctls			= panfrost_drm_driver_ioctls,
>>  	.num_ioctls		= ARRAY_SIZE(panfrost_drm_driver_ioctls),
>>  	.fops			= &panfrost_drm_driver_fops,
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index dbc597ab46fb..a847e183b5d0 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -153,10 +153,31 @@ panfrost_get_job_chain_flag(const struct panfrost_job *job)
>>  	return (f->seqno & 1) ? JS_CONFIG_JOB_CHAIN_FLAG : 0;
>>  }
>>  
>> +static inline unsigned long long read_cycles(struct panfrost_device *pfdev)
>> +{
>> +	u64 address = (u64) gpu_read(pfdev, GPU_CYCLE_COUNT_HI) << 32;
>> +
>> +	address |= gpu_read(pfdev, GPU_CYCLE_COUNT_LO);
>> +
>
>We probably want to handle the 32-bit overflow case with something like:
>
>	u32 hi, lo;
>
>	do {
>		hi = gpu_read(pfdev, GPU_CYCLE_COUNT_HI);
>		lo = gpu_read(pfdev, GPU_CYCLE_COUNT_LO);
>	} while (hi != gpu_read(pfdev, GPU_CYCLE_COUNT_HI));
>
>	return ((u64)hi << 32) | lo;
>
>> +	return address;
>> +}
>> +
>>  static struct panfrost_job *
>>  panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
>>  {
>>  	struct panfrost_job *job = pfdev->jobs[slot][0];
>> +	struct engine_info *engine_info = &job->priv->fdinfo.engines[slot];
>> +
>> +	engine_info->elapsed_ns +=
>> +		ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
>> +	engine_info->cycles +=
>> +		read_cycles(pfdev) - job->start_cycles;
>> +
>> +	/* Reset in case the job has to be requeued */
>> +	job->start_time = 0;
>> +	/* A GPU reset puts the Cycle Counter register back to 0 */
>> +	job->start_cycles = atomic_read(&pfdev->reset.pending) ?
>> +		0 : read_cycles(pfdev);
>
>Do we need to reset these values? If the jobs are re-submitted, those
>fields will be re-assigned, and if the job is done, I don't see where
>we're using it after that point (might have missed something).

I did this because from the third loop in panfrost_job_handle_irq, I got the
impression that when a job in the second slot is stopped after the one in the
first one fails, then it's requeued and started immediately without involvement
from the drm scheduler, so in this case panfrost_job_hw_submit wouldn't be
called. At the moment the initial sample of cycles and time is done in that function.

>>  
>>  	WARN_ON(!job);
>>  	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
>> @@ -233,6 +254,9 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>>  	subslot = panfrost_enqueue_job(pfdev, js, job);
>>  	/* Don't queue the job if a reset is in progress */
>>  	if (!atomic_read(&pfdev->reset.pending)) {
>> +		job->start_time = ktime_get();
>> +		job->start_cycles = read_cycles(pfdev);
>> +
>>  		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
>>  		dev_dbg(pfdev->dev,
>>  			"JS: Submitting atom %p to js[%d][%d] with head=0x%llx AS %d",
>> @@ -297,6 +321,9 @@ int panfrost_job_push(struct panfrost_job *job)
>>  
>>  	kref_get(&job->refcount); /* put by scheduler job completion */
>>  
>> +	if (panfrost_job_is_idle(pfdev))
>> +		gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_START);
>> +
>>  	drm_sched_entity_push_job(&job->base);
>>  
>>  	mutex_unlock(&pfdev->sched_lock);
>> @@ -351,6 +378,9 @@ static void panfrost_job_free(struct drm_sched_job *sched_job)
>>  
>>  	drm_sched_job_cleanup(sched_job);
>>  
>> +	if (panfrost_job_is_idle(job->pfdev))
>> +		gpu_write(job->pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_STOP);
>> +
>>  	panfrost_job_put(job);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
>> index 8becc1ba0eb9..038171c39dd8 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
>> @@ -32,6 +32,10 @@ struct panfrost_job {
>>  
>>  	/* Fence to be signaled by drm-sched once its done with the job */
>>  	struct dma_fence *render_done_fence;
>> +
>> +	struct panfrost_file_priv *priv;
>> +	ktime_t start_time;
>> +	u64 start_cycles;
>>  };
>>  
>>  int panfrost_job_init(struct panfrost_device *pfdev);
