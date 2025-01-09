Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6BAA06A50
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 02:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B1A10E972;
	Thu,  9 Jan 2025 01:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZpqXu8Os";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDB710E220;
 Thu,  9 Jan 2025 01:33:44 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5090G1bF011206;
 Thu, 9 Jan 2025 01:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zZy918rFt0eaSG2zeowjt6syQeBOp3NyEZ3GVxFp51I=; b=ZpqXu8OszANr9MTv
 4vrh672sZIpQgBf2kLjjKIsviIvW/LfkbolsA4KfotNho+LF3HI4X+44EmpLIwdI
 EzvULruc1bWBFlVeV0+7JqY13tmfnSotczFxVx29Jv3yu6azTeL8joKSxFzDHiUu
 m8KIfgHLkbYMngHteHDzNeUdXhz9rPZ2gMzMc2GT9GUpe2C7ZUfuEqXDxk9sTEVd
 WPJD7IsZt0HDsB99eDbVXzy6AbtzK6KkctF0NAsYGHd5bv/KNN8TmO4uHtEZgmgI
 Izon20VAcM3W4fLLAJHTnlIstR4oORrSq8Tw4ZF2GObmegiZF4wItPgDMF/X8QLV
 CU0KIQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4423rqr46p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 01:32:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5091WRjF018367
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 01:32:27 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 17:32:26 -0800
Message-ID: <9c402ba0-a02f-4a21-9bfc-f508ee37be62@quicinc.com>
Date: Wed, 8 Jan 2025 17:32:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/dpu: simplify dpu_encoder_get_topology()
 interface
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Chandan
 Uddaraju <chandanu@codeaurora.org>, Jeykumar Sankaran
 <jsanka@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Archit
 Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-5-0e76a53eceb9@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241222-drm-dirty-modeset-v1-5-0e76a53eceb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sWB3C8gz1YFaiemyb5HI_gtlkfoJOc8t
X-Proofpoint-ORIG-GUID: sWB3C8gz1YFaiemyb5HI_gtlkfoJOc8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 mlxlogscore=961 impostorscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090009
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



On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> As a preparation for calling dpu_encoder_get_topology() from different
> code paths, simplify its calling interface, obtaining some data pointers
> internally instead passing them via arguments.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 

Nice!

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
