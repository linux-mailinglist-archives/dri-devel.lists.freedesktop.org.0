Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48DE4B7432
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 18:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A9410E48B;
	Tue, 15 Feb 2022 17:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC39F10E48B;
 Tue, 15 Feb 2022 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644947512; x=1676483512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jLQOW8DUgKF2Zl6E8/Q1QnMSdZe27nZ+nRDpg9HHR90=;
 b=Z4n3riP9yEs39y9H8A01rO0Y92i4AZSWPRDIFOaKppNDZK+gNkV7gS0m
 kTuH4zn/bCpUchfBkvCvJ3ViijjV+nAGqHgazlVgbP/MddmeLtddg/v0N
 rz+hphdETKynDzYpCcmoGdUGHtHf3e5F9rLBsURmPR4tyuj/QjNTAfjPc I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Feb 2022 09:51:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 09:51:50 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 09:51:50 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 09:51:47 -0800
Message-ID: <ddd2d3b9-2bbe-1255-a3b9-3f5a5aaae514@quicinc.com>
Date: Tue, 15 Feb 2022 09:51:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 8/8] drm/msm/dpu: simplify intf allocation code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-9-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220215141643.3444941-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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



On 2/15/2022 6:16 AM, Dmitry Baryshkov wrote:
> Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
> which intf type we mean, pass INTF_DSI/INTF_DP directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 26 +++++++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  5 ++--
>   3 files changed, 13 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index fa1dc088a672..597d40f78d38 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -490,7 +490,7 @@ void dpu_encoder_helper_split_config(
>   	hw_mdptop = phys_enc->hw_mdptop;
>   	disp_info = &dpu_enc->disp_info;
>   
> -	if (disp_info->intf_type != DRM_MODE_ENCODER_DSI)
> +	if (disp_info->intf_type != INTF_DSI)
>   		return;
>   
>   	/**
> @@ -552,7 +552,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	else
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> +	if (dpu_enc->disp_info.intf_type == INTF_DSI) {
>   		if (dpu_kms->catalog->dspp &&
>   			(dpu_kms->catalog->dspp_count >= topology.num_lm))
>   			topology.num_dspp = topology.num_lm;
> @@ -1074,7 +1074,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>   	}
>   
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
> +	if (dpu_enc->disp_info.intf_type == INTF_DP &&
>   		dpu_enc->cur_master->hw_mdptop &&
>   		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
>   		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
> @@ -1082,7 +1082,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>   
>   	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
> +	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
>   			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
>   		unsigned bpc = dpu_enc->connector->display_info.bpc;
>   		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> @@ -1949,7 +1949,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   {
>   	int ret = 0;
>   	int i = 0;
> -	enum dpu_intf_type intf_type = INTF_NONE;
>   	struct dpu_enc_phys_init_params phys_params;
>   
>   	if (!dpu_enc) {
> @@ -1965,15 +1964,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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
> @@ -2005,11 +1995,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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
> @@ -2092,7 +2082,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   	timer_setup(&dpu_enc->frame_done_timer,
>   			dpu_encoder_frame_done_timeout, 0);
>   
> -	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
> +	if (disp_info->intf_type == INTF_DSI)
>   		timer_setup(&dpu_enc->vsync_event_timer,
>   				dpu_encoder_vsync_event_handler,
>   				0);
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
> index 5f0dc44119c9..bca4f05a5782 100644
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
> @@ -630,7 +630,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>   		info.num_of_h_tiles = 1;
>   		info.h_tile_instance[0] = i;
>   		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> -		info.intf_type = encoder->encoder_type;
> +		/* FIXME: HW catalog treats both DP and eDP interfaces as INTF_DP */

I thought we discussed an approach to address this FIXME.
https://patchwork.freedesktop.org/patch/473871/?series=99651&rev=2

Without addressing that, there is really no need for this change because 
the only confusion between DRM_MODE_ENCODER_*** mapping to intf_type 
mapping comes for eDP and DP as they use the same DRM_MODE_ENCODER_TMDS.

> +		info.intf_type = INTF_DP;
>   		rc = dpu_encoder_setup(dev, encoder, &info);
>   		if (rc) {
>   			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
