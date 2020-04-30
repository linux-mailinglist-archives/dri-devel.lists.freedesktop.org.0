Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1481BF0B9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5BD6E13F;
	Thu, 30 Apr 2020 07:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA8A6E13F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 07:03:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 089F0804F6;
 Thu, 30 Apr 2020 09:03:25 +0200 (CEST)
Date: Thu, 30 Apr 2020 09:03:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v8 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20200430070324.GA9545@ravnborg.org>
References: <cover.1587880280.git.xji@analogixsemi.com>
 <4d14400b6c19f17c28267f6ebdbce9673333c05c.1587880280.git.xji@analogixsemi.com>
 <20200427200044.GC15880@ravnborg.org>
 <20200430062416.GD6645@xin-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430062416.GD6645@xin-VirtualBox>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=J-B6ajXd8xN2lFXSAU4A:9 a=CjuIK1q_8ugA:10
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin Ji.

> > > +static void anx7625_power_on_init(struct anx7625_data *ctx)
> > > +{
> > > +	int retry_count, i;
> > > +	int ret;
> > > +	struct device *dev = &ctx->client->dev;
> > > +
> > > +	for (retry_count = 0; retry_count < 3; retry_count++) {
> > > +		anx7625_power_on(ctx);
> > > +		anx7625_config(ctx);
> > > +
> > > +		for (i = 0; i < OCM_LOADING_TIME; i++) {
> > Code in this for loop is a candidate for a helper function.
> I didn't find any helper function can be used, so I'll keep it.
I was not very clear in my way to express this, sorry.

> > 
> > > +			/* check interface workable */
> > > +			ret = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
> > > +					       FLASH_LOAD_STA);
> > > +			if (ret < 0) {
> > > +				DRM_ERROR("IO error : access flash load.\n");
> > > +				return;
> > > +			}
> > > +			if ((ret & FLASH_LOAD_STA_CHK) == FLASH_LOAD_STA_CHK) {
> > > +				anx7625_disable_pd_protocol(ctx);
> > > +				DRM_DEV_DEBUG_DRIVER(dev,
> > > +						     "Firmware ver %02x%02x,",
> > > +					anx7625_reg_read(ctx,
> > > +							 ctx->i2c.rx_p0_client,
> > > +							 OCM_FW_VERSION),
> > > +					anx7625_reg_read(ctx,
> > > +							 ctx->i2c.rx_p0_client,
> > > +							 OCM_FW_REVERSION));
> > > +				DRM_DEV_DEBUG_DRIVER(dev, "Driver version %s\n",
> > > +						     ANX7625_DRV_VERSION);
> > > +
> > > +				return;
> > > +			}
> > > +			usleep_range(1000, 1100);
> > > +		}
What I wanted to express is that the for loop is heavily indented.
So create a small function like:

anx7625_power_on_interface(ctx)
{
	/* check interface workable */
	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, FLASH_LOAD_STA);
	if (ret < 0) {
	        DRM_ERROR("IO error : access flash load.\n");
	        return;
	}
	if ((ret & FLASH_LOAD_STA_CHK) == FLASH_LOAD_STA_CHK) {
	        anx7625_disable_pd_protocol(ctx);
	        DRM_DEV_DEBUG_DRIVER(dev, "Firmware ver %02x%02x,",
	                anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
                                         OCM_FW_VERSION), anx7625_reg_read(ctx,
	                                 ctx->i2c.rx_p0_client, OCM_FW_REVERSION));
	        DRM_DEV_DEBUG_DRIVER(dev, "Driver version %s\n",
	                             ANX7625_DRV_VERSION);
		retunrn 1;
	}
	return 0;
}

and then

	for (i = 0; i < OCM_LOADING_TIME; i++) {
		if (anx7625_power_on_interface(ctx))
			return;
		else
			usleep_range(1000, 1100);
	}

Or something like that. To make it more readable.
I think you get the idea now.


> > > +		container_of(work, struct anx7625_data, extcon_wq);
> > > +	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_DP);
> > > +
> > > +	mutex_lock(&ctx->lock);
> > > +	anx7625_chip_control(ctx, state);
> > > +	mutex_unlock(&ctx->lock);
> > I tried to follow the locking - but failed.
> > Could you check that locking seems correct.
> > 
> > A standard bridge driver do not need locking,
> > but this is no small bridge driver so I do not imply that
> > locking is not needed. Only that I would like you
> > to check it again as I could not follow it.
> OK, it seems lock is not necessary, I'll remove itA
It has a worker, so please be careful in you analysis.

> > 
> > > +
> > > +	if (pdata->panel_flags == 1)
> > > +		pdata->internal_panel = 1;
> > > +	else if (pdata->panel_flags == 2)
> > > +		pdata->extcon_supported = 1;
> > > +	DRM_DEV_DEBUG_DRIVER(dev, "%s support extcon, %s internal panel\n",
> > > +			     pdata->extcon_supported ? "" : "not",
> > > +			     pdata->internal_panel ? "has" : "no");
> > > +
> > The way the internal panel - versus external connector is modelled
> > looks like it could use some of the abstractions used by other bridge
> > drivers.
> > 
> > The connector_type shall for example for internal panels come
> > form the panel.
> > And use the panel bridge driver - see examples in patches I referenced
> > before.
> > 
> > And external connectors may beneft from using the
> > display-connector bridge driver.
> I'm not familiar with it, the extcon interface is Google engineer give
> to me, I just follow their sample driver. If you think it is not good,
> I'll remove the extcon support.
It would be better to start without, and then add it later
so we end up with a clean design.

I for one would have an easier time reviewing.

So please go ahead and remove it for now.


	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
