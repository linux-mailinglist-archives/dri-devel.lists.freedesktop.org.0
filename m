Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B552B25EA7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 10:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A020E10E81D;
	Thu, 14 Aug 2025 08:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IEayfplB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FB910E81C;
 Thu, 14 Aug 2025 08:24:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMK63Z002802;
 Thu, 14 Aug 2025 08:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 szT/7VYEBT/i5GUPMjZjxaNeVR3yEWoylClLnLJqr60=; b=IEayfplBxKjeaews
 /zUHucINY3YUc96+ar4knPO5acsNRdG+JDpWRWiJm7pLFVmVJKH/1SWiXGe6fa+G
 KYq8VrIiOLDH+unWPVt1tfemahWjO9lV9ERbyb50ho7ejrkm8oraZDQK3+o6nNo7
 xf1FAVdU6O4FuyFsAa1aVWCTQR9LkscUPWbgxY91LaIvJLu8fl7vOkV/7Pr8NeRT
 0+kBSY380UXaPGBFk1b+Jr5eDy8iilzvBbM7g078aWEhyGpJ8KXP6hIK8npIuvr/
 5F5nm6YyUTmTFRJzNrzeDMv6mjviFEKQEDEKH5o9yN9yprEu8CQc2wHgQpOEpCjX
 F2KT5g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv6xq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 08:24:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E8OBJM013091
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 08:24:11 GMT
Received: from [10.133.33.43] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 01:24:07 -0700
Message-ID: <93c5b8c8-891b-4643-9da6-c669eaa34750@quicinc.com>
Date: Thu, 14 Aug 2025 16:24:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/38] drm/msm/dp: propagate MST state changes to dp
 mst module
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
 <20250609-msm-dp-mst-v2-31-a54d8902a23d@quicinc.com>
 <4w6rtzhetxrco5ncynr52qeveypfpqkclh24kcdpfcn5u3v5at@evxsz3xdxfio>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <4w6rtzhetxrco5ncynr52qeveypfpqkclh24kcdpfcn5u3v5at@evxsz3xdxfio>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d9d2d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=5dxOTwhkvzhATaH7nOcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hvg2gk1y84MVIM3NTfVYHMKjpKaxTJys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX9z2K+JQ6amlS
 VGgMpx8TyAffQcJfm1yHwZ985kGjfDamTmjV3hzlpeWNZaWPNtuYrDJwFDpLU2NNuJQhKrej57Y
 V1jbFeXPtEJfU8y60P4VBPlR4fXKN/RuVTUfLhLb8RwK+lWmIzaRwjb0cixs9iqecR65GMG76fU
 ObOAZirYAR7Mq5As3o8ck7v2qkTee6x0NyRLercJboxgCloxR7o1K4/SKOSk5fVzLiGga+/2fSy
 JGO3CiZeAPp2/4N7gzPhyE/HuwI0R5uAeiXHa4jPnOrSs2rfj3z3Q9c9gUAgu+WSiS1rfAdebik
 Fb2MMueBSj7akiiDgdkWKbOwFgPIYtbgnGANxooApqzPA34psuLaFTCImOoz+INcgI4+UcRsXD2
 OcOL6R/y
X-Proofpoint-GUID: hvg2gk1y84MVIM3NTfVYHMKjpKaxTJys
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



On 2025/6/9 22:56, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:50PM +0800, Yongxing Mou wrote:
>> Introduce APIs to update the MST state change to MST framework when
>> device is plugged/unplugged.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Hmm, who is the author of the patch?
> 
Sorry for that. will update it . author is Abhinav
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>>   3 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 323d1c0a9efa4fa30ce97317e873607c54409a11..9dbcf4553cad70c9e3722160a87403fc815765d7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -29,6 +29,7 @@
>>   #include "dp_drm.h"
>>   #include "dp_audio.h"
>>   #include "dp_debug.h"
>> +#include "dp_mst_drm.h"
>>   
>>   static bool psr_enabled = false;
>>   module_param(psr_enabled, bool, 0);
>> @@ -420,6 +421,17 @@ static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
>>   	msm_dp->mst_active = true;
>>   }
>>   
>> +static void msm_dp_display_set_mst_mgr_state(struct msm_dp_display_private *dp,
>> +					     bool state)
>> +{
>> +	if (!dp->msm_dp_display.mst_active)
>> +		return;
>> +
>> +	msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, state);
>> +
>> +	drm_dbg_dp(dp->drm_dev, "mst_mgr_state: %d\n", state);
> 
> Yet-another-oneliner? Noooo. Really, no.
> 
Got it. Will remove it and call msm_dp_mst_display_set_mgr_state directly.
>> +}
>> +
>>   static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   {
>>   	struct drm_connector *connector = dp->msm_dp_display.connector;
> 

