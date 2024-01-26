Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CD83E521
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F275210FF47;
	Fri, 26 Jan 2024 22:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD29D10FF44;
 Fri, 26 Jan 2024 22:20:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QLOqGh018717; Fri, 26 Jan 2024 22:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=/gDSIvx9G1bjUJn9pHOOWZvssbdUdEo1h+Nm4WdtZRw=; b=SI
 ouHETUQSiGAc+6cXPewSAHdEkn+Icd5mI1QP6TByMB2nlOBX1fZsS9fixRGdKyP3
 TGjCKTTI7hdU90/0O+UsnnnLMKJ0UhZ6ugqs2KsqU1RsdRtrY9cOoqtl8EMhAqnj
 dMuWou/4Ses+XCw4Tb2UdzaRwztACoVUq8aPSbjfad8bJivxmIwc9OWqvxr9XIl3
 pp2Ms7YBIOxv2IbCGMwCkZ+1jGLuTDGliTEMp0V4hcV00QOf85wDcC+a/KUC6c+n
 kIVRZng6eOgtMt/cPMTQzYUQmjHGhZl5AKhEMW7IFFKwgky9ZaIGyombgQIV8urb
 QeVxQBAm9LgUKv6Tj0Wg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvmmmg2ss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:20:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMK98G000508
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:20:09 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:20:08 -0800
Message-ID: <e7db1b7b-d87a-8ce9-61b9-9a7e3030ac81@quicinc.com>
Date: Fri, 26 Jan 2024 14:20:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 04/15] drm/msm/dp: inline dp_power_(de)init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-4-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-4-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: aoFHHNLsNpJTsLt71AKDmKPc8l4rRs2N
X-Proofpoint-ORIG-GUID: aoFHHNLsNpJTsLt71AKDmKPc8l4rRs2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
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
> In preparation to cleanup of the dp_power module, inline dp_power_init()
> and dp_power_deinit() functions, which are now just turning the clocks
> on and off.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
>   drivers/gpu/drm/msm/dp/dp_power.c   | 10 ----------
>   drivers/gpu/drm/msm/dp/dp_power.h   | 21 ---------------------
>   3 files changed, 2 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 67b48f0a6c83..8cd18705740f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -434,7 +434,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized);
>   
> -	dp_power_init(dp->power);
> +	dp_power_clk_enable(dp->power, DP_CORE_PM, true);
>   	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>   	dp_aux_init(dp->aux);
>   	dp->core_initialized = true;
> @@ -448,7 +448,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>   
>   	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>   	dp_aux_deinit(dp->aux);
> -	dp_power_deinit(dp->power);
> +	dp_power_clk_enable(dp->power, DP_CORE_PM, false);
>   	dp->core_initialized = false;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index b095a5b47c8b..f49e3aede308 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -152,16 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
>   	return dp_power_clk_init(power);
>   }
>   
> -int dp_power_init(struct dp_power *dp_power)
> -{
> -	return dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> -}
> -
> -int dp_power_deinit(struct dp_power *dp_power)
> -{
> -	return dp_power_clk_enable(dp_power, DP_CORE_PM, false);
> -}
> -
>   struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
>   {
>   	struct dp_power_private *power;
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
> index 55ada51edb57..eb836b5aa24a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.h
> +++ b/drivers/gpu/drm/msm/dp/dp_power.h
> @@ -22,27 +22,6 @@ struct dp_power {
>   	bool stream_clks_on;
>   };
>   
> -/**
> - * dp_power_init() - enable power supplies for display controller
> - *
> - * @power: instance of power module
> - * return: 0 if success or error if failure.
> - *
> - * This API will turn on the regulators and configures gpio's
> - * aux/hpd.
> - */
> -int dp_power_init(struct dp_power *power);
> -
> -/**
> - * dp_power_deinit() - turn off regulators and gpios.
> - *
> - * @power: instance of power module
> - * return: 0 for success
> - *
> - * This API turns off power and regulators.
> - */
> -int dp_power_deinit(struct dp_power *power);
> -
>   /**
>    * dp_power_clk_status() - display controller clocks status
>    *
>
