Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0FC90A85A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 10:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FA210E29A;
	Mon, 17 Jun 2024 08:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OIDYuQy5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB4110E29A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718612866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rg3Hw9bzSfvXF0gxy7725Yb8DhkGikt0FmSi3AR5bCY=;
 b=OIDYuQy5juJqtLyrsBHtMl41b50srIhq4xg+xmmckBnM5GSudwiOZZEN4dUVK5Ea+ITZqv
 aKHC7JJBab8eH/3aN1zOYor1IiGSth7gce/EZ/iryqrZHdF+cEudIS6T/+SjqE97RIxg5x
 YEuecnB0pl89izbj5dQYagdpokuQqGA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-kpQ6jaTIMQObkqkAIoaY5A-1; Mon, 17 Jun 2024 04:27:44 -0400
X-MC-Unique: kpQ6jaTIMQObkqkAIoaY5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4210d151c5bso29613975e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718612864; x=1719217664;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rg3Hw9bzSfvXF0gxy7725Yb8DhkGikt0FmSi3AR5bCY=;
 b=WiqEcTYDz3jPpN+HlH5Hk5VadeLI/iuSLEaXX/HOYYTlpFxG3XpG3v3AToRyjX6bqH
 YzfLIiAwx/hB+eWTP0lMQ9aM4zpFRfshtj7UFD6DbcC8UUuVwMIe/O8J5xy1d2/7mQ0g
 98U5wke/woJ0YaK/iJPhCAfO7L8qpL8vEVnVFptDfxyrZ7KHUzRQT1NBxTFsVBVDOI1T
 qg06PjeYpK1BpT/SCwadDzTG1qrAdkTQd2j1TDxLKeoDZGtnehpSrZ9XXVh3m9UA4xX+
 a3xpfT1+rP5kfhQ45c5FL75RhPy89bhWIrDlKoGKsZIFdXFFwQr0jNPWz/HlBwXuDWZq
 FPkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwHSQeYlx2yAsS29a6Dt6LpVVlsVTvy8Zo4S0GaiM43qmcSsgkbEl+an4kZlmEZ8OGFbT3QrbUUiCn8oIywTQoP1NRozMLcMN9hiXNYNly
X-Gm-Message-State: AOJu0YxCGpdXjvMdu9hQS5TVkdYcm48ht3DVnmmi0w1xKaUw5Z2+pYK0
 zpEchr1DwK8gaxl/uTWd/bHCT7Zlep523wq1a68r1nqw2jeFAcjY/J8ozPA03xoFMvKPpSjfG6z
 YW4LgAMdeOs6rfWkUsWozit6jHoSbe2EH3ms03v2i2KHGAuiezR6WDhMf2I93yIX5ww==
X-Received: by 2002:a05:600c:4588:b0:421:6b83:2a65 with SMTP id
 5b1f17b1804b1-4230482fcb4mr79089265e9.17.1718612863760; 
 Mon, 17 Jun 2024 01:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT+yEWqh9tL7dNBr08GIopqpGEmGfeg8JqElUfiuaTLLZQUDToGl0xzErR5JdI7F4rQdylPg==
X-Received: by 2002:a05:600c:4588:b0:421:6b83:2a65 with SMTP id
 5b1f17b1804b1-4230482fcb4mr79089115e9.17.1718612863238; 
 Mon, 17 Jun 2024 01:27:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602feb0sm149517605e9.20.2024.06.17.01.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 01:27:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/panic: depends on !VT_CONSOLE
In-Reply-To: <4a324a2e-0daf-488e-a3d8-ed27089e6cb9@redhat.com>
References: <20240613154041.325964-1-jfalempe@redhat.com>
 <87r0cxqcrc.fsf@minerva.mail-host-address-is-not-set>
 <4a324a2e-0daf-488e-a3d8-ed27089e6cb9@redhat.com>
Date: Mon, 17 Jun 2024 10:27:41 +0200
Message-ID: <87o780q8hu.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

> On 16/06/2024 14:43, Javier Martinez Canillas wrote:
>> Jocelyn Falempe <jfalempe@redhat.com> writes:
>> 
>> Hello Jocelyn,
>> 
>>> The race condition between fbcon and drm_panic can only occurs if
>>> VT_CONSOLE is set. So update drm_panic dependency accordingly.
>>> This will make it easier for Linux distributions to enable drm_panic
>>> by disabling VT_CONSOLE, and keeping fbcon terminal.
>>> The only drawback is that fbcon won't display the boot kmsg, so it
>>> should rely on userspace to do that.
>>> At least plymouth already handle this case with
>>> https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224
>>>
>>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index a9df94291622..f5c989aed7e9 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
>>>   
>>>   config DRM_PANIC
>>>   	bool "Display a user-friendly message when a kernel panic occurs"
>>> -	depends on DRM && !FRAMEBUFFER_CONSOLE
>>> +	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
>> 
>> I thought the idea was to only make it depend on !VT_CONSOLE, so that
>> distros could also enable fbcon / VT but prevent the race condition to
>> happen due the VT not being a system console for the kernel to print
>> messages ?
>
> Yes, but when writing the patch, I thought that if you have VT_CONSOLE=y 
> and FRAMEBUFFER_CONSOLE=n, then there won't be any race condition, and 
> drm_panic can be enabled safely.

Ah, I see what you mean.

> I don't know if that really matters, and if VT_CONSOLE has any usage 
> apart from fbcon.
>

Right. I don't know...

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

