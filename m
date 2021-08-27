Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC913F9432
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 08:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F4B6E8D6;
	Fri, 27 Aug 2021 06:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140306E8D6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:09:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so6715033wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 23:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=AaI2IcubUV7tfQdmGGI7LOrNMKIFxrVyqaamlEVzEBY=;
 b=fP9m6aEhgf9TwXTLLdoMdB+V2IQq8hWFuLmdbbcdsnlsurWmAdgxa7o+QkNdP6mWeV
 +MHCBTIYOWn1euQRaq1vGLLXqPP9TLxTxqkL2yy+El7gXWHtbhhKejSVqrZCWPVXx/HF
 EiFgYS5mt3Te6y0EQBdIqx1vVWg2uQrAr5m/4WEbL9zjf94IRseQGoPN87ncrWHTcZC5
 gBFN9NAzcNJnwjGt+tSbh0uegRetxde0WPhiWxweRO0CpBcdF/Edouz1I2ZvMvTfZNyA
 0hg2PXEf2xl0zbCLcXl5S6qwWqhXzsB4a8zAvyDhyApnWtnTNf7p38p8Cui/3sroSY03
 I4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AaI2IcubUV7tfQdmGGI7LOrNMKIFxrVyqaamlEVzEBY=;
 b=ipvKS2nlN9dVtw055SSogOxi7bg/wgjwz9ZKtkG47bCM2Gt25utQi1ikl5fFFCOQIR
 rmhgYyyaQkL/6ZmKusUbmz89Z+ZFdVHKbxKA5gyY+qicgCGeF/XbVA7mmJUEgjqZtNS/
 UrIPOWEGZgZMjGBk4D61GSv+2ZWjMlynUMXon3o/GzajQrKnzMRO8ngukn85pYq/fSI6
 gulo1ioVeENs0Ou1obtOv7Ymg7fXsXVpH3OfZM19NeJPPH6cNW9r3Uz1Ynt0We27geEq
 PaEqs5ZlC3F4J2Rho46Zsoxtn+TVNZ6oxdg+WsPYv8l8dwlm9CHDdMizK8H0xk7f80Pz
 Em1Q==
X-Gm-Message-State: AOAM532SzhMs1wEHsGfAIf1sRT4BA3dlDLfhjcs05KBmVBsoKa3HMrHF
 lL2mi5NKhjEc6aYSLlFwSwObIKCOe8eOfKR9
X-Google-Smtp-Source: ABdhPJx+d6uD4w8uQnT2cXo0+ogUcm/kUeBIKc6M53yBRB6Ar23AWjquoIMirhWK6OH/UmryDD8E4g==
X-Received: by 2002:a1c:7702:: with SMTP id t2mr11446104wmi.121.1630044543592; 
 Thu, 26 Aug 2021 23:09:03 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id e9sm1901856wrd.69.2021.08.26.23.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 23:09:03 -0700 (PDT)
Subject: Re: [PATCH 1/2] mm/vmscan: add sync_shrinkers function v2
To: Daniel Vetter <daniel@ffwll.ch>
Cc: akpm@linux-foundation.org, dri-devel@lists.freedesktop.org
References: <20210820120528.81114-1-christian.koenig@amd.com>
 <20210820120528.81114-2-christian.koenig@amd.com>
 <YSeWwnokqMda+JJv@phenom.ffwll.local> <YSeXD55uhCo612LT@phenom.ffwll.local>
 <abffde95-da1b-a387-e81b-10269f2e6ede@gmail.com>
 <YSe0fZI86K0lbDR5@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <342ea68e-cb67-36ff-e4e4-5fde1f3b36fe@gmail.com>
Date: Fri, 27 Aug 2021 08:09:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSe0fZI86K0lbDR5@phenom.ffwll.local>
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



