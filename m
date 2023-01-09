Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8916630CE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 20:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C83010E4FC;
	Mon,  9 Jan 2023 19:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F0710E46F;
 Mon,  9 Jan 2023 19:53:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309I0Olc002747; Mon, 9 Jan 2023 19:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=BsKoK0n9STAXNwEy2ibJLcjlgS2urZlDHlazpFvPQWg=;
 b=NxOKg/DQ1gA6l8mBfAN/jK33Nb8/R8Am3bhr7+ablJt9byXwLMYrdlw2PflmLf9sX/mF
 A0rODpj2QPBSzVYfokTdlGQ14DHTP94hoU2WpVYY1bvQ+SmwerVnjVrPKHeyYA++vX7D
 JcwSBXa+Y3P2jukdAx9IHIixhEp6185oQZxQicBrYBaw2dAAC1JmjJQKdDKT0OYG1HS8
 ry8X6EoEblMibqSRAQzQtgQYS2Ky6aPr+tENERd3IVUtLjU8WI8vfA7vAkR4PkvsBbxl
 x8P477Jpv0zFFu58BRdbJVImfEuebxPRMV2rEtLbjZx1j1njnCOR0pwC/jw/dmBXTsAd Uw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n0q28gadp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 19:53:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 309JrIEq017079
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jan 2023 19:53:18 GMT
Received: from [10.110.115.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 11:53:17 -0800
Message-ID: <047cd859-7141-d52f-4989-847fd2ada002@quicinc.com>
Date: Mon, 9 Jan 2023 11:53:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 1/4] drm/msm/mdss: convert UBWC setup to use match data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221208000850.312548-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oCgNUmqEkfq-i5ZecNl5EmzFZB385Gap
X-Proofpoint-GUID: oCgNUmqEkfq-i5ZecNl5EmzFZB385Gap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_14,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090140
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



On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
> To simplify adding new platforms and to make settings more obvious,
> rewrite the UBWC setup to use the data structure to pass platform config
> rather than just calling the functions direcly.

Why not use the catalog to store this information rather than using the 
platform device match data?

This seems more appropriate for the catalog.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 158 ++++++++++++++++++++-------------
>   1 file changed, 94 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 92773e0a8fda..2219c1bd59a9 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -29,6 +29,14 @@
>   
>   #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
>   
> +struct msm_mdss_data {
> +	u32 ubwc_version;
> +	u32 ubwc_swizzle;
> +	u32 ubwc_static;
> +	u32 highest_bank_bit;
> +	u32 macrotile_mode;
> +};
> +
>   struct msm_mdss {
>   	struct device *dev;
>   
> @@ -40,6 +48,7 @@ struct msm_mdss {
>   		unsigned long enabled_mask;
>   		struct irq_domain *domain;
>   	} irq_controller;
> +	const struct msm_mdss_data *mdss_data;
>   	struct icc_path *path[2];
>   	u32 num_paths;
>   };
> @@ -180,46 +189,40 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
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
> @@ -232,6 +235,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   {
>   	int ret;
>   	u32 hw_rev;
> +	u32 ubwc_dec_hw_version;
>   
>   	/*
>   	 * Several components have AXI clocks that can only be turned on if
> @@ -250,53 +254,36 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   	 * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
>   	 * mdp5 hardware. Skip reading it for now.
>   	 */
> -	if (msm_mdss->is_mdp5)
> +	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
>   		return 0;
>   
>   	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
>   	dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
> +
> +	ubwc_dec_hw_version = readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION);
>   	dev_dbg(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
> -		readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
> +		ubwc_dec_hw_version);
>   
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
> -		break;
> -	case DPU_HW_VER_620:
> -		/* UBWC_2_0 */
> -		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
> +	switch (ubwc_dec_hw_version) {
> +	case UBWC_2_0:
> +		msm_mdss_setup_ubwc_dec_20(msm_mdss);
>   		break;
> -	case DPU_HW_VER_630:
> -		/* UBWC_2_0 */
> -		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
> +	case UBWC_3_0:
> +		msm_mdss_setup_ubwc_dec_30(msm_mdss);
>   		break;
> -	case DPU_HW_VER_700:
> -		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
> -		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
> +	case UBWC_4_0:
> +		msm_mdss_setup_ubwc_dec_40(msm_mdss);
>   		break;
> -	case DPU_HW_VER_720:
> -		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
> -		break;
> -	case DPU_HW_VER_800:
> -		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
> -		break;
> -	case DPU_HW_VER_810:
> -		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
> -		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
> +	default:
> +		dev_err(msm_mdss->dev, "Unuspported UBWC decoder version %x\n",
> +			ubwc_dec_hw_version);
>   		break;
>   	}
>   
> @@ -487,6 +474,8 @@ static int mdss_probe(struct platform_device *pdev)
>   	if (IS_ERR(mdss))
>   		return PTR_ERR(mdss);
>   
> +	mdss->mdss_data = of_device_get_match_data(&pdev->dev);
> +
>   	platform_set_drvdata(pdev, mdss);
>   
>   	/*
> @@ -516,20 +505,61 @@ static int mdss_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct msm_mdss_data sc7180_data = {
> +	.ubwc_version = UBWC_2_0,
> +	.ubwc_static = 0x1e,
> +};
> +
> +static const struct msm_mdss_data sc7280_data = {
> +	.ubwc_version = UBWC_3_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 1,
> +	.macrotile_mode = 1,
> +};
> +
> +static const struct msm_mdss_data sc8280xp_data = {
> +	.ubwc_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 2,
> +	.macrotile_mode = 1,
> +};
> +
> +static const struct msm_mdss_data sm8150_data = {
> +	.ubwc_version = UBWC_3_0,
> +	.highest_bank_bit = 2,
> +};
> +
> +static const struct msm_mdss_data sm6115_data = {
> +	.ubwc_version = UBWC_2_0,
> +	.ubwc_swizzle = 7,
> +	.ubwc_static = 0x11f,
> +};
> +
> +static const struct msm_mdss_data sm8250_data = {
> +	.ubwc_version = UBWC_4_0,
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
> +	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
> +	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
> +	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
> +	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
> +	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
> +	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mdss_dt_match);
