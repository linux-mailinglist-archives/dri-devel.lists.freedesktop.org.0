Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDAA9F6279
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2861010E259;
	Wed, 18 Dec 2024 10:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="awaayPae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153A110E259
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734516877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBGu2KOb4IgBv3uEmXMWgs1fb3G8K3utYYOyJ/CpZkU=;
 b=awaayPaegmbWjRCxp8CrP9QskI9OqIeaTeLH+U1L+4B0cgdU8SjwM0in7AUP1gv6a8Wk4z
 lBwn54CKFk0XKXAoLn/eHOGOUsYA1cpKMpcoSZDtQO9ll+C953ZdgYSKladJqLQdjX1EfZ
 qtoksGJv01+03zCColdugEgLpGoaBnU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-W14cdSTpMfyO8mZpQKQNgQ-1; Wed, 18 Dec 2024 05:14:35 -0500
X-MC-Unique: W14cdSTpMfyO8mZpQKQNgQ-1
X-Mimecast-MFC-AGG-ID: W14cdSTpMfyO8mZpQKQNgQ
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43610eba55bso21635715e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734516875; x=1735121675;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBGu2KOb4IgBv3uEmXMWgs1fb3G8K3utYYOyJ/CpZkU=;
 b=WxegL/3L+qNu3z6v/wWR7nHXIwywgs+cRK18mlRPHubmEp92BfRPzYweZnoUnkdC+7
 kbkgQQP4kYmSyu2PLOhl63nQHzYhySIF3aenteRwsC9642vxjFmWW/7NSJ3LS0tSWKdD
 BX36/yfdFT5kg7WohWDEodo9ASqcHwFBIo8VqbQXLvwahU/XJ0R4V5lYXn/KL6dy9d/R
 dx2V4byiVCLtY90xXEj8q+6l12tFva6bB/La2LYzyp24KeDNI6s7Zcp9CGCBcQa60XA8
 Zxmd8BDD+3ADb8HpYin/Hqup9Iu+E2TH21GLbw4kVTN2gaPhLNuA/Ken3s8USaSL1RnY
 Pjag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHAlmRLKnq0mFn+XI4lOiNVPuYKQj9eloS6WJep86h9YpDBnSBgb8AO7/sqEWfpTBy7JWRya5jqrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOp94h5aOsN5YSqb3JXVb3caxBiVtKDYKOh7Oll0RN2AAPrrL9
 +Qi4KZOsruQsGN3Rp484deZmKe3SX44iaIilHkmSSEPNS0/hnWcUAn4cZv1XOeho/erR5Kk2M32
 J36Di1evkG0vGCsa1yvZ+5hFYeOMe1OSN6A0YfC9JJ+AmcpPHw0Lhe4j1+rqDOLWcgA==
X-Gm-Gg: ASbGncvRfvNVTXKfqwTTT9nx8TkiUYplAq0PGCluUB+DzMMIabuOchoxY3a1wW9EI5W
 xqNkn3WQUQ179QHt1nWLPEc5IYtcOEYhZ92tra38IpbYn8x8iVg6Hy0ONBnZ9DawNbK3C44qy/i
 Wr5UzJIUAvng7//30z4VN7Yiz/kFzHOs0jBqCuLPCQzrOH+hz58Vpqv1EOBCoYvP2nVDMdFJy7z
 KxUr68c9p8r6+Whb2e0payRuCz7XAC6/LldbmyAsGGUfB0wTQ2K3/HcSetcPJK/8/KL+ZEV6eB4
 iR6iVjRZML4qp817Fe15
X-Received: by 2002:a5d:6d09:0:b0:387:8604:5023 with SMTP id
 ffacd0b85a97d-388e4d8edf2mr2025160f8f.44.1734516874638; 
 Wed, 18 Dec 2024 02:14:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFEiaP5T6kOStWVjcP3at+Jf03VWaZaNLHjGjBcrqmhuYhyjkR3wz7Dka1Wg9fgkGmlREj7A==
X-Received: by 2002:a5d:6d09:0:b0:387:8604:5023 with SMTP id
 ffacd0b85a97d-388e4d8edf2mr2025135f8f.44.1734516874216; 
 Wed, 18 Dec 2024 02:14:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b01b7esm15415895e9.13.2024.12.18.02.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 02:14:33 -0800 (PST)
Message-ID: <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
Date: Wed, 18 Dec 2024 11:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
 <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Px4C6IgWXNwQ9_ZfdQzCAca8i-Vo5AAvPCbM7C1XAbE_1734516875
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 17/12/2024 15:54, Geert Uytterhoeven wrote:
> Hi Jocelyn.
> 
> On Tue, Dec 17, 2024 at 3:46 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
>>> On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
>>>> This is not a full replacement to fbcon, as it will only print the kmsg.
>>>> It will never handle user input, or a terminal because this is better done in userspace.
>>>>
>>>> If you're curious on how it looks like, I've put a small demo here:
>>>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>>>>
>>>> Design decisions:
>>>>     * It uses the drm_client API, so it should work on all drm drivers from the start.
>>>>     * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>>>>       It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>>>>     * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
>>>
>>> I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
>>> Unfortunately I don't see any kernel messages, and my monitor complains
>>> about no signal. Does this require special support from the driver?
>>
>> It doesn't require a special support from the driver. But as it is the
>> first drm client other than fbdev emulation, I'm not surprised it's
>> broken on some driver.
>> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
>> (Qualcomm SDM845/freedreno), without requiring driver changes.
>>
>> Do you have a serial console on this device, to check if there is
>> something in kmsg?
> 
> Nothing interesting to see. Compared to the fbdev client:
> 
>       rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
>       [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
>       rcar-du feb00000.display: [drm] Device feb00000.display probed
>      -Console: switching to colour frame buffer device 240x67
>      -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
> 
> I did verify (by adding my own debug prints) that the code does
> get to the success case in drm_log_register().
> Thanks!

Maybe you need to add console=drm_log to your kernel command line, so 
the kernel will actually use this console.

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

