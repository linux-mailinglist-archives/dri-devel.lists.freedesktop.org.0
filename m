Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0AB647998
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 00:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D7C10E204;
	Thu,  8 Dec 2022 23:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC5310E202;
 Thu,  8 Dec 2022 23:15:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B8MnQrO029925; Thu, 8 Dec 2022 23:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vW16L55v2jGCQrFnVtwJ/siBe0tb2r/av+3ND4ftSyc=;
 b=ZXkkWtwLPmawqgfp63J6w3VDwpLJwZ2TFmi6Z2CdaFYTIBOQK16aUktZA/z6365KzNS/
 2zPGqxO+6SCea8sWOKOEyZ/kEtKCN3zXcD+YwE9RZBLWnbOL34gBOG7LhCAdTvJhpsAo
 HP9+0FufDL9qpeLuDCmmo7JryenEAtiuK8Lg54ALMyXTmi9Mm/ItkteZGXuod+G+zZci
 C2+hIdNt568gYpemoySZbbzIhqTnSYzVxWSn44DJdh04UhwnY6m6WyedULvD99deyk/o
 BzC+H/OwZWxfbQiWnT9zpcILYNUgB4T846YOW8VdwbmFJz483sfDgBkXqU2pQKzJOE2u KQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mbbfmaenc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 23:14:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B8NErWm027097
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Dec 2022 23:14:53 GMT
Received: from [10.110.56.119] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 8 Dec 2022
 15:14:52 -0800
Message-ID: <b16ca5b1-7f4a-17ef-8cd1-f2b059a92624@quicinc.com>
Date: Thu, 8 Dec 2022 15:14:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 08/12] drm/msm/dp: Rely on hpd_enable/disable callbacks
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-9-quic_bjorande@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20221207220012.16529-9-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Hlzz7wGY3zEP1mL_DXXn-LY10vJpUFeK
X-Proofpoint-ORIG-GUID: Hlzz7wGY3zEP1mL_DXXn-LY10vJpUFeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_12,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080192
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Johan
 Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/7/2022 2:00 PM, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> The DisplayPort controller's internal HPD interrupt handling is used for
> cases where the HPD signal is connected to a GPIO which is pinmuxed into
> the DisplayPort controller. In other configurations the HPD notification
> might be delivered by the DRM framework from an associated bridge.
>
> This difference is not appropriately represented by the "is_edp"
> boolean, but is properly represented by the frameworks invocation of the
> hpd_enable() and hpd_disable() callbacks. Switch the current condition
> to rely on these callbacks instead.
>
> This ensures appropriate handling of the three cases; no bridge
> connected, a bridge without DRM_BRIDGE_OP_HPD and a bridge with
> DRM_BRIDGE_OP_HPD.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>
> Changes since v4:
> - Reordered the hpd_enable/disable patch earlier
> - Squashed in internal_hpd conditional changes into the same patch
>
>   drivers/gpu/drm/msm/dp/dp_display.c | 40 +++++++++++++++++++++--------
>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>   drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>   4 files changed, 35 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 666b45c8ab80..095adf528e43 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -610,8 +610,10 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>   	}
>   
>   	/* enable HDP irq_hpd/replug interrupt */
> -	dp_catalog_hpd_config_intr(dp->catalog,
> -		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
> +	if (dp->dp_display.internal_hpd)
> +		dp_catalog_hpd_config_intr(dp->catalog,
> +					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
> +					   true);
>   
>   	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>   			dp->dp_display.connector_type, state);
> @@ -651,8 +653,10 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   			dp->dp_display.connector_type, state);
>   
>   	/* disable irq_hpd/replug interrupts */
> -	dp_catalog_hpd_config_intr(dp->catalog,
> -		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, false);
> +	if (dp->dp_display.internal_hpd)
> +		dp_catalog_hpd_config_intr(dp->catalog,
> +					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
> +					   false);
>   
>   	/* unplugged, no more irq_hpd handle */
>   	dp_del_event(dp, EV_IRQ_HPD_INT);
> @@ -678,7 +682,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   	}
>   
>   	/* disable HPD plug interrupts */
> -	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
> +	if (dp->dp_display.internal_hpd)
> +		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
>   
>   	/*
>   	 * We don't need separate work for disconnect as
> @@ -696,7 +701,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   	dp_display_handle_plugged_change(&dp->dp_display, false);
>   
>   	/* enable HDP plug interrupt to prepare for next plugin */
> -	if (!dp->dp_display.is_edp)
> +	if (dp->dp_display.internal_hpd)
>   		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
>   
>   	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
> @@ -1081,8 +1086,8 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
>   	dp_display_host_init(dp);
>   	dp_catalog_ctrl_hpd_config(dp->catalog);
>   
> -	/* Enable plug and unplug interrupts only for external DisplayPort */
> -	if (!dp->dp_display.is_edp)
> +	/* Enable plug and unplug interrupts only if requested */
> +	if (dp->dp_display.internal_hpd)
>   		dp_catalog_hpd_config_intr(dp->catalog,
>   				DP_DP_HPD_PLUG_INT_MASK |
>   				DP_DP_HPD_UNPLUG_INT_MASK,
> @@ -1374,8 +1379,7 @@ static int dp_pm_resume(struct device *dev)
>   
>   	dp_catalog_ctrl_hpd_config(dp->catalog);
>   
> -
> -	if (!dp->dp_display.is_edp)
> +	if (dp->dp_display.internal_hpd)
>   		dp_catalog_hpd_config_intr(dp->catalog,
>   				DP_DP_HPD_PLUG_INT_MASK |
>   				DP_DP_HPD_UNPLUG_INT_MASK,
> @@ -1772,3 +1776,19 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   	dp_display->dp_mode.h_active_low =
>   		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>   }
> +
> +void dp_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +	dp_display->internal_hpd = true;
> +}
> +
> +void dp_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +	dp_display->internal_hpd = false;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index dcedf021f7fe..371337d0fae2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -21,6 +21,7 @@ struct msm_dp {
>   	bool power_on;
>   	unsigned int connector_type;
>   	bool is_edp;
> +	bool internal_hpd;
>   
>   	hdmi_codec_plugged_cb plugged_cb;
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 6db82f9b03af..9d03b6ee3c41 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -102,6 +102,8 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
>   	.get_modes    = dp_bridge_get_modes,
>   	.detect       = dp_bridge_detect,
>   	.atomic_check = dp_bridge_atomic_check,
> +	.hpd_enable   = dp_bridge_hpd_enable,
> +	.hpd_disable  = dp_bridge_hpd_disable,
>   };
>   
>   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 82035dbb0578..1f871b555006 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>   void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   			const struct drm_display_mode *mode,
>   			const struct drm_display_mode *adjusted_mode);
> +void dp_bridge_hpd_enable(struct drm_bridge *bridge);
> +void dp_bridge_hpd_disable(struct drm_bridge *bridge);
>   
>   #endif /* _DP_DRM_H_ */
