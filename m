Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9C569EFE6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 09:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0D10E42C;
	Wed, 22 Feb 2023 08:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C960310E42C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 08:07:14 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 202494E1;
 Wed, 22 Feb 2023 09:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677053233;
 bh=d7GOIS+Ej2KfXope9MuGbfcUaN48P7nxpib4yMiTsKE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jMjyCRA2VF561lAYOHh5lxtmsYU2PZY2BEXL+H2pyjqVmanUEtYlQmIJtUAhiHZ2K
 ImLg69/XkQhN0Fz/OvWFeMCcfRDBWkF7BomngVqjuCkIbnD4uOvNiF7CMhh6NLMaAC
 02N8K8zFsrnwuiSAl6F954li2D9INKKQIZbTp/rE=
Message-ID: <43324903-96e2-29ef-5a38-01cee2d4b0f0@ideasonboard.com>
Date: Wed, 22 Feb 2023 10:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] drm: rcar-du: Don't write unimplemented ESCR and OTAR
 registers on Gen3
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230222050623.29080-2-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230222050623.29080-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2023 07:06, Laurent Pinchart wrote:
> The ESCR and OTAR registers are not present in all DU channels on Gen3
> SoCs. ESCR only exists in channels that can be routed to an LVDS or
> DPAD, and OTAR in channels that can be routed to a DPAD. Skip writing
> those registers for other channels. This replaces the DU gen check, as
> Gen4 doesn't have LVDS or DPAD outputs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 5e552b326162..d6d29be6b4f4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -298,12 +298,25 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>   		escr = params.escr;
>   	}
>   
> -	if (rcdu->info->gen < 4) {
> +	/*
> +	 * The ESCR register only exists in DU channels that can output to an
> +	 * LVDS or DPAT, and the OTAR register in DU channels that can output
> +	 * to a DPAD.
> +	 */
> +	if ((rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs |
> +	     rcdu->info->routes[RCAR_DU_OUTPUT_DPAD1].possible_crtcs |
> +	     rcdu->info->routes[RCAR_DU_OUTPUT_LVDS0].possible_crtcs |
> +	     rcdu->info->routes[RCAR_DU_OUTPUT_LVDS1].possible_crtcs) &
> +	    BIT(rcrtc->index)) {
>   		dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
>   
>   		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
> +	}
> +
> +	if ((rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs |
> +	     rcdu->info->routes[RCAR_DU_OUTPUT_DPAD1].possible_crtcs) &
> +	    BIT(rcrtc->index))
>   		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
> -	}
>   
>   	/* Signal polarities */
>   	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

