Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC4A06A39
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 02:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC10010E2AF;
	Thu,  9 Jan 2025 01:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fQ/8qyTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D8010E220;
 Thu,  9 Jan 2025 01:28:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508GrqjC021280;
 Thu, 9 Jan 2025 01:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iFlXTm7kHgZkTUyIpF8VoykTgwzjL1Xjg3GnWr7mbR8=; b=fQ/8qyTw0FnC3iuw
 6f0rMK/20lyMScbcs/5TYPjX8u68QLw/uLJ8nNFJR5ur2b6+B7GCoVo63fRdE56R
 L/FAu6mkjum8WdfBWOXdbTU2+EdjcmSbRSJFO34gLgatF3Nw58ROBNDn3UESOfV/
 Wsrybs1hsns4bHRoEjoCmOofxgAygzd3PgFBxuzHFDwCnLK1xyhiTvJs8EjLioKr
 9mbkFCAG5gKRjQJQzQppAC50D2xdFJlWtrHGmgiD+TR4KQoncoRun38wSdfXO1j0
 Vn2mm7d3f7reONypkYNGjLTLx8FTMnxW2bcP+tTDPqe2nzP3y1BEKKQCpDRXMr7x
 KlUdcQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441w9m12bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 01:27:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5091R06I011603
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 01:27:00 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 17:27:00 -0800
Message-ID: <bd046827-8323-4518-bb5d-d0e943428ee7@quicinc.com>
Date: Wed, 8 Jan 2025 17:26:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/dpu: move needs_cdm setting to
 dpu_encoder_get_topology()
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
 <20241222-drm-dirty-modeset-v1-4-0e76a53eceb9@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241222-drm-dirty-modeset-v1-4-0e76a53eceb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8GTLgLUzVWHhX6TGYmw_oWYQPqFlHBKS
X-Proofpoint-ORIG-GUID: 8GTLgLUzVWHhX6TGYmw_oWYQPqFlHBKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090009
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
> places, move the code setting topology->needs_cdm to that function
> (instead of patching topology separately).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 ++++++++++++++++-------------
>   1 file changed, 22 insertions(+), 19 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
