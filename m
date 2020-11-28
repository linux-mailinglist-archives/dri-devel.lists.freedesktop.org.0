Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F822C7C3D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5166E3F4;
	Mon, 30 Nov 2020 01:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Sat, 28 Nov 2020 18:01:37 UTC
Received: from fgw21-4.mail.saunalahti.fi (fgw21-4.mail.saunalahti.fi
 [62.142.5.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D0A6E046
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 18:01:37 +0000 (UTC)
Received: from darkstar.musicnaut.iki.fi (85-76-71-224-nat.elisa-mobile.fi
 [85.76.71.224]) by fgw21.mail.saunalahti.fi (Halon) with ESMTP
 id 8113492f-31a1-11eb-9eb8-005056bdd08f;
 Sat, 28 Nov 2020 19:45:30 +0200 (EET)
Date: Sat, 28 Nov 2020 19:45:28 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: sdi: fix bridge enable/disable
Message-ID: <20201128174528.GD551434@darkstar.musicnaut.iki.fi>
References: <20201127085241.848461-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127085241.848461-1-tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

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

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks,

A.

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
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
