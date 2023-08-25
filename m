Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912507888C6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 15:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FB510E6A9;
	Fri, 25 Aug 2023 13:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C1E10E69B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692970609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voG+LDUyaTyIN1jll+QXOtMaWTzveGfMci5tolKLQvY=;
 b=YIl60envmNwS8Zo+9YIbJjLV658+6H3WTp7w+azBL6TWoqDtbn+dL+zkBHf86ENTASMObS
 CUDEMycUOUHUK7Pg5xm3cGJzdCoCN0F0iC4UxYBzEhkWTT/I9pzygDoMnmiXl7YXdvp3K3
 2eKWdhwaErihUkTdtRzMx2uUi8fqqd4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-OH7nbnW2MtS7o8PLLH5TjA-1; Fri, 25 Aug 2023 09:36:48 -0400
X-MC-Unique: OH7nbnW2MtS7o8PLLH5TjA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fe1dadb5d2so7235645e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692970606; x=1693575406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=voG+LDUyaTyIN1jll+QXOtMaWTzveGfMci5tolKLQvY=;
 b=GxU+xJlfA5nskBi2NO9IQvZvxfhHQMQcdWR+f76Ra25dZSfAzZT4/gayhLq9L2Ucbz
 lNFGIIDWyevYe7l/b4dFaKO69x9Ktdwr97BsIaMghB1ySJaP0P+37j6i2FaXSWChvfNV
 304uVh8vOol/+RNhbVCzAVV/Zi6V5LstY8pUua1UNT+yXnW+u3+wZfNzn9Y6Y4Eaxezl
 aAhhQqHJJGY5MRQSg1V/UupKHOrQ8kb+QVpl/19x4jdW9grEIq7tsoepzCsn5G4CZIlN
 ceCnmkXIMGwUKiLI3rDBnP3rIzNog8t9Da+bGx2+3Pmmxcvvv+cGXAKQTvR8Zj41+bLs
 gM9Q==
X-Gm-Message-State: AOJu0Yz5lLXdD4U2Z0q8q8Tm1IsYv4IK7biaPILWV4dxWnZPVLuQfHZ0
 9dEWpntSzfSV1l13Jc2tmiWNrdVRmPyQk4q/nqByHLr11VQlgXCw8DYFgiSbsDMd56B28SrjXSH
 BgNneDyocvkrzoGTETFj1+mtJNman
X-Received: by 2002:adf:fc82:0:b0:314:124f:12be with SMTP id
 g2-20020adffc82000000b00314124f12bemr14441225wrr.3.1692970606621; 
 Fri, 25 Aug 2023 06:36:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVQJTZ6cngP0c/s+C6Od4LjljUuviPAY1ZEcaTS4ihejOIB09UjCr3fdPl32JHPwkX2cPLpw==
X-Received: by 2002:adf:fc82:0:b0:314:124f:12be with SMTP id
 g2-20020adffc82000000b00314124f12bemr14441206wrr.3.1692970606259; 
 Fri, 25 Aug 2023 06:36:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:329d:db81:ed0c:c9cd?
 ([2a01:e0a:d5:a000:329d:db81:ed0c:c9cd])
 by smtp.gmail.com with ESMTPSA id
 p8-20020adfe608000000b003197efd1e7bsm2253198wrm.114.2023.08.25.06.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Aug 2023 06:36:45 -0700 (PDT)
Message-ID: <a8f2fd20-7f9e-9acc-7e03-0f2619c58ac8@redhat.com>
Date: Fri, 25 Aug 2023 15:36:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/plane: Add documentation about software color
 conversion.
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230825085545.168290-1-jfalempe@redhat.com>
 <20230825150319.015f59df@eldfell>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230825150319.015f59df@eldfell>
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
Cc: tzimmermann@suse.de, javierm@redhat.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/08/2023 14:03, Pekka Paalanen wrote:
> On Fri, 25 Aug 2023 10:55:35 +0200
> Jocelyn Falempe <jfalempe@redhat.com> wrote:
> 
>> After discussions on IRC, the consensus is that the DRM drivers should
>> avoid software color conversion, and only advertise the formats supported
>> by hardware.
>> Update the doc accordingly so that the rule and exceptions are clear for
>> everyone.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_plane.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
> 
> Hi,
> 
> thanks for revising the patch!
> 
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 24e7998d1731..7215521afddd 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -140,6 +140,25 @@
>>    *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
>>    *     various bugs in this area with inconsistencies between the capability
>>    *     flag and per-plane properties.
>> + *
>> + *     All drivers must support XRGB8888, even if the hardware cannot support
> 
> Maybe "should" rather than "must"?
> 
> If a driver that never supported XRGB8888 before continues to not
> support it, I would not count it as a bug.

Yes, that's fair.
> 
>> + *     it. This has become the de-facto standard and a lot of user-space assume
>> + *     it will be present. If XRGB8888 is not natively supported, then it
>> + *     shouldn't be the default for preferred depth or fbdev emulation.
>> + *
>> + *     DRM drivers should not do software color conversion in dumb buffers, and
> 
> This seems to be the opposite of what I was trying to say. In my
> opinion:
> 
> Dumb buffers are the only type of buffers where software color
> conversion could be expected. I would never expect software color
> conversion with non-dumb buffers or buffers imported from another
> device.

Sorry, I completely misunderstood this part, I will fix that in v3

> 
> But it has a catch: if software color conversion is needed, the dumb
> buffers are better be allocated in sysram. The conversion performance
> would likely be abysmal if dumb buffers were allocated from discrete
> VRAM.

I think that depends on hardware. Sometime VRAM can be faster than 
system RAM, even when accessed from CPU, like in Haswell Iris Pro GPU, 
which have 128M of eDRAM on the chip: 
https://www.anandtech.com/show/6993/intel-iris-pro-5200-graphics-review-core-i74950hq-tested/3
(it's not a good example, because the eDRAM is used as an L4 cache, but 
they may have dedicated it to the GPU).
But I agree that for the most common case of slow VRAM (read) access, 
doing the color conversion directly on it is not recommended.

> 
>> + *     only advertise the formats they support in hardware. This is for
>> + *     performance reason, and to avoid multiple conversions in userspace and
>> + *     kernel space.
> 
> Maybe also add:
> 
> KMS page flips are generally expected to be very cheap operations.

Yes I will add this.
> 
>> + *     But there are two exceptions:
>> + *     * To support XRGB8888 if it's not supported by the hardware.
>> + *     * Any driver is free to modify its internal representation of the format,
>> + *       as long as it doesn't alter the visible content in any way. An example
>> + *       would be to drop the padding component from a format to save some memory
>> + *       bandwidth.
> 
> This is fine as long as no-one can mistake this to refer to in-place
> conversion. The driver must not modify the userspace submitted buffer's
> contents.

I think that's what "alter the visible content" means, modifying the 
user-space buffer would be "visible" from that user.
But I will still add this precision in v3.

> 
>> + *     Extra care should be taken when doing software conversion with
>> + *     DRM_CAP_DUMB_PREFER_SHADOW, there are more detailed explanation here:
>> + *     https://lore.kernel.org/dri-devel/20230818162415.2185f8e3@eldfell/
>>    */
>>   
>>   static unsigned int drm_num_planes(struct drm_device *dev)
>>
>> base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
> 
> 
> Thanks,
> pq


Thanks,

-- 

Jocelyn

