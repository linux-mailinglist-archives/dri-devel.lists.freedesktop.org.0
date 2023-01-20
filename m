Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424CB6759BB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA1A10EAA7;
	Fri, 20 Jan 2023 16:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF38810EAA7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 16:19:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37895514;
 Fri, 20 Jan 2023 17:19:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674231556;
 bh=Hg/04fLGcBELgEBvbgtX/Sky963evfJEH75/r2EiALw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cvCgRC+OYgU/Fr+7Vi1LsnY3LoNTvwC6KFa1Fyd1eykHnauceFlO+VyWRUj54RJn6
 YBeP4y75H4au/a93ewHUsahVS0uf347HlXwawXa7YRMhdGHxD9FGzQEra+hzFiOJr7
 P55V4c6wotvxsY6YQ8uCy/dGbui9oZxjLME4GfIY=
Date: Fri, 20 Jan 2023 18:19:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 4/7] drm: rcar-du: lvds: Fix stop sequence
Message-ID: <Y8q/AU/ly6/LUL+Z@pendragon.ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-5-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230120085009.604797-5-tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Fri, Jan 20, 2023 at 10:50:06AM +0200, Tomi Valkeinen wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> According to hardware manual, LVDCR0 register must be cleared bit by bit
> when disabling LVDS.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> [tomi.valkeinen: simplified the code a bit]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 668604616bfd..8fa5f7400179 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -83,6 +83,11 @@ struct rcar_lvds {
>  #define bridge_to_rcar_lvds(b) \
>  	container_of(b, struct rcar_lvds, bridge)
>  
> +static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
> +{
> +	return ioread32(lvds->mmio + reg);
> +}
> +
>  static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
>  {
>  	iowrite32(data, lvds->mmio + reg);
> @@ -544,6 +549,27 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>  				     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +	u32 lvdcr0;
> +
> +	lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
> +
> +	lvdcr0 &= ~LVDCR0_LVRES;
> +	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +
> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
> +		lvdcr0 &= ~LVDCR0_LVEN;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
> +
> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
> +		lvdcr0 &= ~LVDCR0_PWD;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
> +
> +	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
> +		lvdcr0 &= ~LVDCR0_PLLON;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
>  
>  	rcar_lvds_write(lvds, LVDCR0, 0);
>  	rcar_lvds_write(lvds, LVDCR1, 0);

-- 
Regards,

Laurent Pinchart
