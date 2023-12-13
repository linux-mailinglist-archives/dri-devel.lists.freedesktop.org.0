Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1785812078
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DB610E860;
	Wed, 13 Dec 2023 21:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C88110E84F;
 Wed, 13 Dec 2023 21:14:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDKbH97030351; Wed, 13 Dec 2023 21:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=BvSMcbdOF0Q8Qy2PSYnob81Y/mDTnEbFt4gOutxzRSU=; b=YS
 IOQD05+nnfN5XvfLeAp4342p7oLdqOr5yKzwTPy9OaKssgIr5oU2H84Z5mHpybtE
 9nT2rC6nAcGGH0LiZFcEMaDPrdOwEVdFzmaq6p+l6HQD8wCXsgsEHespoJ2U8CUB
 mWAadwhUwtmpGQQHq+EH1k+33rSl2xtGei2R+BHPa/yw3rtyGBas7aaUso5a5hx/
 YyY5yYIBPJg39xCP44Naz4EzQxEXxUwS80lL5mHx11bsGDzKQ/li9wjnqhPQ/jWT
 uyrDXh8Rrh6yRHM++iAF2HtPWgvslY8rB/lVlwSKam9ITcraxRsnUIBtEUhjf/yC
 QAFuvptYWfGsxxT0RTiQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy3ywagg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:13:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDLDusH002143
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:13:56 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 13:13:55 -0800
Message-ID: <326e0a30-0d64-430c-ff58-ce6ce037000a@quicinc.com>
Date: Wed, 13 Dec 2023 13:13:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFT PATCH v2 1/4] drm/msm/dpu: enable writeback on SM8150
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
 <20231203003203.1293087-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231203003203.1293087-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: liwk7l-To3Wtt4w1KDMRWVbJOJGQ0Ewo
X-Proofpoint-ORIG-GUID: liwk7l-To3Wtt4w1KDMRWVbJOJGQ0Ewo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=956
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130150
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



On 12/2/2023 4:32 PM, Dmitry Baryshkov wrote:
> Enable WB2 hardware block, enabling writeback support on this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 9392ad2b4d3f..62deedb206b4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
>   		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
>   		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
>   		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
>   	},
>   };
>   
> @@ -291,6 +292,21 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
>   	},
>   };
>   
> +static const struct dpu_wb_cfg sm8150_wb[] = {
> +	{
> +		.name = "wb_2", .id = WB_2,
> +		.base = 0x65000, .len = 0x2c8,
> +		.features = WB_SDM845_MASK,
> +		.format_list = wb2_formats,
> +		.num_formats = ARRAY_SIZE(wb2_formats),

This should now be wb2_formats_rgb.

With that fixed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> +		.clk_ctrl = DPU_CLK_CTRL_WB2,
> +		.xin_id = 6,
> +		.vbif_idx = VBIF_RT,
> +		.maxlinewidth = 4096,
> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +	},
> +};
> +
>   static const struct dpu_intf_cfg sm8150_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
> @@ -385,6 +401,8 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
>   	.pingpong = sm8150_pp,
>   	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
>   	.merge_3d = sm8150_merge_3d,
> +	.wb_count = ARRAY_SIZE(sm8150_wb),
> +	.wb = sm8150_wb,
>   	.intf_count = ARRAY_SIZE(sm8150_intf),
>   	.intf = sm8150_intf,
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
