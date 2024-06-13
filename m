Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFC4907B26
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 20:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC6010EB52;
	Thu, 13 Jun 2024 18:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A2B10EB50
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 18:22:03 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E801C3E9D4;
 Thu, 13 Jun 2024 20:22:00 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:21:59 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: rework vsync_source handling
Message-ID: <flxejwpqw75thyeu5ycnlichh37l4ltuied36jjzvgifury7lp@gjjcbohuhfa3>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-5-67a0116b5366@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-5-67a0116b5366@linaro.org>
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

Maybe retitle this to something that more closely resembles "remove unset
is_te_using_watchdog_timer field"?

On 2024-06-13 20:05:08, Dmitry Baryshkov wrote:
> The struct msm_display_info has is_te_using_watchdog_timer field which
> is neither used anywhere nor is flexible enough to specify different

Well, it's "used", but not "set" (to anything other than the zero-initialized
default). s/used/set?

> sources. Replace it with the field specifying the vsync source using
> enum dpu_vsync_source.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Patch itself is fine, just think the title could be clearer:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 ++
>  3 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index bd37a56b4d03..b147f8814a18 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -743,10 +743,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
>  		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
>  
> -		if (disp_info->is_te_using_watchdog_timer)
> -			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
> -		else
> -			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> +		vsync_cfg.vsync_source = disp_info->vsync_source;
>  
>  		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 76be77e30954..cb59bd4436f4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -26,15 +26,14 @@
>   * @h_tile_instance:    Controller instance used per tile. Number of elements is
>   *                      based on num_of_h_tiles
>   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> - * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> - *				 used instead of panel TE in cmd mode panels
> + * @vsync_source:	Source of the TE signal for DSI CMD devices
>   */
>  struct msm_display_info {
>  	enum dpu_intf_type intf_type;
>  	uint32_t num_of_h_tiles;
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>  	bool is_cmd_mode;
> -	bool is_te_using_watchdog_timer;
> +	enum dpu_vsync_source vsync_source;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1955848b1b78..e9991f3756d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -543,6 +543,8 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  
>  		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
>  
> +		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> +
>  		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
>  		if (IS_ERR(encoder)) {
>  			DPU_ERROR("encoder init failed for dsi display\n");
> 
> -- 
> 2.39.2
> 
