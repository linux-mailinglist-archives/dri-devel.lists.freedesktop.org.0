Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB0723579D
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 16:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A01A6E05A;
	Sun,  2 Aug 2020 14:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AA56E05A
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 14:32:13 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 80CAF80511;
 Sun,  2 Aug 2020 16:32:08 +0200 (CEST)
Date: Sun, 2 Aug 2020 16:32:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v1 21/22] drm/omap: display: Backlight update
Message-ID: <20200802143207.GA1175585@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-22-sam@ravnborg.org>
 <20200802142605.ih6hwhnjxnqhaflt@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802142605.ih6hwhnjxnqhaflt@earth.universe>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=sozttTNsAAAA:8 a=QX4gbG5DAAAA:8
 a=P1BnusSwAAAA:8 a=i0EeH86SAAAA:8 a=Mi-SBBojSEErp3IxY9cA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Zheng Bin <zhengbin13@huawei.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian.

On Sun, Aug 02, 2020 at 04:26:05PM +0200, Sebastian Reichel wrote:
> Hi,
> 
> On Sun, Aug 02, 2020 at 01:06:35PM +0200, Sam Ravnborg wrote:
> > - Introduce backlight_{enable/disable)
> > - Use get/set methods for backlight_properties
> > - Drop redundant get_brightness() implementation
> >   The default implementation return the current brightness value
> > - Use macro for backlight initialization
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Zheng Bin <zhengbin13@huawei.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 35 ++++---------------
> >  1 file changed, 6 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > index 3484b5d4a91c..433e240896b3 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > @@ -110,15 +110,10 @@ static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
> >  	else
> >  		return;
> >  
> > -	if (enable) {
> > -		backlight->props.fb_blank = FB_BLANK_UNBLANK;
> > -		backlight->props.state = ~(BL_CORE_FBBLANK | BL_CORE_SUSPENDED);
> > -		backlight->props.power = FB_BLANK_UNBLANK;
> > -	} else {
> > -		backlight->props.fb_blank = FB_BLANK_NORMAL;
> > -		backlight->props.power = FB_BLANK_POWERDOWN;
> > -		backlight->props.state |= BL_CORE_FBBLANK | BL_CORE_SUSPENDED;
> > -	}
> > +	if (enable)
> > +		backlight_enable(backlight);
> > +	else
> > +		backlight_disable(backlight);
> >  
> >  	backlight_update_status(backlight);
> 
> backlight_update_status() is already called by backlight_enable/disable.

Right, thanks.
Dropped in v2.

Let me know if you already have a similar patch and if I shall drop
this.

It would be nice to have the panel parts of omapdrm migrated in this cycle.
I recall you have 50+ patches pending.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
