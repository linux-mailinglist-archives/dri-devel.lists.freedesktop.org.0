Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13A641FE0
	for <lists+dri-devel@lfdr.de>; Sun,  4 Dec 2022 22:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5764810E037;
	Sun,  4 Dec 2022 21:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5733610E037
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 21:31:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BFC92D8;
 Sun,  4 Dec 2022 22:31:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1670189504;
 bh=ZiU22BSfaBf2V1IOu/eKj4zw3NqHJMR9VyBBSYl+1Ic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ldTI9peQD33DfV0DUvPhXdJ5gTCbmm5NGmDoSA082azM8dhTFFtbjHWz9P80J8duS
 IzUs9ruF05OCEwTVeqHu+UbSpAgcMEwT/R3OqVoOU3QgTqEAEdgBrdORRd/8NPksme
 bTMyPSI3RTylqWUFz9oBmBWE1G8O1chH2T4HOQlo=
Date: Sun, 4 Dec 2022 23:31:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 03/11] drm/bridge: ti-sn65dsi86: Propagate errors in
 .get_state() to the caller
Message-ID: <Y40Rvi0tyRnfbHp2@pendragon.ideasonboard.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-4-u.kleine-koenig@pengutronix.de>
 <20221204210940.qygblu244zvlenxz@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221204210940.qygblu244zvlenxz@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pwm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 04, 2022 at 10:09:40PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> my initial Cc-list wasn't optimal. So I added a few people here.
> 
> On Wed, Nov 30, 2022 at 04:21:40PM +0100, Uwe Kleine-König wrote:
> > .get_state() can return an error indication. Make use of it to propagate
> > failing hardware accesses.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 6826d2423ae9..9671071490d8 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -1512,19 +1512,19 @@ static int ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> >  
> >  	ret = regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
> >  	if (ret)
> > -		return 0;
> > +		return ret;
> >  
> >  	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
> >  	if (ret)
> > -		return 0;
> > +		return ret;
> >  
> >  	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
> >  	if (ret)
> > -		return 0;
> > +		return ret;
> >  
> >  	ret = regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
> >  	if (ret)
> > -		return 0;
> > +		return ret;
> >  
> >  	state->enabled = FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
> >  	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
> 
> It would be great to get an Ack to take this patch and patch #1 via the
> PWM tree. (Both got an Ack by Douglas Anderson, I'm unsure if that is
> already enough.)

-- 
Regards,

Laurent Pinchart
