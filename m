Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCF8724DB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA7110F337;
	Tue,  5 Mar 2024 16:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DKwcPXtO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97D510F337
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709657564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bP8Cc1m+j7lZNr0m4WpXqV8ri7Lz2AvWMe7Xo/Lhbm0=;
 b=DKwcPXtOWQcDEEI6pxVEggQy1pEy/JFYVgFZcjCFIbu3h+aYJ1byDVujlftXnz/oFRnlGd
 ihG2sTqGx2amvWeTU2gAQM3sNuzOMxnFkqKYv4EgGODNDPDsGnzMAF1NCA75PCthnXsAqM
 BeP+fEytCr+zNVxJXAqmziUk6/N5WVY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-UHzSnNVkPTqDQYsaEZ2XDg-1; Tue, 05 Mar 2024 11:52:43 -0500
X-MC-Unique: UHzSnNVkPTqDQYsaEZ2XDg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5135aa34125so13858e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 08:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709657562; x=1710262362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bP8Cc1m+j7lZNr0m4WpXqV8ri7Lz2AvWMe7Xo/Lhbm0=;
 b=Gy9nonTIgM2FX4U7uHAAX6Q5QWdYUbc2DOV8l6EeaBonalfsjvc7sz66HromqSbM0E
 N4dGTZD6a3k+t5e+oJz2Y7xGp9V/UvGdvOOoXGPO3eVywK8nYOrULBD6zXzxhDMK40Oo
 47g5BswYghuowvEzsxx4B9aGqQRKukNXQN7WmEBpz40uQbK6O16hyIJruOMs0BnrSokn
 dEEzpKGJN0l5p6pJwRRVOLat/PjHQj5Zo3auTrVQOZG8h5G0hXc969oWBzvqmVrLK/N2
 1BGItwEidw4suykub50DYDCXieR+oJy9ExN0ea1EsmF8Bx/Nq1xM+71JiU6/4L7i1RB3
 wvKg==
X-Gm-Message-State: AOJu0YzkiNGg+IOcuTzcEv0jFfrHm+MO4Epk8eoZIKBMrImCRnKiCnpG
 T3zT7/15W9ztk5bpsGEltNem+JsCWVY49zXoow3BNROtsbvfhlpAw63Z6Z9LGWKwj6ss9eoxL47
 Wyo7u0nngMQgqi//DC0BxxXo58YNJwXeoyY3mmsZzipyde7Ha7w7unmSrbN+evQw4Jg==
X-Received: by 2002:a05:6512:312b:b0:513:5808:72f9 with SMTP id
 p11-20020a056512312b00b00513580872f9mr984025lfd.56.1709657562039; 
 Tue, 05 Mar 2024 08:52:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkvF0km/ldN7XD5s/zPoV3sZCCMPiuDbsJPkUSMImq16qQCqbFD2ESBaFk5r999FxMgVV3bQ==
X-Received: by 2002:a05:6512:312b:b0:513:5808:72f9 with SMTP id
 p11-20020a056512312b00b00513580872f9mr984003lfd.56.1709657561659; 
 Tue, 05 Mar 2024 08:52:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 o39-20020a05600c512700b00412d60cb914sm11594793wms.5.2024.03.05.08.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 08:52:41 -0800 (PST)
Message-ID: <d1d2093c-72a3-4f64-9a8f-9844dc38f0c5@redhat.com>
Date: Tue, 5 Mar 2024 17:52:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] How to test panic handlers, without crashing the kernel
To: Michael Kelley <mhklinux@outlook.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 John Ogness <john.ogness@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Lukas Wunner <lukas@wunner.de>,
 Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <266579a9-fde6-40ff-b13d-fb2312db406c@redhat.com>
 <87edcpn1l3.fsf@jogness.linutronix.de>
 <15015345-3068-2fb8-aa38-f32acf27e1d0@igalia.com>
 <SN6PR02MB4157AF2E765F7ED3B9487351D4222@SN6PR02MB4157.namprd02.prod.outlook.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <SN6PR02MB4157AF2E765F7ED3B9487351D4222@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05/03/2024 17:23, Michael Kelley wrote:
> From: Guilherme G. Piccoli <gpiccoli@igalia.com> Sent: Monday, March 4, 2024 1:43 PM
>>
>> On 04/03/2024 18:12, John Ogness wrote:
>>> [...]
>>>> The second question is how to simulate a panic context in a
>>>> non-destructive way, so we can test the panic notifiers in CI, without
>>>> crashing the machine.
>>>
>>> I'm wondering if a "fake panic" can be implemented that quiesces all the
>>> other CPUs via NMI (similar to kdb) and then calls the panic
>>> notifiers. And finally releases everything back to normal. That might
>>> produce a fairly realistic panic situation and should be fairly
>>> non-destructive (depending on what the notifiers do and how long they
>>> take).
>>>
>>
>> Hi Jocelyn / John,
>>
>> one concern here is that the panic notifiers are kind of a no man's
>> land, so we can have very simple / safe ones, while others are
>> destructive in nature.
>>
>> An example of a good behaving notifier that is destructive is the
>> Hyper-V one, that destroys an essential host-guest interface (called
>> "vmbus connection"). What happens if we trigger this one just for
>> testing purposes in a debugfs interface? Likely the guest would die...
>>
>> [+CCing Michael Kelley here since he seems interested in panic and is
>> also expert in Hyper-V, just in case my example is bogus.]
> 
> The Hyper-V example is valid. After hv_panic_vmbus_unload()
> is called, the VM won't be able to do any disk, network, or graphics
> frame buffer I/O. There's no recovery short of restarting the VM.

Thanks for the confirmation.
> 
> Michael
> 
> [I have retired from Microsoft.  I'm still occasionally contributing
> to Linux kernel work with email mhklinux@outlook.com.]
> 
>>
>> So, maybe the problem could be split in 2: the non-notifiers portion of
>> the panic path, and the the notifiers; maybe restricting the notifiers
>> you'd run is a way to circumvent the risks, like if you could pass a
>> list of the specific notifiers you aim to test, this could be
>> interesting. Let's see what the others think and thanks for your work in
>> the DRM panic notifier =)

Or maybe have two lists of panic notifiers, the safe and the destructive 
list. So in case of fake panic, we can only call the safe notifiers.

>>
>> Cheers,
>>
>>
>> Guilherme
> 

