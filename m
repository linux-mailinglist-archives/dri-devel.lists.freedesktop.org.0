Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6DA724758
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 17:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A8110E142;
	Tue,  6 Jun 2023 15:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2752710E142
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 15:12:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 737B7AB;
 Tue,  6 Jun 2023 17:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686064326;
 bh=Oah2aGO63UYKJzPu90hj8ereGEv5/mwt+DoMpnge6js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rUN2ByiV7CeRPg2ksDTv+39S7rl2EPslZtQ3QSiGdPtn3NwUpNSM/tUZ2UT9xDPLg
 B49DzB39Rw9Ofpuze27B79+QPRGFunSmhoREy2BDClF2/PlMn+3soI3WPnf0PCYpiG
 r6plBPV3JamI54gNv0q/y1XKfp8wB2Vtg1QEH2Kw=
Date: Tue, 6 Jun 2023 18:12:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/bridge: Silence error messages upon probe deferral
Message-ID: <20230606151229.GF7234@pendragon.ideasonboard.com>
References: <20230606144833.776646-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230606144833.776646-1-alexander.stein@ew.tq-group.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

Thank you for the patch.

On Tue, Jun 06, 2023 at 04:48:33PM +0200, Alexander Stein wrote:
> When -EPROBE_DEFER is returned do not raise an error, but silently return
> this error instead. Fixes error like this:
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> dev_err_probe() would be the best, but I am not sure if this function is
> always used within a driver's probe() call.
> 
>  drivers/gpu/drm/drm_bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c3d69af02e79d..07773d6441a1f 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -350,6 +350,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	bridge->encoder = NULL;
>  	list_del(&bridge->chain_node);
>  
> +	if (ret != -EPROBE_DEFER) {
>  #ifdef CONFIG_OF
>  	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
>  		  bridge->of_node, encoder->name, ret);

Wrong indentation.

dev_err_probe() could be useful, but this function is likely not called
from probe paths only :-S

When not called from a probe path, dropping the message will result in a
silent error, which would be hard to debug :-(

> @@ -357,6 +358,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
>  		  encoder->name, ret);
>  #endif
> +	}
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
