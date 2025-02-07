Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B00A2B7B0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 02:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0AF10E9C9;
	Fri,  7 Feb 2025 01:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ANR5JBAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF6B10E9C9;
 Fri,  7 Feb 2025 01:15:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516IgRqq023487;
 Fri, 7 Feb 2025 01:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3zCcURTfRTkTC8oNeNdBG4cgbbMOwAAh39PmoiCfiuI=; b=ANR5JBAJfDE/rVLF
 Me9Y0aSbg129UIYRlQYE+sTr9inzM/RLi8iIGNwE7QhWH0ql0t94jArvk+bniLpY
 nhGsocUMB+0yWJXy9tn4SEJhar9OTLy4flbgio/98/8MOVCCWhojkqmYing4rSQA
 jqz1/i4b7s4MDvZ8bcQ4QlOlgCRolUaACA4vjcuWKrdZ+wYsWhvEk1WnJ3/ouIV5
 E7bXpjLO24lvptdilzvq7+1Amg8qsAdziC9BZMd0CNjEHeOGeBhxOeWpkbY01IUd
 cnr8CyYVCDX2RorvzCiBxsxboy+wGNXsf4yEZ/RMw9flKRZ59lC8QblHX8mtmJEa
 u3De0Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n2kkrrj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Feb 2025 01:14:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5171EvPV024354
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Feb 2025 01:14:57 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 17:14:57 -0800
Message-ID: <d08bcaf3-01a1-4ab8-a4b5-c5120fc727fa@quicinc.com>
Date: Thu, 6 Feb 2025 17:14:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/15] drm/msm/dpu: configure DSC per number in use
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-3-9701a16340da@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-3-9701a16340da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: esXVvIXk1w4f3Ok7T9OJYd4fc7RRp4G5
X-Proofpoint-ORIG-GUID: esXVvIXk1w4f3Ok7T9OJYd4fc7RRp4G5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070007
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



On 1/17/2025 8:00 AM, Jun Nie wrote:
> Currently if DSC support is requested, the driver only supports using
> 2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
> configure DSC engines in use, instead of the maximum number of DSC
> engines.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c734d2c5790d2..5b98ae96bf5d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2027,11 +2027,11 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>   static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   				 struct drm_dsc_config *dsc)
>   {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
>   	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>   	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	int num_dsc = dpu_enc->num_dscs;
>   	int this_frame_slices;
>   	int intf_ip_w, enc_ip_w;
>   	int dsc_common_mode;
> @@ -2039,7 +2039,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	u32 initial_lines;
>   	int i;
>   
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +	for (i = 0; i < num_dsc; i++) {
>   		hw_pp[i] = dpu_enc->hw_pp[i];
>   		hw_dsc[i] = dpu_enc->hw_dsc[i];
>   
> @@ -2068,7 +2068,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	enc_ip_w = intf_ip_w / 2;
>   	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>   
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i = 0; i < num_dsc; i++)
>   		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
>   					 dsc, dsc_common_mode, initial_lines);
>   }
> 
> -- 
> 2.34.1
> 

