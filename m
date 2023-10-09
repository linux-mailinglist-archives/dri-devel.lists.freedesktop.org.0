Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899587BE213
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 16:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A843910E138;
	Mon,  9 Oct 2023 14:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94C910E138
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696860334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDXk8taBwSWSK683ToKoArxtWiGVQ89gBwrjCk9FGmI=;
 b=g0hlM57PK2zZKFxbKTMakNkpdtBHYYDz1KgwjMe6qWDFn8eZwYzA3QM/+D/y07h7is78bU
 Dul57aKGLXtyd5SdoX8KOVI6KEOvCzjccMYqa2W0qzHNGAATFo+u9gz3yKcL/7EwN6G0hZ
 3D6ddvqIT7KJxD7b+bgRFKzbyGnksVM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-gYFrJ_MIMhu74Ys6PT3WiQ-1; Mon, 09 Oct 2023 10:05:23 -0400
X-MC-Unique: gYFrJ_MIMhu74Ys6PT3WiQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fef3606d8cso33299645e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 07:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696860322; x=1697465122;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WDXk8taBwSWSK683ToKoArxtWiGVQ89gBwrjCk9FGmI=;
 b=X4e2OWn7Fb4R7ryBtBNn7e/aalsdRLBEY71mbM+75CBdz6sz20IqzqCtj4DKmJtsh8
 K5JJYfytk1NWdBStS6DG5duZ+ffno7PPbODjwkU2VyBoxeeYkee2sFcneS9Bdqir8xDH
 ngxuNN1msSPMi8dqlwFpZ9wkyIVzs6uyY54oA10eFh3nwnhqLsUvwLlEu0bAOtI8aBlg
 UcdcPEBWZfMzy34drxl9ojukZuSKxolG4+z3FcENNRHLx7fWbO/STDLXBYd50rpMafWU
 qgWIi9IZcUhqtkpHhLxuaejvykggDi1gVAe5vO4BSfRyUlMdxXKIIH+sP+x0WEFjaSYN
 BvXw==
X-Gm-Message-State: AOJu0YzCYEyw6js/OmKUy8e+vawQYkwhsmMyBzK1Zmt2aINMopwW3tLU
 w+BNLgesG6pTkr6St0IdEf2YWqp8FCI0aCmLtL4ZgwO1Bh/Uj+al3mFvxRKS8KuNYB34/P2Ghxb
 zpJOHEXwGyJg8cgMbF/9yXTdMhLpE
X-Received: by 2002:a1c:7918:0:b0:406:5303:9be2 with SMTP id
 l24-20020a1c7918000000b0040653039be2mr13837853wme.0.1696860321697; 
 Mon, 09 Oct 2023 07:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWgd3wxfQtcQIYWi542+yGMEAMJVgB/Io4xFMx5qDPPxkWCgss16wwEDgsEm/QEXF4L385zQ==
X-Received: by 2002:a1c:7918:0:b0:406:5303:9be2 with SMTP id
 l24-20020a1c7918000000b0040653039be2mr13837791wme.0.1696860320553; 
 Mon, 09 Oct 2023 07:05:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c224400b003fe2b081661sm13623586wmm.30.2023.10.09.07.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 07:05:20 -0700 (PDT)
