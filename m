Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07EB7BF4F9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 09:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF4810E322;
	Tue, 10 Oct 2023 07:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C831210E325
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 07:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696924550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+EPOESl+lEeZDZKmSy2QqN19OnEFo74lce2c+DMXR/o=;
 b=J2xvrjozynv/8oWfiNi1J+mYTnC4tZl4hggfMpls3OeB/28q+rWe6c9oobGWHa2EwSIZX8
 0+PPXwN+DGMqmaIVz9Yy/arWZx9VgB72oGQT4GQEnHUGaTOj027HP8PxBy16wGjBPQsZ4v
 z5hC/1A4KIJWVtGNpteDzxn0kc5sKD8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-PWf5wiKmNEid1Eda2N4U1A-1; Tue, 10 Oct 2023 03:55:49 -0400
X-MC-Unique: PWf5wiKmNEid1Eda2N4U1A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3248ebee5f4so3364509f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 00:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696924548; x=1697529348;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+EPOESl+lEeZDZKmSy2QqN19OnEFo74lce2c+DMXR/o=;
 b=Qzh2Qb8gu+AsrXUZ2NW2BAie4w8qgEi6WbTfbLO+89EYYD4OG1Tb+G2EBwFqh9bzLg
 k4e8rf6ZYTE+7Rq7Jt5ijX/oN5UhFVYTsocb+6emIBoaMRbQxsdUIFNhIOK6FK7+N9je
 zEiJu3a5cyJnVEo1H0/NSnWNyNkX8RlWuuXNAYf2V6sd8DDzFtdxNESRuriHl0HOSZ1H
 XVLro2Vkuej3v56PPdEvN1XGyfnkxPrdWALgWPwk4pMQhos7gqklDYAoF/0zIKfkIXyK
 1fcct8hoV8OhpAhwxpRHDiHZTPzvlez7RYIqewuMHKZvBoQt5L/g0FjkjfXnEH8WI2Tc
 rlAQ==
X-Gm-Message-State: AOJu0Yz6Y0u/AUvAMPuSqO75A1jBbVSUKa8f8yXa+X78qgRTZH8AhcVg
 VSzFz0wYdp144IyEyU6vdBc3WN1Erj4xenoIwFGQzPZIE1cCJiHnmQUJukQ/IYb0lDkG9kRHrEl
 JVrMcsR1ilO6f+xKD5vt45YCb4tVG
X-Received: by 2002:a5d:6b82:0:b0:319:5677:f832 with SMTP id
 n2-20020a5d6b82000000b003195677f832mr13961557wrx.62.1696924548239; 
 Tue, 10 Oct 2023 00:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFkJMgtmEI465e3B6hUxRzYm9eUQAG+r3VAUQ6EWjzAr/MHFwTRnByALelNLZRKBjaIvLD2w==
X-Received: by 2002:a5d:6b82:0:b0:319:5677:f832 with SMTP id
 n2-20020a5d6b82000000b003195677f832mr13961549wrx.62.1696924547933; 
 Tue, 10 Oct 2023 00:55:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a5d574e000000b0031aef72a021sm11922733wrw.86.2023.10.10.00.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 00:55:47 -0700 (PDT)
Message-ID: <2b541955-11ba-d881-d2b2-c54cbae9d241@redhat.com>
Date: Tue, 10 Oct 2023 09:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
To: Maxime Ripard <mripard@kernel.org>
References: <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
 <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, tzimmermann@suse.de,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 18:07, Maxime Ripard wrote:
> On Mon, Oct 09, 2023 at 04:05:19PM +0200, Jocelyn Falempe wrote:
>>>> - I find it risky to completely reconfigure the hardware in a panic handler.
>>>
>>> I would expect to only change the format and base address of the
>>> framebuffer. I guess it can fail, but it doesn't seem that different to
>>> the async plane update we already have and works well.
>>>
>> In this case it can work, but by using generic drm api, it's hard to know
>> what the driver will do.
> 
> We should document extensively what we expect drivers to do in those
> hooks, and possibly call cant_sleep() in the framework function to have
> some reporting at least.
> 
>>>> Also how many drivers would need this ?
>>>>
>>>> Currently I was mostly considering x86 platform, so:
>>>>
>>>> simpledrm/ast/mgag200 which works well with the get_scanout_buffer().
>>>>
>>>> i915/amdgpu/nouveau, which are quite complex, and will need to do their own
>>>> thing anyway.
>>>
>>> I guess we're not entirely aligned there then. I would expect that
>>> mechanism to work with any atomic KMS driver. You are right that i915,
>>> amdgpu and nouveau are special enough that some extra internal plumbing
>>> is going to be required, but I'd expect it to be easy to support with
>>> any other driver for a memory-mapped device.
>>>
>>> I guess what I'm trying to say is, even though it's totally fine that
>>> you only support those drivers at first, supporting in vc4 for example
>>> shouldn't require to rewrite the whole thing.
>>
>> Would that work for you to put that in a drm_panic_helper.c,
>> so that drivers can opt-in ?
>>
>> So the driver can call a drm_panic_helper_prepare_commit() at
>> initialization, and then in the get_scanout_buffer() function
> 
> If we have a full blown commit with a new framebuffer, why do we need
> get_scanout_buffer? It should be either the framebuffer itself, or in
> the plane state if you have a conversion.
> 
>> run the atomic_update() on it, and return this commit's framebuffer ?
>>
>> That way each driver have a better control on what the panic handler will
>> do.
>> It can even call directly its internal functions, to avoid the locks of the
>> drm generic functions, and make sure it will only change the format and base
>> address.
>> That's a bit more work for each driver, but should be more reliable I think.
> 
> I don't think that better control there is a good idea, it's a path that
> won't get tested much so we'd be better off not allowing drivers to
> deviate too much from the "ideal" design.
> 
> What I had in mind is something like:
> 
>    - Add a panic hook in drm_mode_config_funcs, with a
>      drm_atomic_helper_panic helper;
> 
>    - Provide an atomic_panic hook or something in drm_plane_helper_funcs;
> 
>    - If they are set, we register the drm_panic handler;
> 
>    - The handler will call drm_mode_config_funcs.panic, which will take
>      its prepared state, fill the framebuffer it allocated with the
>      penguin and backtrace, call drm_plane_helper_funcs.atomic_panic().
> 
>    - The driver now updates the format and fb address.
> 
>    - Halt and catch fire
> 
> Does that make sense?

Yes, I will do some experiment with that, and see if I can make it work 
this way.
If possible I still want to have a way for simple drivers like 
simpledrm/mgag200 to not allocate a full framebuffer.

> Maxime

-- 

Jocelyn

