Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00D789401D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 18:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C0810F2C5;
	Mon,  1 Apr 2024 16:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JW/kPt1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB97510F2C3;
 Mon,  1 Apr 2024 16:25:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 431C395B018486; Mon, 1 Apr 2024 16:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=mYSAqFpPOac0Q6+KwUOlV0t7P9hKlNVa9/d09sClEc4=; b=JW
 /kPt1x2vrEhOsg8D/QDIQYS712C5Zgo+oIOzHq1X/9NBQRmSQ0ZhQWNvxU9CjbHr
 PA3lzHKPaKUH8qk12mifOu4jmX7t7gBQwtwKzsPexHT2fqFins9pmezKVRjDxy+Y
 AP/+ZYSCaaMlUoPxbUAkFXyfoRqWNp2Ojh+fNuNoMajRh/5cnfvTGKCsgM9uZw+a
 NX09d8JiYRJPejO4idQ92LpeX67tgDhSP8Cbg8RSwpUHgnCaDgScKbsQSoMZuy8v
 9JrQ5Ls6rJc8+jWjfdPZeXsdXh+Ee8GyoFtZ9qNafIrACbhCCXDDZIPMov0w0nte
 eWVGYc0mzEVJVyUOF3Jg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7r5713t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Apr 2024 16:25:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431GPe6Y021453
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 1 Apr 2024 16:25:40 GMT
Received: from [10.110.67.196] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 09:25:39 -0700
Message-ID: <1c71d83a-68de-8d6e-9719-29aa17a3db6c@quicinc.com>
Date: Mon, 1 Apr 2024 09:25:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm/dp: allow voltage swing / pre emphasis of 3
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N4n3muH3oe_lu85u4K888MvKk6fhEnxo
X-Proofpoint-ORIG-GUID: N4n3muH3oe_lu85u4K888MvKk6fhEnxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_11,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010115
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


