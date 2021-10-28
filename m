Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD543DFA3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 13:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51F56E94E;
	Thu, 28 Oct 2021 11:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70E56E949;
 Thu, 28 Oct 2021 11:01:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso8964926wmd.3; 
 Thu, 28 Oct 2021 04:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=T4dqJuLHxxFewJ+a8mY0Zq5rbrNHTXplJNcmLLfs/+o=;
 b=QBn/uXBcSIZdENGPDYd7lm3DhNqd0XR831ozf8dLVrsDYvL4eOpZAWc+pb658HmJPB
 BFK6nweUvSvue9oU+p45tZTucpqhbM+nJBj4lUFD0DrZFobHAqtEaLR5WiloYY2eW3GR
 uNvB4ePHV4cnZUJgBckwFm9NldvjRxYGPWGNcim0DmbtItIppRZMWaq9Kvtf36jblHnS
 4rOCVKxYqEgDvGGzD0U/KKnLjrWEC3MZQJp8+q1GZR/lnmrUtInaSXNasFcLFIdUONLN
 J/mLZ80I8VvM5S7GJXHcqghx77saMZxVTRWp4NGq1/PCMm0bqDETbQWtBNbiAluvZAFH
 krQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=T4dqJuLHxxFewJ+a8mY0Zq5rbrNHTXplJNcmLLfs/+o=;
 b=4APL6UJLi9DXjX7/PeHykvZHqM3RWW4RWmY7kFhpr5zR5zsC+4u5lFGo7rdad5BiXK
 OTbvzUdEC+YTAh1YCM+plsN+Deos+/a+eVaTQepT7Njh5J733iTX5xB1cTU2JMLYataD
 PUGypx7s2vY5Emy+TvStkqv5/4Qfo2wlyPoLrcgV6RgMEjiELnyZ64yGO4PvnPBSp7W+
 99NIbaiXC93cL0jR9eEaUgaq6SGm5NDMmW/Wa4ej7uGMTYxvRxZGxwEOAHdICf5g9wmv
 jn2nClELKoRy5OI9HzhjMGiUiTWOQgbPbM/Oc8X6ZiZDvZF4OJB0XnpYOGSl4zXcwI82
 UcmQ==
X-Gm-Message-State: AOAM530152c8aahodZdLdnzGj4EjlZKa9dCuRGHjOXBGLP3kGte9kVpe
 My4ZR9QYrfKrFB5vKg7DEer397D5DYo=
X-Google-Smtp-Source: ABdhPJwldqvLWuTmElVUb3JyRMfDs25Zp6ehL1pEsrpmrorZyv83agH/KI3c7Xcv23ruavcGPx+zrg==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr3658412wmf.161.1635418864306; 
 Thu, 28 Oct 2021 04:01:04 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id r11sm2638868wro.93.2021.10.28.04.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 04:01:03 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/etnaviv: use new iterator in etnaviv_gem_describe
To: Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211025080532.177424-1-christian.koenig@amd.com>
 <20211025080532.177424-2-christian.koenig@amd.com>
 <89caea022a590a249b28744c155c17809dcb96d8.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8cc3640b-ed52-a133-6cab-3626b0bbd10b@gmail.com>
Date: Thu, 28 Oct 2021 13:01:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <89caea022a590a249b28744c155c17809dcb96d8.camel@pengutronix.de>
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



Am 28.10.21 um 12:02 schrieb Lucas Stach:
> Am Montag, dem 25.10.2021 um 10:05 +0200 schrieb Christian König:
>> Instead of hand rolling the logic.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 31 ++++++++++-----------------
>>   1 file changed, 11 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> index 8f1b5af47dd6..0eeb33de2ff4 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -428,19 +428,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
>>   static void etnaviv_gem_describe_fence(struct dma_fence *fence,
>>   	const char *type, struct seq_file *m)
>>   {
>> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> -		seq_printf(m, "\t%9s: %s %s seq %llu\n",
>> -			   type,
>> -			   fence->ops->get_driver_name(fence),
>> -			   fence->ops->get_timeline_name(fence),
>> -			   fence->seqno);
>> +	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
>> +		   fence->ops->get_driver_name(fence),
>> +		   fence->ops->get_timeline_name(fence),
>> +		   fence->seqno);
> Please just move this in the function below, it seems pretty pointless
> now to have a separate function just to wrap the printf.

Good point, but I've already gone ahead and pushed this to drm-misc-next 
because I wanted to get the follow up stuff out of the door.

See the mailing lists for the next set of patches which also contains 
"[PATCH 3/4] drm/etnaviv: use dma_resv_describe".

That one provides an unified function in the dma_resv and dma_fence code 
for debugfs dumps of fences.

Can we get that one reviewed and upstream? I think it would be even 
cleaner :)

Thank a lot in advantage,
Christian.

>
> Other than this nit, both patches are:
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
>
>>   }
>>   
>>   static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>>   {
>>   	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>>   	struct dma_resv *robj = obj->resv;
>> -	struct dma_resv_list *fobj;
>> +	struct dma_resv_iter cursor;
>>   	struct dma_fence *fence;
>>   	unsigned long off = drm_vma_node_start(&obj->vma_node);
>>   
>> @@ -449,21 +447,14 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>>   			obj->name, kref_read(&obj->refcount),
>>   			off, etnaviv_obj->vaddr, obj->size);
>>   
>> -	rcu_read_lock();
>> -	fobj = dma_resv_shared_list(robj);
>> -	if (fobj) {
>> -		unsigned int i, shared_count = fobj->shared_count;
>> -
>> -		for (i = 0; i < shared_count; i++) {
>> -			fence = rcu_dereference(fobj->shared[i]);
>> +	dma_resv_iter_begin(&cursor, robj, true);
>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +		if (dma_resv_iter_is_exclusive(&cursor))
>> +			etnaviv_gem_describe_fence(fence, "Exclusive", m);
>> +		else
>>   			etnaviv_gem_describe_fence(fence, "Shared", m);
>> -		}
>>   	}
>> -
>> -	fence = dma_resv_excl_fence(robj);
>> -	if (fence)
>> -		etnaviv_gem_describe_fence(fence, "Exclusive", m);
>> -	rcu_read_unlock();
>> +	dma_resv_iter_end(&cursor);
>>   }
>>   
>>   void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
>

