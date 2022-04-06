Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8A4F6A24
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C310C10E1E2;
	Wed,  6 Apr 2022 19:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8302A10E15A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 19:41:20 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncBWo-0003JV-Vh; Wed, 06 Apr 2022 21:41:19 +0200
Message-ID: <ffc23134df69d9fe6ba7229e6a3239ebd131e68e.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/7] drm: mxsfb: Simplify LCDIF IRQ handling
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Wed, 06 Apr 2022 21:41:17 +0200
In-Reply-To: <20220311170601.50995-2-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-2-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
> The call to drm_crtc_vblank_off(&lcdif->crtc); disables IRQ generation
> from the LCDIF block already and this is called in mxsfb_load() before
> request_irq(), so explicitly disabling IRQ using custom function like
> mxsfb_irq_disable() is not needed, remove it.
> 

Have you checked that the drm_vblank_off in probe actually results in a
call to mxsfb_crtc_disable_vblank? From my reading of the core code,
this should be a no-op without a previous drm_vblank_on, so it would
not result in the desired masking before the IRQ is requested.

Regards,
Lucas

>  The request_irq() call
> would return -ENOTCONN if IRQ is IRQ_NOTCONNECTED already, so remove
> the unnecessary check. Finally, remove both mxsfb_irq_install() and
> mxsfb_irq_uninstall() as well, since they are no longer useful.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: No change
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 38 +++++++------------------------
>  1 file changed, 8 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index c790aeff0a6f0..94cafff7f68d5 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -157,33 +157,6 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static void mxsfb_irq_disable(struct drm_device *drm)
> -{
> -	struct mxsfb_drm_private *mxsfb = drm->dev_private;
> -
> -	/* Disable and clear VBLANK IRQ */
> -	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
> -	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
> -}
> -
> -static int mxsfb_irq_install(struct drm_device *dev, int irq)
> -{
> -	if (irq == IRQ_NOTCONNECTED)
> -		return -ENOTCONN;
> -
> -	mxsfb_irq_disable(dev);
> -
> -	return request_irq(irq, mxsfb_irq_handler, 0,  dev->driver->name, dev);
> -}
> -
> -static void mxsfb_irq_uninstall(struct drm_device *dev)
> -{
> -	struct mxsfb_drm_private *mxsfb = dev->dev_private;
> -
> -	mxsfb_irq_disable(dev);
> -	free_irq(mxsfb->irq, dev);
> -}
> -
>  static int mxsfb_load(struct drm_device *drm,
>  		      const struct mxsfb_devdata *devdata)
>  {
> @@ -259,7 +232,8 @@ static int mxsfb_load(struct drm_device *drm,
>  		return ret;
>  	mxsfb->irq = ret;
>  
> -	ret = mxsfb_irq_install(drm, mxsfb->irq);
> +	ret = request_irq(mxsfb->irq, mxsfb_irq_handler, 0,
> +			  drm->driver->name, drm);
>  	if (ret < 0) {
>  		dev_err(drm->dev, "Failed to install IRQ handler\n");
>  		return ret;
> @@ -276,16 +250,20 @@ static int mxsfb_load(struct drm_device *drm,
>  
>  static void mxsfb_unload(struct drm_device *drm)
>  {
> +	struct mxsfb_drm_private *mxsfb = drm->dev_private;
> +
>  	pm_runtime_get_sync(drm->dev);
>  
> +	drm_crtc_vblank_off(&mxsfb->crtc);
> +
>  	drm_kms_helper_poll_fini(drm);
>  	drm_mode_config_cleanup(drm);
>  
> -	mxsfb_irq_uninstall(drm);
> -
>  	pm_runtime_put_sync(drm->dev);
>  	pm_runtime_disable(drm->dev);
>  
> +	free_irq(mxsfb->irq, drm->dev);
> +
>  	drm->dev_private = NULL;
>  }
>  


