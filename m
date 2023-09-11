Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0879A71A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1136810E183;
	Mon, 11 Sep 2023 10:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D882310E183
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694426740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eK8yzNbc/c+X2ZQi+SRQhuA+s0tuiW3If1GWxDVnvWI=;
 b=NfINqWec7ZEEeWnmBK92a9GJhHH/rowRXzdEGcbYD2Kr1Ay/6PMa0IdW8LDyIfZnAB0kw+
 suJknbqp03Y+TZ18Dw2a9BdjJ+GWWWKpjPiBFlHduYWrjH39HiokuH7i4xkO2vDOAsZQIg
 q+CE+0rtUr8X/vatch+WXqzPYJVI3T8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-DLbBt-o6Ml2heSaehcy3Og-1; Mon, 11 Sep 2023 06:05:39 -0400
X-MC-Unique: DLbBt-o6Ml2heSaehcy3Og-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31c5c762f97so3139658f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 03:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694426738; x=1695031538;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eK8yzNbc/c+X2ZQi+SRQhuA+s0tuiW3If1GWxDVnvWI=;
 b=njjW49YjMxN721epxIbNAWf+n7n6JO1AEqdXxp94UkjbhGfPViB72LfZUQgIB07G/i
 NGlgZEggI1eTdN1m6YEIdmMVlYqP+PJn9WVWKPUB9tDbNxPDJZAyrdSZtgKu+8riDZs1
 ckRF9dFAuvyPTNiGRw6zQStZElUFmuXj/JZzstU/yiLEBdo8/c+hA4yw0lhXQu1jTbAq
 +G+bzwUTeHvSMDpaXRlxPoe8KUIuemfd2+wnOWY/DR0JpAS1wE8DiHKQFbBmU0v0IXeV
 LKBATd1j10XPSQB0U9RNwDYziQ9U0zyaXxhiZNo3UglNg2hzw5mGgmfFVtMsIxfukPJM
 90sQ==
X-Gm-Message-State: AOJu0YxSj0bYOtxAGtKzcZAt29ojtu/87s+St/6czGyQGeR3/CE2D2jP
 VXMraKUdTrJsdEV5s+OXKE/p59KT8sihShejEwEYr7u9qM4qvG50wN1rjCxVchOqw7TAJu/Q6TL
 fSNdRp+OUituiyMoVdbwnHpgknqQc
X-Received: by 2002:a5d:5919:0:b0:319:867e:97d7 with SMTP id
 v25-20020a5d5919000000b00319867e97d7mr6740412wrd.52.1694426738226; 
 Mon, 11 Sep 2023 03:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqeliigRfKZSAxA4RtYYGOBpz1uCr2rAadqM2DX7lJ6hHH/LDz2m7cBRBX+lnoi2fQ6whLSA==
X-Received: by 2002:a5d:5919:0:b0:319:867e:97d7 with SMTP id
 v25-20020a5d5919000000b00319867e97d7mr6740386wrd.52.1694426737799; 
 Mon, 11 Sep 2023 03:05:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d51ce000000b0031980783d78sm9621003wrv.54.2023.09.11.03.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 03:05:37 -0700 (PDT)
