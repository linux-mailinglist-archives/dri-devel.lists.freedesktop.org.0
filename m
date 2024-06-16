Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44918909D8C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 14:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C712B10E05D;
	Sun, 16 Jun 2024 12:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="USyiJCGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88F410E05D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718541804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xXIz61g4QbO+8zuI4JpTkvPq46OnXJSxRQvivveajgc=;
 b=USyiJCGzdEB8f7t8zwTTvol2Rx5XRrTgIf7BXpvgESgXZ+JvqjkoNkX48sQiuLm3h7+DST
 NFpJPyKJYNgkyINafcYnK7uUIXJc53hqQUVpIpj4gwFkdHdv8Us3fACcqT6SIP4kHkkfLX
 u3UB5v9/0pnvprQNiRjbz9YF2TdW3wE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-yDc6HSRIMbSuzJN768u7Hw-1; Sun, 16 Jun 2024 08:43:22 -0400
X-MC-Unique: yDc6HSRIMbSuzJN768u7Hw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42183fdb37cso26173765e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 05:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718541801; x=1719146601;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xXIz61g4QbO+8zuI4JpTkvPq46OnXJSxRQvivveajgc=;
 b=QzfFsoBkYmi9Zu7Gbd95AIXXMp+X+mqaBNyLVNLtlw0jCpK9bZ1gCOmEi+iJa0MDog
 VRpKSMSWJjTZEsDKe4sU6g6XAtUQX3/OXIe7+XBriN/UmBu5uYSl3edZ+DpFTNI7GS8J
 57CazolJEsZ18nTyrjAJ9xiVFCFLh8hvvZbpE2V/avxtOz2frvzRZX1HrgoG38r6OauD
 cwlFgbUMzPOl94wWQI3kTmxG+xsZvJu7T/upslSJXxm7WNr/Dep9oMq/LotwSC2a+Y8x
 zaaXA9iKr0lDNgxGJBtaOW9IKk93tuf7Fn/0LA9HoS4Rv7etcBVH49IWiY+Fj1r8BXPZ
 kdGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvC7i7BtWKgh/2mZKyASethtn+zTI2PIxuAX69dVMfHC/A1rNTgTlJVKZj1jp+hBCkrLl2fL7E3BgpGlzD1w7Zaj5K/r00Q01LNh6PocWS
X-Gm-Message-State: AOJu0Ywxx8JzbA5UDdFUZVvooczY5uZCdQfeMiKtoeYIjwnNUm4x5U2p
 kVQozE/KnsMztl1B4/cx15v+ng2IBQhWbHM7T8KOIdlm3LXtnQ7Eg8epCXFzHngqlApT60Khj0x
 fIXxavhbi9+5WFzbU7XPNaYL+Pll6feAThftlDcFdFXTqm9qBNJGlYUL4WeonuRFM3w==
X-Received: by 2002:a05:600c:2d51:b0:422:e0a8:439d with SMTP id
 5b1f17b1804b1-423048264dcmr65133305e9.13.1718541801181; 
 Sun, 16 Jun 2024 05:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGilInOl3Z2Ms2RJlcxrxHdlb3+Txgo6UGrCfVzBgF5IlpReOKjf3+cAqyMKuyt/h5QFexV6A==
X-Received: by 2002:a05:600c:2d51:b0:422:e0a8:439d with SMTP id
 5b1f17b1804b1-423048264dcmr65133135e9.13.1718541800663; 
 Sun, 16 Jun 2024 05:43:20 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-423034f4129sm120978495e9.14.2024.06.16.05.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jun 2024 05:43:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/panic: depends on !VT_CONSOLE
In-Reply-To: <20240613154041.325964-1-jfalempe@redhat.com>
References: <20240613154041.325964-1-jfalempe@redhat.com>
Date: Sun, 16 Jun 2024 14:43:19 +0200
Message-ID: <87r0cxqcrc.fsf@minerva.mail-host-address-is-not-set>
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

Hello Jocelyn,

> The race condition between fbcon and drm_panic can only occurs if
> VT_CONSOLE is set. So update drm_panic dependency accordingly.
> This will make it easier for Linux distributions to enable drm_panic
> by disabling VT_CONSOLE, and keeping fbcon terminal.
> The only drawback is that fbcon won't display the boot kmsg, so it
> should rely on userspace to do that.
> At least plymouth already handle this case with
> https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224
>
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index a9df94291622..f5c989aed7e9 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
>  
>  config DRM_PANIC
>  	bool "Display a user-friendly message when a kernel panic occurs"
> -	depends on DRM && !FRAMEBUFFER_CONSOLE
> +	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)

I thought the idea was to only make it depend on !VT_CONSOLE, so that
distros could also enable fbcon / VT but prevent the race condition to
happen due the VT not being a system console for the kernel to print
messages ?

In other words, my understanding from the discussion with Sima was that
this should be instead:

 +	depends on DRM && !VT_CONSOLE

I've tested that and at least I see that a framebuffer console is present
and `echo c > /proc/sysrq-trigger` triggers the DRM panic handler message
(but don't know if the race exists and is just that I was not hitting it).

If my understanding is correct and should only be a depends on !VT_CONSOLE
then feel free to add my:

Tested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

