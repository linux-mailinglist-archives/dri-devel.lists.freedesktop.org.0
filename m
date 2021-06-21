Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D973AECC4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBF46E201;
	Mon, 21 Jun 2021 15:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E116E1F5;
 Mon, 21 Jun 2021 15:49:40 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id s6so19580882edu.10;
 Mon, 21 Jun 2021 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l69wzpWpD3xFCsCLvgEOzx5xEbTW98k9SqCkGGVwX4E=;
 b=sGNsmFf7YJpHZUpK4nsoMQDudvK1PxSTBeWQAKWJ3uSwgHoD4CsanJHw9JcPnEbxwh
 GvkqVJjqTfiFI+Pa3DxhoNoMzeQeaWg0+fBeXmT+GI89v4vNb1iKWKzz8EIzfP/T3mSu
 zng/7DcWFz+BzaEt6rm+mPIQJrWbsCW4gPSc3mm7LXrUEkiQsCIq1M/PHSuZuP5c40Ly
 e8Rs4rk0RSas/eOXJMCpxKTvLKy1yK8yZfvE2McZyZKxV6TbTBAAh8jrlZ0ozfFj30PG
 X+/3bSBlTU9GONcIgNpYgBVZKGXenMAi2caMRbuWZHQ8BJxXtxfOvINpz6kuXPn7WLnM
 wiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l69wzpWpD3xFCsCLvgEOzx5xEbTW98k9SqCkGGVwX4E=;
 b=QiFe4rqKmrIWrqzF6T3rIjVwtwbGYPgaCm0VnJVTDE///djWV4bmXWJ5A5QwLj1DFl
 DGmkXPDs3h7GoK+W43JjSiEFwu63iw56XHiqsdufdicyC43zXfEcw5jh58sJueJQxfxS
 fXzZRiByPyr/GKFwZNiNQlTh2eRp/l/AHc8s3pa672o3dXvvawiMzkaoDLGt4Q9CHjMO
 OPesVG/ArQFFMmW6Qi65YQ+cPIbhuWVIhDnEvwQqcahPyktMQVhdrp4fkaIK/sRzf3z3
 gA4uaJ5s9GXHqdblnu7L878UZnBk9SPNoMGfwBtjPtDZrCq62//M+GEKkrkgE8yC6k9E
 aEBA==
X-Gm-Message-State: AOAM533BMYLPHOwvsLIul/LQbkbP9gGc85qXROgQBNHqm7WgO9z/Cxn1
 ZBM0MOjrkIL2bakUdXmzdbVkdNA6zsM=
X-Google-Smtp-Source: ABdhPJxGDQwE9Q4s51LvWebCQ/o2v7eyBlUYHatpJCDZWknokS7gDwU4wqKoCBnonI4qtEjTCnB6rQ==
X-Received: by 2002:a05:6402:28b5:: with SMTP id
 eg53mr13834613edb.110.1624290579094; 
 Mon, 21 Jun 2021 08:49:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:98e4:7a7c:4972:8db6?
 ([2a02:908:1252:fb60:98e4:7a7c:4972:8db6])
 by smtp.gmail.com with ESMTPSA id jl10sm694971ejc.56.2021.06.21.08.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 08:49:38 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/nouveau: wait for moving fence after pinning
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210621130328.11070-1-christian.koenig@amd.com>
 <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2033755d-c49f-8b90-f726-d640146a3df7@gmail.com>
Date: Mon, 21 Jun 2021 17:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.21 um 16:54 schrieb Daniel Vetter:
> On Mon, Jun 21, 2021 at 03:03:26PM +0200, Christian König wrote:
>> We actually need to wait for the moving fence after pinning
>> the BO to make sure that the pin is completed.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> CC: stable@kernel.org
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_prime.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
>> index 347488685f74..591738545eba 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
>> @@ -93,7 +93,13 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
>>   	if (ret)
>>   		return -EINVAL;
>>   
>> -	return 0;
>> +	if (nvbo->bo.moving) {
> Don't we need to hold the dma_resv to read this? We can grab a reference
> and then unlock, but I think just unlocked wait can go boom pretty easily
> (since we don't hold a reference or lock so someone else can jump in and
> free the moving fence).

The moving fence is only modified while the BO is moved and since we 
have just successfully pinned it....

But in general I agree that it would be better to avoid this. I just 
didn't wanted to open a bigger can of worms by changing nouveau so much.

Christian.

> -Daniel
>
>> +		ret = dma_fence_wait(nvbo->bo.moving, true);
>> +		if (ret)
>> +			nouveau_bo_unpin(nvbo);
>> +	}
>> +
>> +	return ret;
>>   }
>>   
>>   void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
>> -- 
>> 2.25.1
>>

