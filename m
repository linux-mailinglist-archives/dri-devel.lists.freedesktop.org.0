Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E919242029
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 21:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2E66E573;
	Tue, 11 Aug 2020 19:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301006E573
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 19:17:10 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A092620023;
 Tue, 11 Aug 2020 21:17:05 +0200 (CEST)
Date: Tue, 11 Aug 2020 21:17:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vinay Simha B N <simhavcs@gmail.com>
Subject: Re: [PATCH v8 2/2] display/drm/bridge: TC358775 DSI/LVDS driver
Message-ID: <20200811191704.GA524675@ravnborg.org>
References: <1594388491-15129-1-git-send-email-simhavcs@gmail.com>
 <1594388491-15129-2-git-send-email-simhavcs@gmail.com>
 <CAGWqDJ4P9dKzGngkiEtL_X1HRjjtU17WqNFM-qiv16tXwQNZTg@mail.gmail.com>
 <CAGWqDJ4s3x5M7dGMTxYMpDbM4NBS7kfTb6-+7Fdx8Pe=CE58fA@mail.gmail.com>
 <20200808213022.GW6186@pendragon.ideasonboard.com>
 <20200810175440.GC292825@ravnborg.org>
 <20200811101942.GB6054@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811101942.GB6054@pendragon.ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=WC5eoWgHUSoulA4aEAAA:9 a=CjuIK1q_8ugA:10
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinay Simha B N <simhavcs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay.

> > 
> > If Laurent or others identify further things to improve we can take
> > it in-tree.
> 
> Just one thing, please see below.
> 
> > > > >> +       d2l_write(tc->i2c, VTIM1, vtime1);
> > > > >> +       d2l_write(tc->i2c, HTIM2, htime2);
> > > > >> +       d2l_write(tc->i2c, VTIM2, vtime2);
> > > > >> +
> > > > >> +       d2l_write(tc->i2c, VFUEN, VFUEN_EN);
> > > > >> +       d2l_write(tc->i2c, SYSRST, SYS_RST_LCD);
> > > > >> +       d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
> > > > >> +
> > > > >> +       dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
> > > > >> +               connector->display_info.bus_formats[0],
> > > > >> +               tc->bpc);
> > > > >> +       /*
> > > > >> +        * Default hardware register settings of tc358775 configured
> > > > >> +        * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
> > > > >> +        */
> > > > >> +       if (connector->display_info.bus_formats[0] ==
> > > > >> +               MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> 
> This shouldn't come from the connector, but from the
> drm_bridge_state.output_bus_cfg.format. The drm_bridge_funcs
> .atomic_get_input_bus_fmts() operation likely needs to be implemented.

I trust you will look into this and submit a patch on top of
drm-misc-next.
Please add a proper "Fixes:" tag identifying the commit that introduced
this bug - in this case the commit introducing the driver.

Do not hesitate to reply to all if you have any questions.
We will help you if we can.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
