Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81BC93346A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 01:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23A510E900;
	Tue, 16 Jul 2024 23:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ApEC3jWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7D210E8FF;
 Tue, 16 Jul 2024 23:04:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHem1u023068;
 Tue, 16 Jul 2024 23:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xc+1nWKL5m3GIa7ZDLyIdaod7OXqYMhpie3fO87KuCw=; b=ApEC3jWU7FAnQ4hy
 mGMtHDDPQFeFXaGeA1WLJKuELr9Rvx3BCcUMlV8vxJ5fRYAzv2C6zoEjKQrOUJ+s
 ltrxDhEcJbgGgeAZNxsXmtilPP3R5wjVCzqBKcMmsuC/tf5+x6xQhijRus/B+YNq
 4pK0Apepq1bk9BTOEWgtARXMazko32y8lqqOjwRg+vJ9CUehKMrJNgshWaFXRPGr
 USaHOO0bz7GjCvXIjjRXOt5tki15KPxyZcvTPG+NVU8CLHB79kEQnOfozY/YqK4Y
 2/r1VQF0n9U4QFOVqI+bxZ2LrfLRma6b+zRgBQDA7slsUUqVoxU2ntzNjdn4gDuz
 MPh8+g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfngjde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2024 23:03:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46GN3wvA028472
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2024 23:03:58 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 16:03:57 -0700
Message-ID: <bf1889df-b156-45e5-a749-87e7b59b9113@quicinc.com>
Date: Tue, 16 Jul 2024 16:03:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/16] drm/msm/dpu: drop extra aspace checks in
 dpu_formats
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-7-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-7-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZVXaAZ8hjt2sn2sTM3y_1Ta3b3AdTBPQ
X-Proofpoint-ORIG-GUID: ZVXaAZ8hjt2sn2sTM3y_1Ta3b3AdTBPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=485 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407160169
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
> The DPU driver isn't expected to be used without an IOMMU. Thus the
> aspace will be always present. Not to mention that mdp4/mdp5 drivers
> call msm_framebuffer_iova() without such checks, as the whole
> msm_framebuffer layer is expected to support both IOMMU and IOMMU-less
> configurations.
> 
> Drop these useless if (aspace) checks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
