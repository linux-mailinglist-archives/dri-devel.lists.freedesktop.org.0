Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BA09618DB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 22:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB86D10E411;
	Tue, 27 Aug 2024 20:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Lnnc7tc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB39E10E411;
 Tue, 27 Aug 2024 20:56:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RJkwxu000308;
 Tue, 27 Aug 2024 20:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ifnkAG0rtHV4uVtNT9kwPjMq8aQC7SuEsZa/E/2O0+E=; b=Lnnc7tc4oJqZeKEF
 4nSbvIELgsXzE6K+Y8YtR/H1kafi0g5WJaS2jlVlOOjDyVtlQuaIY5yuDvx1n+CS
 mhcelFXSL2JCg3nyfC3us01rk6zONjolHSsIFpAi2YPakGN7LN0MWxDecdcXf8Ro
 v6QOwohjJEIL6RFzxMbqXVEgXbDpy8O5RWOaVn6g9YVJ89VIXNzW0umDhadoY5Av
 q7D/wwPNhSb4aMcMz/IsGxWA3pmfZoRfYSl/pB4NVPBPTTLUX6KZqpQ8Phc3cJwU
 YS1LhaxUVZXaxmSzSTJO0qqHwk9WCR7HswHTYECgUFO4X+4kKg4BiCm94uovYB/j
 r0zsOA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4198s02cb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 20:56:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RKugOX030243
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 20:56:42 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 13:56:41 -0700
Message-ID: <2fcf6747-9bd0-4b27-80c0-fa6246aec812@quicinc.com>
Date: Tue, 27 Aug 2024 13:56:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] drm/msm/dpu: move scaling limitations out of the
 hw_catalog
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-7-5efb90cbb8be@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240627-dpu-virtual-wide-v5-7-5efb90cbb8be@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kuelQIvE4DodCVuMi1BK6dKeoYh8u-Aj
X-Proofpoint-GUID: kuelQIvE4DodCVuMi1BK6dKeoYh8u-Aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270154
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



On 6/26/2024 2:46 PM, Dmitry Baryshkov wrote:
> Max upscale / downscale factors are constant between platforms. In
> preparation to adding support for virtual planes and allocating SSPP
> blocks on demand move max scaling factors out of the HW catalog and
> handle them in the dpu_plane directly. If any of the scaling blocks gets
> different limitations, this will have to be handled separately, after
> the plane refactoring.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
>   3 files changed, 13 insertions(+), 19 deletions(-)
> 

If we do end up with different scaling limits in the future, we will 
decide on what would be the best way to handle that, but till then,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
