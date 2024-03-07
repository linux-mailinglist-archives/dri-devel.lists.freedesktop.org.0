Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D304487550D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 18:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8605C10F3B5;
	Thu,  7 Mar 2024 17:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EXIdf1Ci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8D210F3B5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709832179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHud0NIMnubYeYck52m3NRwtUWz1SVAUUQWnc4Gem10=;
 b=EXIdf1Cixdyn75ZnfZoJG9tcYcFjZiW7LbklU40YDFT/9qltGycqoZRRrUOC58sLohMZ/F
 u0gN2Cyftu2eRDlVE81JPNJUkbZiwf+VbGZzGUPK2bZ4wGs03nvkUYtOca061cCXE5nWoh
 oTB6iP7qIunUyNiE0+Tngq6bUpuQH3U=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-tTpnBSFFMje2-KUZJCgrGQ-1; Thu, 07 Mar 2024 12:22:58 -0500
X-MC-Unique: tTpnBSFFMje2-KUZJCgrGQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5132c85310aso1382966e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 09:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709832177; x=1710436977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gHud0NIMnubYeYck52m3NRwtUWz1SVAUUQWnc4Gem10=;
 b=PaslkeivUxzxeY+os0l+fKhHb6G5w0JzJ0DdYtVDVUlUdPfPhMZkyYBTtK3Vpxgfeh
 jieP8vwmFOLhL6c+AUEz/FKgwDAq1l04N5WXKnOJMszEshkgI1cH7FctnnwYk5pihPpe
 JX94f4jVFljm02KH7PMRkmCCCVtzqVApnQKQm3d+14T+UZGxfNmcqRfJkL+zT5jh3xUB
 yruTHxX5bwoNaBZpb5qdrtCjdwIY3Ek7rGfXW19vyPPgkjQLfts70xcQQzzk+CCKuA4r
 K8ZMarf/+zk9sYZv55TKl6uXJAtGEOhL6YaMn3z42zBclW9+0hriRhBzXbK2JluDh/pD
 a0Nw==
X-Gm-Message-State: AOJu0YwGH4veBETJdta9hte+5BeSPXJRWm5MU1uGJ70Szket21TKCtpw
 Prx1p6EZGdM6KPDvTxpN5OK8Vu7ZEb6FcMOtzFIpUkf2x2QF1LO3ZlFEonp1k6LH17CQTIbx2BD
 hmRUVciRmRLe20ZNTnXMB5WzbXxfnYSWBCr3KHp0PhAYiRm/vuKkZ2Trvb6gQfsVuMw==
X-Received: by 2002:a19:5e52:0:b0:513:3bb2:325f with SMTP id
 z18-20020a195e52000000b005133bb2325fmr1784288lfi.24.1709832176883; 
 Thu, 07 Mar 2024 09:22:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz5XIN51pm0w0Ds04sX7nTgcZRXzxLF4YKIC4rJgsp3JuYsh1bD2RPfc80ajrhn3Agzucyug==
X-Received: by 2002:a19:5e52:0:b0:513:3bb2:325f with SMTP id
 z18-20020a195e52000000b005133bb2325fmr1784268lfi.24.1709832176495; 
 Thu, 07 Mar 2024 09:22:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a5d61cd000000b0033e11ff6284sm20037347wrv.12.2024.03.07.09.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 09:22:55 -0800 (PST)
Message-ID: <adeac189-87f8-4b70-9c04-3eaaf2ed7bc5@redhat.com>
Date: Thu, 7 Mar 2024 18:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] How to test panic handlers, without crashing the kernel
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Michael Kelley <mhklinux@outlook.com>,
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
 <d1d2093c-72a3-4f64-9a8f-9844dc38f0c5@redhat.com>
 <3d0c4180-aa6d-4519-d6d8-8f16b98587dc@igalia.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3d0c4180-aa6d-4519-d6d8-8f16b98587dc@igalia.com>
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



On 05/03/2024 18:50, Guilherme G. Piccoli wrote:
> On 05/03/2024 13:52, Jocelyn Falempe wrote:
>> [...]
>> Or maybe have two lists of panic notifiers, the safe and the destructive
>> list. So in case of fake panic, we can only call the safe notifiers.
>>
> 
> I tried something like that:
> https://lore.kernel.org/lkml/20220427224924.592546-1-gpiccoli@igalia.com/
> 
> There were many suggestions, a completely refactor of the idea (panic
> lists are not really seen as reliable things).

Thanks for sharing this, so it's much more complex than what I though.
> 
> Given that, I'm not really sure splitting in lists gonna fly; maybe
> restricting the test infrastructure to drm_panic plus some paths of
> panic would be enough for this debugfs interface, in principle? I mean,
> to unblock your work on the drm panic stuff.

For drm_panic, I changed the way the debugfs is calling the drm_panic 
functions in the last version:
https://patchwork.freedesktop.org/patch/581845/?series=122244&rev=9

It doesn't use the panic notifier list, but create a file for each plane 
of each device directly.
It allows to test the panic handler, not in a real panic condition, but 
that's still better than nothing.

> 
> Cheers,
> 
> 
> Guilherme
> 

Best regards,

-- 

Jocelyn

