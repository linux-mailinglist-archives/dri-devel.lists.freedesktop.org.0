Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A683E52F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A7510FF4C;
	Fri, 26 Jan 2024 22:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FD610FF45;
 Fri, 26 Jan 2024 22:20:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QMBePC027125; Fri, 26 Jan 2024 22:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=NdI1qpt3C+q4QGeP6G7c4haHdWEXydYRo7++uixWEnI=; b=aB
 mPBsIxepwNpSItlM7pGYzYG4QXlOLF2U8t0mm8ESkBIiYN6vNAifvDAd0AnziTGY
 z0eLJsyumZVX2056Oeun8oPua1fRJTCMDHY0UVM8hHxkWXtzGppth9290/HAgo5J
 CJZH7Pd4f8HmjootxyPboHI2F908DzCvESJOGrnSwa8sOa2SJ01Nkg/rDvoHlecf
 BNUBHPGH/2GyBnY+dPFX2pdNwCtJsHdHtxMaXz6JrnltGsj0V2Sgy1whqLHaKyY6
 WX6UC826W4jGoI+tHO0Vv9Nm2kDFSofZExFily1gHwWgJz7E9KWWuJdOuaPNMnkl
 K0FVUGktBjrDiV96B9yA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvhxyrd78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:20:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMKhWB002276
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:20:43 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:20:42 -0800
Message-ID: <d5175dee-b6e3-5068-fe29-a3d4982675ec@quicinc.com>
Date: Fri, 26 Jan 2024 14:20:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 05/15] drm/msm/dp: fold dp_power into dp_ctrl
 module
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-5-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-5-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: a53GOqHl1KyY6dcWR9cgq58dwobnhEe5
X-Proofpoint-ORIG-GUID: a53GOqHl1KyY6dcWR9cgq58dwobnhEe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260163
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
> The dp_power submodule is limited to handling the clocks only following
> previous cleanups. Fold it into the dp_ctrl submodule, removing one
> unnecessary level of indirection.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile        |   1 -
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 150 +++++++++++++++++++++++++++----
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   6 +-
>   drivers/gpu/drm/msm/dp/dp_display.c |  24 +----
>   drivers/gpu/drm/msm/dp/dp_power.c   | 170 ------------------------------------
>   drivers/gpu/drm/msm/dp/dp_power.h   |  74 ----------------
>   6 files changed, 142 insertions(+), 283 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index b1173128b5b9..8dbdf3fba69e 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -128,7 +128,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_link.o \
>   	dp/dp_panel.o \
>   	dp/dp_parser.o \
> -	dp/dp_power.o \
>   	dp/dp_audio.o
>   
>   msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 77a8d9366ed7..da29281c575b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -76,13 +76,16 @@ struct dp_ctrl_private {
>   	struct drm_dp_aux *aux;
>   	struct dp_panel *panel;
>   	struct dp_link *link;
> -	struct dp_power *power;
>   	struct dp_parser *parser;
>   	struct dp_catalog *catalog;
>   
>   	struct completion idle_comp;
>   	struct completion psr_op_comp;
>   	struct completion video_comp;
> +
> +	bool core_clks_on;
> +	bool link_clks_on;
> +	bool stream_clks_on;
>   };
>   
>   static int dp_aux_link_configure(struct drm_dp_aux *aux,
> @@ -1338,6 +1341,83 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
>   				name, rate);
>   }
>   
> +int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
> +		       enum dp_pm_type pm_type, bool enable)
> +{
> +	struct dp_ctrl_private *ctrl;
> +	struct dss_module_power *mp;
> +	int ret = 0;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	if (pm_type != DP_CORE_PM &&
> +	    pm_type != DP_CTRL_PM &&
> +	    pm_type != DP_STREAM_PM) {
> +		DRM_ERROR("unsupported ctrl module: %s\n",
> +			  dp_parser_pm_name(pm_type));
> +		return -EINVAL;
> +	}
> +
> +	if (enable) {
> +		if (pm_type == DP_CORE_PM && ctrl->core_clks_on) {
> +			drm_dbg_dp(ctrl->drm_dev,
> +				   "core clks already enabled\n");
> +			return 0;
> +		}
> +
> +		if (pm_type == DP_CTRL_PM && ctrl->link_clks_on) {
> +			drm_dbg_dp(ctrl->drm_dev,
> +				   "links clks already enabled\n");
> +			return 0;
> +		}
> +
> +		if (pm_type == DP_STREAM_PM && ctrl->stream_clks_on) {
> +			drm_dbg_dp(ctrl->drm_dev,
> +				   "pixel clks already enabled\n");
> +			return 0;
> +		}
> +
> +		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
> +			drm_dbg_dp(ctrl->drm_dev,
> +				   "Enable core clks before link clks\n");
> +			mp = &ctrl->parser->mp[DP_CORE_PM];
> +
> +			ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
> +			if (ret)
> +				return ret;
> +
> +			ctrl->core_clks_on = true;
> +		}
> +	}
> +
> +	mp = &ctrl->parser->mp[pm_type];
> +	if (enable) {
> +		ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
> +		if (ret)
> +			return ret;
> +	} else {
> +		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
> +	}
> +
> +	if (pm_type == DP_CORE_PM)
> +		ctrl->core_clks_on = enable;
> +	else if (pm_type == DP_STREAM_PM)
> +		ctrl->stream_clks_on = enable;
> +	else
> +		ctrl->link_clks_on = enable;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "%s clocks for %s\n",
> +		   enable ? "enable" : "disable",
> +		   dp_parser_pm_name(pm_type));
> +	drm_dbg_dp(ctrl->drm_dev,
> +		   "stream_clks:%s link_clks:%s core_clks:%s\n",
> +		   ctrl->stream_clks_on ? "on" : "off",
> +		   ctrl->link_clks_on ? "on" : "off",
> +		   ctrl->core_clks_on ? "on" : "off");
> +
> +	return 0;
> +}
> +
>   static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>   {
>   	int ret = 0;
> @@ -1354,7 +1434,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>   	phy_power_on(phy);
>   
>   	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
> -	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
> +	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, true);
>   	if (ret)
>   		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
>   
> @@ -1502,7 +1582,7 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   	 * link maintenance.
>   	 */
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
> +	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
>   	if (ret) {
>   		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
>   		return ret;
> @@ -1534,7 +1614,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   	dp_catalog_ctrl_reset(ctrl->catalog);
>   
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
> +	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
>   	if (ret) {
>   		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>   	}
> @@ -1656,7 +1736,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>   	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>   	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
>   
> -	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
> +	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
>   	if (ret) {
>   		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>   		return ret;
> @@ -1752,7 +1832,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>   	rate = ctrl->panel->link_info.rate;
>   	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>   
> -	dp_power_clk_enable(ctrl->power, DP_CORE_PM, true);
> +	dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CORE_PM, true);
>   
>   	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
>   		drm_dbg_dp(ctrl->drm_dev,
> @@ -1885,7 +1965,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   		ctrl->link->link_params.rate,
>   		ctrl->link->link_params.num_lanes, pixel_rate);
>   
> -	if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM)) { /* link clk is off */
> +	drm_dbg_dp(ctrl->drm_dev,
> +		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> +		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> +
> +	if (!ctrl->link_clks_on) { /* link clk is off */
>   		ret = dp_ctrl_enable_mainlink_clocks(ctrl);
>   		if (ret) {
>   			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
> @@ -1895,7 +1979,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   
>   	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
>   
> -	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
> +	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
>   	if (ret) {
>   		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
>   		goto end;
> @@ -1951,8 +2035,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
> -	if (dp_power_clk_status(ctrl->power, DP_STREAM_PM)) {
> -		ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
> +	if (ctrl->stream_clks_on) {
> +		ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
>   		if (ret) {
>   			DRM_ERROR("Failed to disable pclk. ret=%d\n", ret);
>   			return ret;
> @@ -1960,7 +2044,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   	}
>   
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
> +	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
>   	if (ret) {
>   		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>   		return ret;
> @@ -1990,7 +2074,7 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
>   
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
> -	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
> +	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
>   	if (ret) {
>   		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>   	}
> @@ -2024,12 +2108,12 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   
>   	dp_catalog_ctrl_reset(ctrl->catalog);
>   
> -	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
> +	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
>   	if (ret)
>   		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
>   
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
> +	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
>   	if (ret) {
>   		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>   	}
> @@ -2086,9 +2170,38 @@ irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
>   	return ret;
>   }
>   
> +static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl_private;
> +	int rc = 0;
> +	struct dss_module_power *core, *ctrl, *stream;
> +	struct device *dev;
> +
> +	ctrl_private = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +	dev = ctrl_private->dev;
> +
> +	core = &ctrl_private->parser->mp[DP_CORE_PM];
> +	ctrl = &ctrl_private->parser->mp[DP_CTRL_PM];
> +	stream = &ctrl_private->parser->mp[DP_STREAM_PM];
> +
> +	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
> +	if (rc)
> +		return rc;
> +
> +	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
> +	if (rc)
> +		return -ENODEV;
> +
> +	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
> +	if (rc)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>   struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>   			struct dp_panel *panel,	struct drm_dp_aux *aux,
> -			struct dp_power *power, struct dp_catalog *catalog,
> +			struct dp_catalog *catalog,
>   			struct dp_parser *parser)
>   {
>   	struct dp_ctrl_private *ctrl;
> @@ -2125,11 +2238,16 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>   	/* in parameters */
>   	ctrl->parser   = parser;
>   	ctrl->panel    = panel;
> -	ctrl->power    = power;
>   	ctrl->aux      = aux;
>   	ctrl->link     = link;
>   	ctrl->catalog  = catalog;
>   	ctrl->dev      = dev;
>   
> +	ret = dp_ctrl_clk_init(&ctrl->dp_ctrl);
> +	if (ret) {
> +		dev_err(dev, "failed to init clocks\n");
> +		return ERR_PTR(ret);
> +	}
> +
>   	return &ctrl->dp_ctrl;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index b2c27d3532bf..85da5a7e5307 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -10,7 +10,6 @@
>   #include "dp_panel.h"
>   #include "dp_link.h"
>   #include "dp_parser.h"
> -#include "dp_power.h"
>   #include "dp_catalog.h"
>   
>   struct dp_ctrl {
> @@ -28,7 +27,7 @@ irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
>   void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
>   struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>   			struct dp_panel *panel,	struct drm_dp_aux *aux,
> -			struct dp_power *power, struct dp_catalog *catalog,
> +			struct dp_catalog *catalog,
>   			struct dp_parser *parser);
>   
>   void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
> @@ -39,4 +38,7 @@ void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
>   void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
>   void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
>   
> +int dp_ctrl_clk_enable(struct dp_ctrl *ctrl, enum dp_pm_type pm_type,
> +		       bool enable);
> +
>   #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8cd18705740f..33e9d7deb3f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -15,13 +15,12 @@
>   #include "msm_drv.h"
>   #include "msm_kms.h"
>   #include "dp_parser.h"
> -#include "dp_power.h"
> +#include "dp_ctrl.h"
>   #include "dp_catalog.h"
>   #include "dp_aux.h"
>   #include "dp_reg.h"
>   #include "dp_link.h"
>   #include "dp_panel.h"
> -#include "dp_ctrl.h"
>   #include "dp_display.h"
>   #include "dp_drm.h"
>   #include "dp_audio.h"
> @@ -89,7 +88,6 @@ struct dp_display_private {
>   	struct dentry *root;
>   
>   	struct dp_parser  *parser;
> -	struct dp_power   *power;
>   	struct dp_catalog *catalog;
>   	struct drm_dp_aux *aux;
>   	struct dp_link    *link;
> @@ -434,7 +432,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized);
>   
> -	dp_power_clk_enable(dp->power, DP_CORE_PM, true);
> +	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, true);
>   	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>   	dp_aux_init(dp->aux);
>   	dp->core_initialized = true;
> @@ -448,7 +446,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>   
>   	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>   	dp_aux_deinit(dp->aux);
> -	dp_power_clk_enable(dp->power, DP_CORE_PM, false);
> +	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, false);
>   	dp->core_initialized = false;
>   }
>   
> @@ -731,14 +729,6 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   		goto error;
>   	}
>   
> -	dp->power = dp_power_get(dev, dp->parser);
> -	if (IS_ERR(dp->power)) {
> -		rc = PTR_ERR(dp->power);
> -		DRM_ERROR("failed to initialize power, rc = %d\n", rc);
> -		dp->power = NULL;
> -		goto error;
> -	}
> -
>   	dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
>   	if (IS_ERR(dp->aux)) {
>   		rc = PTR_ERR(dp->aux);
> @@ -768,7 +758,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   	}
>   
>   	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
> -			       dp->power, dp->catalog, dp->parser);
> +			       dp->catalog, dp->parser);
>   	if (IS_ERR(dp->ctrl)) {
>   		rc = PTR_ERR(dp->ctrl);
>   		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
> @@ -1266,12 +1256,6 @@ static int dp_display_probe(struct platform_device *pdev)
>   		return -EPROBE_DEFER;
>   	}
>   
> -	rc = dp_power_client_init(dp->power);
> -	if (rc) {
> -		DRM_ERROR("Power client create failed\n");
> -		goto err;
> -	}
> -
>   	/* setup event q */
>   	mutex_init(&dp->event_mutex);
>   	init_waitqueue_head(&dp->event_q);
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> deleted file mode 100644
> index f49e3aede308..000000000000
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ /dev/null
> @@ -1,170 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> - */
> -
> -#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
> -
> -#include <linux/clk.h>
> -#include <linux/clk-provider.h>
> -#include <linux/regulator/consumer.h>
> -#include <linux/pm_opp.h>
> -#include "dp_power.h"
> -#include "msm_drv.h"
> -
> -struct dp_power_private {
> -	struct dp_parser *parser;
> -	struct device *dev;
> -	struct drm_device *drm_dev;
> -
> -	struct dp_power dp_power;
> -};
> -
> -static int dp_power_clk_init(struct dp_power_private *power)
> -{
> -	int rc = 0;
> -	struct dss_module_power *core, *ctrl, *stream;
> -	struct device *dev = power->dev;
> -
> -	core = &power->parser->mp[DP_CORE_PM];
> -	ctrl = &power->parser->mp[DP_CTRL_PM];
> -	stream = &power->parser->mp[DP_STREAM_PM];
> -
> -	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
> -	if (rc)
> -		return rc;
> -
> -	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
> -	if (rc)
> -		return -ENODEV;
> -
> -	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
> -	if (rc)
> -		return -ENODEV;
> -
> -	return 0;
> -}
> -
> -int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type)
> -{
> -	struct dp_power_private *power;
> -
> -	power = container_of(dp_power, struct dp_power_private, dp_power);
> -
> -	drm_dbg_dp(power->drm_dev,
> -		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> -		dp_power->core_clks_on, dp_power->link_clks_on, dp_power->stream_clks_on);
> -
> -	if (pm_type == DP_CORE_PM)
> -		return dp_power->core_clks_on;
> -
> -	if (pm_type == DP_CTRL_PM)
> -		return dp_power->link_clks_on;
> -
> -	if (pm_type == DP_STREAM_PM)
> -		return dp_power->stream_clks_on;
> -
> -	return 0;
> -}
> -
> -int dp_power_clk_enable(struct dp_power *dp_power,
> -		enum dp_pm_type pm_type, bool enable)
> -{
> -	int rc = 0;
> -	struct dp_power_private *power;
> -	struct dss_module_power *mp;
> -
> -	power = container_of(dp_power, struct dp_power_private, dp_power);
> -
> -	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM &&
> -			pm_type != DP_STREAM_PM) {
> -		DRM_ERROR("unsupported power module: %s\n",
> -				dp_parser_pm_name(pm_type));
> -		return -EINVAL;
> -	}
> -
> -	if (enable) {
> -		if (pm_type == DP_CORE_PM && dp_power->core_clks_on) {
> -			drm_dbg_dp(power->drm_dev,
> -					"core clks already enabled\n");
> -			return 0;
> -		}
> -
> -		if (pm_type == DP_CTRL_PM && dp_power->link_clks_on) {
> -			drm_dbg_dp(power->drm_dev,
> -					"links clks already enabled\n");
> -			return 0;
> -		}
> -
> -		if (pm_type == DP_STREAM_PM && dp_power->stream_clks_on) {
> -			drm_dbg_dp(power->drm_dev,
> -					"pixel clks already enabled\n");
> -			return 0;
> -		}
> -
> -		if ((pm_type == DP_CTRL_PM) && (!dp_power->core_clks_on)) {
> -			drm_dbg_dp(power->drm_dev,
> -					"Enable core clks before link clks\n");
> -			mp = &power->parser->mp[DP_CORE_PM];
> -
> -			rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
> -			if (rc)
> -				return rc;
> -
> -			dp_power->core_clks_on = true;
> -		}
> -	}
> -
> -	mp = &power->parser->mp[pm_type];
> -	if (enable) {
> -		rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
> -		if (rc)
> -			return rc;
> -	} else {
> -		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
> -	}
> -
> -	if (pm_type == DP_CORE_PM)
> -		dp_power->core_clks_on = enable;
> -	else if (pm_type == DP_STREAM_PM)
> -		dp_power->stream_clks_on = enable;
> -	else
> -		dp_power->link_clks_on = enable;
> -
> -	drm_dbg_dp(power->drm_dev, "%s clocks for %s\n",
> -			enable ? "enable" : "disable",
> -			dp_parser_pm_name(pm_type));
> -	drm_dbg_dp(power->drm_dev,
> -		"strem_clks:%s link_clks:%s core_clks:%s\n",
> -		dp_power->stream_clks_on ? "on" : "off",
> -		dp_power->link_clks_on ? "on" : "off",
> -		dp_power->core_clks_on ? "on" : "off");
> -
> -	return 0;
> -}
> -
> -int dp_power_client_init(struct dp_power *dp_power)
> -{
> -	struct dp_power_private *power;
> -
> -	power = container_of(dp_power, struct dp_power_private, dp_power);
> -
> -	return dp_power_clk_init(power);
> -}
> -
> -struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
> -{
> -	struct dp_power_private *power;
> -	struct dp_power *dp_power;
> -
> -	power = devm_kzalloc(dev, sizeof(*power), GFP_KERNEL);
> -	if (!power)
> -		return ERR_PTR(-ENOMEM);
> -
> -	power->parser = parser;
> -	power->dev = dev;
> -
> -	dp_power = &power->dp_power;
> -
> -	return dp_power;
> -}
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
> deleted file mode 100644
> index eb836b5aa24a..000000000000
> --- a/drivers/gpu/drm/msm/dp/dp_power.h
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef _DP_POWER_H_
> -#define _DP_POWER_H_
> -
> -#include "dp_parser.h"
> -
> -/**
> - * sruct dp_power - DisplayPort's power related data
> - *
> - * @init: initializes the regulators/core clocks/GPIOs/pinctrl
> - * @deinit: turns off the regulators/core clocks/GPIOs/pinctrl
> - * @clk_enable: enable/disable the DP clocks
> - * @set_pixel_clk_parent: set the parent of DP pixel clock
> - */
> -struct dp_power {
> -	bool core_clks_on;
> -	bool link_clks_on;
> -	bool stream_clks_on;
> -};
> -
> -/**
> - * dp_power_clk_status() - display controller clocks status
> - *
> - * @power: instance of power module
> - * @pm_type: type of pm, core/ctrl/phy
> - * return: status of power clocks
> - *
> - * This API return status of DP clocks
> - */
> -
> -int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type);
> -
> -/**
> - * dp_power_clk_enable() - enable display controller clocks
> - *
> - * @power: instance of power module
> - * @pm_type: type of pm, core/ctrl/phy
> - * @enable: enables or disables
> - * return: pointer to allocated power module data
> - *
> - * This API will call setrate and enable for DP clocks
> - */
> -
> -int dp_power_clk_enable(struct dp_power *power, enum dp_pm_type pm_type,
> -				bool enable);
> -
> -/**
> - * dp_power_client_init() - initialize clock and regulator modules
> - *
> - * @power: instance of power module
> - * return: 0 for success, error for failure.
> - *
> - * This API will configure the DisplayPort's clocks and regulator
> - * modules.
> - */
> -int dp_power_client_init(struct dp_power *power);
> -
> -/**
> - * dp_power_get() - configure and get the DisplayPort power module data
> - *
> - * @parser: instance of parser module
> - * return: pointer to allocated power module data
> - *
> - * This API will configure the DisplayPort's power module and provides
> - * methods to be called by the client to configure the power related
> - * modules.
> - */
> -struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser);
> -
> -#endif /* _DP_POWER_H_ */
>
