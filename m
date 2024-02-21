Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F885E731
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 20:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F4E89304;
	Wed, 21 Feb 2024 19:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PsDeqKL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024E389304
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 19:24:14 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7c029beb8efso4447639f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 11:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708543454; x=1709148254;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0yFTzTjr3GTZORxDHTHVOaXJnjBMrs5r+BDpbCsO/O0=;
 b=PsDeqKL4znVBNSiN3fQq1xCzuZfysbKhjAtYa3wAm8oGBj2OMrEmTLXaZDrjY0fY1e
 shCWtQySv5sX5d3wFHKSG914ZDaTRF9OZeZDC5WvN2lLFaAPegmY0LigA7h1gK3jBMvi
 RNBuDU5pLwK+4bMQbZemvi8+wZBzHUna8c/6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708543454; x=1709148254;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yFTzTjr3GTZORxDHTHVOaXJnjBMrs5r+BDpbCsO/O0=;
 b=UgdVvMOWdSZ5CtXVcun9zUfN/G7ycBJjuz56JFotJoySMGSKsz25QTh5U9MwXfwMn8
 7NKeoT1YcdlYHNHZ7Uu9GuAzfm2qXQB9BTCq8+Nvn6f2jvMXErvvOtEXgdCY3tdvpW6o
 7nBJ2GBcIl23NezBoEa6W5diLf94eDGVGyvqpGt8fegPvTwXuM9ZvsnTmpKrDVGASTyg
 2UMx5B4asflYo2zBWzTExa5Nhz7zv324uB+/P2rz9qQ3NEHGiLf5Bwt/sM2jX0iHUBJJ
 f8fSWJy/r7+kyoSQfPSj9KzNErJc8+mAfXrhzZqyaAyUJC5S5vAQ543DEZoQ7TnKh+lw
 JMWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQD+ARjMgbhIs8zZUE3y8OBMm+csUJDnatiqnZhYE9GbkmYCOjlAjn/RNpbTmOK7aD5Wh7ApdioOoBNTsYZVJvU0VtIZYFM0fRuP5bkJFx
X-Gm-Message-State: AOJu0Yy/BxiIHRJPu55EZFP2g2vkOP/f80ycF7bG4ScvOLazyYqOVjeI
 g2OjOh/z3DHHCCQGafrJ+P02ITNZQDuMZbmLED+3l9PK33ofpy7H2uS+jQo96g==
X-Google-Smtp-Source: AGHT+IE291cBjzdobD8lyxusA74siOxGXcy/qiDGaMre5yQogt2xjfceKZiBvFi5jaiIFeXbw+8BWA==
X-Received: by 2002:a6b:e519:0:b0:7c4:89b2:8084 with SMTP id
 y25-20020a6be519000000b007c489b28084mr423301ioc.1.1708543453597; 
 Wed, 21 Feb 2024 11:24:13 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com.
 [35.222.220.147]) by smtp.gmail.com with UTF8SMTPSA id
 x17-20020a02ac91000000b00473f31f96desm2836260jan.90.2024.02.21.11.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 11:24:13 -0800 (PST)
Date: Wed, 21 Feb 2024 19:24:12 +0000
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
Subject: Re: [PATCH v4 2/8] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <ZdZN3FIS4zcKe4Kw@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>
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

On Tue, Feb 20, 2024 at 03:05:46PM +0100, Javier Carrasco wrote:
> Most of the functionality this driver provides can be used by non-hub
> devices as well.
> 
> To account for the hub-specific code, add a flag to the device data
> structure and check its value for hub-specific code.

Please mention that the driver doesn't power off non-hub devices
during system suspend.

> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_dev.c |  3 ++-
>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 2103af2cb2a6..f43130a6786f 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -129,7 +129,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
>  		if (!device_may_wakeup(node->udev->bus->controller))
>  			continue;
>  
> -		if (usb_wakeup_enabled_descendants(node->udev)) {
> +		if (usb_wakeup_enabled_descendants(node->udev) ||
> +		    !onboard_dev->pdata->is_hub) {


This check isn't dependent on characteristics of the USB devices processed
in this loop, therefore it can be performed at function entry. Please combine
it with the check of 'always_powered_in_suspend'. It's also an option to
omit the check completely, 'always_powered_in_suspend' will never be set for
non-hub devices (assuming the sysfs attribute isn't added).

>  			power_off = false;
>  			break;
>  		}

Without code context: please omit the creation of the 'always_powered_in_suspend'
attribute for non-hub devices. As per above we don't plan to hone it, so it
shouldn't exist.
