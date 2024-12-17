Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2E9F4064
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 03:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF38710E835;
	Tue, 17 Dec 2024 02:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eAvQ7ilu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B747410E835;
 Tue, 17 Dec 2024 02:11:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIbpsQ010181;
 Tue, 17 Dec 2024 02:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UVD0gY03rGOkojuIBBd4Id5tINpeXMqOCXDlv6d8Qd4=; b=eAvQ7ilucweGo5hL
 2juevWXl79b7hqIrveeKuJZAxNabhXVvLT+OmnvEjpsDqyvd4lZUMZJZ4vKEcfQ2
 APmwYOHEGHLqBGALS2Ba60SMfGNMXoKm8da5ZZOhD58MfPb5W39KqhOcMiDvrrdE
 LVC1O8tXv60P14Zc+XxqKa/w4k8xEVUL3OvbXEE2+ek3OP6sSQ7mAdXQL9S/QDQB
 s7XPEF91svCcbqa6y8UbZH862uvfDG0oz4h8Di5BDJUpF0lMPHqoQ75Jd9q0E8hp
 fo+QPnuox01y/OvV5kXIHKMe2Qpf7fjK7ctxizGQgR8iGIjMC4bdhcYkDxZnx70t
 SSsA6A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsn9gvgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 02:11:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH2BGNm031577
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 02:11:16 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 18:11:15 -0800
Message-ID: <82459572-3fd1-4741-a698-144f6b29b29f@quicinc.com>
Date: Mon, 16 Dec 2024 18:11:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/25] drm/msm/dpu: get rid of struct
 dpu_rm_requirements
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-5-fe220297a7f0@quicinc.com>
 <ykvaxv26maaxz5z4odttbfumuqanhtjsnleebprsh273ci6k6k@alm6o7vuzkfi>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ykvaxv26maaxz5z4odttbfumuqanhtjsnleebprsh273ci6k6k@alm6o7vuzkfi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XiRJp3xNGGR5zqBg6HESpNpqWG-fr4O-
X-Proofpoint-ORIG-GUID: XiRJp3xNGGR5zqBg6HESpNpqWG-fr4O-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170017
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



On 12/16/2024 5:26 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 04:43:16PM -0800, Jessica Zhang wrote:
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> The struct dpu_rm_requirements was used to wrap display topology and
>> hw resources, which meant INTF indices. As of commit ef58e0ad3436
>> ("drm/msm/dpu: get INTF blocks directly rather than through RM") the hw
>> resources struct was removed, leaving struct dpu_rm_requirements
>> containing a single field (topology). Remove the useless wrapper.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 71 ++++++++++-------------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +-
>>   3 files changed, 25 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..5172ab4dea995a154cd88d05c3842d7425fc34ce 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -800,7 +800,7 @@ static int dpu_encoder_virt_atomic_check(
>>   
>>   		if (!crtc_state->active_changed || crtc_state->enable)
>>   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>> -					drm_enc, crtc_state, topology);
>> +					drm_enc, crtc_state, &topology);
>>   		if (!ret)
>>   			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
>>   							  global_state, crtc_state);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index c247af03dc8ef7174eedf3d5cc267d64f17a8656..cd5960af4a151428cc6fb7154c3ffdb65ebcf287 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -5,6 +5,7 @@
>>    */
>>   
>>   #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
>> +#include "msm_drv.h"
> 
> Why is it necessary? struct msm_display_topology has been moved to
> dpu_rm.h
> 

Yeah, will be good to check and drop this as its unnecessary. With that 
fixed, this LGTM

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
