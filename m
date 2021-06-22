Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486BA3B0015
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145E66E453;
	Tue, 22 Jun 2021 09:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A966E450;
 Tue, 22 Jun 2021 09:20:48 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dm5so21035429ejc.9;
 Tue, 22 Jun 2021 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XIUHv+jyCAdN7h4+2hsH7kw9sWonZT0MANkya66oiC8=;
 b=FG8duBaDDF+D3srML8tEAmuqXMyfwniXd1RifYepLhRU3o3FoAEL7RO5Mif/Wr1reE
 AacdmjrV9pI6+3Xlus7X7LwMEzbAedyi+Q1I2VbwyAvli8Y1kTNOHoP6rOA4tBBiz8GA
 lL2TmqTxprmNHTGnNpTZVJkyZWdM6AyT3goH0jQlKvs4zaQCoNgvfouh+tB7L6ugIukS
 TP1RqnEUAZj9eNaJRzyL3vBMANwrJWHlUe4gLdWbQ/ppy9ZQBhvi0v4vAbkgQwlYOokp
 IqFZ5xJoev7BgQ3QKGeYqzuIexkmk2yDvpbCebxNtsVRvm1QwKl+QLW2gHRRkQ97wj7O
 nXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XIUHv+jyCAdN7h4+2hsH7kw9sWonZT0MANkya66oiC8=;
 b=LTqnUIcbYDaJyGioJwYYL8pwR7Hm6tXzhTGw45B0iKLNU9JbMbo57zjd3bk0/NqrBP
 4vzpq36CG0aMqWi7mPSG6kkNXy6GvW22wA4eToGrvhi8EO2Em1ZOTn7FEO3xH6exzeL4
 /pQ4sEkOS9ouxC1VWqRV73Bs352AlM8iJvySpRzj+ZBSKX3n/Vd+deiT6f3tGCVrBt4v
 fU0VUMx3EgWjeCYn6/+jy4rQeNAr57jUJxEyRNaa/BGGO05L3smeNlrbTln9cCydI4ON
 iZq3V+dSO0wtXmbj1VGsv0+r27KFOffB3VUScP65Am/lQos+uohzO1nFokj4q654SSoC
 GqtQ==
X-Gm-Message-State: AOAM533xW89kmPLkXnOCO4TXsFkgILNuHoJItBgpwCGK4RG+tmHcABQ9
 pX9r0f7+k643wsQ6GZkc52adk+G3ZNA=
X-Google-Smtp-Source: ABdhPJwElAo2VK6lg/DCcbk/L8LdxkiVmdcx3Z3CEdO85iacAZvBFtrAsG73f8oWGKnROCtLfDSWUw==
X-Received: by 2002:a17:907:1628:: with SMTP id
 hb40mr3002798ejc.286.1624353647400; 
 Tue, 22 Jun 2021 02:20:47 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4?
 ([2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4])
 by smtp.gmail.com with ESMTPSA id h20sm5569423ejl.7.2021.06.22.02.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 02:20:46 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: rework dma_resv handling v3
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210614174536.5188-1-christian.koenig@amd.com>
 <20210614174536.5188-2-christian.koenig@amd.com>
 <CADnq5_OMZZomJvpNzpA=kXgvDWAM538kYVUFnrnXhYO4Gne17Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ab1325eb-c9fd-a71b-73b4-01cb37f8bd0e@gmail.com>
Date: Tue, 22 Jun 2021 11:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_OMZZomJvpNzpA=kXgvDWAM538kYVUFnrnXhYO4Gne17Q@mail.gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.06.21 um 23:09 schrieb Alex Deucher:
> On Mon, Jun 14, 2021 at 1:45 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Drop the workaround and instead implement a better solution.
>>
>> Basically we are now chaining all submissions using a dma_fence_chain
>> container and adding them as exclusive fence to the dma_resv object.
>>
>> This way other drivers can still sync to the single exclusive fence
>> while amdgpu only sync to fences from different processes.
>>
>> v3: add the shared fence first before the exclusive one
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Series is:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

FYI I've pushed this to drm-misc-next to avoid re-base problems.

