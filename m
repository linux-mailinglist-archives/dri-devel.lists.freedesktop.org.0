Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC6AA5952
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 03:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C8110E167;
	Thu,  1 May 2025 01:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jjTDG2ry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31FB10E167;
 Thu,  1 May 2025 01:20:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGv58V032403;
 Thu, 1 May 2025 01:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +9gpcHyB0uMSPma3CREoZ/qRipby/ki+vvyem9GHZfA=; b=jjTDG2ryABax2PXc
 mJJxPbTZZmXWY2XrMDjfh2yyypkkmHK2j3N3ezYeOGYJm0StwBs1aOI8woJuilwq
 j05zhEbLjRz02a9I6KFIYy6b18bggCE17K1NlWGVGOCdkM1Dqz7jf6AX57yDSycu
 C5OEzjx83ALtftybmfg1mLlbPAhnAUpDRgUUk9YhMg3u/S4L6SbO+LNIqnycQSy2
 Y5b0xcan/6Ym5A1dnFWW/0toSrfNPwp9BxHlRcRiIcLFnMoa8b/FjTJhRXsMZ0uk
 DpgmPd64YKGGFeu4A/p5dbRFRY2Gcba70U0nHf5a1P8pBUKOqvgaDeMoQVkYYbfD
 MhsYUQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2c2wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 May 2025 01:20:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5411Kh3s025450
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 May 2025 01:20:43 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 18:20:41 -0700
Message-ID: <64438160-8e93-4153-af6f-1906589d1bc8@quicinc.com>
Date: Wed, 30 Apr 2025 18:20:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/msm/dp: Prepare for link training per-segment
 for LTTPRs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Dmitry Baryshkov
 <lumag@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <laurentiu.tudor1@dell.com>, <abel.vesa@linaro.org>,
 <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-4-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250430001330.265970-4-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IfDjlHaA6Pw6NmaSw1T0xTRXQdTzxQt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDAwOSBTYWx0ZWRfX/xctukahsXdX
 xsrG31GglnAxle19QoDByaAjm3t7egkITqARf1+YtgRo19hGkmP6PYUxfOiGtCypYZyIRlTHGo7
 Q4vYdM2vkjb7ptyshK4oSwQwPOypDAjU1nTE8YTW4Tpf35j/QBphpycrQl2o9pJJ4Sz7CWmqO0A
 /kSnVxvveAOeyE3rnbzMq4WZkJz7jVeEMCggvFGfE4zw858g14uLByFlIoo1u5bb9Nw4fRhPZz+
 iiLOjJb7SiJu6GVWPSfqDGoVFH6dz62JRG5ws+CsfuqDy04PJVLjFTXokEowL7wcJprxwgs98TO
 QGmLHibCpVxPZJ68/Wm+dWC5RwCkR0x02LaC8GShhrgt0yNrcitcccJINKLgMPfs/QCAzewVsyz
 djNkD+9nW1ZzPQUR8bo2JHlK4gSdyZIvWyT6QhXN/bhc2txdMuX1svN7eiTGNvbTplNBTms+
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6812cc6c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=1m8Cr8WocRHIVDcr4voA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IfDjlHaA6Pw6NmaSw1T0xTRXQdTzxQt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010009
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



On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> Per-segment link training requires knowing the number of LTTPRs
> (if any) present. Store the count during LTTPRs' initialization.
> 
> Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++------
>   drivers/gpu/drm/msm/dp/dp_link.h    |  1 +
>   2 files changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
