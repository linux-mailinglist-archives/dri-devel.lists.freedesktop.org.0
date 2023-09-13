Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E705879E1BD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 10:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA24610E478;
	Wed, 13 Sep 2023 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA49C10E478
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694592880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peFi3UMUrusSrJj7+OmtGDgWDi4/H6xnR3qiSD96aCk=;
 b=QaemzfCE4f3FuMet//56HjKl7Jg9vgXiOblMRrRrrYUYuBF10MH63PC0EIEJz6wrrF/a6b
 6SzOQDHs+Jl3oQdpSsBXv+4PHPlYO3r4yGo6iV2ox3vWBwNP6ry/M8iunt4bDmGVGpqq6r
 dNtGmbg29b4Lfh4VUGg8QJwAY0YvhOg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-GdYY8ryMNLyAJ9rO4mPgwA-1; Wed, 13 Sep 2023 04:14:39 -0400
X-MC-Unique: GdYY8ryMNLyAJ9rO4mPgwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-402c46c4a04so49241425e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 01:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694592877; x=1695197677;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=peFi3UMUrusSrJj7+OmtGDgWDi4/H6xnR3qiSD96aCk=;
 b=VA576uonunY7oEyPq4gROTQPz9ORiPg3TuEviepUWkssycP/rfaZ6eB96nV+qAeFiJ
 kxQ71GVISXJ1YdoERtvsEwz3Wu/SI1e7JgTBya04pbGgKy8HK5qr+v7pc+yMl9hty+JL
 dXWdnYu62f3/w/8A2IqO2BAaOhqf/5jSZXnfuu68N7g2gLG6TeshXwifc9K9Z/8vgO4v
 AWqPNpgNCDGJI4tU26zAlGJTG01BdqFlxHAKrTKl92SUIkyVw2GmvLcqMjF0Mcp+ybBu
 D/uLcezLSE55L/kj41wYtK0kNEeHtfM7232hMrlfygqfstbBXSSMIt0ohmyH7i9r8DJe
 RAVw==
X-Gm-Message-State: AOJu0YwoRiBv40EeVPUUbr1hJ3hx0jhGlLhTQBAmIxLN8wIlLPNIs40T
 Krq3NMaWhvKVuWc1a4pTb6w1gA6tXcPKhuMEieOksBZQp7GbmJzx2OJ0vjzJyj1Qg6/0vzFyk+y
 HcxZuUbFYjNqPDHPpmdiqKWMMozXwgFAdjmnV8tReC/+HitogP4CI+gPrzfzodKZ7UWHVTpIiI8
 By/UtmATY0cqGB
X-Received: by 2002:a05:600c:2108:b0:401:b76d:3b8b with SMTP id
 u8-20020a05600c210800b00401b76d3b8bmr1333154wml.16.1694592877726; 
 Wed, 13 Sep 2023 01:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRwGZLe1rf9eVqIclJVy2Ow3FknviWQaYEle7P4vzP6kZ1p5oNutEgB90gtv68TnU2/pqiKQ==
X-Received: by 2002:a05:600c:2108:b0:401:b76d:3b8b with SMTP id
 u8-20020a05600c210800b00401b76d3b8bmr1333140wml.16.1694592877327; 
 Wed, 13 Sep 2023 01:14:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d5270000000b0031c6ae19e27sm14800303wrc.99.2023.09.13.01.14.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 01:14:36 -0700 (PDT)
Message-ID: <39adc271-b79a-82ab-d125-e25e3282b729@redhat.com>
Date: Wed, 13 Sep 2023 10:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
To: dri-devel@lists.freedesktop.org
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
 <20230908174113.02b65f9c@eldfell>
 <6d506fe7-3c23-3b50-2d29-549ccb4dbe87@suse.de>
 <20230911113827.67ed6c7d@eldfell>
 <cf28003f-6b11-5800-61db-02195d8532be@mailbox.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <cf28003f-6b11-5800-61db-02195d8532be@mailbox.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2023 17:57, Michel Dänzer wrote:
> On 9/11/23 10:38, Pekka Paalanen wrote:
>> On Fri, 8 Sep 2023 17:10:46 +0200
>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Am 08.09.23 um 16:41 schrieb Pekka Paalanen:
>>>> On Fri, 8 Sep 2023 15:56:51 +0200
>>>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>>>
>>>>> I have a number of concerns. My point it not that we shouldn't optimize.
>>>>> I just don't want it in the kernel. Mgag200 can export DRM_FORMAT_RGB888
>>>>> for userspace to use.
>>>>>
>>>>> AFAICT the main argument against userspace is that Mesa doesn't like
>>>>> 3-byte pixels. But I don't see how this conversion cannot be a
>>>>> post-processing step within Mesa: do the rendering in RGB32 and then
>>>>> convert to a framebuffer in RGB24.
> 
> Even assuming the conversion could be handled transparently in Mesa, it would still require the KMS client to pick RGB888 instead of XRGB8888. Most (all?) KMS clients support XRGB8888, many of them will realistically never support RGB888. (Or even if they did, they might prefer XRGB8888 anyway, if RGB888 requires a final conversion step)
> 
> 
>>>>> Another point of concern is CPU consumption: Slow I/O buses may stall
>>>>> the display thread, but the CPU could do something else in the meantime.
>>>>> Doing format conversion on the CPU prevents that, hence affecting other
>>>>> parts of the system negatively. Of course, that's more of a gut feeling
>>>>> than hard data.
> 
> Jocelyn, have you measured if the XRGB8888 -> RGB888 conversion copy takes longer than a straight RGB888 -> RGB888 copy in the kernel?
> 
> 

At least on my Matrox system, the conversion is really negligible 
compared to the copy, due to slow memory bandwidth. I wasn't able to see 
a difference, using ktime_get_ns().

The CPU is an old Intel(R) Core(TM) i3 CPU 540  @ 3.07GHz
in 1280x1024, the RGB888 copy takes 95ms.
and the XRGB8888->RGB888 takes also 95ms.
(and the full XRGB8888 copy takes 125ms)

Also we say "conversion", but when talking about XRGB8888->RGB888, there 
is no math involved, only dropping one bytes every 4.

But really performance is not the main concern here as it is obvious 
that it's much faster in RGB888. I tried to summarize the other 
arguments below, which I still find not convincing:
  * The driver is already fast enough, if you want faster, buy another GPU.
  * This adds too much complexity in the driver (about ~20 lines of code)
  * It breaks an unwritten rule of not changing the color format inside 
the kernel (which I tried to write with this patch, while adding an 
exception for legitimate use cases, like this one).

But let's admit that this discussion is going nowhere, and that I failed 
to reach a consensus, so I'm now focusing on other things.

Best regards,

-- 

Jocelyn

