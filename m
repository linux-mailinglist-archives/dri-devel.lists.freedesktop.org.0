Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BFE3B2F62
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5012A6EB76;
	Thu, 24 Jun 2021 12:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101CC6EB76
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:51:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EA40501;
 Thu, 24 Jun 2021 14:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624539095;
 bh=FyM+hUpA+ywRvZffMmTR6lQUvy56qO0lVXxmkkg6Xew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ku9nJvuUoGHtfvBSCPhZUnzsdZa9u8aUgOKXavhhvXazoNEHeJUmF+XnBUufyEyDw
 1VHzjJ+WKBohebiGedt87kbvxgGtmC9Ks0TSZ0H3ZF7iuIwMiv1vnU+XO21x8VHK+M
 SbVH2U84hYAwshMTNJ4e+pgpSJ5ks/Bcldv3ZRVk=
Date: Thu, 24 Jun 2021 15:51:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonathan Liu <net147@gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Move drm_bridge_add into probe
Message-ID: <YNR/uQrS75s5BILs@pendragon.ideasonboard.com>
References: <20210203091306.140518-1-jagan@amarulasolutions.com>
 <CANwerB1Bev8Ljta9OyO6vAKsQqHHmaJnjV1YRGmY4bVk_J6xZA@mail.gmail.com>
 <CAMty3ZAY7Ez9UYvfftSmqLEVWgN7xE5HevqfWirmrExZH=RMWA@mail.gmail.com>
 <CANwerB1AiiT3oXCpwP83M1=ES9M-yQoLuZO5f=eVxA42MkEbiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANwerB1AiiT3oXCpwP83M1=ES9M-yQoLuZO5f=eVxA42MkEbiA@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC'ing Maxime Ripard.

Maxime, is this similar to the issue we've recently discussed with the
VC4 DSI encoder ?

On Thu, Jun 24, 2021 at 10:39:48PM +1000, Jonathan Liu wrote:
> On Thu, 24 Jun 2021 at 22:34, Jagan Teki wrote:
> > On Fri, Jun 18, 2021 at 6:40 PM Jonathan Liu wrote:
> > > On Wed, 3 Feb 2021 at 09:13, Jagan Teki wrote:
> > > > @@ -1167,6 +1151,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
> > > >         dw_mipi_dsi_debugfs_init(dsi);
> > > >         pm_runtime_enable(dev);
> > > >
> > > > +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
> > > > +                                         &panel, &bridge);
> > > > +       if (ret)
> > > > +               return ERR_PTR(ret);
> > >
> > > On RK3399 if the error is EPROBE_DEFER, __dw_mipi_dsi_probe can be
> > > called again and result in the following errors:
> > > [    0.717589] debugfs: Directory 'ff960000.mipi' with parent '/' already present!
> > > [    0.717601] dw-mipi-dsi-rockchip ff960000.mipi: failed to create debugfs root
> > > [    0.717606] dw-mipi-dsi-rockchip ff960000.mipi: Unbalanced pm_runtime_enable!
> >
> > Is this when you test bridge on rk3399 or panel?
> 
> MIPI-DSI to LVDS bridge.

-- 
Regards,

Laurent Pinchart
