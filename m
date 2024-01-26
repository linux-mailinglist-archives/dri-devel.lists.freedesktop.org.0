Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A1083E556
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6310D10FF6C;
	Fri, 26 Jan 2024 22:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E9210FF69;
 Fri, 26 Jan 2024 22:25:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QKr08Z028213; Fri, 26 Jan 2024 22:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=G7kMcx33ie/NjmNhrhprYOPje/v7pakGHgYx4hBc3Hw=; b=Hr
 ItDRBJGYVNYJMYlziCuiPgpUG8mLvM2Zo5VKHnEK+RmJu7k3FuM3MJ5VsbigccEt
 1UXzYRAhu8IyA8cbFWIjhbhbzKbm5flyrRJBDJ2u4jzNOoWODMMaFBWOV7Qskyhd
 KFfCEhHUIe2RV1YmJ06T0K4BeODCTzly8/66M2s3CAihQYrBrTZAmLHCBTTPV9En
 NoQPPRRQQtzR5lTR8YQEmjFfUF6XjC9wn36td6P2ut5+o+VmQqftCPlLxxYLpKn9
 Hgh7TA1g0qGEFw2AgGbBY9nOgDUnwLhrRkbMMdUGHVlXi6+pFEjRmaByJCPNmmmT
 6THYgHTonaq9xSu4e+nQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv6c8j1ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:25:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMP0hL006384
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:25:00 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:24:59 -0800
Message-ID: <d08f2c88-31e8-4711-b1b6-2e126598215d@quicinc.com>
Date: Fri, 26 Jan 2024 14:24:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 13/15] drm/msm/dp: move link property handling
 to dp_panel
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-13-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-13-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pbaoVIUXSgAMrl5Q53GaK9slTWeyHeT3
X-Proofpoint-ORIG-GUID: pbaoVIUXSgAMrl5Q53GaK9slTWeyHeT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260164
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
> Instead of passing link properties through the separate struct, parse
> them directly in the dp_panel.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  8 -----
>   drivers/gpu/drm/msm/dp/dp_display.h |  1 -
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 66 +++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_parser.c  | 54 ------------------------------
>   drivers/gpu/drm/msm/dp/dp_parser.h  |  4 ---
>   5 files changed, 66 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5ad96989c5f2..f19cb8c7e8cb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -356,12 +356,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>   	int rc = 0;
>   	struct edid *edid;
>   
> -	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
> -	dp->panel->max_dp_link_rate = dp->parser->max_dp_link_rate;
> -
> -	drm_dbg_dp(dp->drm_dev, "max_lanes=%d max_link_rate=%d\n",
> -		dp->panel->max_dp_lanes, dp->panel->max_dp_link_rate);
> -
>   	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
>   	if (rc)
>   		goto end;
> @@ -381,8 +375,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>   	dp->audio_supported = drm_detect_monitor_audio(edid);
>   	dp_panel_handle_sink_request(dp->panel);
>   
> -	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
> -
>   	/*
>   	 * set sink to normal operation mode -- D0
>   	 * before dpcd read
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 102f3507d824..70759dd1bfd0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -28,7 +28,6 @@ struct msm_dp {
>   
>   	bool wide_bus_en;
>   
> -	u32 max_dp_lanes;
>   	struct dp_audio *dp_audio;
>   	bool psr_supported;
>   };
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 127f6af995cd..8242541a81b9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -7,8 +7,12 @@
>   
>   #include <drm/drm_connector.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   
> +#define DP_MAX_NUM_DP_LANES	4
> +#define DP_LINK_RATE_HBR2	540000 /* kbytes */
> +
>   struct dp_panel_private {
>   	struct device *dev;
>   	struct drm_device *drm_dev;
> @@ -138,6 +142,9 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   
>   	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>   
> +	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
> +		dp_panel->max_dp_lanes, dp_panel->max_dp_link_rate);
> +
>   	rc = dp_panel_read_dpcd(dp_panel);
>   	if (rc) {
>   		DRM_ERROR("read dpcd failed %d\n", rc);
> @@ -386,10 +393,65 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>   	return 0;
>   }
>   
> +static u32 dp_panel_link_frequencies(struct device_node *of_node)
> +{
> +	struct device_node *endpoint;
> +	u64 frequency = 0;
> +	int cnt;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> +	if (!endpoint)
> +		return 0;
> +
> +	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
> +
> +	if (cnt > 0)
> +		of_property_read_u64_index(endpoint, "link-frequencies",
> +						cnt - 1, &frequency);
> +	of_node_put(endpoint);
> +
> +	do_div(frequency,
> +		10 * /* from symbol rate to link rate */
> +		1000); /* kbytes */
> +
> +	return frequency;
> +}
> +
> +static int dp_panel_parse_dt(struct dp_panel *dp_panel)
> +{
> +	struct dp_panel_private *panel;
> +	struct device_node *of_node;
> +	int cnt;
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +	of_node = panel->dev->of_node;
> +
> +	/*
> +	 * data-lanes is the property of dp_out endpoint
> +	 */
> +	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
> +	if (cnt < 0) {
> +		/* legacy code, data-lanes is the property of mdss_dp node */
> +		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> +	}
> +
> +	if (cnt > 0)
> +		dp_panel->max_dp_lanes = cnt;
> +	else
> +		dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +
> +	dp_panel->max_dp_link_rate = dp_panel_link_frequencies(of_node);
> +	if (!dp_panel->max_dp_link_rate)
> +		dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
> +
> +	return 0;
> +}
> +
>   struct dp_panel *dp_panel_get(struct dp_panel_in *in)
>   {
>   	struct dp_panel_private *panel;
>   	struct dp_panel *dp_panel;
> +	int ret;
>   
>   	if (!in->dev || !in->catalog || !in->aux || !in->link) {
>   		DRM_ERROR("invalid input\n");
> @@ -408,6 +470,10 @@ struct dp_panel *dp_panel_get(struct dp_panel_in *in)
>   	dp_panel = &panel->dp_panel;
>   	dp_panel->max_bw_code = DP_LINK_BW_8_1;
>   
> +	ret = dp_panel_parse_dt(dp_panel);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return dp_panel;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 2d0dd4353cdf..aa135d5cedbd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -24,56 +24,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   	return 0;
>   }
>   
> -static u32 dp_parser_link_frequencies(struct device_node *of_node)
> -{
> -	struct device_node *endpoint;
> -	u64 frequency = 0;
> -	int cnt;
> -
> -	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> -	if (!endpoint)
> -		return 0;
> -
> -	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
> -
> -	if (cnt > 0)
> -		of_property_read_u64_index(endpoint, "link-frequencies",
> -						cnt - 1, &frequency);
> -	of_node_put(endpoint);
> -
> -	do_div(frequency,
> -		10 * /* from symbol rate to link rate */
> -		1000); /* kbytes */
> -
> -	return frequency;
> -}
> -
> -static int dp_parser_misc(struct dp_parser *parser)
> -{
> -	struct device_node *of_node = parser->pdev->dev.of_node;
> -	int cnt;
> -
> -	/*
> -	 * data-lanes is the property of dp_out endpoint
> -	 */
> -	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
> -	if (cnt < 0) {
> -		/* legacy code, data-lanes is the property of mdss_dp node */
> -		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> -	}
> -
> -	if (cnt > 0)
> -		parser->max_dp_lanes = cnt;
> -	else
> -		parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> -
> -	parser->max_dp_link_rate = dp_parser_link_frequencies(of_node);
> -	if (!parser->max_dp_link_rate)
> -		parser->max_dp_link_rate = DP_LINK_RATE_HBR2;
> -
> -	return 0;
> -}
> -
>   int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
>   {
>   	struct platform_device *pdev = parser->pdev;
> @@ -101,10 +51,6 @@ static int dp_parser_parse(struct dp_parser *parser)
>   	if (rc)
>   		return rc;
>   
> -	rc = dp_parser_misc(parser);
> -	if (rc)
> -		return rc;
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 7306768547a6..21a66932e35e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -11,8 +11,6 @@
>   #include "msm_drv.h"
>   
>   #define DP_MAX_PIXEL_CLK_KHZ	675000
> -#define DP_MAX_NUM_DP_LANES	4
> -#define DP_LINK_RATE_HBR2	540000 /* kbytes */
>   
>   /**
>    * struct dp_parser - DP parser's data exposed to clients
> @@ -23,8 +21,6 @@
>   struct dp_parser {
>   	struct platform_device *pdev;
>   	struct phy *phy;
> -	u32 max_dp_lanes;
> -	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
>   };
>   
>
