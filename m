Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C289E1E5C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5535710E469;
	Tue,  3 Dec 2024 13:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tm7U3i9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F066410E469
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733234183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofnRMwIQFTb4k+7X6/uoqTm17QN8QYgSAm6WdEndwGI=;
 b=Tm7U3i9lFDb7CqaqWCYy5jmGz8JqapuWCM/IpMcRzfqYUQX48Yk3HeH9byjuAzzbDD1p87
 Mqpz8yxeybn1Q+VYqEcDP3e3qQg6OMcVS3oFsCFrOAKFQDeU5KWIMbb5rPGLOyUkmUlKG/
 2UJFM1uGTZwt1eE2kDa3zNJb9J1APBw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-pZEGsaZvMciu7TPg0aNQZA-1; Tue, 03 Dec 2024 08:56:22 -0500
X-MC-Unique: pZEGsaZvMciu7TPg0aNQZA-1
X-Mimecast-MFC-AGG-ID: pZEGsaZvMciu7TPg0aNQZA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4349e97bfc4so52091455e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 05:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733234181; x=1733838981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ofnRMwIQFTb4k+7X6/uoqTm17QN8QYgSAm6WdEndwGI=;
 b=prBbx18XpnBgWdo4kPM6R5yx/1u0roZ0nBVP0Kx/B5oJ5MLfwAyy+JEo3cK56pGK+x
 ewlMEydsJ+MQ7KjXfQUsQwJ5hQ380ffNFWM3nW+GJxSurYd5w7JKuXPqUBgio2TQsC4a
 bboik7u65agSfQsGBShG9kbCG19NxIoWAW/w9wsXC78mupZvvxn/fDHVMCwhwDTNSKq5
 IPrDnyDhYe8xQja5eDbtQFXOcuc1aeCclqU5cBxRJPzXpMBk9zpHixxKB3d2FgTTiAUC
 nJ++NX6lR0Jw4J6ewyLdmcgSHwNQZOaX6LpKE7HmariL+wDYriVQ9fN85K8m/f9uz3X/
 SI+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgdrx6EZNr/2NXAkw1v9LULSBkWkebSSgww0ElfkM58/hewtupblb5yrSQpNTdMoh9k1P2TQiMP34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1IojgIj/EdV2PEHfrsxibzu4OHVAak6PXk2MpoAJenuP66+fZ
 GL4u1SyYW9nsjCpRjZiyjbISrS8JS3q9QKedeKwDL2AqkkZsQJbvnaI+VXT7LP7yNv0YwKWHwZg
 qBEC/nn/K3PAryHYzbO7THzqvbah32RkXdP0vlgfw/l6arhqjhV4KcY5bGKVHwrDQTQ==
X-Gm-Gg: ASbGncsS4xYySDcvN0IJ5ZDmd5jE99pPb1JmYKDGh2ZZUqbAbAe7mw/rOQ+1R6+TArX
 o8/SEUgk2apwBNVCVv2MWu1Ke9iUI4rKtMv5CIxWVRTeb53iCUgPsYeBQmeVoqoj/1BjKG7DMED
 bQr1ioCMDAD57GEJ7Wub7f9yoWlzEsQzBIuI/iqrmdP/M6Rck+Pou5oS6VWNFHvozHen4A+iu83
 3D/Jp/Nv4FPV/FOA24VPVNS04ftvagsHHPxymIfoN9eSFSBUR881nEZi1Zx3WOt0FFY9TGBYK8d
 rEHENAZv22FSCg==
X-Received: by 2002:a05:600c:6b71:b0:432:d735:cc71 with SMTP id
 5b1f17b1804b1-434d0a0e3c4mr23173465e9.25.1733234181518; 
 Tue, 03 Dec 2024 05:56:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdQTYzrpTRAVfwmFeAbxgl2DVBKmVnO8fLYo0g42ay4ZV/6Sm256hFJYKinCixAGTd/lPzkA==
X-Received: by 2002:a05:600c:6b71:b0:432:d735:cc71 with SMTP id
 5b1f17b1804b1-434d0a0e3c4mr23173175e9.25.1733234181147; 
 Tue, 03 Dec 2024 05:56:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa764474sm218475535e9.10.2024.12.03.05.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 05:56:20 -0800 (PST)
Message-ID: <a51f2945-4eff-411e-83ad-838e69daeb6a@redhat.com>
Date: Tue, 3 Dec 2024 14:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] drm/panic: Move drawing functions to drm_draw
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241115142950.1758007-1-jfalempe@redhat.com>
 <20241115142950.1758007-2-jfalempe@redhat.com> <87y10x3u0x.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87y10x3u0x.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4-INOLD3C7aoqmaKH-64sUavwHsSi4xJWI_fV_gKkpg_1733234181
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

On 03/12/2024 12:06, Jani Nikula wrote:
> On Fri, 15 Nov 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Move the color conversions, blit and fill functions to drm_draw.c,
>> so that they can be re-used by drm_log.
>> drm_draw is internal to the drm subsystem, and shouldn't be used by
>> gpu drivers.
> 
> I started looking at this in patch 2:
> 
>> +#include "../drm_draw.h"
> 
> I think we should avoid #includes with ../ like this.

Sure, I've added it in v8, after the clients moved to drm/clients/, but 
I didn't think much about it.

> 
> Either drm_draw.h belongs in include/drm, or maybe clients/Makefile
> needs to add subdir-ccflags-y += -I$(src)/.. or something like that?
> 
> If it's supposed to be internal, I guess the latter, but then the
> current convention is to have _internal.h suffix. All drm headers under
> drivers/ have that.

ok, I can rename drm_draw.h to drm_draw_internal.h, and add the include 
in the Makefile.
> 
> Is this the first drm subsystem internal thing that's a separate module?
> Should we use EXPORT_SYMBOL_NS() and MODULE_IMPORT_NS() to enforce it
> being internal?

It's not really a separate module, as it's built in the core drm module. 
(the reason is that it's used by drm_panic too, which must be in the 
core drm module).

I don't know much about symbol namespace, but I can add that if needed.

Best regards,

-- 

Jocelyn

> 
> 
> BR,
> Jani.
> 
> 

