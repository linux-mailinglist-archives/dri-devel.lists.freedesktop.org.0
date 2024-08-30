Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCB5966A76
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 22:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C060510E527;
	Fri, 30 Aug 2024 20:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hEd3vJgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5C210E432;
 Fri, 30 Aug 2024 20:28:40 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UIdhqX025809;
 Fri, 30 Aug 2024 20:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OfIl/ATySEdHitdCWL5pF6EnV+mQWXkQkgWjKgfQo/w=; b=hEd3vJgShalYllen
 mvDCBHZZxuf5YYJuJsRfFciQwDy6l/yvSfVnEAxU+3FUtygrIpXankD7tSteeSS2
 72gLZWwVnqnUzJeK4Kg0c21kob94KOL24kKhqauKGvWffYkSGv9wAGMEct5qsdkI
 nXaXC9s1YWqaTP+hlAN764YnZyqS+H2HuPG4QavU8kicfzvEhSpVrW4QzJYG2mac
 ojMOVcPkpRavzWrR1A4DncvkzKFwO/rbTeQZi+NpTKF+7YrOlFF6sBh5omTLP/xV
 vvIx03GJM/JooLoSlBarSOtmGO8SqgUKztmUlf/5Tb/1FwJMdk1dTWWzGZ5kgKSs
 LBwTCg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41arax53hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 20:28:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UKSVjJ004495
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 20:28:31 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 13:28:30 -0700
Message-ID: <a73def5c-46f6-4467-958d-20f28ce8ad2c@quicinc.com>
Date: Fri, 30 Aug 2024 13:28:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] drm/msm/dpu: Reserve resources for CWB
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
 <20240829-concurrent-wb-v1-14-502b16ae2ebb@quicinc.com>
 <yohtzxysheoybac24hxil6zzzsqi4inx6oh6x7vaoj5lvtdf3u@vd5nax37ilqd>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <yohtzxysheoybac24hxil6zzzsqi4inx6oh6x7vaoj5lvtdf3u@vd5nax37ilqd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: T3HrqaiRlOF0BByDkFpBb6S17dQCJvgV
X-Proofpoint-GUID: T3HrqaiRlOF0BByDkFpBb6S17dQCJvgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300158
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



On 8/30/2024 10:25 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 01:48:35PM GMT, Jessica Zhang wrote:
>> Reserve dedicated pingpong blocks for CWB
> 
> Please explain design ideas. Having just a single phrase is usually not
> enough.
> 
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 65 +++++++++++++++++++++++++++++
>>   3 files changed, 79 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 36b677cf9c7a..f1bd14d1f89e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2,7 +2,7 @@
>>   /*
>>    * Copyright (C) 2013 Red Hat
>>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    *
>>    * Author: Rob Clark <robdclark@gmail.com>
>>    */
>> @@ -1054,6 +1054,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>>   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>>   	int num_pp, num_dsc;
>> +	bool is_cwb_encoder;
>>   	unsigned int dsc_mask = 0;
>>   	int i;
>>   
>> @@ -1067,6 +1068,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>   
>>   	priv = drm_enc->dev->dev_private;
>>   	dpu_kms = to_dpu_kms(priv->kms);
>> +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
>> +		dpu_enc->disp_info.intf_type == INTF_WB;
>>   
>>   	global_state = dpu_kms_get_existing_global_state(dpu_kms);
>>   	if (IS_ERR_OR_NULL(global_state)) {
>> @@ -1077,9 +1080,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>   	trace_dpu_enc_mode_set(DRMID(drm_enc));
>>   
>>   	/* Query resource that have been reserved in atomic check step. */
>> -	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> -		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>> -		ARRAY_SIZE(hw_pp));
>> +	if (is_cwb_encoder)
>> +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> +			drm_enc->crtc, DPU_HW_BLK_DCWB_PINGPONG, hw_pp,
>> +			ARRAY_SIZE(hw_pp));
>> +	else
>> +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> +			drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>> +			ARRAY_SIZE(hw_pp));
> 
> Why is this necessary? Can we still use DPU_HW_BLK_PINGPONG?

Hi Dmitry,

Since both regular non-cwb pingpongs and pingpongs dedicated for cwb 
both share the same pingpong_to_crtc_id map, I need a way to distinguish 
between the real-time and dedicated cwb pingpongs.

