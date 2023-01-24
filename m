Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D966794F8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8605610E651;
	Tue, 24 Jan 2023 10:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C2710E651;
 Tue, 24 Jan 2023 10:15:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id y1so8860649wru.2;
 Tue, 24 Jan 2023 02:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5r1s2cukRV959nm/ndFlFdM/5XDJnv3IKFrnfCe0KgI=;
 b=HS8lPG/pcE/OQiJABkBj28Oooq7uqLirwWNCUBCF0cs37plvSWLmrfwVRn2R6zJSq5
 KePexPR43KDmVwV91cbghCQYIUc8hRfocrY//9E2cf+cVTp9sk+T3PZWxD2GLWbauq+8
 2TCtiMPSERQK/CansmPA80InuBpNKIZl5SjsyBEm0GCCOJAxnKmhcBKeP8pCZBuPINL2
 KS6UqMH7iNXycr98x2wRnsUnIRFwVt2HBtWNl4awTK87MZuk2UP//SIVPlQVqvCsI4rQ
 JtugkQ9EnZNWyMnKnrp1PRUCLVgAPKV5yeMAOOQ/LsMe8DUfzgYT7j9H3eO3e/RAImxP
 18Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5r1s2cukRV959nm/ndFlFdM/5XDJnv3IKFrnfCe0KgI=;
 b=YfzZx8pgp2nE2MPNaVbfbslTQsMlYaKgG+M1blWRbo6dXvPmWveEmAqLBUc7g8CBsQ
 e+X+5fGsoJHr3ySrtLoqH4NFQplMgPBxYsMDqubxLG6P+vLmyijcdf9asnyNbYVPNYGM
 hy9rfOBYPlWtFgTx7eLZyVEHDCpozu/WvvdZlrAiQJx5NpnTJVz1BG8kEBT8Ln+zI6Ye
 kUZKYiWqBQHPbftBPI2suTkqfGbcR9CQhiNnMFSOsaWmOiTYFlIb7vawLKFFXXsWKjmC
 pail13LPU8FrFfDykoRbAuPWw4iwofWjIml4XF2I5lQ6BjV4nmlJ/qUaafTbYiYoawV9
 ZW8A==
X-Gm-Message-State: AO0yUKU2RG4HpHXitVt6W6adJ38252HbsAgXGx8yiwHCGMILiHq1efUs
 yxuT5Y4x5lx1zDZd49kdF/5ATS3wYEU=
X-Google-Smtp-Source: AK7set/27ecpg1m4uZ+vof18EulsjP67hPhJGFKbAzmkINAJ5JF0Dsy6BRgROH8Msa/ucPyBs5faUw==
X-Received: by 2002:a5d:5a92:0:b0:2bf:abce:ba26 with SMTP id
 bp18-20020a5d5a92000000b002bfabceba26mr3498531wrb.71.1674555339204; 
 Tue, 24 Jan 2023 02:15:39 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 t20-20020adfa2d4000000b002bdcce37d31sm1787251wra.99.2023.01.24.02.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 02:15:38 -0800 (PST)
Message-ID: <5ae60a55-3b40-19a3-1c29-acb90a163734@gmail.com>
Date: Tue, 24 Jan 2023 11:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/ttm: prevent moving of pinned BOs
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230111114256.72669-1-christian.koenig@amd.com>
 <CAM0jSHP7bRn05sWrwHriLeaQifNuqO77UPFsWg0MrW5dCeZphQ@mail.gmail.com>
 <f25004e8-ec4e-d9d7-3b8c-6115cf6692a1@gmail.com>
 <CAM0jSHPth9eXy7tXr3F798xzxsfhq1zBvyr2WUvq0Zjt=9CejA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHPth9eXy7tXr3F798xzxsfhq1zBvyr2WUvq0Zjt=9CejA@mail.gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.01.23 um 11:12 schrieb Matthew Auld:
