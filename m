Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BAAA4F1B5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 00:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82E510E6CF;
	Tue,  4 Mar 2025 23:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TGusw6Gd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32E910E6CF;
 Tue,  4 Mar 2025 23:43:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NAVSA016297;
 Tue, 4 Mar 2025 23:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 60R6MOgTphCQY/l+3pJzxtKyPmMSKcCkUiBlFD++kaw=; b=TGusw6Gdq7nlmJQ+
 SpmoQq2QjX7jAXT8jbRYL+Q9o9F6cisJl0+m2fANmBg5UVL28HKNEl0UZH0wxpMo
 mR+1Vc2bJGzwevIPYDziIWL5iWP/mpFUc2d5AIFC8pJmfGKS9+IdkI9aMhmAAja1
 qB1XT4Uc/Bq/poYGiKelktqEBJ8znjNf8UFM/nKrAIIUIV5m0Y5eQBL6NtGU0a0I
 QPegzTVfEs4M9WwIxawu0bdnPAAfU0TineLxYyYYuZUlbI0XJwUiXHl/WETkRXtO
 H08omAgAjFAtPe1GUidktD1pEChG9gog4GF5OOQBgVNuWnCESU+itcg527DG0nE1
 mh51fA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6wkf50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Mar 2025 23:43:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524NhiY6011752
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Mar 2025 23:43:44 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 15:43:44 -0800
Message-ID: <90e91cd7-e5d7-4d0f-aef8-e19b9f0e336b@quicinc.com>
Date: Tue, 4 Mar 2025 15:43:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm/dpu: Force modeset if new CTLs have been
 reserved
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250303-force-modeset-hw-ctl-v1-1-9cbf6d4fbf8e@quicinc.com>
 <flc3cyky4wxfin7dlxhukwmhonze3napmuyhl2s6jbsgepco7a@q4l2ndh23lus>
 <4bb1d4a7-dd0b-4565-8d5d-ff8fd4cda20a@quicinc.com>
 <CAA8EJppMV7uj6w1_qr2AMVT7KYJiVqPRWBibqXtf3adLpRKcrw@mail.gmail.com>
 <a098b6f9-547d-42c7-b4f5-91762dc7c631@quicinc.com>
 <imxktwztfjyh4v6yuldgsluwv7wrx7qhvhgzsllnz3hnmmbc23@pnrfmdnjxg3b>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <imxktwztfjyh4v6yuldgsluwv7wrx7qhvhgzsllnz3hnmmbc23@pnrfmdnjxg3b>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZcyQOmC c=1 sm=1 tr=0 ts=67c79031 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=30I9T8bJxhHVpPDulwQA:9 a=QEXdDO2ut3YA:10 a=QOpKv_Gl0K8A:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ynBMH8dwrV9iLzsddS7oxdTQTCBWDnn7
X-Proofpoint-ORIG-GUID: ynBMH8dwrV9iLzsddS7oxdTQTCBWDnn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503040190
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