Am 26.08.21 um 17:34 schrieb Daniel Vetter:
> On Thu, Aug 26, 2021 at 04:58:06PM +0200, Christian König wrote:
>> Am 26.08.21 um 15:28 schrieb Daniel Vetter:
>>> On Thu, Aug 26, 2021 at 03:27:30PM +0200, Daniel Vetter wrote:
>>>> On Fri, Aug 20, 2021 at 02:05:27PM +0200, Christian König wrote:
>>>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>>>
>>>>> While unplugging a device the TTM shrinker implementation
>>>>> needs a barrier to make sure that all concurrent shrink
>>>>> operations are done and no other CPU is referring to a
>>>>> device specific pool any more.
>>>>>
>>>>> Taking and releasing the shrinker semaphore on the write
>>>>> side after unmapping and freeing all pages from the device
>>>>> pool should make sure that no shrinker is running in
>>>>> paralell.
>>>>>
>>>>> This allows us to avoid the contented mutex in the TTM pool
>>>>> implementation for every alloc/free operation.
>>>>>
>>>>> v2: rework the commit message to make clear why we need this
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> Acked-by: Huang Rui <ray.huang@amd.com>
>>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> ---
>>>>>    include/linux/shrinker.h |  1 +
>>>>>    mm/vmscan.c              | 10 ++++++++++
>>>>>    2 files changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>>>>> index 9814fff58a69..1de17f53cdbc 100644
>>>>> --- a/include/linux/shrinker.h
>>>>> +++ b/include/linux/shrinker.h
>>>>> @@ -93,4 +93,5 @@ extern void register_shrinker_prepared(struct shrinker *shrinker);
>>>>>    extern int register_shrinker(struct shrinker *shrinker);
>>>>>    extern void unregister_shrinker(struct shrinker *shrinker);
>>>>>    extern void free_prealloced_shrinker(struct shrinker *shrinker);
>>>>> +extern void sync_shrinkers(void);
>>>>>    #endif
>>>>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>>>>> index 4620df62f0ff..fde1aabcfa7f 100644
>>>>> --- a/mm/vmscan.c
>>>>> +++ b/mm/vmscan.c
>>>>> @@ -638,6 +638,16 @@ void unregister_shrinker(struct shrinker *shrinker)
>>>>>    }
>>>>>    EXPORT_SYMBOL(unregister_shrinker);
>>>>> +/**
>>>>> + * sync_shrinker - Wait for all running shrinkers to complete.
>>>> I think it would be good to add a bit more text here maybe:
>>>>
>>>> "This is equivalent to calling unregister_shrink() and
>>>> register_shrinker(), but atomically and with less overhead. This is useful
>>>> to guarantee that all shrinker invocations have seen an update, before
>>>> freeing memory, similar to rcu."
>>>>
>>>> Also a bit a bikeshed, but if we look at the equivalent in irq land it's
>>>> called synchronize_irq() and synchronize_hardirq(). I think it'd be good
>>>> to bikeshed that for more conceptual consistency.
>>> Oh also synchronize_*rcu* also spells them all out, so even more reasons
>>> to do the same.
>> I will just go with the explanation above.
>>
>> The synchronize_rcu() explanation is so extensive that most people will
>> probably stop reading after the first paragraph.
> Ack, my comment was only about the function name (spelled out instead of
> abbreviated), not about pulling the entire kerneldoc in from these.

Ah, good point. Going to change that as well.

Christian.

> -Daniel
>
>> Thanks,
>> Christian.
>>
>>> -Daniel
>>>
>>>>> + */
>>>>> +void sync_shrinkers(void)
>>>>> +{
>>>>> +	down_write(&shrinker_rwsem);
>>>>> +	up_write(&shrinker_rwsem);
>>>>> +}
>>>>> +EXPORT_SYMBOL(sync_shrinkers);
>>>>> +
>>>>>    #define SHRINK_BATCH 128
>>>>>    static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
>>>>> -- 
>>>>> 2.25.1
>>>>>
>>>> -- 
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> http://blog.ffwll.ch

