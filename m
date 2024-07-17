Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7769344D2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 00:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196C010E473;
	Wed, 17 Jul 2024 22:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pzHl2PoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B98710E472;
 Wed, 17 Jul 2024 22:26:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HFDFNx004324;
 Wed, 17 Jul 2024 22:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j/D8TuRlIv3+MI+d+h9FY80y8oeyXvIotba8jxGmeDM=; b=pzHl2PoH3/tqTIN6
 WnGaX1N3elxyEmpN6q72eZvjahVZ1Re2woGR9EYdWp3weVUU597BYMiGNwymYCBs
 r6n+i+d9D8O/Wz0Gd//4Oupj4fzys6gyd0BA8cAbs6o/0QiAzz+xO+RQsMAaYmGm
 Uf9qB12+QOqM90+iJeeW1jBTeQJ4t0w4nu2XcnrZhCJUJuj8Ig2sTa3XF/5viEnf
 f5DyM6Ug8qyfQ2zeKzoVKQ1MsfKdvL8tIV9uHyOaYbDzFRSlapGL9K7J3BVRfBhN
 aAcIVdBqdHuCZ2dGI2U48n9F2/nHg6+3yV18rrnZQrhhexDJSTSjHWp5cdazMHU8
 mYBrNA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpbug2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2024 22:26:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46HMQ32r006473
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2024 22:26:03 GMT
Received: from [10.110.63.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 15:26:02 -0700
Message-ID: <2563d9a7-89c9-4aee-a30e-68b4da9df9eb@quicinc.com>
Date: Wed, 17 Jul 2024 15:26:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/16] drm/msm/dpu: move pitch check to
 _dpu_format_get_plane_sizes_linear()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-10-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-10-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9i-h16e4lFQ_Y5wwUWK9O-jX24n20dhO
X-Proofpoint-GUID: 9i-h16e4lFQ_Y5wwUWK9O-jX24n20dhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_17,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170170
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



On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> The _dpu_format_get_plane_sizes_linear() already compares pitches of
> the framebuffer with the calculated pitches. Move the check to the same
> place, demoting DPU_ERROR to DPU_DEBUG to prevent user from spamming the
> kernel log.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 

Not fully convinced about demoting DPU_ERROR to DPU_DEBUG but I think we 
have had a similar discussion earlier while logging atomic_check 
failures in the CDM series, so keeping that in mind,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
