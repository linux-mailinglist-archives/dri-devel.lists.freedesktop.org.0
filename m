Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637779F3E43
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B702510E08C;
	Mon, 16 Dec 2024 23:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XNHNE9qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4ED10E08C;
 Mon, 16 Dec 2024 23:35:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMPW8G012141;
 Mon, 16 Dec 2024 23:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4tBmR6DVELjkHS5B5PnbOuEK9IPd8EMpTovhWSzyK+8=; b=XNHNE9qpl8paRCN7
 RW9EhlS1G6eXF9sQjELpx3lfgMmeuO/rV1zJ0ykAQjZwMTL4P+HjW6VMsfGogVS6
 G/zYEWAde2vXoFBhjDWrqCBEbD3HpvL4G6OidQT99mEdisJMo2o4tcBeC6LmO3rO
 hXbbV2lUvEOGQFzi8NSMEgAww5pOV2iNfZBpWe0p8tuYwRL7jv/4W0TG2/U+xcUS
 ztr44BDjMNOe4P096Ki69eqXMT8Bwv6Or0OBPU736grBGwyJcWZTHmEjGVIiFRdi
 i2jY593EZQvQqA9VeeWuaDaohdMIZbyC0n+H56EIzsIAKmbHAhoWroZRRXHbAFgJ
 7KCPsg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jw06841j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 23:35:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGNZRNV014979
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 23:35:27 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 15:35:27 -0800
Message-ID: <4b239b35-dd01-4aec-b5f8-b57e1ff8d01c@quicinc.com>
Date: Mon, 16 Dec 2024 15:35:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/msm/dpu: provide DSPP and correct LM config for
 SDM670
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>
CC: Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-8-15bf0807dba1@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-catalog-v1-8-15bf0807dba1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 70_9FDmUWzsjD9gsgKM2_jBm7OLugrBY
X-Proofpoint-GUID: 70_9FDmUWzsjD9gsgKM2_jBm7OLugrBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160193
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



On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
> On SDM670 the DPU has two DSPP blocks compared to 4 DSPP blocks on
> SDM845. Currently SDM670 just reuses LMs and DSPPs from SDM845. Define
> platform-specific configuration for those blocks.
> 
> Fixes: e140b7e496b7 ("drm/msm/dpu: Add hw revision 4.1 (SDM670)")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
>   1 file changed, 52 insertions(+), 2 deletions(-)
> 

Matches the docs I have,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
