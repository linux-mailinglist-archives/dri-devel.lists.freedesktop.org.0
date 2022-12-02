Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF6640984
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 16:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B3F10E702;
	Fri,  2 Dec 2022 15:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004C110E702
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 15:43:22 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p18C9-0000uW-7r; Fri, 02 Dec 2022 16:43:21 +0100
Message-ID: <5ee075af33e5cee085830ae8237a94706d62d27b.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: ipuv3-plane: Fix overlay plane width
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Date: Fri, 02 Dec 2022 16:43:19 +0100
In-Reply-To: <20221108141420.176696-1-p.zabel@pengutronix.de>
References: <20221108141420.176696-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 08.11.2022 um 15:14 +0100 schrieb Philipp Zabel:
> ipu_src_rect_width() was introduced to support odd screen resolutions
> such as 1366x768 by internally rounding up primary plane width to a
> multiple of 8 and compensating with reduced horizontal blanking.
> This also caused overlay plane width to be rounded up, which was not
> intended. Fix overlay plane width by limiting the rounding up to the
> primary plane.
> 
> drm_rect_width(&new_state->src) >> 16 is the same value as
> drm_rect_width(dst) because there is no plane scaling support.

Heh, I stumbled at exactly this point while reading the code changes
and was about to suggest it be added to the changelog until I realized
that it's already here. :)
> 
> Fixes: 94dfec48fca7 ("drm/imx: Add 8 pixel alignment fix")
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

One note below.

> ---
>  drivers/gpu/drm/imx/ipuv3-plane.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index dba4f7d81d69..80142d9a4a55 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -614,6 +614,11 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
>  		break;
>  	}
>  
> +	if (ipu_plane->dp_flow == IPU_DP_FLOW_SYNC_BG)
> +		width = ipu_src_rect_width(new_state);
> +	else
> +		width = drm_rect_width(&new_state->src) >> 16;
> +
>  	eba = drm_plane_state_to_eba(new_state, 0);
>  
>  	/*
> @@ -622,8 +627,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
>  	 */
>  	if (ipu_state->use_pre) {
>  		axi_id = ipu_chan_assign_axi_id(ipu_plane->dma);
> -		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id,
> -					  ipu_src_rect_width(new_state),
> +		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id, width,
>  					  drm_rect_height(&new_state->src) >> 16,
>  					  fb->pitches[0], fb->format->format,
>  					  fb->modifier, &eba);
> @@ -678,9 +682,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
>  		break;
>  	}
>  
> -	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, ALIGN(drm_rect_width(dst), 8));
> +	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, width);
>  
> -	width = ipu_src_rect_width(new_state);
>  	height = drm_rect_height(&new_state->src) >> 16;

There's a opportunity for a follow-up cleanup here:
"drm_rect_height(&new_state->src) >> 16" is used multiple times in this
function, which could be replaced by using this local height variable
instead.

>  	info = drm_format_info(fb->format->format);
>  	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
> @@ -744,8 +747,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
>  		ipu_cpmem_set_burstsize(ipu_plane->ipu_ch, 16);
>  
>  		ipu_cpmem_zero(ipu_plane->alpha_ch);
> -		ipu_cpmem_set_resolution(ipu_plane->alpha_ch,
> -					 ipu_src_rect_width(new_state),
> +		ipu_cpmem_set_resolution(ipu_plane->alpha_ch, width,
>  					 drm_rect_height(&new_state->src) >> 16);
>  		ipu_cpmem_set_format_passthrough(ipu_plane->alpha_ch, 8);
>  		ipu_cpmem_set_high_priority(ipu_plane->alpha_ch);
> 
> base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780


