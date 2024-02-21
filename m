Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768DF85E8F6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 21:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E4810E140;
	Wed, 21 Feb 2024 20:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mfO37Ebc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C83A10E140
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 20:25:18 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7c48e13e0d7so305126139f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708547117; x=1709151917;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2wkgeRh9IF6PLJzH5c/hW4z1k21RwGIOmpMXRCu5Jsc=;
 b=mfO37EbcbarX3MRPaKTZLeiWrRbvpaJ8Fp4XWg1GmFXb8JgcZwWv6+P0oiOdi31c2l
 0jlp9VBGSryZDMphAZ3J+9XRmU5YNV/19/8Hp2fu00NB9mcMs83d+SiUV0T3s2TuxAO7
 +Pz6DgbIHMsoTVvO4gD+pUtoEMspaFIxSXLrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708547117; x=1709151917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2wkgeRh9IF6PLJzH5c/hW4z1k21RwGIOmpMXRCu5Jsc=;
 b=oIRW/yzfgnPHtvD0gu56DE2qgRJuJ7/lgHd3mU6QjgAyDp7S4BUGma9i3TnuNIRDTa
 aHZIwwlr8KFEX6bmM1eorZodFeArs2ODqwFd7Em8OStj8kG2eodUijt92tC51smB4dDw
 PdrIus5nHrj3SRbhUd7NH1QjcZqu/0LiGRNZvIB3m5SgJrU9Wpc6hIwk5XfOZjOCr9De
 RryjwvI+pE8xHYWALyEM1NfpYF12tpQTWTsFltXPCJP9aolPu7HkBMGWc/zlqZhqJCm5
 ZOZ/O3H0Eq9OvHMwfOgAMwqIl1NkgtMY61UHHkeaVAH1lP2zzXkBJxBqra5usvzUglHM
 73Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfE4CNUEzvm0HNGjxprVE6O2QL1hQun9rjA6odOy/rvxwubeuJmktZqOK6P4H0q1Y13VJurpCEOVVg9zggEUQJ/79ogNIyTQasCyJrIABj
X-Gm-Message-State: AOJu0Yw2IqxwPILLD1ZgwEhI3CfTgMXmj8AAmJeq2c/B3BMDENlHXvpD
 +Cojn1yJGAAxbV+V/cN7tL7BgEdcf0TM8Nf/ulGOdIS7JSwXYF1X0/vDKSw63w==
X-Google-Smtp-Source: AGHT+IHHf/4LjAJjVkP9U0N3B1K1orn7osgB11jKx5iI8zxropaoPlYRW14hh4HVSps9PWMjT6jAMg==
X-Received: by 2002:a05:6602:3408:b0:7c4:8a72:d17b with SMTP id
 n8-20020a056602340800b007c48a72d17bmr24641170ioz.13.1708547117013; 
 Wed, 21 Feb 2024 12:25:17 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com.
 [35.222.220.147]) by smtp.gmail.com with UTF8SMTPSA id
 b99-20020a0295ec000000b004742c0fafb5sm1724032jai.15.2024.02.21.12.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 12:25:16 -0800 (PST)
Date: Wed, 21 Feb 2024 20:25:16 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 6/8] usb: misc: onboard_dev: use device supply names
Message-ID: <ZdZcLOlSc3FScjLK@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
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

On Tue, Feb 20, 2024 at 03:05:50PM +0100, Javier Carrasco wrote:
> The current mechanism uses generic names for the power supplies, which
> conflicts with proper name definitions in the device bindings.
> 
> Add a per-device property to include real supply names and keep generic
> names as a fallback mechanism for backward compatibility.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 54 ++++++++++++++++++++------------------
>  drivers/usb/misc/onboard_usb_dev.h | 23 ++++++++++++++++
>  2 files changed, 52 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index f43130a6786f..e66fcac93006 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -29,18 +29,6 @@
>  
>  #include "onboard_usb_dev.h"
>  
> -/*
> - * Use generic names, as the actual names might differ between devices. If a new
> - * device requires more than the currently supported supplies, add a new one
> - * here.
> - */
> -static const char * const supply_names[] = {
> -	"vdd",
> -	"vdd2",
> -};
> -
> -#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
> -
>  static void onboard_dev_attach_usb_driver(struct work_struct *work);
>  
>  static struct usb_device_driver onboard_dev_usbdev_driver;
> @@ -66,6 +54,33 @@ struct onboard_dev {
>  	struct clk *clk;
>  };
>  
> +static int onboard_dev_get_regulator_bulk(struct device *dev,
> +					  struct onboard_dev *onboard_dev)
> +{
> +	unsigned int i;
> +	int err;
> +
> +	const char * const *supply_names = onboard_dev->pdata->supply_names;
> +
> +	if (onboard_dev->pdata->num_supplies > MAX_SUPPLIES)
> +		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
> +				     MAX_SUPPLIES);
> +
> +	if (!supply_names[0])
> +		supply_names = generic_supply_names;

Please change to 'if (!supply_names)' and omit the initialization of
.supply_names for devices that use the generic supply names.

> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index ebe83e19d818..59dced6bd339 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -6,63 +6,86 @@
>  #ifndef _USB_MISC_ONBOARD_USB_DEV_H
>  #define _USB_MISC_ONBOARD_USB_DEV_H
>  
> +/*
> + * Fallback supply names for backwards compatibility. If the device requires
> + * more than the currently supported supplies, add a new one here, and if
> + * possible, the real name supplies to the device-specific data.
> + */
> +static const char * const generic_supply_names[] = {
> +	"vdd",
> +	"vdd2",
> +};
> +
> +#define MAX_SUPPLIES ARRAY_SIZE(generic_supply_names)

This will have to change when support for a device with more than 2 non-generic
supply names gets added. Please use a literal value for MAX_SUPPLIES instead of
ARRAY_SIZE. If the literal is 2 it would still need to change for future devices
with more supplies, but that change would be more straighforward.

> +
>  struct onboard_dev_pdata {
>  	unsigned long reset_us;		/* reset pulse width in us */
>  	unsigned int num_supplies;	/* number of supplies */
>  	bool is_hub;
> +	const char * const supply_names[MAX_SUPPLIES];
> +
>  };
>  
>  static const struct onboard_dev_pdata microchip_usb424_data = {
>  	.reset_us = 1,
>  	.num_supplies = 1,
> +	.supply_names = { NULL },
>  	.is_hub = true,
>  };
>
> ...
