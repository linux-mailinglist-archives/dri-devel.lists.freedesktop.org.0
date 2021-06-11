Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446BC3A44AE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 17:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402136EEA9;
	Fri, 11 Jun 2021 15:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A711C6EEAE;
 Fri, 11 Jun 2021 15:10:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q5so6457921wrm.1;
 Fri, 11 Jun 2021 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=i7jUicMRl7vP3RyZNtHz+9FPawFGYmJ10KJ37SJlJ1Y=;
 b=dCeajnVWQLuJqUCAMbct4V624xB9+89eMyHfv0IU7PtIi0QcFcbvPvBZQOQjvqVdvK
 yPZkMPNVUJwAjA4AJhcEWE1+Zi6VzIkpUDlOJlXXtf3oPffZhdc3BVNGxvEUdFRz0aR8
 txH4wo9q1IMIuq2o81j1RupSG4Nf0lyHCVUSIJs/Zr8gzoOxCbDmFOYOB/e6DarUcUjP
 uIApS1o5q7Km3oIRipwzJW22BdiyuY63JmuxWpOa8AK2moUJqcx5BIu6ujMbkAh+Jb3V
 TeC6PcUzj9g1pLDOlRwaQMd5YbTS7S1HnRqtZQ2ivMr40XhcZ6/heY9kdaaWNYFVtZ5k
 m4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=i7jUicMRl7vP3RyZNtHz+9FPawFGYmJ10KJ37SJlJ1Y=;
 b=j2cgU7YgskaQ/WrrulptOsFa/sm53W12DeZ/G/KHIROfD9uozqZPf40MfSpN//11lO
 3vCl9L0VWLIV5rldAlG5PjRIpHhhiEqiVdLrqoHTg7CJJiWpU/0ARefjgMmAyrspbu/z
 6YanU1A7b8g/qdyJoAy1PJVavLOh9bXyuN+cdrJVFKsUXiNXuqFdj9yYPkH/lc8AWBP5
 +WuDyt+KO/jiMzb35qRLly5BosZU3ma1di/WHuNX2wP2Kn63KaL3NJypkmlqdnHDemPV
 bA9eVAIUlunBv5Kzu6zyYXXEwiflACsdUZafojtVgsHmiiIzff4zJLadhVAgq1V2xhwo
 rxOw==
X-Gm-Message-State: AOAM530MqUxjuN/AMHjPlt5yaVetifxnZePS3boXXGjQwXKTWh0ACbNc
 FqTyJmJ/5kmSTEv23HiX5MLXpQiLXTg=
X-Google-Smtp-Source: ABdhPJxOQpATUd8i4xuik+9gSoUT5ke93gFJyhbNUQHIYExe5mcdOMEtdoPl7ycQtcVXYiogWcsUXw==
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr4499631wrw.276.1623424218256; 
 Fri, 11 Jun 2021 08:10:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1?
 ([2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1])
 by smtp.gmail.com with ESMTPSA id n10sm6771725wri.77.2021.06.11.08.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:10:17 -0700 (PDT)
Subject: Re: [PATCH 5/5] drm/amdgpu: rework dma_resv handling v2
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210611120301.10595-1-christian.koenig@amd.com>
 <20210611120301.10595-5-christian.koenig@amd.com>
 <YMN5pJ3mm3wjQemi@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1d0cc193-24ad-1255-5a68-763005fe1b77@gmail.com>
Date: Fri, 11 Jun 2021 17:10:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMN5pJ3mm3wjQemi@phenom.ffwll.local>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.06.21 um 16:56 schrieb Daniel Vetter:
> On Fri, Jun 11, 2021 at 02:03:01PM +0200, Christian König wrote:
>> Drop the workaround and instead implement a better solution.
>>
>> Basically we are now chaining all submissions using a dma_fence_chain
>> container and adding them as exclusive fence to the dma_resv object.
>>
>> This way other drivers can still sync to the single exclusive fence
>> while amdgpu only sync to fences from different processes.
>>
>> v2: polish kerneldoc a bit
> There is no kerneldoc here, and otherwise this patch looks unchanged from
> the previous round. Hit send a bit too quickly?

