Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE7D3F8A8E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 16:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118586E86D;
	Thu, 26 Aug 2021 14:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E9B6E86D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 14:58:09 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q14so5569279wrp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 07:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VzMqmy2NtJQr4FC2RZ/rGjDDsOJn4nBfFVTuD0d4lsQ=;
 b=fPtLgXbD7n4cODCRaUwYDMFvGVaJCxMr6hNgqS/XXbL3drAIm7lekquOunSxMxmcq4
 t1TaUgehga1EPHHyFVXNfrVboNMUD3CIab+JeFHMyo570305GCbLLmaUW4k4GFxC/krv
 WFQoQz1wEbLIltheeQbCZP6a6a9SsbLNNDMt2WEbaOMTkd4VCU8Mm7RdYrO6blBiJoQ+
 KM/BqzNViHZWBQsM8d+MlnyLezUcjqSFre48s4+7qMYEIYTXA3gVrEIpEPBGhDJrPCDP
 hVKtwa95F03JOcvD6ttiXoca7PnQUSkY0J8TvOQ3Meh9MxL2Lf52/VknrOBkJ8kZKYqZ
 Valw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VzMqmy2NtJQr4FC2RZ/rGjDDsOJn4nBfFVTuD0d4lsQ=;
 b=Clrcx4kUIZ3ysDW/Z+1wjI8Prxy3VHZ5D5FMebTT9A3KNo7nEJA0kRFKZD3BpGpXLC
 cAT/8GNpGSV6GP+u4yBF/+SJ8bb31SmLnxKogglAhDfwYVhqUuEAX+V7rGRL/jN+/bGq
 zMw33iBeyscwP0K8PI/Q9QtO+8qpcbyP/ICrTklZ1aCPkRAuUubIUSbOo+ljlmWsz7eV
 eyb+I46jebcTZaqIpqJ5ekbKBQHuepmB9XDo4N93qEYQCM48jO/yXnD/FTSt6O8Mol2q
 MyaOpOVRB0Lcv5Dm9HX9IfTsrKik5apWle9rc7c5aKBT4EpRmxCciWLqcAer3eXIz7fF
 g55w==
X-Gm-Message-State: AOAM533OLGn/Lt4qb7El2bMT3jbcS0kDuuT3pgEor9Z2XC1h0GyYItyo
 Edpd0X+IANWzdoxxdLL+szbUOq4S2yg=
X-Google-Smtp-Source: ABdhPJw9VkC0GUVtu3g/Jeilhj2hrs3LIVHbu/28r92PrnvI8yDAbn2Kamide4IQYwWBYB/yE2EqnQ==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr4535348wrm.237.1629989888521; 
 Thu, 26 Aug 2021 07:58:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1f1e:4529:2fc9:1857?
 ([2a02:908:1252:fb60:1f1e:4529:2fc9:1857])
 by smtp.gmail.com with ESMTPSA id b13sm3248722wrf.86.2021.08.26.07.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 07:58:07 -0700 (PDT)
Subject: Re: [PATCH 1/2] mm/vmscan: add sync_shrinkers function v2
To: Daniel Vetter <daniel@ffwll.ch>
Cc: akpm@linux-foundation.org, dri-devel@lists.freedesktop.org
References: <20210820120528.81114-1-christian.koenig@amd.com>
 <20210820120528.81114-2-christian.koenig@amd.com>
 <YSeWwnokqMda+JJv@phenom.ffwll.local> <YSeXD55uhCo612LT@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <abffde95-da1b-a387-e81b-10269f2e6ede@gmail.com>
Date: Thu, 26 Aug 2021 16:58:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSeXD55uhCo612LT@phenom.ffwll.local>
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

Am 26.08.21 um 15:28 schrieb Daniel Vetter:
> On Thu, Aug 26, 2021 at 03:27:30PM +0200, Daniel Vetter wrote:
>> On Fri, Aug 20, 2021 at 02:05:27PM +0200, Christian König wrote:
>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>
>>> While unplugging a device the TTM shrinker implementation
>>> needs a barrier to make sure that all concurrent shrink
>>> operations are done and no other CPU is referring to a
>>> device specific pool any more.
>>>
>>> Taking and releasing the shrinker semaphore on the write
>>> side after unmapping and freeing all pages from the device
>>> pool should make sure that no shrinker is running in
>>> paralell.
>>>
>>> This allows us to avoid the contented mutex in the TTM pool
>>> implementation for every alloc/free operation.
>>>
>>> v2: rework the commit message to make clear why we need this
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Acked-by: Huang Rui <ray.huang@amd.com>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> ---
>>>   include/linux/shrinker.h |  1 +
>>>   mm/vmscan.c              | 10 ++++++++++
>>>   2 files changed, 11 insertions(+)
>>>
>>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>>> index 9814fff58a69..1de17f53cdbc 100644
>>> --- a/include/linux/shrinker.h
>>> +++ b/include/linux/shrinker.h
>>> @@ -93,4 +93,5 @@ extern void register_shrinker_prepared(struct shrinker *shrinker);
>>>   extern int register_shrinker(struct shrinker *shrinker);
>>>   extern void unregister_shrinker(struct shrinker *shrinker);
>>>   extern void free_prealloced_shrinker(struct shrinker *shrinker);
>>> +extern void sync_shrinkers(void);
>>>   #endif
>>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>>> index 4620df62f0ff..fde1aabcfa7f 100644
>>> --- a/mm/vmscan.c
>>> +++ b/mm/vmscan.c
>>> @@ -638,6 +638,16 @@ void unregister_shrinker(struct shrinker *shrinker)
>>>   }
>>>   EXPORT_SYMBOL(unregister_shrinker);
>>>   
>>> +/**
>>> + * sync_shrinker - Wait for all running shrinkers to complete.
>> I think it would be good to add a bit more text here maybe:
>>
>> "This is equivalent to calling unregister_shrink() and
>> register_shrinker(), but atomically and with less overhead. This is useful
>> to guarantee that all shrinker invocations have seen an update, before
>> freeing memory, similar to rcu."
>>
>> Also a bit a bikeshed, but if we look at the equivalent in irq land it's
>> called synchronize_irq() and synchronize_hardirq(). I think it'd be good
>> to bikeshed that for more conceptual consistency.
> Oh also synchronize_*rcu* also spells them all out, so even more reasons
> to do the same.

I will just go with the explanation above.

The synchronize_rcu() explanation is so extensive that most people will 
probably stop reading after the first paragraph.

Thanks,
Christian.

> -Daniel
>
>>> + */
>>> +void sync_shrinkers(void)
>>> +{
>>> +	down_write(&shrinker_rwsem);
>>> +	up_write(&shrinker_rwsem);
>>> +}
>>> +EXPORT_SYMBOL(sync_shrinkers);
>>> +
>>>   #define SHRINK_BATCH 128
>>>   
>>>   static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
>>> -- 
>>> 2.25.1
>>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

