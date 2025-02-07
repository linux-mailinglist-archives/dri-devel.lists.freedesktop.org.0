Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB81AA2B7A4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 02:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C010F10E22B;
	Fri,  7 Feb 2025 01:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MSToNk/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BF410E22B;
 Fri,  7 Feb 2025 01:12:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5170DuSq000330;
 Fri, 7 Feb 2025 01:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lE2yEMmOtEjyIM6MRG6Oh2+ovg8fRfWPp5lJJMMrntg=; b=MSToNk/0jToURp6Y
 VQEHp46ClWcr8/iH6ArUCLrDp5ezEB7Q3GacaK3hHfN1UhJtxuVFiC8/Z0rD1jEv
 /d3RUXVa6hZnxBr2Typ2x0aJjIFRZxsD0xjh+08ioz6eE+vUEA57dT7KMVDVc9Ik
 hcqkpxsxi78DHIBPEwXLtwMLspWlxnppzi6fvzoePEMcGTtx1js7+kDPmQEHEVCY
 q2dKAOyD+s420fF13eQF6rnalvKgF4FFWXIMbI4Uu0sJU8rMIJExCIAMuu2Ej9dQ
 /wzbmPpnYiEyn2vXu+xXKS3sb6eJFI6UAlHPWgX4lbOrbpXSVvAFeAcKF3DK8LSB
 Bj0e2g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n7et038v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Feb 2025 01:12:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5171CNSN021634
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Feb 2025 01:12:23 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 17:12:23 -0800
Message-ID: <db2ec4cb-9769-4d76-a8a3-308c83d77602@quicinc.com>
Date: Thu, 6 Feb 2025 17:12:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/15] drm/msm/dpu: Do not fix number of DSC
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-2-9701a16340da@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-2-9701a16340da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: XUMyrgYLEGu86sMivONuV1FqxgQYhqPM
X-Proofpoint-GUID: XUMyrgYLEGu86sMivONuV1FqxgQYhqPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502070007
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
> Currently, if DSC is enabled, only 2 DSC engines are supported so far.
> More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
> get the real number of DSCs to decide whether DSC merging is needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index eaac172141ede..c734d2c5790d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
>    *				clks and resources after IDLE_TIMEOUT time.
>    * @topology:                   topology of the display
>    * @idle_timeout:		idle timeout duration in milliseconds
> + * @num_dscs:			Number of DSCs in use
>    * @wide_bus_en:		wide bus is enabled on this interface
>    * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
>    */
> @@ -204,6 +205,7 @@ struct dpu_encoder_virt {
>   	struct msm_display_topology topology;
>   
>   	u32 idle_timeout;
> +	u32 num_dscs;
>   
>   	bool wide_bus_en;
>   
> @@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   		if (dpu_enc->phys_encs[i])
>   			intf_count++;
>   
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
>   	if (dpu_enc->dsc)
> -		num_dsc = 2;
> +		num_dsc = dpu_enc->num_dscs;
>   
>   	return (num_dsc > 0) && (num_dsc > intf_count);
>   }
> @@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
>   	}
>   
> +	dpu_enc->num_dscs = num_dsc;
>   	dpu_enc->dsc_mask = dsc_mask;
>   
>   	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||
> 
> -- 
> 2.34.1
> 

