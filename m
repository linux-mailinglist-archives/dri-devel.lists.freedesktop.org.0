Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9056F984F5D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 02:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BD310E26B;
	Wed, 25 Sep 2024 00:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SC8XcN0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4409A10E26B;
 Wed, 25 Sep 2024 00:15:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHiVZg015563;
 Wed, 25 Sep 2024 00:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5JBiJ4m1eTCCViILBfeZuxHxJQ3g7nrbtUeAMf+jVjE=; b=SC8XcN0ANo/Pxb1R
 0WoIxXBd2TyOPxVH2f512pL5DTCJ5o1+TOeDsA5/34CZ9VRmAcosx0aXDI9uA0MQ
 wuyeUobV2vRCPvY9RzniiRv1visuumJ7F7KhI49JlsnWVxaFL9MzQ408LeiJezvt
 aj2DW5AgdoY7dFgq53N5QnGe0EEhsK6I4qvcXp7Cr6vNUPzgn1UQzFmg+qeVclF/
 R7vm+MV2iQeb0qDVErWcshFORcDZSlNa3nSRoYX5ozt02djxxd0E8uC3q+DGbBZg
 u8v0R9VZXlAwresukBZCamVJcb2P4yZ7N+HTEcSpgR48/l8VOSzQg0yMW87ZBm0a
 78mwUw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfh2hh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 00:14:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P0EomH013326
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 00:14:50 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 17:14:49 -0700
Message-ID: <fcc4fa17-910c-4c3f-8cfd-5bedad772b49@quicinc.com>
Date: Tue, 24 Sep 2024 17:14:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/22] drm/msm/dpu: Configure CWB in writeback encoder
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-16-7849f900e863@quicinc.com>
 <qfqvtbc2o2xrv35caonsvhykmq6bvjpc5plnknjgkodrsoez6d@rpobkvdyqeb2>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <qfqvtbc2o2xrv35caonsvhykmq6bvjpc5plnknjgkodrsoez6d@rpobkvdyqeb2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: W5ytX0QWdgPuHpu5Fi-iBPCsO46s1XB6
X-Proofpoint-GUID: W5ytX0QWdgPuHpu5Fi-iBPCsO46s1XB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250000
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



