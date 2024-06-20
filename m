Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539E991131D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 22:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C661710E1DC;
	Thu, 20 Jun 2024 20:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="O8o84KHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020E210E190;
 Thu, 20 Jun 2024 20:27:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHBdIP017939;
 Thu, 20 Jun 2024 20:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PPaPB05HLWMKsCPYWmyIbSGuP55gTQawsDAD7m5/uv0=; b=O8o84KHHOK/KG+nU
 YC7mvqPrZn8v/2WEdE6SYBgVJ136n+L83/0SaEoY8SBOnRNyEDgbUwkI4PBCuQMV
 pjGSnQBE7qVMLiBC6BUW0HP834b/H5ZtzNARm+HBElhHpxSPTkob4orTas7Y2GFf
 Dd0/2JPvtZbanH0XUzJNxLgy26pc5ktObqG+lMzgjCLPFeUQFIEgUKB3rzQhlg0U
 ikCI0anVAVArMMEzUqngALbUyUZs14WhCXP2+ekQPO4lRVIDmvlUUk15cA/MRYTK
 FuNsZiOdnYs+7a5ZTtDf9oJMfAHbAD6owFFSz50EHlDpNiLog+JUpNQpnKLBLSe2
 AbKKEg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrm08g10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2024 20:27:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45KKRNSr021753
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2024 20:27:23 GMT
Received: from [10.110.82.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 13:27:17 -0700
Message-ID: <f34c4210-fd59-9d27-0987-3345631c9e35@quicinc.com>
Date: Thu, 20 Jun 2024 13:27:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-5-ab384e6021af@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-5-ab384e6021af@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cneJARBo0b7n6cXXWZNOdwcqOuhQsZay
X-Proofpoint-GUID: cneJARBo0b7n6cXXWZNOdwcqOuhQsZay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406200149
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



On 6/7/2024 6:23 AM, Dmitry Baryshkov wrote:
> The mode_set callback is deprecated, it doesn't get the
> drm_bridge_state, just mode-related argumetns. Turn it into the
> atomic_enable callback as suggested by the documentation.
> 

mode_set is deprecated but atomic_mode_set is not.

I would rather use atomic_mode_set because moving to atomic_enable() 
would be incorrect.

That would be called after encoder's enable and hence changes the 
sequence. That was not the intention of this patch.

NAK.

> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 ++++++++++++++++++++++++++-------
>   1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index d839c71091dc..f259d6268c0f 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -129,12 +129,25 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
>   static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   					      struct drm_bridge_state *old_bridge_state)
>   {
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
>   	struct hdmi_phy *phy = hdmi->phy;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	const struct drm_display_mode *mode;
>   
>   	DBG("power up");
>   
> +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	mode = &crtc_state->adjusted_mode;
> +
> +	hdmi->pixclock = mode->clock * 1000;
> +
>   	if (!hdmi->power_on) {
>   		msm_hdmi_phy_resource_enable(phy);
>   		msm_hdmi_power_on(bridge);
> @@ -177,18 +190,24 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>   	}
>   }
>   
> -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> -		 const struct drm_display_mode *mode,
> -		 const struct drm_display_mode *adjusted_mode)
> +static void msm_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *old_bridge_state)
>   {
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	const struct drm_display_mode *mode;
>   	int hstart, hend, vstart, vend;
>   	uint32_t frame_ctrl;
>   
> -	mode = adjusted_mode;
> -
> -	hdmi->pixclock = mode->clock * 1000;
> +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	mode = &crtc_state->adjusted_mode;
>   
>   	hstart = mode->htotal - mode->hsync_start;
>   	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
> @@ -305,8 +324,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
> +	.atomic_enable = msm_hdmi_bridge_atomic_enable,
>   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> -	.mode_set = msm_hdmi_bridge_mode_set,
>   	.mode_valid = msm_hdmi_bridge_mode_valid,
>   	.edid_read = msm_hdmi_bridge_edid_read,
>   	.detect = msm_hdmi_bridge_detect,
> 
