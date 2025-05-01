Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222DEAA5991
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 04:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC5F10E812;
	Thu,  1 May 2025 02:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Vc5sHvH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2763010E08D;
 Thu,  1 May 2025 02:11:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UH8Z8i032428;
 Thu, 1 May 2025 02:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JiZQUqeanaN5clXQ+wER3ee28qDCHJOcqmU6LGoCEkU=; b=Vc5sHvH4LmvV92m+
 W7WSYJnHy0k8bPKs7u2jGrlnUeohbMKn6BP66rpGLArBmdXo9YPCmqUu8jPzhH2y
 EasKwHaghZZCPaTdr5iF7AO7Ig7V+sOc5MOX5pXN1Oinb/J3fL4RlgOJHeby5rGO
 Udlk/jdcFkLmI2STa+dqSIYyE/+KoTv3pkdcWw/J1lPRI3VDMLxuiDAAVo8YYS4T
 IgrQAV3jY2ZvOxl8zg23t31nsh7pSLjuTokfHP8IK8PjB3AKK7Xew15ladBn61hs
 ccq/3XEcA2qwddtS0TvNUzNAFIwH5tneP2LWi8SdRLqYRqCM53X8CbZZTzjACYLF
 pILWLA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2c536-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 May 2025 02:10:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5412AuNr009978
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 May 2025 02:10:56 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 19:10:55 -0700
Message-ID: <6495e342-512f-469f-9d66-bb9f47fb551d@quicinc.com>
Date: Wed, 30 Apr 2025 19:10:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Dmitry Baryshkov
 <lumag@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <laurentiu.tudor1@dell.com>, <abel.vesa@linaro.org>,
 <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-5-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250430001330.265970-5-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XtVw7kzpMyYCKLrA4hjIdtZ-rvW-Bgjx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDAxNiBTYWx0ZWRfX1YCOGXV0e5iu
 PMhz7Z7D0qFrubN4m+pB6p9xkK8QpDXXf/dkTiGeEkfFe64yi1hCes2qvuhdC1R9iPPn8wU6b8y
 /wQzP49RhGKXnSlEf07NWAxXGJe/rsQUq5WhF+h3v2etq8lNLkvQyXVcW3T9vW5J33LKi/ksb39
 qlY6LqcNLTmERDnaXcicyoE3ihqAo9GDfkXfUnlkU1w3qaqv+wyxHz/ErBOXhzYoZWD5ugljn+Y
 zzDWPVEHe2QN3Q5TtXD9C6pRDrEwh9Oq7t+LFM3N+R4jo1oxXs+SfTbWxq51k/9AzhGCLUhq4yI
 uNGM0Ts2Ezor/74/gM5Osfc4teJJqt5nJmOnfJf6wvbhG1jHwuC6eKTLIU0sy7go10NkXPLuxCV
 n3IERY0QrL07WbR+ftRTjJfQEtT63TDsk7lTJE6gOvhjuh5C0+xN0fOlEeiD5NC+591DZhD6
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6812d831 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=DQ8eSEry4n17BMDTzUUA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XtVw7kzpMyYCKLrA4hjIdtZ-rvW-Bgjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010016
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



On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> DisplayPort requires per-segment link training when LTTPR are switched
> to non-transparent mode, starting with LTTPR closest to the source.
> Only when each segment is trained individually, source can link train
> to sink.
> 
> Implement per-segment link traning when LTTPR(s) are detected, to
> support external docking stations. On higher level, changes are:
> 
> * Pass phy being trained down to all required helpers
> * Run CR, EQ link training per phy
> * Set voltage swing, pre-emphasis levels per phy
> 
> This ensures successful link training both when connected directly to
> the monitor (single LTTPR onboard most X1E laptops) and via the docking
> station (at least two LTTPRs).
> 
> Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> 

Thanks for the patch to improve and add support for link training in 
non-transparent mode.

Some questions below as the DP 2.1a spec documentation is not very clear 
about segmented link training as you noted in the cover letter, so I am 
also only reviewing i915 as reference here.


> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
>   1 file changed, 89 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index d8633a596f8d..35b28c2fcd64 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1034,10 +1034,12 @@ static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
>   	return 0;
>   }
>   
> -static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
> +static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private *ctrl,
> +					enum drm_dp_phy dp_phy)
>   {
>   	struct msm_dp_link *link = ctrl->link;
> -	int ret = 0, lane, lane_cnt;
> +	int lane, lane_cnt, reg;
> +	int ret = 0;
>   	u8 buf[4];
>   	u32 max_level_reached = 0;
>   	u32 voltage_swing_level = link->phy_params.v_level;
> @@ -1075,8 +1077,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
>   
>   	drm_dbg_dp(ctrl->drm_dev, "sink: p|v=0x%x\n",
>   			voltage_swing_level | pre_emphasis_level);
> -	ret = drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
> -					buf, lane_cnt);
> +
> +	if (dp_phy == DP_PHY_DPRX)
> +		reg = DP_TRAINING_LANE0_SET;
> +	else
> +		reg = DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
> +
> +	ret = drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);

