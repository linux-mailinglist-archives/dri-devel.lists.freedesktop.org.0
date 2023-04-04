Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFC6D5709
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 05:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFA710E060;
	Tue,  4 Apr 2023 03:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0917E10E060
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 03:11:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DD547F8;
 Tue,  4 Apr 2023 05:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680577903;
 bh=QHfaWu6kFzbNQ1dtuMtgKjwrpsBon/2AohknALK4hWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OcLGpt+AhrdgIKMETvI5tCgH2ROrZUHTTb62urKvmFQ4rY72oUP7KOPzmFX85GYiD
 IGLiGI1bleKY5E68Lvb8lJY7ZZH4U0QnYpSuYBbaXJHBCI8X1jSfg68DYdTZOQPH/3
 SMvdkDRRAY2wXI9Et3DS5kzWJnFE0Y4VGbQWqwh4=
Date: Tue, 4 Apr 2023 06:11:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA
 and EOT packet
Message-ID: <20230404031150.GF16648@pendragon.ideasonboard.com>
References: <20230403190242.224490-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230403190242.224490-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Mon, Apr 03, 2023 at 09:02:42PM +0200, Marek Vasut wrote:
> Do not generate the HS front and back porch gaps, the HSA gap and
> EOT packet, as per "SN65DSI83 datasheet SLLSEC1I - SEPTEMBER 2012
> - REVISED OCTOBER 2020", page 22, these packets are not required.
> This makes the TI SN65DSI83 bridge work with Samsung DSIM on i.MX8MN.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

I have successfully used this driver with a Raspberry Pi CM4. The VC4
DSI driver does not seem to support the newly added flags, so this patch
shouldn't have any effect there.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 91ecfbe45bf90..b60ae1dc1191d 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -642,7 +642,9 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
>  
>  	dsi->lanes = dsi_lanes;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
> +			  MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	ret = devm_mipi_dsi_attach(dev, dsi);
>  	if (ret < 0) {

-- 
Regards,

Laurent Pinchart
