Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF5155E06
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 19:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A57F6EB18;
	Fri,  7 Feb 2020 18:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E746EB18
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 18:26:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017IQJ2p061639;
 Fri, 7 Feb 2020 12:26:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581099979;
 bh=4226ELyBgeYn+zdM+fV36om78NMlXYo486w3Kd/fIVk=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=Ejke32zCPV+cxYjyuO4kJkkVmBqZQRrwrQS4L1YxpKhA+74bruKimNkXEOzGREfkr
 NnS/JsxjMK4aa1tYntPm6JD9Aa1OR3tesdJ1DSDY9l1V6fy0QUy7eQSJZnAqF0msb1
 UvvzYqaazLAdGZrIMtx5hfITo7XGwkgECyC9G6y0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 017IQJua016993
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Feb 2020 12:26:19 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 7 Feb
 2020 12:26:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 7 Feb 2020 12:26:19 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017IQHxM094216;
 Fri, 7 Feb 2020 12:26:17 -0600
Subject: Re: [PATCH] drm/tidss: dispc: Rewrite naive plane positioning code
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
References: <20200207181824.7233-1-jsarha@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <02abcb19-efca-27a1-6aba-220532393a81@ti.com>
Date: Fri, 7 Feb 2020 20:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200207181824.7233-1-jsarha@ti.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2020 20:18, Jyri Sarha wrote:
> The old implementation of placing planes on the CRTC while configuring
> the planes was naive and relied on the order in which the planes were
> configured, enabled, and disabled. The situation where a plane's zpos
> was changed on the fly was completely broken. The usual symptoms of
> this problem was scrambled display and a flood of sync lost errors,
> when a plane was active in two layers at the same time, or a missing
> plane, in case when a layer was accidentally disabled.
> 
> The rewrite takes a more straight forward approach when when HW is
> concerned. The plane positioning registers are in the CRTC (or
> actually OVR) register space and it is more natural to configure them
> in a one go when configuring the CRTC. This is easy since we have
> access to the whole atomic state when updating the CRTC configuration.
> 

While implementing this fix it caught me by surprise that
crtc->state->state (pointer up to full atomic state) is NULL when
crtc_enable() or -flush() is called. So I take the plane-state directly
from the plane->state and just assume that it is pointing to the same
atomic state with the crtc state I am having. I that alraight?

Why is the crtc->state->state NULL? Is it a bug or is there some reason
to it?

Best regards,
Jyri

> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_crtc.c  |  2 +-
>  drivers/gpu/drm/tidss/tidss_dispc.c | 66 ++++++++++++++++++++---------
>  2 files changed, 47 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index 032c31ee2820..367efdebe2f8 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -143,7 +143,7 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
>  	if (WARN_ON(!crtc->state->event))
>  		return;
>  
> -	/* Write vp properties to HW if needed. */
> +	/* Write vp properties and plane positions to HW if needed. */
>  	dispc_vp_setup(tidss->dispc, tcrtc->hw_videoport, crtc->state, false);
>  
>  	WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index eeb160dc047b..cfc230d2a88a 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -20,6 +20,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> @@ -281,11 +282,6 @@ struct dss_vp_data {
>  	u32 *gamma_table;
>  };
>  
> -struct dss_plane_data {
> -	u32 zorder;
> -	u32 hw_videoport;
> -};
> -
>  struct dispc_device {
>  	struct tidss_device *tidss;
>  	struct device *dev;
> @@ -307,8 +303,6 @@ struct dispc_device {
>  
>  	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
>  
> -	struct dss_plane_data plane_data[TIDSS_MAX_PLANES];
> -
>  	u32 *fourccs;
>  	u32 num_fourccs;
>  
> @@ -1301,13 +1295,54 @@ static void dispc_ovr_set_plane(struct dispc_device *dispc,
>  	}
>  }
>  
> -static void dispc_ovr_enable_plane(struct dispc_device *dispc,
> -				   u32 hw_videoport, u32 zpos, bool enable)
> +static void dispc_ovr_enable_layer(struct dispc_device *dispc,
> +				   u32 hw_videoport, u32 layer, bool enable)
>  {
> -	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
> +	if (dispc->feat->subrev == DISPC_K2G)
> +		return;
> +
> +	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
>  			!!enable, 0, 0);
>  }
>  
> +static void dispc_vp_position_planes(struct dispc_device *dispc,
> +				     u32 hw_videoport,
> +				     const struct drm_crtc_state *cstate,
> +				     bool newmodeset)
> +{
> +	struct drm_device *ddev = &dispc->tidss->ddev;
> +	int zpos;
> +
> +	if (!cstate->zpos_changed && !cstate->planes_changed && !newmodeset)
> +		return;
> +
> +	for (zpos = 0; zpos < dispc->feat->num_planes; zpos++) {
> +		struct drm_plane *plane;
> +		bool zpos_taken = false;
> +
> +		drm_for_each_plane_mask(plane, ddev, cstate->plane_mask) {
> +			if (WARN_ON(!plane->state))
> +				continue;
> +
> +			if (plane->state->normalized_zpos == zpos) {
> +				zpos_taken = true;
> +				break;
> +			}
> +		}
> +
> +		if (zpos_taken) {
> +			struct tidss_plane *tplane = to_tidss_plane(plane);
> +			const struct drm_plane_state *pstate = plane->state;
> +
> +			dispc_ovr_set_plane(dispc, tplane->hw_plane_id,
> +					    hw_videoport,
> +					    pstate->crtc_x, pstate->crtc_y,
> +					    zpos);
> +		}
> +		dispc_ovr_enable_layer(dispc, hw_videoport, zpos, zpos_taken);
> +	}
> +}
> +
>  /* CSC */
>  enum csc_ctm {
>  	CSC_RR, CSC_RG, CSC_RB,
> @@ -2070,21 +2105,11 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
>  		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 0,
>  				28, 28);
>  
> -	dispc_ovr_set_plane(dispc, hw_plane, hw_videoport,
> -			    state->crtc_x, state->crtc_y,
> -			    state->normalized_zpos);
> -
> -	dispc->plane_data[hw_plane].zorder = state->normalized_zpos;
> -	dispc->plane_data[hw_plane].hw_videoport = hw_videoport;
> -
>  	return 0;
>  }
>  
>  int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
>  {
> -	dispc_ovr_enable_plane(dispc, dispc->plane_data[hw_plane].hw_videoport,
> -			       dispc->plane_data[hw_plane].zorder, enable);
> -
>  	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 0, 0);
>  
>  	return 0;
> @@ -2566,6 +2591,7 @@ void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
>  {
>  	dispc_vp_set_default_color(dispc, hw_videoport, 0);
>  	dispc_vp_set_color_mgmt(dispc, hw_videoport, state, newmodeset);
> +	dispc_vp_position_planes(dispc, hw_videoport, state, newmodeset);
>  }
>  
>  int dispc_runtime_suspend(struct dispc_device *dispc)
> 


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
