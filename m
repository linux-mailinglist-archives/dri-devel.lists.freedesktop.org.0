Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141F2A2E175
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 00:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A08010E0F2;
	Sun,  9 Feb 2025 23:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="V4CzUkq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EC910E060;
 Sun,  9 Feb 2025 23:28:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519NOUOD004308;
 Sun, 9 Feb 2025 23:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rC6DWwz6HFbX3hsyb/20HB2JgJmP5Fu60Lr1b1bITlo=; b=V4CzUkq1WYi7G5vo
 Wvwuy4j0eBRLmZ8ZXnz3/RfpOcnPlVgd6x/fOGEZLUSBC9oMILsv5ygo95grCGTR
 M8/aI2OGC5cHns9MkyZWXxmbKLwjYkQG+pfUmdaXVN4WGd8YFBlutVzdRCCx2hKi
 bE1JXyLludKeoYlwoDN5P1uWv1PD3I6kG5NkT+6C36nzWQDO0ysdabGbhP87oj2T
 emgXlfJJ4Qm0GOAZuieakcFCVON7F0zM7CYave53IFjzdamhjrl4KYrJC4Ew+FTU
 Y1BkjMV3u7wKxwJ2TahOl33ADSin6MMPAZ6ui2D3QAg+vqwkyip4kWNJV4gvx3al
 VImfLQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyjjh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Feb 2025 23:28:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 519NSlFf016355
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 9 Feb 2025 23:28:47 GMT
Received: from [10.110.94.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Feb 2025
 15:28:46 -0800
Message-ID: <0636a261-f4db-4a62-b6f0-bee4f28c3a02@quicinc.com>
Date: Sun, 9 Feb 2025 15:28:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
To: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>, David Airlie <airlied@gmail.com>, Vinod Koul
 <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Jordan
 Crouse" <jordan@cosmicpenguin.net>,
 <~postmarketos/upstreaming@lists.sr.ht>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Martin Botka" <martin.botka@somainline.org>, Jami Kettunen
 <jami.kettunen@somainline.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3Xy3RhDdrsw9yxHr7KT1tiLrtkPA01_e
X-Proofpoint-GUID: 3Xy3RhDdrsw9yxHr7KT1tiLrtkPA01_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_10,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 mlxlogscore=927
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502090209
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



On 2/9/2025 1:42 PM, Marijn Suijten wrote:
> Ordering issues here cause an uninitialized (default STANDALONE)
> usecase to be programmed (which appears to be a MUX) in some cases
> when msm_dsi_host_register() is called, leading to the slave PLL in
> bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> 
> This should seemingly not be a problem as the actual dispcc clocks from
> DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> bit still seems to have an effect on them somehow and causes the right
> side of the panel controlled by DSI1 to not function.
> 
> In an ideal world this code is refactored to no longer have such
> error-prone calls "across subsystems", and instead model the "PLL src"
> register field as a regular mux so that changing the clock parents
> programmatically or in DTS via `assigned-clock-parents` has the
> desired effect.
> But for the avid reader, the clocks that we *are* muxing into DSI0's
> tree are way further down, so if this bit turns out to be a simple mux
> between dsiXvco and out_div, that shouldn't have any effect as this
> whole tree is off anyway.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
>   1 file changed, 19 insertions(+), 11 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
