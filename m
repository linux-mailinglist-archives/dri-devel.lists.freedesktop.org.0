Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC81080C49F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E79210E379;
	Mon, 11 Dec 2023 09:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBB0210E379
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702287092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFC2deJPIq3fvcbstM7BMUEdgRloD/q7nGSqIs3vPcQ=;
 b=dtJe+uy4iFCl3Ia/zhah7IkEjuUg2idlB1O1eyP5apzCjxMQnp1SZEx6jLUpC5sClEhQCS
 kFm+HZGp9HCkKROjZW/HI9mM4jSkrjgBY1x3k2wM0crKw56a2Q2OLdOnQanlBx5KUf7BLF
 iBeMKi6VaaywtjbB2XisDwV7wtGYIk0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-ELENVGBzODyafakmB9d0Yw-1; Mon, 11 Dec 2023 04:31:31 -0500
X-MC-Unique: ELENVGBzODyafakmB9d0Yw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40c295f59ceso19520365e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702287090; x=1702891890;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CFC2deJPIq3fvcbstM7BMUEdgRloD/q7nGSqIs3vPcQ=;
 b=XL0CRSXyNGLm+JRzEA2qY2J3XNfAP2s2NAvSKbGxUmgqTqdfTY0n6MG52l9gL4Uccp
 33OXwTp4qv/JyLDloew6YyHNBoBL+a4baxwCUuPXkuAAth9xchnL7n21ff+G2ZTBhQSy
 1Y1PEgDKpesH11V8GDk036ZlGycr/oxOJvfzxPRy+f7g3QI+hBzE+k5IBSGjZBlCulyx
 dMj5CZ+3r4auUcnPH2a8onoYLRRxPCXWN1PZdT9efkOJCdplTNhmw+4w7SxjSWClw0Mv
 uCL4d5p8yPaIn/L6kcJqVNlwmC6M8PQ+jHFYy3+ulakGEuoaeO8r/4Csw8SoVQJWg9LM
 +bCA==
X-Gm-Message-State: AOJu0YxIs2tKRjghwTRDjBSt4+8niaghjoBfoRP9f7EaApVsk1QRtG7j
 9BF/NEMgXbV5hI9kx05arQ1UAseXBWgMCyoC22sqmH7mO/+FYAb7pOLcRdhDRdY5WGdj1a1C1JU
 4LbVKVSpk6gWS27cPIVK/zQ9iDJMW
X-Received: by 2002:a05:600c:54c4:b0:40c:3984:4985 with SMTP id
 iw4-20020a05600c54c400b0040c39844985mr1849295wmb.79.1702287089907; 
 Mon, 11 Dec 2023 01:31:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXVFHBGlGGlmv8izehByJ14jniK3pCaDZqVI7bLTig15JWIQ92sJgfEW+SPrJG252BSKEJuQ==
X-Received: by 2002:a05:600c:54c4:b0:40c:3984:4985 with SMTP id
 iw4-20020a05600c54c400b0040c39844985mr1849286wmb.79.1702287089519; 
 Mon, 11 Dec 2023 01:31:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a5d4644000000b003333bd63792sm8087678wrs.117.2023.12.11.01.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 01:31:29 -0800 (PST)
Message-ID: <e64f641d-44b7-4019-866d-1050277ef885@redhat.com>
Date: Mon, 11 Dec 2023 10:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/mgag200: Flush the cache to improve latency
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, daniel@ffwll.ch
References: <20231019135655.313759-1-jfalempe@redhat.com>
 <660c0260-0e22-4e9c-ab13-157adaa0b14d@suse.de>
 <74b367bd-ac80-478b-8f82-e98cb6e40475@redhat.com>
 <f19a2cb4-57b6-427c-b69c-47a848420530@redhat.com>
