Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585875B4E8B
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 13:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3378110E3F6;
	Sun, 11 Sep 2022 11:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BB310E3F6
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 11:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=u9HqiKYeIw1sTw+g63lyAb7DDIyYJ7ur0KmcSsCYPcs=;
 b=CrWmF7prrI1ZMJk5UH83lQ8wpO/ucOZMUmDURjzvSv5+jwNECwA3BOwW/fG+HUypaOw8TyR6Kbvxp
 /ewMVOCW6u103x9KN6hu85EolsUbh/p/NHTMFOSCa+KknZR4AosK7sYNbtIxkJ6pDuGC49HMI0p9yX
 CohbDPEf6rW3i9f+Lm6YXWJv9e534Rh9U+yeqK5di6WsL884YM+5rUpJ0T8l7TLNfkyMxQIGnpQTe7
 Rau1xLDwYq9Z1sRq0WBjMbNTmXfO17GiXJ1BLza5fHqHQw2llihdDKaoYa7hFgibyxGDmXieYT9+p4
 gs05mhgOkgUMa357ZpsBilqgZHlyNTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=u9HqiKYeIw1sTw+g63lyAb7DDIyYJ7ur0KmcSsCYPcs=;
 b=hJXUE6WHvSXkCixe45V82Sc1zTbEDt70GIK8rXZczK3KAi8Thx8TR4rDVySCthx+oCx4dJ4mHaVnx
 754T5laCw==
X-HalOne-Cookie: 1f25bebbbcbb3df136a6458deee7b1018452c1f4
X-HalOne-ID: 9f13178d-31c7-11ed-a6d4-d0431ea8a283
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 9f13178d-31c7-11ed-a6d4-d0431ea8a283;
 Sun, 11 Sep 2022 11:48:16 +0000 (UTC)
Date: Sun, 11 Sep 2022 13:48:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/4] drm/gma500: Refactor backlight support
Message-ID: <Yx3K/6aF/twnuaHV@ravnborg.org>
References: <20220910205101.1355950-1-hdegoede@redhat.com>
 <20220910205101.1355950-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220910205101.1355950-2-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

just a few minor things. See comments.
I like the diff - removes much more than it adds.

	Sam

On Sat, Sep 10, 2022 at 10:50:58PM +0200, Hans de Goede wrote:
> Refactor backlight support so that the gma_backlight_enable() /
> gma_backlight_disable() / gma_backlight_set() functions used by
> the Opregion handle will also work if no backlight_device gets
> registered.
> 
> This is a preparation patch for not registering the gma500's own backlight
> device when acpi_video should be used, since registering 2 backlight
> devices for a single display really is undesirable.
> 
> Since the acpi-video interface often uses the OpRegion we need to keep
> the OpRegion functional even when dev_priv->backlight_device is NULL.
> 
> As a result of this refactor the actual backlight_device_register()
> call is moved to the shared backlight.c code and all #ifdefs related to
> CONFIG_BACKLIGHT_CLASS_DEVICE are now also limited to backlight.c .
> 
> No functional changes intended.
> 
> This has been tested on a Packard Bell Dot SC (Intel Atom N2600, cedarview)
> and a Sony Vaio vpc-x11s1e (Intel N540, poulsbo) laptop.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

> +static int gma_backlight_update_status(struct backlight_device *bd)
> +{
> +	struct drm_device *dev = bl_get_data(bd);
> +	int level = bd->props.brightness;

Here backlight_get_brightness(bd) should be used.


>  int gma_backlight_init(struct drm_device *dev)
>  {
> -#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +	struct backlight_properties props = {};
> +	int ret;
> +
>  	dev_priv->backlight_enabled = true;
> -	return dev_priv->ops->backlight_init(dev);
> -#else
> -	return 0;
> +	dev_priv->backlight_level = 100;
> +
> +	ret = dev_priv->ops->backlight_init(dev);
> +	if (ret)
> +		return ret;
> +
> +#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
> +	props.brightness = dev_priv->backlight_level;
> +	props.max_brightness = PSB_MAX_BRIGHTNESS;
> +	props.type = BACKLIGHT_PLATFORM;
> +
> +	dev_priv->backlight_device =
> +		backlight_device_register(dev_priv->ops->backlight_name,
> +					  dev->dev, dev,
> +					  &gma_backlight_ops, &props);

Consider using the devm_backlight_device_register() variant.
Then you can drop gma_backlight_exit() - I think..

> +	if (IS_ERR(dev_priv->backlight_device))
> +		return PTR_ERR(dev_priv->backlight_device);
>  #endif
> +
> +	return 0;
>  }
>  
>  void gma_backlight_exit(struct drm_device *dev)
>  {
>  #ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -	if (dev_priv->backlight_device) {
> -		dev_priv->backlight_device->props.brightness = 0;
> -		backlight_update_status(dev_priv->backlight_device);
> +
> +	if (dev_priv->backlight_device)
>  		backlight_device_unregister(dev_priv->backlight_device);
> -	}
>  #endif
>  }
