Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838CF42C0C8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953826EA43;
	Wed, 13 Oct 2021 12:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915786E0C8;
 Wed, 13 Oct 2021 12:59:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="288290112"
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="288290112"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 05:59:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524616950"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.46])
 ([10.249.254.46])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 05:59:05 -0700
Message-ID: <66283a71-e423-3d5e-ec6f-c095620ef5ad@linux.intel.com>
Date: Wed, 13 Oct 2021 14:59:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/6] drm/i915: Update dma_fence_work
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
 <20211008133530.664509-2-thomas.hellstrom@linux.intel.com>
 <YWbT/hqoc5fJo17z@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <YWbT/hqoc5fJo17z@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/13/21 14:41, Daniel Vetter wrote:
> On Fri, Oct 08, 2021 at 03:35:25PM +0200, Thomas Hellström wrote:
>> Move the release callback to after fence signaling to align with
>> what's done for upcoming VM_BIND user-fence signaling.
>>
>> Finally call the work callback regardless of whether we have a fence
>> error or not and update the existing callbacks accordingly. We will
>> need this to intercept the error for failsafe migration.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> I think before we make this thing more complex we really should either
> move this into dma-buf/ as a proper thing, or just open-code.
>
> Minimally at least any new async dma_fence worker needs to have
> dma_fence_begin/end_signalling annotations, or we're just digging a grave
> here.
>
> I'm also not seeing the point in building everything on top of this, for
> many cases just an open-coded work_struct should be a lot simpler. It's
> just more to clean up later on, that part is for sure.
> -Daniel

Yes, I mentioned to Matthew, I'm going to respin this based on our 
previous discussions.

Forgot to mention on the ML.

/Thomas