On 3/4/2025 12:42 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 04, 2025 at 11:38:24AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 3/3/2025 9:32 PM, Dmitry Baryshkov wrote:
>>> On Tue, 4 Mar 2025 at 03:44, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 3/3/2025 3:49 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Mar 03, 2025 at 10:28:00AM -0800, Jessica Zhang wrote:
>>>>>> If new CTLs are reserved by CRTC but atomic_enable() is skipped, the
>>>>>> encoders will configure the stale CTL instead of the newly reserved one.
>>>>>
>>>>> The CTLs are propagates in .atomic_mode_set(), not in .atomic_enable().
>>>>
>>>> Hi Dmitry,
>>>>
>>>> Yes, sorry mixed up the two function ops here and in my reply in the CWB
>>>> thread.
>>>>
>>>>>
>>>>>>
>>>>>> Avoid this by setting mode_changed to true if new CTLs have been
>>>>>> reserved by CRTC.
>>>>>
>>>>> This looks very strange. First we reserve new CTLs when there is a
>>>>> modeset requested. Then on one of the next commits we detect that
>>>>> encoder has stale CTLs and try to upgrade the commit to full modeset
>>>>> (while the user might not have .allow_modeset set to true for whatever
>>>>> reason, e.g. because only ACTIVE is changed).
>>>>
>>>> Ah I see what you mean. I think this is an issue with how/when we're
>>>> calling dpu_rm_reserve(). Since RM reservation is tied to
>>>> atomic_check(), we aren't able to force a modeset based on HW block
>>>> reservation. The only reason we were able to avoid this issue with
>>>> needs_cdm is because needs_cdm didn't depend on the CDM HW block index.
>>>>
>>>> I think there's not really a good way to avoid this other than flipping
>>>> the order of the msm_atomic_check to drm_helper_atomic_check ->
>>>> dpu_kms.check_mode_changed -> drm_atomic_helper_check_modeset().
>>>
>>> No-no-no. This would require a full drm_atomic_helper_check() call
>>> again, after the check_mode_changed() callback. But again, this should
>>> not be required at all. The whole point of .check_mode_changed() is to
>>> be called before performing full atomic_check() chains.
>>>
>>
>> Right but the documentation also allows calling
>> drm_atomic_helper_check_modeset() again. We are looking at all options even
>> moving forward and not just this issue.
> 
> It does. But I'd rather not do it. Especially not in this case: we
> perfectly know in advance if hw resources were reallocated or not.
> 
>>
>>>>
>>>> What do you think? It seems to be valid given the examples in the DRM
>>>> docs [1]
>>>>
>>>> [1]
>>>> https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/drm_atomic_helper.c#L610
>>>>
>>>>>
>>>>> Could you please check if the following change fixes the issue: in
>>>>> crtc_set_mode() replace the raw !new_crtc_state->mode_changed check with
>>>>> the drm_atomic_crtc_needs_modeset() call?
>>>>
>>>> This also fixes the DPMS failures. IIRC Abhinav had suggested a similar
>>>> change to fix a different issue [2] and you gave some feedback on
>>>> avoiding mode_set() for enable/disable calls which don't have mode_changed.
>>>
>>> After reading the documentation for
>>> drm_encoder_helper_funcs.atomic_mode_set() and looking around, I think
>>> the issue is in the handling of the DPMS functions. I might have a fix
>>> for the issue.
>>>
>>>> Also, while this may fix the CWB CI failures, wouldn't the issue still
>>>> remain regarding how to force modeset for changes in HW block reservation?
>>>
>>> I think it is the other way around: HW block reservation is only
>>> changed if there is a modeset. I'm currently testing my theory :-) We
>>> were performing HW reassignment if drm_atomic_crtc_needs_modeset() was
>>> true. However this function returns true in one of the cases, where
>>> there is no actual modeset happening (and it's even documented this
>>> way) - when only DPMS call has happened (in other words, when
>>> .active_changed = true, but two other bits are false). It is required
>>> not to reassign HW resources in such a case. So, I think, a correct
>>> fix is to change the condition in dpu_crtc_atomic_check().
>>>
>>
>> Yes, Jessica had also suggested this option. This will work because now the
>> resource re-assignment will not happen and hence will avoid the issue. The
>> documentation of DPMS was not fully clear. So it said, the same thing you
>> mentioned, that when active has changed there is no need to reassign
>> hardware resources but I was not sure if that would impact normal
>> suspend/resume because across suspend/resume hardware resources need to be
>> cleared / re-assigned.
> 
> Suspend / resume is handled via the helpers, which commit an
> all-disabled state and then commit a previous state. Other than that,
> there is no need to clear resource assignments during suspend resume.
> They should be disabled, but there is no need to drop the assignment.
> 

We will need to do some testing to make sure this does not introduce 
some other regressions. You can post your change, we can discuss it there.

