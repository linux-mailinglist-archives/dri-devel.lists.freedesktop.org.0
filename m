Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A34A70F9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 13:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734A110E4CC;
	Wed,  2 Feb 2022 12:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB05D10E4A7;
 Wed,  2 Feb 2022 12:43:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1CDF2F3;
 Wed,  2 Feb 2022 13:43:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1643805786;
 bh=+WI37cf75CMeTGqF1Etn3HqpDOS7IELga46qsR35ox0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ly/AdmqD2TrLlp//8lTD8BPHPgO3c+C8b4G32Vy0L6+uk2xcfe5p0+4IhSis+9GYg
 Ve65LnFpHjdQbvZmeaDGTl+BAFVHNASw/y97do469RZZ6kWbcd9MPVwbwQgUdf869u
 G8Vw71ZWv/Msg/wJzh8TY84EH5DeSWhK4nxpMk/E=
Date: Wed, 2 Feb 2022 14:42:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kandpal Suraj <suraj.kandpal@intel.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Message-ID: <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220202085429.22261-6-suraj.kandpal@intel.com>
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
Cc: carsten.haitzler@arm.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kandpal,

Thank you for the patch.

On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
> Changing rcar_du driver to accomadate the change of
> drm_writeback_connector.base and drm_writeback_connector.encoder
> to a pointer the reason for which is explained in the
> Patch(drm: add writeback pointers to drm_connector).
> 
> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 66e8839db708..68f387a04502 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
>  	const char *const *sources;
>  	unsigned int sources_count;
>  
> +	struct drm_connector connector;
> +	struct drm_encoder encoder;

Those fields are, at best, poorly named. Furthermore, there's no need in
this driver or in other drivers using drm_writeback_connector to create
an encoder or connector manually. Let's not polute all drivers because
i915 doesn't have its abstractions right.

Nack.

>  	struct drm_writeback_connector writeback;
>  };
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> index c79d1259e49b..5b1e83380c47 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> @@ -200,8 +200,10 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  {
>  	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>  
> -	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> -	drm_connector_helper_add(&wb_conn->base,
> +	wb_conn->base = &rcrtc->connector;
> +	wb_conn->encoder = &rcrtc->encoder;
> +	wb_conn->encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> +	drm_connector_helper_add(wb_conn->base,
>  				 &rcar_du_wb_conn_helper_funcs);
>  
>  	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> @@ -220,7 +222,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
>  	struct drm_framebuffer *fb;
>  	unsigned int i;
>  
> -	state = rcrtc->writeback.base.state;
> +	state = rcrtc->writeback.base->state;
>  	if (!state || !state->writeback_job)
>  		return;
>  

-- 
Regards,

Laurent Pinchart
