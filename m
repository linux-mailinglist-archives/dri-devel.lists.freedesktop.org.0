Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE642ADB2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 22:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BC889D83;
	Tue, 12 Oct 2021 20:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E9A89D83
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 20:17:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0DDEE52;
 Tue, 12 Oct 2021 22:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634069841;
 bh=4EQuC8eOIJsimF2TBe95dDG7kbMlayntaED2XS2wqug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XO1ps6R0MZpJdn6usO4hFaoxRJoLnxT5OXPDFe+FIiZZTf5driWZwTEqWNz4YCZBb
 BWBUZ5xy0Axew5U8nQq78u+x23Ro6mfVAdjxr1cQwVF+JSRyInvWT9ea8UNqvSzcYo
 Hr80jyDU6QRL4XpH13j+dFnTWLSinC+Iok7fWsDo=
Date: Tue, 12 Oct 2021 23:17:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Ignore -EPROBE_DEFER when bridge attach fails
Message-ID: <YWXtQ778N/rn+Jnu@pendragon.ideasonboard.com>
References: <00493cc61d1443dab1c131c46c5890f95f6f9b25.1634068657.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00493cc61d1443dab1c131c46c5890f95f6f9b25.1634068657.git.agx@sigxcpu.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido,

Thank you for the patch.

On Tue, Oct 12, 2021 at 09:58:58PM +0200, Guido Günther wrote:
> Otherwise logs are filled with
> 
>   [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a0 0000 to encoder None-34: -517
> 
> when the bridge isn't ready yet.
> 
> Fixes: fb8d617f8fd6 ("drm/bridge: Centralize error message when bridge attach fails")
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index a8ed66751c2d..f0508e85ae98 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -227,14 +227,15 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	bridge->encoder = NULL;
>  	list_del(&bridge->chain_node);
>  
> +	if (ret != -EPROBE_DEFER) {
>  #ifdef CONFIG_OF
> -	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> -		  bridge->of_node, encoder->name, ret);
> +		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> +			  bridge->of_node, encoder->name, ret);
>  #else
> -	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> -		  encoder->name, ret);
> +		DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> +			  encoder->name, ret);
>  #endif
> -
> +	}

This looks fine as such, but I'm concerned about the direction it's
taking. Ideally, probe deferral should happen at probe time, way before
the bridge is attached. Doing otherwise is a step in the wrong direction
in my opinion, and something we'll end up regretting when we'll feel the
pain it inflicts.

>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_bridge_attach);

-- 
Regards,

Laurent Pinchart
