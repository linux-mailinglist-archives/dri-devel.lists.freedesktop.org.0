Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D853784627
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D705210E3A1;
	Tue, 22 Aug 2023 15:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A89E10E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692719355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCUIuN77mVkrFQtJjww1TislQYuqFEqvYeKP/hvXMys=;
 b=Uy8S68eRaenvkf4xV8iD2YsCq4hEp/IEdC8ixK/YMcG7j+yNdwQHZL0qw1ry09+2GJx5Yq
 nlKqkGKCZqAiwGWmbUB0+lC67gmJsrvRqcOpSqz9ZTQLZcYzLdZIryLU+5qic8ngeRvQal
 fRKKj36wXo+OVF1b1JYvuZI/zh5nnIs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-GGQ1HGhPOSup1S428GmWkQ-1; Tue, 22 Aug 2023 11:49:12 -0400
X-MC-Unique: GGQ1HGhPOSup1S428GmWkQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31c5c762f97so1103388f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692719351; x=1693324151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aCUIuN77mVkrFQtJjww1TislQYuqFEqvYeKP/hvXMys=;
 b=LIyH4XOTi6j3f88Otzh012IajL30fQh5f/7futE2SN+dMBHyn12SXxd+FO87p9lbRK
 hXZIqUf0WnMs2F82vZDUr+LiUqAGEPNDHrZCfz/mXGKokP+90HCOcJ0PT/OvFYDHRZxm
 0xMpSopUazuw3trAWoGxcS1Oa5yN8hFtXsKMXY/l320OJogntaymXFirMB6uSH6iHlSO
 okFiU9M/nKglNmguuND7f6mTmq757+piYs9OAkxC6lFGOlzz0i2xZm9eeW1aFhYzquIC
 Vkpgx3g1BOcURN26TcaJnluQXv3ENqNWNdbvsDxwYh/nUGbCNTMicBYaoFree1OPWKbX
 hDJg==
X-Gm-Message-State: AOJu0YyG/XPo/vLHYlzFn6jNTlgHaYWs9iFrDK0aPvK848BSBiaPAe9c
 Eru4O2ObeAKIkntP3GYKfyMfq3Jg+ILIXSOarhwc7Nx9iCm9Ujxrqo4zHzMVtrf/uUWftNruWx6
 Q7KRuZSMRklE1sCnupaOEM40w2c2r
X-Received: by 2002:adf:fb87:0:b0:317:5ece:e169 with SMTP id
 a7-20020adffb87000000b003175ecee169mr7358269wrr.68.1692719350833; 
 Tue, 22 Aug 2023 08:49:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4YTvBR0uwcfkHQX5tzcpEu5iNqjmUnhjRHaXdlW80xrcl9S3YgkNbbNALcNF8I3Rd6EfeoA==
X-Received: by 2002:adf:fb87:0:b0:317:5ece:e169 with SMTP id
 a7-20020adffb87000000b003175ecee169mr7358254wrr.68.1692719350411; 
 Tue, 22 Aug 2023 08:49:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:329d:db81:ed0c:c9cd?
 ([2a01:e0a:d5:a000:329d:db81:ed0c:c9cd])
 by smtp.gmail.com with ESMTPSA id
 n16-20020adfe790000000b0030ae53550f5sm16079660wrm.51.2023.08.22.08.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 08:49:09 -0700 (PDT)