On 9/24/2024 4:41 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 24, 2024 at 03:59:32PM GMT, Jessica Zhang wrote:
>> Cache the CWB block mask in the DPU virtual encoder and configure CWB
>> according to the CWB block mask within the writeback phys encoder
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 83 +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   | 16 ++++-
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +-
>>   3 files changed, 100 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index b2f0bf412451..2628f2d55cb3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -24,6 +24,7 @@
>>   #include "dpu_hw_catalog.h"
>>   #include "dpu_hw_intf.h"
>>   #include "dpu_hw_ctl.h"
>> +#include "dpu_hw_cwb.h"
>>   #include "dpu_hw_dspp.h"
>>   #include "dpu_hw_dsc.h"
>>   #include "dpu_hw_merge3d.h"
>> @@ -139,6 +140,7 @@ enum dpu_enc_rc_states {
>>    *			num_phys_encs.
>>    * @hw_dsc:		Handle to the DSC blocks used for the display.
>>    * @dsc_mask:		Bitmask of used DSC blocks.
>> + * @cwb_mask		Bitmask of used CWB muxes
>>    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
>>    *			for partial update right-only cases, such as pingpong
>>    *			split where virtual pingpong does not generate IRQs
>> @@ -185,6 +187,7 @@ struct dpu_encoder_virt {
>>   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>>   
>>   	unsigned int dsc_mask;
>> +	unsigned int cwb_mask;
>>   
>>   	bool intfs_swapped;
>>   
>> @@ -1063,6 +1066,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>   	int num_cwb = 0;
>>   	bool is_cwb_encoder;
>>   	unsigned int dsc_mask = 0;
>> +	unsigned int cwb_mask = 0;
>>   	int i;
>>   
>>   	if (!drm_enc) {
>> @@ -1103,8 +1107,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>   						       ARRAY_SIZE(hw_pp));
>>   	}
>>   
>> -	for (i = 0; i < num_cwb; i++)
>> +	for (i = 0; i < num_cwb; i++) {
>>   		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
>> +		cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
>> +	}
>> +
>> +	dpu_enc->cwb_mask = cwb_mask;
>>   
>>   	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>   			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>> @@ -2071,6 +2079,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>>   		}
>>   	}
>>   
>> +	if (dpu_enc->cwb_mask)
>> +		dpu_encoder_helper_phys_setup_cwb(phys_enc, false);
>> +
>>   	/* reset the merge 3D HW block */
>>   	if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d) {
>>   		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
>> @@ -2114,6 +2125,68 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>>   	ctl->ops.clear_pending_flush(ctl);
>>   }
>>   
>> +void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
>> +				       bool enable)
>> +{
>> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
>> +	struct dpu_hw_cwb *hw_cwb;
>> +	struct dpu_hw_cwb_setup_cfg cwb_cfg;
>> +
>> +	struct dpu_kms *dpu_kms;
>> +	struct dpu_global_state *global_state;
>> +	struct dpu_hw_blk *rt_pp_list[MAX_CHANNELS_PER_ENC];
>> +	int num_pp, rt_pp_idx[MAX_CHANNELS_PER_ENC];
>> +
>> +	if (!phys_enc || !phys_enc->hw_wb || !dpu_enc->cwb_mask)
>> +		return;
> 
> We have already dereferened phys_enc, so checking that it's not NULL is
> futile. Also we know that the function is only called if cwb_mask is not
> zero, so the last check is also useless.

Hi Dmitry,

Ack.

> 
>> +
>> +	dpu_kms = phys_enc->dpu_kms;
>> +	global_state = dpu_kms_get_existing_global_state(dpu_kms);
>> +	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> +					       phys_enc->parent->crtc,
>> +					       DPU_HW_BLK_PINGPONG, rt_pp_list,
>> +					       ARRAY_SIZE(rt_pp_list));
>> +
>> +	if (num_pp == 0 || num_pp > MAX_CHANNELS_PER_ENC) {
>> +		DPU_DEBUG_ENC(dpu_enc, "invalid num_pp %d\n", num_pp);
>> +		return;
>> +	}
>> +
>> +	for (int i = 0; i < num_pp; i++) {
>> +		struct dpu_hw_pingpong *hw_pp = to_dpu_hw_pingpong(rt_pp_list[i]);
>> +
>> +		for (int j = 0; j < ARRAY_SIZE(dpu_enc->hw_cwb); j++) {
>> +			hw_cwb = dpu_enc->hw_cwb[i];
>> +
>> +			/*
>> +			 * Even CWB muxes must take input from even real-time
>> +			 * pingpongs and odd CWB muxes must take input from odd
>> +			 * pingpongs
>> +			 */
>> +			if (hw_pp->idx % 2 == hw_cwb->idx % 2) {
> 
> What about `if (a != b) continue;`?
> 
>> +				rt_pp_idx[i] = enable ? hw_pp->idx : PINGPONG_NONE;
> 
> Can we call config_cwb() here directly with no intermediate arrays?

Yes -- I should drop this for loop (and the associated array) as RM 
should reserve the CWB muxes and real-time pingpongs in the correct order.

> 
>> +				break;
>> +			}
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * The CWB mux supports using LM or DSPP as tap points. For now,
>> +	 * always use LM tap point
>> +	 */
>> +	cwb_cfg.input = INPUT_MODE_LM_OUT;
>> +
>> +	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>> +		hw_cwb = dpu_enc->hw_cwb[i];
>> +		if (!hw_cwb)
>> +			continue;
>> +
>> +		cwb_cfg.pp_idx = rt_pp_idx[i];
>> +
>> +		hw_cwb->ops.config_cwb(hw_cwb, &cwb_cfg);
>> +	}
>> +}
>> +
>>   void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
>>   				       const struct msm_format *dpu_fmt,
>>   				       u32 output_type)
>> @@ -2557,6 +2630,14 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>>   	return INTF_MODE_NONE;
>>   }
>>   
>> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys *phys_enc)
> 
> it's called get_cwb, but it returns a mask?

I'd based this function off of dpu_encoder_helper_get_dsc(), but I can 
rename this to *_get_cwb_mask() instead

> 
>> +{
>> +	struct drm_encoder *encoder = phys_enc->parent;
>> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>> +
>> +	return dpu_enc->cwb_mask;
>> +}
>> +
>>   unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
>>   {
>>   	struct drm_encoder *encoder = phys_enc->parent;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index e77ebe3a68da..d7a02d1f8053 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
>>    */
>>   
>> @@ -331,6 +331,12 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>>   	return BLEND_3D_NONE;
>>   }
>>   
>> +/**
>> + * dpu_encoder_helper_get_cwb - get CWB blocks mask for the DPU encoder
>> + * @phys_enc: Pointer to physical encoder structure
>> + */
> 
> All kerneldoc at the function definition, please. I plan to go through
> the existing codebase and move existing docs. It seems to be the only
> way to get kerneldoc-related warnings.

Ack.

Thanks,

Jessica Zhang

> 
>> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys *phys_enc);
>> +
>>   /**
>>    * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
>>    *   This helper function is used by physical encoder to get DSC blocks mask
>> @@ -400,6 +406,14 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>>    */
>>   void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
>>   
>> +/**
>> + * dpu_encoder_helper_phys_setup_cwb - helper to configure CWB muxes
>> + * @phys_enc: Pointer to physical encoder structure
>> + * @enable: Enable CWB mux
>> + */
>> +void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
>> +				       bool enable);
>> +
>>   /**
>>    * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
>>    * @phys_enc: Pointer to physical encoder
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index 882c717859ce..e88c4d91041f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
>> @@ -342,6 +342,8 @@ static void dpu_encoder_phys_wb_setup(
>>   
>>   	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
>>   
>> +	dpu_encoder_helper_phys_setup_cwb(phys_enc, true);
>> +
>>   	dpu_encoder_phys_wb_setup_ctl(phys_enc);
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry

