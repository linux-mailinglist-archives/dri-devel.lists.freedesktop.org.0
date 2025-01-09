Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031C0A082FC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 23:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D2310E4A2;
	Thu,  9 Jan 2025 22:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aJOuJZ4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C3110E4A0;
 Thu,  9 Jan 2025 22:53:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D8cmY011816;
 Thu, 9 Jan 2025 22:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xPRuV5Ul2dGp/pg+Ad9ySB7JPgcexUrkU+K4xrgJ4rs=; b=aJOuJZ4YC8pmLEeH
 Wcd/f6V/jPpE5owFWgoAzn/XT4nUOrksw4PwyVqlE2Wg3xPat6nQl12SRkZ00Y4a
 zTyCGWTaY8mwKWG8W998c6r0CTiauxdpMAcSsCqbBgDzdgxh/e4kkN0kMLYniVSy
 16n76bYw56U/r9bWPxh7WIPJW2txrbdFRZnFUQ8xetoGrQm3scvVN2e3YqPAEoTw
 sHB4nCYaBYR8G0OTydadzP6wU15zDp35c05OUXm7Y5QPKrA5CbR8T61+W0sMsfEj
 0sEvUPSj7hpMtdc34oKMqxXwudz12sCfojeH7BWSQ9H89l31rRlSgxXXhJHC63kn
 hpBKMA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2ks8xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 22:53:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509Mrjeh020613
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 22:53:45 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 14:53:41 -0800
Message-ID: <d59e94e1-cffd-411f-95af-1ed6806ae5cb@quicinc.com>
Date: Thu, 9 Jan 2025 14:53:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/25] drm/msm/dpu: Reserve resources for CWB
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-18-fe220297a7f0@quicinc.com>
 <z6pebzm5yxaqqmktu4jjjy4rojkdarrqrwo4ikmv6jzku7foyf@cc325q3dfgif>
 <ddd1db49-39d8-44b6-b658-b30fe8ba4428@quicinc.com>
 <pp2uifxzgqmg3ske3mmlgznzb76eovxvgv6y6kfafk5wvoq3ou@5x7bwdkipius>
 <5f054c0a-8f1f-4b13-bb5d-505ce4dbfb34@quicinc.com>
 <jtovhd4zsaumm27gzwlkufqywyr2he36rmo6jjm2vnchkjeugd@fdpws67sjlfx>
 <a8e6be19-06c8-4f95-a31f-2be5f27f2e6a@quicinc.com>
 <CAA8EJprtbswuxGr3237PAHQY_KqxpfqS5AXRjAQA1sxUkvgumg@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJprtbswuxGr3237PAHQY_KqxpfqS5AXRjAQA1sxUkvgumg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NYLqKSkAcVeX56Jp3TDgRYnBDySwCmj_
X-Proofpoint-ORIG-GUID: NYLqKSkAcVeX56Jp3TDgRYnBDySwCmj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090180
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



