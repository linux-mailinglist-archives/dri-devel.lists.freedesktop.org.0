Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C3B203EC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC84B10E3CA;
	Mon, 11 Aug 2025 09:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L0/QhBZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B2110E3B5;
 Mon, 11 Aug 2025 09:40:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C719D4A4;
 Mon, 11 Aug 2025 11:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754905171;
 bh=ErWu5p3IP8zhvqO/d0BfVnobP6PnfSl2P3urZEEN7C4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L0/QhBZig6BVj0w2QIWmeTytqJiK1SPyjyoB4YqyU+RF6rGeN2LgiU0XNUiUO1lpS
 l3Ky8rGXIjasOLQQmXYNA/4VkEzo82ToMNUuQ3GVUDp+f3v30EePnPuBqEX1w2uBCV
 KkJ3svCA4b9L+7RMp+aLydw7CYatNMnwEayTPP+g=
Date: Mon, 11 Aug 2025 12:40:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com,
 jani.nikula@intel.com, dmitry.baryshkov@oss.qualcomm.com,
 harry.wentland@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, abhinav.kumar@linux.dev,
 tzimmermann@suse.de, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 7/8] drm/rcar_du: Adapt vkms writeback to new
 drm_writeback_connector
Message-ID: <20250811094004.GD21313@pendragon.ideasonboard.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-8-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-8-suraj.kandpal@intel.com>
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

On Mon, Aug 11, 2025 at 02:57:06PM +0530, Suraj Kandpal wrote:
> Now that drm_writeback_connector is embedded with the drm_connector
> adapt the rcar-du writeback functionality to this changes. This
> includes changing the drm_writeback_connector to be changed to drm_connector
> within the rcar_du_crtc.
> Some other changes are done which are a result of the all the above
> changes mentioned.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 ++--
>  .../drm/renesas/rcar-du/rcar_du_writeback.c   | 22 +++++++++++--------
>  2 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
> index d0f38a8b3561..457c803d75bc 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
> @@ -72,11 +72,11 @@ struct rcar_du_crtc {
>  	const char *const *sources;
>  	unsigned int sources_count;
>  
> -	struct drm_writeback_connector writeback;
> +	struct drm_connector connector;

You forgot to update the documentation of the structure.

"connector" is a too generic name. I'd keep the existing field name.

>  };
>  
>  #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
> -#define wb_to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, writeback)
> +#define connector_to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, connector)
>  
>  /**
>   * struct rcar_du_crtc_state - Driver-specific CRTC state
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> index 9986a10e8114..95e6810612c2 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> @@ -47,10 +47,12 @@ static int rcar_du_wb_conn_get_modes(struct drm_connector *connector)
>  				    dev->mode_config.max_height);
>  }
>  
> -static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
> +static int rcar_du_wb_prepare_job(struct drm_writeback_connector *wb_connector,
>  				  struct drm_writeback_job *job)
>  {
> -	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
> +	struct drm_connector *connector =
> +		container_of(wb_connector, struct drm_connector, writeback);
> +	struct rcar_du_crtc *rcrtc = connector_to_rcar_crtc(connector);

Modify wb_to_rcar_crtc() instead of changing the code here and below.

>  	struct rcar_du_wb_job *rjob;
>  	int ret;
>  
> @@ -72,10 +74,12 @@ static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
>  	return 0;
>  }
>  
> -static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *connector,
> +static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *wb_connector,
>  				   struct drm_writeback_job *job)
>  {
> -	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
> +	struct drm_connector *connector =
> +		container_of(wb_connector, struct drm_connector, writeback);
> +	struct rcar_du_crtc *rcrtc = connector_to_rcar_crtc(connector);
>  	struct rcar_du_wb_job *rjob = job->priv;
>  
>  	if (!job->fb)
> @@ -199,7 +203,7 @@ static const u32 writeback_formats[] = {
>  int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  			   struct rcar_du_crtc *rcrtc)
>  {
> -	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
> +	struct drm_writeback_connector *wb_conn = &rcrtc->connector.writeback;
>  
>  	struct drm_encoder *encoder;
>  
> @@ -212,7 +216,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  
>  	encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>  
> -	drm_connector_helper_add(&wb_conn->base,
> +	drm_connector_helper_add(&rcrtc->connector,
>  				 &rcar_du_wb_conn_helper_funcs);
>  
>  	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
> @@ -231,7 +235,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
>  	struct drm_framebuffer *fb;
>  	unsigned int i;
>  
> -	state = rcrtc->writeback.base.state;
> +	state = rcrtc->connector.state;
>  	if (!state || !state->writeback_job)
>  		return;
>  
> @@ -246,10 +250,10 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
>  		cfg->mem[i] = sg_dma_address(rjob->sg_tables[i].sgl)
>  			    + fb->offsets[i];
>  
> -	drm_writeback_queue_job(&rcrtc->writeback, state);
> +	drm_writeback_queue_job(&rcrtc->connector.writeback, state);
>  }
>  
>  void rcar_du_writeback_complete(struct rcar_du_crtc *rcrtc)
>  {
> -	drm_writeback_signal_completion(&rcrtc->writeback, 0);
> +	drm_writeback_signal_completion(&rcrtc->connector.writeback, 0);
>  }

-- 
Regards,

Laurent Pinchart
