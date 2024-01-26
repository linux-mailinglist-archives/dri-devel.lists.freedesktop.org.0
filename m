Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A383E53E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5314510FF53;
	Fri, 26 Jan 2024 22:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554F710FF4F;
 Fri, 26 Jan 2024 22:22:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QMABD6020587; Fri, 26 Jan 2024 22:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=LDg17nHq16fwtgYHF38e3rcFm31nMOCJBXdna7cZKgM=; b=Sk
 HJQJIhSs2/xrh9hSJK5OuGbps6TTiWFWjnXn+oz+vqTqckJgModQHtyqX0K9jYT0
 U85El71UTJt5gbaR+Po2VI6cgMXEEFY7E0RRVuLCKKiMxfeCANvOUHWwKWEGfRWY
 lVhN7GFKtP1RCbe+TlgmeRcX4dOaN7zDVO+RZpaqwkfSWQCVuf14Lg/1iFNyq+t4
 jy4E36ekdJ0jpuybPBYydrNboy++Fk7fh9CNNSOPqNl7LOhcKYecPXhjlODda2EO
 YXSJkmnm8Fzx1+ScHzbjW7dXZBY0qAUHYQ8w1nUs3k6cj6btovb2wKT7ipetbdrS
 gkRm/srPgRYwsJWUozWg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvjx888vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:22:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMM7Tv003274
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:22:07 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:22:06 -0800
Message-ID: <5ccce52c-71a9-4af6-0c7f-88a7b363aee9@quicinc.com>
Date: Fri, 26 Jan 2024 14:22:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 08/15] drm/msm/dp: split dp_ctrl_clk_enable into
 four functuions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-8-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-8-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: XrRwlauwbb7b70A-D0C9bni2ecqmr1cN
