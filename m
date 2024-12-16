Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C49F3BA0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 21:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9938910E60E;
	Mon, 16 Dec 2024 20:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="O1R3Tvw6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0685010E60E;
 Mon, 16 Dec 2024 20:52:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIwdNl010436;
 Mon, 16 Dec 2024 20:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JeHhNvzCpbNEp1a2ew77ggNizxztZaVSKeqIIBHvoYU=; b=O1R3Tvw624bdw5j4
 xeqVNy11fQ1c3RKDsuinxXFZyE8M5xxTHk2OXQhx9WbdeuMBneJpGseFJs9EcWQj
 /J9rmRMMqdTIFpy82GacY59jpCQZgR46dlcy0IlHFkJ0ARIBaMaXlXZtQZ9iMFai
 EKNfMzjgth3ab8Ny7aKtSH9YIThPfaa11U/D+ajMWRFUgAVB79RVxnO1fAo+W9Bl
 OTfv2uiMzOkH01i63qf4Rfl2UNY8yykDnfNJl3ONAd+A3eEQegjDE9+bTvRwGfsN
 5w0yYygqRVzGda8P+5zedI4yhGM51ms093+Qg5tHGw8brxT77WdtAw6QMMRbbriE
 7vb8Pg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsy707ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 20:52:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGKqCZg011299
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 20:52:12 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 12:52:10 -0800
Message-ID: <5a3f1bd2-436f-4886-90b5-bec205692fb1@quicinc.com>
Date: Mon, 16 Dec 2024 12:52:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/16] drm/msm/dp: read hw revision only once
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>
CC: Douglas Anderson <dianders@chromium.org>, Stephen Boyd
 <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-15-f8d1961cf22f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-15-f8d1961cf22f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: krWvG6pfq1uq6wWLboM1mtjGHZw6vEom
X-Proofpoint-GUID: krWvG6pfq1uq6wWLboM1mtjGHZw6vEom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160172
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



On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> There is little point in rereading DP controller revision over and over
> again. Read it once, after the first software reset and propagate it to
> the dp_panel module.
> 

Good idea, can be posted even separately in front of the catalog rework 
as it fits in nicely even with current model.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 13 -------------
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  3 ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 +++++++++---
>   drivers/gpu/drm/msm/dp/dp_panel.c   |  3 +--
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>   5 files changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 2992a0df262e9ab167a21a270d1aa8fd1383033d..84adf3a38e4cf0619b15850c31416f1e67049a42 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -42,19 +42,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
>   				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
>   }
>   
> -/**
> - * msm_dp_catalog_hw_revision() - retrieve DP hw revision
> - *
> - * @msm_dp_catalog: DP catalog structure
> - *
> - * Return: DP controller hw revision
> - *
> - */
> -u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
> -{
> -	return msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
> -}
> -
>   static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
>   {
>   	struct resource *res;
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 310319619242df5fa0d91c89fbcc477f16c130ea..ddbae0fcf5fc428b2d37cd1eab1d5860a2f11a50 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -95,9 +95,6 @@ static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
>   /* Debug module */
>   void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
>   
> -/* DP Controller APIs */
> -u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
> -
>   struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
>   
>   #endif /* _DP_CATALOG_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index b15b7ba599e29c4edd746e9c2a8bf2f4a8eedf15..60dbf7eab3fd184bc12035d267abb3758cce9f89 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -131,6 +131,8 @@ struct msm_dp_ctrl_private {
>   	struct completion psr_op_comp;
>   	struct completion video_comp;
>   
> +	u32 hw_revision;
> +
>   	bool core_clks_on;
>   	bool link_clks_on;
>   	bool stream_clks_on;
> @@ -173,6 +175,11 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
>   
>   	sw_reset &= ~DP_SW_RESET;
>   	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
> +
> +	if (!ctrl->hw_revision) {
> +		ctrl->hw_revision = msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
> +		ctrl->panel->hw_revision = ctrl->hw_revision;
> +	}
>   }
>   
>   static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
> @@ -307,12 +314,11 @@ static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
>   static void msm_dp_setup_peripheral_flush(struct msm_dp_ctrl_private *ctrl)
>   {
>   	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
> -	u32 mainlink_ctrl, hw_revision;
> +	u32 mainlink_ctrl;
>   
>   	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
>   
> -	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
> -	if (hw_revision >= DP_HW_VERSION_1_2)
> +	if (ctrl->hw_revision >= DP_HW_VERSION_1_2)
>   		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
>   	else
>   		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 3441c28e3ce332bfe932d7adee7f0ecbaa486c2e..969d618c909876fd7a13aeb6e6c9e117071bc682 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -380,9 +380,8 @@ static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct
>   
>   static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
>   {
> -	u32 hw_revision;
> +	u32 hw_revision = panel->msm_dp_panel.hw_revision;
>   
> -	hw_revision = msm_dp_catalog_hw_revision(panel->catalog);
>   	if (hw_revision >= DP_HW_VERSION_1_0 &&
>   	    hw_revision < DP_HW_VERSION_1_2) {
>   		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 8dde55b3a5ab64c0c12d69cb2dd5b5c733c83432..c348417bb07f33efdf1402a73c27ff99e394e5a3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -38,6 +38,7 @@ struct msm_dp_panel {
>   	struct msm_dp_panel_psr psr_cap;
>   	bool video_test;
>   	bool vsc_sdp_supported;
> +	u32 hw_revision;
>   
>   	u32 max_dp_lanes;
>   	u32 max_dp_link_rate;
> 