If I don't do that, get_assigned_resources would populate the hw_pp 
array for both the real-time and WB encoders with *only* the real-time 
display pingpongs.

> 
>> +
>>   	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>   			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> index c43cb55fe1d2..c87790a1b940 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> @@ -77,6 +77,7 @@ enum dpu_hw_blk_type {
>>   	DPU_HW_BLK_LM,
>>   	DPU_HW_BLK_CTL,
>>   	DPU_HW_BLK_PINGPONG,
>> +	DPU_HW_BLK_DCWB_PINGPONG,
>>   	DPU_HW_BLK_INTF,
>>   	DPU_HW_BLK_WB,
>>   	DPU_HW_BLK_DSPP,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index 13f84375e15d..afad26556cd5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -236,6 +236,48 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>>   	return -EINVAL;
>>   }
>>   
>> +static int _dpu_rm_reserve_cwb_pingpong(struct dpu_rm *rm,
>> +		struct dpu_global_state *global_state, uint32_t crtc_id,
>> +		struct msm_display_topology *topology)
>> +{
>> +	int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
>> +	int cwb_pp_idx[MAX_BLOCKS];
>> +
>> +	/*
>> +	 * Reserve additional dedicated CWB pingpong blocks for each mixer
>> +	 *
>> +	 * TODO: add support for reserving non-dedicated CWB pingpong blocks
>> +	 */
>> +	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
>> +			cwb_pp_count < num_cwb_pp; i++) {
>> +		for (int j = PINGPONG_CWB_0 - PINGPONG_0;
>> +				j < ARRAY_SIZE(rm->pingpong_blks); j++) {
> 
> Alignment...

Ack -- for future reference, should I always align the second line with 
the bracket of the previous line?

I thought the general guideline was 2 tabs, but I might be misremembering.

Thanks,

Jessica Zhang

> 
>> +			/*
>> +			 * Odd LMs must be assigned to odd pingpongs and even
>> +			 * LMs with even pingpongs
>> +			 */
>> +			if (reserved_by_other(global_state->pingpong_to_crtc_id,
>> +						j, crtc_id) ||
>> +					i % 2 != j % 2)
>> +				continue;
>> +
>> +			cwb_pp_idx[cwb_pp_count] = j;
>> +			cwb_pp_count++;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (cwb_pp_count != num_cwb_pp) {
>> +		DPU_ERROR("Unable to reserve all cwb pingpongs\n");
>> +		return -ENAVAIL;
>> +	}
>> +
>> +	for (int i = 0; i < cwb_pp_count; i++)
>> +		global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
>>    *	proposed use case requirements, incl. hardwired dependent blocks like
>> @@ -617,6 +659,14 @@ static int _dpu_rm_make_reservation(
>>   		return ret;
>>   	}
>>   
>> +	if (topology->cwb_enabled) {
>> +		ret = _dpu_rm_reserve_cwb_pingpong(rm, global_state,
>> +				crtc_id, topology);
>> +		if (ret) {
>> +			DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
>> +			return ret;
>> +		}
>> +	}
>>   
>>   	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
>>   			topology);
>> @@ -706,6 +756,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>   
>>   	switch (type) {
>>   	case DPU_HW_BLK_PINGPONG:
>> +	case DPU_HW_BLK_DCWB_PINGPONG:
>>   		hw_blks = rm->pingpong_blks;
>>   		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
>>   		max_blks = ARRAY_SIZE(rm->pingpong_blks);
>> @@ -745,6 +796,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>   		if (hw_to_crtc_id[i] != crtc_id)
>>   			continue;
>>   
>> +		if (type == DPU_HW_BLK_PINGPONG) {
>> +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
>> +
>> +			if (pp->idx >= PINGPONG_CWB_0)
>> +				continue;
>> +		}
>> +
>> +		if (type == DPU_HW_BLK_DCWB_PINGPONG) {
>> +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
>> +
>> +			if (pp->idx < PINGPONG_CWB_0)
>> +				continue;
>> +		}
>> +
>>   		if (num_blks == blks_size) {
>>   			DPU_ERROR("More than %d resources assigned to crtc %d\n",
>>   				  blks_size, crtc_id);
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry
