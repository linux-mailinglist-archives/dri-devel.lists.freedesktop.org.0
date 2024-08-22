Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C295BF9E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 22:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9A310E7F2;
	Thu, 22 Aug 2024 20:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YEP1Qrfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA0F10E633;
 Thu, 22 Aug 2024 20:37:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MA6Ivu027879;
 Thu, 22 Aug 2024 20:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JKl+arsPd7Vxoos92K3LpOUY
 y3KZg5MRl/g6iN3vzoI=; b=YEP1Qrfj7a0mxVuivZ0Q1G5az12sU+6nyEwOcSqF
 MZkyi8hWByTJiyWKEmgLaHd7ZcHgYuM43fUvE+jfeF859mrIzyXoE85OoXyZ7csa
 c3utNj+W7XXz0UqpWn7Lk9Q/kyYtuUSqziCKXcfrxq2ndPWG9M30GCnmWfPw/ASN
 KZmcPcoOLukyCrNzLvv1ilcwIhpy48tjje1mm6dUM2t/CTxntoDpQHAdrBAZzznK
 sU0bxduhiz4EG1OKL+ydB6MIAU7zyn+BHa3zXMAPV2s2fQKNvRPwLWaTz5VonDub
 vwdfNOgb9B0LzZT06DR0F86doZHfKFH7TXMcH1syBUgusw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414v5cg0kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 20:37:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MKbMZN011524
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 20:37:22 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 Aug 2024 13:37:18 -0700
Date: Fri, 23 Aug 2024 02:07:14 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Li Zetao <lizetao1@huawei.com>
CC: <robdclark@gmail.com>, <sean@poorly.run>, <konrad.dybcio@linaro.org>,
 <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH -next] drm/msm/adreno: Use kvmemdup to simplify the code
Message-ID: <20240822203714.brki6blotqzoutpu@hu-akhilpo-hyd.qualcomm.com>
References: <20240821012134.1947547-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240821012134.1947547-1-lizetao1@huawei.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DlkV6GGKzqRSxaAGK8DEN547z8zHgZ4q
X-Proofpoint-ORIG-GUID: DlkV6GGKzqRSxaAGK8DEN547z8zHgZ4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_14,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 mlxlogscore=817 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220154
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

On Wed, Aug 21, 2024 at 09:21:34AM +0800, Li Zetao wrote:
> Use kvmemdup instead of kvmalloc() + memcpy() to simplify the code.
> 
> No functional change intended.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1c6626747b98..ef473ac88159 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -688,11 +688,9 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
>  				size = j + 1;
>  
>  		if (size) {
> -			state->ring[i].data = kvmalloc(size << 2, GFP_KERNEL);
> -			if (state->ring[i].data) {
> -				memcpy(state->ring[i].data, gpu->rb[i]->start, size << 2);
> +			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
> +			if (state->ring[i].data)
>  				state->ring[i].data_size = size << 2;
> -			}
>  		}
>  	}
>  
> -- 
> 2.34.1
> 
> 
