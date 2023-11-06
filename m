Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01E7E1EC5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBE110E2C4;
	Mon,  6 Nov 2023 10:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C2210E2C5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699267583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBBHGlGug2sDaMRAASVGz4oXj62d4vp0Qb3y5VCW+Oc=;
 b=cjG5pFGRpxQSGtjByndtMZ7O8Nc7B1pI3ejrSMnnDBxnPhKKUweNRdEoJhhTXw1XDrEBPI
 TW6WpN4uK1dXzKfLDTGW50pi78V/CDskdv3wqo8uOnotbkD9MoqdW6mvuWpZvU9YozASLn
 WWbqIwRju+iY+RCNNG2hq1QoGOmfIyc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-pqIAzPzLN9mxQVMPTr2tAQ-1; Mon, 06 Nov 2023 05:46:11 -0500
X-MC-Unique: pqIAzPzLN9mxQVMPTr2tAQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32fa41d0564so2236758f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 02:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699267570; x=1699872370;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UBBHGlGug2sDaMRAASVGz4oXj62d4vp0Qb3y5VCW+Oc=;
 b=URzBESCaEapyeeIxxA2UIHcbsRFYtMqWe3yQ96WvssfpK+o7gPHPfpfHKzPmtggqzW
 uq2brXOz7P+LGETy5WvvoWTG4IIUw7/+U8gAlgDqAI+q0n+cZLA5lUpKbfoAumLu2hxl
 SWlUU+/WkP5gfeJahBaSGOcAuH/38KUZtyNYjo3r3tGfvXx2f8Hz2MjVmp19TVQCV1Nw
 1ra8QxKzT8h6z3cJ15eThWYmnIrplakDiQ6wxKup7ptc8zCjKxlr3doVlt2unDl1C/gC
 TEKM1Q+OjECNgeU26HgXcm41GB9JoLPDLbi/wapRy++xHrEPwFAPufbDMj4VEKoV11kT
 2EUg==
X-Gm-Message-State: AOJu0YwyKucJd+y4amMKJVLYdrVMRQ6YqhCt68eeQaHAYVkDYunseDg1
 PrtLSlqzXrHjdHIlCg+5yo6wKhzhJhav6MNf5oiwxWL3nL0ZYoIg10NIdbyAn4b27HKpIVWcF2T
 rVQ9xVJXr6d3i53NKl+Zwh3AvcFH5
X-Received: by 2002:a5d:6d87:0:b0:32f:908e:c7e0 with SMTP id
 l7-20020a5d6d87000000b0032f908ec7e0mr17559314wrs.28.1699267570466; 
 Mon, 06 Nov 2023 02:46:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw0KbgCDEwB5tVpLvVGERVzNbBBFGIocZLxK974H+Lu925obU4SRUVDW8ECTLCXhMFU5ORqw==
X-Received: by 2002:a5d:6d87:0:b0:32f:908e:c7e0 with SMTP id
 l7-20020a5d6d87000000b0032f908ec7e0mr17559295wrs.28.1699267570128; 
 Mon, 06 Nov 2023 02:46:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 o17-20020adfcf11000000b0032da319a27asm9148638wrj.9.2023.11.06.02.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 02:46:09 -0800 (PST)
Message-ID: <f19a2cb4-57b6-427c-b69c-47a848420530@redhat.com>
Date: Mon, 6 Nov 2023 11:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Flush the cache to improve latency
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, daniel@ffwll.ch
References: <20231019135655.313759-1-jfalempe@redhat.com>
 <660c0260-0e22-4e9c-ab13-157adaa0b14d@suse.de>
 <74b367bd-ac80-478b-8f82-e98cb6e40475@redhat.com>
