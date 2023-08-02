Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532DA76D7D0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 21:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14E710E219;
	Wed,  2 Aug 2023 19:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524A810E219
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 19:32:55 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1E87B3F5CF;
 Wed,  2 Aug 2023 21:32:53 +0200 (CEST)
Date: Wed, 2 Aug 2023 21:32:51 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v3 1/4] drm/msm/dpu: Move DPU encoder wide_bus_en setting
Message-ID: <mdmxxxs5atqtunsast542fucmoewpvjjqj7bdhbs2yuzgv52ws@qbrdltjo3734>
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
 <20230802-add-widebus-support-v3-1-2661706be001@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802-add-widebus-support-v3-1-2661706be001@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I find this title very undescriptive, it doesn't really explain from/to
where this move is happening nor why.

On 2023-08-02 11:08:48, Jessica Zhang wrote:
> Move the setting of dpu_enc.wide_bus_en to
> dpu_encoder_virt_atomic_enable() so that it mirrors the setting of
> dpu_enc.dsc.

mirroring "the setting of dpu_enc.dsc" very much sounds like you are
mirroring _its value_, but that is not the case.  You are moving the
initialization (or just setting, because it could also be overwriting?)
to _the same place_ where .dsc is assigned.

I am pretty sure that this has a runtime impact which we discussed
before (hotplug...?) but the commit message omits that.  This is
mandatory.

- Marijn

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index d34e684a4178..3dcd37c48aac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1194,11 +1194,18 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>  	struct dpu_encoder_virt *dpu_enc = NULL;
>  	int ret = 0;
>  	struct drm_display_mode *cur_mode = NULL;
> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +	struct msm_display_info *disp_info;
>  
>  	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	disp_info = &dpu_enc->disp_info;
>  
>  	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>  
> +	if (disp_info->intf_type == INTF_DP)
> +		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> +				priv->dp[disp_info->h_tile_instance[0]]);
> +
>  	mutex_lock(&dpu_enc->enc_lock);
>  	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>  
> @@ -2383,10 +2390,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>  	timer_setup(&dpu_enc->frame_done_timer,
>  			dpu_encoder_frame_done_timeout, 0);
>  
> -	if (disp_info->intf_type == INTF_DP)
> -		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> -				priv->dp[disp_info->h_tile_instance[0]]);
> -
>  	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>  			dpu_encoder_off_work);
>  	dpu_enc->idle_timeout = IDLE_TIMEOUT;
> 
> -- 
> 2.41.0
> 
