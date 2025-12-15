Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678C1CBDA7F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E24610E417;
	Mon, 15 Dec 2025 11:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h3wXbsHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7131310E417
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765799946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v0bpULWF9nsWlNUyrLgROtaCnqKfxnghggyuP1lmIbw=;
 b=h3wXbsHxjgXmnrFKto7hvdEQKEE3JwFKbuYpqngEiLRdlVp3yRj0yDF1yOtkHmpI/dutu+
 A4XnZx9ppbTnJcXlKCn8GLFN+7w2zK+c6NjC/6Qh4IRFme8YQb4ihnMNX3mw6mwSdd5ELF
 rBe+uiMqmM0tvwAy+7R/WK9rpRqDPwc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-womJCB9AOBWxoxwwU4JD-g-1; Mon, 15 Dec 2025 06:59:05 -0500
X-MC-Unique: womJCB9AOBWxoxwwU4JD-g-1
X-Mimecast-MFC-AGG-ID: womJCB9AOBWxoxwwU4JD-g_1765799944
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-430857e8450so1056597f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 03:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765799944; x=1766404744;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0bpULWF9nsWlNUyrLgROtaCnqKfxnghggyuP1lmIbw=;
 b=ix327dwQaCOGdskmOGgV8uuDcYnGuaPpmzfvOkWIs0BA2qi0IuUVkhIVWyuDa8L+bA
 OdDvLKOQuukiX6Xt5E0DcG9cWyKpXe5omoG7kGHbP/bcbaEWqjNv3ya6tPwApSX5n0h+
 GIlu0J5zLfu0GOJKHFRn7r1xI6FG6kFj2yHeW/i8GkkEYZ1Rg9fPw0rZqwFUG03tcPA5
 M2WjLWNy3TOtEbK/DGo19CeWFflHg2yrewXlP6A+kAgXrWIeM1+ke5abBEd7dOwXtamS
 6ixNDKFb69KkURJb+fxPWLlwIt8jNNFpFsZpaM0jHyT9dzv2KxvDSwia5X3RiD9Nm65q
 /z6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVSiB/oFcLHcsewPV+kYGsl28X9er/+iEjpl59xaR4XyrrNVvl/EPjWWPwpV1V82BT5Dldh7BAaZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWNOCg5UgXmzVZRxBZ/VZtHiIy7poHSqJ5xXU47JS+HGk1Obxf
 KZHR+rymPuHKQx59hLYK1qDnBCPmYeKYr2gEbHENEM3LJhZMibUpjK75Dia6nWglaj6MTqH4voC
 YA0jidYSxqolMDCQtAfMR8NXDBQa2/IZP4TDS0wJq166ubFVPVXveJ7KTsBaN7XT249/pxA==
X-Gm-Gg: AY/fxX7N6OfpcfU8A+DP60OeCTKSttfWPvN83kIepx7h5q2mJEq07UNnd0hkoOHSKJ7
 UtrXtOz1DSpNBNNdQGPeftJ9DJx8796c4ApocStWc8pf85ofB+/rYvI/LUsyVXAqjqjAQZNIozF
 pRnJL+5yaqZljLsldEv6MAVfhkGTdaibuAjO20gKYeUWvT/bqRzKb1ifJs9d4K8int3l8SzeNGW
 93jGqRxvyhBrpipB78zoVtsZhSj/Rnvqq+S7AXcwSkW7ikiUcTEnPOjGLYP6LcC/CHcOGXKQu76
 ovL52gIjYydAHAxpfMZ8Bzd90SAKo4LAivpyIrFZeugLhK1aG/QJ2B6lPOac+J1N5aLpX/b2pdP
 WCJa9y1yeYoqEV5agqmRyxUxFJNciHe03yDXQWVkIPpjYuVH/Wq+UELvxM6LLjAX0GsYXt37216
 q50WY=
X-Received: by 2002:a5d:584e:0:b0:431:327:5dd6 with SMTP id
 ffacd0b85a97d-4310327603fmr11535f8f.8.1765799943695; 
 Mon, 15 Dec 2025 03:59:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZdDwCn4R1w9yVu7KEDin2GU9QZ9kjKKddJEsFtlCvR3E+XGtjFPaq5me+k2YNFS7OQEekrQ==
X-Received: by 2002:a5d:584e:0:b0:431:327:5dd6 with SMTP id
 ffacd0b85a97d-4310327603fmr11507f8f.8.1765799943237; 
 Mon, 15 Dec 2025 03:59:03 -0800 (PST)
Received: from localhost (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a97esm34284355f8f.31.2025.12.15.03.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:59:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Iker
 Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/3] drm: Add driver for Sitronix ST7920 LCD displays
In-Reply-To: <20251212-st7920-v6-2-4d3067528072@gmail.com>
References: <20251212-st7920-v6-0-4d3067528072@gmail.com>
 <20251212-st7920-v6-2-4d3067528072@gmail.com>
Date: Mon, 15 Dec 2025 12:59:01 +0100
Message-ID: <87wm2oj6re.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ix2sj7dNnG1Gm9ub5CO5FGFvEcWwU3x1z90xQA_9G8k_1765799944
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

Iker Pedrosa <ikerpedrosam@gmail.com> writes:

Hello Iker,

> Add a new DRM/KMS driver for displays using the Sitronix ST7920
> controller connected via the SPI bus. This provides a standard
> framebuffer interface for these common monochrome LCDs.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---

[...]

> diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
> index bd139e5a6995fa026cc635b3c29782473d1efad7..2f064a518121bfee3cca73acd42589e8c54cd4d7 100644
> --- a/drivers/gpu/drm/sitronix/Makefile
> +++ b/drivers/gpu/drm/sitronix/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
>  obj-$(CONFIG_DRM_ST7586)		+= st7586.o
>  obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
> +obj-$(CONFIG_DRM_ST7920))		+= st7920.o

You have two closing parenthesis here.

> diff --git a/drivers/gpu/drm/sitronix/st7920.c b/drivers/gpu/drm/sitronix/st7920.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c1e38beedcc660f6db96ec10cd87b2d4e62ee05e
> --- /dev/null
> +++ b/drivers/gpu/drm/sitronix/st7920.c
> @@ -0,0 +1,868 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DRM driver for Sitronix ST7920 LCD displays
> + *
> + * Copyright 2025 Iker Pedrosa <ikerpedrosam@gmail.com>
> + *
> + */
> +
> +#include <linux/bitrev.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>

This header was moved to drivers/gpu/drm/clients/ by commit b86711c6d6e2
("drm/client: Move public client header to clients/ subdirectory").

So it should be instead (and moved above the drm headers includes):

#include <drm/clients/drm_client_setup.h>

> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_shmem.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_plane.h>

You need a #include <drm/drm_print.h> here too since you are using
helpers declared in that header file.

> +#include <drm/drm_probe_helper.h>
> +
> +#define DRIVER_NAME	"sitronix_st7920"
> +#define DRIVER_DESC	"DRM driver for Sitronix ST7920 LCD displays"
> +#define DRIVER_DATE	"20250723"

This isn't used anymore, the struct drm_driver doesn't have a .date field
anymore since commit cb2e1c2136f7 ("drm: remove driver date from struct
drm_driver and all drivers").

There are also some checkpatch warnings, please fix those. Remember to run
the checkpatch.pl script using the --strict option.

Other than these small comments, the driver looks good to me. Once you fix
them, feel free to add to your series:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

