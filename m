Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC7186DE86
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 10:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F34A10EC50;
	Fri,  1 Mar 2024 09:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GhPOUSW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3217B10EC39
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 09:44:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EA6C60011;
 Fri,  1 Mar 2024 09:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709286292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLfVM3FOXGZ70gOHTq5F31ZB1rotVuM9vyMjzBGjf6s=;
 b=GhPOUSW8ahp4JljipFLwxMYOdXx9gA9dbHywYIGfQ6XU/WDujeUPK/FjtQojhMgI9cQrqm
 i+hSUhL4qqQuwLakx3n7GX5CPd4NYYALOYCv7z2fwcIkasylMCL9JJwJ29rkqz/aDd/hnS
 yxLHL7uqhGxdYLIjw/5Bu/ZqLGD4U8DxNzghRQodhCk+EnDeVwOPhwYg8jBFQDbTP5IFc3
 8q0X3wyiZZnbbgTbV6zXbCaw+gi6miX5ARveiHUhFf1JX0X4fP23G3TM8Up4MIdlQnGfHe
 JCZ3xTM438gzZjp9pN6RVidVmpJOiCUVF0N1Y2iEFSMX2uyznA4JGoza6QOiVw==
Date: Fri, 1 Mar 2024 10:44:49 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Fix enable error path
Message-ID: <20240301104449.242cc352@booty>
In-Reply-To: <1931621.taCxCBeP46@steina-w>
References: <20230504065316.2640739-1-alexander.stein@ew.tq-group.com>
 <3798602.kQq0lBPeGt@steina-w> <20240229104723.7aa71075@booty>
 <1931621.taCxCBeP46@steina-w>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Alexander,

On Thu, 29 Feb 2024 12:11:23 +0100
Alexander Stein <alexander.stein@ew.tq-group.com> wrote:

> Hi Luca,
> 
> Am Donnerstag, 29. Februar 2024, 10:47:23 CET schrieb Luca Ceresoli:
> > Hello Alexander,
> > 
> > On Wed, 28 Feb 2024 09:15:46 +0100
> > Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> > 
> > 
> > [...]
> >   
> > > Oh I mistook this DSI-LVDS bridge with the DSI-DP bridge on a different
> > > board, my bad. I hope I can provide some insights. My platform is
> > > imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb.
> > > I can easily cause a PLL lock failure by reducing the delay for the
> > > enable-gpios 'gpio_delays'. This will result in a PLL lock faiure.
> > > On my platform the vcc-supply counters do look sane:  
> > > > /sys/kernel/debug/regulator/SN65DSI83_1V8/open_count:1
> > > > /sys/kernel/debug/regulator/SN65DSI83_1V8/use_count:0    
> > 
> > Interesting. Thanks for taking time to report your initial issue!
> >   
> > > Once I remove the ti_sn65dsi83 module, the open_count decrements to 0 as
> > > well. Looks sane to me.
> > > 
> > > If I revert commit c81cd8f7c774 ("Revert "drm/bridge: ti-sn65dsi83:
> > > Fix enable error path""), vcc-supply counters are:  
> > > > /sys/kernel/debug/regulator/SN65DSI83_1V8/open_count:1
> > > > /sys/kernel/debug/regulator/SN65DSI83_1V8/use_count:1    
> > > 
> > > So in my case the use_count does not decrease! If I remove the module
> > > ti_sn65dsi83, I get the WARN_ON (enable_count is still non-zero):  
> > > > WARNING: CPU: 2 PID: 402 at drivers/regulator/core.c:2398 _regulator_put+0x15c/0x164    
> > > 
> > > This is on 6.8.0-rc6-next-20240228 with the following diff applied:  
> > > --->8---    
> > > diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
> > > index 427467df42bf..8461e1fd396f 100644
> > > --- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
> > > @@ -285,7 +285,7 @@ &i2c3 {
> > >         dsi_lvds_bridge: bridge@2d {
> > >                 compatible = "ti,sn65dsi84";
> > >                 reg = <0x2d>;
> > > -               enable-gpios = <&gpio_delays 0 130000 0>;
> > > +               enable-gpios = <&gpio_delays 0 0 0>;
> > >                 vcc-supply = <&reg_sn65dsi83_1v8>;
> > >                 status = "disabled";
> > >  
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > index 4814b7b6d1fd..57a7ed13f996 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > @@ -478,7 +478,6 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
> > >                 dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
> > >                 /* On failure, disable PLL again and exit. */
> > >                 regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> > > -               regulator_disable(ctx->vcc);
> > >                 return;
> > >         }  
> > > --->8---    
> > > 
> > > So my patch indeed did fix an actual problem. On the other hand it seems
> > > sn65dsi83_atomic_disable is not called in my case for some reason.  
> > 
> > So you remove the module and atomic_disable is not called, after
> > having called atomic_pre_enable?  
> 
> Yes, that's the case.

Ah, it's quite obvious looking at the code: removing the module will
call sn65dsi83_remove()
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/ti-sn65dsi83.c#L729

which does just call drm_bridge_remove()
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_bridge.c#L243

which just removes the bridge from the list.

So maybe sn65dsi83_remove() should call regulator_disable() as a last
resort, but I'm not sure this is the correct solution and it would
involve some housekeeping to not disable the regulator more times than
it has been enabled.

What is the use case you have for removing the driver module?

I'm not implying removing the modules is wrong, but it definitely looks
like not supported / not working. I'm just trying to understand the big
picture.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
