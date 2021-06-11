Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD33A4466
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 16:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E72A6E591;
	Fri, 11 Jun 2021 14:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0AA6E591;
 Fri, 11 Jun 2021 14:53:13 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso8827595wmg.2; 
 Fri, 11 Jun 2021 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PYz47Kpk149OD6JCGUi0G8oIJKajH8KhLCc+6vQzb9o=;
 b=kfqV8U1ZVFqdFBPC5nPEHpP5exRrjbG++Pc6/DJiTgJv8Jf8aMm6/ogvlZz+6ISSRl
 W5Xg5G/g4hSCd1Ii1pyJ00c/Lxojrqj0hXSHCHKcQ8hsmQbOAOhbass1voKrN+Oj1kvj
 DxbT/7UXRQckP6bZ45BI9csD9tGJmgRcMYZQ0Lyn8//5TJ0eS/jKpfE6DsBMcyQLAgd8
 XpVt/9ckuyV9IE6RbCbU6H2l7BhDp4k6yOyZNnLRgvGcxzo8i9VePJUceDfF8l+pdPeC
 iqj04qM1YQTWVfDuXXcSOeraHvH0TkemXNeIwhHbv8jwMS1vDM3R75TazfD5j0i2cj73
 4CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PYz47Kpk149OD6JCGUi0G8oIJKajH8KhLCc+6vQzb9o=;
 b=pmoqT65oZPb0+sER/LjBq3HvbAAK4JY+IaHRkE7uUhuZIezWhtzY3u/IKoNJPDmc8/
 QgtxbrQwDNuKJ3KF+J9NcMHEg7ZwrabaKA7M5ZAAgAuX468LQCaiiiqmfhFZb3XD3Ync
 m2wGSFoKHkxwTqKE/Phku6LH+LUVnZJZwM4Bi5UUqJhrX98OWq1DBcS2/WCbYZ6yh2ra
 dwaBs3TuOSiERRiaLHF03/2zb5qHopBErtEs4XmRd5uggkhQg+tM8bdrnN+Od6ru5yFw
 w6LKrE+BeXBaMhCW32POY4Bi/pVd9yUpe5vYfImpIhuz2XMnVDhZtKeOSlcXb3XOvLMq
 MIIQ==
X-Gm-Message-State: AOAM531SXxmC8ro1HtYe6bjfXYjsuz8v1n24OjhkqexfXR3Ei20i9Rcl
 6WXDQkk2/sv0ikwygDQkNbZabW2xC8k=
X-Google-Smtp-Source: ABdhPJyLqPaSTOBW9sPKneXzFaTZN9ctm+MQseLZz1Z1Skmq3itR2ESTRRI3QstDqI2Uw8oDpV7QVw==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr4343817wmq.123.1623423192219; 
 Fri, 11 Jun 2021 07:53:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1?
 ([2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1])
 by smtp.gmail.com with ESMTPSA id n9sm6356665wmc.20.2021.06.11.07.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 07:53:11 -0700 (PDT)
Subject: Re: [PATCH 1/5] dma-buf: fix dma_resv_test_signaled test_all handling
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210611120301.10595-1-christian.koenig@amd.com>
 <YMN3nr1mTj09p8lT@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2c91e4b4-e8c8-a9f5-420f-9cf0c1f9a67d@gmail.com>
Date: Fri, 11 Jun 2021 16:53:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMN3nr1mTj09p8lT@phenom.ffwll.local>
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



Am 11.06.21 um 16:47 schrieb Daniel Vetter:
> On Fri, Jun 11, 2021 at 02:02:57PM +0200, Christian König wrote:
>> As the name implies if testing all fences is requested we
>> should indeed test all fences and not skip the exclusive
>> one because we see shared ones.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Hm I thought we've had the rule that when both fences exist, then
> collectively the shared ones must signale no earlier than the exclusive
> one.
>
> That's at least the contract we've implemented in dma_resv.h. But I've
> also found a bunch of drivers who are a lot more yolo on this.
>
> I think there's a solid case here to just always take all the fences if we
> ask for all the shared ones, but if we go that way then I'd say
> - clear kerneldoc patch to really hammer this in (currently we're not good
>    at all in this regard)
> - going through drivers a bit to check for this (I have some of that done
>    already in my earlier series, need to respin it and send it out)
>
> But I'm kinda not seeing why this needs to be in this patch series here.

You mentioned that this is a problem in the last patch and if you ask me 
that's just a bug or at least very inconsistent.

See dma_resv_wait_timeout() always waits for all fences, including the 
exclusive one even if shared ones are present. But 
dma_resv_test_signaled() ignores the exclusive one if shared ones are 
present.

The only other driver I could find trying to make use of this is nouveau 
and I already provided a fix for this as well.

I just think that this is the more defensive approach to fix this and 
have at least the core functions consistent on the handling.

Christian.

> -Daniel
>
>> ---
>>   drivers/dma-buf/dma-resv.c | 33 ++++++++++++---------------------
>>   1 file changed, 12 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index f26c71747d43..c66bfdde9454 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -615,25 +615,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
>>    */
>>   bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>>   {
>> -	unsigned int seq, shared_count;
>> +	struct dma_fence *fence;
>> +	unsigned int seq;
>>   	int ret;
>>   
>>   	rcu_read_lock();
>>   retry:
>>   	ret = true;
>> -	shared_count = 0;
>>   	seq = read_seqcount_begin(&obj->seq);
>>   
>>   	if (test_all) {
>>   		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
>> -		unsigned int i;
>> -
>> -		if (fobj)
>> -			shared_count = fobj->shared_count;
>> +		unsigned int i, shared_count;
>>   
>> +		shared_count = fobj ? fobj->shared_count : 0;
>>   		for (i = 0; i < shared_count; ++i) {
>> -			struct dma_fence *fence;
>> -
>>   			fence = rcu_dereference(fobj->shared[i]);
>>   			ret = dma_resv_test_signaled_single(fence);
>>   			if (ret < 0)
>> @@ -641,24 +637,19 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>>   			else if (!ret)
>>   				break;
>>   		}
>> -
>> -		if (read_seqcount_retry(&obj->seq, seq))
>> -			goto retry;
>>   	}
>>   
>> -	if (!shared_count) {
>> -		struct dma_fence *fence_excl = dma_resv_excl_fence(obj);
>> -
>> -		if (fence_excl) {
>> -			ret = dma_resv_test_signaled_single(fence_excl);
>> -			if (ret < 0)
>> -				goto retry;
>> +	fence = dma_resv_excl_fence(obj);
>> +	if (fence) {
>> +		ret = dma_resv_test_signaled_single(fence);
>> +		if (ret < 0)
>> +			goto retry;
>>   
>> -			if (read_seqcount_retry(&obj->seq, seq))
>> -				goto retry;
>> -		}
>>   	}
>>   
>> +	if (read_seqcount_retry(&obj->seq, seq))
>> +		goto retry;
>> +
>>   	rcu_read_unlock();
>>   	return ret;
>>   }
>> -- 
>> 2.25.1
>>

