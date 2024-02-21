Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D289485E704
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 20:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCA310E7A1;
	Wed, 21 Feb 2024 19:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VASZNFr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C353710E7A1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 19:14:14 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3650ea7f7d3so8879325ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 11:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708542854; x=1709147654;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F8zo1lAc255qtifgNzkIgJxhJdd7u+u9JZEwC1bq2rM=;
 b=VASZNFr7ztRTaCP/GtSD/cEGJp+6uwkj2GlJ7bjTZFJOxeJzh2HdU18rMSseILBt6H
 fPquOkTek2hXJTIVbvrfZjkAvD28SFYAxabtQxkYVzebBAqds/o3INoMsud8l+6vUqij
 vgAeIAJ0+oX0gcJ5WwZpqrmwBkI1F7ndbdWls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708542854; x=1709147654;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8zo1lAc255qtifgNzkIgJxhJdd7u+u9JZEwC1bq2rM=;
 b=tErVTUVEKc0NGWNATQHQwPN8RGeafaobuKuwqrQfFqUDa2h9AC6zpkUK4U/fJb70XN
 a9P5u5DYg7iHw1rb6ViBvJWfpr89A7aHBLPdyBWZYL06EZ/ct9sgL38MoCmuwGA9L1Ii
 gfxiuILWqsWqOQEpYXrlFn3CWzlQaHS4P7apYquXr1cOtpKWmukh6SdI7wVmL3nDTjjG
 6VVnp/uTNC7sdrN5H5tp4bfMQ5VhB383ZNdVAPQS8b1kFMR0RmXXMBgZsUKaYGQl8GAV
 LIK95ckHsNw6sSq8itRZOvBx6wxBL1J0UcFbtUck7w4dht5zdqCqVWrYsy/zbsjiurbl
 p+lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCNHONCu8vFIKTXp5xcQFgw59NZmdwEaErd03I12Elw/661+/btoxzswjsZxQJaQW4ekera7/ULjAVpxzItHrxWwvRNUizf0olkrecM6BX
X-Gm-Message-State: AOJu0YzgiBBAvA+af0oodCTjtocD/teVm78MXZBcMqUv53xgvlI5lqoD
 J1qY4Xo6DNrr4VOc1kwvhAcPX5U+NqYv32kvnm2AHHRQ93ZnQrGVD3JgzO9kiQ==
X-Google-Smtp-Source: AGHT+IFe6kiWbZW0h5n9v9hgmN46vZNuLBrbQZ0k9xGnJtql/CBhynZKD+fF5/hyYxlbaLjYE4SkGA==
X-Received: by 2002:a05:6e02:12e6:b0:365:32db:ca6d with SMTP id
 l6-20020a056e0212e600b0036532dbca6dmr10729260iln.22.1708542853903; 
 Wed, 21 Feb 2024 11:14:13 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com.
 [35.222.220.147]) by smtp.gmail.com with UTF8SMTPSA id
 t41-20020a05663834a900b004716652f89asm2812188jal.130.2024.02.21.11.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 11:14:13 -0800 (PST)
Date: Wed, 21 Feb 2024 19:14:12 +0000
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
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Matthias Kaehlcke <matthias@kaehlcke.net>
Subject: Re: [PATCH v4 1/8] usb: misc: onboard_hub: rename to onboard_dev
Message-ID: <ZdZLhMIEQ_dwG8_m@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-1-dc1617cc5dd4@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-onboard_xvf3500-v4-1-dc1617cc5dd4@wolfvision.net>
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

