Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C32F86D3B0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2299E10E0BC;
	Thu, 29 Feb 2024 19:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jAXt7v8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718D610E0BC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 19:52:30 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7c7701f95b6so72174239f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709236349; x=1709841149;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2t6iwGhsnNUxY4xM8qxSPssm7+cm45B8gw+DhHQKME4=;
 b=jAXt7v8T2V7KuLu5aS2EZ2QOGYnC+IFyxFKcyj1CJSPwC80jnhPAZkTt4eTwnuD2WF
 b8fc8eEEZSYUAi6I6RNZEcoOMnGYeE2m3XfAhutXuZoZ2Xee+WNqbWiG0VohWLA8S5Hb
 EJ1ZA3cxzxqAUN68ld4cS7Br26eZf7gbNgn+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709236349; x=1709841149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2t6iwGhsnNUxY4xM8qxSPssm7+cm45B8gw+DhHQKME4=;
 b=tlMbV5eoQy73ZPS2qW25IJlV2W0oePG/IAUR/SS4s76mXSQ9LzhFZIltN1lMIYr4sa
 ytieMLdQjNBCbMsuGs0JUivVvlHbcK9hyhQuxVgyBcNsxKoCRLPNr0idK2h8VPaztixC
 wMqHsZbqOmBnZGPZbVVRngfidGfeWh7wyAsHhaGuIHWigj1wxybJi75kABlnB/shf9y5
 PJp10o8JsGveIeNVFcQJcCOOUZbExalXCS9PUcopidEgeMwXccNc9MLTTEy0pH516bSE
 9FQTMGsgkVXpD2FpKsXJpzrshvnMdDpdDKjOKLpRRh9IopUbrE41RrR7rCMJkeEo1fT7
 bFcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7fXYYSGJdEvq1oTzvaAwVcdo5H/dqEGHRAhVeXEkoIm7M9Fsk+s8QAM5PX7INcoDAjHJ0xzz8h+fQpg36VW2nSdEgWVaHUOveCca/buNG
X-Gm-Message-State: AOJu0Yz/4FmBiHpnASnu6CQrUDOyKl7X99A5Bw+fwun5lQkGhGnHgx4O
 C1tUwcmD6E5upOlkSEES+LoQX2Y+1mHuC+3FvTuY0vWM0S+ugLXH/+uiwHNF+A==
X-Google-Smtp-Source: AGHT+IEZumlIxb4G0d4K62o0AbkepaXShc33hqlL9UEbLbxcWjF6LoBXCm4td2IpRYXolb4bY9ObCA==
X-Received: by 2002:a05:6e02:1a8e:b0:365:185a:83ed with SMTP id
 k14-20020a056e021a8e00b00365185a83edmr1768942ilv.10.1709236349457; 
 Thu, 29 Feb 2024 11:52:29 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 6-20020a056e020ca600b003653eb24e14sm492989ilg.78.2024.02.29.11.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 11:52:29 -0800 (PST)
Date: Thu, 29 Feb 2024 19:52:28 +0000
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
Subject: Re: [PATCH v6 7/9] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <ZeDgfIojODIbhs6N@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-7-a0aff2947040@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-7-a0aff2947040@wolfvision.net>
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

On Thu, Feb 29, 2024 at 09:34:50AM +0100, Javier Carrasco wrote:
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
>  drivers/usb/misc/onboard_usb_dev.c | 25 ++++++++++++++++++++++++-
>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 4ae580445408..f1b174503c44 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -261,7 +261,27 @@ static struct attribute *onboard_dev_attrs[] = {
>  	&dev_attr_always_powered_in_suspend.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(onboard_dev);
> +
> +static umode_t onboard_dev_attrs_are_visible(struct kobject *kobj,
> +					     struct attribute *attr,
> +					     int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
> +
> +	if (attr == &dev_attr_always_powered_in_suspend.attr &&
> +	    !onboard_dev->pdata->is_hub)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group onboard_dev_group = {
> +	.is_visible = onboard_dev_attrs_are_visible,
> +	.attrs = onboard_dev_attrs,
> +};
> +__ATTRIBUTE_GROUPS(onboard_dev);
> +

nit: remove one empty line

>  
>  static void onboard_dev_attach_usb_driver(struct work_struct *work)
>  {
> @@ -286,6 +306,9 @@ static int onboard_dev_probe(struct platform_device *pdev)
>  	if (!onboard_dev->pdata)
>  		return -EINVAL;
>  
> +	if (!onboard_dev->pdata->is_hub)
> +		onboard_dev->always_powered_in_suspend = true;
> +
>  	onboard_dev->dev = dev;
>  
>  	err = onboard_dev_get_regulators(onboard_dev);
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index 4da9f3b7f9e9..58cf8c81b2cf 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -12,60 +12,70 @@ struct onboard_dev_pdata {
>  	unsigned long reset_us;		/* reset pulse width in us */
>  	unsigned int num_supplies;	/* number of supplies */
>  	const char * const supply_names[MAX_SUPPLIES];
> +	bool is_hub;			/* true if the device is a HUB */

nit: either drop the comment (the variable name is pretty self explaining),
or s/HUB/hub/ ('hub' isn't an acronym).

Acked-by: Matthias Kaehlcke <mka@chromium.org>
