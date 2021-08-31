Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAA13FC76B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 14:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D436A89A77;
	Tue, 31 Aug 2021 12:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260C689A77
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 12:39:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z4so27445472wrr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XqVnP2fWqmBvYXnrJLFFt5iNlUAQKQMrg2mpN7vlVm0=;
 b=kBSw5G2LmT74tiONoQs1NV79WDwDwFfXtW8xksWcnw+IOgce4CbFGe/vg1ms8Dh5jW
 N5mSg1YAxIruSK2WFmFLUUnV0flQKXL2i0fxOMuxHHjQ6AENN9DSmcYxZ6P84zZJIkZf
 r9i6GCd2wIo/H2G8pI6HaeyVMX/mkF7ZZk8QVmQJ2KfaNYbY7BX1jExsAV+IgzxGsBDW
 Szxk1TSXp469D0KXAwTvZ1XSrvMU4BAZwnrC4V39JeLHUpn5pwMBGmdrXX7KogXyufmO
 9/eyEDghSJGH9v3RIIvDu2B1qzoTO5/oLktgBOVqKA49vqtEsbsc9/dyGknckXUFt/PC
 Fi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XqVnP2fWqmBvYXnrJLFFt5iNlUAQKQMrg2mpN7vlVm0=;
 b=d0Bl4sCb5in4D79kQVxv1wbwZcBo417J1HttnZRKPNiEcWhapLZz0MIfilCfnPVGJ6
 dJpHERs0vwsrz3+s56vz0p1FHaaencF1qq2Rl8EczJr2qCsVJU7BdCCktpAI7Zoptdby
 9I3mBYLREZKPUTDa+h/KZkHjwNv6rTV/c6UOk9K+Y3AUZDhE6UE76KihSZyMEsfzdz4c
 isn8XexM8/w+I4JvU4lVKcfpbThD3oW7Xya6Xj7H0XTzlZmNQpor7/94c/M6KWYBfYNa
 jGXL8dWgjaLIaCmOolqD1JG5HSXRok/1CVJ+qQct0MWASyG0WDH+5I/tnZWdtcUQaUU7
 h/tg==
X-Gm-Message-State: AOAM532w7j4g16HZ3M8ApRv60VmUYvhbuTFBWGcfeb8kQH8d5L2g/9ZB
 nFrZ2FtdNTZF7PpvaWK2hmo=
X-Google-Smtp-Source: ABdhPJzPC9sC6DmZWXfLMD6H7scVQ9h5zI9zYi+YoL29mhsdIY8onDoUqCwTB4a69gSzKokXyqZbbg==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr31631494wrt.104.1630413572639; 
 Tue, 31 Aug 2021 05:39:32 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id b62sm2331777wmb.17.2021.08.31.05.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 05:39:32 -0700 (PDT)
Subject: Re: [PATCH 1/2] dma-buf: nuke DMA_FENCE_TRACE macros v2
To: Daniel Vetter <daniel@ffwll.ch>
Cc: hridya@google.com, john.stultz@linaro.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 gustavo@padovan.org, linux-media@vger.kernel.org, adelva@google.com,
 sspatil@google.com
References: <20210818105443.1578-1-christian.koenig@amd.com>
 <015fd5ed-9255-9c28-44f3-3c8dde90ebad@gmail.com>
 <YSdXEaBDpijEBx/6@phenom.ffwll.local>
 <0c150724-032f-b566-4f61-b4771bafe7a8@gmail.com>
 <YSlJwX0lNBSdj880@phenom.ffwll.local>
 <d41b682d-f4ec-b050-8f45-78b9a9ce944d@gmail.com>
 <YS4hAhVPlyAWdX/n@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8ab2702e-3f5c-2c78-cb61-730aa3b04b18@gmail.com>