On Tue, Feb 20, 2024 at 03:05:45PM +0100, Javier Carrasco wrote:
> This patch prepares onboad_hub to support non-hub devices by renaming
> the driver files and their content, the headers and their references.
> 
> The comments and descriptions have been slightly modified to keep
> coherence and account for the specific cases that only affect onboard
> hubs (e.g. peer-hub).
> 
> The "hub" variables in functions where "dev" (and similar names) variables
> already exist have been renamed to onboard_dev for clarity, which adds a
> few lines in cases where more than 80 characters are used.
> 
> No new functionality has been added.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  ...-usb-hub => sysfs-bus-platform-onboard-usb-dev} |   4 +-
>  MAINTAINERS                                        |   4 +-
>  drivers/usb/core/Makefile                          |   4 +-
>  drivers/usb/core/hub.c                             |   8 +-
>  drivers/usb/core/hub.h                             |   2 +-
>  drivers/usb/misc/Kconfig                           |  16 +-
>  drivers/usb/misc/Makefile                          |   2 +-
>  drivers/usb/misc/onboard_usb_dev.c                 | 518 +++++++++++++++++++++
>  .../misc/{onboard_usb_hub.h => onboard_usb_dev.h}  |  28 +-
>  ...ard_usb_hub_pdevs.c => onboard_usb_dev_pdevs.c} |  47 +-
>  drivers/usb/misc/onboard_usb_hub.c                 | 501 --------------------
>  include/linux/usb/onboard_dev.h                    |  18 +
>  include/linux/usb/onboard_hub.h                    |  18 -
>  13 files changed, 594 insertions(+), 576 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub b/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
> similarity index 67%
> rename from Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
> rename to Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
> index 42deb0552065..cd31f76362e7 100644
> --- a/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
> +++ b/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
> @@ -4,5 +4,5 @@ KernelVersion:	5.20
>  Contact:	Matthias Kaehlcke <matthias@kaehlcke.net>
>  		linux-usb@vger.kernel.org
>  Description:
> -		(RW) Controls whether the USB hub remains always powered
> -		during system suspend or not.
> \ No newline at end of file
> +		(RW) Controls whether the USB device remains always powered
> +		during system suspend or not.

With patch "[2/8] usb: misc: onboard_dev: add support for non-hub devices"
this attribute isn't honed for non-hub devices. With that I'd say leave
the existing comment unchanged, but add a note that this attribute only
exists for hubs. That will also require a change in the patch mentioned
above to omit the creation of the attribute for non-hub devices.

> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> new file mode 100644
> index 000000000000..2103af2cb2a6
> --- /dev/null
> +++ b/drivers/usb/misc/onboard_usb_dev.c
>
> ...
>
> +/*
> + * Returns the onboard_dev platform device that is associated with the USB
> + * device passed as parameter.
> + */
> +static struct onboard_dev *_find_onboard_dev(struct device *dev)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	struct onboard_dev *onboard_dev;
> +
> +	pdev = of_find_device_by_node(dev->of_node);
> +	if (!pdev) {
> +		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
> +		if (!np) {
> +			dev_err(dev, "failed to find device node for peer hub\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		pdev = of_find_device_by_node(np);
> +		of_node_put(np);
> +
> +		if (!pdev)
> +			return ERR_PTR(-ENODEV);
> +	}
> +
> +	onboard_dev = dev_get_drvdata(&pdev->dev);
> +	put_device(&pdev->dev);
> +
> +	/*
> +	 * The presence of drvdata ('hub') indicates that the platform driver

drop "('hub')"

> diff --git a/drivers/usb/misc/onboard_usb_hub_pdevs.c b/drivers/usb/misc/onboard_usb_dev_pdevs.c
> similarity index 69%
> rename from drivers/usb/misc/onboard_usb_hub_pdevs.c
> rename to drivers/usb/misc/onboard_usb_dev_pdevs.c
> index ed22a18f4ab7..ca56f67393f1 100644
> --- a/drivers/usb/misc/onboard_usb_hub_pdevs.c
> +++ b/drivers/usb/misc/onboard_usb_dev_pdevs.c
>
> ...
>
>  /**
> - * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
> - * @parent_hub	: parent hub to scan for connected onboard hubs
> - * @pdev_list	: list of onboard hub platform devices owned by the parent hub
> + * onboard_dev_create_pdevs -- create platform devices for onboard USB devices
> + * @parent_hub	: parent hub to scan for connected onboard devices
> + * @pdev_list	: list of onboard platform devices owned by the parent hub
>   *
> - * Creates a platform device for each supported onboard hub that is connected to
> - * the given parent hub. The platform device is in charge of initializing the
> - * hub (enable regulators, take the hub out of reset, ...) and can optionally
> - * control whether the hub remains powered during system suspend or not.
> + * Creates a platform device for each supported onboard device that is connected
> + * to the given parent hub. The platform device is in charge of initializing the
> + * device (enable regulators, take the device out of reset, ...) and can
> + * optionally control whether the device remains powered during system suspend
> + * or not.

The last part isn't/won't be true for non-hub devices. Please change it to
something like ". For onboard hubs the platform device can optionally control ..."

