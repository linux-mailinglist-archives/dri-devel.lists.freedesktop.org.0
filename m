Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00048443D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 16:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF7410E487;
	Tue,  4 Jan 2022 15:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3673510E487
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:08:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s1so76801494wra.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=W9Bh3fUgumLp+/q/W4dvepebJC6o+IFE+HMv/nLlfio=;
 b=EFPEi1FUlJs6XPlFFfpKYRwWHX4RTpssWRFTbpKn1N5Fyq3bqyz5XabLFJqNv62XfB
 0cEqyJDxfBZmXXA0FEud20NLTAI1FoF7/xfAVYTaf5owDMGZU/9NWIkxGMxcsxnoKBfl
 CfDgi/O6Aq/PXRly1pl4GWco5U5S0YfyOu4/AxagKflnFYxxsTPcwsYnP5ZPoeCRXEdY
 k7HdbEy6lRrVcoXxVotVskERr6a3NLmnG+KeSVgIFDGqj+L+1TzGsTfAtYONWPnVYOKT
 TExmhBJs4zSgcrs+GsvWxe1UgufFwfqlAVQtrCy4EJBNWnyKcYENh5hdUgx/f3fEpicj
 TIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=W9Bh3fUgumLp+/q/W4dvepebJC6o+IFE+HMv/nLlfio=;
 b=JH9mQq1C4Oz+EblloBdZRFmdlB2q5j82zXk5ZzN9cn9Wb/jCGrdvi8MDL6bapFPjSW
 7MDz2WUx7vTXGs8dSKi9wgjeu5pwIhDE20THLBZ8UE2ZiiScMm39mRrg9cP4U/Q9cGtL
 OJyw0Ogi7Yr+8GjLWRySpxQLPsOsoLMscJe3Nn3q347UWEMBwbAqEHBPCA5/PJSxIJjs
 cUfiItFrT8Djqn37LOQ6PbsrYdonctwBApyfQHodzaNJp0XfbjGXUjA05YHf97YqWdEe
 9R/0GmRtegeAgI+oKTZlDtfFIG9vgmN+ZYEcHjTb6a9V+i2IpI1nQ3kxHkcg+8P5+i8G
 xp5g==
X-Gm-Message-State: AOAM530Tv7QqLYnDRnFOcJY9XF0MeF5zUv/1zAOqyrFajLYmG+xQ0MnF
 2+iKIt1qWmY/gO9dlp0yvHPiXPod/Jk=
X-Google-Smtp-Source: ABdhPJwSMJ+2xGsiLFU6tc5hin8MGLy37GABx1tG7xE5ec2i5KTv5TLhulFWgyy/psXnhTyX6WVnnQ==
X-Received: by 2002:adf:f945:: with SMTP id q5mr12916536wrr.115.1641308901773; 
 Tue, 04 Jan 2022 07:08:21 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:6d5e:a071:be8b:acf5?
 ([2a02:908:1252:fb60:6d5e:a071:be8b:acf5])
 by smtp.gmail.com with ESMTPSA id g5sm42662265wrd.100.2022.01.04.07.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 07:08:21 -0800 (PST)
Subject: Re: [PATCH 13/24] dma-buf: drop the DAG approach for the dma_resv
 object
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-14-christian.koenig@amd.com>
 <YcOcASxfAApIpbrf@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d1fe9e3b-3d58-2aa8-36ae-9052192a2f0d@gmail.com>
Date: Tue, 4 Jan 2022 16:08:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcOcASxfAApIpbrf@phenom.ffwll.local>
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

Am 22.12.21 um 22:43 schrieb Daniel Vetter:
> On Tue, Dec 07, 2021 at 01:34:00PM +0100, Christian König wrote:
>> So far we had the approach of using a directed acyclic
>> graph with the dma_resv obj.
>>
>> This turned out to have many downsides, especially it means
>> that every single driver and user of this interface needs
>> to be aware of this restriction when adding fences. If the
>> rules for the DAG are not followed then we end up with
>> potential hard to debug memory corruption, information
>> leaks or even elephant big security holes because we allow
>> userspace to access freed up memory.
>>
>> Since we already took a step back from that by always
>> looking at all fences we now go a step further and stop
>> dropping the shared fences when a new exclusive one is
>> added.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c | 13 -------------
>>   1 file changed, 13 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 9acceabc9399..ecb2ff606bac 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
> No doc update at all!

Scratching my head I'm pretty sure I've updated at least the kerneldoc 
for dma_resv_add_excl_fence(). Must have gone lost in some rebase.

>
> I checked, we're not that shitty with docs,

Well I wouldn't say shitty, but they are not perfect either.

>   Minimally the DOC: section
> header and also the struct dma_resv kerneldoc. Also there's maybe more
> references and stuff I've missed on a quick look, please check for them
> (e.g. dma_buf.resv kerneldoc is rather important to keep correct too).
>
> Code itself does what it says in the commit message, but we really need
> the most accurate docs we can get for this stuff, or the confusion will
> persist :-/

Yeah completely agree, going to fix that.

Thanks,
Christian.

>
> Cheers, Daniel
>
>> @@ -383,29 +383,16 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>>   {
>>   	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
>> -	struct dma_resv_list *old;
>> -	u32 i = 0;
>>   
>>   	dma_resv_assert_held(obj);
>>   
>> -	old = dma_resv_shared_list(obj);
>> -	if (old)
>> -		i = old->shared_count;
>> -
>>   	dma_fence_get(fence);
>>   
>>   	write_seqcount_begin(&obj->seq);
>>   	/* write_seqcount_begin provides the necessary memory barrier */
>>   	RCU_INIT_POINTER(obj->fence_excl, fence);
>> -	if (old)
>> -		old->shared_count = 0;
>>   	write_seqcount_end(&obj->seq);
>>   
>> -	/* inplace update, no shared fences */
>> -	while (i--)
>> -		dma_fence_put(rcu_dereference_protected(old->shared[i],
>> -						dma_resv_held(obj)));
>> -
>>   	dma_fence_put(old_fence);
>>   }
>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>> -- 
>> 2.25.1
>>

