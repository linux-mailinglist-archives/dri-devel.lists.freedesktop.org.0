Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF686B80C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 20:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F9C10E254;
	Wed, 28 Feb 2024 19:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NS1oQ/IW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285EF10E254
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 19:22:20 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-36519980c04so538595ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 11:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709148139; x=1709752939;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cWZCONUO1eBq93ur5BQyYMDhfKl8EM5yFU5z78+cztc=;
 b=NS1oQ/IWewx42GZFZzMitu+QpHNZklqM9ul+R/XfvsWffZtE3ky1UnTuMuQEiAN0ei
 Dn6zwg16PomihwAhqM53aFtcVRhm2NJVk9zpziXr3kD9DYoYGkmMpz1oM2DXnWxdTS+W
 5+G+OufftvYZkNfFnRgPQT2EGUzi2UxJg9Yw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709148139; x=1709752939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cWZCONUO1eBq93ur5BQyYMDhfKl8EM5yFU5z78+cztc=;
 b=ku6Epzh8xgSMflet2EVjPfVbmQ7W8I5a1EcFT3JfTQYwt1bw/4z5JKwMKEurha5nxa
 4WaCyRxu+W0xHwQiLymoBrrdMQXb5wk1AP7P/DsJdb51Bf4DLNPUosGPj95aP4SuM/0i
 6+vifcRRrY+tLCSHHptpRibHPED6zfZauhkg0Im9jp+Eb244pvhHDkixheM+qLz3az/K
 EgDZtq5KLpMqwxoESsEKX4ilz1nGrm/pVycYrSMqnGdaWqAoX2q/7aBZamPLuOLQG0Hy
 hgTUYND08+BlDTynEZIlY3eGNedyukzmkCxQAcqjeqKwmG8syqTWByqxmRHDuyuqqYiH
 GSYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRkdJ46q6h9jw6PU6hPFFs+YWHQvXXEEnZuvHhJHaU0kVwCju/AmmIP31trcBsTXttGgcQaFoaFRa2mE5Vjk+3rp8on7nx+53xKRjtU84j
X-Gm-Message-State: AOJu0Yy6j9pGAhQYxHuoqolS6fRSvy7E23q4B3W60Y5cDXsSH9+ce47i
 Ig7RIQBVqSG2aY2BriZ0uJlNi7jRhyKkqfd7KXoyRvZ8xHHSL/oLzOTL5E3LVQ==
X-Google-Smtp-Source: AGHT+IFqbcv66YZt2FKNF964iMhI6GTiYtKK3x/4hGk7YfuhA2JWmeUUh4jB5yMEezmNt7X9tFEO2w==
X-Received: by 2002:a92:c5a9:0:b0:365:a9fd:1a7a with SMTP id
 r9-20020a92c5a9000000b00365a9fd1a7amr178874ilt.26.1709148139247; 
 Wed, 28 Feb 2024 11:22:19 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 x3-20020a92d643000000b003638f9a9debsm10233ilp.75.2024.02.28.11.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 11:22:18 -0800 (PST)
Date: Wed, 28 Feb 2024 19:22:18 +0000
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
Subject: Re: [PATCH v5 8/8] usb: misc: onboard_hub: add support for XMOS
 XVF3500
Message-ID: <Zd-H6hVPv1poXoa1@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-8-76b805fd3fe6@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228-onboard_xvf3500-v5-8-76b805fd3fe6@wolfvision.net>
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

On Wed, Feb 28, 2024 at 02:51:35PM +0100, Javier Carrasco wrote:
> The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
> multicore controller for voice processing.
> 
> This device requires a specific power sequence, which consists of
> enabling the regulators that control the 3V3 and 1V0 device supplies,
> and a reset de-assertion after a delay of at least 100ns. Such power
> sequence is already supported by the onboard_hub driver, and it can be
> reused for non-hub USB devices as well.

Please update the commit message, the onboard_hub driver no longer
exists as such with the other patches of this series.

> Once in normal operation, the XVF3500 registers itself as a USB device,
> and it does not require any device-specific operations in the driver.
> 
> [1] https://www.xmos.com/xvf3500/
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

> ---
>  drivers/usb/misc/onboard_usb_dev.c | 2 ++
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index df0ed172c7ec..50f84c5278a2 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -405,6 +405,7 @@ static struct platform_driver onboard_dev_driver = {
>  #define VENDOR_ID_REALTEK	0x0bda
>  #define VENDOR_ID_TI		0x0451
>  #define VENDOR_ID_VIA		0x2109
> +#define VENDOR_ID_XMOS		0x20B1
>  
>  /*
>   * Returns the onboard_dev platform device that is associated with the USB
> @@ -497,6 +498,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 */
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 */
> +	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XVF3500 */

nit: be a bit more specific? e.g. XVF3500 Voice Processor, or XMOS XVF3500

The other entries were implicitly hubs since this was the 'onboard_hub'
driver. It wouldn't be a bad idea to add 'hub' to these entries in the
patch that 'renames' the driver.
