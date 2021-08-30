Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706BD3FBA65
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 18:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B19989CAC;
	Mon, 30 Aug 2021 16:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E7E89CAC;
 Mon, 30 Aug 2021 16:51:13 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id g18so15855485wrc.11;
 Mon, 30 Aug 2021 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=gf70W02tYmrUZh4IgFEsxTVilFSZlkLKQPCLlQa9Glc=;
 b=VjxVAuPmKFCSnyXq7EFfkJo43GiH+J1rse9rDrOqFpUhkelGcpc9cAaQjNPuBVi+CS
 UN9F42BwopaMLf63OpBmGpW41Gi/zBl5GuATwTJcc5JgagrZ2XUpJ6CMDxW/CsoqQ2np
 8ZfKjAwz4LvTIw2/pjLJ8hqTO3FGzStxbxKkbm3L4SA7RAQxtyTtsPVRNTteHQ1XsRkm
 jpFq03PkYhl4GrGIHQhcdruPUebvg6YIjUtSjwegypkhnXZxIDs3DljBuLCXnV2SuLHt
 6sI2uIoa/Hn4O1H+/Ljyi+h/xEEEYSsflWpcIFmkUjEINSEAeC6ZsxEtv1VFLFb85DMn
 uPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gf70W02tYmrUZh4IgFEsxTVilFSZlkLKQPCLlQa9Glc=;
 b=rfgsTarYPnUdiKbBIxsL3VTGmdRrPXXyzKK9P8npQHvs0XAZrhxh1BaH6ycOCNjjfe
 5OeQ6T+9WNnFZTxR4O90nxqhyE8aMCV6P5fxQ29tZ6/0wZpbJMbF6s3CaY6/gHEq2wFB
 oNeatZaD56dT0R2D4+vHTDHOAP+Tit8sgpYXcS3wTyl1w0CQi6oFmmgUzHL01m4NMV6w
 c5kNWW+0HX8TiBNwesw6XlnLAChr7mpQ1OstdU/uznvgLO8pngb/6zHSXLwsu9rcTZsV
 80CEOP9oLv2mu7dMzC+nb++ZypOkhTnS9U7hH0EQZWCFCfrGrL2TY8lqNGQXjHMqGsfw
 q8vw==
X-Gm-Message-State: AOAM531sb93gD9kxDO4k2320UenWdgyvf/4vc2ww1FGKJw56ilL9pXUI
 JvC4VCtmAGhlc9mSYEWSoZYfrRzl7z4=
X-Google-Smtp-Source: ABdhPJyg3ayrf1ne3jGX3caBFGU53fqVn6CSZtCSYgDovh2QA4cw5lM8ciQflrvq9EAc5R9GuvCriw==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr14748722wrc.158.1630342271953; 
 Mon, 30 Aug 2021 09:51:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1cdb:22e7:b4cc:b339?
 ([2a02:908:1252:fb60:1cdb:22e7:b4cc:b339])
 by smtp.gmail.com with ESMTPSA id z6sm65654wmp.1.2021.08.30.09.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 09:51:11 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] drm/ttm: Create pinned list
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
 <20210827203910.5565-2-andrey.grodzovsky@amd.com>
 <a13d095d-1b0f-a31c-1479-1275c2e93877@amd.com>
 <e716dd6d-a338-86ae-9100-0e869f12732c@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e70b7078-eea6-c798-0c67-0e59ec68d75f@gmail.com>
Date: Mon, 30 Aug 2021 18:51:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e716dd6d-a338-86ae-9100-0e869f12732c@amd.com>
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

Am 30.08.21 um 16:16 schrieb Andrey Grodzovsky:
>
> On 2021-08-30 4:58 a.m., Christian König wrote:
>> Am 27.08.21 um 22:39 schrieb Andrey Grodzovsky:
>>> This list will be used to capture all non VRAM BOs not
>>> on LRU so when device is hot unplugged we can iterate
>>> the list and unmap DMA mappings before device is removed.
>>>
>>> v2: Reanme function to ttm_bo_move_to_pinned
>>> v3: Move the pinned list to ttm device
>>
>> As far as I can see there is not list_del() remaining. So this won't 
>> work correctly.
>
>
> It's in ttm_bo_release, there was no code change there hence it's not 
> captured in the patch.

