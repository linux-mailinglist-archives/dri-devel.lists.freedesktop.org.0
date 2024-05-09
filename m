Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBDC8C156F
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 21:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E518810F140;
	Thu,  9 May 2024 19:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RlU7l2ER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2737710F13B;
 Thu,  9 May 2024 19:27:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449DcT1g011436;
 Thu, 9 May 2024 19:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=GDuI+FONF4k4STlgME8DvLuc5b4wpOL/cwLiyZ0C66w=; b=Rl
 U7l2ERTvW9F3bxil03h3vKmZeWi0cQz3Z/qjF8TeYgPy51IcAhIFTO4o/I3f8b/O
 F5yH3MThV9EOomI6C7ImfdB2VeoT279nx4MD2xKJs+AsjbcQojtEHlJPeqKzMYY5
 ckDAHStrSEVeo2Ct9xtvRgp8DXUZYWDSq/x9QxNqUTdu+fmCHaG9UynD42AfxHD6
 OrvU2YbV43bMV7eoli+AJY4499IubARpGWIwYWwK7pfQ4E/Drelplm5YFpl34fnX
 rhD1wHUZUQ6FSDP4GjPp3Fz9EQywuDun8entbpfTPc4Z8c/URYb6QVvfAP7/szPu
 A5dOKN2+JD5mJTQoJmJQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09ejufs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 May 2024 19:27:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449JRCwQ022111
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 May 2024 19:27:12 GMT
Received: from [10.110.104.129] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 12:27:11 -0700
Message-ID: <389f63a0-c00f-719b-085f-d562c2b5da08@quicinc.com>
Date: Thu, 9 May 2024 12:27:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: fix encoder irq wait skip
Content-Language: en-US
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240509-irq_wait-v1-1-41d653e3784e@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240509-irq_wait-v1-1-41d653e3784e@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TIX1gsMOKwQammEIUK1RvTdPG5U7ZaA6
X-Proofpoint-ORIG-GUID: TIX1gsMOKwQammEIUK1RvTdPG5U7ZaA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_11,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090136
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



On 5/9/2024 10:39 AM, Barnabás Czémán wrote:
> The irq_idx is unsigned so it cannot be lower than zero, better
> to change the condition to check if it is equal with zero.
> It could not cause any issue because a valid irq index starts from one.
> 
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

I think we also need

Fixes: 5a9d50150c2c ("drm/msm/dpu: shift IRQ indices by 1")

With that,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..cf7d769ab3b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -428,7 +428,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>   		return -EWOULDBLOCK;
>   	}
>   
> -	if (irq_idx < 0) {
> +	if (irq_idx == 0) {
>   		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
>   			      DRMID(phys_enc->parent), func);
>   		return 0;
> 
> ---
> base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> change-id: 20240509-irq_wait-49444cea77e2
> 
> Best regards,
