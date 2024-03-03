Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB8486F5F9
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 16:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1A710E92F;
	Sun,  3 Mar 2024 15:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="diqYF8Ik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D510E92F
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 15:52:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4ADC9D5;
 Sun,  3 Mar 2024 16:52:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709481134;
 bh=heBYFeJDqEutK0Jap5MQNGri5HlpLGdN4xYRo+19dGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=diqYF8IklThnS+NJvqfc17HqckXUJapqtKc2Si4LHvdeUcHCn1TG5ZWn2NTdLVR+A
 f8il9+HnVnlEg06BYQfaqAdaT6Z6esk0/yCkjJ/7qrC+vnFJOr07TGYwE+e2s908RL
 T6bmBRvlj/BsKECTNHkI5J/YN6kcGyYbGBL7g9D8=
Date: Sun, 3 Mar 2024 17:52:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 aford@beaconembedded.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
Message-ID: <20240303155231.GC11285@pendragon.ideasonboard.com>
References: <20240228113737.43434-1-aford173@gmail.com>
 <20240228163153.GH9863@pendragon.ideasonboard.com>
 <CAHCN7xLGL5gMhd7Fo907gPScdD15KW==BHSorQMjbd-=k-E9OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xLGL5gMhd7Fo907gPScdD15KW==BHSorQMjbd-=k-E9OA@mail.gmail.com>
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

On Sun, Mar 03, 2024 at 09:44:03AM -0600, Adam Ford wrote:
> On Wed, Feb 28, 2024 at 10:31 AM Laurent Pinchart wrote:
> > On Wed, Feb 28, 2024 at 05:37:35AM -0600, Adam Ford wrote:
> > > The IRQ registration currently assumes that the GPIO is
> > > dedicated to it, but that may not necessarily be the case.
> > > If the board has another device sharing the IRQ, it won't be
> > > registered and the hot-plug detect fails.  This is easily
> > > fixed by add the IRQF_SHARED flag.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > index b5518ff97165..21f08b2ae265 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > @@ -1318,7 +1318,8 @@ static int adv7511_probe(struct i2c_client *i2c)
> > >
> > >               ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
> > >                                               adv7511_irq_handler,
> > > -                                             IRQF_ONESHOT, dev_name(dev),
> > > +                                             IRQF_ONESHOT | IRQF_SHARED,
> > > +                                             dev_name(dev),
> >
> > This looks fine, but the IRQ handler doesn't.
> 
> Thanks for the review.
> 
> > static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
> > {
> >         unsigned int irq0, irq1;
> >         int ret;
> >
> >         ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
> >         if (ret < 0)
> >                 return ret;
> >
> >         ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(1), &irq1);
> >         if (ret < 0)
> >                 return ret;
> 
> If I did a check here and returned if there was no IRQ to handle,
> would that be sufficient?
> 
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -477,6 +477,11 @@ static int adv7511_irq_process(struct adv7511
> *adv7511, bool process_hpd)
>         if (ret < 0)
>                 return ret;
> 
> +       /* If there is no IRQ to handle, exit indicating no IRQ handled */
> +       if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> +          !(irq1 & ADV7511_INT1_DDC_ERROR))

If these are the only interrupt sources that the driver enables, this is
fine.

> +               return -1;

Maybe a defined error code instead ?

> +
>         regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
>         regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
> 
> With this, I would expect adv7511_irq_handler to return IRQ_NONE.  If
> you're OK with that approach, I can do that.  If you want me to merge
> adv7511_irq_handler, and adv7511_irq_process, I can do that too to
> make the return codes a little more intuitive.
> 
> >
> >         regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
> >         regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
> >
> >         if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.encoder)
> >                 schedule_work(&adv7511->hpd_work);
> >
> >         if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERROR) {
> >                 adv7511->edid_read = true;
> >
> >                 if (adv7511->i2c_main->irq)
> >                         wake_up_all(&adv7511->wq);
> >         }
> >
> > #ifdef CONFIG_DRM_I2C_ADV7511_CEC
> >         adv7511_cec_irq_process(adv7511, irq1);
> > #endif
> >
> >         return 0;
> > }
> >
> > static irqreturn_t adv7511_irq_handler(int irq, void *devid)
> > {
> >         struct adv7511 *adv7511 = devid;
> >         int ret;
> >
> >         ret = adv7511_irq_process(adv7511, true);
> >         return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
> > }
> >
> > The function will return IRQ_HANDLED as long as the registers can be
> > read, even if they don't report any interrupt.
> >
> > >                                               adv7511);
> > >               if (ret)
> > >                       goto err_unregister_audio;

-- 
Regards,

Laurent Pinchart