On 2/3/2024 5:47 AM, Dmitry Baryshkov wrote:
> Both dp_link_adjust_levels() and dp_ctrl_update_vx_px() limit swing and
> pre-emphasis to 2, while the real maximum value for the sum of the
> voltage swing and pre-emphasis is 3. Fix the DP code to remove this
> limitation.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c |  6 +++---
>   drivers/gpu/drm/msm/dp/dp_link.c | 22 +++++++++++-----------
>   drivers/gpu/drm/msm/dp/dp_link.h | 14 +-------------
>   3 files changed, 15 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 77a8d9366ed7..26241970019f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1024,14 +1024,14 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
>   	if (ret)
>   		return ret;
>   
> -	if (voltage_swing_level >= DP_TRAIN_VOLTAGE_SWING_MAX) {
> +	if (voltage_swing_level >= DP_TRAIN_LEVEL_MAX) {
>   		drm_dbg_dp(ctrl->drm_dev,
>   				"max. voltage swing level reached %d\n",
>   				voltage_swing_level);
>   		max_level_reached |= DP_TRAIN_MAX_SWING_REACHED;
>   	}
>   
> -	if (pre_emphasis_level >= DP_TRAIN_PRE_EMPHASIS_MAX) {
> +	if (pre_emphasis_level >= DP_TRAIN_LEVEL_MAX) {
>   		drm_dbg_dp(ctrl->drm_dev,
>   				"max. pre-emphasis level reached %d\n",
>   				pre_emphasis_level);
> @@ -1122,7 +1122,7 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
>   		}
>   
>   		if (ctrl->link->phy_params.v_level >=
> -			DP_TRAIN_VOLTAGE_SWING_MAX) {
> +			DP_TRAIN_LEVEL_MAX) {
>   			DRM_ERROR_RATELIMITED("max v_level reached\n");
>   			return -EAGAIN;
>   		}
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 98427d45e9a7..e7da0571ecff 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1107,6 +1107,7 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>   int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
>   {
>   	int i;
> +	u8 max_p_level;
>   	int v_max = 0, p_max = 0;
>   	struct dp_link_private *link;
>   
> @@ -1138,30 +1139,29 @@ int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
>   	 * Adjust the voltage swing and pre-emphasis level combination to within
>   	 * the allowable range.
>   	 */
> -	if (dp_link->phy_params.v_level > DP_TRAIN_VOLTAGE_SWING_MAX) {
> +	if (dp_link->phy_params.v_level > DP_TRAIN_LEVEL_MAX) {
>   		drm_dbg_dp(link->drm_dev,
>   			"Requested vSwingLevel=%d, change to %d\n",
>   			dp_link->phy_params.v_level,
> -			DP_TRAIN_VOLTAGE_SWING_MAX);
> -		dp_link->phy_params.v_level = DP_TRAIN_VOLTAGE_SWING_MAX;
> +			DP_TRAIN_LEVEL_MAX);
> +		dp_link->phy_params.v_level = DP_TRAIN_LEVEL_MAX;
>   	}
>   
> -	if (dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_MAX) {
> +	if (dp_link->phy_params.p_level > DP_TRAIN_LEVEL_MAX) {
>   		drm_dbg_dp(link->drm_dev,
>   			"Requested preEmphasisLevel=%d, change to %d\n",
>   			dp_link->phy_params.p_level,
> -			DP_TRAIN_PRE_EMPHASIS_MAX);
> -		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_MAX;
> +			DP_TRAIN_LEVEL_MAX);
> +		dp_link->phy_params.p_level = DP_TRAIN_LEVEL_MAX;
>   	}
>   
> -	if ((dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_LVL_1)
> -		&& (dp_link->phy_params.v_level ==
> -			DP_TRAIN_VOLTAGE_SWING_LVL_2)) {
> +	max_p_level = DP_TRAIN_LEVEL_MAX - dp_link->phy_params.v_level;
> +	if (dp_link->phy_params.p_level > max_p_level) {
>   		drm_dbg_dp(link->drm_dev,
>   			"Requested preEmphasisLevel=%d, change to %d\n",
>   			dp_link->phy_params.p_level,
> -			DP_TRAIN_PRE_EMPHASIS_LVL_1);
> -		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_LVL_1;
> +			max_p_level);
> +		dp_link->phy_params.p_level = max_p_level;
>   	}
>   
>   	drm_dbg_dp(link->drm_dev, "adjusted: v_level=%d, p_level=%d\n",
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
> index 9dd4dd926530..79c3a02b8dac 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.h
> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
> @@ -19,19 +19,7 @@ struct dp_link_info {
>   	unsigned long capabilities;
>   };
>   
> -enum dp_link_voltage_level {
> -	DP_TRAIN_VOLTAGE_SWING_LVL_0	= 0,
> -	DP_TRAIN_VOLTAGE_SWING_LVL_1	= 1,
> -	DP_TRAIN_VOLTAGE_SWING_LVL_2	= 2,
> -	DP_TRAIN_VOLTAGE_SWING_MAX	= DP_TRAIN_VOLTAGE_SWING_LVL_2,
> -};
> -
> -enum dp_link_preemaphasis_level {
> -	DP_TRAIN_PRE_EMPHASIS_LVL_0	= 0,
> -	DP_TRAIN_PRE_EMPHASIS_LVL_1	= 1,
> -	DP_TRAIN_PRE_EMPHASIS_LVL_2	= 2,
> -	DP_TRAIN_PRE_EMPHASIS_MAX	= DP_TRAIN_PRE_EMPHASIS_LVL_2,
> -};
> +#define DP_TRAIN_LEVEL_MAX	3
>   
>   struct dp_link_test_video {
>   	u32 test_video_pattern;
>
> ---
> base-commit: 41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
> change-id: 20240203-dp-swing-3-b64ffce415d9
>
> Best regards,
