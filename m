Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8728C510B80
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 23:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D90E10E075;
	Tue, 26 Apr 2022 21:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932E110E075
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 21:46:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80BF430B;
 Tue, 26 Apr 2022 23:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651009571;
 bh=dDUZQvFDFK/8cE9o9DOXsJPj/VhAwT92q4uKidk60b0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oLDnBolOKdqoIIDfalrlVzBr3MrbRuaZ01O62IaBtW+Eu+/7DbUtpyqTQ2ECt9nCW
 W1AMZUy28X/qKOOA98TTa2bjzLQnj1yd7VWal5Kj2lQWB3ud0pLp0APpWZpBrBlWgJ
 xJk35l6gUEeH5WX+YeroReYjfg6IQP23F9ehL20Q=
Date: Wed, 27 Apr 2022 00:46:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] drm: rcar-du: Fix Alpha blending issue on Gen3
Message-ID: <YmhoI3AimOR5ovMj@pendragon.ideasonboard.com>
References: <20220426084157.10979-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426084157.10979-1-biju.das.jz@bp.renesas.com>
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

On Tue, Apr 26, 2022 at 09:41:57AM +0100, Biju Das wrote:
> From: LUU HOAI <hoai.luu.ub@renesas.com>
> 
> As per R-Car-Gen3_Common_OPC_Customer_Notifications_V30.1.pdf,
> unexpected image output(such as incorrect colors or planes being
> invisible) can happen on the below conditions, as PnALPHAR register
> is not initialized by reset.
> 
> When alpha blending (PpMRm.PpSPIM=0b101) is performed and:
> 	•two Planes are enabled on any DUn (n=0,1,2,3)
> 		oDSPRn= 0x0000 0031 or 0x0000 0013
> 	•or DU0 and DU1 is used for display at the same time
> 		oDSPR0= 0x0000 0001 and DSPR1= 0x0000 0003
> 		oDSPR0= 0x0000 0003 and DSPR1= 0x0000 0001
> 	•or DU2 and DU3(H3 Only) is used for display at the same time
> 		oDSPR2= 0x0000 0001 and DSPR3= 0x0000 0003
> 		oDSPR2= 0x0000 0003 and DSPR3= 0x0000 0001
> 
> This patch set PnALPHAR register to 0 to avoid this issue.
> 
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v1->v2:
>  * Updated commit description
>  * Updated the code comments
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index f214a8b6cfd3..aa80c44dd8d7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -510,6 +510,18 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
>  
>  	rcar_du_plane_write(rgrp, index, PnDDCR4,
>  			    state->format->edf | PnDDCR4_CODE);
> +
> +	/*
> +	 * On Gen3, some DU channels have two planes, each being wired to a
> +	 * separate VSPD instance. The DU can then blend two planes. While
> +	 * this feature isn't used by the driver, issues related to alpha
> +	 * blending (such as incorrect colors or planes being invisible) may
> +	 * still occur if the PnALPHAR register has a stale value. Set the
> +	 * register to 0 to avoid this.
> +	 */
> +
> +	/* TODO: Check if alpha-blending should be disabled in PnMR. */
> +	rcar_du_plane_write(rgrp, index, PnALPHAR, 0);
>  }
>  
>  static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,

-- 
Regards,

Laurent Pinchart
