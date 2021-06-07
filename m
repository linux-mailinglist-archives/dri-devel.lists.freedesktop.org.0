Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF1139DCFF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 14:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF2C6E8AF;
	Mon,  7 Jun 2021 12:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536206E8B2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 12:52:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so5818819wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 05:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=81LglR1wvRINhpWx97PX/7kSNB0U5UO9zcVH1fHxUi0=;
 b=gWPNwzzTsDkHi0ykVqgFjcgBJ9xkOn/n609ZGvAFmV1wEImNfNoe/FhNNtSFjtToqV
 AUnM6ZKlotq6joIJQ/Yictj/g38D6egsUTRrkIgwZqGfG5PGdECL+W7uFOss+5pLUmmA
 G81bqqmY8tPbcRM25Gy5gMoskssVszbsk3Sj6UkgbYlZV5xpBGFnUNnyMG2oYkfoScPF
 0YThlHHc+68fvNg5/SBLEYzPfkCyYCr6FuFMzR1llqtzYEEidRHriID8wMl6OLqpkRu/
 mb5pNgnmtW3lQW0ptEn1EMbRPlR4KJBuT7bgho5j9TaXx5xOoKSrUL6RgI8rA55JevT9
 GBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=81LglR1wvRINhpWx97PX/7kSNB0U5UO9zcVH1fHxUi0=;
 b=lQOL81Hk/cRl4qZhDBtIVKmyJAJlGByoWPZqTfhLTJk1U4N7/VGmGN2+fZXrS43AiE
 KvciP7sXWsc+KsogUa2EWK+V5RMK9aZ3XvtiIdZMJ3/sIoThOOqhwkXUf0KEt7o0rMA9
 NDgdKrqlvUh/HDEHH6IQByNgam7Pc1IVh9+SGQZju+oElJ4Qh3bM4q5BMj1FdEd6PKGB
 qSxcgU8UyMEKlc8VVeDl5C6kVIjMkAx1BJuWHknU3AAJekYZJd4BhfdA+7ABdQXZ4CrY
 7jSkDuTQtVHfpYtiSXwAo2m8fxq06Eh21b/tT6i1TkyGfzFb6fvILHQObxc0QUG7HVVv
 nNBA==
X-Gm-Message-State: AOAM5313DQMEjc7l+wPd0JV79IwIdVlSsx772TG5eBqrWIwKoMbNNkCb
 gXXk124Qbch/lOINS1d0MOCKDlptUQA=
X-Google-Smtp-Source: ABdhPJxmjsm2VFLUdq+1gbp5WtagQvHEoK4uky/alyMY124t3+ooObcLPHR8gQOK1RQBriGmSKzeoA==
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr17086773wmn.132.1623070343131; 
 Mon, 07 Jun 2021 05:52:23 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id j12sm7685417wrt.69.2021.06.07.05.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 05:52:22 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix deref of bo->ttm without holding the lock v2
To: dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Nirmoy Das <nirmoy.das@amd.com>, Huang Rui <ray.huang@amd.com>
References: <20210528130041.1683-1-christian.koenig@amd.com>
 <aa17b7d5-1c44-4d2b-431f-5f361481f039@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <279b72f6-cf27-c1bb-370e-a04348387105@gmail.com>
Date: Mon, 7 Jun 2021 14:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <aa17b7d5-1c44-4d2b-431f-5f361481f039@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 28.05.21 um 15:06 schrieb Thomas Hellström:
>
> On 5/28/21 3:00 PM, Christian König wrote:
>> We need to grab the resv lock first before doing that check.
>>
>> v2 (chk): simplify the change for -fixes
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Hmm, OK, but this doesn't fix the swapped-bo-not-on-lru and 
> unpopulating from swap_notify issues. Are you planning a follow up 
> patch for those?

As discussed in a separate thread this needs to be applied as needed 
when the DG1 branch is merged.

Xinhui, Nirmoy, Rui can anybody give be an rb/ab so that I can push this?

Thanks,
Christian.

>
> Thanks,
>
> Thomas
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c     | 5 ++++-
>>   drivers/gpu/drm/ttm/ttm_device.c | 8 +-------
>>   2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index cfd0b9292397..ebcffe794adb 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -1172,7 +1172,10 @@ int ttm_bo_swapout(struct ttm_buffer_object 
>> *bo, struct ttm_operation_ctx *ctx,
>>       if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NULL))
>>           return -EBUSY;
>>   -    if (!ttm_bo_get_unless_zero(bo)) {
>> +    if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
>> +        bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>> +        bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED ||
>> +        !ttm_bo_get_unless_zero(bo)) {
>>           if (locked)
>>               dma_resv_unlock(bo->base.resv);
>>           return -EBUSY;
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index a1dcf7d55c90..3d9c62b93e29 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -143,14 +143,8 @@ int ttm_device_swapout(struct ttm_device *bdev, 
>> struct ttm_operation_ctx *ctx,
>>             for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>               list_for_each_entry(bo, &man->lru[j], lru) {
>> -                uint32_t num_pages;
>> +                uint32_t num_pages = PFN_UP(bo->base.size);
>>   -                if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
>> -                    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>> -                    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
>> -                    continue;
>> -
>> -                num_pages = bo->ttm->num_pages;
>>                   ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>>                   /* ttm_bo_swapout has dropped the lru_lock */
>>                   if (!ret)

