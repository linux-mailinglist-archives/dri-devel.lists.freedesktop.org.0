Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3443B59C043
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 15:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819E08ADC1;
	Mon, 22 Aug 2022 13:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C938ACE2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:12:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07E142B3;
 Mon, 22 Aug 2022 15:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661173950;
 bh=zTVbt7EriLZawrLej2Zumg9jMLXLeci7B56ylDRblYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z5yt8ut8RpG2Kz7TZCxYKqO1RgAzCLOpPtCaNCuVkb4rxywqarbO9oasc9RxS495z
 /Xx/pRqiTWrnrKyqRGgfRgYODdzAAIP6CZ+roHAkV/SR6bceRTENmNCvUuIHNqNUe6
 vQaZk/3HgEtMDWWdhRaBOLtbsthvxx12YzA7cMIU=
Date: Mon, 22 Aug 2022 16:12:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
Message-ID: <YwOAupzlJFVGGsY9@pendragon.ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220822130513.119029-2-tomi.valkeinen@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Mon, Aug 22, 2022 at 04:05:09PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The driver does not explicitly stop the video mode transmission when
> disabling the output. While this doesn't seem to be causing any issues,
> lets follow the steps described in the documentation and add a
> rcar_mipi_dsi_stop_video() which stop the video mode transmission. This
> function will also be used in later patches to stop the video
> transmission even if the DSI IP is not shut down.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 29 +++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 62f7eb84ab01..7f2be490fcf8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -542,6 +542,34 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
>  	return 0;
>  }
>  
> +static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi)
> +{
> +	u32 status;
> +	int ret;
> +
> +	/* Disable transmission in video mode. */
> +	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_EN_VIDEO);
> +
> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +				!(status & TXVMSR_ACT),
> +				2000, 100000, false, dsi, TXVMSR);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "Failed to disable video transmission\n");
> +		return;
> +	}
> +
> +	/* Assert video FIFO clear. */
> +	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_VFCLR);
> +
> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +				!(status & TXVMSR_VFRDY),
> +				2000, 100000, false, dsi, TXVMSR);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "Failed to assert video FIFO clear\n");
> +		return;
> +	}
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Bridge
>   */
> @@ -601,6 +629,7 @@ static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
>  {
>  	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>  
> +	rcar_mipi_dsi_stop_video(dsi);
>  	rcar_mipi_dsi_shutdown(dsi);
>  	rcar_mipi_dsi_clk_disable(dsi);
>  }

-- 
Regards,

Laurent Pinchart
