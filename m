Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5D9F4E27
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC12510E997;
	Tue, 17 Dec 2024 14:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OGHFRiok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF9310E997
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734446778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDQnbhzbULoS+W3TBQiABSNsadwzS0IORV98NaKZMJE=;
 b=OGHFRioksUlAOlyMz9wLZ0Ljd0Jie9PiY/TJuixKCB5NvCm4OsLF2XxJK0nibI0/Fidrsd
 5yXgZi+MGJueWD480I6k0sk4SXDpV9EPbFHtvmbOkU35R/Hx0BgJSM966a3KpBxzQaiVKP
 2dgkkkiF983NUk/mcbZP04AXA0PI9nY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-ciWh_XJLPQWt4da0L9XGpw-1; Tue, 17 Dec 2024 09:46:17 -0500
X-MC-Unique: ciWh_XJLPQWt4da0L9XGpw-1
X-Mimecast-MFC-AGG-ID: ciWh_XJLPQWt4da0L9XGpw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4362552ce62so29976155e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734446775; x=1735051575;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eDQnbhzbULoS+W3TBQiABSNsadwzS0IORV98NaKZMJE=;
 b=E+IrDpFxIq62ew720VXX7Zhu1YcToBQsum372BXhSZxa2RYi5LoH9gfn2i0dYD2oMP
 rg8un4zmmVPHqtEP/Ukq0JyIype5jsBds4NdRFz1WvhctY10K73b1lVeo1mJm5aCg/w/
 1KRzUgcHPyybPSLG6tUPk0W9D8Ohf3YRUwRsKjs6ISqv+X80l9WtFdrmq+afieV347A3
 wl33VhzTbzDWyOrelyfM212xrRQlCCUOBYuK6s4B76Tuhf0aLNWy56sr8Y5uFVUXClBf
 cB047bKd2/yU08u33hhSJAO6qbW7DXvZ+x43963oPBzHsi7FzEQQPf0sUJetLWNHEcxG
 eyxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD+5vtArjvZij4rtjpBSYhWhnt9C4Wdjk1vuh613/1h9HxLq2Lkz0+UpL9BwniHCZBi8QvChZGes4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQHKro66VQLnLrnY7/CNEavkEm2bRjCfAue6FKuqITPxvvfTeu
 bLLfRe7UClLF1lXBw+ZC6f9y2nMswbSRTFcS/bQiOiHW8EwrLPElKo1/87PB787S3CAGtVYlFN3
 D5qdcJFAQfIahKM4I1DAsPF9iTo9M15pj8uu+Arkgte02DU3Lylo2pZKUMr75tI8+7g==
X-Gm-Gg: ASbGncsBDAQu37MwVdhXcAlRu9JSQ4MOcTQE7ZDFNEZuJVPabJWVgOLfWuVaWJkNEw5
 7cGMoWO4zl6Ozx4TWVuSadqohmA9mxQ/GRw8M3dRNttw42B8SapvUKd5SbV5D85y37FyNWir9/G
 hN6owbOK3cV47vedb1pGuU/iU+IUPOrRvW9t097mqLIz2CebcyyEpGwj1jW5o3W5kNwczUyhwL0
 Swx1mc4N1KbVbNTmjyyH1u2wmNpoaWIBKRBIE0ZEIysZRuoFBZLgmD5ps2zleC6De+e6mZkFiGt
 0eaCyLifNh9DrODFf1Hh
X-Received: by 2002:a05:600c:4e88:b0:434:a929:42bb with SMTP id
 5b1f17b1804b1-4364769b321mr39642485e9.18.1734446775084; 
 Tue, 17 Dec 2024 06:46:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb7FOvU3aK3NlCVSo7lhvRfjnfY6sZdz6YbmqcryV9O2xsfMlBv61Xb0L2X14JUy9wFlLD9Q==
X-Received: by 2002:a05:600c:4e88:b0:434:a929:42bb with SMTP id
 5b1f17b1804b1-4364769b321mr39642125e9.18.1734446774667; 
 Tue, 17 Dec 2024 06:46:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8012249sm11244064f8f.10.2024.12.17.06.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 06:46:14 -0800 (PST)
Message-ID: <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
Date: Tue, 17 Dec 2024 15:46:12 +0100
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
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JGbLncZZ6O1EI3j2MELlFAsy6-r4Ah5wXANB8Yx_suU_1734446775
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

On 17/12/2024 15:19, Geert Uytterhoeven wrote:
> Hi Jocelyn,
> 
> On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
>> This is not a full replacement to fbcon, as it will only print the kmsg.
>> It will never handle user input, or a terminal because this is better done in userspace.
>>
>> If you're curious on how it looks like, I've put a small demo here:
>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>>
>> Design decisions:
>>    * It uses the drm_client API, so it should work on all drm drivers from the start.
>>    * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>>      It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>>    * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
> 
> I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
> Unfortunately I don't see any kernel messages, and my monitor complains
> about no signal. Does this require special support from the driver?

It doesn't require a special support from the driver. But as it is the 
first drm client other than fbdev emulation, I'm not surprised it's 
broken on some driver.
I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6 
(Qualcomm SDM845/freedreno), without requiring driver changes.

Do you have a serial console on this device, to check if there is 
something in kmsg?

Best regards,

-- 

Jocelyn

> 
>      CONFIG_DRM_CLIENT=y
>      CONFIG_DRM_CLIENT_LIB=y
>      CONFIG_DRM_CLIENT_SELECTION=y
>      CONFIG_DRM_CLIENT_SETUP=y
>      CONFIG_DRM_CLIENT_LOG=y
>      # CONFIG_DRM_CLIENT_DEFAULT_FBDEV is not set
>      CONFIG_DRM_CLIENT_DEFAULT_LOG=y
>      CONFIG_DRM_CLIENT_DEFAULT="log"
> 
> Switching to fbdev gives a working display, as before:
> 
>      CONFIG_DRM_CLIENT_DEFAULT_FBDEV=y
>      # CONFIG_DRM_CLIENT_DEFAULT_LOG is not set
>      CONFIG_DRM_CLIENT_DEFAULT="fbdev"
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