Date: Tue, 31 Aug 2021 14:39:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS4hAhVPlyAWdX/n@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 31.08.21 um 14:30 schrieb Daniel Vetter:
> On Mon, Aug 30, 2021 at 08:28:49AM +0200, Christian König wrote:
>> Am 27.08.21 um 22:23 schrieb Daniel Vetter:
>>> On Fri, Aug 27, 2021 at 11:07:58AM +0200, Christian König wrote:
>>>> Am 26.08.21 um 10:55 schrieb Daniel Vetter:
>>>>> On Tue, Aug 24, 2021 at 10:12:24AM +0200, Christian König wrote:
>>>>>> Just a gentle ping. Daniel any more comments on this?
>>>>> Still haven't seen a patch set to nuke the sw_sync igt tests. Otherwise
>>>>> this is just going to cause fails and reboots in our ci (we reboot on
>>>>> taints).
>>>> *sigh* can I at least print a warning without breaking the igt tests?
>>> CI watches dmesg too ... it just doesn't force a reboot (which hurts run
>>> rate really badly).
>>>
>>>>>> I'm not sure if the second patch will cause trouble with any unit test, but
>>>>>> I'm willing to try it. We can always trivial revert it.
>>>>> See above, remove the igts and we should be fine I think. I don't think
>>>>> there's any selftests or kselftests, but checking that should be a quick
>>>>> grep at most.
>>>> Yeah, we don't have any selftests as far as I can see but this stuff is so
>>>> interweaved with igt that it will be hard to remove I think.
>>>>
>>>> A good bunch of the igt code seems to have been moved to using VGEM instead,
>>>> but as far as I can see there is still plenty left relying on this.
>>>>
>>>> Alternatively could we make the config option depend on CONFIG_DEBUG?
>>> Hm I thought it was just down to sw_sync igt testcase, and everything else
>>> is moved to vgem. Do we have more, or has more landed since I looked a
>>> while ago?
>> The code under lib/sw_sync.c uses this and based on that lib/igt_dummyload.c
>> defines an IGT_CORK_FENCE which is then used by at least:
>>
>> tests/i915/gem_exec_fence.c
>> tests/i915/gem_eio.c
>> tests/i915/gem_exec_schedule.c
>> tests/i915/gem_exec_balancer.c
>> tests/i915/gem_ctx_shared.c
>> tests/kms_busy.c
>>
>> After that I've stoped looking deeper into it.
> Uh crap, I totally missed this. This is a rather messy area of igt with a
> pile of questionable tests and stuff ... No idea when we'll get around to
> cleaning that up with all the other fires going on :-(

Ok in this case please just give me an acked-by or rb on the first patch 
and I will put the second on hold until we have cleaned that up.

Thanks,
Christian.

> -Daniel
>
>> Christian.
>>
>>> -Daniel
>>>
>>>> Christian.
>>>>
>>>>> -Daniel
>>>>>
>>>>>> Thanks,
>>>>>> Christian.
>>>>>>
>>>>>> Am 18.08.21 um 12:54 schrieb Christian König:
>>>>>>> Only the DRM GPU scheduler, radeon and amdgpu where using them and they depend
>>>>>>> on a non existing config option to actually emit some code.
>>>>>>>
>>>>>>> v2: keep the signal path as is for now
>>>>>>>
>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 10 +---------
>>>>>>>      drivers/gpu/drm/radeon/radeon_fence.c     | 24 ++++-------------------
>>>>>>>      drivers/gpu/drm/scheduler/sched_fence.c   | 18 ++---------------
>>>>>>>      include/linux/dma-fence.h                 | 22 ---------------------
>>>>>>>      4 files changed, 7 insertions(+), 67 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> index 0b1c48590c43..c65994e382bd 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> @@ -246,7 +246,6 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
>>>>>>>      	struct amdgpu_fence_driver *drv = &ring->fence_drv;
>>>>>>>      	struct amdgpu_device *adev = ring->adev;
>>>>>>>      	uint32_t seq, last_seq;
>>>>>>> -	int r;
>>>>>>>      	do {
>>>>>>>      		last_seq = atomic_read(&ring->fence_drv.last_seq);
>>>>>>> @@ -278,12 +277,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
>>>>>>>      		if (!fence)
>>>>>>>      			continue;
>>>>>>> -		r = dma_fence_signal(fence);
>>>>>>> -		if (!r)
>>>>>>> -			DMA_FENCE_TRACE(fence, "signaled from irq context\n");
>>>>>>> -		else
>>>>>>> -			BUG();
>>>>>>> -
>>>>>>> +		dma_fence_signal(fence);
>>>>>>>      		dma_fence_put(fence);
>>>>>>>      		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>>>>>>>      		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>>>>>>> @@ -639,8 +633,6 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
>>>>>>>      	if (!timer_pending(&ring->fence_drv.fallback_timer))
>>>>>>>      		amdgpu_fence_schedule_fallback(ring);
>>>>>>> -	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", ring->idx);
>>>>>>> -
>>>>>>>      	return true;
>>>>>>>      }
>>>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
>>>>>>> index 18f2c2e0dfb3..3f351d222cbb 100644
>>>>>>> --- a/drivers/gpu/drm/radeon/radeon_fence.c
>>>>>>> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
>>>>>>> @@ -176,18 +176,11 @@ static int radeon_fence_check_signaled(wait_queue_entry_t *wait, unsigned mode,
>>>>>>>      	 */
>>>>>>>      	seq = atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq);
>>>>>>>      	if (seq >= fence->seq) {
>>>>>>> -		int ret = dma_fence_signal_locked(&fence->base);
>>>>>>> -
>>>>>>> -		if (!ret)
>>>>>>> -			DMA_FENCE_TRACE(&fence->base, "signaled from irq context\n");
>>>>>>> -		else
>>>>>>> -			DMA_FENCE_TRACE(&fence->base, "was already signaled\n");
>>>>>>> -
>>>>>>> +		dma_fence_signal_locked(&fence->base);
>>>>>>>      		radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
>>>>>>>      		__remove_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake);
>>>>>>>      		dma_fence_put(&fence->base);
>>>>>>> -	} else
>>>>>>> -		DMA_FENCE_TRACE(&fence->base, "pending\n");
>>>>>>> +	}
>>>>>>>      	return 0;
>>>>>>>      }
>>>>>>> @@ -422,8 +415,6 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
>>>>>>>      	fence->fence_wake.func = radeon_fence_check_signaled;
>>>>>>>      	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
>>>>>>>      	dma_fence_get(f);
>>>>>>> -
>>>>>>> -	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", fence->ring);
>>>>>>>      	return true;
>>>>>>>      }
>>>>>>> @@ -441,11 +432,7 @@ bool radeon_fence_signaled(struct radeon_fence *fence)
>>>>>>>      		return true;
>>>>>>>      	if (radeon_fence_seq_signaled(fence->rdev, fence->seq, fence->ring)) {
>>>>>>> -		int ret;
>>>>>>> -
>>>>>>> -		ret = dma_fence_signal(&fence->base);
>>>>>>> -		if (!ret)
>>>>>>> -			DMA_FENCE_TRACE(&fence->base, "signaled from radeon_fence_signaled\n");
>>>>>>> +		dma_fence_signal(&fence->base);
>>>>>>>      		return true;
>>>>>>>      	}
>>>>>>>      	return false;
>>>>>>> @@ -550,7 +537,6 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
>>>>>>>      {
>>>>>>>      	uint64_t seq[RADEON_NUM_RINGS] = {};
>>>>>>>      	long r;
>>>>>>> -	int r_sig;
>>>>>>>      	/*
>>>>>>>      	 * This function should not be called on !radeon fences.
>>>>>>> @@ -567,9 +553,7 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
>>>>>>>      		return r;
>>>>>>>      	}
>>>>>>> -	r_sig = dma_fence_signal(&fence->base);
>>>>>>> -	if (!r_sig)
>>>>>>> -		DMA_FENCE_TRACE(&fence->base, "signaled from fence_wait\n");
>>>>>>> +	dma_fence_signal(&fence->base);
>>>>>>>      	return r;
>>>>>>>      }
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>> index 69de2c76731f..3736746c47bd 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>> @@ -50,26 +50,12 @@ static void __exit drm_sched_fence_slab_fini(void)
>>>>>>>      void drm_sched_fence_scheduled(struct drm_sched_fence *fence)
>>>>>>>      {
>>>>>>> -	int ret = dma_fence_signal(&fence->scheduled);
>>>>>>> -
>>>>>>> -	if (!ret)
>>>>>>> -		DMA_FENCE_TRACE(&fence->scheduled,
>>>>>>> -				"signaled from irq context\n");
>>>>>>> -	else
>>>>>>> -		DMA_FENCE_TRACE(&fence->scheduled,
>>>>>>> -				"was already signaled\n");
>>>>>>> +	dma_fence_signal(&fence->scheduled);
>>>>>>>      }
>>>>>>>      void drm_sched_fence_finished(struct drm_sched_fence *fence)
>>>>>>>      {
>>>>>>> -	int ret = dma_fence_signal(&fence->finished);
>>>>>>> -
>>>>>>> -	if (!ret)
>>>>>>> -		DMA_FENCE_TRACE(&fence->finished,
>>>>>>> -				"signaled from irq context\n");
>>>>>>> -	else
>>>>>>> -		DMA_FENCE_TRACE(&fence->finished,
>>>>>>> -				"was already signaled\n");
>>>>>>> +	dma_fence_signal(&fence->finished);
>>>>>>>      }
>>>>>>>      static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>>>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>>>> index 6ffb4b2c6371..4cc119ab272f 100644
>>>>>>> --- a/include/linux/dma-fence.h
>>>>>>> +++ b/include/linux/dma-fence.h
>>>>>>> @@ -590,26 +590,4 @@ struct dma_fence *dma_fence_get_stub(void);
>>>>>>>      struct dma_fence *dma_fence_allocate_private_stub(void);
>>>>>>>      u64 dma_fence_context_alloc(unsigned num);
>>>>>>> -#define DMA_FENCE_TRACE(f, fmt, args...) \
>>>>>>> -	do {								\
>>>>>>> -		struct dma_fence *__ff = (f);				\
>>>>>>> -		if (IS_ENABLED(CONFIG_DMA_FENCE_TRACE))			\
>>>>>>> -			pr_info("f %llu#%llu: " fmt,			\
>>>>>>> -				__ff->context, __ff->seqno, ##args);	\
>>>>>>> -	} while (0)
>>>>>>> -
>>>>>>> -#define DMA_FENCE_WARN(f, fmt, args...) \
>>>>>>> -	do {								\
>>>>>>> -		struct dma_fence *__ff = (f);				\
>>>>>>> -		pr_warn("f %llu#%llu: " fmt, __ff->context, __ff->seqno,\
>>>>>>> -			 ##args);					\
>>>>>>> -	} while (0)
>>>>>>> -
>>>>>>> -#define DMA_FENCE_ERR(f, fmt, args...) \
>>>>>>> -	do {								\
>>>>>>> -		struct dma_fence *__ff = (f);				\
>>>>>>> -		pr_err("f %llu#%llu: " fmt, __ff->context, __ff->seqno,	\
>>>>>>> -			##args);					\
>>>>>>> -	} while (0)
>>>>>>> -
>>>>>>>      #endif /* __LINUX_DMA_FENCE_H */

