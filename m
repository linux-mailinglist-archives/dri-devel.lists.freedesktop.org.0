Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A9EA0B4A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B10D10E655;
	Mon, 13 Jan 2025 10:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Bs74zLte";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BEF10E656;
 Mon, 13 Jan 2025 10:34:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D05kgv005352;
 Mon, 13 Jan 2025 10:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ldQRIcsVIMjjxgYK+/m802+h1fO+Vvd6t/ES47sOUiY=; b=Bs74zLtesIXHMEsq
 ffFCCXqxQ7HeJNfMPODbUypLL1e9f2jyfZyOCvlOZkZ9reQIdtAIwFdEQtKenR2+
 aOSy5jqgTh3CoS6jccsWSlYlNL8nDpjV6UpC5QDw+TUuM5CLS0TVnZYVY3qylqxr
 0dcD/0LwM43wu86XEb2CKA1z46Y4WeZ+z7haggarJYQ6bNw45clKnRj/UEc+dAk3
 n2+DltCpBORqSIoCYBlCk2YCmOvJCn+Fi75yZFIefMHygvbSHdRlFuB/ySlX+d/4
 GS5XxQP9QzNhtTxbu9n2dpr/Lr3qNXIJVZdrcZFu3jC+FIXcRGyYVU65PhUv1L6G
 8Fci/Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444r01s9te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 10:34:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DAY3sn005605
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 10:34:03 GMT
Received: from [10.216.0.66] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 02:33:58 -0800
Message-ID: <82a53f0a-be0a-4725-9ef9-6ee5388722e1@quicinc.com>
Date: Mon, 13 Jan 2025 16:03:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Avoid rounding up to one jiffy
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, "Rob
 Clark" <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, open list
 <linux-kernel@vger.kernel.org>
References: <20250109230734.8111-1-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250109230734.8111-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: spo3_wecWs-6_qfpDzIohe-2-2MKWf1N
X-Proofpoint-ORIG-GUID: spo3_wecWs-6_qfpDzIohe-2-2MKWf1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130089
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

On 1/10/2025 4:37 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If userspace is trying to achieve a timeout of zero, let 'em have it.
> Only round up if the timeout is greater than zero.
> 
> Fixes: 4969bccd5f4e ("drm/msm: Avoid rounding down to zero jiffies")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index fee31680a6d5..451d258b9827 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -537,16 +537,14 @@ static inline int align_pitch(int width, int bpp)
>  static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
>  {
>  	ktime_t now = ktime_get();
> -	s64 remaining_jiffies;
>  
> -	if (ktime_compare(*timeout, now) < 0) {
> -		remaining_jiffies = 0;
> +	if (ktime_compare(*timeout, now) <= 0) {
> +		return 0;
>  	} else {

For readability, we can now remove 'else' block and de-nest rest of the
code.

-Akhil

>  		ktime_t rem = ktime_sub(*timeout, now);
> -		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
> +		s64 remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
> +		return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
>  	}
> -
> -	return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
>  }
>  
>  /* Driver helpers */

