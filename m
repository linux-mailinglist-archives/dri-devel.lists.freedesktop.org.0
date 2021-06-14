Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6F3A6CE2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 19:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A72389CB3;
	Mon, 14 Jun 2021 17:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498B489CB3;
 Mon, 14 Jun 2021 17:15:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id t7so2300216edd.5;
 Mon, 14 Jun 2021 10:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=f2ggNfCwsjFsKNCjSPM2g4hB/8aV6ufRdZTvgF1Gm8Q=;
 b=XrqB20qh+4udCmmjv41EdVMqHj++78gktMO+wsBgMmUU5yN9J5y/+xpJsJLY+AnPkx
 APL47+3Zs5Ci6fgfVHWNU7yGHdJueIg58EAEKjMcLl9BheqaggGZMmNtVOGXW6eEvIV0
 27BFuOi/wbhHs2g4BSOIkhnfYRpBI7/LYtn6ofFb54hf0ysVgjcCOe/KBvvHXg6ADFnC
 RBw2SjIhQxSIcHThxxbDwwRST2kH1lDi3VoWLK6YxfmIKIU2BNaiXKfu1q8LN+iq9lw2
 cM5qdsEI2H1RdPl4H69WjQG9TBgWKPeNyZOaSNIzb5/Fli+VrnNGahyrqdlNvYs2RVPR
 FSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=f2ggNfCwsjFsKNCjSPM2g4hB/8aV6ufRdZTvgF1Gm8Q=;
 b=pqV1eMJqxZtzoOENWNMGyEjB48XAekg9GKaTOCly5dYEeF1UrfsfuRagtMkOGFsSBw
 lB95++2Y0eZZvEzq3WSYCWsDue7zF16QGYkl98JVh9iDUupxykOSGH/m8DB/25vuwOnz
 3SKZ+XN+apmwDSTGLxJjb88CDidX/Qo3haHYnFGfBKZTHe5LrR801AwYiTjRYpB7kQRF
 ITI3dWq0Xc5iV2a4O+gkm3OmES3/Z8RldfEQF4w7q0/gzXMMJYsaQCATR+75Be4X5H9a
 zRo3wwNERl3V9hLjmRlUnNRF0DSeDokkGqB6vE1HfoYR6Ga8mJQhVveA66sanxLaUnBF
 QuDA==
X-Gm-Message-State: AOAM532liiUIE+TYZeOInOoR+bE+yrsYIGA/8btz2pZ0TJ+t6qKEUcuO
 X/L949Pe9+/3AL6ATLQEDNCTzYPMP8k=
X-Google-Smtp-Source: ABdhPJz3oaR/StdXDQdvFeoAS5rwFXqW347uNs+hR50ElpsZvPgcnujdqrzY3c2XS912L0qigKXiXg==
X-Received: by 2002:a05:6402:524b:: with SMTP id
 t11mr18682066edd.327.1623690945934; 
 Mon, 14 Jun 2021 10:15:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e8cf:b51d:4c59:9c81?
 ([2a02:908:1252:fb60:e8cf:b51d:4c59:9c81])
 by smtp.gmail.com with ESMTPSA id m12sm7733794ejc.65.2021.06.14.10.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 10:15:45 -0700 (PDT)
Subject: Re: [PATCH 1/5] dma-buf: fix dma_resv_test_signaled test_all handling
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210611120301.10595-1-christian.koenig@amd.com>
 <YMN3nr1mTj09p8lT@phenom.ffwll.local>
 <2c91e4b4-e8c8-a9f5-420f-9cf0c1f9a67d@gmail.com>
 <YMN5do2/KUt85h5W@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a88eacc0-c572-b296-e30b-ec606d716f8f@gmail.com>
Date: Mon, 14 Jun 2021 19:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMN5do2/KUt85h5W@phenom.ffwll.local>
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