Ah! So you keep the logic as is there. Sorry totally missed that.

In this case the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

Can you push this to drm-misc-next?

Thanks,
Christian.

>
> Andrey
>
>
>>
>> I suggest to rather rebase on top of the stuff I'm working on for a 
>> while to move the LRU into the resource instead.
>>
>> Just send out the latest patch set of this with you in CC.
>>
>> Christian.
>>
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo.c     | 18 ++++++++++++++----
>>>   drivers/gpu/drm/ttm/ttm_device.c |  1 +
>>>   include/drm/ttm/ttm_device.h     |  1 +
>>>   3 files changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 1b950b45cf4b..1fedd0eb67ba 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -69,7 +69,17 @@ static void ttm_bo_mem_space_debug(struct 
>>> ttm_buffer_object *bo,
>>>       }
>>>   }
>>>   -static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>>> +static inline void ttm_bo_move_to_pinned(struct ttm_buffer_object *bo)
>>> +{
>>> +    struct ttm_device *bdev = bo->bdev;
>>> +
>>> +    list_move_tail(&bo->lru, &bdev->pinned);
>>> +
>>> +    if (bdev->funcs->del_from_lru_notify)
>>> +        bdev->funcs->del_from_lru_notify(bo);
>>> +}
>>> +
>>> +static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>>>   {
>>>       struct ttm_device *bdev = bo->bdev;
>>>   @@ -98,7 +108,7 @@ void ttm_bo_move_to_lru_tail(struct 
>>> ttm_buffer_object *bo,
>>>           dma_resv_assert_held(bo->base.resv);
>>>         if (bo->pin_count) {
>>> -        ttm_bo_del_from_lru(bo);
>>> +        ttm_bo_move_to_pinned(bo);
>>>           return;
>>>       }
>>>   @@ -339,7 +349,7 @@ static int ttm_bo_cleanup_refs(struct 
>>> ttm_buffer_object *bo,
>>>           return ret;
>>>       }
>>>   -    ttm_bo_del_from_lru(bo);
>>> +    ttm_bo_move_to_pinned(bo);
>>>       list_del_init(&bo->ddestroy);
>>>       spin_unlock(&bo->bdev->lru_lock);
>>>       ttm_bo_cleanup_memtype_use(bo);
>>> @@ -1154,7 +1164,7 @@ int ttm_bo_swapout(struct ttm_buffer_object 
>>> *bo, struct ttm_operation_ctx *ctx,
>>>           return 0;
>>>       }
>>>   -    ttm_bo_del_from_lru(bo);
>>> +    ttm_bo_move_to_pinned(bo);
>>>       /* TODO: Cleanup the locking */
>>>       spin_unlock(&bo->bdev->lru_lock);
>>>   diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>> index 5f31acec3ad7..530a9c36be37 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -208,6 +208,7 @@ int ttm_device_init(struct ttm_device *bdev, 
>>> struct ttm_device_funcs *funcs,
>>>       INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
>>>       spin_lock_init(&bdev->lru_lock);
>>>       INIT_LIST_HEAD(&bdev->ddestroy);
>>> +    INIT_LIST_HEAD(&bdev->pinned);
>>>       bdev->dev_mapping = mapping;
>>>       mutex_lock(&ttm_global_mutex);
>>>       list_add_tail(&bdev->device_list, &glob->device_list);
>>> diff --git a/include/drm/ttm/ttm_device.h 
>>> b/include/drm/ttm/ttm_device.h
>>> index cd592f8e941b..03fb44d061e0 100644
>>> --- a/include/drm/ttm/ttm_device.h
>>> +++ b/include/drm/ttm/ttm_device.h
>>> @@ -265,6 +265,7 @@ struct ttm_device {
>>>        */
>>>       spinlock_t lru_lock;
>>>       struct list_head ddestroy;
>>> +    struct list_head pinned;
>>>         /*
>>>        * Protected by load / firstopen / lastclose /unload sync.
>>

