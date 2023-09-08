Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E81798842
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023F110E03B;
	Fri,  8 Sep 2023 14:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE0710E03B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694181999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjkVYP20Q7AtofZ1Dx8phojUZ9XbQddsJ54Bw1e9HQw=;
 b=iDaDEkHh5I1EH5YBBGC1Jp/SfqtI18/VvhVI3JMPTBaRyVSEXVtsfRJfa1DKGfz2X1Ehe1
 dwgAlatBcDQOII24MdGV6yGPI+cWZjlhKf1LhDEwR31Ho6NJIAangvzaSTRDeS+vy7u9vv
 VqAR3Dtj6PURXt/dXoAgdkPucpQql9Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-qG1FRTOyMKO8uIlk_by8Ew-1; Fri, 08 Sep 2023 10:06:37 -0400
X-MC-Unique: qG1FRTOyMKO8uIlk_by8Ew-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-402493d2997so14317085e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 07:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694181996; x=1694786796;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HjkVYP20Q7AtofZ1Dx8phojUZ9XbQddsJ54Bw1e9HQw=;
 b=dx/yk7nNL2kIDUBqVmzNRc21PMzbZSTIiHiOK9hrnR4+Mj7y14TFew04NKKkJygTIA
 acMQ7DZpLRBCSe5eJWb8Hx7cpUiVWNuvDreZZ6GYZxzbP34GJRZ2XzFlGrIHbbHXrPgH
 Q5fOfSxBULV1NhHXrINdfuf5uLID9ZiOmwgy7cZIDKxzGRYXAv/BDOhNZqHCVNC4fxaz
 T6OKIgOW18ayRM6ky9Hakb0egPpWbRRL0YsYXSTGaJ25pGn9YeesMFcmNYho1tVc7UBS
 qmQTnwBAjqZZwmV8p3Dt79RHdDoYSmxwI7v60PjfmXcyGYN2711nmsdxT13j5dDj/l4g
 sSSw==
X-Gm-Message-State: AOJu0YzbANUTI9NmdKfSQGZZ+bfwvJX37JrSdPTo+SbzBrzHGb4CnoQl
 rurt2WqNwSLUEJDHFCc/7/sOdufQepLsdJeFCujCD8BqqQ6NnD2xge5x+Dm+DXLeSIeFyM2IzCn
 yHskTOo/8OVGGq7zEly77q6ug4sLOXui7Vv9A
X-Received: by 2002:a7b:c4d8:0:b0:401:5443:5591 with SMTP id
 g24-20020a7bc4d8000000b0040154435591mr2181192wmk.20.1694181996470; 
 Fri, 08 Sep 2023 07:06:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoe1GkDP+XDQIig6PMhmNUbDKymtx4MTWkmZpdo4/8UsWHo6qAaXmkRWpC9sMI0bjyjy5Djg==
X-Received: by 2002:a7b:c4d8:0:b0:401:5443:5591 with SMTP id
 g24-20020a7bc4d8000000b0040154435591mr2181176wmk.20.1694181996120; 
 Fri, 08 Sep 2023 07:06:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b00317b5c8a4f1sm2193477wrs.60.2023.09.08.07.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 07:06:35 -0700 (PDT)
Message-ID: <b803e73e-211b-a6f2-7dc7-25e46e72483d@redhat.com>
Date: Fri, 8 Sep 2023 16:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
 <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
 <87ledg3hib.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87ledg3hib.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2023 15:46, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> 
> Hello Thomas,
> 
>> Hi Maxime
>>
>> Am 08.09.23 um 12:58 schrieb Maxime Ripard:
>>> Hi,
>>>
>>> On Fri, Sep 08, 2023 at 11:21:51AM +0200, Thomas Zimmermann wrote:
>>>> Am 25.08.23 um 16:04 schrieb Jocelyn Falempe:
>>>> [...]
>>>>> + *
>>>>> + *     But there are two exceptions only for dumb buffers:
>>>>> + *     * To support XRGB8888 if it's not supported by the hardware.
>>>>
>>>>
>>>>> + *     * Any driver is free to modify its internal representation of the format,
>>>>> + *       as long as it doesn't alter the visible content in any way, and doesn't
>>>>> + *       modify the user-provided buffer. An example would be to drop the
>>>>> + *       padding component from a format to save some memory bandwidth.
>>>>
>>>> I have strong objections to this point, _especially_ as you're apparently
>>>> trying to sneak this in after our discussion.
>>>
>>> I think it's an unfair characterization. This was discussed on
>>> #dri-devel, and went through several rounds over the mailing lists, with
>>> you in Cc for each. How is that sneaking something in?
>>
>> A few months ago, we had a flamewar'ish IRC discussion on format
>> conversion within the kernel. The general sentiment was that the kernel
>> drivers should use what ever is provided by userspace without further
>> processing. The short argument was 'userspace knows better'. The only
>> exception is for supporting XRGB8888 on hardware that would otherwise
>> not support it. After some consideration, I agree with all that. (Back
>> then I didn't.)

I wasn't part of this "flamewar", and though my patch was a bit 
unrelated to this. That's why I started this work to document clearly 
what is acceptable in the kernel or not. I discuss it on IRC, and then 
proposed the patch on dri-devel to find a compromise, and see if my case 
can be acceptable or not.

>>
>> A few weeks ago I received a patch to do an implicit conversion from
>> XRGB8888 to RGB888 within mgag200. [1] I don't have a link to the
>> discussion, but I NAK'ed that patch pretty hard on IRC by following that
>> other discussion.
>>
>> And know I find that this patch (even in its v1) contains language that
>> retroactively legitimizes the mgag200 patch. I wrote 'apparently' I my
>> reply, as I assume that there's more to it, but how does it not look
>> like an attempt to sneak in something that is known to be controversial?
>>

That was not my intention, and I apologize if you feel it this way. My 
goal was just to clarify if this optimization is acceptable for other 
kernel developers, since I though you were willing to accept it, but 
some other developers from the "flamewar" were against.

> 
> While is true that the motivation for Jocelyn's patch was to make explicit
> what are the rules with regard to drivers emulating formats (other than
> "we had a flamewar on IRC a while back" which is quite ambiguous), it was
> not attempt to sneak something that is known to be controversial.
> 
> In fact, it is an attempt to dispel the controversy and document what is
> acceptable and what is not for a driver.
> 
>> It might have been better to discuss the question separately on the
>> dri-devel ML. Maybe we can do this here.
>>
> 
> This was discussed in the #dri-devel IRC channel, I believe you were on
> PTO at the time and probably that's why you missed. I found the logs here:
> 
> https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2023-08-04
> 
> As you can see there, most people agreed that what Jocelyn wrote in his
> doc patch is the most pragmatic compromise.
> 

Best regards,

-- 

Jocelyn

