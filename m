Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBE44BD99B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 13:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4185910E2CC;
	Mon, 21 Feb 2022 12:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD4B10E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 12:15:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFAFF482;
 Mon, 21 Feb 2022 13:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645445710;
 bh=z2gP+YiY54A7p25XmMCHjyaR7eKgMyq0FafyUCX7pNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WB38vC51fJwzH/eXxAz406pecnSxPUyMgblwAOzG/kDqRXXrNP4S7+ihdfjEHOsZv
 GPa8AwhfxFP9vSzD3UUJ55fgkrHJ6hFYHhWm9nWkX8Z2q4d2jiKmC8ZM/gvqEvo9km
 gp/NOz2PCE765RbfDqNdoe3xMwolQhWZYnKXgUEQ=
Date: Mon, 21 Feb 2022 14:15:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm: rcar-du: switch to devm_drm_of_get_bridge
Message-ID: <YhOCRQhDClgsBAtV@pendragon.ideasonboard.com>
References: <20220221073757.12181-1-jose.exposito89@gmail.com>
 <20220221085619.bqyr2etq4xjjqa4p@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221085619.bqyr2etq4xjjqa4p@houat>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 09:56:19AM +0100, Maxime Ripard wrote:
> On Mon, Feb 21, 2022 at 08:37:57AM +0100, José Expósito wrote:
> > The function "drm_of_find_panel_or_bridge" has been deprecated in
> > favor of "devm_drm_of_get_bridge".
> > 
> > Switch to the new function and reduce boilerplate.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 16 +++++-----------
> >  1 file changed, 5 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index 72a272cfc11e..99b0febc56d1 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -712,18 +712,12 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
> >  {
> >  	int ret;
> >  
> > -	ret = drm_of_find_panel_or_bridge(lvds->dev->of_node, 1, 0,
> > -					  &lvds->panel, &lvds->next_bridge);
> 
> I guess lvds->panel can be removed from the rcar_lvds struct as well?

It's used in rcar_lvds_get_lvds_mode() though, so this patch introduces
a regression.

-- 
Regards,

Laurent Pinchart