X-Proofpoint-GUID: XrRwlauwbb7b70A-D0C9bni2ecqmr1cN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260164
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> Split the dp_ctrl_clk_enable() beast into four functions, each of them
> doing just a single item: enabling or disabling core or link clocks.
> This allows us to cleanup the dss_module_power structure and makes
> several dp_ctrl functions return void.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 220 +++++++++++++++++-------------------
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  16 +--
>   drivers/gpu/drm/msm/dp/dp_display.c |   4 +-
>   3 files changed, 108 insertions(+), 132 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index cfcf6136ffa6..e367eb8e5bea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -69,11 +69,6 @@ struct dp_vc_tu_mapping_table {
>   	u8 tu_size_minus1;
>   };
>   
> -struct dss_module_power {
> -	unsigned int num_clk;
> -	struct clk_bulk_data *clocks;
> -};
> -
>   struct dp_ctrl_private {
>   	struct dp_ctrl dp_ctrl;
>   	struct drm_device *drm_dev;
> @@ -84,7 +79,12 @@ struct dp_ctrl_private {
>   	struct dp_parser *parser;
>   	struct dp_catalog *catalog;
>   
> -	struct dss_module_power mp[DP_MAX_PM];
> +	unsigned int num_core_clks;
> +	struct clk_bulk_data *core_clks;
> +
> +	unsigned int num_link_clks;
> +	struct clk_bulk_data *link_clks;
> +
>   	struct clk *pixel_clk;
>   
>   	struct completion idle_comp;
> @@ -96,15 +96,6 @@ struct dp_ctrl_private {
>   	bool stream_clks_on;
>   };
>   
> -static inline const char *dp_pm_name(enum dp_pm_type module)
> -{
> -	switch (module) {
> -	case DP_CORE_PM:	return "DP_CORE_PM";
> -	case DP_CTRL_PM:	return "DP_CTRL_PM";
> -	default:		return "???";
> -	}
> -}
> -
>   static int dp_aux_link_configure(struct drm_dp_aux *aux,
>   					struct dp_link_info *link)
>   {
> @@ -1337,67 +1328,76 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
>   	return ret;
>   }
>   
> -int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
> -		       enum dp_pm_type pm_type, bool enable)
> +int dp_ctrl_core_clk_enable(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
> -	struct dss_module_power *mp;
>   	int ret = 0;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   
> -	if (pm_type != DP_CORE_PM &&
> -	    pm_type != DP_CTRL_PM) {
> -		DRM_ERROR("unsupported ctrl module: %s\n",
> -			  dp_pm_name(pm_type));
> -		return -EINVAL;
> +	if (ctrl->core_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "core clks already enabled\n");
> +		return 0;
>   	}
>   
> -	if (enable) {
> -		if (pm_type == DP_CORE_PM && ctrl->core_clks_on) {
> -			drm_dbg_dp(ctrl->drm_dev,
> -				   "core clks already enabled\n");
> -			return 0;
> -		}
> +	ret = clk_bulk_prepare_enable(ctrl->num_core_clks, ctrl->core_clks);
> +	if (ret)
> +		return ret;
>   
> -		if (pm_type == DP_CTRL_PM && ctrl->link_clks_on) {
> -			drm_dbg_dp(ctrl->drm_dev,
> -				   "links clks already enabled\n");
> -			return 0;
> -		}
> +	ctrl->core_clks_on = true;
>   
> -		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
> -			drm_dbg_dp(ctrl->drm_dev,
> -				   "Enable core clks before link clks\n");
> -			mp = &ctrl->mp[DP_CORE_PM];
> +	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
> +	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> +		   ctrl->stream_clks_on ? "on" : "off",
> +		   ctrl->link_clks_on ? "on" : "off",
> +		   ctrl->core_clks_on ? "on" : "off");
>   
> -			ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
> -			if (ret)
> -				return ret;
> +	return 0;
> +}
>   
> -			ctrl->core_clks_on = true;
> -		}
> +void dp_ctrl_core_clk_disable(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	clk_bulk_disable_unprepare(ctrl->num_core_clks, ctrl->core_clks);
> +
> +	ctrl->core_clks_on = false;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
> +	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> +		   ctrl->stream_clks_on ? "on" : "off",
> +		   ctrl->link_clks_on ? "on" : "off",
> +		   ctrl->core_clks_on ? "on" : "off");
> +}
> +
> +static int dp_ctrl_link_clk_enable(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl;
> +	int ret = 0;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	if (ctrl->link_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "links clks already enabled\n");
> +		return 0;
>   	}
>   
> -	mp = &ctrl->mp[pm_type];
> -	if (enable) {
> -		ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
> -		if (ret)
> -			return ret;
> -	} else {
> -		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
> +	if (!ctrl->core_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "Enable core clks before link clks\n");
> +
> +		dp_ctrl_core_clk_enable(dp_ctrl);
>   	}
>   
> -	if (pm_type == DP_CORE_PM)
> -		ctrl->core_clks_on = enable;
> -	else
> -		ctrl->link_clks_on = enable;
> +	ret = clk_bulk_prepare_enable(ctrl->num_link_clks, ctrl->link_clks);
> +	if (ret)
> +		return ret;
>   
> -	drm_dbg_dp(ctrl->drm_dev, "%s clocks for %s\n",
> -		   enable ? "enable" : "disable",
> -		   dp_pm_name(pm_type));
> -	drm_dbg_dp(ctrl->drm_dev,
> -		   "stream_clks:%s link_clks:%s core_clks:%s\n",
> +	ctrl->link_clks_on = true;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "enale link clocks\n");
> +	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
>   		   ctrl->stream_clks_on ? "on" : "off",
>   		   ctrl->link_clks_on ? "on" : "off",
>   		   ctrl->core_clks_on ? "on" : "off");
> @@ -1405,6 +1405,23 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
>   	return 0;
>   }
>   
> +static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	clk_bulk_disable_unprepare(ctrl->num_link_clks, ctrl->link_clks);
> +
> +	ctrl->link_clks_on = false;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
> +	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> +		   ctrl->stream_clks_on ? "on" : "off",
> +		   ctrl->link_clks_on ? "on" : "off",
> +		   ctrl->core_clks_on ? "on" : "off");
> +}
> +
>   static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>   {
>   	int ret = 0;
> @@ -1421,7 +1438,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>   	phy_power_on(phy);
>   
>   	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
> -	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, true);
> +	ret = dp_ctrl_link_clk_enable(&ctrl->dp_ctrl);
>   	if (ret)
>   		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
>   
> @@ -1569,11 +1586,9 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   	 * link maintenance.
>   	 */
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
> -	if (ret) {
> -		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
> -		return ret;
> -	}
> +
> +	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
> +
>   	phy_power_off(phy);
>   	/* hw recommended delay before re-enabling clocks */
>   	msleep(20);
> @@ -1591,7 +1606,6 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   {
>   	struct dp_io *dp_io;
>   	struct phy *phy;
> -	int ret;
>   
>   	dp_io = &ctrl->parser->io;
>   	phy = dp_io->phy;
> @@ -1601,10 +1615,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   	dp_catalog_ctrl_reset(ctrl->catalog);
>   
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
> -	if (ret) {
> -		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
> -	}
> +	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
>   
>   	phy_power_off(phy);
>   
> @@ -1708,11 +1719,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>   	 * running. Add the global reset just before disabling the
>   	 * link clocks and core clocks.
>   	 */
> -	ret = dp_ctrl_off(&ctrl->dp_ctrl);
> -	if (ret) {
> -		DRM_ERROR("failed to disable DP controller\n");
> -		return ret;
> -	}
> +	dp_ctrl_off(&ctrl->dp_ctrl);
>   
>   	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>   	if (ret) {
> @@ -1828,7 +1835,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>   	rate = ctrl->panel->link_info.rate;
>   	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>   
> -	dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CORE_PM, true);
> +	dp_ctrl_core_clk_enable(&ctrl->dp_ctrl);
>   
>   	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
>   		drm_dbg_dp(ctrl->drm_dev,
> @@ -2024,12 +2031,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   	return ret;
>   }
>   
> -int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
>   	struct dp_io *dp_io;
>   	struct phy *phy;
> -	int ret;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   	dp_io = &ctrl->parser->io;
> @@ -2046,11 +2052,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   	}
>   
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
> -	if (ret) {
> -		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
> -		return ret;
> -	}
> +	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
>   
>   	phy_power_off(phy);
>   
> @@ -2060,15 +2062,13 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   
>   	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
>   			phy, phy->init_count, phy->power_count);
> -	return ret;
>   }
>   
> -int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
>   	struct dp_io *dp_io;
>   	struct phy *phy;
> -	int ret;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   	dp_io = &ctrl->parser->io;
> @@ -2076,10 +2076,7 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
>   
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
> -	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
> -	if (ret) {
> -		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
> -	}
> +	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
>   
>   	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
>   		phy, phy->init_count, phy->power_count);
> @@ -2088,19 +2085,13 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
>   
>   	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
>   		phy, phy->init_count, phy->power_count);
> -
> -	return ret;
>   }
>   
> -int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
>   	struct dp_io *dp_io;
>   	struct phy *phy;
> -	int ret = 0;
> -
> -	if (!dp_ctrl)
> -		return -EINVAL;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   	dp_io = &ctrl->parser->io;
> @@ -2116,16 +2107,11 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   	}
>   
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
> -	if (ret) {
> -		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
> -	}
> +	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
>   
>   	phy_power_off(phy);
>   	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
>   			phy, phy->init_count, phy->power_count);
> -
> -	return ret;
>   }
>   
>   irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
> @@ -2186,37 +2172,33 @@ static const char *ctrl_clks[] = {
>   static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
> -	struct dss_module_power *core, *link;
>   	struct device *dev;
>   	int i, rc;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   	dev = ctrl->dev;
>   
> -	core = &ctrl->mp[DP_CORE_PM];
> -	link = &ctrl->mp[DP_CTRL_PM];
> -
> -	core->num_clk = ARRAY_SIZE(core_clks);
> -	core->clocks = devm_kcalloc(dev, core->num_clk, sizeof(*core->clocks), GFP_KERNEL);
> -	if (!core->clocks)
> +	ctrl->num_core_clks = ARRAY_SIZE(core_clks);
> +	ctrl->core_clks = devm_kcalloc(dev, ctrl->num_core_clks, sizeof(*ctrl->core_clks), GFP_KERNEL);
> +	if (!ctrl->core_clks)
>   		return -ENOMEM;
>   
> -	for (i = 0; i < core->num_clk; i++)
> -		core->clocks[i].id = core_clks[i];
> +	for (i = 0; i < ctrl->num_core_clks; i++)
> +		ctrl->core_clks[i].id = core_clks[i];
>   
> -	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
> +	rc = devm_clk_bulk_get(dev, ctrl->num_core_clks, ctrl->core_clks);
>   	if (rc)
>   		return rc;
>   
> -	link->num_clk = ARRAY_SIZE(ctrl_clks);
> -	link->clocks = devm_kcalloc(dev, link->num_clk, sizeof(*link->clocks), GFP_KERNEL);
> -	if (!link->clocks)
> +	ctrl->num_link_clks = ARRAY_SIZE(ctrl_clks);
> +	ctrl->link_clks = devm_kcalloc(dev, ctrl->num_link_clks, sizeof(*ctrl->link_clks), GFP_KERNEL);
> +	if (!ctrl->link_clks)
>   		return -ENOMEM;
>   
> -	for (i = 0; i < link->num_clk; i++)
> -		link->clocks[i].id = ctrl_clks[i];
> +	for (i = 0; i < ctrl->num_link_clks; i++)
> +		ctrl->link_clks[i].id = ctrl_clks[i];
>   
> -	rc = devm_clk_bulk_get(dev, link->num_clk, link->clocks);
> +	rc = devm_clk_bulk_get(dev, ctrl->num_link_clks, ctrl->link_clks);
>   	if (rc)
>   		return rc;
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index d8007a9d8260..023f14d0b021 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -17,17 +17,11 @@ struct dp_ctrl {
>   	bool wide_bus_en;
>   };
>   
> -enum dp_pm_type {
> -	DP_CORE_PM,
> -	DP_CTRL_PM,
> -	DP_MAX_PM
> -};
> -
>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
> -int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
> -int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
> -int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_off(struct dp_ctrl *dp_ctrl);
>   void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
>   irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
>   void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
> @@ -44,7 +38,7 @@ void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
>   void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
>   void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
>   
> -int dp_ctrl_clk_enable(struct dp_ctrl *ctrl, enum dp_pm_type pm_type,
> -		       bool enable);
> +int dp_ctrl_core_clk_enable(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_core_clk_disable(struct dp_ctrl *dp_ctrl);
>   
>   #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 33e9d7deb3f8..6fbbd0f93d13 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -432,7 +432,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized);
>   
> -	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, true);
> +	dp_ctrl_core_clk_enable(dp->ctrl);
>   	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>   	dp_aux_init(dp->aux);
>   	dp->core_initialized = true;
> @@ -446,7 +446,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>   
>   	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>   	dp_aux_deinit(dp->aux);
> -	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, false);
> +	dp_ctrl_core_clk_disable(dp->ctrl);
>   	dp->core_initialized = false;
>   }
>   
>
