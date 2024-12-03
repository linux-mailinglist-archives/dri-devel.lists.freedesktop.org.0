Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55029E1189
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 03:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634DA10E23F;
	Tue,  3 Dec 2024 02:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ghB7HFgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FAD10E238;
 Tue,  3 Dec 2024 02:57:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2IuJRo008414;
 Tue, 3 Dec 2024 02:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OkxoYtRe8gqyrp1JEdYQjp5yaa60JuuVaGEt7J4svyk=; b=ghB7HFgxk/v6+CLF
 CPhvxN4LhSyVAUwhzEEO/LQkzcMr4VJRTds1wSO8KHn1S01rbE+f9BApdpJ0yQcy
 u3ovuaWKu+B0Bdek/s3Y0wzj1FqlBvi0x0QZ1VRyAKByROutww6QSyQiwqKt00N+
 bCoEFfkB053BhtYvnx4vOjdRo44s1dnxJGLkBnqF/Zv43nS3tZi77IolHuxM3daA
 enQ8sAX5zgLC0vqsgLD1wlo2CZKvefH6xJXaU0d3cT6Hhy71aJTfzp+0usDoCl92
 Y25yfoNnZwPBY3qvtK5USWmw/CFa8UPERtkXzM98tDzXyfqRnoN4iiYP96ZbMGLM
 szW8Ug==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437snqxpjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 02:57:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B32vhJK019661
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Dec 2024 02:57:43 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 18:57:42 -0800
Message-ID: <293b507c-c442-4bd2-b525-dc1a6343acc7@quicinc.com>
Date: Mon, 2 Dec 2024 18:57:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt
To: Stephan Gerhold <stephan.gerhold@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 <stable@vger.kernel.org>
References: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SQhYmXw73R4bsFsmERJuggRgm4Spl2CN
X-Proofpoint-GUID: SQhYmXw73R4bsFsmERJuggRgm4Spl2CN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=749 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412030024
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



On 11/15/2024 4:55 AM, Stephan Gerhold wrote:
> The IRQ indexes for the intf_6 underrun/vsync interrupts are swapped.
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16) is the actual underrun interrupt and
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17) is the vsync interrupt.
> 
> This causes timeout errors when using the DP2 controller, e.g.
>    [dpu error]enc37 frame done timeout
>    *ERROR* irq timeout id=37, intf_mode=INTF_MODE_VIDEO intf=6 wb=-1, pp=2, intr=0
>    *ERROR* wait disable failed: id:37 intf:6 ret:-110
> 
> Correct them to fix these errors and make DP2 work properly.
> 
> Cc: stable@vger.kernel.org
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Thanks for fixing this, good catch !

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
