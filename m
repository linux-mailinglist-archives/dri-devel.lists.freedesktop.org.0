Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EE43E9AF8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 00:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1526E118;
	Wed, 11 Aug 2021 22:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5666E118
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 22:40:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3D78EE;
 Thu, 12 Aug 2021 00:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628721628;
 bh=/O4PUjCTPgfgN9Ws9gsBCc/kpqDHJb+E4y+ffuDj9rI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PnrRujUR1V8KRJKwcCR0FTKicBMhP3TubDgzFpsaEY2WKsYLILzhetE4U3HwqaO77
 2YiQ582vBw2Ufcz7+RqmM/LYOIULOc+l7SETj43hxzGVA7dvm8lVVcq0qxYe0/LgBz
 Vrf7kmRM9Kpwy2tpRNgt/q6ZOU3jMoa9LVAZAYOo=
Date: Thu, 12 Aug 2021 01:40:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
Message-ID: <YRRR2BWZP8SlskW/@pendragon.ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
 <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com>
 <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
 <CAE-0n53Cc3iPvnnzDs8bV=7DrQro4NYYyzuD_9kHg+-o33u0SA@mail.gmail.com>
 <CAF6AEGs=uOC7Fb0sHJG+iR=d7ORnRhRn-K_ogrKDwzuN=9qAhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGs=uOC7Fb0sHJG+iR=d7ORnRhRn-K_ogrKDwzuN=9qAhA@mail.gmail.com>
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

On Wed, Aug 11, 2021 at 01:51:28PM -0700, Rob Clark wrote:
> On Wed, Aug 11, 2021 at 1:39 PM Stephen Boyd wrote:
> > Quoting Rob Clark (2021-08-11 09:20:30)
> > > On Wed, Aug 11, 2021 at 5:15 AM Laurent Pinchart wrote:
> > > > On Tue, Aug 10, 2021 at 10:26:33PM -0700, Stephen Boyd wrote:
> > > > > Quoting Laurent Pinchart (2021-06-23 17:03:02)
> > > > > > To simplify interfacing with the panel, wrap it in a panel-bridge and
> > > > > > let the DRM bridge helpers handle chaining of operations.
> > > > > >
> > > > > > This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> > > > > > requires all components in the display pipeline to be represented by
> > > > > > bridges.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > > Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > ---
> > > > >
> > > > > With this patch applied I get two eDP devices on Lazor sc7180 (it is the
> > > > > arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor*.dts files if you're
> > > > > looking for more info). As far as I can tell, we should only have one
> > > > > eDP device on the board, for the bridge.
> > > > >
> > > > > localhost ~ # ls -l /sys/class/drm/card1-eDP*
> > > > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-1 ->
> > > > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-1
> > > > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-2 ->
> > > > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-2
> > > >
> > > > Indeed.
> > > >
> > > > Does the display driver use the DRM connector bridge helper and
> > > > DRM_BRIDGE_ATTACH_NO_CONNECTOR on that platform ?
> > >
> > > There haven't been any recent changes about how we attach the bridge,
> > > it doesn't pass DRM_BRIDGE_ATTACH_NO_CONNECTOR.. tbh I've not been
> > > having time to follow too closely the recent changes with bridge stuff
> > > myself.
> > >
> > > But now with this patch we have both the ti bridge and the panel
> > > bridge creating a connector..  removing the connector created by the
> > > ti bridge "fixes" things, but not sure if that would break something
> > > on other platforms.  I guess there should now always be a panel
> > > bridge, so removing ti_sn_bridge_connector_init() would be a sane
> > > thing to do?
> >
> > So this patch works. We don't want to make the connector in this driver
> > for the next bridge because this driver is making the connector. I guess
> > eventually we'll drop this flag when this driver stops making the
> > connector here?
> >
> > ---8<---
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index cd0fccdd8dfd..a8d4818484aa 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -741,7 +741,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> >
> >         /* Attach the next bridge */
> >         ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> > -                               &pdata->bridge, flags);
> > +                               &pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >         if (ret < 0)
> >                 goto err_dsi_detach;
> 
> I kinda think *all* bridges that create a connector (whether optional
> or not) should OR in NO_CONNECTOR when attaching the next downstream
> bridge.. since you never want multiple connectors

Yes, that sounds reasonable to me. Stephen, would you like to set a
patch ?

-- 
Regards,

Laurent Pinchart
