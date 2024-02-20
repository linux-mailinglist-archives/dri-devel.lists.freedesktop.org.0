Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEDD85B707
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F061C10E276;
	Tue, 20 Feb 2024 09:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iDr2UPuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C660C10E276
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708420655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QdkBCPYDeheTT+uzHIWpGEdO4JJdk+hRLV0yR8IOegg=;
 b=iDr2UPuqSmqV1pN+Y21cU4GThe5oUZm58FpuUsKR23GoECXUPKvMDRIABRNNMriv5ecAo8
 XEIUAQYaA2vGSw7pt8k++p4FocMwjvFWRVcfYzjzuuYGSjFrixo4fNSDo0IN8PO9mM/VCp
 wLcmTeguPPD6G2P4kfJJ4I+QcjemMpk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-I9cUsCvfMcOuyt5PGAguTQ-1; Tue, 20 Feb 2024 04:17:34 -0500
X-MC-Unique: I9cUsCvfMcOuyt5PGAguTQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5116d7eb706so4222516e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708420652; x=1709025452;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QdkBCPYDeheTT+uzHIWpGEdO4JJdk+hRLV0yR8IOegg=;
 b=kMxMyppaklPWiwZFKip14qllv9UWcYFd+9yc9F9F3TBY0am/mGoEcrHAj0FAQx9RPH
 BmmkM63oX+9XhxpbGBPqphcy2wB1aReJHE+7BApSPfPK6UNaxzs4BM7pk0yM7bBWMDzT
 iH23DFfUULX+EIyEnhoBDMDi0/AcXrz1qGZG4CEDjMMhymFDKKRI5FzDmuILVviSfrGI
 uht5butGW0lO9JshelpDCi9hN1WRhJHGiX7rbCuGeCNS5Tm2hBtxaKr53lIWtYDfVZiT
 4YOmTRwQbG0eBAmxGVylDmKZTU02FQJoVXF63ZyeSN+KwNdO1Afi65dGuk9G50BNAe1s
 4UjQ==
X-Gm-Message-State: AOJu0YxeHLIDw7aiK8jEp/09Cr6P9C00vcICJIpDjBZ9du0wizd1fwqS
 GiJK0RKokBUsa+Evd36mcLvNc90V1kS9hHJBqtpS8CWvDUa8bOG6mhQfCcWBkavvuZ3FNdRqyqk
 KmW8GuVVJ6Lg4p3APq05vygbEc61AzW8T2k/PPnbb/LIdPAdblxt4VOJuwQu1CPRubg==
X-Received: by 2002:ac2:5e62:0:b0:512:a93a:f5a5 with SMTP id
 a2-20020ac25e62000000b00512a93af5a5mr4159543lfr.19.1708420652694; 
 Tue, 20 Feb 2024 01:17:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAJvY45CWeh5zWa4RXaJeTqSuMBy6I0QeL2Im2jjuR1AxRWVjKK6LynUjbfe5DTheoNd69ag==
X-Received: by 2002:ac2:5e62:0:b0:512:a93a:f5a5 with SMTP id
 a2-20020ac25e62000000b00512a93af5a5mr4159530lfr.19.1708420652349; 
 Tue, 20 Feb 2024 01:17:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c45c600b00412696bd7d9sm4074941wmo.41.2024.02.20.01.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:17:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 01/10] backlight: Match backlight device against struct
 fb_info.bl_dev
In-Reply-To: <20240212162645.5661-2-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-2-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:17:31 +0100
Message-ID: <87bk8bjxzo.fsf@minerva.mail-host-address-is-not-set>
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Framebuffer drivers for devices with dedicated backlight are supposed
> to set struct fb_info.bl_dev to the backlight's respective device. Use
> the value to match backlight and framebuffer in the backlight core code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/backlight.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 86e1cdc8e3697..48844a4f28ad3 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -98,7 +98,8 @@ static int fb_notifier_callback(struct notifier_block *self,
>  {
>  	struct backlight_device *bd;
>  	struct fb_event *evdata = data;
> -	int node = evdata->info->node;
> +	struct fb_info *info = evdata->info;
> +	int node = info->node;
>  	int fb_blank = 0;
>  
>  	/* If we aren't interested in this event, skip it immediately ... */
> @@ -110,8 +111,12 @@ static int fb_notifier_callback(struct notifier_block *self,
>  
>  	if (!bd->ops)
>  		goto out;
> -	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
> +	else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
>  		goto out;
> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> +	else if (info->bl_dev && info->bl_dev != bd)

If the driver doesn't provide a struct backlight_ops .check_fb callback, I
think that having an info->bl_dev should be mandatory ? Or at least maybe
there should be a warning if info->bl_dev isn't set ?

The would be a driver bug, right ?

Regardless, the change makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

