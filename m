Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0479F6510
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 12:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CFF10EB75;
	Wed, 18 Dec 2024 11:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ME/hTpgs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B9810E16C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734522104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8w4RSJ8nHm6xZnbZl8MO53LyH2t95hK0oK0jZZXulZ4=;
 b=ME/hTpgsfKHLqJe9pRui2xxghlsEUETCXjQxrd2A+e3YFjCFsRXfEO3pJMY97I4aqPmlVN
 pSraiMHzn7c+OLAJL45AqNF6VPPehDxF4u87i+smLoocUGRYh+D0SClmGBB9GVKoo1Am9o
 knWS7Oqlw+4wfK0TKAKlrzLLKnnwHz4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-qkVYzV7nMwyCbKV8ctwmGg-1; Wed, 18 Dec 2024 06:41:43 -0500
X-MC-Unique: qkVYzV7nMwyCbKV8ctwmGg-1
X-Mimecast-MFC-AGG-ID: qkVYzV7nMwyCbKV8ctwmGg
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385d80576abso4377645f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 03:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734522102; x=1735126902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8w4RSJ8nHm6xZnbZl8MO53LyH2t95hK0oK0jZZXulZ4=;
 b=HdZzDkhoZvrB7Rto0q7F+QAqVqeq675Y3n3YEI+XPULbFHvKWd0aYDKEhFb4NGhfeK
 8dEoC8zkB3eCWg0MH5jdzaSk2I/uv/pEgPUc/QN1GfFLvrD99WITh2a/pCyedfKUnWLf
 jzEhn0yCRuB0ik5uydX2jgDrfLo/su2jhaXK35tecbcl3zWOFHUjOZoY+7tHfH4ZUhAT
 PY++KpSOiYWXnfLheNSevJ5eKtws5wGluPfXXeTVDhMTMVZvI/PiHRnEGoHARNuCjWj5
 7dhjLuLQ3WUByOzOp09OVTThoqZiMMR/Cqo8p4JTZvGsk+FUrC2FcZqTSCxRTWvKr+x4
 gBOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/Lh+41ovOU7o8d9heObvwXwwQPYZZ7HLXFwPr5hN33kz+4XOCqwmiS2vqvR2VIi1m2uiPBwNW13k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypQnQ57EoCrcCwUCYdHnwj3MtxVLPqM6z6uzKXno5A1kvVjgO1
 uGS7StqrdaNtJ1trdaa7g0o7In6vdX9rhH02ZM6WoNk0cz++HRlnpa/fPGrZAhKmwS0huhlkf9D
 Jw3uxBJUvuoKO+xaI6l3sCBVst9MUxlWa2mqhd/WtwIpGnrkq9dfO7mFgf1aGsrus/g==
X-Gm-Gg: ASbGncusl/2mHPDLZUiqLUWcEBXezTFYydsPiukTT9NVzTDY/lGVyZRJQrAzWzwPu+t
 DC9/EV6UUTU2LKd7LMWZK68hUcQVXh7+rFL1C3UTO5S+5K1QpLwlK4SgOKdqCburYhgPtyxSI0d
 0Khr7zFt81HiFOjbjL97V6PSJhgF1dSaz0KFjDQdltszD4gqg9dcO9Sd060nPlsY5wodl7tmi2c
 nz3UA+vKoMo0JfVmmI4DDOM7qoHoJ4+py7LPzEVNBkrsowvzOZ5L54R8s+IU7nNlRZKDBhRxAey
 Aqy/gnr7Spw8uJZyjOLE
X-Received: by 2002:a05:6000:1a8e:b0:385:fe66:9f32 with SMTP id
 ffacd0b85a97d-388e4db8a93mr2188139f8f.52.1734522101857; 
 Wed, 18 Dec 2024 03:41:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXwpUv6qcQVeCE77pziR/wtsBppfqPmsEt6PaG1JXb/0c4W+XnvCzSR8Ny47ykr835iY1UfQ==
X-Received: by 2002:a05:6000:1a8e:b0:385:fe66:9f32 with SMTP id
 ffacd0b85a97d-388e4db8a93mr2188100f8f.52.1734522101347; 
 Wed, 18 Dec 2024 03:41:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b01b7esm17783255e9.13.2024.12.18.03.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 03:41:40 -0800 (PST)
Message-ID: <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>
Date: Wed, 18 Dec 2024 12:41:39 +0100
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
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
 <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ToPQZf9rQicXtUAE1GbIUEefXaErbBLEECacICPOZbU_1734522102
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

On 18/12/2024 12:00, Geert Uytterhoeven wrote:
> Hi Jocelyn,
> 
> On Wed, Dec 18, 2024 at 11:14 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 17/12/2024 15:54, Geert Uytterhoeven wrote:
>>> On Tue, Dec 17, 2024 at 3:46 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
>>>>> On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>>> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
>>>>>> This is not a full replacement to fbcon, as it will only print the kmsg.
>>>>>> It will never handle user input, or a terminal because this is better done in userspace.
>>>>>>
>>>>>> If you're curious on how it looks like, I've put a small demo here:
>>>>>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>>>>>>
>>>>>> Design decisions:
>>>>>>      * It uses the drm_client API, so it should work on all drm drivers from the start.
>>>>>>      * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>>>>>>        It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>>>>>>      * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
>>>>>
>>>>> I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
>>>>> Unfortunately I don't see any kernel messages, and my monitor complains
>>>>> about no signal. Does this require special support from the driver?
>>>>
>>>> It doesn't require a special support from the driver. But as it is the
>>>> first drm client other than fbdev emulation, I'm not surprised it's
>>>> broken on some driver.
>>>> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
>>>> (Qualcomm SDM845/freedreno), without requiring driver changes.
>>>>
>>>> Do you have a serial console on this device, to check if there is
>>>> something in kmsg?
>>>
>>> Nothing interesting to see. Compared to the fbdev client:
>>>
>>>        rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
>>>        [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
>>>        rcar-du feb00000.display: [drm] Device feb00000.display probed
>>>       -Console: switching to colour frame buffer device 240x67
>>>       -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
>>>
>>> I did verify (by adding my own debug prints) that the code does
>>> get to the success case in drm_log_register().
>>> Thanks!
>>
>> Maybe you need to add console=drm_log to your kernel command line, so
>> the kernel will actually use this console.
> 
> Thanks, that does the trick!
> 
> Note that I do not need to specify any console= kernel command line
> parameter for the fbdev console.

Yes, the fbcon console is tty0, which is hardcoded for historical reason.
Some architectures use add_preferred_console() to enable specific 
consoles, I'm not sure it's allowed to use that from the 
drm_log_register() code.

I will still send a patch to add update the Kconfig help for drm_log, as 
this command line argument is required to have it working.

Best regards,

-- 

Jocelyn

> 
> With
> 
>      CONFIG_VT_CONSOLE=y
>      CONFIG_DRM_CLIENT_DEFAULT_FBDEV=y
> 
> I see all console messages on both the emulated fbdev console and on
> the serial console by default.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

