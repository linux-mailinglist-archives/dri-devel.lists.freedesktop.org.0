Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E53B2B0C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FF96EB25;
	Thu, 24 Jun 2021 09:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69E296EB25
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:05:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1F3C1042;
 Thu, 24 Jun 2021 02:05:50 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B75DC3F718;
 Thu, 24 Jun 2021 02:05:49 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] drm/panfrost: Use a threaded IRQ for job interrupts
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210621140226.1685529-1-boris.brezillon@collabora.com>
 <20210621140226.1685529-2-boris.brezillon@collabora.com>
 <31fac44c-4235-0e5a-2ea5-b1165b64cc94@arm.com>
Message-ID: <758ad433-ce92-7022-a390-3fef94babd3c@arm.com>
Date: Thu, 24 Jun 2021 10:05:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <31fac44c-4235-0e5a-2ea5-b1165b64cc94@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2021 17:09, Steven Price wrote:
> On 21/06/2021 15:02, Boris Brezillon wrote:
>> This should avoid uneccessary interrupt-context switches when the GPU
>> is passed a lot of short jobs.
> 
> LGTM:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Well actually... see below.

>>
>> v2:
>> * New patch
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>  drivers/gpu/drm/panfrost/panfrost_job.c | 54 +++++++++++++++++--------
>>  1 file changed, 38 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index cf6abe0fdf47..1b5c636794a1 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -473,19 +473,12 @@ static const struct drm_sched_backend_ops panfrost_sched_ops = {
>>  	.free_job = panfrost_job_free
>>  };
>>  
>> -static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>> +static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>>  {
>> -	struct panfrost_device *pfdev = data;
>> -	u32 status = job_read(pfdev, JOB_INT_STAT);
>>  	int j;
>>  
>>  	dev_dbg(pfdev->dev, "jobslot irq status=%x\n", status);
>>  
>> -	if (!status)
>> -		return IRQ_NONE;
>> -
>> -	pm_runtime_mark_last_busy(pfdev->dev);
>> -
>>  	for (j = 0; status; j++) {
>>  		u32 mask = MK_JS_MASK(j);
>>  
>> @@ -558,16 +551,43 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)

Missing context:

> 		if (status & JOB_INT_MASK_DONE(j)) {
> 			struct panfrost_job *job;
> 
> 			spin_lock(&pfdev->js->job_lock);
> 			job = pfdev->jobs[j];
> 			/* Only NULL if job timeout occurred */
> 			if (job) {
> 				pfdev->jobs[j] = NULL;
> 
> 				panfrost_mmu_as_put(pfdev, job->file_priv->mmu);
> 				panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> 
> 				dma_fence_signal_locked(job->done_fence);
> 				pm_runtime_put_autosuspend(pfdev->dev);
> 			}
> 			spin_unlock(&pfdev->js->job_lock);
> 		}

^^^ Here we're still taking job_lock which is now held by
panfrost_job_irq_handler_thread().

This is removed by the following patch, but it breaks bisection.

Steve

>>  
>>  		status &= ~mask;
>>  	}
>> +}
>>  
>> +static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
>> +{
>> +	struct panfrost_device *pfdev = data;
>> +	u32 status = job_read(pfdev, JOB_INT_RAWSTAT);
>> +
>> +	while (status) {
>> +		pm_runtime_mark_last_busy(pfdev->dev);
>> +
>> +		spin_lock(&pfdev->js->job_lock);
>> +		panfrost_job_handle_irq(pfdev, status);
>> +		spin_unlock(&pfdev->js->job_lock);
>> +		status = job_read(pfdev, JOB_INT_RAWSTAT);
>> +	}
>> +
>> +	job_write(pfdev, JOB_INT_MASK, ~0);
>>  	return IRQ_HANDLED;
>>  }
>>  
>> +static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>> +{
>> +	struct panfrost_device *pfdev = data;
>> +	u32 status = job_read(pfdev, JOB_INT_STAT);
>> +
>> +	if (!status)
>> +		return IRQ_NONE;
>> +
>> +	job_write(pfdev, JOB_INT_MASK, 0);
>> +	return IRQ_WAKE_THREAD;
>> +}
>> +
>>  static void panfrost_reset(struct work_struct *work)
>>  {
>>  	struct panfrost_device *pfdev = container_of(work,
>>  						     struct panfrost_device,
>>  						     reset.work);
>> -	unsigned long flags;
>>  	unsigned int i;
>>  
>>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>> @@ -595,7 +615,7 @@ static void panfrost_reset(struct work_struct *work)
>>  	/* All timers have been stopped, we can safely reset the pending state. */
>>  	atomic_set(&pfdev->reset.pending, 0);
>>  
>> -	spin_lock_irqsave(&pfdev->js->job_lock, flags);
>> +	spin_lock(&pfdev->js->job_lock);
>>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>>  		if (pfdev->jobs[i]) {
>>  			pm_runtime_put_noidle(pfdev->dev);
>> @@ -603,7 +623,7 @@ static void panfrost_reset(struct work_struct *work)
>>  			pfdev->jobs[i] = NULL;
>>  		}
>>  	}
>> -	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
>> +	spin_unlock(&pfdev->js->job_lock);
>>  
>>  	panfrost_device_reset(pfdev);
>>  
>> @@ -628,8 +648,11 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>>  	if (irq <= 0)
>>  		return -ENODEV;
>>  
>> -	ret = devm_request_irq(pfdev->dev, irq, panfrost_job_irq_handler,
>> -			       IRQF_SHARED, KBUILD_MODNAME "-job", pfdev);
>> +	ret = devm_request_threaded_irq(pfdev->dev, irq,
>> +					panfrost_job_irq_handler,
>> +					panfrost_job_irq_handler_thread,
>> +					IRQF_SHARED, KBUILD_MODNAME "-job",
>> +					pfdev);
>>  	if (ret) {
>>  		dev_err(pfdev->dev, "failed to request job irq");
>>  		return ret;
>> @@ -696,14 +719,13 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
>>  void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>>  {
>>  	struct panfrost_device *pfdev = panfrost_priv->pfdev;
>> -	unsigned long flags;
>>  	int i;
>>  
>>  	for (i = 0; i < NUM_JOB_SLOTS; i++)
>>  		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
>>  
>>  	/* Kill in-flight jobs */
>> -	spin_lock_irqsave(&pfdev->js->job_lock, flags);
>> +	spin_lock(&pfdev->js->job_lock);
>>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>>  		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
>>  		struct panfrost_job *job = pfdev->jobs[i];
>> @@ -713,7 +735,7 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>>  
>>  		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_HARD_STOP);
>>  	}
>> -	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
>> +	spin_unlock(&pfdev->js->job_lock);
>>  }
>>  
>>  int panfrost_job_is_idle(struct panfrost_device *pfdev)
>>
> 

