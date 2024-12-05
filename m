Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE0B9E5D3F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 18:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D1A10EF28;
	Thu,  5 Dec 2024 17:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HwxXKHoA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49B110EF28
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 17:35:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69D762B3;
 Thu,  5 Dec 2024 18:34:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733420076;
 bh=WQlqs2b3gZl3ijVpbkx65Dbf+b3YV9hOMw6FMzNRzgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HwxXKHoA0W9slXiSRGl9gxsQ5iE6RURj3g8O/5xRzQf8G9ONWEojrYL9F/Hu/8ENF
 TY7+GZUP0Ko9zxewaSg4d5BMTZxVJ6YzUO91Qf5Xzj09CbWKWTnhxJqMv77YcPdnZB
 jHpTeH3QNsGTCpJf54wqRxMeyA8R8q4KIeTy0Z/g=
Date: Thu, 5 Dec 2024 19:34:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 02/10] drm/rcar-du: Write DPTSR only if there are more
 than one crtc
Message-ID: <20241205173452.GA21014@pendragon.ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
 <20241205-rcar-gh-dsi-v2-2-42471851df86@ideasonboard.com>
 <CAMuHMdVHRWbeQ8UF-xsKuxUNwHc5_kVwSgrTfOkwFFG5vG7fwA@mail.gmail.com>
 <98b43276-2a68-4ba9-999a-c738b8f7654f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98b43276-2a68-4ba9-999a-c738b8f7654f@ideasonboard.com>
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

On Thu, Dec 05, 2024 at 06:08:24PM +0200, Tomi Valkeinen wrote:
> On 05/12/2024 16:16, Geert Uytterhoeven wrote:
> > Hi Tomi,
> > 
> > CC Jacopo
> > 
> > On Thu, Dec 5, 2024 at 2:45 PM Tomi Valkeinen wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Currently the driver always writes DPTSR when setting up the hardware.
> >> However, the register is only meaningful when there are more than one
> >> crtc, and the only SoC with one crtc, V3M, does not have the register
> >> mentioned in its documentation.
> > 
> > R-Car V3H/V3H_2, too.
> 
> Right... I was looking at the number of outputs, not the number of crtcs 
> when going through the SoCs.
> 
> >> So move the write behind a condition.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 12 +++++++-----
> >>   1 file changed, 7 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >> index 2ccd2581f544..0fbf6abbde6e 100644
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >> @@ -185,11 +185,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> >>                  dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
> >>          rcar_du_group_write(rgrp, DORCR, dorcr);
> >>
> >> -       /* Apply planes to CRTCs association. */
> >> -       mutex_lock(&rgrp->lock);
> >> -       rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >> -                           rgrp->dptsr_planes);
> >> -       mutex_unlock(&rgrp->lock);
> >> +       if (rgrp->num_crtcs > 1) {
> >> +               /* Apply planes to CRTCs association. */
> >> +               mutex_lock(&rgrp->lock);
> >> +               rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >> +                                   rgrp->dptsr_planes);
> >> +               mutex_unlock(&rgrp->lock);
> >> +       }
> > 
> > This is per group, not per DU, right?
> > The second group on R-Car M3-W/M3-W+ has a single channel, hence no
> > DPTSR2 register.
> > The second group on R-Car M3-N has a single channel, but it's actually
> > the second physical channel in the group, and thus does have DPTSR2.
> 
> That logic does make sense. So that would be if (rgrp->channels_mask & 
> BIT(1)) then write DPTSR? And probably add a comment in the code about this.
> 
> > And apparently we had this discussion before...
> > https://lore.kernel.org/all/CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com
> 
> Somehow I hadn't even realized Jacopo had sent these before...

Oops...

I'll let Jacopo and you decide who will send an updated patch.

-- 
Regards,

Laurent Pinchart