Will probably not go upstream before 5.15, so we have plenty of time to 
test this.

Christian.

>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 62 ++++++++++++++++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 65 ---------------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 -
>>   6 files changed, 55 insertions(+), 79 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
>> index a130e766cbdb..c905a4cfc173 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
>> @@ -34,6 +34,7 @@ struct amdgpu_fpriv;
>>   struct amdgpu_bo_list_entry {
>>          struct ttm_validate_buffer      tv;
>>          struct amdgpu_bo_va             *bo_va;
>> +       struct dma_fence_chain          *chain;
>>          uint32_t                        priority;
>>          struct page                     **user_pages;
>>          bool                            user_invalidated;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 9ce649a1a8d3..25655414e9c0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -572,6 +572,20 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>                  goto out;
>>          }
>>
>> +       amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> +               struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>> +
>> +               e->bo_va = amdgpu_vm_bo_find(vm, bo);
>> +
>> +               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
>> +                       e->chain = dma_fence_chain_alloc();
>> +                       if (!e->chain) {
>> +                               r = -ENOMEM;
>> +                               goto error_validate;
>> +                       }
>> +               }
>> +       }
>> +
>>          amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
>>                                            &p->bytes_moved_vis_threshold);
>>          p->bytes_moved = 0;
>> @@ -599,15 +613,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>          gws = p->bo_list->gws_obj;
>>          oa = p->bo_list->oa_obj;
>>
>> -       amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> -               struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>> -
>> -               /* Make sure we use the exclusive slot for shared BOs */
>> -               if (bo->prime_shared_count)
>> -                       e->tv.num_shared = 0;
>> -               e->bo_va = amdgpu_vm_bo_find(vm, bo);
>> -       }
>> -
>>          if (gds) {
>>                  p->job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
>>                  p->job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
>> @@ -629,8 +634,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>          }
>>
>>   error_validate:
>> -       if (r)
>> +       if (r) {
>> +               amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> +                       dma_fence_chain_free(e->chain);
>> +                       e->chain = NULL;
>> +               }
>>                  ttm_eu_backoff_reservation(&p->ticket, &p->validated);
>> +       }
>>   out:
>>          return r;
>>   }
>> @@ -670,9 +680,17 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
>>   {
>>          unsigned i;
>>
>> -       if (error && backoff)
>> +       if (error && backoff) {
>> +               struct amdgpu_bo_list_entry *e;
>> +
>> +               amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
>> +                       dma_fence_chain_free(e->chain);
>> +                       e->chain = NULL;
>> +               }
>> +
>>                  ttm_eu_backoff_reservation(&parser->ticket,
>>                                             &parser->validated);
>> +       }
>>
>>          for (i = 0; i < parser->num_post_deps; i++) {
>>                  drm_syncobj_put(parser->post_deps[i].syncobj);
>> @@ -1245,6 +1263,28 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>
>>          amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>>
>> +       amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> +               struct dma_resv *resv = e->tv.bo->base.resv;
>> +               struct dma_fence_chain *chain = e->chain;
>> +
>> +               if (!chain)
>> +                       continue;
>> +
>> +               /*
>> +                * Work around dma_resv shortcommings by wrapping up the
>> +                * submission in a dma_fence_chain and add it as exclusive
>> +                * fence, but first add the submission as shared fence to make
>> +                * sure that shared fences never signal before the exclusive
>> +                * one.
>> +                */
>> +               dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
>> +                                    dma_fence_get(p->fence), 1);
>> +
>> +               dma_resv_add_shared_fence(resv, p->fence);
>> +               rcu_assign_pointer(resv->fence_excl, &chain->base);
>> +               e->chain = NULL;
>> +       }
>> +
>>          ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>>          mutex_unlock(&p->adev->notifier_lock);
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
>> -       struct dma_fence **fences;
>> -       unsigned int count;
>> -       int r;
>> -
>> -       if (!dma_resv_shared_list(obj)) /* no shared fences to convert */
>> -               return 0;
>> -
>> -       r = dma_resv_get_fences(obj, NULL, &count, &fences);
>> -       if (r)
>> -               return r;
>> -
>> -       if (count == 0) {
>> -               /* Now that was unexpected. */
>> -       } else if (count == 1) {
>> -               dma_resv_add_excl_fence(obj, fences[0]);
>> -               dma_fence_put(fences[0]);
>> -               kfree(fences);
>> -       } else {
>> -               struct dma_fence_array *array;
>> -
>> -               array = dma_fence_array_create(count, fences,
>> -                                              dma_fence_context_alloc(1), 0,
>> -                                              false);
>> -               if (!array)
>> -                       goto err_fences_put;
>> -
>> -               dma_resv_add_excl_fence(obj, &array->base);
>> -               dma_fence_put(&array->base);
>> -       }
>> -
>> -       return 0;
>> -
>> -err_fences_put:
>> -       while (count--)
>> -               dma_fence_put(fences[count]);
>> -       kfree(fences);
>> -       return -ENOMEM;
>> -}
>> -
>>   /**
>>    * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
>>    *
>> @@ -110,24 +68,6 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
>>          if (r < 0)
>>                  goto out;
>>
>> -       r = amdgpu_bo_reserve(bo, false);
>> -       if (unlikely(r != 0))
>> -               goto out;
>> -
>> -       /*
>> -        * We only create shared fences for internal use, but importers
>> -        * of the dmabuf rely on exclusive fences for implicitly
>> -        * tracking write hazards. As any of the current fences may
>> -        * correspond to a write, we need to convert all existing
>> -        * fences on the reservation object into a single exclusive
>> -        * fence.
>> -        */
>> -       r = __dma_resv_make_exclusive(bo->tbo.base.resv);
>> -       if (r)
>> -               goto out;
>> -
>> -       bo->prime_shared_count++;
>> -       amdgpu_bo_unreserve(bo);
>>          return 0;
>>
>>   out:
>> @@ -150,9 +90,6 @@ static void amdgpu_dma_buf_detach(struct dma_buf *dmabuf,
>>          struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>>          struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>
>> -       if (attach->dev->driver != adev->dev->driver && bo->prime_shared_count)
>> -               bo->prime_shared_count--;
>> -
>>          pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>>          pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>>   }
>> @@ -406,8 +343,6 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>>          bo = gem_to_amdgpu_bo(gobj);
>>          bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
>>          bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
>> -       if (dma_buf->ops != &amdgpu_dmabuf_ops)
>> -               bo->prime_shared_count = 1;
>>
>>          dma_resv_unlock(resv);
>>          return gobj;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index 9cf4beaf646c..0780e8d18992 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -829,7 +829,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
>>                  break;
>>          }
>>          case AMDGPU_GEM_OP_SET_PLACEMENT:
>> -               if (robj->prime_shared_count && (args->value & AMDGPU_GEM_DOMAIN_VRAM)) {
>> +               if (robj->tbo.base.import_attach &&
>> +                   args->value & AMDGPU_GEM_DOMAIN_VRAM) {
>>                          r = -EINVAL;
>>                          amdgpu_bo_unreserve(robj);
>>                          break;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index b7a2070d90af..d13490975ac3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -892,7 +892,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
>>                  return -EINVAL;
>>
>>          /* A shared bo cannot be migrated to VRAM */
>> -       if (bo->prime_shared_count || bo->tbo.base.import_attach) {
>> +       if (bo->tbo.base.import_attach) {
>>                  if (domain & AMDGPU_GEM_DOMAIN_GTT)
>>                          domain = AMDGPU_GEM_DOMAIN_GTT;
>>                  else
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> index 126df03a7066..c03dfd298f45 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> @@ -99,7 +99,6 @@ struct amdgpu_bo {
>>          struct ttm_buffer_object        tbo;
>>          struct ttm_bo_kmap_obj          kmap;
>>          u64                             flags;
>> -       unsigned                        prime_shared_count;
>>          /* per VM structure for page tables and with virtual addresses */
>>          struct amdgpu_vm_bo_base        *vm_bo;
>>          /* Constant after initialization */
>> --
>> 2.25.1
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

