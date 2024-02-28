Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC886B6DC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 19:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757BF10E298;
	Wed, 28 Feb 2024 18:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GfPERpgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19ADF10E298
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 18:10:48 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3652762edcfso327895ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709143847; x=1709748647;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mr+bD36IoIOKszW1o5Rb9R/mzBzmVVAn2qquBqx2Jtw=;
 b=GfPERpgo7sScZU8cv/YmbPsiO/4JqNHKs5Osb/pK6fT5yFmW0p7ajsCt6m9DNRRiUB
 FtR2Ruq0snuWdlp1kBvko4yvN7k1bGRRKqfi+/wt4eB5k8mLspst2D3J+D/TqCRCk7P+
 SGg1Zm9z1RYqt2mOUVOH03lPtK5OnNPFhQYLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709143847; x=1709748647;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mr+bD36IoIOKszW1o5Rb9R/mzBzmVVAn2qquBqx2Jtw=;
 b=S0xrXZIwyaO4FOVTZwvP/ZX+EZFdSZxMiAhOYzez7JRJjqMDKXqkVApuRgpz6oBkHS
 gb0xqDvzZ9ceGVPBULCYTUfEj/8C7Ua8CrGO8ecmOWXEgh/iRm+kcycpd/J3V/+E/6Ca
 k7bBPo5cBPFZzttQMhJ0ZHiR9IfxQo/yPHThDcfxSkdGuWMt7WplHwmXxF4FU/f9buN2
 xvce7tGI5vU0JoEGDizIGrqpBUieaKJbstScfsov2kBxuigSDj00SyrG4sLeKsJbY7bE
 wW3U2dpBNzxpI1UG6Iq65dkgnt8jRHs4bMPfmykfm0OaPAdmdlrORJpNBrd5HudEgwM0
 fy+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI18W/k19uvN7eYSm1ClYy81Rpdzijr/qwNAOAzF9jIDsm87jPkWxT5J6ri2PaGL9WzP9uaRBkacBGEQfi0aYNvNTsfTiXZ8rfIXPtYXvM
X-Gm-Message-State: AOJu0YyPzDK7roHa3dh0sMI3UQ4sUiNdHs982m0SfIz0P4+AOpIvnqMb
 xxUxcBuKfoEG7YiyCVNh3ilLae4kFPBqme0sSSvLZvUgMwLGXYKQ4l1/4GUZ4Q==
X-Google-Smtp-Source: AGHT+IEcf57nNkZHLpk4X+rVu40fpnQC+KxfZAodN+3tIS0La+wWipkcmp8niTZkNbjmDf9zGzJZYw==
X-Received: by 2002:a92:dd04:0:b0:365:b9c8:4436 with SMTP id
 n4-20020a92dd04000000b00365b9c84436mr25912ilm.10.1709143847146; 
 Wed, 28 Feb 2024 10:10:47 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 bp24-20020a056e02349800b00363da909ebcsm2915892ilb.56.2024.02.28.10.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 10:10:46 -0800 (PST)
Date: Wed, 28 Feb 2024 18:10:45 +0000
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
Subject: Re: [PATCH v5 6/8] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <Zd93JZTlN4BCxWm7@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-6-76b805fd3fe6@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228-onboard_xvf3500-v5-6-76b805fd3fe6@wolfvision.net>
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

On Wed, Feb 28, 2024 at 02:51:33PM +0100, Javier Carrasco wrote:
> Most of the functionality this driver provides can be used by non-hub
> devices as well.
> 
> To account for the hub-specific code, add a flag to the device data
> structure and check its value for hub-specific code.
> 
> The 'always_powered_in_supend' attribute is only available for hub
> devices, keeping the driver's default behavior for non-hub devices (keep
> on in suspend).
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 25 +++++++++++++++++++++++--
>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>  2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index e1779bd2d126..df0ed172c7ec 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -132,7 +132,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
>  	struct usbdev_node *node;
>  	bool power_off = true;
>  
> -	if (onboard_dev->always_powered_in_suspend)
> +	if (onboard_dev->always_powered_in_suspend &&
> +	    !onboard_dev->pdata->is_hub)
>  		return 0;

With this non-hub devices would always be powered down, since
'always_powerd_in_suspend' is not set for them. This should be:

  if (!onboard_dev->pdata->is_hub ||
       onboard_dev->always_powered_in_suspend)

Checking for the (non-)hub status first is clearer IMO, also it avoids
an unneccessary check of 'always_powered' for non-hub devices.

Without code context: for hubs there can be multiple device tree nodes
for the same physical hub chip (e.g. one for the USB2 and another for
the USB3 part). I suppose this could also be the case for non-hub
devices. For hubs there is the 'peer-hub' device tree property to
establish a link between the two USB devices, as a result the onboard
driver only creates a single platform device (which is desired,
otherwise two platform devices would be in charge for power sequencing
the same phyiscal device. For non-hub devices there is currently no such
link. In many cases I expect there will be just one DT entry even though
the device has multiple USB interfaces, but it could happen and would
actually be a more accurate representation.

General support is already there (the code dealing with 'peer-hub'), but
we'd have to come up with a suitable name. 'peer-device' is the first
thing that comes to my mind, but there might be better options. If such
a generic property is added then we should deprecate 'peer-hub', but
maintain backwards compatibility.
