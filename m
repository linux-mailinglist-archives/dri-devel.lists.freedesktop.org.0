Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F73404593
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 08:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D36A6E444;
	Thu,  9 Sep 2021 06:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BA06E444
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 06:23:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so529604wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 23:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=LYfNrROKiQT8Q7GpuPFvX0T23V0Gc7llvh+fKUT1iNk=;
 b=MbGKdwmTq/Ke8sXX3aqv92Lj/w8ZoaKC2TdRPlHPjRXoIJpjPLjszaSt2PU8TrqPT5
 l8lpObxg8KBpjXbTu8NGtxaxGjjkLzVgT+dasrpXZIOWlMj0XRRBZsmNAkNeOCX1ekrh
 614Ui8q89r570NdCh8Sm6qfu2w4u3WFLzqRXpxv95wAeR/zG6hBUErT3RUgijJ9Q0GcN
 Qj4VgZcwxtUse8r3sBTs7N0ASOrWBUCkkl2bVcZYM1VFTtUakyfIX/MWr8cxPV3eGMIn
 4J8Bm4c4e2zJTUcfm0ipG53Ex5r1kl+QoB9cjc/FLKZPlivMl68nhQnpATavK4vdS3/1
 3ymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LYfNrROKiQT8Q7GpuPFvX0T23V0Gc7llvh+fKUT1iNk=;
 b=lir+tbDmIW+Ns7eblJVmOIfve0OyhaHaJJQtKJt1KmOxrSplglNzalqZF0bFR+fzC5
 ZoYvu5TzeUbFYJm1vYjn37qGgXUheKV4Dj0qJ5lIWz5laI0KG5DXejWApZFtNnx5/3z8
 HlXJ1jtlasUeNh4JvXbLl3fe9qQWJ94OQP2vBz8RjsFHnFraXSiiJ9JB4TdcERuFjqL/
 t5varz0BRxgzEMa4ghmRwsNsjTSiBCR0T6noHzU/8+jtXRi9vVHGjfXQpdqucfkOz4rW
 my17L0scRRy4nkdLHGv1xQ0RXMXEz2O2gPB2gv8oqUOY1ZlcOjDr+MY77992/ekyGGrU
 keFQ==
X-Gm-Message-State: AOAM533ov17SIUdrrDZRC8Gz77YWesKHFEyao44pHWNohuXWy1P24U3I
 QkmGdo3d73ClRVriGnihWrQ=
X-Google-Smtp-Source: ABdhPJy2rEK01jFrlWd5poS8ZXsd70IaoXy+jTmliDJ+oXPut58iTT1lAtmUnC3x5XbauJ6KZ2UAPg==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr1112068wmi.77.1631168581735; 
 Wed, 08 Sep 2021 23:23:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:327b:a453:3daa:de36?
 ([2a02:908:1252:fb60:327b:a453:3daa:de36])
 by smtp.gmail.com with ESMTPSA id z6sm644159wmp.1.2021.09.08.23.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 23:23:01 -0700 (PDT)
Subject: Re: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Steven Price <steven.price@arm.com>,
 Melissa Wen <mwen@igalia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
 <YTj2scNdCHAdF+cl@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0bb5f8e0-9c42-c97f-16bd-8dbe0f878157@gmail.com>
