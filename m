Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C85345386
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 01:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF2489D89;
	Tue, 23 Mar 2021 00:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F7989D89
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:01:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E9D4A52;
 Tue, 23 Mar 2021 01:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616457665;
 bh=1WW6qwvVbYFjhgbp6peXSl7i0rOj0DjQbdTkGNk0wLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e0PgscoQxX7AP56OjLdJAIgeK60VwZSRdJPpvuOO9i8cZuz5E54BGmqYVnhU/XNMr
 4t5hc3mu/wuhHPqn1yncJUUnq1+tFGygD6pYMAVIt6POXSym7hREqkL7tLRmYtJvwL
 exR9BU4NtvLv4Hb66LGE+SNmC6HoedzOEws5ElqI=
Date: Tue, 23 Mar 2021 02:00:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
Message-ID: <YFkvl9tzP5Nj54C4@pendragon.ideasonboard.com>
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201101173741.GA1293305@ravnborg.org>
 <160436612483.884498.883110130131457033@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160436612483.884498.883110130131457033@swboyd.mtv.corp.google.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Mon, Nov 02, 2020 at 05:15:24PM -0800, Stephen Boyd wrote:
> Quoting Sam Ravnborg (2020-11-01 09:37:41)
> > Hi Stephen.
> > 
> > On Thu, Oct 29, 2020 at 06:17:34PM -0700, Stephen Boyd wrote:
> > > This patch series cleans up the DDC code a little bit so that
> > > it is more efficient time wise and supports grabbing the EDID
> > > of the eDP panel over the aux channel. I timed this on a board
> > > I have on my desk and it takes about 20ms to grab the EDID out
> > > of the panel and make sure it is valid.
> > > 
> > > The first two patches seem less controversial so I stuck them at
> > > the beginning. The third patch does the EDID reading and caches
> > > it so we don't have to keep grabbing it over and over again. And
> > > finally the last patch updates the reply field so that short
> > > reads and nacks over the channel are reflected properly instead of
> > > treating them as some sort of error that can't be discerned.
> > > 
> > > Stephen Boyd (4):
> > >   drm/bridge: ti-sn65dsi86: Combine register accesses in
> > >     ti_sn_aux_transfer()
> > >   drm/bridge: ti-sn65dsi86: Make polling a busy loop
> > >   drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
> > >   drm/bridge: ti-sn65dsi86: Update reply on aux failures
> > 
> > Series looks good. You can add my a-b on the full series.
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > I can apply after Douglas have had a look at the patches he did not r-b
> > yet.
> > 
> > Any chance we can convince you to prepare this bridge driver for use in
> > a chained bridge setup where the connector is created by the display
> > driver and uses drm_bridge_funcs?
> > 
> > First step wuld be to introduce the use of a panel_bridge.
> > Then add get_edid to drm_bridge_funcs and maybe more helpers.
> > 
> > Then natural final step would be to move connector creation to the
> > display driver - see how other uses drm_bridge_connector_init() to do so
> > - it is relatively simple.
> > 
> > Should be doable - and reach out if you need some help.
> 
> I started to look at this and got stuck at ti_sn_bridge_get_bpp(). Where
> can I get the details of the bpc for the downstream bridge or panel? Is
> there some function that can tell this bridge what the bpc is for the
> attached connector?

I've posted a patch series to convert to DRM_BRIDGE_ATTACH_NO_CONNECTOR
yesterday (and have CC'ed you), but I've overlooked this particular
problem :-S

You can't get the connector in the .enable() operation, but you can get
it in .atomic_enable(), with
drm_atomic_get_new_connector_for_encoder(). This being said, it's
probably not the right option.

What matters here isn't the bpc for the connector, but the format
expected by the next bridge in the chain. drm_bridge_funcs has two
operations, .atomic_get_output_bus_fmts() and
.atomic_get_input_bus_fmts(), to negotiate that format along a chain of
bridges. The panel bridge driver (drivers/gpu/drm/bridge/panel.c)
doesn't implement those operations, and neither does
display-connector.c, so that may be what we should start with.

> I see that td_mode_valid() in
> drivers/gpu/drm/bridge/tc358775.c stores away the bpc from the incoming
> drm_display_info pointer but I'm not sure that is correct because can't
> that be called for various and not necessarily the one we're using?

You're right, .mode_valid() shouldn't do that.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
