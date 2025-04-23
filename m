Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E10A99800
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 20:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14C610E08C;
	Wed, 23 Apr 2025 18:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D40aiJj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F331610E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745433366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DZNe45ridILK2CdOVqF5AQIHmwtE4BwCZt3v56x2yIY=;
 b=D40aiJj7VkjI7cD+U+3ExIirW2Nz0eQB2QVnjcXzFVmg7kRk0mKC6b/UoDdRCAA42VXcPx
 KXvZQ75EBadyAVD606urG5ZL/NU3srcANoVSB7jXHXPvGAvHMy4oKLY9UjNSfJa33RDB4p
 YPu2TEoGuY1XfRqLbHVLef4FhUhbFO4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-eQM2qtymOYCYhQbKwXQFvw-1; Wed, 23 Apr 2025 14:36:04 -0400
X-MC-Unique: eQM2qtymOYCYhQbKwXQFvw-1
X-Mimecast-MFC-AGG-ID: eQM2qtymOYCYhQbKwXQFvw_1745433364
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso761575e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 11:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745433363; x=1746038163;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DZNe45ridILK2CdOVqF5AQIHmwtE4BwCZt3v56x2yIY=;
 b=ZdSpviyhq+fJURd/NFJZNeumm4pS3lq2O4D8b9Q5CJoRvbCw1ZYcoZe2GvgV5LMcfc
 d9dVybS8D2MlcibEi6wfgY8mlfhuCinKa9lWv0jcS4QoGENQ+qsoyGuLLhpm7yT+w+/d
 nM+t9Q9yQlpzeitUQSExiwIWpEfkUESpLZn6CIvW6ZVxpAoCgLE7X/lUN/t8AXcEBX/e
 0vpDEKwycK7EsCmbQbVm6G/viX6LVutod4sdF3+Hi7kwAfzJNz57jD6Jg9l7Zpdh/HjJ
 e+9Dzx7lobmBusrYJ+R+a0pGd/tpyPYQsooTth5DVTz0VorOVjOxir9mx8AFj0D5Eo2R
 aBbA==
X-Gm-Message-State: AOJu0YyXor3KGwnWuVXsl7alurMw9cVFGOOiNn0feZilPjD7olxJAuST
 80RwX2MgZ7oknWqUaYMArYe2BN6Co4HHCMGepXWVRrN2bwJxmPrVp9oXjuwhI2wzGKB4lncphRJ
 0uSgttG2J0h9NV4EFl7CJ4x/7+1WXYx7/7tNmNWFNZjmIwmlPV74+1ERqvOZf3js8Mg==
X-Gm-Gg: ASbGncswDM9ZbS9EVi3No0o6hCboNk1oQFcpk2eZDv4Uyu1hYFCgNa7069Fhd7BzX7b
 l1SVWUWk3FiPo6eZ3COJdraJaaRPZQf4twQRc70/IQi44NBVYdHEt8cTLKS7vB0CNAC63QeSxkE
 pciweyqbCUQ0QLlpwmIEaZB15LjbqKn/PTo2obskyelBIjyBEQbX1MqJb/cpqm49v+pJCV1SQ46
 2XYQQBF9jdYRvs1WCW6hPgz7ZFp2BNBGPafjy2gaH6H+CFkAF+g5j+as8zHoxhaCv8AyPZSYKcx
 BTlOwiunlsqyfAgRFDeZw2SbnBBvEfLr0eqrJXOuKXOudYJp6s8+4fCT3oxX3mah1o1FTA==
X-Received: by 2002:a5d:648d:0:b0:39c:142c:e889 with SMTP id
 ffacd0b85a97d-3a06c4154f3mr579130f8f.27.1745433363545; 
 Wed, 23 Apr 2025 11:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEscSOJRnvzbjZw78Ojyv2Eu8GFNx3irhr5ooUj/zzBGPxiIgsSfqlwkRsklP5kZCHqZ8vATw==
X-Received: by 2002:a5d:648d:0:b0:39c:142c:e889 with SMTP id
 ffacd0b85a97d-3a06c4154f3mr579105f8f.27.1745433363150; 
 Wed, 23 Apr 2025 11:36:03 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa5a2300sm19349612f8f.101.2025.04.23.11.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 11:36:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v5 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <20250423-st7571-v5-2-a283b752ad39@gmail.com>
