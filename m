Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BFF497571
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 21:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0C510E130;
	Sun, 23 Jan 2022 20:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B686410E130
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 20:08:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8896BD41;
 Sun, 23 Jan 2022 21:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1642968518;
 bh=BzIwj895BymBnu36XuRSvpJsdsZBdi4n4qQEJnJH7GM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lfnsmWlBHeNPC2W3jBEKqhdzYzuZdV1zsUonGp/6jtKTCupiBJTnPxtACkC3T3+Xf
 wuT6cqtk1MFcgOVuwnvGII9g4nSdRTNm04r0oKuykJKyKmSZoOw9aW2kMIVd/Y0R1N
 +MR40gvhe/ZIf3OfngUGIpX4lJj2xgYM4QRoSYKg=
Date: Sun, 23 Jan 2022 22:08:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yongzhi Liu <lyz_cs@pku.edu.cn>
Subject: Re: [PATCH] drm/bridge: Add missing pm_runtime_put_sync
Message-ID: <Ye21tlZKRRe2vUzR@pendragon.ideasonboard.com>
References: <1642606560-32287-1-git-send-email-lyz_cs@pku.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1642606560-32287-1-git-send-email-lyz_cs@pku.edu.cn>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com, robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yongzhi,

Thank you for the patch.

On Wed, Jan 19, 2022 at 07:36:00AM -0800, Yongzhi Liu wrote:
> pm_runtime_get_sync() will increase the rumtime PM counter
> even it returns an error. Thus a pairing decrement is needed
> to prevent refcount leak. Fix this by replacing this API with
> pm_runtime_resume_and_get(), which will not change the runtime
> PM counter on error. Besides, a matching decrement is needed
> on the error handling path to keep the counter balanced.
> 
> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 9282e61..e7dce5a 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -862,18 +862,19 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
>  	memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
>  	drm_mode_debug_printmodeline(adjusted_mode);
>  
> -	pm_runtime_get_sync(dev);
> +	if (pm_runtime_resume_and_get(dev) < 0)
> +		return;
>  
>  	if (clk_prepare_enable(dsi->lcdif_clk) < 0)
> -		return;
> +		goto runtime_put;
>  	if (clk_prepare_enable(dsi->core_clk) < 0)
> -		return;
> +		goto runtime_put;
>  
>  	/* Step 1 from DSI reset-out instructions */
>  	ret = reset_control_deassert(dsi->rst_pclk);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dev, "Failed to deassert PCLK: %d\n", ret);
> -		return;
> +		goto runtime_put;
>  	}
>  
>  	/* Step 2 from DSI reset-out instructions */
> @@ -883,13 +884,17 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
>  	ret = reset_control_deassert(dsi->rst_esc);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dev, "Failed to deassert ESC: %d\n", ret);
> -		return;
> +		goto runtime_put;
>  	}
>  	ret = reset_control_deassert(dsi->rst_byte);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dev, "Failed to deassert BYTE: %d\n", ret);
> -		return;
> +		goto runtime_put;
>  	}

You need a return here, otherwise you will unconditionally call
pm_runtime_put_sync() even on success.

> +
> +runtime_put:
> +	pm_runtime_put_sync(dev);
> +	return;

You can drop the return here.

>  }
>  
>  static void

-- 
Regards,

Laurent Pinchart
