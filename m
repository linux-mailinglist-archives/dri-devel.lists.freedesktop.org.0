Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A1A07F9C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 19:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA5D10E387;
	Thu,  9 Jan 2025 18:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XAl8ZRHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955DC10E387;
 Thu,  9 Jan 2025 18:12:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509HIcJr012072;
 Thu, 9 Jan 2025 18:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XVCagzPiLA1PVJsmheaeqLE0blQzAKQzujNTXGqQ9ac=; b=XAl8ZRHKeIQmK4Fh
 CpVLX4ZM5gZf7c425ziM35778Gro83ooABF/5uAQ/PKMxeoRWET8uADgbeubRGXI
 3wJkovC2Qt2TmD/VbEEtcYePdfwQq94aRXLsVTK72EOxgkSFCL7naTzw9iQcWmnX
 453yn7fzja5CR0qtwtp2Z61GOSWcpBkIKLf17do5S/FgR8jYvmwZckWcl6J7shwV
 5HH2iP2BJ3UU3oPin+LlUnHfQApop9BPcvFLMmDI0dA3/TsJtIoSOPUPSTtvbKaA
 5wkfKIvcH56k4Idh8SiV7c+iLpKSC5lpzfITc4GxedaX/BmHJ/W12ncEkqK+U7yh
 AccKbQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442jra83xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 18:12:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509ICJCV007171
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 18:12:19 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 10:12:17 -0800
Message-ID: <98cd0bc9-27f4-4903-996a-86702a2eb96c@quicinc.com>
Date: Thu, 9 Jan 2025 10:12:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] drm/msm/dpu: bind correct pingpong for quad pipe
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-7-92c7c0a228e3@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-7-92c7c0a228e3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -yZu10PsUWRfnEqnkiZvqImUfCIrmEJD
X-Proofpoint-ORIG-GUID: -yZu10PsUWRfnEqnkiZvqImUfCIrmEJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090144
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



On 12/18/2024 11:49 PM, Jun Nie wrote:
> There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
> interface to 3rd PP instead of the 2nd PP.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index fd32ef468d5f9..96d06db3e4be5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1220,7 +1220,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> -	int num_ctl, num_pp, num_dsc;
> +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> +	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
>   	unsigned int dsc_mask = 0;
>   	int i;
>   
> @@ -1275,11 +1276,21 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
>   	}
>   
> +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> +
> +
> +	/*
> +	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
> +	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
> +	 */
> +	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
> +
>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>   		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
>   
> -		phys->hw_pp = dpu_enc->hw_pp[i];
> +		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
>   		if (!phys->hw_pp) {
>   			DPU_ERROR_ENC(dpu_enc,
>   				"no pp block assigned at idx: %d\n", i);
> 
> -- 
> 2.34.1
> 

