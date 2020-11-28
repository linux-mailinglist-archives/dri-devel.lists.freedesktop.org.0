Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5482C71C8
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368756E0B9;
	Sat, 28 Nov 2020 22:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20976E0B9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:03:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 849E5BAB;
 Sat, 28 Nov 2020 23:03:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606600986;
 bh=7YBJuQtYHj9dTjRd/vaK8Nvo8/JkMSaK6DjkqheZcDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K+ahAnV2fIg69sbwr1pxAHmGlg3Low8EoyzuO2lb1zd71bLQJmWauXJ0HF1M05duZ
 jR0z7+WiI8QWoswNWIz6v+afNsuyyxS98DYkMYTIa7Geq4af8qOKPINPb96D3rqnua
 e/T6o+aCq+NXbhgiMuXEK1vBAqA3JCyX4lyjHHig=
Date: Sun, 29 Nov 2020 00:02:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: sdi: fix bridge enable/disable
Message-ID: <20201128220257.GB3865@pendragon.ideasonboard.com>
References: <20201127085241.848461-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127085241.848461-1-tomi.valkeinen@ti.com>
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
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Fri, Nov 27, 2020 at 10:52:41AM +0200, Tomi Valkeinen wrote:
> When the SDI output was converted to DRM bridge, the atomic versions of
> enable and disable funcs were used. This was not intended, as that would
> require implementing other atomic funcs too. This leads to:
> 
> WARNING: CPU: 0 PID: 18 at drivers/gpu/drm/drm_bridge.c:708 drm_atomic_helper_commit_modeset_enables+0x134/0x268
> 
> and display not working.
> 
> Fix this by using the legacy enable/disable funcs.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Fixes: 8bef8a6d5da81b909a190822b96805a47348146f ("drm/omap: sdi: Register a drm_bridge")
> Cc: stable@vger.kernel.org # v5.7+
> Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/sdi.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
> index 033fd30074b0..282e4c837cd9 100644
> --- a/drivers/gpu/drm/omapdrm/dss/sdi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
> @@ -195,8 +195,7 @@ static void sdi_bridge_mode_set(struct drm_bridge *bridge,
>  	sdi->pixelclock = adjusted_mode->clock * 1000;
>  }
>  
> -static void sdi_bridge_enable(struct drm_bridge *bridge,
> -			      struct drm_bridge_state *bridge_state)
> +static void sdi_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
>  	struct dispc_clock_info dispc_cinfo;
> @@ -259,8 +258,7 @@ static void sdi_bridge_enable(struct drm_bridge *bridge,
>  	regulator_disable(sdi->vdds_sdi_reg);
>  }
>  
> -static void sdi_bridge_disable(struct drm_bridge *bridge,
> -			       struct drm_bridge_state *bridge_state)
> +static void sdi_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
>  
> @@ -278,8 +276,8 @@ static const struct drm_bridge_funcs sdi_bridge_funcs = {
>  	.mode_valid = sdi_bridge_mode_valid,
>  	.mode_fixup = sdi_bridge_mode_fixup,
>  	.mode_set = sdi_bridge_mode_set,
> -	.atomic_enable = sdi_bridge_enable,
> -	.atomic_disable = sdi_bridge_disable,
> +	.enable = sdi_bridge_enable,
> +	.disable = sdi_bridge_disable,
>  };
>  
>  static void sdi_bridge_init(struct sdi_device *sdi)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