Date: Thu, 9 Sep 2021 08:22:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTj2scNdCHAdF+cl@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Am 08.09.21 um 19:45 schrieb Daniel Vetter:
> On Fri, Sep 03, 2021 at 11:47:55AM -0700, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> As the finished fence is the one that is exposed to userspace, and
>> therefore the one that other operations, like atomic update, would
>> block on, we need to propagate the deadline from from the finished
>> fence to the actual hw fence.
>>
>> v2: Split into drm_sched_fence_set_parent() (ckoenig)
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
>>   drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>>   include/drm/gpu_scheduler.h             |  8 ++++++
>>   3 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>> index bcea035cf4c6..4fc41a71d1c7 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
>>   	dma_fence_put(&fence->scheduled);
>>   }
>>   
>> +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>> +						  ktime_t deadline)
>> +{
>> +	struct drm_sched_fence *fence = to_drm_sched_fence(f);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&fence->lock, flags);
>> +
>> +	/* If we already have an earlier deadline, keep it: */
>> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>> +	    ktime_before(fence->deadline, deadline)) {
>> +		spin_unlock_irqrestore(&fence->lock, flags);
>> +		return;
>> +	}
>> +
>> +	fence->deadline = deadline;
>> +	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>> +
>> +	spin_unlock_irqrestore(&fence->lock, flags);
>> +
>> +	if (fence->parent)
>> +		dma_fence_set_deadline(fence->parent, deadline);
>> +}
>> +
>>   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>>   	.get_driver_name = drm_sched_fence_get_driver_name,
>>   	.get_timeline_name = drm_sched_fence_get_timeline_name,
>> @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>>   	.get_driver_name = drm_sched_fence_get_driver_name,
>>   	.get_timeline_name = drm_sched_fence_get_timeline_name,
>>   	.release = drm_sched_fence_release_finished,
>> +	.set_deadline = drm_sched_fence_set_deadline_finished,
>>   };
>>   
>>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>> @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>   }
>>   EXPORT_SYMBOL(to_drm_sched_fence);
>>   
>> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>> +				struct dma_fence *fence)
>> +{
>> +	s_fence->parent = dma_fence_get(fence);
>> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>> +		     &s_fence->finished.flags))
> Don't you need the spinlock here too to avoid races? test_bit is very
> unordered, so guarantees nothing. Spinlock would need to be both around
> ->parent = and the test_bit.
>
> Entirely aside, but there's discussions going on to preallocate the hw
> fence somehow. If we do that we could make the deadline forwarding
> lockless here. Having a spinlock just to set the parent is a bit annoying

Well previously we didn't needed the spinlock to set the parent because 
the parent wasn't used outside of the main thread.

This becomes an issue now because we can race with setting the deadline. 
So yeah we probably do need the spinlock here now.

Christian.

> ...
>
> Alternative is that you do this locklessly with barriers and a _lot_ of
> comments. Would be good to benchmark whether the overhead matters though
> first.
> -Daniel
>
>> +		dma_fence_set_deadline(fence, s_fence->deadline);
>> +}
>> +
>>   struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>   					      void *owner)
>>   {
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 595e47ff7d06..27bf0ac0625f 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -978,7 +978,7 @@ static int drm_sched_main(void *param)
>>   		drm_sched_fence_scheduled(s_fence);
>>   
>>   		if (!IS_ERR_OR_NULL(fence)) {
>> -			s_fence->parent = dma_fence_get(fence);
>> +			drm_sched_fence_set_parent(s_fence, fence);
>>   			r = dma_fence_add_callback(fence, &sched_job->cb,
>>   						   drm_sched_job_done_cb);
>>   			if (r == -ENOENT)
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 7f77a455722c..158ddd662469 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -238,6 +238,12 @@ struct drm_sched_fence {
>>            */
>>   	struct dma_fence		finished;
>>   
>> +	/**
>> +	 * @deadline: deadline set on &drm_sched_fence.finished which
>> +	 * potentially needs to be propagated to &drm_sched_fence.parent
>> +	 */
>> +	ktime_t				deadline;
>> +
>>           /**
>>            * @parent: the fence returned by &drm_sched_backend_ops.run_job
>>            * when scheduling the job on hardware. We signal the
>> @@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>   				   enum drm_sched_priority priority);
>>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>   
>> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>> +				struct dma_fence *fence);
>>   struct drm_sched_fence *drm_sched_fence_alloc(
>>   	struct drm_sched_entity *s_entity, void *owner);
>>   void drm_sched_fence_init(struct drm_sched_fence *fence,
>> -- 
>> 2.31.1
>>

