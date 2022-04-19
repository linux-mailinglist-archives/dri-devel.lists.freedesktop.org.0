Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768445076AE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 19:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5BF10EACE;
	Tue, 19 Apr 2022 17:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6384F10EACE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 17:37:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (95-210-23-35.ip.skylogicnet.com
 [95.210.23.35])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A798525B;
 Tue, 19 Apr 2022 19:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650389876;
 bh=6ncm0+RSv6Rghab9G2jwmu7+/kqBJGbvnEdAhJxBg2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SIvE84l8xReAD3pzFjuVu+6BIHvYrUy6lY3AE48QcbyZK4KlEpE3DVFWMs6V4O5PZ
 I3wGXUHCONUn0Bb2pZh/fXlj4yYnyNcP/PIqpCgjzoL2qTl8ExzNc68H8n/Z0tiCrx
 dJkFbzQtp9lw2Py+uuCFqaNpT6Oqt5/w4E5SThEM=
Date: Tue, 19 Apr 2022 20:37:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH] drm: bridge: panel: Register connector if DRM device is
 already registered
Message-ID: <Yl7zcdYfkQlv/bsj@pendragon.ideasonboard.com>
References: <CGME20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c@eucas1p2.samsung.com>
 <20220419091422.4255-1-m.szyprowski@samsung.com>
 <CAMty3ZB31chzCfFkogx7otqH8rOZ0wEGDBuxLcG-PKQ-HBHy4w@mail.gmail.com>
 <CAG3jFyuwH2Hj7EtzuXZ1GmCcSoaVpaN1Rr7A+W+m2a2qr0o-NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAG3jFyuwH2Hj7EtzuXZ1GmCcSoaVpaN1Rr7A+W+m2a2qr0o-NA@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 06:16:07PM +0200, Robert Foss wrote:
> On Tue, 19 Apr 2022 at 11:41, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > On Tue, Apr 19, 2022 at 2:44 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> > >
> > > If panel_bridge_attach() happens after DRM device registration, the
> > > created connector will not be registered by the DRM core anymore. Fix
> > > this by registering it explicitely in such case.
> > >
> > > This fixes the following issue observed on Samsung Exynos4210-based Trats
> > > board with a DSI panel (the panel driver is registed after the Exynos DRM
> > > component device is bound):
> > >
> > > $ ./modetest -c -Mexynos
> > > could not get connector 56: No such file or directory
> > > Segmentation fault
> > >
> > > While touching this, move the connector reset() call also under the DRM
> > > device registered check, because otherwise it is not really needed.
> > >
> > > Fixes: 934aef885f9d ("drm: bridge: panel: Reset the connector state pointer")
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > ---
> > > Here is a bit more backgroud on this issue is available in this thread:
> > > https://lore.kernel.org/all/f0474a95-4ba3-a74f-d7de-ef7aab12bc86@samsung.com/
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > > index ff1c37b2e6e5..0ee563eb2b6f 100644
> > > --- a/drivers/gpu/drm/bridge/panel.c
> > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > @@ -83,8 +83,11 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
> > >         drm_connector_attach_encoder(&panel_bridge->connector,
> > >                                           bridge->encoder);
> > >
> > > -       if (connector->funcs->reset)
> > > -               connector->funcs->reset(connector);
> > > +       if (bridge->dev->registered) {
> > > +               if (connector->funcs->reset)
> > > +                       connector->funcs->reset(connector);
> > > +               drm_connector_register(connector);
> > > +       }
> >
> > Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> 
> Fixed typos in commit message.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> 
> Applied to drm-misc-next

Doesn't this open the door to various race conditions ?

Also, what happens if the panel bridge is detached and reattached ? If I
recall correctly, registering new connectors at runtime is at least
partly supported for DP MST, but I'm not sure about unregistration.

-- 
Regards,

Laurent Pinchart
