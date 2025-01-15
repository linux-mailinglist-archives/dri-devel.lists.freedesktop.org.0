Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8703FA12B99
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 20:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659B510E517;
	Wed, 15 Jan 2025 19:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dxO4Cu82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE5910E514;
 Wed, 15 Jan 2025 19:15:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FIonKn007916;
 Wed, 15 Jan 2025 19:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qF2OFxTNjfo0KI4OnFQetCRNQSzKzOLHEGxXZ+YTFUM=; b=dxO4Cu82N6z8Nno4
 xYiwebP9K7iEHGB5iv7EVFoSGs6jremvoWt27oSzkFqY+9WVVf5C4H72pbLjTnGD
 aFVVHk58blJG/2mdtu0+SFyb92w+sryrmD452HpR59kxIlppauA9p6eAL6Kp4ACp
 TahngFcg3tPZj7MW5jkZhn6G5B0fGVSqQ1xyxDfxN+8MrAhoyQSM6tzx/IVoy+8F
 a6MRJV9qjgriJlFrkLUtM4yGBnzAS3dweGN6+XlWwQtcpo9Hwq0Dlc85iK2oGuHJ
 RNjnSTJDH00ntBlV0iMIA8vSjg1hlRGxlWuTIUyydkVLWQsQlCvaeh1RCCc96z2f
 2xJiDg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446jndr1y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2025 19:14:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FJEuj7028666
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2025 19:14:56 GMT
Received: from [10.216.6.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 11:14:52 -0800
Message-ID: <4f0ca15e-770e-4192-b390-a3039c68e4b4@quicinc.com>
Date: Thu, 16 Jan 2025 00:44:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: Avoid rounding up to one jiffy
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, "Rob
 Clark" <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, open list
 <linux-kernel@vger.kernel.org>
References: <20250113154841.129521-1-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250113154841.129521-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OH4jFaUGXf9XGq9BgEO47aylFhahrsl6
X-Proofpoint-ORIG-GUID: OH4jFaUGXf9XGq9BgEO47aylFhahrsl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150140
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

On 1/13/2025 9:18 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If userspace is trying to achieve a timeout of zero, let 'em have it.
> Only round up if the timeout is greater than zero.
> 
> Fixes: 4969bccd5f4e ("drm/msm: Avoid rounding down to zero jiffies")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/msm_drv.h | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index fee31680a6d5..a65077855201 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -537,15 +537,12 @@ static inline int align_pitch(int width, int bpp)
>  static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
>  {
>  	ktime_t now = ktime_get();
> -	s64 remaining_jiffies;
>  
> -	if (ktime_compare(*timeout, now) < 0) {
> -		remaining_jiffies = 0;
> -	} else {
> -		ktime_t rem = ktime_sub(*timeout, now);
> -		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
> -	}
> +	if (ktime_compare(*timeout, now) <= 0)
> +		return 0;
>  
> +	ktime_t rem = ktime_sub(*timeout, now);
> +	s64 remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
>  	return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
>  }
>  

