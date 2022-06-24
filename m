Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46076559D25
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 17:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751D910E099;
	Fri, 24 Jun 2022 15:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB2610E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7C9om+I+NrguXJkyfDjb3usH2nDZbeYzg3Ij5DWZ8PE=;
 b=enkPuvVq9cxeak4xvbnLzPDtpwYYeLlQY+XCO9nkEHva9i0GHJmTYBtQvRdkfzbo8qX/TcFHMKSrh
 DxVVnB5eq+K9y3klNx9LBU5ho8yjqCW29X2UsTM644sxM0+eoeuYulYZbwgrV/6TT3iveTIRpWH3TT
 GVbkg8BuPncEAOR4dU7Ac/XmzlVlICv4riTUTBGAkq36XgIcBLCV+tUwIm3U+tKM2sloQ5RNMYj1A7
 8Eg7JPPIpylbUKZVtsTLqrdj/m8RtgoSG6AIGQKRhUEYjbm6GdRvlVIGVOWrS8Z6izO10eeDTH0lj3
 z0ndmK0zK4ZpzCCOyzg1vG3XIdI+s0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7C9om+I+NrguXJkyfDjb3usH2nDZbeYzg3Ij5DWZ8PE=;
 b=2kLU4Ts7UAvd1RJBZ9aDOh7pa1IwpwCGgT4QufeEpjpKKIhJKCPZMDbu9IoyplI2gEP31l0qbVfyy
 D59UN+OAg==
X-HalOne-Cookie: 9f7a75cd0428a0af88a75a96aa819a7f9526c1bb
X-HalOne-ID: 1e02ca40-f3d1-11ec-be7c-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 1e02ca40-f3d1-11ec-be7c-d0431ea8bb03;
 Fri, 24 Jun 2022 15:20:02 +0000 (UTC)
Date: Fri, 24 Jun 2022 17:20:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v5 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Message-ID: <YrXWIP3dRLc/ArOK@ravnborg.org>
References: <20220613213124.617021-1-marex@denx.de>
 <20220613213124.617021-2-marex@denx.de>
 <7b3850665f7fd699ff7d0a013e5652159d4b5055.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b3850665f7fd699ff7d0a013e5652159d4b5055.camel@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Martyn Welch <martyn.welch@collabora.com>, dri-devel@lists.freedesktop.org,
 Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > +
> > +static int lcdif_rpm_resume(struct device *dev)
> > +{
> > +	struct drm_device *drm = dev_get_drvdata(dev);
> > +	struct lcdif_drm_private *lcdif = drm->dev_private;
> > +
> > +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> > +	clk_prepare_enable(lcdif->clk_axi);
> > +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> > +	clk_prepare_enable(lcdif->clk_disp_axi);
> > +	/* These clock supply the DISPLAY CLOCK Domain */
> > +	clk_prepare_enable(lcdif->clk);
> > +
> > +	return 0;
> > +}
> > +
> 
> To avoid unused function warnings, suspend and resume should be under
> #ifdef CONFIG_PM_SLEEP

If SET_RUNTIME_PM_OPS is used then it is good practice to annotate the
functions __maybe_unused and no #ifdef - then they see build coverage also
without PM_SLEEP but they are discarded so do not consume memory if not used.

	Sam
