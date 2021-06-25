Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE5F3B473C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 18:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5776EE0C;
	Fri, 25 Jun 2021 16:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57AC56EE0C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 16:11:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0BC31063;
 Fri, 25 Jun 2021 09:11:34 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8EAB3F719;
 Fri, 25 Jun 2021 09:11:32 -0700 (PDT)
Subject: Re: [PATCH v3 10/15] drm/panfrost: Make sure job interrupts are
 masked before resetting
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
 <20210625133327.2598825-11-boris.brezillon@collabora.com>
 <49a60b4f-911e-2c03-29ce-4b1b9f605b3d@arm.com>
 <20210625180207.329b1956@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <6e105092-3451-f11b-6c39-1c5bc0ff66c2@arm.com>
Date: Fri, 25 Jun 2021 17:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625180207.329b1956@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/06/2021 17:02, Boris Brezillon wrote:
> On Fri, 25 Jun 2021 16:55:12 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 25/06/2021 14:33, Boris Brezillon wrote:
>>> This is not yet needed because we let active jobs be killed during by
>>> the reset and we don't really bother making sure they can be restarted.
>>> But once we start adding soft-stop support, controlling when we deal
>>> with the remaining interrrupts and making sure those are handled before
>>> the reset is issued gets tricky if we keep job interrupts active.
>>>
>>> Let's prepare for that and mask+flush job IRQs before issuing a reset.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panfrost/panfrost_job.c | 21 +++++++++++++++------
>>>  1 file changed, 15 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> index 88d34fd781e8..0566e2f7e84a 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> @@ -34,6 +34,7 @@ struct panfrost_queue_state {
>>>  struct panfrost_job_slot {
>>>  	struct panfrost_queue_state queue[NUM_JOB_SLOTS];
>>>  	spinlock_t job_lock;
>>> +	int irq;
>>>  };
>>>  
>>>  static struct panfrost_job *
>>> @@ -400,7 +401,15 @@ static void panfrost_reset(struct panfrost_device *pfdev,
>>>  	if (bad)
>>>  		drm_sched_increase_karma(bad);
>>>  
>>> -	spin_lock(&pfdev->js->job_lock);  
>>
>> I'm not sure it's safe to remove this lock as this protects the
>> pfdev->jobs array: I can't see what would prevent panfrost_job_close()
>> running at the same time without the lock. Am I missing something?
> 
> Ah, you're right, I'll add it back.
> 
>>
>>> +	/* Mask job interrupts and synchronize to make sure we won't be
>>> +	 * interrupted during our reset.
>>> +	 */
>>> +	job_write(pfdev, JOB_INT_MASK, 0);
>>> +	synchronize_irq(pfdev->js->irq);
>>> +
>>> +	/* Schedulers are stopped and interrupts are masked+flushed, we don't
>>> +	 * need to protect the 'evict unfinished jobs' lock with the job_lock.
>>> +	 */
>>>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>>>  		if (pfdev->jobs[i]) {
>>>  			pm_runtime_put_noidle(pfdev->dev);
>>> @@ -408,7 +417,6 @@ static void panfrost_reset(struct panfrost_device *pfdev,
>>>  			pfdev->jobs[i] = NULL;
>>>  		}
>>>  	}
>>> -	spin_unlock(&pfdev->js->job_lock);
>>>  
>>>  	panfrost_device_reset(pfdev);
>>>  
>>> @@ -504,6 +512,7 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>>>  
>>>  			job = pfdev->jobs[j];
>>>  			/* Only NULL if job timeout occurred */
>>> +			WARN_ON(!job);  
>>
>> Was this WARN_ON intentional?
> 
> Yes, now that we mask and synchronize the irq in the reset I don't see
> any reason why we would end up with an event but no job to attach this
> even to, but maybe I missed something.
> 

Ok - but I guess the comment above needs updating then! ;) Job timeouts
are still a thing which definitely can happen!

Steve