On 1/9/2025 2:13 PM, Dmitry Baryshkov wrote:
> On Thu, 9 Jan 2025 at 23:26, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>
>>
>> On 12/28/2024 8:47 PM, Dmitry Baryshkov wrote:
>>> On Thu, Dec 26, 2024 at 02:49:28PM -0800, Jessica Zhang wrote:
>>>>
>>>>
>>>> On 12/20/2024 5:07 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Dec 20, 2024 at 04:12:29PM -0800, Jessica Zhang wrote:
>>>>>>
>>>>>>
>>>>>> On 12/19/2024 9:52 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Dec 16, 2024 at 04:43:29PM -0800, Jessica Zhang wrote:
>>>>>>>> Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
>>>>>>>>
>>>>>>>> For concurrent writeback, even-indexed CWB muxes must be assigned to
>>>>>>>> even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
>>>>>>>> even/odd rule applies for dedicated CWB PINGPONGs.
>>>>>>>>
>>>>>>>> Track the CWB muxes in the global state and add a CWB-specific helper to
>>>>>>>> reserve the correct CWB muxes and dedicated PINGPONGs following the
>>>>>>>> even/odd rule.
>>>>>>>>
>>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
>>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
>>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 83 +++++++++++++++++++++++++++++
>>>>>>>>      4 files changed, 116 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>> index a895d48fe81ccc71d265e089992786e8b6268b1b..a95dc1f0c6a422485c7ba98743e944e1a4f43539 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>> @@ -2,7 +2,7 @@
>>>>>>>>      /*
>>>>>>>>       * Copyright (C) 2013 Red Hat
>>>>>>>>       * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
>>>>>>>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>>>       *
>>>>>>>>       * Author: Rob Clark <robdclark@gmail.com>
>>>>>>>>       */
>>>>>>>> @@ -28,6 +28,7 @@
>>>>>>>>      #include "dpu_hw_dsc.h"
>>>>>>>>      #include "dpu_hw_merge3d.h"
>>>>>>>>      #include "dpu_hw_cdm.h"
>>>>>>>> +#include "dpu_hw_cwb.h"
>>>>>>>>      #include "dpu_formats.h"
>>>>>>>>      #include "dpu_encoder_phys.h"
>>>>>>>>      #include "dpu_crtc.h"
>>>>>>>> @@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
>>>>>>>>       * @cur_slave:               As above but for the slave encoder.
>>>>>>>>       * @hw_pp:           Handle to the pingpong blocks used for the display. No.
>>>>>>>>       *                   pingpong blocks can be different than num_phys_encs.
>>>>>>>> + * @hw_cwb:             Handle to the CWB muxes used for concurrent writeback
>>>>>>>> + *                      display. Number of CWB muxes can be different than
>>>>>>>> + *                      num_phys_encs.
>>>>>>>>       * @hw_dsc:          Handle to the DSC blocks used for the display.
>>>>>>>>       * @dsc_mask:                Bitmask of used DSC blocks.
>>>>>>>>       * @intfs_swapped:   Whether or not the phys_enc interfaces have been swapped
>>>>>>>> @@ -177,6 +181,7 @@ struct dpu_encoder_virt {
>>>>>>>>           struct dpu_encoder_phys *cur_master;
>>>>>>>>           struct dpu_encoder_phys *cur_slave;
>>>>>>>>           struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>>>>>>>> +        struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
>>>>>>>>           struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>>>>>>>>           unsigned int dsc_mask;
>>>>>>>> @@ -1138,7 +1143,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>>>>>           struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>>>>>>>>           struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>>>>>>>>           struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>>>>>>>> +        struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
>>>>>>>>           int num_pp, num_dsc, num_ctl;
>>>>>>>> +        int num_cwb = 0;
>>>>>>>> +        bool is_cwb_encoder;
>>>>>>>>           unsigned int dsc_mask = 0;
>>>>>>>>           int i;
>>>>>>>> @@ -1152,6 +1160,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>>>>>           priv = drm_enc->dev->dev_private;
>>>>>>>>           dpu_kms = to_dpu_kms(priv->kms);
>>>>>>>> +        is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
>>>>>>>> +                        dpu_enc->disp_info.intf_type == INTF_WB;
>>>>>>>>           global_state = dpu_kms_get_existing_global_state(dpu_kms);
>>>>>>>>           if (IS_ERR_OR_NULL(global_state)) {
>>>>>>>> @@ -1162,9 +1172,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>>>>>           trace_dpu_enc_mode_set(DRMID(drm_enc));
>>>>>>>>           /* Query resource that have been reserved in atomic check step. */
>>>>>>>> -        num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>>>>>> -                drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>>>>>>>> -                ARRAY_SIZE(hw_pp));
>>>>>>>> +        if (is_cwb_encoder) {
>>>>>>>> +                num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>>>>>> +                                                       drm_enc->crtc,
>>>>>>>> +                                                       DPU_HW_BLK_DCWB_PINGPONG,
>>>>>>>> +                                                       hw_pp, ARRAY_SIZE(hw_pp));
>>>>>>>> +                num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>>>>>> +                                                       drm_enc->crtc,
>>>>>>>> +                                                       DPU_HW_BLK_CWB,
>>>>>>>> +                                                       hw_cwb, ARRAY_SIZE(hw_cwb));
>>>>>>>> +        } else {
>>>>>>>> +                num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>>>>>> +                                                       drm_enc->crtc,
>>>>>>>> +                                                       DPU_HW_BLK_PINGPONG, hw_pp,
>>>>>>>> +                                                       ARRAY_SIZE(hw_pp));
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        for (i = 0; i < num_cwb; i++)
>>>>>>>> +                dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
>>>>>>>> +
>>>>>>>>           num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>>>>>>                           drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>>>>>> index ba7bb05efe9b8cac01a908e53121117e130f91ec..8d820cd1b5545d247515763039b341184e814e32 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>>>>>> @@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
>>>>>>>>           DPU_HW_BLK_LM,
>>>>>>>>           DPU_HW_BLK_CTL,
>>>>>>>>           DPU_HW_BLK_PINGPONG,
>>>>>>>> +        DPU_HW_BLK_DCWB_PINGPONG,
>>>>>>>>           DPU_HW_BLK_INTF,
>>>>>>>>           DPU_HW_BLK_WB,
>>>>>>>>           DPU_HW_BLK_DSPP,
>>>>>>>>           DPU_HW_BLK_MERGE_3D,
>>>>>>>>           DPU_HW_BLK_DSC,
>>>>>>>>           DPU_HW_BLK_CDM,
>>>>>>>> +        DPU_HW_BLK_CWB,
>>>>>>>>           DPU_HW_BLK_MAX,
>>>>>>>>      };
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>>>>> index 48d756d8f8c6e4ab94b72bac0418320f7dc8cda8..1fc8abda927fc094b369e0d1efc795b71d6a7fcb 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>>>>> @@ -128,6 +128,7 @@ struct dpu_global_state {
>>>>>>>>           uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
>>>>>>>>           uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
>>>>>>>>           uint32_t cdm_to_crtc_id;
>>>>>>>> +        uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
>>>>>>>>      };
>>>>>>>>      struct dpu_global_state
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>>>> index 85adaf256b2c705d2d7df378b6ffc0e578f52bc3..ead24bb0ceb5d8ec4705f0d32330294d0b45b216 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>>>> @@ -234,6 +234,55 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>>>>>>>>           return -EINVAL;
>>>>>>>>      }
>>>>>>>> +static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
>>>>>>>> +                                                 struct dpu_global_state *global_state,
>>>>>>>> +                                                 uint32_t crtc_id,
>>>>>>>> +                                                 struct msm_display_topology *topology)
>>>>>>>> +{
>>>>>>>> +        int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
>>>>>>>> +        int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
>>>>>>>> +        int cwb_pp_idx[MAX_BLOCKS];
>>>>>>>> +        int cwb_mux_idx[MAX_BLOCKS];
>>>>>>>> +
>>>>>>>> +        /*
>>>>>>>> +         * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
>>>>>>>> +         * mixer
>>>>>>>> +         *
>>>>>>>> +         * TODO: add support reserving resources for platforms with no
>>>>>>>> +         *       PINGPONG_CWB
>>>>>>>
>>>>>>> What about doing it other way around: allocate CWBs first as required
>>>>>>> (even/odd, proper count, etc). Then for each of CWBs allocate a PP block
>>>>>>> (I think it's enough to simply make CWB blocks have a corresponding PP
>>>>>>> index as a property). This way the driver can handle both legacy and
>>>>>>> current platforms.
>>>>>>
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> Sorry if I'm misunderstanding your suggestion, but the main change needed to
>>>>>> support platforms with no dedicated PINGPONG_CWB is where in the
>>>>>> rm->pingpong_blks list to start assigning pingpong blocks for the CWB mux.
>>>>>> I'm not sure how changing the order in which CWBs and the pingpong blocks
>>>>>> are assigned will address that.
>>>>>>
>>>>>> (FWIW, the only change necessary to add support for non-dedicated
>>>>>> PINGPONG_CWBs platforms for this function should just be changing the
>>>>>> initialization value of cwb_pp_start_idx)
>>>>>
>>>>> If I remember correctly, we have identified several generations of DPU
>>>>> wrt. CWB handling:
>>>>> - 8.1+ (or 8.0+?), DCWB, dedicated PP blocks
>>>>> - 7.2, dedicated PP_1?
>>>>> - 5.0+, shared PP blocks
>>>>> - older DPUs, special handling of PP
>>>>>
>>>>> If the driver allocates PP first and then first it has to allocated PP
>>>>> (in a platform-specific way) and then go from PINGPONG to CWB (in a
>>>>> platform-specific way). If CWB is allocated first, then you have only
>>>>> one platform-specific piece of code that gets PINGPONG for the CWB (and
>>>>> as this function is called after the CWB allocation, the major part of
>>>>> the CWB / PP allocation is generic).
>>>>
>>>> The issue with breaking this into separate helpers/functions is that the CWB
>>>> mux and PPB indices are dependent on each other. But I agree that we can
>>>> reserve CWB mux and the PPBs in 2 separate loops within this helper to
>>>> minimize the special platform-specific handling.
>>>
>>> Doesn't it just PPB depend on CWB?
>>
>> Sorry, poor wording on my part. Was referring specifically to this part
>> of the logic within the code chunk:
>>
>> ```
>> cwb_pp_idx[cwb_pp_count] = j;
>> cwb_mux_idx[cwb_pp_count] = j - cwb_pp_start_idx;
>> ```
>>
>> The point I wanted to make was that I think we can keep the CWB-specific
>> reservation of the the PPBs and muxes in this function, but I agree with
>> your suggestion to reserve the CWBs first and the PPBs second (just in
>> separate loops rather than separate functions).
> 
> Sounds fine with me. I don't think you even need a second loop, just
> simple maths should be fine.

Got it.. do you mean just swapping the current for loop logic to loop 
over all the CWB blocks instead?

So something like:

```
for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
      cwb_pp_count < num_cwb_pp; i++) {
	for (int j = cwb_pp_start_idx;
	     j < ARRAY_SIZE(rm->cwb_blks); j++) {
		/*
		 * Odd LMs must be assigned to odd PINGPONGs and even
		 * LMs with even PINGPONGs
		 */
		if (reserved_by_other(global_state->cwb_to_crtc_id, j, crtc_id) ||
		    i % 2 != j % 2)
			continue;

		cwb_mux_idx[cwb_pp_count] = j;
		cwb_pp_idx[cwb_pp_count] = j + cwb_pp_start_idx;
		cwb_pp_count++;
		break;
	}
}
```

> 
>>
>>
>>>
>>>
>>>>
>>>> Also wanted to note that the comment doc on the PPB odd/even rule is
>>>> inaccurate -- technically the odd/even rule applies specifically to the CWB
>>>> mux as odd/even LMs are hardwired to their respective CWB muxes. Will
>>>> correct the comment doc to be more accurate.
>>>
>>> Yes, please fix that.
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Jessica Zhang
>>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
>>
> 
> 
> -- 
> With best wishes
> Dmitry

