Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574765B504D
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 19:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325D010E077;
	Sun, 11 Sep 2022 17:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7578A10E077
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=greM8p0Ua9h5ImZ4Y9kHuhnWumFocpJWK5+P1eKg+YI=;
 b=qQR9YNl4fc4CdktV1oyfkVyzsMuljPjEP+2trMKWQtsRKSWmhJhwk8m+0avIySgdPrNeMIeqeIXZo
 ljXv8JPauY8T8uAKQq/7faA474iL+nZ/Ds9biRbco9Jv0+sKggclZyTU+N2Jc/WtWjlDFJU7vQLxpn
 1sVetVfKLsnEDLysMhqPT0DzBScvuOPm1r/1+nqtzJWjJZUnXPWAWwV5t28cYRFzknF7hh/+1UB4w7
 riBTufmqS4jYGSgp8+SHSuikTH2FmOLamr7b3ReZ21TvknTfYqq9B332zk36PTeAzZ0mJ62oqBUreA
 DSGjvUHRDAcAxD46OysSWmU2qoVBqnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=greM8p0Ua9h5ImZ4Y9kHuhnWumFocpJWK5+P1eKg+YI=;
 b=1D/uQ3Or27ybq34+3/Lmt4Xf/lfx1HrnewldaT1diK6q6FHTbW4QDp/v6rLNRqTtCvh/MEulFcxt8
 uAS6aszCQ==
X-HalOne-Cookie: 99a2ca54a0901e65e0c183d99765405e9567614c
X-HalOne-ID: 09c1056c-31f8-11ed-a923-d0431ea8a290
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 09c1056c-31f8-11ed-a923-d0431ea8a290;
 Sun, 11 Sep 2022 17:34:51 +0000 (UTC)
Date: Sun, 11 Sep 2022 19:34:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/4] drm/gma500: Refactor backlight support
Message-ID: <Yx4cOvIfNVz/L8CE@ravnborg.org>
References: <20220910205101.1355950-1-hdegoede@redhat.com>
 <20220910205101.1355950-2-hdegoede@redhat.com>
 <Yx3K/6aF/twnuaHV@ravnborg.org>
 <7506231b-1ea1-b94d-4341-40e7873f4f06@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7506231b-1ea1-b94d-4341-40e7873f4f06@redhat.com>
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

> >> +static int gma_backlight_update_status(struct backlight_device *bd)
> >> +{
> >> +	struct drm_device *dev = bl_get_data(bd);
> >> +	int level = bd->props.brightness;
> > 
> > Here backlight_get_brightness(bd) should be used.
> 
> Ack, but the old set methods all 3 used:
> 
> 	int level = bd->props.brightness;
> 
> So that would be a small functional / behavior change.
> 
> As such I would prefer to split using backlight_get_brightness(bd)
> out into a separate patch for version 2 of the series.
> Like how I also made the change from type = BACKLIGHT_PLATFORM ->
> type = BACKLIGHT_RAW a separate change.
> 
> Would that be ok with you ?
That would be perfect!

> > 
> > 
> >>  int gma_backlight_init(struct drm_device *dev)
> >>  {
> >> -#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
> >>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >> +	struct backlight_properties props = {};
> >> +	int ret;
> >> +
> >>  	dev_priv->backlight_enabled = true;
> >> -	return dev_priv->ops->backlight_init(dev);
> >> -#else
> >> -	return 0;
> >> +	dev_priv->backlight_level = 100;
> >> +
> >> +	ret = dev_priv->ops->backlight_init(dev);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
> >> +	props.brightness = dev_priv->backlight_level;
> >> +	props.max_brightness = PSB_MAX_BRIGHTNESS;
> >> +	props.type = BACKLIGHT_PLATFORM;
> >> +
> >> +	dev_priv->backlight_device =
> >> +		backlight_device_register(dev_priv->ops->backlight_name,
> >> +					  dev->dev, dev,
> >> +					  &gma_backlight_ops, &props);
> > 
> > Consider using the devm_backlight_device_register() variant.
> > Then you can drop gma_backlight_exit() - I think..
> 
> The problem is the rest of the driver does not use devm_foo functions,
> so then psb_driver_unload() which runs before the devm cleanup functions
> will already release various iommap-s before the backlight is unregistered.
> 
> This leaves a race where the backlight device could be poked and then try
> to use no longer valid pointers in the main driver struct to write to the hw.

Thanks for the explanation. When someone update the driver to devn_ then
they surely will include backlight too.
(I do not try to persuade you to do it, your time is better spent on the
bigger backlight picture).

	Sam