In-Reply-To: <74b367bd-ac80-478b-8f82-e98cb6e40475@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/10/2023 10:30, Jocelyn Falempe wrote:
> On 20/10/2023 14:06, Thomas Zimmermann wrote:
>> (cc'ing lkml for feedback)
>>
>> Hi Jocelyn
>>
>> Am 19.10.23 um 15:55 schrieb Jocelyn Falempe:
>>> We found a regression in v5.10 on real-time server, using the
>>> rt-kernel and the mgag200 driver. It's some really specialized
>>> workload, with <10us latency expectation on isolated core.
>>> After the v5.10, the real time tasks missed their <10us latency
>>> when something prints on the screen (fbcon or printk)
>>
>> I'd like to hear the opinion of the RT-devs on this patch. Because 
>> AFAIK we never did such a workaround in other drivers. And AFAIK 
>> printk is a PITA anyway.
> 
> Most other drivers uses DMA, which means this workaround can't apply to 
> them.
> 
>>
>> IMHO if that RT system cannot handle differences in framebuffer 
>> caching, it's under-powered. It's just a matter of time until 
>> something else changes and the problem returns. And (honest question) 
>> as it's an x86-64, how do they handle System Management Mode?
> 
> I think it's not a big news, that the Matrox G200 from 1999 is 
> under-powered.
> I was also a bit surprised that flushing the cache would have such 
> effect on latency. The tests we are doing can run 24h with the 
> workaround, without any interrupt taking more than 10us. Without the 
> workaround, every ~30s the interrupt failed its 10us target.
> 
>>
>>>
>>> The regression has been bisected to 2 commits:
>>> 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
>>> 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
>>>
>>> The first one changed the system memory framebuffer from Write-Combine
>>> to the default caching.
>>> Before the second commit, the mgag200 driver used to unmap the
>>> framebuffer after each frame, which implicitly does a cache flush.
>>> Both regressions are fixed by the following patch, which forces a
>>> cache flush after each frame, reverting to almost v5.9 behavior.
>>
>> With that second commit, we essentially never unmap an active 
>> framebuffer console. But with commit
>>
>> 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access 
>> with vmap")
>>
>> we now again unmap the console framebuffer after the pageflip happened.
>>
>> So how does the latest kernel behave wrt to the problem?
> 
> The regression was found when upgrading the server from v5.4 to v5.14, 
> so we didn't test with later kernels.
> We will test with v6.3 (which should have 359c6649cd9a ) and see what it 
> gives.

I don't have a clear explanation, but testing with v6.3, and forcing the 
Write Combine, doesn't fix the latency issue. So forcing the cache flush 
is still needed.

Also, on some systems, they use "isolated cpu" to handle RT task, but 
with a standard kernel (so without the CONFIG_PREEMPT_RT).
So I'm wondering if we can use a kernel module parameter for this,
so that users that wants to achieve low latency, can opt-in ?

something like mgag200.force_cache_flush=1 or mgag200.low_latency=1 ?

Best regards,

-- 

Jocelyn

>>
>>> This is necessary only if you have strong realtime constraints, so I
>>> put the cache flush under the CONFIG_PREEMPT_RT config flag.
>>> Also clflush is only availabe on x86, (and this issue has only been
>>> reproduced on x86_64) so it's also under the CONFIG_X86 config flag.
>>>
>>> Fixes: 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
>>> Fixes: 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>> index af3ce5a6a636..11660cd29cea 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>> @@ -13,6 +13,7 @@
>>>   #include <drm/drm_atomic.h>
>>>   #include <drm/drm_atomic_helper.h>
>>> +#include <drm/drm_cache.h>
>>>   #include <drm/drm_damage_helper.h>
>>>   #include <drm/drm_format_helper.h>
>>>   #include <drm/drm_fourcc.h>
>>> @@ -436,6 +437,10 @@ static void mgag200_handle_damage(struct 
>>> mga_device *mdev, const struct iosys_ma
>>>       iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], 
>>> fb->format, clip));
>>>       drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
>>> +    /* On RT systems, flushing the cache reduces the latency for 
>>> other RT tasks */
>>> +#if defined(CONFIG_X86) && defined(CONFIG_PREEMPT_RT)
>>> +    drm_clflush_virt_range(vmap, fb->height * fb->pitches[0]);
>>> +#endif
>>
>> Your second commit is part of a larger patchset that updates several 
>> drivers. They might all be affected. So if anything, the patch should 
>> go here before the unmap call:
>>
>> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/drm_gem_atomic_helper.c#L377
>>
> The regression was found only with G200 currently, so I don't want to 
> apply it blindly on other drivers.
> 
> Thanks for your help,
> 
> Best regards,
> 

