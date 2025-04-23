Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1E9A99BBF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A139F10E706;
	Wed, 23 Apr 2025 22:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mHK4LwmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2E610E423;
 Wed, 23 Apr 2025 22:54:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NLcV8S013853;
 Wed, 23 Apr 2025 22:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xWikESqioRfIAFYUYT9uxkIpYDASxQjRphX41aBMCrs=; b=mHK4LwmZSEaWH8cF
 EH6Z7lJ4er4bwCL7AicmXTjdfvRY23WgTiak7DdpD0Q78mXxAO7gPDmJVzDeM3YA
 ZdTdXfkl76pK1l2O7FBK91BMxeFQweBtCZmcBhtjfmMZXep01v4jCGsUWozNJnSs
 GlrfdSUH9/rRFUy16bAPhOESOWJgwFOMK4+zcRCcvWPtcRk3WAx/juuqhF8bSIqh
 1JN6Ji7+oV9lESlT/hg6siQYLRqlwPKFz2kZSQ0gH0EINx46Uokib1GJOlapq/h9
 yw79PIWdi+BboscDwRJRJ08i1cT2B1oIL3dlKBsKoboxgY1ZwFd4H8FeT0e7Udiq
 VPs2OA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bkhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 22:54:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NMskYD017488
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 22:54:46 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 15:54:45 -0700
Message-ID: <d7e2e8fc-faec-4619-aa50-87b078058653@quicinc.com>
Date: Wed, 23 Apr 2025 15:54:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-4-c983788987ae@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-4-c983788987ae@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1MiBTYWx0ZWRfX4hLKxNYnpSSr
 yaCA3Zz017MsIk/gw3k3M4tU9CaBQ9XTtGGqPCWay0NxxdadEg07tZRthAp0yOmmr5KzYtP6ilZ
 A8hIxI8XkMLWfyrufDz+pbQY1WMzFXKHrvyWnSKzHB5o84CAsl+q74sHMkv9qvang/H326zQSnI
 kA4pAZsI65ptCHj3Uz2/1bJh21KedYU4aVj6Yd2PSJ2KumJ1zCBVU8eftJRcdk0yJNk2hcdRySE
 voDyIH6GyoXqMaQ3jCAz3xZVWPwqU46duuoyC599rKH3gQrXahwj0R5vgHRhbrORj/6/KMCBmJ2
 tZHGx/FwMVsWgO0dY+mxmPZBE+fThMuWV0AOylcNN9y9rsbb2AUx/dOvjRN2QIqWwV3iUYfAXPS
 /oVMT7k+3W7VBTSgPVTFLbxNd08hvoHUDZ7hbrRNhBvuQovc7OgT79wcvVdGYNNXxkx6bO6+
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=68096fb7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=rgZRmvi8jEFL0H6JymwA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AMWpETZbfv92cQisTEF7Y1WXfmnOvugk
X-Proofpoint-GUID: AMWpETZbfv92cQisTEF7Y1WXfmnOvugk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=901 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230152
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



On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> Instead of using .parent_names, use .parent_data, which binds parent
> clocks by using relative names specified in DT in addition to using global
> system clock names.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
