Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7E4B315B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 00:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0010310EB93;
	Fri, 11 Feb 2022 23:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3A10EB6C;
 Fri, 11 Feb 2022 23:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644622702; x=1676158702;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NYHcum94pnzfeAdpOTypoVGUm2aYM19cVptnhxCE7nM=;
 b=secCKC9EHNQfH2XnK9MGBCNDwEPMlmMrp4grXU+Tx7kk40Xkpvp+5lBL
 n++3B5WBqvuI0H9bH2wBZI0XvnIyRbvsB2tbC6RLpK+bvb4Bnj9Liqevx
 5IItH8oS5Yyk3eksP1ZiDJjnexXBoaWpVCKiqGoiTInKWsZhBmA27xatq s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Feb 2022 15:38:22 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:38:21 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 15:38:21 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 15:38:19 -0800
Message-ID: <423162c0-797d-51d6-d6f6-7ea14219632c@quicinc.com>
Date: Fri, 11 Feb 2022 15:38:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/7] drm/msm/dpu: simplify intf allocation code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
 <20220203082611.2654810-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220203082611.2654810-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/2022 12:26 AM, Dmitry Baryshkov wrote:
> Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
> which intf type we mean, pass INTF_DSI/INTF_DP directly.
>

Typically, I am only seeing a 1:1 mapping like

DRM_MODE_ENCODER_DSI means DSI
DRM_MODE_ENCODER_VIRTUAL means WB

So I am not seeing any guessing for the encoder.

The only conflict I am seeing is between DP and EDP as both use
DRM_MODE_ENCODER_TMDS and hence this approach will be useful there.

But that has been marked as a "FIXME" below.

I am suggesting an approach to handle that as well below.
Let me know if you agree with that.


> While we are at it, fix the DP audio enablement code which was comparing
> intf_type, DRM_MODE_ENCODER_TMDS (= 2) with
> DRM_MODE_CONNECTOR_DisplayPort (= 10).
> Which would never succeed.

This is a surprising catch for me and left me thinking for a while about 
how DP audio is working with this bug because that piece of code was 
done to program a register which is needed for DP audio.

This bug happened due to difference in the meaning of intf_type between
upstream and downstream.

After checking more, we found that the register in question has been 
deprecated on newer chipsets so I have asked Kuogee to selectively 
program it. Here is the change for that:

https://patchwork.freedesktop.org/patch/473869/

> 

> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 28 +++++++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 +--
>   3 files changed, 13 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db439f9..e8fc029ad607 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -493,7 +493,7 @@ void dpu_encoder_helper_split_config(
>   	hw_mdptop = phys_enc->hw_mdptop;
>   	disp_info = &dpu_enc->disp_info;
>   
> -	if (disp_info->intf_type != DRM_MODE_ENCODER_DSI)
> +	if (disp_info->intf_type != INTF_DSI)
>   		return;
>   
>   	/**
> @@ -555,7 +555,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	else
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> +	if (dpu_enc->disp_info.intf_type == INTF_DSI) {
>   		if (dpu_kms->catalog->dspp &&
>   			(dpu_kms->catalog->dspp_count >= topology.num_lm))
>   			topology.num_dspp = topology.num_lm;
> @@ -1099,7 +1099,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>   	}
>   
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
> +	if (dpu_enc->disp_info.intf_type == INTF_DP &&
>   		dpu_enc->cur_master->hw_mdptop &&
>   		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
>   		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
> @@ -1107,7 +1107,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>   
>   	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
> +	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
>   			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
>   		unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
>   		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> @@ -1981,7 +1981,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   {
>   	int ret = 0;
>   	int i = 0;
> -	enum dpu_intf_type intf_type = INTF_NONE;
>   	struct dpu_enc_phys_init_params phys_params;
>   
>   	if (!dpu_enc) {
> @@ -1997,15 +1996,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   	phys_params.parent_ops = &dpu_encoder_parent_ops;
>   	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
>   
> -	switch (disp_info->intf_type) {
> -	case DRM_MODE_ENCODER_DSI:
> -		intf_type = INTF_DSI;
> -		break;
> -	case DRM_MODE_ENCODER_TMDS:
> -		intf_type = INTF_DP;
> -		break;
> -	}
> -
>   	WARN_ON(disp_info->num_of_h_tiles < 1);
>   
>   	DPU_DEBUG("dsi_info->num_of_h_tiles %d\n", disp_info->num_of_h_tiles);
> @@ -2037,11 +2027,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   				i, controller_id, phys_params.split_role);
>   
>   		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
> -													intf_type,
> -													controller_id);
> +				disp_info->intf_type,
> +				controller_id);
>   		if (phys_params.intf_idx == INTF_MAX) {
>   			DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id %d\n",
> -						  intf_type, controller_id);
> +						  disp_info->intf_type, controller_id);
>   			ret = -EINVAL;
>   		}
>   
> @@ -2124,11 +2114,11 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   	timer_setup(&dpu_enc->frame_done_timer,
>   			dpu_encoder_frame_done_timeout, 0);
>   
> -	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
> +	if (disp_info->intf_type == INTF_DSI)
>   		timer_setup(&dpu_enc->vsync_event_timer,
>   				dpu_encoder_vsync_event_handler,
>   				0);
> -	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> +	else if (disp_info->intf_type == INTF_DP || disp_info->intf_type == INTF_EDP)
>   		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
>   
>   	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index ebe3944355bb..3891bcbbe5a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -36,7 +36,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
>   
>   /**
>    * struct msm_display_info - defines display properties
> - * @intf_type:          DRM_MODE_ENCODER_ type
> + * @intf_type:          INTF_ type
>    * @capabilities:       Bitmask of display flags
>    * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
>    * @h_tile_instance:    Controller instance used per tile. Number of elements is
> @@ -45,7 +45,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
>    *				 used instead of panel TE in cmd mode panels
>    */
>   struct msm_display_info {
> -	int intf_type;
> +	enum dpu_intf_type intf_type;
>   	uint32_t capabilities;
>   	uint32_t num_of_h_tiles;
>   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 47fe11a84a77..f4028be9e2e2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -564,7 +564,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>   		priv->encoders[priv->num_encoders++] = encoder;
>   
>   		memset(&info, 0, sizeof(info));
> -		info.intf_type = encoder->encoder_type;
> +		info.intf_type = INTF_DSI;
>   
>   		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>   		if (rc) {
> @@ -630,7 +630,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>   		info.num_of_h_tiles = 1;
>   		info.h_tile_instance[0] = i;
>   		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> -		info.intf_type = encoder->encoder_type;

You can query the connector type from the DP driver like this:

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
b/drivers/gpu/drm/msm/dp/dp_display.c
index 7cc4d21..0fae0fc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1457,7 +1457,7 @@ void msm_dp_debugfs_init(struct msm_dp 
*dp_display, struct drm_minor *minor)
  }

  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
-                       struct drm_encoder *encoder)
+                       struct drm_encoder *encoder, int **connector_type)
  {
         struct msm_drm_private *priv;
         int ret;
@@ -1498,6 +1498,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, 
struct drm_device *dev,

         priv->bridges[priv->num_bridges++] = dp_display->bridge;

+       *connector_type = dp_display->connector_type;
+
         return 0;
  }

Then you can do something like:

if (connector_type == eDP)
     	info.intf_type = INTF_eDP;
else if (connector_type == DP)
         info.intf_type = INTF_DP;
> +		info.intf_type = INTF_DP; /* FIXME: support eDP too */
>   		rc = dpu_encoder_setup(dev, encoder, &info);
>   		if (rc) {
>   			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
