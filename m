Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E544EFD3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 23:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908296E0EE;
	Fri, 12 Nov 2021 22:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB186E0BC;
 Fri, 12 Nov 2021 22:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636757757; x=1668293757;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VpT/Mp4nbzITBrPz3FNp/OzqrQCtyKbHpWtYONVzT2U=;
 b=nb68f/82qtX3jOUmVgOgH0W65Lkg/y/rqJb7RZ51pCHtbdZLYlRbid7+
 nIEWeTMvWudfMiwSgzyNaJz7CkrelJs5qsOOpOdeWkLR4yfX2ZuWrAsVV
 NZInTIz4poGzEMtJB14OBT+OEhG7ajv9z13XkdSpsdsNnoOvxgPcwkI7X o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 12 Nov 2021 14:55:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 14:55:55 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 12 Nov 2021 14:55:55 -0800
Received: from [10.110.71.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 12 Nov
 2021 14:55:54 -0800
Message-ID: <f235a5cc-8a1c-8539-26e8-9db49ce2da15@quicinc.com>
Date: Fri, 12 Nov 2021 14:55:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] drm/msm/dp: employ bridge mechanism for display enable
 and disable
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1636147332-11797-1-git-send-email-quic_khsieh@quicinc.com>
 <YYashV3N/lJmn+uW@yoga>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <YYashV3N/lJmn+uW@yoga>
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
Cc: quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/6/2021 9:25 AM, Bjorn Andersson wrote:
> On Fri 05 Nov 16:22 CDT 2021, Kuogee Hsieh wrote:
>
>> Currently the msm_dp_*** functions implement the same sequence which would
>> happen when drm_bridge is used. hence get rid of this intermediate layer
>> and align with the drm_bridge usage to avoid customized implementation.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>
>> Changes in v2:
>> -- revise commit text
>> -- rename dp_bridge to msm_dp_bridge
>> -- delete empty functions
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 -------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++
>>   drivers/gpu/drm/msm/dp/dp_display.c         | 18 +++---
>>   drivers/gpu/drm/msm/dp/dp_display.h         |  1 +
>>   drivers/gpu/drm/msm/dp/dp_drm.c             | 91 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_drv.h               | 16 +++--
>>   6 files changed, 120 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 31050aa..c4e08c4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1003,9 +1003,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>>   
>>   	trace_dpu_enc_mode_set(DRMID(drm_enc));
>>   
>> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
>> -		msm_dp_display_mode_set(dpu_enc->dp, drm_enc, mode, adj_mode);
>> -
>>   	list_for_each_entry(conn_iter, connector_list, head)
>>   		if (conn_iter->encoder == drm_enc)
>>   			conn = conn_iter;
>> @@ -1181,14 +1178,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>>   
>>   	_dpu_encoder_virt_enable_helper(drm_enc);
>>   
>> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
>> -		ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
>> -		if (ret) {
>> -			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
>> -				ret);
>> -			goto out;
>> -		}
>> -	}
>>   	dpu_enc->enabled = true;
>>   
>>   out:
>> @@ -1214,11 +1203,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>>   	/* wait for idle */
>>   	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
>>   
>> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
>> -		if (msm_dp_display_pre_disable(dpu_enc->dp, drm_enc))
>> -			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
>> -	}
>> -
>>   	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
>>   
>>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> @@ -1243,11 +1227,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>>   
>>   	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
>>   
>> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
>> -		if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
>> -			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
>> -	}
>> -
>>   	mutex_unlock(&dpu_enc->enc_lock);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 27d98b5..d16337f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -557,6 +557,13 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>   				  encoder->base.id, rc);
>>   			return rc;
>>   		}
>> +
>> +		rc = msm_dp_bridge_init(priv->dp[i], dev, encoder);
>> +		if (rc) {
>> +			DPU_ERROR("failed to setup DPU bridge %d: rc:%d\n",
>> +				encoder->base.id, rc);
>> +			return rc;
>> +		}
>>   	}
>>   
>>   	return rc;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index e41dd40..e9ea6ed 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -569,8 +569,8 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>>   	return 0;
>>   };
>>   
>> -static int dp_display_enable(struct dp_display_private *dp, u32 data);
>> -static int dp_display_disable(struct dp_display_private *dp, u32 data);
>> +static int __dp_display_enable(struct dp_display_private *dp, u32 data);
>> +static int __dp_display_disable(struct dp_display_private *dp, u32 data);
> Can you please help me understand why you're changing the name of these
> functions?
my mistake, will remove this change
>>   
>>   static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>>   {
>> @@ -855,7 +855,7 @@ static int dp_display_prepare(struct msm_dp *dp_display)
>>   	return 0;
>>   }
>>   
>> -static int dp_display_enable(struct dp_display_private *dp, u32 data)
>> +static int __dp_display_enable(struct dp_display_private *dp, u32 data)
>>   {
>>   	int rc = 0;
>>   
>> @@ -898,7 +898,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
>>   	return 0;
>>   }
>>   
>> -static int dp_display_disable(struct dp_display_private *dp, u32 data)
>> +static int __dp_display_disable(struct dp_display_private *dp, u32 data)
>>   {
>>   	struct msm_dp *dp_display = &dp->dp_display;
>>   
>> @@ -1569,12 +1569,12 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>>   	if (state == ST_DISPLAY_OFF)
>>   		dp_display_host_init(dp_display, true);
>>   
>> -	dp_display_enable(dp_display, 0);
>> +	__dp_display_enable(dp_display, 0);
>>   
>>   	rc = dp_display_post_enable(dp);
>>   	if (rc) {
>>   		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
>> -		dp_display_disable(dp_display, 0);
>> +		__dp_display_disable(dp_display, 0);
>>   		dp_display_unprepare(dp);
>>   	}
>>   
>> @@ -1614,7 +1614,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>>   	/* stop sentinel checking */
>>   	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>>   
>> -	dp_display_disable(dp_display, 0);
>> +	__dp_display_disable(dp_display, 0);
>>   
>>   	rc = dp_display_unprepare(dp);
>>   	if (rc)
>> @@ -1633,8 +1633,8 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>>   }
>>   
>>   void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
>> -				struct drm_display_mode *mode,
>> -				struct drm_display_mode *adjusted_mode)
>> +				const struct drm_display_mode *mode,
>> +				const struct drm_display_mode *adjusted_mode)
>>   {
>>   	struct dp_display_private *dp_display;
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 76f45f9..2237e80 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -13,6 +13,7 @@
>>   struct msm_dp {
>>   	struct drm_device *drm_dev;
>>   	struct device *codec_dev;
>> +	struct drm_bridge *bridge;
>>   	struct drm_connector *connector;
>>   	struct drm_encoder *encoder;
>>   	struct drm_panel *drm_panel;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
>> index f33e315..e7bea97 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> @@ -5,12 +5,21 @@
>>   
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_atomic.h>
>> +#include <drm/drm_bridge.h>
>>   #include <drm/drm_crtc.h>
>>   
>>   #include "msm_drv.h"
>>   #include "msm_kms.h"
>>   #include "dp_drm.h"
>>   
>> +
>> +struct msm_dp_bridge {
>> +	struct drm_bridge bridge;
>> +	struct msm_dp *dp_display;
>> +};
> We do you create yet another one of these object?
>
> Can't we just set up the new bridge in msm_dp_modeset_init(), like is
> done in msm_dsi_modeset_init()?

either way should work.

I will try same mechanism as dsi

>> +
>> +#define to_dp_display(x)     container_of((x), struct msm_dp_bridge, bridge)
>> +
>>   struct dp_connector {
>>   	struct drm_connector base;
>>   	struct msm_dp *dp_display;
>> @@ -162,3 +171,85 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>>   
>>   	return connector;
>>   }
>> +
>> +static int dp_bridge_attach(struct drm_bridge *drm_bridge,
>> +				enum drm_bridge_attach_flags flags)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>> +				const struct drm_display_mode *mode,
>> +				const struct drm_display_mode *adjusted_mode)
>> +{
>> +	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
>> +	struct msm_dp *dp_display = dp_bridge->dp_display;
>> +
>> +	msm_dp_display_mode_set(dp_display, drm_bridge->encoder, mode, adjusted_mode);
>> +}
>> +
>> +static void dp_bridge_enable(struct drm_bridge *drm_bridge)
>> +{
>> +	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
>> +	struct msm_dp *dp_display = dp_bridge->dp_display;
>> +
>> +	msm_dp_display_enable(dp_display, drm_bridge->encoder);
>> +}
>> +
>> +static void dp_bridge_disable(struct drm_bridge *drm_bridge)
>> +{
>> +	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
>> +	struct msm_dp *dp_display = dp_bridge->dp_display;
>> +
>> +	msm_dp_display_pre_disable(dp_display, drm_bridge->encoder);
>> +}
>> +
>> +static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
>> +{
>> +	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
>> +	struct msm_dp *dp_display = dp_bridge->dp_display;
>> +
>> +	msm_dp_display_disable(dp_display, drm_bridge->encoder);
>> +}
>> +
>> +static const struct drm_bridge_funcs dp_bridge_ops = {
>> +	.attach       = dp_bridge_attach,
>> +	.mode_fixup   = NULL,
>> +	.pre_enable   = NULL,
>> +	.enable       = dp_bridge_enable,
>> +	.disable      = dp_bridge_disable,
>> +	.post_disable = dp_bridge_post_disable,
>> +	.mode_set     = dp_bridge_mode_set,
>> +};
>> +
>> +int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>> +			struct drm_encoder *encoder)
>> +{
>> +	int rc;
>> +	struct msm_drm_private *priv;
>> +	struct msm_dp_bridge *dp_bridge;
>> +	struct drm_bridge *bridge;
>> +
>> +	dp_bridge = kzalloc(sizeof(*dp_bridge), GFP_KERNEL);
> You're not freeing this pointer, except for the error case below. That
> said, you call this from dpu_kms_hw_init() which is full of other things
> relying on devres.
>
> So I think the appropriate way here is to use devm_kzalloc().
got it, will correct it
>> +	if (!dp_bridge)
>> +		return -ENOMEM;
>> +
>> +	dp_bridge->dp_display = dp_display;
>> +
>> +	bridge = &dp_bridge->bridge;
>> +	bridge->funcs = &dp_bridge_ops;
>> +	bridge->encoder = encoder;
>> +
>> +	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> Sorry, my understanding of the drm_bridge is limited, but how does this
> interact with the panel_bridge that we attach in
> dp_drm_connector_init()?
>
> If we represent the DP instance itself as a drm_bridge, shouldn't that
> be "previous" of the panel_bridge?

I am learning on drm_bridge too.

No sure why attach bridge happen at dp_drm_connector_init() since no 
drm_bridge_funcs populated.

This patch use bridge as pseudo bridge and take advantage of 
drm_bridge_funcs provides call back functions to replace

msm_dp_*** functions called directly from encoder originally.


>> +	if (rc) {
>> +		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
>> +		kfree(dp_bridge);
>> +		return rc;
>> +	}
>> +
>> +	priv = dev->dev_private;
>> +	priv->bridges[priv->num_bridges++] = bridge;
>> +	dp_display->bridge = bridge;
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>> index 4bb797e..9a2092f 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -388,8 +388,10 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
>>   int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
>>   int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
>>   void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
>> -				struct drm_display_mode *mode,
>> -				struct drm_display_mode *adjusted_mode);
>> +				const struct drm_display_mode *mode,
>> +				const struct drm_display_mode *adjusted_mode);
>> +int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>> +			struct drm_encoder *encoder);
>>   void msm_dp_irq_postinstall(struct msm_dp *dp_display);
>>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>>   
>> @@ -426,10 +428,16 @@ static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
>>   }
>>   static inline void msm_dp_display_mode_set(struct msm_dp *dp,
>>   				struct drm_encoder *encoder,
>> -				struct drm_display_mode *mode,
>> -				struct drm_display_mode *adjusted_mode)
>> +				const struct drm_display_mode *mode,
>> +				const struct drm_display_mode *adjusted_mode)
>>   {
>>   }
>> +static inline int msm_dp_bridge_init(struct msm_dp *dp_display,
>> +				struct drm_device *dev,
>> +				struct drm_encoder *encoder)
>> +{
>> +	return -EINVAL;
> Returning an error here means that building without CONFIG_DRM_MSM_DP
> we will propagate an error up and fail the entire DPU initialization.
>
> Perhaps this problem already exists today?
>
> Regards,
> Bjorn
>
>> +}
>>   
>>   static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>>   {
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
