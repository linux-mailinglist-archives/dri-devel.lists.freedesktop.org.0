Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18189BF68D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 20:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241DE10E76E;
	Wed,  6 Nov 2024 19:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nns4+TUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F54C10E76E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 19:33:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B719736;
 Wed,  6 Nov 2024 20:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730921587;
 bh=g6kpRe8PUS9hABHGeqGN36/4Ud3aPl6nk89iJw3hRhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nns4+TUm3DLFhP5uRBPKeoSlj70jcN0U51EIgK0rd8v1wVDPnPtiPSeuWrUU/RZmY
 AQ+wg0OHuNRsUtkwRmBGiC1OmVxBG3wkuqEbZFmci5yhwzsoLVwJ9aLt1WILq3FYFx
 uxRMHAbkW5Yba93MFtLPkZSAZx3/pEu6prHou8Qg=
Date: Wed, 6 Nov 2024 21:33:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Message-ID: <20241106193310.GC21454@pendragon.ideasonboard.com>
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUgPax3B2nYfp5BN90uc4SFKND=fgHw3CaSsYab1K7WYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUgPax3B2nYfp5BN90uc4SFKND=fgHw3CaSsYab1K7WYw@mail.gmail.com>
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

On Wed, Nov 06, 2024 at 08:04:16PM +0100, Geert Uytterhoeven wrote:
> Hi Biju,
> 
> On Wed, Nov 6, 2024 at 7:49 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > The host_node pointer assigned and freed in adv7533_parse_dt()
> > and later adv7533_attach_dsi() uses the same. Fix this issue
> > by freeing the host_node in adv7533_attach_dsi() instead of
> > adv7533_parse_dt().
> >
> > Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > Changes in v3:
> >  - Replace __free construct with readable of_node_put().
> > Changes in v2:
> >  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
> >  - Dropped Archit Taneja invalid Mail address
> 
> Thanks for the update!
> 
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > @@ -143,6 +143,7 @@ int adv7533_attach_dsi(struct adv7511 *adv)
> >                                                  };
> >
> >         host = of_find_mipi_dsi_host_by_node(adv->host_node);
> > +       of_node_put(adv->host_node);
> 
> This still looks fragile to me, as afterwards a pointer to a freed
> node is left in struct adv7511.host_node. It would be safer to also
> clear adv->host_node here.
> 
> However, taking a look from a distance, the code looks like:
> 
>     static int adv7511_probe(struct i2c_client *i2c)
>     {
>             ...
>             adv7533_parse_dt(dev->of_node, adv7511);
>             ...
>             if (adv7511->info->has_dsi)
>                     ret = adv7533_attach_dsi(adv7511);
>             ...
>     }
> 
> The only reason adv7511.host_node exists is to pass it from
> adv7533_parse_dt() to adv7533_attach_dsi().
> So what about making this explicit?
>   1. Let adv7533_parse_dt() return the host_node or an error pointer,
>   2. Pass the host_node as a parameter to adv7533_attach_dsi(),
>   3. Call of_node_put() in adv7511_probe() after use.

Or, alternatively, if keeping the node pointer in the adv7511 structure
is preferred, call of_node_put() at .remove() time.

> >         if (!host)
> >                 return dev_err_probe(dev, -EPROBE_DEFER,
> >                                      "failed to find dsi host\n");
> > @@ -181,8 +182,6 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
> >         if (!adv->host_node)
> >                 return -ENODEV;
> >
> > -       of_node_put(adv->host_node);
> > -
> >         adv->use_timing_gen = !of_property_read_bool(np,
> >                                                 "adi,disable-timing-generator");

-- 
Regards,

Laurent Pinchart