Am 11.06.21 um 16:55 schrieb Daniel Vetter:
> On Fri, Jun 11, 2021 at 04:53:11PM +0200, Christian König wrote:
>>
>> Am 11.06.21 um 16:47 schrieb Daniel Vetter:
>>> On Fri, Jun 11, 2021 at 02:02:57PM +0200, Christian König wrote:
>>>> As the name implies if testing all fences is requested we
>>>> should indeed test all fences and not skip the exclusive
>>>> one because we see shared ones.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Hm I thought we've had the rule that when both fences exist, then
>>> collectively the shared ones must signale no earlier than the exclusive
>>> one.
>>>
>>> That's at least the contract we've implemented in dma_resv.h. But I've
>>> also found a bunch of drivers who are a lot more yolo on this.
>>>
>>> I think there's a solid case here to just always take all the fences if we
>>> ask for all the shared ones, but if we go that way then I'd say
>>> - clear kerneldoc patch to really hammer this in (currently we're not good
>>>     at all in this regard)
>>> - going through drivers a bit to check for this (I have some of that done
>>>     already in my earlier series, need to respin it and send it out)
>>>
>>> But I'm kinda not seeing why this needs to be in this patch series here.
>> You mentioned that this is a problem in the last patch and if you ask me
>> that's just a bug or at least very inconsistent.
>>
>> See dma_resv_wait_timeout() always waits for all fences, including the
>> exclusive one even if shared ones are present. But dma_resv_test_signaled()
>> ignores the exclusive one if shared ones are present.
> Hm the only one I thought I've mentioned is that dma_buf_poll doesn't use
> dma_fence_get_rcu_safe where I think it should. Different problem. I think
> this is one you spotted.
>
>> The only other driver I could find trying to make use of this is nouveau and
>> I already provided a fix for this as well.
> i915 also does this, and I think I've found a few more.
>
>> I just think that this is the more defensive approach to fix this and have
>> at least the core functions consistent on the handling.
> Oh fully agree, it's just current dma_resv docs aren't the greatest, and
> hacking on semantics without updating the docs isn't great. Especially
> when it's ad-hoc.

Well when the requirement that shared fences should always signal after 
the exclusive fence is not documented anywhere then I would say that it 
is naturally allowed to just add any fence to the list of shared fence 
and any code assuming something else is just broken and need fixing.

Christian.

> -Daniel
>
>> Christian.
>>
>>> -Daniel
>>>
>>>> ---
>>>>    drivers/dma-buf/dma-resv.c | 33 ++++++++++++---------------------
>>>>    1 file changed, 12 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>> index f26c71747d43..c66bfdde9454 100644
>>>> --- a/drivers/dma-buf/dma-resv.c
>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>> @@ -615,25 +615,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
>>>>     */
>>>>    bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>>>>    {
>>>> -	unsigned int seq, shared_count;
>>>> +	struct dma_fence *fence;
>>>> +	unsigned int seq;
>>>>    	int ret;
>>>>    	rcu_read_lock();
>>>>    retry:
>>>>    	ret = true;
>>>> -	shared_count = 0;
>>>>    	seq = read_seqcount_begin(&obj->seq);
>>>>    	if (test_all) {
>>>>    		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
>>>> -		unsigned int i;
>>>> -
>>>> -		if (fobj)
>>>> -			shared_count = fobj->shared_count;
>>>> +		unsigned int i, shared_count;
>>>> +		shared_count = fobj ? fobj->shared_count : 0;
>>>>    		for (i = 0; i < shared_count; ++i) {
>>>> -			struct dma_fence *fence;
>>>> -
>>>>    			fence = rcu_dereference(fobj->shared[i]);
>>>>    			ret = dma_resv_test_signaled_single(fence);
>>>>    			if (ret < 0)
>>>> @@ -641,24 +637,19 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>>>>    			else if (!ret)
>>>>    				break;
>>>>    		}
>>>> -
>>>> -		if (read_seqcount_retry(&obj->seq, seq))
>>>> -			goto retry;
>>>>    	}
>>>> -	if (!shared_count) {
>>>> -		struct dma_fence *fence_excl = dma_resv_excl_fence(obj);
>>>> -
>>>> -		if (fence_excl) {
>>>> -			ret = dma_resv_test_signaled_single(fence_excl);
>>>> -			if (ret < 0)
>>>> -				goto retry;
>>>> +	fence = dma_resv_excl_fence(obj);
>>>> +	if (fence) {
>>>> +		ret = dma_resv_test_signaled_single(fence);
>>>> +		if (ret < 0)
>>>> +			goto retry;
>>>> -			if (read_seqcount_retry(&obj->seq, seq))
>>>> -				goto retry;
>>>> -		}
>>>>    	}
>>>> +	if (read_seqcount_retry(&obj->seq, seq))
>>>> +		goto retry;
>>>> +
>>>>    	rcu_read_unlock();
>>>>    	return ret;
>>>>    }
>>>> -- 
>>>> 2.25.1
>>>>