Message-ID: <b2074198-2176-5e63-ce18-02bb14ea5749@redhat.com>
Date: Tue, 22 Aug 2023 17:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
To: Pekka Paalanen <ppaalanen@gmail.com>, Maxime Ripard <mripard@kernel.org>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
 <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
 <20230818162415.2185f8e3@eldfell>
 <36prxupvl72tmamorquaunss27kckoq5zegmrwxdr3v3ynqz4s@xiypdbs4pbga>
 <20230822112004.3599df53@eldfell>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230822112004.3599df53@eldfell>
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
Cc: tzimmermann@suse.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2023 10:20, Pekka Paalanen wrote:
> On Mon, 21 Aug 2023 17:55:33 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> 
>> Hi Pekka,
>>
>> Thanks for answering
>>
>> On Fri, Aug 18, 2023 at 04:24:15PM +0300, Pekka Paalanen wrote:
>>> On Thu, 10 Aug 2023 09:45:27 +0200
>>> Maxime Ripard <mripard@kernel.org> wrote:
>>>> On Mon, Aug 07, 2023 at 03:45:15PM +0200, Jocelyn Falempe wrote:
>>>>> After discussions on IRC, the consensus is that the DRM drivers should
>>>>> not do software color conversion, and only advertise the supported formats.
>>>>> Update the doc accordingly so that the rule and exceptions are clear for
>>>>> everyone.
>>>>>
>>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>>> ---
>>>>>   include/uapi/drm/drm_fourcc.h | 7 +++++++
>>>>>   1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>>>>> index 8db7fd3f743e..00a29152da9f 100644
>>>>> --- a/include/uapi/drm/drm_fourcc.h
>>>>> +++ b/include/uapi/drm/drm_fourcc.h
>>>>> @@ -38,6 +38,13 @@ extern "C" {
>>>>>    * fourcc code, a Format Modifier may optionally be provided, in order to
>>>>>    * further describe the buffer's format - for example tiling or compression.
>>>>>    *
>>>>> + * DRM drivers should not do software color conversion, and only advertise the
>>>>> + * format they support in hardware. But there are two exceptions:
>>>>
>>>> I would do a bullet list here:
>>>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#lists-and-quote-like-blocks
>>>>    
>>>>> + * The first is to support XRGB8888 if the hardware doesn't support it, because
>>>>> + * it's the de facto standard for userspace applications.
>>>>
>>>> We can also provide a bit more context here, something like:
>>>>
>>>> All drivers must support XRGB8888, even if the hardware cannot support
>>>> it. This has become the de-facto standard and a lot of user-space assume
>>>> it will be present.
>>>>    
>>>>> + * The second is to drop the unused bits when sending the data to the hardware,
>>>>> + * to improve the bandwidth, like dropping the "X" in XRGB8888.
>>>>
>>>> I think it can be made a bit more generic, with something like:
>>>>
>>>> Any driver is free to modify its internal representation of the format,
>>>> as long as it doesn't alter the visible content in any way. An example
>>>> would be to drop the padding component from a format to save some memory
>>>> bandwidth.
>>>
>>> to my understanding and desire, the rule to not "fake" pixel format
>>> support is strictly related to performance. When a KMS client does a
>>> page flip, it usually does not expect a massive amount of CPU or GPU
>>> work to occur just because of the flip. A name for such work is "copy",
>>> referring to any kind of copying of large amounts of pixel data,
>>> including a format conversion or not.
>>
>> Should we add that to the suggested documentation that it shouldn't
>> degrade performance and shouldn't be something that the userspace can
>> notice?
> 
> I would let Sima (or Simon Ser) answer that, and verify my
> understanding too.
> 
>>> This is especially important with GPU rendering and hardware video
>>> playback systems, where any such copy could destroy the usability of
>>> the whole system. This is the main reason why KMS must not do any
>>> expensive processing unexpectedly (as in, not documented in UAPI).
>>> Doing any kind of copy could cause a vblank to be missed, ruining
>>> display timings.
>>>
>>> I believe the above is the spirit of the rule.
>>
>> That's totally reasonable to me :)
>>
>>> Then there will be exceptions. I'd like to think that everything below
>>> (except for XRGB8888) can be derived from the above with common sense
>>> - that's what I did.
>>>
>>> XRGB8888 support is the prime exception. I suspect it originates from
>>> the legacy KMS UAPI, and the practise that XRGB8888 has been widely
>>> supported always. This makes it plausible for userspace to exist that
>>> cannot produce any other format. Hence, it is good to support XRGB8888
>>> through a conversion (copy) in the kernel for dumb buffers (that is,
>>> for software rendered framebuffers). I would be very hesitant to extend
>>> this exception to GPU rendered buffers, but OTOH if you have a GPU,
>>> presumably you also have a display controller capable of scanning out
>>> what the GPU renders, so you wouldn't even consider copying under the
>>> hood.
>>>
>>> DRM devices that cannot directly scan out buffers at all are a whole
>>> category of exceptions. They include USB display adapters (literal USB,
>>> not USB-C alt mode), perhaps networked and wireless displays, VKMS
>>> which does everything in software, and so on. They simply have to
>>> process the bulk pixel data with a CPU one way or another, and
>>> hopefully they make use of damage rectangles to minimise the work.
>>>
>>> Old-school special cursor planes may have been using special pixel
>>> formats that may not be supported by userspace. Cursors are usually
>>> small images and they can make a huge performance impact, so it makes
>>> sense to support ARGB8888 even with a CPU conversion.
>>>
>>> Then we have display controllers without GPUs. Everything is
>>> software-rendered. If it so happens that software rendering into sysram
>>> and then copying (with conversion) into VRAM is more performant than
>>> rendering into VRAM, then the copy is well justified.
>>>
>>> Software-rendering into sysram and then copying into VRAM is actually
>>> so commonly preferred, that KMS has a special flag to suggest userspace
>>> does it: DRM_CAP_DUMB_PREFER_SHADOW [1]. A well-behaved
>>> software-rendering KMS client checks this flag and honours it. If a
>>> driver both sets the flag, and copies itself, then that's two copies
>>> for each flip. The driver's copy is unexpected, but is there a good
>>> reason for the driver to do it?
>>>
>>> I can only think one reason: hardware scanout pixel format being one
>>> that userspace cannot reasonably be expected to produce. I think
>>> nowadays RGB888 (the literally 3 bytes per pixel) format counts as one.
>>
>> I guess any tiled format would count there too, right?
> 
> Only if the display controller is unable to read a linear format, or
> some other extremely pressing reason that makes the use of a linear
> format infeasible, e.g. hardware bugs or prohibitive memory bandwidth
> usage. That would be very surprising though, given that all video
> signal formats I know about scan in a linear fashion, meaning that any
> other framebuffer layout would cause complications like needing lots of
> CRTC pixel buffer memory.
> 
> In short, I think not.
> 
> Sub-sampled YUV is another matter, but I assume you meant non-linear
> DRM format modifiers rather than just YUV layouts.
> 
> Again, there could be exceptions in ancient hardware. I recall hearing
> that some hardware might have stored pixels as "bit planes", meaning
> that in memory you have a bit plane after a bit plane, and each bit
> plane contains one specific bit of all pixels in the image. We do not
> have DRM format codes nor modifiers to express such layout that I know
> of, so under-the-hood driver conversion would be appropriate since I
> don't think any software would want to produce such images today.
> 
>>> If hardware requires RGB888 to e.g. reach a specific resolution, should
>>> the driver set DRM_CAP_DUMB_PREFER_SHADOW or not? If the driver always
>>> allocates sysram as dumb buffers because there simply is not enough
>>> VRAM to give out, then definitely not. That is a very good reason for
>>> the driver to do a copy/conversion with damage under the hood. It
>>> sucks, but it's the only way it can work.
>>>
>>> But if the dumb buffers are allocated in VRAM, then
>>> DRM_CAP_DUMB_PREFER_SHADOW should likely be set because direct VRAM
>>> access tends to be slow, and the driver should not copy - unless maybe
>>> for XRGB8888 and cursors. A CPU copy from VRAM into VRAM is the worst.
>>>
>>> For RGB888 hardware and software rendering, it would be best if:
>>>
>>> - Dumb buffers are allocated from VRAM, making them directly
>>>    scanout-able for RGB888.
>>>
>>> - DRM_CAP_DUMB_PREFER_SHADOW is set, telling userspace to render into a
>>>    shadow and then copy into a dumb buffer.
>>>
>>> - Userspace's copy into a dumb buffer produces RGB888, while the shadow
>>>    buffer can be of any format userspace likes.
>>>
>>> This minimises the amount of work done, and page flips are literal
>>> flips without a hidden copy in the driver.
>>>
>>> If userspace does not support RGB888, things get hairy. If XRGB8888 is
>>> faked via a driver copy, then you would not want to be copying from
>>> VRAM into VRAM. Create-dumb ioctl passes in bpp, so the driver could
>>> special-case 24 vs. 32 I guess, allocating 24 from VRAM and 32 from
>>> sysram. But do you set DRM_CAP_DUMB_PREFER_SHADOW? It would always be
>>> wrong for the other format.
>>>
>>> Ideally, XRGB8888 would be supported without artificially crippling
>>> more optimal pixel formats by lack of DRM_CAP_DUMB_PREFER_SHADOW, even
>>> if XRGB8888 support is fake and hurt by DRM_CAP_DUMB_PREFER_SHADOW. But
>>> that also depends on the expected userspace, which format does it use.
>>
>> Jocelyn, I think we should have a link to that mail too in the doc
>> you've written.
>>
>> Pekka, it's not clear to me though if what you wrote here are changes
>> you would like on the original patch, or if it's just general thoughts?
> 
> It is my understanding of the matter and of the background. Take from it
> what you feel is important. The proposed patch is not wrong, but it is
> perhaps a bit too simple description, like not limiting CPU conversions
> to dumb buffers, and ignoring the worst case: dumb buffers in VRAM +
> CPU conversion which would have utterly horrible performance. I feel
> the interaction with DRM_CAP_DUMB_PREFER_SHADOW is important to note.

Yes, I will add the dumb buffer limitation, and a paragraph about 
DRM_CAP_DUMB_PREFER_SHADOW in v2.
I can also add a link to this mail thread.

> 
> I'm not sure what should be documented of it.
> 
> Also, things like the Pixman library support conversions between tons
> of pixel formats, and is able to use hand-tuned SSE, vector and whatnot
> instructions in order to optimise conversions. I doubt you could reach
> that level of flexibility and performance in-kernel.
> 
> In the XRGB8888 to RGB888 case, the kernel doing the conversion may
> allow for higher resolutions, but it may also hurt framerate more than
> userspace doing conversion, theoretically. For lower resolution where
> XRGB8888 could be scanned out directly from VRAM, the conversion would
> be strictly hurting.
> 
I think that depends on the hardware. For the Matrox, the bandwidth 
between system RAM and VRAM is so low, that doing the conversion is much 
faster than copying XRGB8888 to the VRAM. It also uses less CPU cycles, 
because the copy is done with memcpy(), (DMA is broken or even slower on 
most mgag200 hardware).
To get numbers, on my test machine, copying the 5MB framebuffer XRGB8888 
to VRAM takes 125ms. Copying 3.75MB RGB888 framebuffer takes 95ms. The 
conversion has no measurable impact, as it is done on the fly during the 
memcpy, when the CPU is waiting for the bus to accept more data.
Doing the conversion in user-space would actually be slower, even with 
SSE, because they won't use the "wasted" cpu cycle. But anyway the 
conversion can take a few micro-seconds on the CPU, which is still 
negligible compared to the memory transfer.

> 
> Thanks,
> pq

Before sending the v2, Simon Ser proposed to move the paragraph to 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_plane.c#L132 
instead of fourcc.h.
I'm wondering what other thinks about this.

Thanks,

-- 

Jocelyn

