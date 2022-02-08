Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449E4ACCDD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 02:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AB210E442;
	Tue,  8 Feb 2022 01:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04AD10E2EE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 01:01:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 220AA340;
 Tue,  8 Feb 2022 02:01:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644282071;
 bh=zf2IBwOXTlLLWxPLKJPWOh3cW1IP/OCLLqNuHUzhDK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sM5DdXaStDmOCs5vwb4olp7CpTsOyisoRiZQV17FA64yDJ8TvxKZ07w1nZCa5SF+8
 +IV7NcvRcHoCXelFk0O5cxavRhvuhCIGzrVUJazPWJ5suKZ2Yhr1W/F2BHlQXSWwyK
 3cMv6B4v7wwh+MtAf3rgJojskZ4LkNVoMJbKm8j0=
Date: Tue, 8 Feb 2022 03:01:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 6/9] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Message-ID: <YgHA1H2/RKcILTYv@pendragon.ideasonboard.com>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-7-sam@ravnborg.org>
 <CAD=FV=Xhy__pDFM=t2bWAGkVthksXHSjfo9Oei3regqPdty12A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xhy__pDFM=t2bWAGkVthksXHSjfo9Oei3regqPdty12A@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Mon, Feb 07, 2022 at 02:34:34PM -0800, Doug Anderson wrote:
> On Sun, Feb 6, 2022 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Slightly awkward to fish out the display_info when we aren't creating
> > own connector.  But I don't see an obvious better way.
> >
> > v3:
> >  - Rebased and dropped the ti_sn_bridge_get_bpp() patch
> >    as this was solved in a different way (Sam)
> >
> > v2:
> >  - Remove error return with NO_CONNECTOR flag (Rob)
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 +++++++++-----------
> >  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> This is fine by me assuming we can fix the previous patches.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Likewise,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> NOTE: to me, this isn't something to do _instead_ of my patch [1] but
> _in addition_ to it. ${SUBJECT} patch transitions us to a more modern
> approach of having the connector created elsewhere but doesn't remove
> the old fallback code. Might as well clean the fallback code up unless
> you think it's going to simply be deleted right away or something?

I don't really mind either way, but I of course would favour removal of
connector support as soon as practical :-)

> [1] https://lore.kernel.org/r/20220204161245.v2.1.I3ab26b7f197cc56c874246a43e57913e9c2c1028@changeid

-- 
Regards,

Laurent Pinchart
