Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAE463052
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 10:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CD46E077;
	Tue, 30 Nov 2021 09:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC556E077
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:53:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c4so43036834wrd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 01:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9jAewgkfdkUy13oF0Vw+kQJGP1Q2pCXHsO2ZLYtP7M0=;
 b=phrPCoj0CiuURlG16h2qWABn6t52M7iGfACBC+ybHTOjBql2MSBknBAjHvDN3PmKnc
 IEtiNlRwD0yxwLgZnpTAUOWZjwtcu8LKZjXP2Je/gfFa7drRQD/fZlOYnHUHYoGPmDAU
 h8vp2+nFRoDX8ky7IrJ8vNNb1jLcf/993VsCyoUTBlMA8NhaHmnw1T1HdI2GnyE+7jNP
 FhbveaKknYaDOSVdckhS6jNDw3mnZYCRJ3GKXDms61xMb2Bnq9XYWAIdLhHplm9FN7n0
 U34U3g4QVZDJgmDyUvTz5Wozc0WWBBXDC+OBXS1RF9sJQYmGqylxhELMDpefyO/thuNC
 e3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9jAewgkfdkUy13oF0Vw+kQJGP1Q2pCXHsO2ZLYtP7M0=;
 b=inHifFGYlOq0IRZ4fYOD6DLCpbMxyB5L74w5f28xpaca9kc2UygVc3ex/hLFWd6Jo4
 YwCPktE73sELVvgvaHFEsBYVV1EjDDnTDxwb+3eUG7u9nEsweLTxpukOnaewuK6LFORE
 uhbH4BDOh9E2M619IpsAqUEAZuH0r+03iiaSQPkOPy5VyHgTwjZ0+2jWM+sSzp2GtS7y
 07FZyYDdX5DT5LuYghpMPPaFLH9kG5JxdE9UhTkZ9X2F7sFYWNmJ3roWBWkFm29ZLaZr
 SmeqQ2FyXZXkgkMv14RGZ9q0ibDfWUz9+/B7STUbM5uwXzme9wlj8wUjALwhiPcs/Hqm
 Thzw==
X-Gm-Message-State: AOAM531O6mqEr8UbLvPBAMkrD6SXOT3/SlcEyPov8MiksWg7JSdFF8Yp
 7DYi47zEGaXDDTugOTFIRLw=
X-Google-Smtp-Source: ABdhPJyb8GszFkk38gyLPHHKmnI8Lk+84enAQ/szYWXJsWstRgri0a5eUjGLB0DaZAfqd4Mz7Enjhg==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr39322072wrt.31.1638266014415; 
 Tue, 30 Nov 2021 01:53:34 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:fa20:e17b:e063:b6d3?
 ([2a02:908:1252:fb60:fa20:e17b:e063:b6d3])
 by smtp.gmail.com with ESMTPSA id n15sm1927871wmq.38.2021.11.30.01.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 01:53:33 -0800 (PST)
Subject: Re: [PATCH 02/28] drm/ttm: stop pruning fences after wait
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211129120659.1815-1-christian.koenig@amd.com>
 <20211129120659.1815-3-christian.koenig@amd.com>
 <YaXoj3fzu0cfhd6j@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cae36fd4-4d15-508a-e91c-62135ffd2f06@gmail.com>
Date: Tue, 30 Nov 2021 10:53:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaXoj3fzu0cfhd6j@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.21 um 10:02 schrieb Daniel Vetter:
> On Mon, Nov 29, 2021 at 01:06:33PM +0100, Christian König wrote:
>> This is just abusing internals of the dma_resv object.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Yeah I think if we want this back we could do a _locked version of the
> wait, which prunes internally.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Btw I wonder, should we put the ttm_bo_wait wrapper on the chopping block
> in gpu/todo.rst? It's really just complications I think in most cases. And
> it would be nice if ttm has the same errno semantics for these as everyone
> else, I always get very confused about this stuff ...

I've already done that quite a bit, e.g. removed most of the users.

What's left are the cases where we wait or test signaling inside of TTM 
and I think I can get rid of that with the LRU rework.

So yeah, already in the pipeline.

Regards,
Christian.

>
> Cheers, Daniel
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index e4a20a3a5d16..fc124457ba2f 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -1086,7 +1086,6 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>>   	if (timeout == 0)
>>   		return -EBUSY;
>>   
>> -	dma_resv_add_excl_fence(bo->base.resv, NULL);
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(ttm_bo_wait);
>> -- 
>> 2.25.1
>>

