Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031A1A42141
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F4F10E473;
	Mon, 24 Feb 2025 13:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Th1Y0Uk3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CE810E10B;
 Mon, 24 Feb 2025 03:04:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NMSqdU004252;
 Mon, 24 Feb 2025 03:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xJWDeQGXxkIVUKLcI6o6+7otQwSy2qTSX5wBLbCsRwU=; b=Th1Y0Uk3QloaSSwK
 Km4CWDj09Z1vPdmKkMxgcStGmrI2zLxzc3/wDc/ymqLHUFN+CRe7oHBp1a0LcThP
 JAjoCX5ao8GMAm/ZH7Awcd0JsNZkUXvUVsXVsrQdcWGjHWlLnYlw5ykFHH5O00Nu
 1yePJTudWh0f3OFCYnrxMtDzRNySwcWUpoDKAwIzH2F9TOnBMWcf154xOgU/8tTZ
 iHxMCoPvIya6zme7Y5kmt9vNpD75/On0KUjyqQWUbgB9W98gCjUV0gRJi0HxvGd4
 AzGSIn/dc0Sw/i/WAOcQ6DrrTX0AxFLXxfr9GUKXjMgCnFk/d1j7jr7zbYSMpqPS
 yQRwNA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6ntubmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2025 03:04:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O34TCv015905
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2025 03:04:29 GMT
Received: from [10.110.85.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Feb
 2025 19:04:28 -0800
Message-ID: <1f97fdc6-515e-48bb-bb2e-6a49e95d4097@quicinc.com>
Date: Sun, 23 Feb 2025 19:04:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Stephen
 Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
 <20250209-dpu-perf-rework-v5-8-87e936cf3004@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250209-dpu-perf-rework-v5-8-87e936cf3004@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: X7I0Ysy8xhNnKGWaLrg_BC5g6ZD1DWDk
X-Proofpoint-GUID: X7I0Ysy8xhNnKGWaLrg_BC5g6ZD1DWDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502240021
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



On 2/8/2025 7:21 PM, Dmitry Baryshkov wrote:
> Move perf mode handling for the bandwidth to
> _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> and then aggregating known values.
> 
> Note, this changes the fix_core_ab_vote. Previously it would be
> multiplied per the CRTC number, now it will be used directly for
> interconnect voting. This better reflects user requirements in the case
> of different resolutions being set on different CRTCs: instead of using
> the same bandwidth for each CRTC (which is incorrect) user can now
> calculate overall bandwidth required by all outputs and use that value.
> 
> Note #2: this also disables threshold checks for user-entered bandwidth
> values. First of all, it doesn't make sense to fail atomic commits
> because of the debugfs input. Compositors have no way to correlate
> failing commits with debugfs settings. Second, it makes sense to allow
> users to go beyond these values and check whether this makes any
> difference or fixes the issue.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 36 +++++++++++++--------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
