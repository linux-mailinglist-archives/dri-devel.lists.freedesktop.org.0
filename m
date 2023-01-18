Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D4D672A19
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 22:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DB910E002;
	Wed, 18 Jan 2023 21:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787E010E002
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 21:12:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0CA41056;
 Wed, 18 Jan 2023 22:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674076373;
 bh=zRzoLqB0W4Yjt4hwLvXC0DQFfJ3wVs3D7T1wyVBJHv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qd/g6dI2IfQbRRwb06Ze0w4npd/p8lBfY9dXzMup47rxhhoJrRRmLl+/b/oh1syNR
 qkjOcngSl9f02qcNPZtBezrihVePDC40o40EgDxcYlCoOWEmTr2rejB534aIni/UjP
 9+QyS4/A2gv0+Ve7qoIYv7ymHAhPc8/Wm+qAkuOk=
Date: Wed, 18 Jan 2023 23:12:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/6] drm: rcar-du: Fix LVDS stop sequence
Message-ID: <Y8hg0m7cidkscHkN@pendragon.ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-4-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117135154.387208-4-tomi.valkeinen+renesas@ideasonboard.com>
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
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, dri-devel@lists.freedesktop.org,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Jan 17, 2023 at 03:51:51PM +0200, Tomi Valkeinen wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> According to H/W manual, LVDCR0 register must be cleared bit by bit when

s@H/W@the hardware/

> disabling LVDS.

I don't like this much, but I think I'll stop fighting :-)

> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> [tomi.valkeinen: simplified the code a bit]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 674b727cdaa2..01800cef1c33 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -87,6 +87,11 @@ static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
>  	iowrite32(data, lvds->mmio + reg);
>  }
>  
> +static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
> +{
> +	return ioread32(lvds->mmio + reg);
> +}

Could you please move read before write ?

> +
>  /* -----------------------------------------------------------------------------
>   * PLL Setup
>   */
> @@ -549,8 +554,28 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
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

This will leave LVDCR0_BEN and LVDCR0_LVEN on Gen2. Is that fine ?

>  
> -	rcar_lvds_write(lvds, LVDCR0, 0);
>  	rcar_lvds_write(lvds, LVDCR1, 0);
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>  

-- 
Regards,

Laurent Pinchart
