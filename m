Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9853AA5513
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 21:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DBB10E121;
	Wed, 30 Apr 2025 19:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NECfirtn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5A710E054;
 Wed, 30 Apr 2025 19:54:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UHTVLk013348;
 Wed, 30 Apr 2025 19:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A4pvLorfFGud5T+ZsYa/fT8VDlMtMC0szet+PN9pNdI=; b=NECfirtnFYnasGD2
 y+tRTmkOrf8cM7ULfUWufSZbIQVvV5ruZD+GLExh4z2H27lS9VigpntXk/c1Xisu
 A032GWWal4RypD1PDY4L4D6L/I26oDkFuupCOR0qHNY4vDhy3xlrJv9Oi9pWz45p
 SqEqUNngcv0qd707wfJriEpbOFTeVXC0himVNODmqfuBFY8oZOYBaOEgURDiTeCM
 uCuoTc+yn5d1bc/ctTQVstHSrYN7l5kuuGVxn8hUnFvCqDZmsU8+3+70/9dkTwo0
 H4PV+hXPjTISuE+fy3jhYb1cnKnLY2+YNKEimWmlUEkJRL+gEDasPwej7Owswrvn
 op0dyQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uauejy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 19:54:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UJshkG017424
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 19:54:43 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 12:54:42 -0700
Message-ID: <264cf3ac-af5f-42d3-bfb4-8ca7dd69d976@quicinc.com>
Date: Wed, 30 Apr 2025 12:54:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/msm: move helper calls to msm_kms.c
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Konrad Dybcio
 <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-2-1132f4b616c7@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250413-msm-gpu-split-v1-2-1132f4b616c7@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -Rmao_ZFbYDH_rLYbAiIN8f_HHHpYcvF
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=68128004 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=sM5MQWsAIeL3UqYyphAA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -Rmao_ZFbYDH_rLYbAiIN8f_HHHpYcvF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE0NCBTYWx0ZWRfX5Cb5oeC3QQXl
 KSd7nc89KZPDJvM4TogwiCqtNWykEW5/eV2+upBc8XvinbeolwHLyE+L4luMegKO6RuDUubdida
 93IxRa7Uq3WsNrRlv5qJITEaH79ELEAfn03n8YL90J+rk8E9nzZbCqvVGMOshFpHmH2Kfh+6Rhp
 DV7HEznvcIDX2LTv75Ez1nXzuOAfmEy43m7i0Kyu9/4UOo4vWGLqvFaZp7WVcPDG/5+GvEjz3+3
 YNkJnFg/KJ2JMSg/KdP/aKg8P/rsryGkYyAZnPlKgx+5MRTIiFFbMF0+L9/rMs3TQYqGFc7dfLj
 isbIAIeAt/vfdWR0KzJwOANnB6myAPHYEs93NiXhegcwCfGw2nVShh3GXd4K3fAACW4FEDG1R/2
 sjKdACAMpVVNWn/inUkwxun88kqXNdj+Hee9eEFGYlCLaB6pZcrIIdfylfMjmpE7LFx+XJ8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=754 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300144
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



On 4/13/2025 9:32 AM, Dmitry Baryshkov wrote:
> Extract two more KMS-related codepieces to msm_kms.c, removing last
> pieces of KMS code from msm_drv.c.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c |  9 +++------
>   drivers/gpu/drm/msm/msm_kms.c | 20 ++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_kms.h |  2 ++
>   3 files changed, 25 insertions(+), 6 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
