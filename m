Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2811396AC00
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 00:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB3F10E0DD;
	Tue,  3 Sep 2024 22:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="U1yE1Vuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B4C10E0DD;
 Tue,  3 Sep 2024 22:18:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483IgdDh009481;
 Tue, 3 Sep 2024 22:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qgWlqxKjeBpg4Ts6zdxWmbOOIrvHy2nnFujcHgGQovQ=; b=U1yE1VuqyY9RIxKb
 HZIyF5kanildyiU66t2j8rFbsVKpObVZ/JsVkRhF9aCT4gTGs8idKZ11GHk+xvGX
 IzuCeAG2IOnqc+1wy/F+8/dhiotbKDfJqlKAIPf4LAcmJr8Ov5vNd/Xxx0uMInxS
 I8p/nTEbzJb1FT95O9oOZ/h+lR89CsH5lMGaL7kkKHaSqtyeFt45A0NYmaSNOuD6
 QS7XdA6UOxRC4+TU1YZhnOTM5ekgC2A/aaduo62RUREvH+uDml9qUTeyUXbafNRD
 TI43vZLncdBirHeSPPhf9/6DMJP2zVgx0GEdoc9TdNJ2DYIcDMDsMvIKuJWCSMJT
 vr9roA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41e0bhj259-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2024 22:18:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483MIPOa000659
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Sep 2024 22:18:25 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 15:18:24 -0700
Message-ID: <9f95704d-0699-4b11-b8cb-40f1a57eeebd@quicinc.com>
Date: Tue, 3 Sep 2024 15:18:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Check CRTC encoders are valid clones
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-7-502b16ae2ebb@quicinc.com>
 <uqtlpynjdszqyyikj64uxwuqnk3lmzma7kd2vwxipnj4fg2eje@7toj5kww7vk7>
Content-Language: en-US
In-Reply-To: <uqtlpynjdszqyyikj64uxwuqnk3lmzma7kd2vwxipnj4fg2eje@7toj5kww7vk7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: zlqd_Dm-1wxH-7mOEjxkMTFe4fHAHsIR
X-Proofpoint-GUID: zlqd_Dm-1wxH-7mOEjxkMTFe4fHAHsIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030178
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



On 8/30/2024 10:00 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 01:48:28PM GMT, Jessica Zhang wrote:
>> Check that each encoder in the CRTC state's encoder_mask is marked as a
>> possible clone for all other encoders in the encoder_mask and that only
>> one CRTC is in clone mode at a time
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 36 +++++++++++++++++++++++++++++++-
>>   1 file changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 5ec1b5a38922..bebae365c036 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -1204,6 +1204,36 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   	return topology;
>>   }
>>   
>> +static bool dpu_crtc_has_valid_clones(struct drm_crtc *crtc,
>> +		struct drm_crtc_state *crtc_state)
>> +{
>> +	struct drm_encoder *drm_enc;
>> +	struct drm_crtc *temp_crtc;
>> +	int num_cwb_sessions = 0;
>> +
>> +	drm_for_each_crtc(temp_crtc, crtc->dev)
>> +		if (drm_crtc_in_clone_mode(temp_crtc->state))
> 
> No, get the state from drm_atomic_state. temp_crtc->state might be
> irrelevant.

Hi Dmitry,

Ack.

> 
>> +			num_cwb_sessions++;
> 
> Even simpler:
> if (temp_crtc != crtc && drm_crtc_in_clone_mode(...))
> 	return false;

Ack.

> 
>> +
>> +	/*
>> +	 * Only support a single concurrent writeback session running
>> +	 * at a time
> 
> If it is not a hardware limitation, please add:
> FIXME: support more than one session

This is a hardware limitation.

> 
>> +	 */
>> +	if (num_cwb_sessions > 1)
>> +		return false;
>> +
>> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
>> +		if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
>> +				crtc_state->encoder_mask) {
> 
> Align to opening bracket, please. Granted that other drivers don't
> perform this check, is it really necessary? Doesn't
> validate_encoder_possible_clones() ensure the same, but during the
> encoder registration?

The difference here is that validate_encoder_possible_clones() is only 
called when the drm device is initially registered.

The check here is to make sure that the encoders userspace is proposing 
to be cloned are actually possible clones of each other. This might not 
be necessary for drivers where all encoders are all possible clones of 
each other. But for MSM (and CWB), real-time display encoders can only 
be clones of writeback (and vice versa).

> 
>> +			DPU_ERROR("crtc%d failed valid clone check for mask 0x%x\n",
> 
> DPU_DEBUG, don't let users spam dmesg.

Ack.

> 
>> +				crtc->base.id, crtc_state->encoder_mask);
>> +			return false;
>> +		}
>> +	}
>> +
>> +	return true;
>> +}
>> +
>>   static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
>>   {
>>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
>> @@ -1287,6 +1317,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>   			return rc;
>>   	}
>>   
>> +	if (drm_crtc_in_clone_mode(crtc_state) &&
>> +			!dpu_crtc_has_valid_clones(crtc, crtc_state))
> 
> Align to opening bracket.

Ack

Thanks,

Jessica Zhang

> 
>> +		return -EINVAL;
>> +
>>   	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
>>   		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>>   				crtc->base.id, crtc_state->enable,
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry
