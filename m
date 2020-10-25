Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD0F29825C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 16:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197C36E9D5;
	Sun, 25 Oct 2020 15:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40E26E9D5
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:43:52 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4B2DF20024;
 Sun, 25 Oct 2020 16:43:48 +0100 (CET)
Date: Sun, 25 Oct 2020 16:43:46 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [RESEND PATCH v5 2/2] drm/bridge: hx8837: add a Himax HX8837
 display controller driver
Message-ID: <20201025154346.GA37040@ravnborg.org>
References: <20200926000719.229204-1-lkundrak@v3.sk>
 <20200926000719.229204-3-lkundrak@v3.sk>
 <20201016200734.GD1345100@ravnborg.org>
 <20201025151942.GA526002@demiurge.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025151942.GA526002@demiurge.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=uv0L9p8A0TvxXRDgSEoA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lubomir.

> > > +static int hx8837_bl_update_status(struct backlight_device *bl)
> > > +{
> > > +	struct hx8837_priv *priv = bl_get_data(bl);
> > > +	unsigned int val;
> > > +	int ret;
> > > +
> > > +	ret = regmap_update_bits(priv->regmap, DCON_REG_BRIGHT,
> > > +					       0x000f,
> > > +					       bl->props.brightness);
> > 
> > Use backlight_get_brightness() to get the brightness.
> > This will also make sure 0 is returned when backlight is off so the
> > logic a few lines down is correct.
> 
> I'm not sure I understand this one. I'm wondering if you could help me out
> with it before I follow up with v4.
> 
> Currently I read in the current brightness level in probe() (which
> prevents struct backlight_properties, below, from being const) and the
> nthe brightness is entirely in control of the driver via
> update_status().
> 
> What would I need get_brightness() for? We know that whatever the driver
> set is the current level. It doesn't seem to be called on backlight
> device registration so it doesn't make the readin in probe()
> unnecessary either.

The request here is to replace the direct access to backlight properties
"bl->props.brightness" with the helper backlight_get_brightness(bl).

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
