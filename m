Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42559DAD2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 13:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDB310ECB6;
	Tue, 23 Aug 2022 11:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B317210ECB6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 11:05:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F12D440;
 Tue, 23 Aug 2022 13:05:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661252731;
 bh=qByccXt8TjOrNHBKKSMs3wOeTmyRYqcLIDQ1cf+Prp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u2TwGZ4EGLNo3BvP5bVxvm0q9eX/BYaSxvtRmMlj0W0bORMUWT9eCiO2QBLMhdofA
 DSk7C07jsNija+v3wsgaYLBYhbfnnHfud0ymBC5GXHVjkPdXKnHsjqO+UOboQvPugx
 bqckFVmbEGKmQoc0llyZhJetkRlAiGSnOg0SLMno=
Date: Tue, 23 Aug 2022 14:05:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 5/5] drm: rcar-du: dsi: Fix VCLKSET write
Message-ID: <YwS0d3DVh0JDYjun@pendragon.ideasonboard.com>
References: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
 <20220822143401.135081-6-tomi.valkeinen@ideasonboard.com>
 <YwOWc1pKM+vFK80P@pendragon.ideasonboard.com>
 <6fe9dffe-0f02-9cdc-cc6e-136de8326895@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6fe9dffe-0f02-9cdc-cc6e-136de8326895@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 01:52:38PM +0300, Tomi Valkeinen wrote:
> On 22/08/2022 17:45, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Aug 22, 2022 at 05:34:01PM +0300, Tomi Valkeinen wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> rcar_mipi_dsi_startup() writes correct values to VCLKSET, but as it uses
> >> or-operation to add the new values to the current value in the register,
> >> it should first make sure the fields are cleared.
> >>
> >> Do this by using rcar_mipi_dsi_write() to write the VCLKSET_CKEN bit to
> >> VCLKSET before the rest of the VCLKSET configuration.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 7 ++++---
> >>   1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >> index 06250f2f3499..b60a6d4a5d46 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >> @@ -412,9 +412,10 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
> >>   			return ret;
> >>   	}
> >>   
> >> -	/* Enable DOT clock */
> >> -	vclkset = VCLKSET_CKEN;
> >> -	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> >> +	/* Clear VCLKSET and enable DOT clock */
> >> +	rcar_mipi_dsi_write(dsi, VCLKSET, VCLKSET_CKEN);
> >> +
> >> +	vclkset = 0;
> >>   
> >>   	if (dsi_format == 24)
> >>   		vclkset |= VCLKSET_BPP_24;
> > 
> > You can replace one more set() with a write():
> 
> That's true. I'll send a new one.
> 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > index 06250f2f3499..2744ea23e6f6 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > @@ -414,7 +414,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
> > 
> >   	/* Enable DOT clock */
> >   	vclkset = VCLKSET_CKEN;
> > -	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> > +	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
> > 
> >   	if (dsi_format == 24)
> >   		vclkset |= VCLKSET_BPP_24;
> > @@ -429,7 +429,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
> >   	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
> >   		|  VCLKSET_LANE(dsi->lanes - 1);
> > 
> > -	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> > +	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
> > 
> >   	/* After setting VCLKSET register, enable VCLKEN */
> >   	rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);
> > 
> > I'll apply patches 1/5 to 4/5 to my tree already.
> 
> I'm not sure if 4 works correctly without 2.

I meant 1/5 to 4/5, not 1/5 and 4/5 :-)

-- 
Regards,

Laurent Pinchart