> On Tue, 24 Jan 2023 at 09:51, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 11.01.23 um 14:17 schrieb Matthew Auld:
>>> On Wed, 11 Jan 2023 at 11:43, Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> We have checks for this in the individual drivers move callback, but
>>>> it's probably better to generally forbit that on a higher level.
>>>>
>>>> Also stops exporting ttm_resource_compat() since that's not necessary
>>>> any more after removing the extra checks in vmwgfx.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 ----
>>>>    drivers/gpu/drm/nouveau/nouveau_bo.c    |  3 ---
>>>>    drivers/gpu/drm/radeon/radeon_ttm.c     |  4 ----
>>>>    drivers/gpu/drm/ttm/ttm_bo.c            | 20 ++++++++++++--------
>>>>    drivers/gpu/drm/ttm/ttm_resource.c      |  1 -
>>>>    drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 19 ++-----------------
>>>>    6 files changed, 14 insertions(+), 37 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> index 068c2d8495fd..677cd7d91687 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> @@ -466,11 +466,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>>>>                           return r;
>>>>           }
>>>>
>>>> -       /* Can't move a pinned BO */
>>>>           abo = ttm_to_amdgpu_bo(bo);
>>>> -       if (WARN_ON_ONCE(abo->tbo.pin_count > 0))
>>>> -               return -EINVAL;
>>>> -
>>>>           adev = amdgpu_ttm_adev(bo->bdev);
>>>>
>>>>           if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> index 288eebc70a67..c2ec91cc845d 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> @@ -1015,9 +1015,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>>>>           if (ret)
>>>>                   goto out_ntfy;
>>>>
>>>> -       if (nvbo->bo.pin_count)
>>>> -               NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
>>>> -
>>>>           if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
>>>>                   ret = nouveau_bo_vm_bind(bo, new_reg, &new_tile);
>>>>                   if (ret)
>>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>> index 1e8e287e113c..67075c85f847 100644
>>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>> @@ -211,11 +211,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>>>>           if (r)
>>>>                   return r;
>>>>
>>>> -       /* Can't move a pinned BO */
>>>>           rbo = container_of(bo, struct radeon_bo, tbo);
>>>> -       if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
>>>> -               return -EINVAL;
>>>> -
>>>>           rdev = radeon_get_rdev(bo->bdev);
>>>>           if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
>>>>                   ttm_bo_move_null(bo, new_mem);
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 326a3d13a829..9baccb2f6e99 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -894,14 +894,18 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>>>>           if (!placement->num_placement && !placement->num_busy_placement)
>>>>                   return ttm_bo_pipeline_gutting(bo);
>>>>
>>>> -       /*
>>>> -        * Check whether we need to move buffer.
>>>> -        */
>>>> -       if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) {
>>>> -               ret = ttm_bo_move_buffer(bo, placement, ctx);
>>>> -               if (ret)
>>>> -                       return ret;
>>>> -       }
>>>> +       /* Check whether we need to move buffer. */
>>>> +       if (bo->resource && ttm_resource_compat(bo->resource, placement))
>>>> +               return 0;
>>> Note this now skips the tt create below (intentional?). I think i915
>>> needed that, since it creates a dummy system resource initially for
>>> all objects, and then relies on ZERO_ALLOC being set for certain
>>> objects to know if the memory needs to be cleared or not when later
>>> doing the dummy -> vram. Thoughts?
>> That's unproblematic. On initial allocation bo->resource is NULL so we
>> never branch out here.
> Here is what I see in drm-tip, when first creating an object with ttm:
>
> ttm_bo_init_reserved() -> ttm_resource_alloc(PL_SYSTEM, &bo->resource)
> -> ttm_bo_validate()
>
> So bo->resource is for sure not NULL on initial allocation, and is
> pointing to PL_SYSTEM. And in i915 we initially stuff everything into
> SYSTEM as a dummy placement.
>
> IIRC you had a series that tried to address that (allowing NULL
> resource or so), but it never landed:
> https://patchwork.freedesktop.org/patch/500698/?series=107680&rev=2

Oh! My recollection was that this was done!

Sorry my memory failed me here, thanks for the notice.

Christian.

>
>> Christian.
>>
>>>> +
>>>> +       /* Moving of pinned BOs is forbidden */
>>>> +       if (bo->pin_count)
>>>> +               return -EINVAL;
>>>> +
>>>> +       ret = ttm_bo_move_buffer(bo, placement, ctx);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>>           /*
>>>>            * We might need to add a TTM.
>>>>            */
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> index b8a826a24fb2..7333f7a87a2f 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> @@ -361,7 +361,6 @@ bool ttm_resource_compat(struct ttm_resource *res,
>>>>
>>>>           return false;
>>>>    }
>>>> -EXPORT_SYMBOL(ttm_resource_compat);
>>>>
>>>>    void ttm_resource_set_bo(struct ttm_resource *res,
>>>>                            struct ttm_buffer_object *bo)
>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>>>> index 321c551784a1..dbcef460c452 100644
>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>>>> @@ -87,12 +87,7 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
>>>>           if (unlikely(ret != 0))
>>>>                   goto err;
>>>>
>>>> -       if (buf->base.pin_count > 0)
>>>> -               ret = ttm_resource_compat(bo->resource, placement)
>>>> -                       ? 0 : -EINVAL;
>>>> -       else
>>>> -               ret = ttm_bo_validate(bo, placement, &ctx);
>>>> -
>>>> +       ret = ttm_bo_validate(bo, placement, &ctx);
>>>>           if (!ret)
>>>>                   vmw_bo_pin_reserved(buf, true);
>>>>
>>>> @@ -128,12 +123,6 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
>>>>           if (unlikely(ret != 0))
>>>>                   goto err;
>>>>
>>>> -       if (buf->base.pin_count > 0) {
>>>> -               ret = ttm_resource_compat(bo->resource, &vmw_vram_gmr_placement)
>>>> -                       ? 0 : -EINVAL;
>>>> -               goto out_unreserve;
>>>> -       }
>>>> -
>>>>           ret = ttm_bo_validate(bo, &vmw_vram_gmr_placement, &ctx);
>>>>           if (likely(ret == 0) || ret == -ERESTARTSYS)
>>>>                   goto out_unreserve;
>>>> @@ -218,11 +207,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
>>>>                   (void) ttm_bo_validate(bo, &vmw_sys_placement, &ctx);
>>>>           }
>>>>
>>>> -       if (buf->base.pin_count > 0)
>>>> -               ret = ttm_resource_compat(bo->resource, &placement)
>>>> -                       ? 0 : -EINVAL;
>>>> -       else
>>>> -               ret = ttm_bo_validate(bo, &placement, &ctx);
>>>> +       ret = ttm_bo_validate(bo, &placement, &ctx);
>>>>
>>>>           /* For some reason we didn't end up at the start of vram */
>>>>           WARN_ON(ret == 0 && bo->resource->start != 0);
>>>> --
>>>> 2.34.1
>>>>