>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_clflush.c |  5 +++
>>   drivers/gpu/drm/i915/i915_sw_fence_work.c   | 36 ++++++++++-----------
>>   drivers/gpu/drm/i915/i915_sw_fence_work.h   |  1 +
>>   drivers/gpu/drm/i915/i915_vma.c             | 12 +++++--
>>   4 files changed, 33 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
>> index f0435c6feb68..2143ebaf5b6f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
>> @@ -28,6 +28,11 @@ static void clflush_work(struct dma_fence_work *base)
>>   {
>>   	struct clflush *clflush = container_of(base, typeof(*clflush), base);
>>   
>> +	if (base->error) {
>> +		dma_fence_set_error(&base->dma, base->error);
>> +		return;
>> +	}
>> +
>>   	__do_clflush(clflush->obj);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
>> index 5b33ef23d54c..5b55cddafc9b 100644
>> --- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
>> +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
>> @@ -6,21 +6,24 @@
>>   
>>   #include "i915_sw_fence_work.h"
>>   
>> -static void fence_complete(struct dma_fence_work *f)
>> +static void dma_fence_work_complete(struct dma_fence_work *f)
>>   {
>> +	dma_fence_signal(&f->dma);
>> +
>>   	if (f->ops->release)
>>   		f->ops->release(f);
>> -	dma_fence_signal(&f->dma);
>> +
>> +	dma_fence_put(&f->dma);
>>   }
>>   
>> -static void fence_work(struct work_struct *work)
>> +static void dma_fence_work_work(struct work_struct *work)
>>   {
>>   	struct dma_fence_work *f = container_of(work, typeof(*f), work);
>>   
>> -	f->ops->work(f);
>> +	if (f->ops->work)
>> +		f->ops->work(f);
>>   
>> -	fence_complete(f);
>> -	dma_fence_put(&f->dma);
>> +	dma_fence_work_complete(f);
>>   }
>>   
>>   static int __i915_sw_fence_call
>> @@ -31,17 +34,13 @@ fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>>   	switch (state) {
>>   	case FENCE_COMPLETE:
>>   		if (fence->error)
>> -			dma_fence_set_error(&f->dma, fence->error);
>> -
>> -		if (!f->dma.error) {
>> -			dma_fence_get(&f->dma);
>> -			if (test_bit(DMA_FENCE_WORK_IMM, &f->dma.flags))
>> -				fence_work(&f->work);
>> -			else
>> -				queue_work(system_unbound_wq, &f->work);
>> -		} else {
>> -			fence_complete(f);
>> -		}
>> +			cmpxchg(&f->error, 0, fence->error);
>> +
>> +		dma_fence_get(&f->dma);
>> +		if (test_bit(DMA_FENCE_WORK_IMM, &f->dma.flags))
>> +			dma_fence_work_work(&f->work);
>> +		else
>> +			queue_work(system_unbound_wq, &f->work);
>>   		break;
>>   
>>   	case FENCE_FREE:
>> @@ -84,10 +83,11 @@ void dma_fence_work_init(struct dma_fence_work *f,
>>   			 const struct dma_fence_work_ops *ops)
>>   {
>>   	f->ops = ops;
>> +	f->error = 0;
>>   	spin_lock_init(&f->lock);
>>   	dma_fence_init(&f->dma, &fence_ops, &f->lock, 0, 0);
>>   	i915_sw_fence_init(&f->chain, fence_notify);
>> -	INIT_WORK(&f->work, fence_work);
>> +	INIT_WORK(&f->work, dma_fence_work_work);
>>   }
>>   
>>   int dma_fence_work_chain(struct dma_fence_work *f, struct dma_fence *signal)
>> diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.h b/drivers/gpu/drm/i915/i915_sw_fence_work.h
>> index d56806918d13..caa59fb5252b 100644
>> --- a/drivers/gpu/drm/i915/i915_sw_fence_work.h
>> +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.h
>> @@ -24,6 +24,7 @@ struct dma_fence_work_ops {
>>   struct dma_fence_work {
>>   	struct dma_fence dma;
>>   	spinlock_t lock;
>> +	int error;
>>   
>>   	struct i915_sw_fence chain;
>>   	struct i915_sw_dma_fence_cb cb;
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 4b7fc4647e46..5123ac28ad9a 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -301,6 +301,11 @@ static void __vma_bind(struct dma_fence_work *work)
>>   	struct i915_vma_work *vw = container_of(work, typeof(*vw), base);
>>   	struct i915_vma *vma = vw->vma;
>>   
>> +	if (work->error) {
>> +		dma_fence_set_error(&work->dma, work->error);
>> +		return;
>> +	}
>> +
>>   	vma->ops->bind_vma(vw->vm, &vw->stash,
>>   			   vma, vw->cache_level, vw->flags);
>>   }
>> @@ -333,7 +338,7 @@ struct i915_vma_work *i915_vma_work(void)
>>   		return NULL;
>>   
>>   	dma_fence_work_init(&vw->base, &bind_ops);
>> -	vw->base.dma.error = -EAGAIN; /* disable the worker by default */
>> +	vw->base.error = -EAGAIN; /* disable the worker by default */
>>   
>>   	return vw;
>>   }
>> @@ -416,6 +421,9 @@ int i915_vma_bind(struct i915_vma *vma,
>>   		 * part of the obj->resv->excl_fence as it only affects
>>   		 * execution and not content or object's backing store lifetime.
>>   		 */
>> +
>> +		work->base.error = 0; /* enable the queue_work() */
>> +
>>   		prev = i915_active_set_exclusive(&vma->active, &work->base.dma);
>>   		if (prev) {
>>   			__i915_sw_fence_await_dma_fence(&work->base.chain,
>> @@ -424,8 +432,6 @@ int i915_vma_bind(struct i915_vma *vma,
>>   			dma_fence_put(prev);
>>   		}
>>   
>> -		work->base.dma.error = 0; /* enable the queue_work() */
>> -
>>   		if (vma->obj) {
>>   			__i915_gem_object_pin_pages(vma->obj);
>>   			work->pinned = i915_gem_object_get(vma->obj);
>> -- 
>> 2.31.1
>>
