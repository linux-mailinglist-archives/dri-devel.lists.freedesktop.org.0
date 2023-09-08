Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EA7798814
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 15:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1781810E013;
	Fri,  8 Sep 2023 13:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF24710E013
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694180769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pBSIb2qkpHS66vwrmKL82k7Dp6DNkx4GY/yGwCNeCMA=;
 b=Rb66JxYZopXq+kVDdviqHIyF9Zi7lfXahKEilwXwAKHjHFi3mbmWTw+naeR5F0GwhGN+/M
 tYg50NBvF6FJDNRlG8g/F10iI4VmNCgYHZG12KHGm5K8ohWglNRmFEfjRjOUJEQf5y+ZRS
 t8U9e4Kgfm3ugRfVpuz9dx+oHh0I0g4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-0jPhIvztPiutKjv9aB3HMg-1; Fri, 08 Sep 2023 09:46:07 -0400
X-MC-Unique: 0jPhIvztPiutKjv9aB3HMg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-401ea9bf934so16226955e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 06:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694180766; x=1694785566;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pBSIb2qkpHS66vwrmKL82k7Dp6DNkx4GY/yGwCNeCMA=;
 b=S79ILzYVTeEsrLOXJPErPmv0B6VGHCA9YmOFLHEYir2KwTTsITwZQK4RTwyYzXW80R
 kKOiQP+eyzUOkrIbNol9AQfOHONzYIQCVzy2B0rM1zH8Cd1aEPsDm7FDjACOzl9pCKIe
 aRRoiespNsX2BxdTxfi0ETyJe0s4Vgf0LjbqSIHidfsPYo/5nUCCxFxTDniZz3RLFslV
 bROO6AKCbDnJhDJrIva22B3bSKE/GkjG0mIQ7fZqPCdvSVxzmWw6/bhMOd9njOIp2dsD
 bFvb1gZrU6PKI3WCvX0UTVq3CvPIRFpojXIf0puABwyczrELA6xHHd2hFsEIBSxX9poN
 nK2w==
X-Gm-Message-State: AOJu0YwDAPF2yqt0Jdipm0CeV9+4SIuuVBssAMiGxdnkSHsahok04Y7e
 myU+kV6euwJFjQ7/sMcqpGu0A8/KL0BxDV+U8deGDn+MEkcDRCqof6FqffVsTSEE4GvBOmDzY3t
 w8zNzBV2JtqCXm8Ley59jgCfJc0vj74cAFe0b
X-Received: by 2002:a7b:cd9a:0:b0:3fe:dd91:b5b6 with SMTP id
 y26-20020a7bcd9a000000b003fedd91b5b6mr2347203wmj.25.1694180766228; 
 Fri, 08 Sep 2023 06:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyDgK/SKf2CMQFaT/r1slfqqS1ikiXOYdkkOQokF2RMiGCV3ibbRJVEhmuCkubJUzzBWoSJA==
X-Received: by 2002:a7b:cd9a:0:b0:3fe:dd91:b5b6 with SMTP id
 y26-20020a7bcd9a000000b003fedd91b5b6mr2347177wmj.25.1694180765790; 
 Fri, 08 Sep 2023 06:46:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c260d00b003fe4ca8decdsm5266862wma.31.2023.09.08.06.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 06:46:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
In-Reply-To: <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
 <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
Date: Fri, 08 Sep 2023 15:46:04 +0200
Message-ID: <87ledg3hib.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Maxime
>
> Am 08.09.23 um 12:58 schrieb Maxime Ripard:
>> Hi,
>> 
>> On Fri, Sep 08, 2023 at 11:21:51AM +0200, Thomas Zimmermann wrote:
>>> Am 25.08.23 um 16:04 schrieb Jocelyn Falempe:
>>> [...]
>>>> + *
>>>> + *     But there are two exceptions only for dumb buffers:
>>>> + *     * To support XRGB8888 if it's not supported by the hardware.
>>>
>>>
>>>> + *     * Any driver is free to modify its internal representation of the format,
>>>> + *       as long as it doesn't alter the visible content in any way, and doesn't
>>>> + *       modify the user-provided buffer. An example would be to drop the
>>>> + *       padding component from a format to save some memory bandwidth.
>>>
>>> I have strong objections to this point, _especially_ as you're apparently
>>> trying to sneak this in after our discussion.
>> 
>> I think it's an unfair characterization. This was discussed on
>> #dri-devel, and went through several rounds over the mailing lists, with
>> you in Cc for each. How is that sneaking something in?
>
> A few months ago, we had a flamewar'ish IRC discussion on format 
> conversion within the kernel. The general sentiment was that the kernel 
> drivers should use what ever is provided by userspace without further 
> processing. The short argument was 'userspace knows better'. The only 
> exception is for supporting XRGB8888 on hardware that would otherwise 
> not support it. After some consideration, I agree with all that. (Back 
> then I didn't.)
>
> A few weeks ago I received a patch to do an implicit conversion from 
> XRGB8888 to RGB888 within mgag200. [1] I don't have a link to the 
> discussion, but I NAK'ed that patch pretty hard on IRC by following that 
> other discussion.
>
> And know I find that this patch (even in its v1) contains language that 
> retroactively legitimizes the mgag200 patch. I wrote 'apparently' I my 
> reply, as I assume that there's more to it, but how does it not look 
> like an attempt to sneak in something that is known to be controversial?
>

While is true that the motivation for Jocelyn's patch was to make explicit
what are the rules with regard to drivers emulating formats (other than
"we had a flamewar on IRC a while back" which is quite ambiguous), it was
not attempt to sneak something that is known to be controversial.

In fact, it is an attempt to dispel the controversy and document what is
acceptable and what is not for a driver.

> It might have been better to discuss the question separately on the 
> dri-devel ML. Maybe we can do this here.
>

This was discussed in the #dri-devel IRC channel, I believe you were on
PTO at the time and probably that's why you missed. I found the logs here:

https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2023-08-04

As you can see there, most people agreed that what Jocelyn wrote in his
doc patch is the most pragmatic compromise.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

