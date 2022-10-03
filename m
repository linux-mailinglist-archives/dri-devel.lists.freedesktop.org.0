Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682005F355F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 20:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E00810E454;
	Mon,  3 Oct 2022 18:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C5110E454
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 18:12:52 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 544BB601700F;
 Mon,  3 Oct 2022 19:12:50 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id GwoSyjvnYk2U; Mon,  3 Oct 2022 19:12:47 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C0EE26017005;
 Mon,  3 Oct 2022 19:12:47 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1664820767;
 bh=u0FdMsL27iX2Cm0TjA0vq2VZt2TiP1NpXkTMsX39mZE=;
 h=Date:From:Cc:Subject:References:In-Reply-To;
 b=d6N6ca4ArUdIljA4KFglU+PYaUPPNWbe7bznwSh2vWKgf3t6+2U+wKBc6U2XiBfos
 Ics8AWZvC/rl/cOY510XkM7Z0bqEchvKmw07O9blpuZIKtUW5+RJfsRCv6In79YuKZ
 1xU5OoOLxJKZYbbvjN/I66TXLWCcoKO7ntQ6bKro=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id B723E360079;
 Mon,  3 Oct 2022 19:12:46 +0100 (WEST)
Date: Mon, 3 Oct 2022 19:13:19 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH 2/4] drm/tegra: dsi: Clear enable register if powered by
 bootloader
Message-ID: <20221003181319.4uibu2kfhop3cx7h@wslaptop>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-3-diogo.ivo@tecnico.ulisboa.pt>
 <YzbOzoGDtY2kI2Dv@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzbOzoGDtY2kI2Dv@orome>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 arnd@arndb.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, diogo.ivo@tecnico.ulisboa.pt, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 01:11:10PM +0200, Thierry Reding wrote:
> On Thu, Sep 29, 2022 at 06:05:00PM +0100, Diogo Ivo wrote:
> > +
> >  	err = tegra_dsi_prepare(dsi);
> >  	if (err < 0) {
> >  		dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > @@ -1573,6 +1600,8 @@ static int tegra_dsi_probe(struct platform_device *pdev)
> >  
> >  	dsi->output.connector.polled = DRM_CONNECTOR_POLL_HPD;
> >  
> > +	/* Check if the DSI module was left on by bootloader. */
> > +	dsi->enabled = of_property_read_bool(pdev->dev.of_node, "nvidia,boot-on");
> 
> The isn't a documented property. But before you go and add this, are
> there no alternative ways to detect that the DSI controller is active?
> Could we not read one of the registers to find out?

Hello, thank you for your feedback.

You are correct, it is possible to simply read a register to obtain
this information, and this property is not needed.

> DRM/KMS has built-in mechanisms to read back hardware state on boot, so
> I wonder if we can hook that up. It'd make the most sense if all sub-
> drivers did this, because then we could eventually inherit the
> bootloader configuration and transition to the kernel display driver
> seamlessly, but doing this in DSI first may help prepare for that more
> extended use-case.

I have only recently started digging in the DRM/KMS subsystem, could
you point out what those mechanisms are? That end goal seems like
something worth pursuing.

> A slightly simpler alternative would be to add the reset code to the
> encoder's or connector's ->reset() implementation. This is called at the
> right time (i.e. when the mode configuration is first reset), so you can
> run the workaround from tegra_dsi_encoder_enable() there. That's better
> than having this guarded by the dsi->enabled flag so that it is run only
> once.
> 
> Thierry

Regarding the placement of the workaround, I placed it in encoder_enable()
since my attempts of placing it in other functions (such as the connector's
->reset() method) resulted in a kernel hang, and I have no solution for this.
I'm assuming this is due to some part of the DSI hardware not being fully
initialized, but I haven't been able to confirm this.

Best regards,

Diogo
