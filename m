Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAA0B25FA8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 10:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C1410E035;
	Thu, 14 Aug 2025 08:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="M8QPl4oz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28DF10E035;
 Thu, 14 Aug 2025 08:54:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8pDsq002794;
 Thu, 14 Aug 2025 08:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WC/TnEjax3XQxTWCjL7QyHl4ZlRJg21N+S6ZMtPF/dw=; b=M8QPl4ozmU3ls5Vp
 sZa2z1OZw7BmhlWVWCRbCopWsjoAF3vh9RxbXGUSHt+7ORH6qW9IbiqmN9lRnIxR
 IggR+Ypr6/xQYJG6uRdpoAZeAGUUcx7R8LKxn0kMXuQMetzohBIBWx1uRmgt4lID
 VhUfLJJ8feBTFLstDvSrWNBiUeAd3eU4tKqAfl8QeCtUdlnaS2NS/aRro3Ev1mdp
 K1C/ZxyYImQbUYD630riJ+1UHLmtUAbmdVxeJv5kN/U+iS4qTNbifN33jf0AVWrK
 207bJ2+nA6XUKfi1LljpP4PU1H8daHKAv7py9FyQIqlDfP16s7l9pBxfV1mhgaHU
 3xPSGw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv71mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 08:54:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E8sMeE000877
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 08:54:22 GMT
Received: from [10.133.33.43] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 01:54:18 -0700
Message-ID: <a8458790-b4d8-4165-bd6f-00497a9d0457@quicinc.com>
Date: Thu, 14 Aug 2025 16:54:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/38] drm/msm: add support for non-blocking commits
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
 <rznsg4feyxanhvggxtebilg3ukbcrv3xgi4f2ijadjqaeqfelo@ogib4gythj7d>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <rznsg4feyxanhvggxtebilg3ukbcrv3xgi4f2ijadjqaeqfelo@ogib4gythj7d>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689da43f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=PaLLD6NItR1mFu1kbLQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9C--MvAwetd9493KNdK4ozC9c_MBINEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX7mY5jESB2xsE
 xQuqShqnvvQnERJqhoRBIzh0TKMFjXQRKA8JOXAn2s5NWRaQqsB4ONJn6b8G0q8n0fA2NWSETvz
 bYYykINi40CiLpyRO+6g4RMjWy0QpQd+ZLYqI+kvEN3oHLXcIMH58w0WH3kepjrQ0Lv4ifLLqK8
 GfcCFG8pP1L3eNX5GonAiqzhmWA4YlIEwTxp202cvQnMiD6+C/fpmVGtQy8i8/YYd4HLvqizeFF
 WLlA06EZx2xG+/2GgMgMj7/SNnn4FC+/1t/Px08qM6xv3WHwiAm2HxdFZa7j1gxDdpHMcylUplL
 bayAg5zodWwYI7+yQD0ahKoR5rUKLtWbSHOG/qqScoqXNhZLRGy45HnXTp4eGFBGbq/gX1MODyj
 ByNcbyvt
X-Proofpoint-GUID: 9C--MvAwetd9493KNdK4ozC9c_MBINEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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



On 2025/6/9 22:50, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:51PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Hook up the mst framework APIs with atomic_commit_setup() and
>> atomic_commit_tail() APIs to handle non-blocking commits.
> 
> Were non-blocking commits not supported before this patch?
> 
This patch only work for MST case. and for SST case, i'm not sure.  I 
see commit_tail() called drm_atomic_helper_wait_for_dependencies() in 
DRM codes.. Hopefully this can answer your question.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>>   drivers/gpu/drm/msm/msm_kms.c    | 2 ++
>>   2 files changed, 5 insertions(+)
>>
> 

