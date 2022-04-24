Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723EB50D2AD
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 17:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B6510E4E0;
	Sun, 24 Apr 2022 15:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6164010E4E0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 15:31:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4695930B;
 Sun, 24 Apr 2022 17:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650814278;
 bh=vKKxFT2p1cxcscA0uKSVIAwHFyojOOhC3vEO52mlaQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WlktwopVQxDaB2gL7j8oszAyc31lrp7N8VRRE8W3Wz9VqiEh0xaJabDpUofPtkImU
 jmFK/HuEPnyz6b1UBGNjwnrD5rIkY8kvgnu36/6Lx+X3RkLRGIj1v5LmW67AW16G4h
 /PJhkklclWtFnjb7QJrl5JXJheWhUKlrpn5cbPIM=
Date: Sun, 24 Apr 2022 18:31:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on Gen3
Message-ID: <YmVtRlI0+IfuXujL@pendragon.ideasonboard.com>
References: <20220423073728.111808-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220423073728.111808-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Sat, Apr 23, 2022 at 08:37:28AM +0100, Biju Das wrote:
> From: LUU HOAI <hoai.luu.ub@renesas.com>
> 
> In Gen3, when Alpha blend is enabled in the PnMR register,
> depending on the initial value of the PnALPHAR register,
> either channel of DU might be black screen.
> Therefore, this patch prevents the black screen by setting
> the PnALPHAR register to all 0.
> 
> In addition, PnALPHAR register will be released in
> the R-Car Gen3 Hardware Manual Rev 2.4 (Sep. 2021).
> 
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is based on [1]
> [1] https://github.com/renesas-rcar/linux-bsp/commit/fcb34fe338cbde0a64919430733541035f20a784
> 
> Not sure this patches has to go with Fixes tag for stable??
> 
> Tested the changes on RZ/G2M board
> 
> root@hihope-rzg2m:/cip-test-scripts#  modetest -M rcar-du -w 54:alpha:55555
> root@hihope-rzg2m:/cip-test-scripts# modetest -M rcar-du -s "93@90:1024x768@AR24" -d -P "54@90:400x300+200+200@XR24"
> setting mode 1024x768-75Hz@AR24 on connectors 93, crtc 90
> testing 400x300@XR24 overlay plane 54
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index 5c1c7bb04f3f..aff39b9253f8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -510,6 +510,12 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
>  
>  	rcar_du_plane_write(rgrp, index, PnDDCR4,
>  			    state->format->edf | PnDDCR4_CODE);
> +
> +	/* In Gen3, PnALPHAR register need to be set to 0
> +	 * to avoid black screen issue when alpha blend is enable
> +	 * on DU module
> +	 */

Comments should start with /* on a line of its own, and you can also
reflow the text to 80 columns:

	/*
	 * In Gen3, PnALPHAR register need to be set to 0 to avoid black screen
	 * issue when alpha blend is enable on DU module.
	 */

It would however be nicer to document the exact behaviour, but the
latest version of the documentation I have access to is rev 2.3 and it
lists PnALPHAR as not available on Gen3.

Furthermore, is this really the right fix, shouldn't we instead avoid
enabling alpha-blending in PnMR on Gen3 ?

> +	rcar_du_plane_write(rgrp, index, PnALPHAR, 0x00000000);
>  }
>  
>  static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,

-- 
Regards,

Laurent Pinchart
