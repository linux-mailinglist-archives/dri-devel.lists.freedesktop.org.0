Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F36067466A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 23:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B4A10E280;
	Thu, 19 Jan 2023 22:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EB010E280;
 Thu, 19 Jan 2023 22:54:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30JLpARG016061; Thu, 19 Jan 2023 22:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NIYQYElbAUGqiT8yCF2DhxDCLyd/qkQ2Bwi98kWDv+8=;
 b=n9fCmVbfYBg4p4FKGIY+IrGjyIjI5i66fR1n0NCxmYTMiSAp0Liao0T3U4KfJd8NDSQ2
 r+JpqPXY4YavuvPWwU+jYAUE0AsO/bYOI05i8jqXzhoK48Frfy7ouLpM5n4KBuh206wq
 Ga+POEeRswbm9OxN150iE7+zJor8sdAKCXa5WkqZxHMrNZEVeZTxFhKfzncWiKEymW0J
 +75q0tv/xUR6D1WRxskJaFx0MvsgdjHW3MHfT0XaxJcugWpv+oTGf6EX+MvHNWIYmpqd
 K0weIv4MgsOFynwNVuLdWJCASx8BUxuW8Wj3mcvAaAbfNF6Hv1kJPnRqI72Al5BosWu6 Ag== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n7593sc3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 22:54:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30JMshL1028487
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 22:54:43 GMT
Received: from [10.110.69.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 14:54:43 -0800
Message-ID: <2a5c8934-a479-6ea7-4236-9e156e26b29a@quicinc.com>
Date: Thu, 19 Jan 2023 14:54:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/3] drm/msm/mdss: convert UBWC setup to use match data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
 <20230118010428.1671443-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230118010428.1671443-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ukCx1ZU5cKgz9cSkCENPifZfCg32lSiH
X-Proofpoint-ORIG-GUID: ukCx1ZU5cKgz9cSkCENPifZfCg32lSiH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_14,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301190194
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/17/2023 5:04 PM, Dmitry Baryshkov wrote:
> To simplify adding new platforms and to make settings more obvious,
> rewrite the UBWC setup to use the data structure to pass platform config
> rather than just calling the functions direcly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I was reviewing this series and 
https://patchwork.freedesktop.org/series/111732/ together.

More I think about it, it seems like we are duplicating the same values 
here and in the catalog.

Yes, these two are different drivers.

But now that you are adding the UBWC entries here using the compatible 
string so you are creating something like a "catalog" here.

In that case, why dont we remove the entries from dpu catalog and in the 
DPU driver get the parent's match data as we know that the msm_mdss is 
the parent of DPU driver

Let me know your thoughts.

> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 181 +++++++++++++++++++--------------
>   1 file changed, 105 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 02646e4bb4cd..799672b88716 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -16,9 +16,6 @@
>   #include "msm_drv.h"
>   #include "msm_kms.h"
>   
> -/* for DPU_HW_* defines */
> -#include "disp/dpu1/dpu_hw_catalog.h"
> -
>   #define HW_REV				0x0
>   #define HW_INTR_STATUS			0x0010
>   
> @@ -29,6 +26,16 @@
>   
>   #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
>   
> +struct msm_mdss_data {
> +	u32 ubwc_version;
> +	/* can be read from register 0x58 */
> +	u32 ubwc_dec_version;
> +	u32 ubwc_swizzle;
> +	u32 ubwc_static;
> +	u32 highest_bank_bit;
> +	u32 macrotile_mode;
> +};
> +
>   struct msm_mdss {
>   	struct device *dev;
>   
> @@ -40,6 +47,7 @@ struct msm_mdss {
>   		unsigned long enabled_mask;
>   		struct irq_domain *domain;
>   	} irq_controller;
> +	const struct msm_mdss_data *mdss_data;
>   	struct icc_path *path[2];
>   	u32 num_paths;
>   };
> @@ -182,46 +190,40 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
>   #define UBWC_3_0 0x30000000
>   #define UBWC_4_0 0x40000000
>   
> -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
> -				       u32 ubwc_static)
> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
>   {
> -	writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
> +	const struct msm_mdss_data *data = msm_mdss->mdss_data;
> +
> +	writel_relaxed(data->ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>   }
>   
> -static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
> -				       unsigned int ubwc_version,
> -				       u32 ubwc_swizzle,
> -				       u32 highest_bank_bit,
> -				       u32 macrotile_mode)
> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
>   {
> -	u32 value = (ubwc_swizzle & 0x1) |
> -		    (highest_bank_bit & 0x3) << 4 |
> -		    (macrotile_mode & 0x1) << 12;
> +	const struct msm_mdss_data *data = msm_mdss->mdss_data;
> +	u32 value = (data->ubwc_swizzle & 0x1) |
> +		    (data->highest_bank_bit & 0x3) << 4 |
> +		    (data->macrotile_mode & 0x1) << 12;
>   
> -	if (ubwc_version == UBWC_3_0)
> +	if (data->ubwc_version == UBWC_3_0)
>   		value |= BIT(10);
>   
> -	if (ubwc_version == UBWC_1_0)
> +	if (data->ubwc_version == UBWC_1_0)
>   		value |= BIT(8);
>   
>   	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>   }
>   
> -static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
> -				       unsigned int ubwc_version,
> -				       u32 ubwc_swizzle,
> -				       u32 ubwc_static,
> -				       u32 highest_bank_bit,
> -				       u32 macrotile_mode)
> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>   {
> -	u32 value = (ubwc_swizzle & 0x7) |
> -		    (ubwc_static & 0x1) << 3 |
> -		    (highest_bank_bit & 0x7) << 4 |
> -		    (macrotile_mode & 0x1) << 12;
> +	const struct msm_mdss_data *data = msm_mdss->mdss_data;
> +	u32 value = (data->ubwc_swizzle & 0x7) |
> +		    (data->ubwc_static & 0x1) << 3 |
> +		    (data->highest_bank_bit & 0x7) << 4 |
> +		    (data->macrotile_mode & 0x1) << 12;
>   
>   	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>   
> -	if (ubwc_version == UBWC_3_0) {
> +	if (data->ubwc_version == UBWC_3_0) {
>   		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
>   		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
>   	} else {
> @@ -233,7 +235,6 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
>   static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   {
>   	int ret;
> -	u32 hw_rev;
>   
>   	/*
>   	 * Several components have AXI clocks that can only be turned on if
> @@ -249,57 +250,36 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   	}
>   
>   	/*
> -	 * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
> -	 * mdp5 hardware. Skip reading it for now.
> +	 * Register access requires MDSS_MDP_CLK, which is not enabled by the
> +	 * mdss on mdp5 hardware. Skip it for now.
>   	 */
> -	if (msm_mdss->is_mdp5)
> +	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
>   		return 0;
>   
> -	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
> -	dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
> -	dev_dbg(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
> -		readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
> -
>   	/*
>   	 * ubwc config is part of the "mdss" region which is not accessible
>   	 * from the rest of the driver. hardcode known configurations here
>   	 *
>   	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
> -	 * UBWC_n and the rest of params comes from hw_catalog.
> -	 * Unforunately this driver can not access hw catalog, so we have to
> -	 * hardcode them here.
> +	 * UBWC_n and the rest of params comes from hw data.
>   	 */
> -	switch (hw_rev) {
> -	case DPU_HW_VER_500:
> -	case DPU_HW_VER_501:
> -		msm_mdss_setup_ubwc_dec_30(msm_mdss, UBWC_3_0, 0, 2, 0);
> -		break;
> -	case DPU_HW_VER_600:
> -		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
> -		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
> +	switch (msm_mdss->mdss_data->ubwc_dec_version) {
> +	case UBWC_2_0:
> +		msm_mdss_setup_ubwc_dec_20(msm_mdss);
>   		break;
> -	case DPU_HW_VER_620:
> -		/* UBWC_2_0 */
> -		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
> +	case UBWC_3_0:
> +		msm_mdss_setup_ubwc_dec_30(msm_mdss);
>   		break;
> -	case DPU_HW_VER_630:
> -		/* UBWC_2_0 */
> -		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
> +	case UBWC_4_0:
> +		msm_mdss_setup_ubwc_dec_40(msm_mdss);
>   		break;
> -	case DPU_HW_VER_700:
> -		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
> -		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
> -		break;
> -	case DPU_HW_VER_720:
> -		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
> -		break;
> -	case DPU_HW_VER_800:
> -		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
> -		break;
> -	case DPU_HW_VER_810:
> -	case DPU_HW_VER_900:
> -		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
> -		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
> +	default:
> +		dev_err(msm_mdss->dev, "Unuspported UBWC decoder version %x\n",
> +			msm_mdss->mdss_data->ubwc_dec_version);
> +		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
> +			readl_relaxed(msm_mdss->mmio + HW_REV));
> +		dev_err(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
> +			readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));

Why do you still have these register reads in default?
If the purpose was to catch any missed chipsets, that would not be 
possible right? Because that means the compat table entry is missing for 
this in that case the msm_mdss driver wont probe.


>   		break;
>   	}
>   
> @@ -490,6 +470,8 @@ static int mdss_probe(struct platform_device *pdev)
>   	if (IS_ERR(mdss))
>   		return PTR_ERR(mdss);
>   
> +	mdss->mdss_data = of_device_get_match_data(&pdev->dev);
> +
>   	platform_set_drvdata(pdev, mdss);
>   
>   	/*
> @@ -519,21 +501,68 @@ static int mdss_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct msm_mdss_data sc7180_data = {
> +	.ubwc_version = UBWC_2_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_static = 0x1e,
> +};
> +
> +static const struct msm_mdss_data sc7280_data = {
> +	.ubwc_version = UBWC_3_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 1,
> +	.macrotile_mode = 1,
> +};
> +
> +static const struct msm_mdss_data sc8280xp_data = {
> +	.ubwc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 2,
> +	.macrotile_mode = 1,
> +};
> +
> +static const struct msm_mdss_data sm8150_data = {
> +	.ubwc_version = UBWC_3_0,
> +	.ubwc_dec_version = UBWC_3_0,
> +	.highest_bank_bit = 2,
> +};
> +
> +static const struct msm_mdss_data sm6115_data = {
> +	.ubwc_version = UBWC_1_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = 7,
> +	.ubwc_static = 0x11f,
> +};
> +
> +static const struct msm_mdss_data sm8250_data = {
> +	.ubwc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
> +	.highest_bank_bit = 3,
> +	.macrotile_mode = 1,
> +};
> +
>   static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,mdss" },
>   	{ .compatible = "qcom,msm8998-mdss" },
>   	{ .compatible = "qcom,qcm2290-mdss" },
>   	{ .compatible = "qcom,sdm845-mdss" },
> -	{ .compatible = "qcom,sc7180-mdss" },
> -	{ .compatible = "qcom,sc7280-mdss" },
> +	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
> +	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
>   	{ .compatible = "qcom,sc8180x-mdss" },
> -	{ .compatible = "qcom,sc8280xp-mdss" },
> -	{ .compatible = "qcom,sm6115-mdss" },
> -	{ .compatible = "qcom,sm8150-mdss" },
> -	{ .compatible = "qcom,sm8250-mdss" },
> -	{ .compatible = "qcom,sm8350-mdss" },
> -	{ .compatible = "qcom,sm8450-mdss" },
> -	{ .compatible = "qcom,sm8550-mdss" },
> +	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
> +	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
> +	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
> +	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
> +	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
> +	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
> +	{ .compatible = "qcom,sm8550-mdss", .data = &sm8250_data },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mdss_dt_match);
