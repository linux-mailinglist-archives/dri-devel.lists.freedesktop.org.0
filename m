Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01DAA36A12
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 01:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B0A10E367;
	Sat, 15 Feb 2025 00:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hVB9BsLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E4D10E0EF;
 Sat, 15 Feb 2025 00:48:51 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EEDtsJ022230;
 Sat, 15 Feb 2025 00:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7lwpThfECIvAZjnVcZ1dcc9HeoXUXItIFQ6CI74TL78=; b=hVB9BsLvuVPlgnxn
 1JvhaNfAA1HfKOV7LorOaTyGhUTpdjb0bKmCdHhiMpoZJ9RlxdPpyhTR+5UUJb8O
 6zGdPvX7YC5QgCJ16wHWfZtJquE+ScBrpLjj/N4yJZhXpEEHb2UJRXNEgFiUBWXt
 e+gLeLOupawBnaOIGFGmFMFcIvHHYu+IfQCxXU3evOY19qhvn0wRdQt1dwsNaO8+
 BF4q0IkO8v1XXplonlYYGXozVhzD+RVdDc8T6yoEH428s/jSndLMZDGyAM5BjMu/
 BD9yMw3vucl3fMdxB6i5UflM9NVx3rK16kPN41YwFJGmo6tiARPZMQZblJUeIkgt
 h/FEog==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44t7d899v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:48:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0mmql006478
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:48:48 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 16:48:48 -0800
Message-ID: <18840118-243c-40e2-9b74-226e515ae111@quicinc.com>
Date: Fri, 14 Feb 2025 16:48:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/15] drm/msm/dpu: fix mixer number counter on
 allocation
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-6-9701a16340da@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-6-9701a16340da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2sMJ_qwPjn0YgeNhaTKkW8V_hKteTUhg
X-Proofpoint-ORIG-GUID: 2sMJ_qwPjn0YgeNhaTKkW8V_hKteTUhg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150004
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
> Current code only supports usage cases with one pair of mixers at
> most. To support quad-pipe usage case, two pairs of mixers need to
> be reserved. The lm_count for all pairs is cleared if a peer
> allocation fails in current implementation. Reset the current lm_count
> to an even number instead of completely clearing it. This prevents all
> pairs from being cleared in cases where multiple LM pairs are needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 24e085437039e..3b3660d0b166d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   		if (!rm->mixer_blks[i])
>   			continue;
>   
> -		lm_count = 0;
> +		/*
> +		 * Reset lm_count to an even index. This will drop the previous
> +		 * primary mixer if failed to find its peer.
> +		 */
> +		lm_count &= ~1;
>   		lm_idx[lm_count] = i;
>   
>   		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> 
> -- 
> 2.34.1
> 

