Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EB4423A6F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 11:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B072D6F876;
	Wed,  6 Oct 2021 09:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816786F64B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 09:18:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F006A581;
 Wed,  6 Oct 2021 11:18:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1633511921;
 bh=lHlaAMccgyN3f2+iHICqMUQ8B2hxG5eHnMuV76r9n0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=coeeqRMKluoR1uSJ5kI+0a68znpR1V1/QAzoH+SQkVjq234UAaufykftcGXQ4vvMG
 7WziKhL4T67550RmeWaBZ5Q9mycpdUmrTvsoIt7FYm3H0ixEoRd6ubXSH7adjQAXQn
 hVkYGkcwGhzIbWArZyXjA2tRuV15lHKuz4NO/mxc=
Date: Wed, 6 Oct 2021 12:18:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi8: Make enable GPIO optional
Message-ID: <YV1p6QFEkfTWssVD@pendragon.ideasonboard.com>
References: <20211006074713.1094396-1-alexander.stein@ew.tq-group.com>
 <20211006074713.1094396-3-alexander.stein@ew.tq-group.com>
 <YV1pyAq8CeiTO7hD@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YV1pyAq8CeiTO7hD@pendragon.ideasonboard.com>
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

On Wed, Oct 06, 2021 at 12:18:02PM +0300, Laurent Pinchart wrote:
> Hi Alexander,
> 
> Thank you for the patch.

One more thing, the subject line has a typo, it should read
ti-sn65dsi83.

> On Wed, Oct 06, 2021 at 09:47:13AM +0200, Alexander Stein wrote:
> > The enable signal may not be controllable by the kernel. Make it
> > optional.
> > This is a similar to commit bbda1704fc15 ("drm/bridge: ti-sn65dsi86: Make
> > enable GPIO optional")
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > index 5fab0fabcd15..101da29ba698 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -679,7 +679,7 @@ static int sn65dsi83_probe(struct i2c_client *client,
> >  		model = id->driver_data;
> >  	}
> >  
> > -	ctx->enable_gpio = devm_gpiod_get(ctx->dev, "enable", GPIOD_OUT_LOW);
> > +	ctx->enable_gpio = devm_gpiod_get_optional(ctx->dev, "enable", GPIOD_OUT_LOW);
> 
> You can wrap this line as
> 
> 	ctx->enable_gpio = devm_gpiod_get_optional(ctx->dev, "enable",
> 						   GPIOD_OUT_LOW);
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Corresponding DT bindings changes are needed, I've sent a patch in this
> mail thread.
> 
> >  	if (IS_ERR(ctx->enable_gpio))
> >  		return PTR_ERR(ctx->enable_gpio);
> >  

-- 
Regards,

Laurent Pinchart