Message-ID: <7b3ec46f-b9d9-9d9b-7a39-ae53193e9d32@redhat.com>
Date: Mon, 11 Sep 2023 12:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
 <d19e0242-da31-1e48-8ff8-7381530bd193@redhat.com>
 <3fba00ec-d4bc-e7f9-4a7c-8a6a9141a591@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3fba00ec-d4bc-e7f9-4a7c-8a6a9141a591@suse.de>
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
Cc: javierm@redhat.com, mripard@kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2023 17:37, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.09.23 um 16:48 schrieb Jocelyn Falempe:
>> On 08/09/2023 15:56, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 08.09.23 um 13:16 schrieb Pekka Paalanen:
>>>> On Fri, 8 Sep 2023 11:21:51 +0200
>>>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>>
>>>>> Hi
>>>>>
>>>>> Am 25.08.23 um 16:04 schrieb Jocelyn Falempe:
>>>>> [...]
>>>>>> + *
>>>>>> + *     But there are two exceptions only for dumb buffers:
>>>>>> + *     * To support XRGB8888 if it's not supported by the hardware.
>>>>>
>>>>>
>>>>>> + *     * Any driver is free to modify its internal representation 
>>>>>> of the format,
>>>>>> + *       as long as it doesn't alter the visible content in any 
>>>>>> way, and doesn't
>>>>>> + *       modify the user-provided buffer. An example would be to 
>>>>>> drop the
>>>>>> + *       padding component from a format to save some memory 
>>>>>> bandwidth.
>>>>>
>>>>> I have strong objections to this point, _especially_ as you're
>>>>> apparently trying to sneak this in after our discussion. NAK on this
>>>>> part from my side.
>>>>>
>>>>> If you want userspace to be able to use a certain format, then export
>>>>> the corresponding 4cc code. Then let userspace decide what to do about
>>>>> it. If userspace pick a certain format, go with it.
>>>>
>>>> What is the reason for your objection, exactly?
>>>>
>>>>> Hence, no implicit conversion from XRGB888 to RGB888, just because 
>>>>> it's
>>>>> possible.
>>>>
>>>> For the particular driver in question though, the conversion allows
>>>> using a display resolution that is otherwise not possible. I also hear
>>>> it improves performance since 25% less data needs to travel across a
>>>> slow bus. There is also so little VRAM, than all dumb buffers need to
>>>> be allocated from sysram instead anyway, so a copy is always necessary.
>>>>
>>>> Since XRGB8888 is the one format that is recommended to be supported by
>>>> all drivers, I don't see a problem here. Did you test on your
>>>> incredibly slow g200 test rig if the conversion ends up hurting instead
>>>> of helping performance there?
>>>>
>>>> If it hurts, then I see that you have a good reason to NAK this.
>>>>
>>>> It's hard to imagine how it would hurt, since you always need a copy
>>>> from sysram dumb buffers to VRAM - or do you?
>>>
>>> I have a number of concerns. My point it not that we shouldn't 
>>> optimize. I just don't want it in the kernel. Mgag200 can export 
>>> DRM_FORMAT_RGB888 for userspace to use.
>>
>> It already does, it's just userspace doesn't want to support it.
>>>
>>> AFAICT the main argument against userspace is that Mesa doesn't like 
>>> 3-byte pixels. But I don't see how this conversion cannot be a 
>>> post-processing step within Mesa: do the rendering in RGB32 and then 
>>> convert to a framebuffer in RGB24. Userspace can do that more 
>>> efficiently than the kernel. This has all of the upsides of reduced 
>>> bandwidth, but none of the downsides of kernel code. Applications 
>>> and/or Mesa would be in control of the buffer format and apply the 
>>> optimization where it makes sense. And it would be available for all 
>>> drivers that are similar to mgag200.
>>
>> For this particular case, user-space would use more memory and CPU, 
>> because the copy to VRAM is done on kernel side, and it is where the 
>> conversion must be done for maximum performances. So there is no way 
>> for userspace to be as efficient as the kernel in this use-case.
>>
>> For the conversion, the kernel allocate only 1 line, and convert/copy 
>> one line at a time. And because the CPU is out-of-order, it can start 
>> converting the next line using CPU registers while waiting for the bus.
> 
> Access is writecombined, so you cannot throw large amounts of data 
> towards the bus and do something else meanwhile.
> 
>>
>> Userspace would need to allocate a whole framebuffer, and can't use 
>> the "wasted" CPU cycle to do the conversion.
> 
> Yes, userspace would probably need a full extra framebuffer to store the 
> RGB32 data. But just as in the kernel, userspace can do format 
> conversion of only the damaged areas. No extra CPU overhead here.
> 
>>
>>>
>>> My main point is simplicity of the driver: I prefer the driver to be 
>>> simple without unnecessary indirection or overhead. Optimizations 
>>> like these my or may not work on a given system with a certain 
>>> workload. I'd better leave this heuristic to userspace.
>>
>> I agree that the driver is simpler without optimizing thing. But I 
>> think it's the role of the driver to get the maximum from the 
>> hardware, even if it's old and broken like g200. And userspace don't 
>> want to optimize for such hardware.
> 
> Optimization always depends on the workload; something that the driver 
> doesn't know. For example, as we mostly move the mouse cursor around the 
> screen, the damages areas are usually small. Optimizing this might be 
> pointless in any case.

So your point is we should not optimize because sometime it might not be 
necessary ? And even for cursor update, the conversion is still 25% faster.

> 
>>
>>>
>>> Another point of concern is CPU consumption: Slow I/O buses may stall 
>>> the display thread, but the CPU could do something else in the 
>>> meantime. Doing format conversion on the CPU prevents that, hence 
>>> affecting other parts of the system negatively. Of course, that's 
>>> more of a gut feeling than hard data.
>>
>> I think it's the reverse. Without dropping the X data, the CPU is 
>> actually stalling much longer sending useless bytes to the mgag200's 
>> VRAM. And the CPU can't do anything else while doing memcpy_toio().
> 
> Hyperthreading.

I still doubt a user-space conversion would do a better job than the kernel.
> 
> You are also arguing against XRGB in general, which is a different topic.

yes, the issue is human eyes only sees 3 colors, and it's not a power of 
two. So compromise have been made, and that Matrox card, is from the era 
of the transition from 16bits to 32bits, and works significantly better 
in 24bits. And it's probably the only remaining GPU with this problem.

> 
>> Using DMA is the only way to free the CPU during the copy, but it 
>> appears to be either broken or significantly slower on most mgag200 
>> hardware.
>>
>> I actually have made the work to support DMA, and I'm a bit sad it 
>> didn't work on all g200, so this optimization is really a last resort, 
>> on a really broken hardware.
>>
>>>
>>> Please note that the kernel's conversion code uses memory allocation 
>>> of intermediate buffers. We even recently had a discussion about 
>>> allocation overhead during display updates. Userspace can surely do a 
>>> better job at keeping such buffers around.
>>>
>>> And finally a note the hardware itself: on low-end hardware like 
>>> those Matrox chips, just switch to RGB16. That will be pretty and 
>>> fast enough for these chips' server systems. Anyone who cares about 
>>> fast and beautiful should buy a real graphics card.
>>
>> There are still sysadmin users that occasionally have to browse the 
>> web to find answer, or read their mail in a GUI client. It turns out 
>> that rgb16 is pretty ugly for today standard, and buying an external 
>> card would be a bit too much, and won't work for remote control.
> 
> I'm sure sysadmins have a computer for work with a decent GPU and don't 
> need to browse the web on their server systems.

The GUI applications also include graphical installer, that obviously 
you can't run on other system.
I do have bug reports, and I already fixed a few regressions in the 
mgag200 driver from this reports.
But if you think they shouldn't use this GPU, then why maintaining a 
driver in the first place ? Simpledrm is enough if you don't use graphics.

> 
> Best regards
> Thomas
> 
>>
>>
>> Best regards,
>>
> 

Best regards,

-- 

Jocelyn