References: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
 <20250423-st7571-v5-2-a283b752ad39@gmail.com>
Date: Wed, 23 Apr 2025 20:36:01 +0200
Message-ID: <87v7quafou.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3cujtHaoozkYJrApgBnlMha3al-ib_PXrc_7RJgrp1I_1745433364
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

I tried to apply your patches to drm-misc and found some issues, so I will
have to ask you to do a final re-spin. Sorry about that...

> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/gpu/drm/tiny/Kconfig      |   11 +
>  drivers/gpu/drm/tiny/Makefile     |    1 +
>  drivers/gpu/drm/tiny/st7571-i2c.c | 1007 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 1019 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 94cbdb1337c07f1628a33599a7130369b9d59d98..e4a55482e3bcd3f6851df1d322a14cbe1f96adfb 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -232,6 +232,17 @@ config TINYDRM_ST7586
>  
>  	  If M is selected the module will be called st7586.
>  
> +config DRM_ST7571_I2C
> +	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
> +	depends on DRM && I2C && MMU
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  DRM driver for Sitronix ST7571 panels controlled over I2C.
> +
> +	  if M is selected the module will be called st7571-i2c.
> +

checkpatch here complains about:

WARNING: please write a help paragraph that fully describes the config symbol with at least 4 lines
#144: FILE: drivers/gpu/drm/tiny/Kconfig:215:                                                            
+config DRM_ST7571_I2C
+       tristate "DRM support for Sitronix ST7571 display panels (I2C)"                                  
+       depends on DRM && I2C && MMU                                                                     
+       select DRM_GEM_SHMEM_HELPER                                                                      
+       select DRM_KMS_HELPER                                                                                                                                                                                      
+       select REGMAP_I2C
+       help                                                                                             
+         DRM driver for Sitronix ST7571 panels controlled over I2C.                                     

but honestly I think is just silly and your explanation is good enough so
you could ignore it if you want.

>  config TINYDRM_ST7735R
>  	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
>  	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 60816d2eb4ff93b87228ed8eadd60a0a33a1144b..eab7568c92c880cfdf7c2f0b9c4bfac4685dbe95 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
>  obj-$(CONFIG_DRM_OFDRM)			+= ofdrm.o
>  obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
>  obj-$(CONFIG_DRM_SIMPLEDRM)		+= simpledrm.o
> +obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o

this chunk doesn't apply on top of the drm-misc/drm-next branch [1] due
the simpledrm driver being moved out of the tiny directory. Please do a
rebase on top of that branch when posting a v6.

[1]: https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next

[...]

> +++ b/drivers/gpu/drm/tiny/st7571-i2c.c

Please run ./scripts/checkpatch.pl --strict -f -- drivers/gpu/drm/tiny/st7571-i2c.c
since checkpatch complains about some issues. Other than some style nits, it has some
good points IMO. In particular:

[...]

> +
> +static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct drm_rect *rect)
> +{
> +	struct st7571_device *st7571 = drm_to_st7571(fb->dev);
> +	uint32_t format = fb->format->format;

CHECK: Prefer kernel type 'u32' over 'uint32_t'                                                          
#523: FILE: drivers/gpu/drm/tiny/st7571-i2c.c:348:
+       uint32_t format = fb->format->format;

[...]

> +
> +static const uint64_t st7571_primary_plane_fmtmods[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};

CHECK: Prefer kernel type 'u64' over 'uint64_t'                                                          
#611: FILE: drivers/gpu/drm/tiny/st7571-i2c.c:436:                                                       
+static const uint64_t st7571_primary_plane_fmtmods[] = {

[...]

> +static void st7571_reset(struct st7571_device *st7571)
> +{
> +	gpiod_set_value_cansleep(st7571->reset, 1);
> +	udelay(20);

CHECK: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#993: FILE: drivers/gpu/drm/tiny/st7571-i2c.c:818:                                                       
+       udelay(20);

Specially since this is not in atomic context AFAIK. The Delay and sleep
mechanisms [2] doc has a good explanation about the different functions
provided by the Linux kernel for this.

Feel free to keep my R-B tag if you decide that some of the checkpatch
suggestions are applicable. The most important bit for me is the rebase,
to allow your patch to be cleanly applied on the drm-misc-next branch.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

