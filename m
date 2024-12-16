Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38519F39C0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 20:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3DC10E779;
	Mon, 16 Dec 2024 19:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="V5O8R22u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C8B10E0C7;
 Mon, 16 Dec 2024 19:26:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGHA1Vm017650;
 Mon, 16 Dec 2024 19:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x8o5BulnjWrc9FstuAyn8X67jGFrZz3Vo5bL2vWSzoo=; b=V5O8R22uUGcGFWOE
 Jj0eJ9MH/vIA4LauYnfrQtJYy6/pdkdio9+dtHuwtq/SZdroqWHWnaHQrX6myZlX
 iEUdV9XQhASLAJuHodAuc0IOhOZUCVzxAACUPTA8Mtp0JrylOcaR8APsU2ofc2Qp
 N6Dash52hyVfaUrLfLW4QJw0g2tOjqCstq91G/y5ekRUEOI75o7qSslY7AQURLXW
 jLH4jqwCIPHRYRkNTVtNWLR+0N/DI0Pm7aXPYRjueJY4y1u/5pSOgOg6BU9Nhk4Z
 Sf0xD3TUtxzqO/9uvshmhp+vqSRp2FxykRX/TjhRpZH/AjvqVfyRDohSkmp0erUm
 S6Qfrg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jrc1rb3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 19:26:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGJQePR000591
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 19:26:40 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 11:26:38 -0800
Message-ID: <54edef24-b27a-4d79-aff1-672d4e65b5a3@quicinc.com>
Date: Mon, 16 Dec 2024 11:26:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct LM pairing for SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Li Liu <quic_lliu6@quicinc.com>, Fange Zhang <quic_fangez@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _eGJJNDVW3dGcaRy1bI7HwslwN8P70cS
X-Proofpoint-ORIG-GUID: _eGJJNDVW3dGcaRy1bI7HwslwN8P70cS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160160
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



On 12/16/2024 12:20 AM, Dmitry Baryshkov wrote:
> According to the vendor devicetree on SM6150 LM_0 is paired with LM_2
> rather than LM_1. Correct pairing indices.
> 
> Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index 621a2140f675fa28b3a7fcd8573e59b306cd6832..81eb274cc7000a3b70b0f6650088ddcd24648eab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -116,20 +116,20 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_0,
>   		.dspp = DSPP_0,
> -		.lm_pair = LM_1,
> +		.lm_pair = LM_2,
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
>   		.features = MIXER_QCM2290_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_1,
> -		.lm_pair = LM_0,
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
>   		.features = MIXER_QCM2290_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_2,
> +		.lm_pair = LM_0,
>   	},
>   };

Have a basic question here. We check the peer only if we will have more 
than one LM needed in the topology but sm6150 does not have 3dmux, so 
the number of LMs will not go beyond one.

318 		/* Valid primary mixer found, find matching peers */
319 		if (lm_count < reqs->topology.num_lm) {

It seems like this fix will be unused or does not really matter.

Downstream has a different implementation for lm_pair, its used even to 
decide the LM pair for CWB mux. Upstream has a simpler implementation of 
just doing that in the code of using ODD LMs for ODD CWB muxes and even 
LMs for even CWB muxes. So fix is okay but not needed.

>   
> 
> ---
> base-commit: a3d570eace66b4016f2692a6f1045742ee70c6b1
> change-id: 20241216-dpu-fix-sm6150-17f0739f8fe0
> 
> Best regards,