Ah, there it went!

It's just to hot here, that was meant to be added to the other patch and 
I was really wondering why it wasn't there!

Going to call it a day or rather week and will look at that again on Monday.

Christian.

> -Daniel
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 54 +++++++++++++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 65 ---------------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 -
>>   6 files changed, 47 insertions(+), 79 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
>> index a130e766cbdb..c905a4cfc173 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
>> @@ -34,6 +34,7 @@ struct amdgpu_fpriv;
>>   struct amdgpu_bo_list_entry {
>>   	struct ttm_validate_buffer	tv;
>>   	struct amdgpu_bo_va		*bo_va;
>> +	struct dma_fence_chain		*chain;
>>   	uint32_t			priority;
>>   	struct page			**user_pages;
>>   	bool				user_invalidated;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 325e82621467..f6f3029f958d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -587,6 +587,20 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>   		goto out;
>>   	}
>>   
>> +	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> +		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>> +
>> +		e->bo_va = amdgpu_vm_bo_find(vm, bo);
>> +
>> +		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
>> +			e->chain = dma_fence_chain_alloc();
>> +			if (!e->chain) {
>> +				r = -ENOMEM;
>> +				goto error_validate;
>> +			}
>> +		}
>> +	}
>> +
>>   	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
>>   					  &p->bytes_moved_vis_threshold);
>>   	p->bytes_moved = 0;
>> @@ -614,15 +628,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>   	gws = p->bo_list->gws_obj;
>>   	oa = p->bo_list->oa_obj;
>>   
>> -	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> -		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>> -
>> -		/* Make sure we use the exclusive slot for shared BOs */
>> -		if (bo->prime_shared_count)
>> -			e->tv.num_shared = 0;
>> -		e->bo_va = amdgpu_vm_bo_find(vm, bo);
>> -	}
>> -
>>   	if (gds) {
>>   		p->job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
>>   		p->job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
>> @@ -644,8 +649,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>   	}
>>   
>>   error_validate:
>> -	if (r)
>> +	if (r) {
>> +		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> +			dma_fence_chain_free(e->chain);
>> +			e->chain = NULL;
>> +		}
>>   		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
>> +	}
>>   out:
>>   	return r;
>>   }
>> @@ -685,9 +695,17 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
>>   {
>>   	unsigned i;
>>   
>> -	if (error && backoff)
>> +	if (error && backoff) {
>> +		struct amdgpu_bo_list_entry *e;
>> +
>> +		amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
>> +			dma_fence_chain_free(e->chain);
>> +			e->chain = NULL;
>> +		}
>> +
>>   		ttm_eu_backoff_reservation(&parser->ticket,
>>   					   &parser->validated);
>> +	}
>>   
>>   	for (i = 0; i < parser->num_post_deps; i++) {
>>   		drm_syncobj_put(parser->post_deps[i].syncobj);
>> @@ -1260,6 +1278,20 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>   
>>   	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>>   
>> +	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> +		struct dma_resv *resv = e->tv.bo->base.resv;
>> +		struct dma_fence_chain *chain = e->chain;
>> +
>> +		if (!chain)
>> +			continue;
>> +
>> +		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
>> +				     dma_fence_get(p->fence), 1);
>> +
>> +		rcu_assign_pointer(resv->fence_excl, &chain->base);
>> +		e->chain = NULL;
>> +	}
>> +
>>   	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>>   	mutex_unlock(&p->adev->notifier_lock);
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index c3053b83b80c..23219fc3b28c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -42,48 +42,6 @@
>>   #include <linux/pci-p2pdma.h>
>>   #include <linux/pm_runtime.h>
>>   
>> -static int
>> -__dma_resv_make_exclusive(struct dma_resv *obj)
>> -{
>> -	struct dma_fence **fences;
>> -	unsigned int count;
>> -	int r;
>> -
>> -	if (!dma_resv_shared_list(obj)) /* no shared fences to convert */
>> -		return 0;
>> -
>> -	r = dma_resv_get_fences(obj, NULL, &count, &fences);
>> -	if (r)
>> -		return r;
>> -
>> -	if (count == 0) {
>> -		/* Now that was unexpected. */
>> -	} else if (count == 1) {
>> -		dma_resv_add_excl_fence(obj, fences[0]);
>> -		dma_fence_put(fences[0]);
>> -		kfree(fences);
>> -	} else {
>> -		struct dma_fence_array *array;
>> -
>> -		array = dma_fence_array_create(count, fences,
>> -					       dma_fence_context_alloc(1), 0,
>> -					       false);
>> -		if (!array)
>> -			goto err_fences_put;
>> -
>> -		dma_resv_add_excl_fence(obj, &array->base);
>> -		dma_fence_put(&array->base);
>> -	}
>> -
>> -	return 0;
>> -
>> -err_fences_put:
>> -	while (count--)
>> -		dma_fence_put(fences[count]);
>> -	kfree(fences);
>> -	return -ENOMEM;
>> -}
>> -
>>   /**
>>    * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
>>    *
>> @@ -110,24 +68,6 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
>>   	if (r < 0)
>>   		goto out;
>>   
>> -	r = amdgpu_bo_reserve(bo, false);
>> -	if (unlikely(r != 0))
>> -		goto out;
>> -
>> -	/*
>> -	 * We only create shared fences for internal use, but importers
>> -	 * of the dmabuf rely on exclusive fences for implicitly
>> -	 * tracking write hazards. As any of the current fences may
>> -	 * correspond to a write, we need to convert all existing
>> -	 * fences on the reservation object into a single exclusive
>> -	 * fence.
>> -	 */
>> -	r = __dma_resv_make_exclusive(bo->tbo.base.resv);
>> -	if (r)
>> -		goto out;
>> -
>> -	bo->prime_shared_count++;
>> -	amdgpu_bo_unreserve(bo);
>>   	return 0;
>>   
>>   out:
>> @@ -150,9 +90,6 @@ static void amdgpu_dma_buf_detach(struct dma_buf *dmabuf,
>>   	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>   
>> -	if (attach->dev->driver != adev->dev->driver && bo->prime_shared_count)
>> -		bo->prime_shared_count--;
>> -
>>   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>>   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>>   }
>> @@ -406,8 +343,6 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>>   	bo = gem_to_amdgpu_bo(gobj);
>>   	bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
>>   	bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
>> -	if (dma_buf->ops != &amdgpu_dmabuf_ops)
>> -		bo->prime_shared_count = 1;
>>   
>>   	dma_resv_unlock(resv);
>>   	return gobj;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index 1c3e3b608332..5d82120fc160 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -829,7 +829,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
>>   		break;
>>   	}
>>   	case AMDGPU_GEM_OP_SET_PLACEMENT:
>> -		if (robj->prime_shared_count && (args->value & AMDGPU_GEM_DOMAIN_VRAM)) {
>> +		if (robj->tbo.base.import_attach &&
>> +		    args->value & AMDGPU_GEM_DOMAIN_VRAM) {
>>   			r = -EINVAL;
>>   			amdgpu_bo_unreserve(robj);
>>   			break;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 96447e1d4c9c..30951b593809 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -871,7 +871,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
>>   		return -EINVAL;
>>   
>>   	/* A shared bo cannot be migrated to VRAM */
>> -	if (bo->prime_shared_count || bo->tbo.base.import_attach) {
>> +	if (bo->tbo.base.import_attach) {
>>   		if (domain & AMDGPU_GEM_DOMAIN_GTT)
>>   			domain = AMDGPU_GEM_DOMAIN_GTT;
>>   		else
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> index b35962702278..55d7e90eaa72 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> @@ -98,7 +98,6 @@ struct amdgpu_bo {
>>   	struct ttm_buffer_object	tbo;
>>   	struct ttm_bo_kmap_obj		kmap;
>>   	u64				flags;
>> -	unsigned			prime_shared_count;
>>   	/* per VM structure for page tables and with virtual addresses */
>>   	struct amdgpu_vm_bo_base	*vm_bo;
>>   	/* Constant after initialization */
>> -- 
>> 2.25.1
>>