>> I do still think that, even if this also works, we
>> will still run into issues when we will need to force a mode_changed based
>> on resource assignment of other encoder based blocks such as DSC or PP etc.
> 
> This is what dpu_encoder_needs_modeset() is for. On the other hand,
> note, if we reassigned resources, it means that either mode_changes or
> connectors_changed is set. And the DRM framework will call encoder's
> atomic_mode_set() in such a case.
> 

Like we wrote, dpu_encoder_needs_modeset() is not useful without the 
sequence change in msm_atomic_check because dpu_encoder_needs_modeset() 
is called before the resource assignments are done today.

>>
>>>>
>>>> [2] https://gitlab.freedesktop.org/drm/msm/-/issues/59
>>>>
>>>> Thanks,
>>>>
>>>> Jessica Zhang
>>>>
>>>>>
>>>>>>
>>>>>> Note: This patch only adds tracking for the CTL reservation, but eventually
>>>>>> all HW blocks used by encoders (i.e. DSC, PINGPONG, CWB) should have a
>>>>>> similar check to avoid the same issue.
>>>>>>
>>>>>> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> Closes: https://lists.freedesktop.org/archives/freedreno/2025-February/036719.html
>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++++
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++++++
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 +
>>>>>>     3 files changed, 26 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>> index 4073d821158c0..a1a8be8f5ab9f 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>> @@ -1406,19 +1406,32 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
>>>>>>        struct drm_crtc *crtc = new_crtc_state->crtc;
>>>>>>        bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
>>>>>>        bool clone_mode_requested = drm_crtc_in_clone_mode(new_crtc_state);
>>>>>> +    struct dpu_crtc_state *cstate = to_dpu_crtc_state(new_crtc_state);
>>>>>> +    uint32_t enc_ctl_mask = 0;
>>>>>> +    uint32_t crtc_ctl_mask = 0;
>>>>>> +    struct dpu_crtc_mixer *m;
>>>>>>
>>>>>>        DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
>>>>>>
>>>>>> +    for (int i = 0; i < cstate->num_mixers; i++) {
>>>>>> +            m = &cstate->mixers[i];
>>>>>> +            crtc_ctl_mask |= BIT(m->lm_ctl->idx - CTL_0);
>>>>>> +    }
>>>>>> +
>>>>>>        /* there might be cases where encoder needs a modeset too */
>>>>>>        drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
>>>>>>                if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
>>>>>>                        new_crtc_state->mode_changed = true;
>>>>>> +            enc_ctl_mask |= dpu_encoder_get_ctls(drm_enc);
>>>>>>        }
>>>>>>
>>>>>>        if ((clone_mode_requested && !clone_mode_enabled) ||
>>>>>>            (!clone_mode_requested && clone_mode_enabled))
>>>>>>                new_crtc_state->mode_changed = true;
>>>>>>
>>>>>> +    if (crtc_ctl_mask != enc_ctl_mask)
>>>>>> +            new_crtc_state->mode_changed = true;
>>>>>> +
>>>>>>        return 0;
>>>>>>     }
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> index a61598710acda..2f3101caeba91 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> @@ -188,6 +188,7 @@ struct dpu_encoder_virt {
>>>>>>
>>>>>>        unsigned int dsc_mask;
>>>>>>        unsigned int cwb_mask;
>>>>>> +    unsigned int ctl_mask;
>>>>>>
>>>>>>        bool intfs_swapped;
>>>>>>
>>>>>> @@ -707,6 +708,13 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>>>>>>        }
>>>>>>     }
>>>>>>
>>>>>> +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc)
>>>>>> +{
>>>>>> +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>>>> +
>>>>>> +    return dpu_enc->ctl_mask;
>>>>>> +}
>>>>>> +
>>>>>>     bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
>>>>>>     {
>>>>>>        struct drm_connector *connector;
>>>>>> @@ -1155,6 +1163,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>>>        bool is_cwb_encoder;
>>>>>>        unsigned int dsc_mask = 0;
>>>>>>        unsigned int cwb_mask = 0;
>>>>>> +    unsigned int ctl_mask = 0;
>>>>>>        int i;
>>>>>>
>>>>>>        if (!drm_enc) {
>>>>>> @@ -1245,11 +1254,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>>>                                "no ctl block assigned at idx: %d\n", i);
>>>>>>                        return;
>>>>>>                }
>>>>>> +            ctl_mask |= BIT(phys->hw_ctl->idx - CTL_0);
>>>>>>
>>>>>>                phys->cached_mode = crtc_state->adjusted_mode;
>>>>>>                if (phys->ops.atomic_mode_set)
>>>>>>                        phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>>>>>>        }
>>>>>> +
>>>>>> +    dpu_enc->ctl_mask = ctl_mask;
>>>>>>     }
>>>>>>
>>>>>>     static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>>> index ca1ca2e51d7ea..70b03743dc346 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>>> @@ -91,6 +91,7 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
>>>>>>
>>>>>>     void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
>>>>>>                struct drm_writeback_job *job);
>>>>>> +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc);
>>>>>>
>>>>>>     void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>>>>>>                struct drm_writeback_job *job);
>>>>>>
>>>>>> ---
>>>>>> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
>>>>>> change-id: 20250228-force-modeset-hw-ctl-d02b80a2bb4c
>>>>>> prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
>>>>>> prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
>>>>>> prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
>>>>>> prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
>>>>>> prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
>>>>>> prerequisite-change-id: 20250209-dpu-c3fac78fc617:v2
>>>>>> prerequisite-patch-id: c84d2b4b06be06384968429085d1e8ebae23a583
>>>>>> prerequisite-patch-id: fb8ea7b9e7c85fabd27589c6551108382a235002
>>>>>> prerequisite-change-id: 20250211-dither-disable-b77b1e31977f:v1
>>>>>> prerequisite-patch-id: 079e04296212b4b83d51394b5a9b5eea6870d98a
>>>>>> prerequisite-change-id: 20240618-concurrent-wb-97d62387f952:v6
>>>>>> prerequisite-patch-id: b52034179741dc182aea9411fd446e270fdc69d1
>>>>>> prerequisite-patch-id: bc472765a7d5214691f3d92696cc8b0119f3252e
>>>>>> prerequisite-patch-id: c959bc480e96b04297ebaf30fea3a68bbac69da6
>>>>>> prerequisite-patch-id: f7db8449b241a41faac357d9257f8c7cb16503ec
>>>>>> prerequisite-patch-id: 7beb73131d0ab100f266fcd3c1f67c818a3263f4
>>>>>> prerequisite-patch-id: c08cbb5cf4e67e308afd61fdad6684b89429d3b6
>>>>>> prerequisite-patch-id: a4e343143b8fbe98ae4aa068cc459c750105eb9d
>>>>>> prerequisite-patch-id: 1d09edcf12ef7e7ab43547eefacae5b604b698e9
>>>>>> prerequisite-patch-id: 0008f9802bfd3c5877267666cceb7608203e5830
>>>>>> prerequisite-patch-id: 49402eb767c97915faf2378c5f5d05ced2dcfdac
>>>>>> prerequisite-patch-id: 522be2a6b5fe4e3a2d609526bb1539f9bc6f828f
>>>>>> prerequisite-patch-id: 031da00d0fffd522f74d682a551362f3ecda0c71
>>>>>> prerequisite-patch-id: 9454cec22231a8f3f01c33d52a5df3e26dd88287
>>>>>> prerequisite-patch-id: 7edbeaace3549332e581bee3183a76b0e4d18163
>>>>>>
>>>>>> Best regards,
>>>>>> --
>>>>>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>
>>>>>
>>>>> --
>>>>> With best wishes
>>>>> Dmitry
>>>>
>>>
>>>
>>
> 

