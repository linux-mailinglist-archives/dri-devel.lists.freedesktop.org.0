Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECAAA800BF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 13:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BDD10E22F;
	Tue,  8 Apr 2025 11:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ypu2W7wq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F3810E22F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744112072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PAhKuQb3RoCqJ3z/VKP8lkfDlIZ0rdzLrgCMtYUeatE=;
 b=Ypu2W7wqIpXpuM2lboTZeljw1dYUbG/c8HvAvINS2OtTBJ+uAgIC/aCW72J4Jh1rFXRue0
 iaW1B0L4XKfxQy/TrlaQ79POh37O84/se/MCLzvhOs38Nx8Kumzr0K3dEPjHCyg8AGoXxX
 qIGGD6TEq6MhlN9XWnuiyAtBrd4yCP8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-2L3igZYEM3e5KweZp_xeUQ-1; Tue, 08 Apr 2025 07:34:30 -0400
X-MC-Unique: 2L3igZYEM3e5KweZp_xeUQ-1
X-Mimecast-MFC-AGG-ID: 2L3igZYEM3e5KweZp_xeUQ_1744112070
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39135d31ca4so2935371f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 04:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744112069; x=1744716869;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PAhKuQb3RoCqJ3z/VKP8lkfDlIZ0rdzLrgCMtYUeatE=;
 b=hZdCAJD0puj2vV1yTMhDGgqvRI0WNvZpZ8TH4bLJbZeAD+4je6NoXZPzbQSEEFQCU3
 9AprCEO92NcMbjJbKISXvzy65YkBPXXeQi/cnFznbFFmwaQtrlwdYt+QdRkvMdyO0qpK
 hmCq9LwyqSPTSI1X/rVGCnMeqwPM7pLAxddHnxGV8OVUWfSyofWxiHxzzwz52lUQpDWh
 IVth7pIQfbPDORrCoZhKDMCcp7r69maXAf+DipZc6iyEdQrULQVfBBHrvQLPb/HqNOXG
 fWSdL+RRjbwIy7tBk/7UztuTtpRxlFCCkMIPHnwF1lzExgSM2WN1ePGf85UBgar6FbjI
 Tz7g==
X-Gm-Message-State: AOJu0YxAdw/J43Zs0MVUHpg9YGhZKaqdl8MERpq7rPyoamwKSh4+RKox
 pLj6S+ud9KhWdXdiFSkOxVfB6Tx+rY7gifAfM/jiLISqjbJV+e5+asBaJvEsDEtrgX5VUdz8UV/
 XIgavSC7+O1qOIVOQnvaBx/LFtzqDjEtEwxBUwhZgyqxlj01GuLGU5TUVO/6I3W3/qw==
X-Gm-Gg: ASbGncvu7HL9ALjK/ygw94X1Py6dA//18W8/u4umSYwhAGKwNzx+RVkeVrgcBBv3ZeR
 HUxDOE5UPZ24vZNXU5icAQxASSTOCgcKxSw+I15bg4fZ7X/S7ovk+VPhJNchHM1ofUfR29ZWZCo
 vBPCXC17MVcuPcphPbmAtFqOrIsQWasee1kiRZtbi29gXZWS6P8QaJYgXNZEawAtiaKN/ybrKL7
 olJWlH6HqWM8FBNuseCb7ZaUG16/udbBDbU0DpKZ/9yibKxUgpe2/nn+3lfT2rpqbO0IKAsjaye
 dM1ubn6zmOY4JOs4ORQeTBnHj7GYVyfwiMFZbStiAyWS+8OdEHgN/mzhPW2p4xQWPWMZOMuRnQ=
 =
X-Received: by 2002:adf:b605:0:b0:391:21e2:ec3b with SMTP id
 ffacd0b85a97d-39d820ab5a7mr1911492f8f.3.1744112069653; 
 Tue, 08 Apr 2025 04:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF7dCMQ395WPISkch1rK8BCQ56JHVKYbHjaY16C0nZdn5ezaBn6zxMmjhUxzXiNWxckPpQoA==
