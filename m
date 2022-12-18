Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87228650160
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7677210E276;
	Sun, 18 Dec 2022 16:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4534 seconds by postgrey-1.36 at gabe;
 Sun, 18 Dec 2022 16:28:21 UTC
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83CD10E276
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HeoWzm4aDtjnCxaocC8ieA7IHLh7Yx1oE7a1dwOjhvY=;
 b=i/3GCRgkH+GCZ33bEkvjcyCaM0YCuJYPhL8bV8r15unBwWsfxIoHqccWpDgNW3yA/27Ov4TvlV8K9
 R+f9SmXzzb3wLdnyBf+BPPyUiug/+gbSKhlGiA56loCPhzgFuMqHaSjpsWGyHHdbbna11a8RqB5CVF
 KQBL4a7gaABPsGcVpz02eatjemaGhye9wF8ZIV7jRu2X9wgVspytU1AhR2bLAu7tKBmhwIpn0/t9/n
 jH1UuXHvF/oprcQm7nRPvmTJULgkAqDlLFzTMJMa5vHALSo//1TQuZWmX8m9wqweBHATETo6wkkbOp
 3qYJxh88QwZBIAgblcwg55+hF8DeETQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HeoWzm4aDtjnCxaocC8ieA7IHLh7Yx1oE7a1dwOjhvY=;
 b=VXNu2p4FC6678WvzsO3GEKowhF6zZ/8yNORF5Xj6+wEtjgYetVEPae8zrvPSkCTBkBBYWsKw/feqM
 sLt1NI4DA==
X-HalOne-ID: 342388af-7ee6-11ed-873b-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 342388af-7ee6-11ed-873b-7703b0afff57;
 Sun, 18 Dec 2022 15:11:12 +0000 (UTC)
Date: Sun, 18 Dec 2022 16:11:10 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/2] drm/imx/lcdc: Implement DRM driver for imx21
Message-ID: <Y58tjpkwP8LQElhk@ravnborg.org>
References: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
 <20221216175006.456831-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216175006.456831-3-u.kleine-koenig@pengutronix.de>
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe.

Two things I noticed while browsing the driver.

I did not try to do a full review - maybe for the next round.

	Sam

> +static unsigned int imx_lcdc_get_format(unsigned int drm_format)
> +{
> +	unsigned int bpp;
> +
> +	switch (drm_format) {
> +	default:
> +		DRM_WARN("Format not supported - fallback to RGB565\n");
> +		fallthrough;
> +	case DRM_FORMAT_RGB565:
> +		bpp = BPP_RGB565;
> +		break;
> +	}
> +
> +	return bpp;
> +}

It would be great if the driver had fallback to the generic XRGB8888
variant. So is was either the native or a fallback generic.
The latter just because most userspace assumes we have the XRGB8888
variant.


> +static int imx_lcdc_probe(struct platform_device *pdev)
> +{
> +	struct imx_lcdc *lcdc;
> +	struct drm_device *drm;
> +	int irq;
> +	int ret;
> +	struct device *dev = &pdev->dev;
> +
> +	lcdc = devm_drm_dev_alloc(dev, &imx_lcdc_drm_driver,
> +				  struct imx_lcdc, drm);
> +	if (!lcdc)
> +		return -ENOMEM;
> +
> +	drm = &lcdc->drm;
> +
> +	lcdc->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(lcdc->base))
> +		return dev_err_probe(dev, PTR_ERR(lcdc->base), "Cannot get IO memory\n");
> +
> +	/* Panel */
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &lcdc->panel, &lcdc->bridge);
From the documentation of drm_of_find_panel_or_bridge():

 * This function is deprecated and should not be used in new drivers. Use
 * devm_drm_of_get_bridge() instead.

 	Sam
