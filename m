Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1303961893
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 22:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1D910E41A;
	Tue, 27 Aug 2024 20:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pGHS+q+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF1C10E40E;
 Tue, 27 Aug 2024 20:35:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RJlVNG000564;
 Tue, 27 Aug 2024 20:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zJbWYL5QIk0NL5D/g7tKGEXfKmIKWAyF3IUs2YNz8XI=; b=pGHS+q+FY+/I2Aoe
 H3l8GxMa7tbwwDAubvU/kK60AeZz/VI061CzO4g6X19G+DUZW2EHdDD00H+HLoaj
 hCJTzwMHHBQ0ILt6+yKVvhWaXAmCU4k1jH3tt4D2b47vnrC7vrIS8ZQg0AcIYuSv
 u7zQqsIss450WS7K/beEEjdQk0cyyI6MecuXa7/sygtBWjRai/FS2Z9Ef/21UINR
 3ll3gW6ng42Lzo8T7a3srUJX4uBhh+u2n6MOxj0HdCLHQthJN2qegO4b3sMAxHXE
 89ZfX6thIqDcfhwyOPEwrZLHLz/fEGqGIWWs76K1W37gta6aYn0NU+Hg8ex7HVeZ
 KNcH0Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419aq7a3d2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 20:35:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RKZodo021325
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 20:35:50 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 13:35:49 -0700
Message-ID: <5ce9489c-6fb4-435c-b461-e1774817218f@quicinc.com>
Date: Tue, 27 Aug 2024 13:35:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/16] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_mode_set
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-3-501d984d634f@linaro.org>
 <cd60db7e-4ff2-445e-a8f8-b22d73d0f2b3@quicinc.com>
 <CAA8EJpqzu0E=Cj+FpdjXdvterkPeXqwz_GFsut9jLaOawQTRjw@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqzu0E=Cj+FpdjXdvterkPeXqwz_GFsut9jLaOawQTRjw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: USWzkQ27TakMYgjEJV4jlCcZH_AA1ZnX
X-Proofpoint-ORIG-GUID: USWzkQ27TakMYgjEJV4jlCcZH_AA1ZnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270151
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



On 7/16/2024 4:06 PM, Dmitry Baryshkov wrote:
> On Wed, 17 Jul 2024 at 01:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
>>> Historically CRTC resources (LMs and CTLs) were assigned in
>>> dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
>>> resource tracking to crtc state") simply moved resources to
>>> struct dpu_crtc_state, without changing the code sequence. Later on the
>>> commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
>>> modeset") rearanged the code, but still kept the cstate->num_mixers
>>> assignment to happen during commit phase. This makes dpu_crtc_state
>>> inconsistent between consequent atomic_check() calls.
>>>
>>> Move CRTC resource assignment to happen at the end of
>>> dpu_encoder_virt_atomic_check().
>>>

I just realized, why is the subject saying 
dpu_encoder_virt_atomic_mode_set while the patch is moving the 
assignment to dpu_encoder_virt_atomic_check(). It should say 
dpu_encoder_virt_atomic_check().

One more commment below.

>>> Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 60 +++++++++++++++++++----------
>>>    2 files changed, 39 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 9f2164782844..7399794d75eb 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -1094,9 +1094,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>>>        drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
>>>                dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
>>>
>>> -     memset(cstate->mixers, 0, sizeof(cstate->mixers));
>>> -     cstate->num_mixers = 0;
>>> -
>>
>> Any reason this part was removed?
>>
>> I think we still need this part.
>>
>> In dpu_encoder_get_topology(), we do not assign topology.num_lm based on
>> state parameters, its based on catalog and intf_count which are decided
>> at init time itself.
>>
>> Which means cstate->num_mixers will remain at a non-zero value even if
>> we have NO_MODE which is what happens when we are disabling the CRTC
>> during suspend or hotplug.
> 
> In the disable path the driver calls dpu_rm_release(), releasing all
> resources. So there will be no assigned mixers, which matches num_lm =
> 0 in dpu_encoder_assign_crtc_resources().
> 

Ack.

>>
>>>        /* disable clk & bw control until clk & bw properties are set */
>>>        cstate->bw_control = false;
>>>        cstate->bw_split_vote = false;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 7613005fbfea..98f3a8d84300 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -628,6 +628,41 @@ static struct msm_display_topology dpu_encoder_get_topology(
>>>        return topology;
>>>    }
>>>
>>> +static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
>>> +                                           struct drm_encoder *drm_enc,
>>> +                                           struct dpu_global_state *global_state,
>>> +                                           struct drm_crtc_state *crtc_state)
>>> +{
>>> +     struct dpu_crtc_state *cstate;
>>> +     struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>>> +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>>> +     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
>>> +     int num_lm, num_ctl, num_dspp, i;
>>> +
>>> +     cstate = to_dpu_crtc_state(crtc_state);
>>> +
>>> +     memset(cstate->mixers, 0, sizeof(cstate->mixers));
>>> +
>>> +     num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>> +             drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>>> +     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>> +             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
>>> +     num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>> +             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
>>> +             ARRAY_SIZE(hw_dspp));
>>> +
>>> +     for (i = 0; i < num_lm; i++) {
>>> +             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
>>> +
>>> +             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
>>> +             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
>>> +             if (i < num_dspp)
>>
>> Will there be a case where num_lm != num_dspp?
> 
> No, _dpu_rm_check_lm_and_get_connected_blks() makes sure that num_lm = num_dspp.
> I will drop this condition and add a comment.
> 
>>
>>> +                     cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
>>> +     }
>>> +
>>> +     cstate->num_mixers = num_lm;
>>> +}
>>> +
>>>    static int dpu_encoder_virt_atomic_check(
>>>                struct drm_encoder *drm_enc,
>>>                struct drm_crtc_state *crtc_state,
>>> @@ -698,6 +733,9 @@ static int dpu_encoder_virt_atomic_check(
>>>                                        drm_enc, crtc_state, topology);
>>>        }
>>>
>>> +     if (!ret)
>>> +             dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc, global_state, crtc_state);
>>> +

Do we need to protect this with a needs_modeset() condition? Like why 
should this get called every check?

>>>        trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
>>>
>>>        return ret;
>>> @@ -1097,14 +1135,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>        struct dpu_encoder_virt *dpu_enc;
>>>        struct msm_drm_private *priv;
>>>        struct dpu_kms *dpu_kms;
>>> -     struct dpu_crtc_state *cstate;
>>>        struct dpu_global_state *global_state;
>>>        struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>>>        struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>>> -     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>>> -     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>>>        struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>>> -     int num_lm, num_ctl, num_pp, num_dsc;
>>> +     int num_ctl, num_pp, num_dsc;
>>>        unsigned int dsc_mask = 0;
>>>        int i;
>>>
>>> @@ -1133,11 +1168,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>                ARRAY_SIZE(hw_pp));
>>>        num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>                drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>>> -     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>> -             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
>>> -     dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>> -             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
>>> -             ARRAY_SIZE(hw_dspp));
>>>
>>>        for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>>>                dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>>> @@ -1163,18 +1193,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>                dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
>>>        }
>>>
>>> -     cstate = to_dpu_crtc_state(crtc_state);
>>> -
>>> -     for (i = 0; i < num_lm; i++) {
>>> -             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
>>> -
>>> -             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
>>> -             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
>>> -             cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
>>> -     }
>>> -
>>> -     cstate->num_mixers = num_lm;
>>> -
>>>        dpu_enc->connector = conn_state->connector;
>>>
>>>        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>
> 
> 
> 
