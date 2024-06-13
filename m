Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F312907AB5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 20:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFC110EB4D;
	Thu, 13 Jun 2024 18:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AE810E5A7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 18:14:10 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id ACE683EBA4;
 Thu, 13 Jun 2024 20:14:08 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:14:07 +0200
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
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: support setting the TE source
Message-ID: <cu3iicchkdmpkm6fttqv42hw2zfa2bs4wk6xsbeu5m4poav4s5@l7kbg43sfzrb>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-7-67a0116b5366@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-7-67a0116b5366@linaro.org>
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

On 2024-06-13 20:05:10, Dmitry Baryshkov wrote:
> Make the DPU driver use the TE source specified in the DT. If none is
> specified, the driver defaults to the first GPIO (mdp_vsync0).

mdp_vsync_p?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 44 ++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e9991f3756d4..6fcb3cf4a382 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -505,6 +505,44 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>  		dpu_kms_wait_for_commit_done(kms, crtc);
>  }
>  
> +static const char *dpu_vsync_sources[] = {
> +	[DPU_VSYNC_SOURCE_GPIO_0] = "mdp_vsync_p",
> +	[DPU_VSYNC_SOURCE_GPIO_1] = "mdp_vsync_s",
> +	[DPU_VSYNC_SOURCE_GPIO_2] = "mdp_vsync_e",
> +	[DPU_VSYNC_SOURCE_INTF_0] = "mdp_intf0",
> +	[DPU_VSYNC_SOURCE_INTF_1] = "mdp_intf1",
> +	[DPU_VSYNC_SOURCE_INTF_2] = "mdp_intf2",
> +	[DPU_VSYNC_SOURCE_INTF_3] = "mdp_intf3",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_0] = "timer0",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_1] = "timer1",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_2] = "timer2",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_3] = "timer3",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_4] = "timer4",
> +};
> +
> +static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
> +				     struct msm_dsi *dsi)
> +{
> +	const char *te_source = msm_dsi_get_te_source(dsi);

Just checking: if the TE source is different and one has dual-DSI, it must be
set on both controllers?

> +	int i;
> +
> +	if (!te_source) {
> +		info->vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> +		return 0;
> +	}
> +
> +	/* we can not use match_string since dpu_vsync_sources is a sparse array */

Instead of having gaps in the array, you could also store both the vsync_source
and name as the array elements?

> +	for (i = 0; i < ARRAY_SIZE(dpu_vsync_sources); i++) {
> +		if (dpu_vsync_sources[i] &&
> +		    !strcmp(dpu_vsync_sources[i], te_source)) {
> +			info->vsync_source = i;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  				    struct msm_drm_private *priv,
>  				    struct dpu_kms *dpu_kms)
> @@ -543,7 +581,11 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  
>  		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
>  
> -		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> +		rc = dpu_kms_dsi_set_te_source(&info, priv->dsi[i]);
> +		if (rc) {
> +			DPU_ERROR("failed to identify TE source for dsi display\n");
> +			return rc;
> +		}
>  
>  		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
>  		if (IS_ERR(encoder)) {
> 
> -- 
> 2.39.2
> 