For the max voltage and swing levels, it seems like we need to use the 
source (DPTX) or the DPRX immediately upstream of the RX we are trying 
to train. i915 achieves it with below:

         /*
          * Get voltage_max from the DPTX_PHY (source or LTTPR) upstream 
from
          * the DPRX_PHY we train.
          */
         if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
                 voltage_max = intel_dp->voltage_max(intel_dp, crtc_state);
         else
                 voltage_max = intel_dp_lttpr_voltage_max(intel_dp, 
dp_phy + 1);


But I do not see (unless I missed) how this patch takes care of this 
requirement.

Same holds true for preemph too

         if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
                 preemph_max = intel_dp->preemph_max(intel_dp);
         else
                 preemph_max = intel_dp_lttpr_preemph_max(intel_dp, 
dp_phy + 1);

         drm_WARN_ON_ONCE(display->drm,
                          preemph_max != DP_TRAIN_PRE_EMPH_LEVEL_2 &&
                          preemph_max != DP_TRAIN_PRE_EMPH_LEVEL_3);


>   	if (ret == lane_cnt)
>   		ret = 0;
>   
> @@ -1084,9 +1091,10 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
>   }
>   
>   static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
> -		u8 pattern)
> +		u8 pattern, enum drm_dp_phy dp_phy)
>   {
>   	u8 buf;
> +	int reg;
>   	int ret = 0;
>   
>   	drm_dbg_dp(ctrl->drm_dev, "sink: pattern=%x\n", pattern);
> @@ -1096,7 +1104,12 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
>   	if (pattern && pattern != DP_TRAINING_PATTERN_4)
>   		buf |= DP_LINK_SCRAMBLING_DISABLE;
>   
> -	ret = drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf);
> +	if (dp_phy == DP_PHY_DPRX)
> +		reg = DP_TRAINING_PATTERN_SET;
> +	else
> +		reg = DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);
> +
> +	ret = drm_dp_dpcd_writeb(ctrl->aux, reg, buf);
>   	return ret == 1;
>   }
>   
> @@ -1115,12 +1128,16 @@ static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
>   }
>   
>   static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
> -			int *training_step)
> +			int *training_step, enum drm_dp_phy dp_phy)
>   {
> +	int delay_us;
>   	int tries, old_v_level, ret = 0;
>   	u8 link_status[DP_LINK_STATUS_SIZE];
>   	int const maximum_retries = 4;
>   
> +	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
> +						    ctrl->panel->dpcd, dp_phy, false);
> +
>   	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>   
>   	*training_step = DP_TRAINING_1;
> @@ -1129,18 +1146,19 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
>   	if (ret)
>   		return ret;
>   	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
> -		DP_LINK_SCRAMBLING_DISABLE);
> +		DP_LINK_SCRAMBLING_DISABLE, dp_phy);
>   
> -	ret = msm_dp_ctrl_update_vx_px(ctrl);
> +	msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> +	ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>   	if (ret)
>   		return ret;
>   
>   	tries = 0;
>   	old_v_level = ctrl->link->phy_params.v_level;
>   	for (tries = 0; tries < maximum_retries; tries++) {
> -		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
> +		fsleep(delay_us);
>   
> -		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
> +		ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
>   		if (ret)
>   			return ret;
>   
> @@ -1161,7 +1179,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
>   		}
>   
>   		msm_dp_link_adjust_levels(ctrl->link, link_status);
> -		ret = msm_dp_ctrl_update_vx_px(ctrl);
> +		ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>   		if (ret)
>   			return ret;
>   	}
> @@ -1213,21 +1231,31 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
>   	return 0;
>   }
>   
> -static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
> +					       enum drm_dp_phy dp_phy)
>   {
> -	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
> -	drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
> +	int delay_us;
> +
> +	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, dp_phy);
> +
> +	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
> +						ctrl->panel->dpcd, dp_phy, false);
> +	fsleep(delay_us);
>   }
>   
>   static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> -			int *training_step)
> +			int *training_step, enum drm_dp_phy dp_phy)
>   {
> +	int delay_us;
>   	int tries = 0, ret = 0;
>   	u8 pattern;
>   	u32 state_ctrl_bit;
>   	int const maximum_retries = 5;
>   	u8 link_status[DP_LINK_STATUS_SIZE];
>   
> +	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
> +						ctrl->panel->dpcd, dp_phy, false);
> +
>   	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>   
>   	*training_step = DP_TRAINING_2;
> @@ -1247,12 +1275,12 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>   	if (ret)
>   		return ret;
>   
> -	msm_dp_ctrl_train_pattern_set(ctrl, pattern);
> +	msm_dp_ctrl_train_pattern_set(ctrl, pattern, dp_phy);
>   
>   	for (tries = 0; tries <= maximum_retries; tries++) {
> -		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
> +		fsleep(delay_us);
>   
> -		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
> +		ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
>   		if (ret)
>   			return ret;
>   
> @@ -1262,7 +1290,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>   		}
>   
>   		msm_dp_link_adjust_levels(ctrl->link, link_status);
> -		ret = msm_dp_ctrl_update_vx_px(ctrl);
> +		ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>   		if (ret)
>   			return ret;
>   
> @@ -1271,9 +1299,32 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>   	return -ETIMEDOUT;
>   }
>   
> +static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
> +				      int *training_step, enum drm_dp_phy dp_phy)
> +{
> +	int ret;
> +
> +	ret = msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
> +	if (ret) {
> +		DRM_ERROR("link training #1 on phy %d failed. ret=%d\n", dp_phy, ret);
> +		return ret;
> +	}
> +	drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\n", dp_phy);
> +
> +	ret = msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
> +	if (ret) {
> +		DRM_ERROR("link training #2 on phy %d failed. ret=%d\n", dp_phy, ret);
> +		return ret;
> +	}
> +	drm_dbg_dp(ctrl->drm_dev, "link training #2 on phy %d successful\n", dp_phy);
> +
> +	return 0;
> +}
> +
>   static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>   			int *training_step)
>   {
> +	int i;
>   	int ret = 0;
>   	const u8 *dpcd = ctrl->panel->dpcd;
>   	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
> @@ -1286,8 +1337,6 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>   	link_info.rate = ctrl->link->link_params.rate;
>   	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
>   
> -	msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> -
>   	msm_dp_aux_link_configure(ctrl->aux, &link_info);
>   
>   	if (drm_dp_max_downspread(dpcd))
> @@ -1302,24 +1351,27 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>   				&assr, 1);
>   	}
>   
> -	ret = msm_dp_ctrl_link_train_1(ctrl, training_step);
> +	for (i = ctrl->link->lttpr_count - 1; i >= 0; i--) {
> +		enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
> +
> +		ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
> +		msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
> +
> +		if (ret)
> +			break;
> +	}
> +
>   	if (ret) {
> -		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
> +		DRM_ERROR("link training of LTTPR(s) failed. ret=%d\n", ret);
>   		goto end;
>   	}
>   
> -	/* print success info as this is a result of user initiated action */
> -	drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
> -
> -	ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
> +	ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
>   	if (ret) {
> -		DRM_ERROR("link training #2 failed. ret=%d\n", ret);
> +		DRM_ERROR("link training on sink failed. ret=%d\n", ret);
>   		goto end;
>   	}
>   
> -	/* print success info as this is a result of user initiated action */
> -	drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
> -
>   end:
>   	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>   
> @@ -1636,7 +1688,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>   	if (ret)
>   		goto end;
>   
> -	msm_dp_ctrl_clear_training_pattern(ctrl);
> +	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>   
>   	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
>   
> @@ -1660,7 +1712,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>   		return false;
>   	}
>   	msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
> -	msm_dp_ctrl_update_vx_px(ctrl);
> +	msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
>   	msm_dp_link_send_test_response(ctrl->link);
>   
>   	pattern_sent = msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
> @@ -1902,7 +1954,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>   			}
>   
>   			/* stop link training before start re training  */
> -			msm_dp_ctrl_clear_training_pattern(ctrl);
> +			msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>   		}
>   
>   		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
> @@ -1926,7 +1978,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>   		 * link training failed
>   		 * end txing train pattern here
>   		 */
> -		msm_dp_ctrl_clear_training_pattern(ctrl);
> +		msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>   
>   		msm_dp_ctrl_deinitialize_mainlink(ctrl);
>   		rc = -ECONNRESET;
> @@ -1997,7 +2049,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>   		msm_dp_ctrl_link_retrain(ctrl);
>   
>   	/* stop txing train pattern to end link training */
> -	msm_dp_ctrl_clear_training_pattern(ctrl);
> +	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>   
>   	/*
>   	 * Set up transfer unit values and set controller state to send