X-Received: by 2002:adf:b605:0:b0:391:21e2:ec3b with SMTP id
 ffacd0b85a97d-39d820ab5a7mr1911463f8f.3.1744112069287; 
 Tue, 08 Apr 2025 04:34:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d9cfsm14619063f8f.78.2025.04.08.04.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 04:34:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <c4669293-0d56-4bdd-9075-01281042b002@suse.de>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <c4669293-0d56-4bdd-9075-01281042b002@suse.de>
Date: Tue, 08 Apr 2025 13:34:27 +0200
Message-ID: <87iknega4c.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uJGQlXq-3dTP0l0CF9teFkjiw1Brb31qIiIHVTPwwVI_1744112070
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi,
>
> lots of good points in the review.
>
> Am 08.04.25 um 12:44 schrieb Javier Martinez Canillas:
> [...]
>>> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
>>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>>> ---
>>>   drivers/gpu/drm/tiny/Kconfig      |  11 +
>>>   drivers/gpu/drm/tiny/Makefile     |   1 +
>>>   drivers/gpu/drm/tiny/st7571-i2c.c | 721 ++++++++++++++++++++++++++++++++++++++
>> I personally think that the tiny sub-directory is slowly becoming a
>> dumping ground for small drivers. Instead, maybe we should create a
>> drivers/gpu/drm/sitronix/ sub-dir and put all Sitronix drivers there?
>>
>> So far we have drivers in tiny for: ST7735R, ST7586 and ST7571 with
>> your driver. And also have a few more Sitronix drivers in the panel
>> sub-directory (although those likely should remain there).
>>
>> I have a ST7565S and plan to write a driver for it. And I know someone
>> who is working on a ST7920 driver. That would be 5 Sitronix drivers and
>> the reason why I think that a dedicated sub-dir would be more organized.
>>
>> Maybe there's even common code among these drivers and could be reused?
>>
>> Just a thought though, it's OK to keep your driver as-is and we could do
>> refactor / move drivers around as follow-up if agreed that is desirable.
>
> That sounds like a good idea. But the other existing drivers are based 
> on mipi-dbi helpers, while this one isn't. Not sure if that's important 
> somehow.
>

Yeah, I don't know. In any case, the driver / module name is not an ABI so
we can always move around the files later if needed.

>>
>>>   3 files changed, 733 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
>>> index 94cbdb1337c07f1628a33599a7130369b9d59d98..33a69aea4232c5ca7a04b1fe18bb424e0fded697 100644
>>> --- a/drivers/gpu/drm/tiny/Kconfig
>>> +++ b/drivers/gpu/drm/tiny/Kconfig
>>> @@ -232,6 +232,17 @@ config TINYDRM_ST7586
>>>   
> [...]
>>> +
>>> +static const uint32_t st7571_primary_plane_formats[] = {
>>> +	DRM_FORMAT_C1,
>>> +	DRM_FORMAT_C2,
>>> +};
>>> +
>> I would add a DRM_FORMAT_XRGB8888 format. This will allow your display to
>> be compatible with any user-space. Your st7571_fb_blit_rect() can then do
>> a pixel format conversion from XRGB8888 to the native pixel format.
>
> It would be a starting point for XRGB8888 on C1/R1. I always wanted to 
> reimplement drm_fb_xrgb8888_to_mono() [1] with the generic _xfrm_ 
> helpers. Once the generic helpers can do such low-bit formats, C2 would 
> also work easily.
>
> [1] 
> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/gpu/drm/drm_format_helper.c#L1114
>

Agreed. But even in its current form that helper is what I had in mind and
what is used by the ssd130x driver too for XRGB8888 -> R1 conversion. There
is no drm_fb_xrgb8888_to_gray2(), but that could be added as a part of this
driver series.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

