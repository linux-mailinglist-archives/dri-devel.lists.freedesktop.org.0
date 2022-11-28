Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB51363A23D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01ED10E29C;
	Mon, 28 Nov 2022 07:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF5610E29C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 07:43:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ECCA501;
 Mon, 28 Nov 2022 08:43:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669621416;
 bh=JKQPHHZZhD4m5jviZGkXGPGW3MyixyKT0ajEkDv2CwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bFl87EvA7iIADwK67gz+MgxF7h/Wsng0UHQJnieoVmQlIcvuTAiuxDGgIjyfWR/JX
 +lNBQlwGuKt+fRrmXkWbGj+0jSQnKx9q4By9NIXlct1+9sXBuEFDMa7o4NWwGj3BLb
 INq51KxtmbbnQPtbh0Dukz1LFhCfEo/mb1XDY6hw=
Date: Mon, 28 Nov 2022 09:43:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Qiqi Zhang <eddy.zhang@rock-chips.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix output polarity setting bug
Message-ID: <Y4RmmXHDCxH09eJ+@pendragon.ideasonboard.com>
References: <20221125104558.84616-1-eddy.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221125104558.84616-1-eddy.zhang@rock-chips.com>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Tomi to the CC list. Tomi, would you be able to test this ?

On Fri, Nov 25, 2022 at 06:45:58PM +0800, Qiqi Zhang wrote:
> According to the description in ti-sn65dsi86's datasheet:
> 
> CHA_HSYNC_POLARITY:
> 0 = Active High Pulse. Synchronization signal is high for the sync
> pulse width. (default)
> 1 = Active Low Pulse. Synchronization signal is low for the sync
> pulse width.
> 
> CHA_VSYNC_POLARITY:
> 0 = Active High Pulse. Synchronization signal is high for the sync
> pulse width. (Default)
> 1 = Active Low Pulse. Synchronization signal is low for the sync
> pulse width.
> 
> We should only set these bits when the polarity is negative.
> Signed-off-by: Qiqi Zhang <eddy.zhang@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 3c3561942eb6..eb24322df721 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -931,9 +931,9 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
>  		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>  	u8 hsync_polarity = 0, vsync_polarity = 0;
>  
> -	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>  		hsync_polarity = CHA_HSYNC_POLARITY;
> -	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>  		vsync_polarity = CHA_VSYNC_POLARITY;
>  
>  	ti_sn65dsi86_write_u16(pdata, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,

-- 
Regards,

Laurent Pinchart