Message-ID: <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
Date: Mon, 9 Oct 2023 16:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
To: Maxime Ripard <mripard@kernel.org>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, tzimmermann@suse.de,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 13:33, Maxime Ripard wrote:
> On Mon, Oct 09, 2023 at 11:48:29AM +0200, Jocelyn Falempe wrote:
>> On 09/10/2023 10:28, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, Oct 09, 2023 at 09:47:49AM +0200, Jocelyn Falempe wrote:
>>>> On 06/10/2023 18:54, Noralf Trønnes wrote:
>>>>>
>>>>>
>>>>> On 10/6/23 16:35, Maxime Ripard wrote:
>>>>>> Hi Jocelyn,
>>>>>>
>>>>>> On Thu, Oct 05, 2023 at 11:16:15AM +0200, Jocelyn Falempe wrote:
>>>>>>> On 05/10/2023 10:18, Maxime Ripard wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On Tue, Oct 03, 2023 at 04:22:45PM +0200, Jocelyn Falempe wrote:
>>>>>>>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>>>>>>> index 89e2706cac56..e538c87116d3 100644
>>>>>>>>> --- a/include/drm/drm_drv.h
>>>>>>>>> +++ b/include/drm/drm_drv.h
>>>>>>>>> @@ -43,6 +43,7 @@ struct dma_buf_attachment;
>>>>>>>>>      struct drm_display_mode;
>>>>>>>>>      struct drm_mode_create_dumb;
>>>>>>>>>      struct drm_printer;
>>>>>>>>> +struct drm_scanout_buffer;
>>>>>>>>>      struct sg_table;
>>>>>>>>>      /**
>>>>>>>>> @@ -408,6 +409,19 @@ struct drm_driver {
>>>>>>>>>      	 */
>>>>>>>>>      	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>>>>>>>> +	/**
>>>>>>>>> +	 * @get_scanout_buffer:
>>>>>>>>> +	 *
>>>>>>>>> +	 * Get the current scanout buffer, to display a panic message with drm_panic.
>>>>>>>>> +	 * It is called from a panic callback, and must follow its restrictions.
>>>>>>>>> +	 *
>>>>>>>>> +	 * Returns:
>>>>>>>>> +	 *
>>>>>>>>> +	 * Zero on success, negative errno on failure.
>>>>>>>>> +	 */
>>>>>>>>> +	int (*get_scanout_buffer)(struct drm_device *dev,
>>>>>>>>> +				  struct drm_scanout_buffer *sb);
>>>>>>>>> +
>>>>>>>>
>>>>>>>> What is the format of that buffer? What is supposed to happen if the
>>>>>>>> planes / CRTC are setup in a way that is incompatible with the buffer
>>>>>>>> format?
>>>>>>>
>>>>>>> Currently, it only supports linear format, either in system memory, or
>>>>>>> iomem.
>>>>>>> But really what is needed is the screen size, and a way to write pixels to
>>>>>>> it.
>>>>>>> For more complex GPU, I don't know if it's easier to reprogram the GPU to
>>>>>>> linear format, or to add a simple "tiled" support to drm_panic.
>>>>>>> What would you propose as a panic interface to handle those complex format ?
>>>>>>
>>>>>> It's not just about tiling, but also about YUV formats. If the display
>>>>>> engine is currently playing a video at the moment, it's probably going
>>>>>> to output some variation of multi-planar YUV and you won't have an RGB
>>>>>> buffer available.
>>>>>>
>>>>>
>>>>> I had support for some YUV formats in my 2019 attempt on a panic
>>>>> handler[1] and I made a recording of a test run as well[2] (see 4:30 for
>>>>> YUV). There was a discussion about challenges and i915 can disable
>>>>> tiling by flipping a bit in a register[3] and AMD has a debug
>>>>> interface[4] they can use to write pixels.
>>>>
>>>> I only added support for the format used by simpledrm, because I don't want
>>>> to add support for all possible format if no driver are using it.
>>>
>>> Sure.
>>>
>>>> It should be possible to add YUV format too.
>>>>
>>>> I also prefer to convert only the foreground/background color, and then
>>>> write directly into the buffers, instead of converting line by line.
>>>> It works for all format where pixel size is a multiple of byte.
>>>
>>> My point was that there might not be a buffer to write to.
>>> DMA_ATTR_NO_KERNEL_MAPPING exists, dma-buf might be unaccessible, unsafe
>>> or be completely out of control of the kernel space, or even not be
>>> accessible by the system at all (when doing secure playback for example,
>>> where the "trusted" component will do the decoding and will only give
>>> back a dma-buf handle to a secure memory buffer).
>>>
>>> I appreciate that we probably don't want to address these scenarios
>>> right now, but we should have a path forward to support them eventually.
>>> Copying the panic handler content to the buffer is optimistic and won't
>>> work in all the scenarios described above, pretty much requiring to
>>> start from scratch that effort.
>>>
>>>>> https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/
>>>>> [2] https://youtu.be/lZ80vL4dgpE
>>>>> [3]
>>>>> https://lore.kernel.org/dri-devel/20190314095004.GP2665@phenom.ffwll.local/
>>>>> [4]
>>>>> https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac7@amd.com/
>>>>>
>>>>>> Same story if you're using a dma-buf buffer. You might not even be able
>>>>>> to access that buffer at all from the CPU or the kernel.
>>>>>>
>>>>>> I really think we should have some emergency state ready to commit on
>>>>>> the side, and possibly a panic_commit function to prevent things like
>>>>>> sleeping or waiting that regular atomic_commit can use.
>>>>>>
>>>>>> That way, you know have all the resources available to you any time.
>>>>
>>>> I think reusing the atomic commit functions might be hard, because there are
>>>> locks/allocation/threads hidden in drivers callback.
>>>
>>> Allocations are bugs as far as I'm concerned. Allocations in
>>> atomic_commit path are pretty big hint that you're doing something wrong
>>> so I wouldn't worry too much about them. For locking, yeah... Which is
>>> why I was suggesting an emergency atomic_commit of some sorts (for
>>> planes only?). Switching back to whatever we were doing to an RGB plane
>>> should be simple enough for most drivers and probably can be done safely
>>> enough on most drivers without any locks.
>>>
>>> And you don't need to support all kinds of tiling, YUV or RGB variants.
>>
>> So if I understand correctly, drm_panic would pre-allocate a plane/commit,
>> and use that when a panic occurs ?
> 
> And have it checked already, yes. We would only wait for a panic to
> happen to pull the trigger on the commit.
> 
>> I have two concern about this approach:
>> - How much memory would be allocated for this ? a whole framebuffer can be
>> big for just this use case.
> 
> I'dd expect a whole framebuffer for the current
> configuration/resolution. It would be typically 4MB for a full-HD system
> which isn't a lot really and I guess we can always add an option to
> disable the mechanism if needed.

