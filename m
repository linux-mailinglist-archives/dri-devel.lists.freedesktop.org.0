Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E9C8120CD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D6D10E859;
	Wed, 13 Dec 2023 21:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAF610E850;
 Wed, 13 Dec 2023 21:32:41 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDLBOus003146; Wed, 13 Dec 2023 21:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=6vejkezcZEQefgDgr0xuBzSfHtQKgTo89Y5qtpw6Qm8=; b=n4
 lR9gaCh6627eRFdIyzscS8noTpw3rPNuPJQJkJvnC9GXYfCAHtwML0dX+jT2Qkqc
 g5DeWeBE01teiOLbSsJkRAWw1dTMn/ziFSNID4ymwJZmBSZYvGgtyP9CnIjE8ieM
 brsOmYea8Fo3aByoEfsKe5XqcqowjhXovyDn56SIwRsIirs1YUx7v3vXDvt04q2h
 rEEinBDN9nKW2zbDfDen20HjyGa0xlZzX7lvx9JEV9+maiK2ClrKmAd0v8gH/EGd
 xER3OrtYRQvfrVmi5s4vSiyNwjwZFbv5rLTupjZ4pcHTykAI/8Uu2RQ/5k3liDPQ
 IPdH/MS7K6w6fsiiUvRQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy32najye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:32:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDLWb8k020048
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:32:37 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 13:32:36 -0800
Message-ID: <534d7029-c772-cf15-0eb7-219471e258a5@quicinc.com>
Date: Wed, 13 Dec 2023 13:32:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/2] drm/msm/dpu: Drop enable and frame_count
 parameters from dpu_hw_setup_misr()
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
 <20231213-encoder-fixup-v4-2-6da6cd1bf118@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231213-encoder-fixup-v4-2-6da6cd1bf118@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UwBQ69UB3RYNmwg7bhC8NvKDKxNux52U
X-Proofpoint-GUID: UwBQ69UB3RYNmwg7bhC8NvKDKxNux52U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=873
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312130151
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/13/2023 1:30 PM, Jessica Zhang wrote:
> Drop the enable and frame_count parameters from dpu_hw_setup_misr() as they
> are always set to the same values.
> 
> In addition, replace MISR_FRAME_COUNT_MASK with MISR_FRAME_COUNT as
> frame_count is always set to the same value.
> 
> Fixes: 7b37523fb1d1 ("drm/msm/dpu: Move MISR methods to dpu_hw_util")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 19 +++++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  9 +++------
>   8 files changed, 22 insertions(+), 33 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
