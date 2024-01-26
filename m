Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41683E54D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B231010FF5B;
	Fri, 26 Jan 2024 22:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E88310FF5B;
 Fri, 26 Jan 2024 22:23:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QLo2CU002749; Fri, 26 Jan 2024 22:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=zsfF060z+C8IPyjCtdSoEZWPCy6Jh+soVurRuVacMVQ=; b=Bj
 r1d/vEBgtjeKUPXgkY+4K/ieVVwFxb5qtRfbcUfZYExHPjeDDhC61k52Np9nFs/w
 O43S4P60KDVZs7UIAMNrBHVGhFFALY8CN5wQ7BIDW3icVTqo2GR+AtO4TSga7MqC
 kvgnJUNs49uBu3/HbFA3pqodQjAvu9bewn4mvpeM8qWz3A9ljxcIe9NGpmwOFg+V
 8WxjjJjIVqPnjUbepny/BLby5lcieeAf22hj4a6nhogFH5dsv1ctbYfeJxjipvYm
 ekFgvm2c9cHaK4K12m9SxCBIBWM2Dox7Hf/zHC047YKSQN/oScDMuyhgwjxepJop
 srmsZ+l98/TkmK5ewo/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvgp2gm2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:23:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMNm4V007057
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:23:48 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:23:47 -0800
Message-ID: <edfc04f2-d7d5-0d04-6c8d-4f17f9bb6a32@quicinc.com>
Date: Fri, 26 Jan 2024 14:23:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 11/15] drm/msm/dp: handle PHY directly in dp_ctrl
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-11-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-11-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vWoxqoZxj-9kBLD3VQUgAm134PcAEiK2
X-Proofpoint-ORIG-GUID: vWoxqoZxj-9kBLD3VQUgAm134PcAEiK2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> There is little point in going trough dp_parser->io indirection each
> time the driver needs to access the PHY. Store the pointer directly in
> dp_ctrl_private.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 37 +++++++++++++------------------------
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>   3 files changed, 16 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 4aea72a2b8e8..fc7ce315ae41 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -76,9 +76,10 @@ struct dp_ctrl_private {
>   	struct drm_dp_aux *aux;
>   	struct dp_panel *panel;
>   	struct dp_link *link;
> -	struct dp_parser *parser;
>   	struct dp_catalog *catalog;
>   
> +	struct phy *phy;
> +
>   	unsigned int num_core_clks;
>   	struct clk_bulk_data *core_clks;
>   
> @@ -1028,7 +1029,7 @@ static int dp_ctrl_set_vx_px(struct dp_ctrl_private *ctrl,
>   	phy_opts->dp.voltage[0] = v_level;
>   	phy_opts->dp.pre[0] = p_level;
>   	phy_opts->dp.set_voltages = 1;
> -	phy_configure(ctrl->parser->io.phy, phy_opts);
> +	phy_configure(ctrl->phy, phy_opts);
>   	phy_opts->dp.set_voltages = 0;
>   
>   	return 0;
> @@ -1442,7 +1443,7 @@ static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
>   static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>   {
>   	int ret = 0;
> -	struct phy *phy = ctrl->parser->io.phy;
> +	struct phy *phy = ctrl->phy;
>   	const u8 *dpcd = ctrl->panel->dpcd;
>   
>   	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
> @@ -1540,12 +1541,10 @@ void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
>   void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
> -	struct dp_io *dp_io;
>   	struct phy *phy;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -	dp_io = &ctrl->parser->io;
> -	phy = dp_io->phy;
> +	phy = ctrl->phy;
>   
>   	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>   	phy_init(phy);
> @@ -1557,12 +1556,10 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>   void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
> -	struct dp_io *dp_io;
>   	struct phy *phy;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -	dp_io = &ctrl->parser->io;
> -	phy = dp_io->phy;
> +	phy = ctrl->phy;
>   
>   	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>   	phy_exit(phy);
> @@ -1587,7 +1584,7 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
>   
>   static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   {
> -	struct phy *phy = ctrl->parser->io.phy;
> +	struct phy *phy = ctrl->phy;
>   	int ret = 0;
>   
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> @@ -1617,11 +1614,9 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   
>   static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   {
> -	struct dp_io *dp_io;
>   	struct phy *phy;
>   
> -	dp_io = &ctrl->parser->io;
> -	phy = dp_io->phy;
> +	phy = ctrl->phy;
>   
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
> @@ -2047,12 +2042,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
> -	struct dp_io *dp_io;
>   	struct phy *phy;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -	dp_io = &ctrl->parser->io;
> -	phy = dp_io->phy;
> +	phy = ctrl->phy;
>   
>   	/* set dongle to D3 (power off) mode */
>   	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
> @@ -2080,12 +2073,10 @@ void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
> -	struct dp_io *dp_io;
>   	struct phy *phy;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -	dp_io = &ctrl->parser->io;
> -	phy = dp_io->phy;
> +	phy = ctrl->phy;
>   
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
> @@ -2103,12 +2094,10 @@ void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
>   void dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
> -	struct dp_io *dp_io;
>   	struct phy *phy;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -	dp_io = &ctrl->parser->io;
> -	phy = dp_io->phy;
> +	phy = ctrl->phy;
>   
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
> @@ -2225,7 +2214,7 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
>   struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>   			struct dp_panel *panel,	struct drm_dp_aux *aux,
>   			struct dp_catalog *catalog,
> -			struct dp_parser *parser)
> +			struct phy *phy)
>   {
>   	struct dp_ctrl_private *ctrl;
>   	int ret;
> @@ -2259,12 +2248,12 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>   	init_completion(&ctrl->video_comp);
>   
>   	/* in parameters */
> -	ctrl->parser   = parser;
>   	ctrl->panel    = panel;
>   	ctrl->aux      = aux;
>   	ctrl->link     = link;
>   	ctrl->catalog  = catalog;
>   	ctrl->dev      = dev;
> +	ctrl->phy      = phy;
>   
>   	ret = dp_ctrl_clk_init(&ctrl->dp_ctrl);
>   	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 023f14d0b021..6e9f375b856a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -28,7 +28,7 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
>   struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>   			struct dp_panel *panel,	struct drm_dp_aux *aux,
>   			struct dp_catalog *catalog,
> -			struct dp_parser *parser);
> +			struct phy *phy);
>   
>   void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
>   void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c1a51c498e01..b8388e04bd0f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -760,7 +760,8 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   	}
>   
>   	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
> -			       dp->catalog, dp->parser);
> +			       dp->catalog,
> +			       dp->parser->io.phy);
>   	if (IS_ERR(dp->ctrl)) {
>   		rc = PTR_ERR(dp->ctrl);
>   		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
>
