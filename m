Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5550B9F3769
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 18:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E0710E728;
	Mon, 16 Dec 2024 17:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HQFwuLt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F26210E724;
 Mon, 16 Dec 2024 17:22:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGFHqo2022103;
 Mon, 16 Dec 2024 17:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 57mXg//zJJ5EQoQavecLesiluqversb+hD+IQZmv2X0=; b=HQFwuLt5sGfKR+6d
 jkHdPU/asp+BVmnhZ83kQMJrInyJ7Z7WO6a1bWXuggos5bfu9UlLOrBJQ7zhUgEo
 q5sG4LCIVwCB63nZYVaAtmAVfLDQNRm4xAFf1vH/27f+EWi6Nb8NrjZ96YIiBYap
 dGY/w1w8vO24PzqB3Cse4TLi4yN8x4fBCFP7c7+JwTkUfnoocjO79prNpBNY4MZT
 PbAcPC6uUnwBlgFZopDaMXDnF7z/6rJomYFvdtIM/MbnxmIdG4yu9OSSrgwLi7Gv
 xXyHsjMGNSJxrTXd11nAKS7qS0GoTLRlHcgS+77Lsr/PM2qw/6uWXyqDInFxYvNL
 xovcKg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jpqmgaxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 17:21:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGHLvSJ028436
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 17:21:57 GMT
Received: from [10.110.102.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 09:21:55 -0800
Message-ID: <99148f0a-e46c-47a7-a910-12269817a0e6@quicinc.com>
Date: Mon, 16 Dec 2024 09:21:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: fix -Wformat-security warnings
To: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241216083319.1838449-1-arnd@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216083319.1838449-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: esH0aAL_b0cg8n4lb3vzFaKfR5wwSlig
X-Proofpoint-GUID: esH0aAL_b0cg8n4lb3vzFaKfR5wwSlig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160145
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



On 12/16/2024 12:33 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Passing a variable string as a printf style format is potentially
> dangerous that -Wformat-security can warn about if enabled. A new
> instance just got added:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function 'dpu_kms_mdp_snapshot':
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:1046:49: error: format not a string literal and no format arguments [-Werror=format-security]
>   1046 |                                             vbif->name);
>        |                                             ~~~~^~~~~~
> 
> Fix this one and the preexisting -Wformat-security warnings the in the
> DRM code for snapdragon.
> 
> Fixes: 1a40bb31fcf1 ("drm/msm/dpu: Add VBIF to DPU snapshot") # and others
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I have a larger series that I still plan to send eventually, sending this
> one now as I just saw another one get added. The warning is enabled by
> default because there are still over 100 other files with the same problem.
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 28 ++++++++++++++++---------
>   2 files changed, 19 insertions(+), 11 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