Ok, that's a bit big, but if there is no other way.

> 
>> - I find it risky to completely reconfigure the hardware in a panic handler.
> 
> I would expect to only change the format and base address of the
> framebuffer. I guess it can fail, but it doesn't seem that different to
> the async plane update we already have and works well.
> 
In this case it can work, but by using generic drm api, it's hard to 
know what the driver will do.


>> Also how many drivers would need this ?
>>
>> Currently I was mostly considering x86 platform, so:
>>
>> simpledrm/ast/mgag200 which works well with the get_scanout_buffer().
>>
>> i915/amdgpu/nouveau, which are quite complex, and will need to do their own
>> thing anyway.
> 
> I guess we're not entirely aligned there then. I would expect that
> mechanism to work with any atomic KMS driver. You are right that i915,
> amdgpu and nouveau are special enough that some extra internal plumbing
> is going to be required, but I'd expect it to be easy to support with
> any other driver for a memory-mapped device.
> 
> I guess what I'm trying to say is, even though it's totally fine that
> you only support those drivers at first, supporting in vc4 for example
> shouldn't require to rewrite the whole thing.

Would that work for you to put that in a drm_panic_helper.c,
so that drivers can opt-in ?

So the driver can call a drm_panic_helper_prepare_commit() at 
initialization, and then in the get_scanout_buffer() function, run the 
atomic_update() on it, and return this commit's framebuffer ?

That way each driver have a better control on what the panic handler 
will do.
It can even call directly its internal functions, to avoid the locks of 
the drm generic functions, and make sure it will only change the format 
and base address.
That's a bit more work for each driver, but should be more reliable I think.

-- 

Jocelyn

> 
>>>> I'm more in favor of an emergency function, that each driver has to
>>>> implement, and use what the hardware can do to display a simple frame
>>>> quickly. get_scanout_buffer() is a good start for simple driver, but
>>>> will need refactoring for the more complex case, like adding a
>>>> callback to write pixels one by one, if there is no memory mapped
>>>> buffer available.
>>>
>>> Sorry, I'm not quite sure what you mean there, where would you write the
>>> pixel to?
>>
>> It was mentioned by Noralf, about the amdgpu driver:
>>
>> https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac7@amd.com/
>>
>> They have a slow "debug interface" that you can write to, and can be used
>> for the panic handler. It's not memory mapped, so you have to write pixels
>> one by one.
>>
>> So for the struct drm_scanout_buffer, I can add a function pointer to a
>> write_pixel(u32 x, u32 y, u32 color)
>> So if the iosys map is null, it will use that instead.
> 
> It would be nice to support indeed, but it's a fairly rare feature afaik
> so I'd rather focus on getting something that can work for everyone first
> 
> Maxime





