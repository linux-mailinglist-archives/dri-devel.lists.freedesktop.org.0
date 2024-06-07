Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF288FFF0A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 11:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214A010E1B0;
	Fri,  7 Jun 2024 09:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KYjmQbJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6A810E1B0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717751783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PYe3lkVGKp1SW9LK9AjI27aSQedu/Q7W2rD4V1HvRKk=;
 b=KYjmQbJbKF0V+9/YHDbAXvYpawu+HpuZuNpp37AOuf/HHeZ1/3wK9F1UsAyEcKC6iHf0HV
 JDAS7gkUWaJZVtpsj+G/UFP3rX16ug9F3XEEM0gTPdP5WFoT1YTb0fqtd2ZL50arKuzxqb
 C8FdG/7dI5fQSrpmhrI4g+Z3wMqIeH4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-km8rl_DpPa6tmxBxGE0OMQ-1; Fri, 07 Jun 2024 05:16:20 -0400
X-MC-Unique: km8rl_DpPa6tmxBxGE0OMQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-52b890339d9so1493504e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 02:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717751779; x=1718356579;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PYe3lkVGKp1SW9LK9AjI27aSQedu/Q7W2rD4V1HvRKk=;
 b=W0gL6oHO0gbWL+S+QDqYpSrIDLGI8kUdrNCCPOs5U2BBFrHTzsws9abd9/0oHKgYLz
 L7zqQBAZ34De0OAY2bm+UyuCrZLwqh0zEfhP9NSjralD/ZLOSny2SwFu2x42Qj7/G/h0
 cbDhs8igbaezDt0/HVfwIpoeVAEEta8gIn1sxJ1MyimGw1yKG+M04kuis0WUDfKtf/oH
 qeFHr78Hv7VOmOEpx5JYdt7I09ytKiBnZ7/pQMPYsUORY8WVdtU9OVz10nO83yDT8oW0
 voBhs4GEMn1Wnc/O0n/abPWdvw/DJIu5j0/2eNrxdv8GyRPcuYkgUhlwb1WugLYYbnGp
 Ksog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbvWGavzyyvx0aSl/EAZf/uudj6ue6AA8VnrpqJvvAVcEbWJbOGYKV+nR0WkHl1Ce0+XR25E0b3JcZDvX2iV8IvEDefZ2TXbpiZrR5GxCG
X-Gm-Message-State: AOJu0Yxju58IgIuxpohK/nEJsuamydbI9RzJoT6FGew9tfUmpptbTfeg
 RNE0GluMrNxYaY8Ho/oBspGQ4x8PpS5comFXp/uCRAUXaw00z370NKSA6qG+kJ2GfAh0gXJerrE
 9jR3dpTyTTDmHaflBVqQqEXoIYXhY0Cr6+lOlczjeefQq0Q2E5yPJWhHzyIf75u6Vug==
X-Received: by 2002:ac2:464b:0:b0:52b:3a6b:4066 with SMTP id
 2adb3069b0e04-52bb9fc5801mr1317851e87.42.1717751779146; 
 Fri, 07 Jun 2024 02:16:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLZfhK7D1BOh748WqhMATyrHEKslg1nrYmEoh1b9qplDFR0ATmJgUj2pgtG6uUyOXzX/oRWA==
X-Received: by 2002:ac2:464b:0:b0:52b:3a6b:4066 with SMTP id
 2adb3069b0e04-52bb9fc5801mr1317840e87.42.1717751778632; 
 Fri, 07 Jun 2024 02:16:18 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm3566130f8f.73.2024.06.07.02.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 02:16:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2 3/3] drm/panic: Add a kmsg panic screen
In-Reply-To: <20240603095343.39588-4-jfalempe@redhat.com>
References: <20240603095343.39588-1-jfalempe@redhat.com>
 <20240603095343.39588-4-jfalempe@redhat.com>
Date: Fri, 07 Jun 2024 11:16:17 +0200
Message-ID: <87wmn1jeou.fsf@minerva.mail-host-address-is-not-set>
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

> Add a kmsg option, which will display the last lines of kmsg,
> and should be similar to fbcon.
> Add a drm.panic_screen module parameter, so you can choose between
> the different panic screens available.
> two options currently, but more will be added later:
>  * "user": a short message telling the user to reboot the machine.
>  * "kmsg": fill the screen with the last lines of kmsg.
>
> You can even change it at runtime by writing to
> /sys/module/drm/parameters/panic_screen
>

Great!

> v2:
>  * use module parameter instead of Kconfig choice
>    (Javier Martinez Canillas)
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig     |  11 ++++
>  drivers/gpu/drm/drm_panic.c | 108 ++++++++++++++++++++++++++++++++----
>  2 files changed, 109 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 9703429de6b9..944815cee080 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -137,6 +137,17 @@ config DRM_PANIC_DEBUG
>  	  This is unsafe and should not be enabled on a production build.
>  	  If in doubt, say "N".
>  
> +config DRM_PANIC_SCREEN
> +	string "Panic screen formater"
> +	default "user"
> +	depends on DRM_PANIC
> +	help
> +	  This option enable to choose what will be displayed when a kernel
> +	  panic occurs. You can choose between "user", a short message telling
> +	  the user to reboot the system, or "kmsg" which will display the last
> +	  lines of kmsg.

Maybe I would mention here that this is only about the default, but that
can be changed using the "drm.panic_screen=" kernel cmdline parameter or
writting to the /sys/module/drm/parameters/panic_screen sysfs entry.

[...]

> +static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
> +{
> +	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
> +	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
> +	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);

Dan reported that get_default_font() can return NULL....

> +	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
> +	struct kmsg_dump_iter iter;
> +	char kmsg_buf[512];
> +	size_t kmsg_len;
> +	struct drm_panic_line line;
> +	int yoffset = sb->height - font->height - (sb->height % font->height) / 2;
> +
> +	if (!font)
> +		return;
> +

... so you have to calculate yoffset after checking if the font is not NULL.

with that fixed:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

