Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E101311ED17
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 22:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76D66EDDA;
	Fri, 13 Dec 2019 21:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C796EDDA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 21:41:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C548A9D6;
 Fri, 13 Dec 2019 22:41:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576273316;
 bh=t5bAuI7IPLlm5mpJ9LwRwRzISVV2tE9EKaG7gmQn18Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JuOGdNKUkqakSrplVGU8RiV4mAjbKWhN1ZHLip3jTHCcSt7+2GN2Q3CiY95S71itP
 n4V35RY0bawu6dyICQUOm77xjaOMHEF2I/2yhMYNo9v8OCXdKvbQ+Jqx9TdCKyM799
 HdfhShv2YMrR2WQLYxQhmBzO9YwdVoaSpqfvPfTM=
Date: Fri, 13 Dec 2019 23:41:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 5/7] drm: rcar-du: lvds: Fix mode for companion encoder
Message-ID: <20191213214146.GP4860@pendragon.ideasonboard.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575649974-31472-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Magnus Damm <magnus.damm@gmail.com>,
 ebiharaml@si-linux.co.jp, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabrizio,

Thank you for the patch.

On Fri, Dec 06, 2019 at 04:32:52PM +0000, Fabrizio Castro wrote:
> Primary and companion encoders need to set the same mode for
> things to work properly.
> 
> rcar_lvds_mode_set gets called into for the primary encoder only,
> therefore initialize the companion encoder mode while sorting
> the primary encoder mode out.
> 
> Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Would you mind rebasing this on top of "drm: rcar-du: lvds: Get mode
from state" ?

> ---
> v3->v4:
> * New patch extracted from patch:
>   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index cb2147c..eed5611 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -614,6 +614,18 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
>  	lvds->display_mode = *adjusted_mode;
>  
>  	rcar_lvds_get_lvds_mode(lvds);
> +	if (lvds->companion) {
> +		struct rcar_lvds *companion_lvds = bridge_to_rcar_lvds(
> +							lvds->companion);
> +
> +		/*
> +		 * FIXME: We should not be messing with the companion encoder
> +		 * private data from the primary encoder, but since
> +		 * rcar_lvds_mode_set gets called into for the primary encoder
> +		 * only, we don't have much of a choice for now.
> +		 */
> +		companion_lvds->mode = lvds->mode;
> +	}
>  }
>  
>  static int rcar_lvds_attach(struct drm_bridge *bridge)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
