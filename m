Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38295980E3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 11:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16ECC84B2;
	Thu, 18 Aug 2022 09:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41769C83EE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 09:35:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id dc19so2148820ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=MrC/wuHL4aFTHNUlAFkGoLZVI/bCEKIi9j/z5YB3GHc=;
 b=KKPEIGyn4MgYHTZkG2jQWvdIDm0oWBXr+AGndEXkZH5j7suLIxZ1PPVMWYfUricvbZ
 j1meZQMB0bPNb5Ly5bM8EZeNWCnbcaNneyYid/Ow2UPByH0CSMFkSImeVMHfuHPwWdyX
 VvZcMI6As95GP3ZZ9STEL9Oij7vAwAVsDgmPCy1+uq5Y6YT4mzgqeHfjBtQlCvohcDxU
 f57hRZcpC2x80XhxLVVzZ92D7c1oIapiwKWIIWlo1IjGUNBmuxsP/pHmIdoc/yxrW5eZ
 pom1JSHuKyDb6ORP1HphBUkoVn3WJ+rN/7i5+JRv7X56xws7FyIZwrIlqT+ynRbqZudx
 HAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=MrC/wuHL4aFTHNUlAFkGoLZVI/bCEKIi9j/z5YB3GHc=;
 b=2+wPSbbE1rkZ0c2ervzNjli88CiWOCrCOe0qRxgxFZGhMYbI8mv0CxnWqFCyRuHCBe
 iv0phZJ3MTX3QdtgUbCjExP71dK1QAUxQU8PLORqMaiQWnwi2dHhZnpqaVecCpnLO9q6
 ol3Rpr+4PVzoF7KPoLRjJnpPFOwyGXKseOqQtUZ9rFeACa+ocbZnxV/6W/J1k/x+QjR/
 MwpjUMFLKweF7W37krLVS6j+WgX8JDcrd3rSIhcHp7DPDwRbBhoEExFR8TRDmOETPf0C
 Q38AU3Rrua5AOa2R56C8SruG0x5V3qJ2tJP5UgUgXj2E4Z2CXXDsJtf95qoQvE5mbaw2
 EaHg==
X-Gm-Message-State: ACgBeo05HWkDeNvykTYpbvqEt9gRWnoPfJcZC9WRGKoShwK6EuFqBAfs
 vuuJbKBw4DF+3/dGjkoyvdk=
X-Google-Smtp-Source: AA6agR7r1GxVcz9PsvrN5m0c8BrgQ+oX7C7djVgHywMdxPfGNss3NLp3M6Y3dvACYTaXzrzWqA5meQ==
X-Received: by 2002:a17:907:2c78:b0:730:e952:4104 with SMTP id
 ib24-20020a1709072c7800b00730e9524104mr1354729ejc.33.1660815304714; 
 Thu, 18 Aug 2022 02:35:04 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 mh8-20020a170906eb8800b0073a96816eb0sm561106ejb.222.2022.08.18.02.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 02:35:04 -0700 (PDT)
Message-ID: <d25c230b-c42b-166d-ff05-ea3bc9b3302f@gmail.com>
Date: Thu, 18 Aug 2022 11:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: prevent grabbing page references
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20220815130848.33492-1-christian.koenig@amd.com>
 <e9be29c0-e740-3f3b-db64-ead0baa866f3@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <e9be29c0-e740-3f3b-db64-ead0baa866f3@collabora.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.08.22 um 00:20 schrieb Dmitry Osipenko:
> On 8/15/22 16:08, Christian König wrote:
>> TTM owns the pages it uses for backing buffer objects with system
>> memory. Because of this it is absolutely illegal to mess around with
>> the reference count of those pages.
>>
>> So make sure that nobody ever tries to grab an extra reference on
>> pages allocated through the page pool.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 1bba0a0ed3f9..cbca84dbd83f 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -93,8 +93,17 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>   
>>   	if (!pool->use_dma_alloc) {
>>   		p = alloc_pages(gfp_flags, order);
>> -		if (p)
>> +		if (p) {
>>   			p->private = order;
>> +
>> +			/* The pages are fully owned by TTM and because of this
>> +			 * it's illegal to grab extra references to it or
>> +			 * otherwise we corrupt TTMs internal state. Make sure
>> +			 * nobody tries to ever increase the reference count of
>> +			 * those pages.
>> +			 */
>> +			set_page_count(p, 0);
>> +		}
>>   		return p;
>>   	}
>>   
>> @@ -144,6 +153,9 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>>   #endif
>>   
>>   	if (!pool || !pool->use_dma_alloc) {
>> +		/* See alloc why references to TTMs pages are illegal */
>> +		WARN_ON(page_count(p));
>> +		set_page_count(p, 1);
>>   		__free_pages(p, order);
>>   		return;
>>   	}
> Could you please explain why you're skipping the DMA pages?

Lack of sleep :)

Going to fix that, thanks.
Christian.

>