In-Reply-To: <f19a2cb4-57b6-427c-b69c-47a848420530@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 06/11/2023 11:46, Jocelyn Falempe wrote:
> On 23/10/2023 10:30, Jocelyn Falempe wrote:
>> On 20/10/2023 14:06, Thomas Zimmermann wrote:
>>> (cc'ing lkml for feedback)
>>>
>>> Hi Jocelyn
>>>
>>> Am 19.10.23 um 15:55 schrieb Jocelyn Falempe:
>>>> We found a regression in v5.10 on real-time server, using the
>>>> rt-kernel and the mgag200 driver. It's some really specialized
>>>> workload, with <10us latency expectation on isolated core.
>>>> After the v5.10, the real time tasks missed their <10us latency
>>>> when something prints on the screen (fbcon or printk)
>>>
>>> I'd like to hear the opinion of the RT-devs on this patch. Because 
>>> AFAIK we never did such a workaround in other drivers. And AFAIK 
>>> printk is a PITA anyway.
>>
>> Most other drivers uses DMA, which means this workaround can't apply 
>> to them.
>>
>>>
>>> IMHO if that RT system cannot handle differences in framebuffer 
>>> caching, it's under-powered. It's just a matter of time until 
>>> something else changes and the problem returns. And (honest question) 
>>> as it's an x86-64, how do they handle System Management Mode?
>>
>> I think it's not a big news, that the Matrox G200 from 1999 is 
>> under-powered.
>> I was also a bit surprised that flushing the cache would have such 
>> effect on latency. The tests we are doing can run 24h with the 
>> workaround, without any interrupt taking more than 10us. Without the 
>> workaround, every ~30s the interrupt failed its 10us target.
>>
>>>
>>>>
>>>> The regression has been bisected to 2 commits:
>>>> 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
>>>> 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
>>>>
>>>> The first one changed the system memory framebuffer from Write-Combine
>>>> to the default caching.
>>>> Before the second commit, the mgag200 driver used to unmap the
>>>> framebuffer after each frame, which implicitly does a cache flush.
>>>> Both regressions are fixed by the following patch, which forces a
>>>> cache flush after each frame, reverting to almost v5.9 behavior.
>>>
>>> With that second commit, we essentially never unmap an active 
>>> framebuffer console. But with commit
>>>
>>> 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access 
>>> with vmap")
>>>
>>> we now again unmap the console framebuffer after the pageflip happened.
>>>
>>> So how does the latest kernel behave wrt to the problem?
>>
>> The regression was found when upgrading the server from v5.4 to v5.14, 
>> so we didn't test with later kernels.
>> We will test with v6.3 (which should have 359c6649cd9a ) and see what 
>> it gives.
> 
> I don't have a clear explanation, but testing with v6.3, and forcing the 
> Write Combine, doesn't fix the latency issue. So forcing the cache flush 
> is still needed.
> 
> Also, on some systems, they use "isolated cpu" to handle RT task, but 
> with a standard kernel (so without the CONFIG_PREEMPT_RT).
> So I'm wondering if we can use a kernel module parameter for this,
> so that users that wants to achieve low latency, can opt-in ?
> 
> something like mgag200.force_cache_flush=1 or mgag200.low_latency=1 ?

Hi,

I have now access to a server that reproduce the issue, and I was able 
to test different workarounds.

So it is definitely related to the "Write Combine" mode of the mga 
internal RAM. If I comment the two lines to enable wc: 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mgag200/mgag200_drv.c#L150, 
then the latency is <10us (but the performances are worse, from 20ms to 
87ms to draw a full frame).

I also tried to flush the vram using:
drm_clflush_virt_range(mdev->vram + clip->y1 * fb->pitches[0], 
drm_rect_height(clip) * fb->pitches[0]);
And that lower the latency to ~20us, but it's not enough.

I tried "sfence" which I though would flush the WC buffers of the CPU, 
but that has no effect in practice.

I think I can send a new patch, to not map the VRAM as Write Combine, 
either if CONFIG_PREEMPT_RT is set or if a module parameter is set.
What do you think is the best approach ?



My tests setup:

I either flood the console with "cat /dev/urandom | base64" from the 
BMC, or write to fb0 with "while true; do dd if=/dev/urandom of=/dev/fb0 
; done"

then I run:

cd /sys/kernel/debug/tracing
echo 0 > tracing_on
echo 950000 > hwlat_detector/width
echo hwlat > current_tracer
echo 10 > tracing_thresh
echo 1 > tracing_on
sleep 300
cat trace
echo 0 > tracing_on
echo nop > current_tracer


Test Results:

V6.6 (~40us latency)

# tracer: hwlat
#
# entries-in-buffer/entries-written: 6/6   #P:56
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
            <...>-8795    [001] dn...   613.749741: #1 inner/outer(us): 
  41/41    ts:1702045267.016266287 count:9976
            <...>-8804    [000] dn...   675.201727: #2 inner/outer(us): 
  40/40    ts:1702045328.469859973 count:6506
            <...>-8804    [000] dn...   731.435258: #3 inner/outer(us): 
  40/41    ts:1702045384.704861049 count:9578
            <...>-8804    [000] d....   787.684533: #4 inner/outer(us): 
  41/41    ts:1702045440.955603974 count:22591
            <...>-8804    [000] d....   844.303041: #5 inner/outer(us): 
  41/41    ts:1702045497.575594006 count:33324
            <...>-8804    [000] d....   900.494844: #6 inner/outer(us): 
  40/40    ts:1702045553.768864888 count:1924


V6.6 + clfush mdev->vram (~20us latency)

# tracer: hwlat
#
# entries-in-buffer/entries-written: 3/3   #P:56
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
            <...>-8983    [001] d....   534.595415: #1 inner/outer(us): 
  21/20    ts:1702024432.844243126 count:3018
            <...>-8983    [000] dn...   758.560453: #2 inner/outer(us): 
  21/21    ts:1702024656.824367474 count:22238
            <...>-8983    [000] dn...   815.117057: #3 inner/outer(us): 
  21/21    ts:1702024713.373220580 count:26455


V6.6 + no Write Combine for VRAM (<10us latency)

# tracer: hwlat
#
# entries-in-buffer/entries-written: 0/0   #P:56
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |


Best regards,

-- 

Jocelyn

