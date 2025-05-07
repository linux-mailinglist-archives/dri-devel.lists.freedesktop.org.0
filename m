Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F6AAEE7C
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 00:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6335510E29D;
	Wed,  7 May 2025 22:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CZSNusGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFAF10E273;
 Wed,  7 May 2025 22:08:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547IcQT7004262;
 Wed, 7 May 2025 22:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kMp4Q6ZI1LL7S2e4hHgVn23YEnSmtTfJjtleqi4UVRg=; b=CZSNusGvD8Ugr1Sc
 kCHw93MNOVREMIHCM4uAw6IjewHeOCo7IZdZbArMZAPREdy2oYh8wjKmDefWisIc
 E61l2qJWN8s4veXFcaQeqm8EoJNPXP50O3OWsTvnZIM85TKuXI0dm8ETlImi/bnY
 42MOHaaFaB3NXkQ2gtDUvIAz+rOZen9ez6wkL+Lw0iwxWBwyNPKATdbGob0+dTus
 /DmBnuv7xRchBYtYdEfYqdDsnuGfjGcfe482aRQYg+zOPbj5e6Fs3+tEl1vuSxY2
 6GJ4qNrv2FY2nbSzki+UVdm0WW1G8OXqU0xOOg/mmKNGYFRPSdsyGcP538NwJQoR
 w+UNWg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gcyhrdhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 May 2025 22:08:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547M8hG7009541
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 May 2025 22:08:43 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 15:08:42 -0700
Message-ID: <b74a85f2-742c-4978-9865-8a9dea86e211@quicinc.com>
Date: Wed, 7 May 2025 15:08:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
CC: Dmitry Baryshkov <lumag@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>, "Rob
 Clark" <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 <laurentiu.tudor1@dell.com>, <abel.vesa@linaro.org>,
 <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-5-alex.vinarskis@gmail.com>
 <6495e342-512f-469f-9d66-bb9f47fb551d@quicinc.com>
 <CAMcHhXqFE6-tnT0m9=3N1wSaTyEPMFA0zTfVqwJmgqz60tBAoQ@mail.gmail.com>
 <d1eb55ae-92e5-4a34-af46-5d076512a06b@quicinc.com>
 <CAMcHhXrJuADN=kN7p-YMy8vEqCk+JVfQ38S=gEW+JtDTe7mivQ@mail.gmail.com>
 <6d03ada4-fa2a-4ccc-9290-e2726cae1f28@quicinc.com>
 <CAMcHhXoS0NADUmM7MuDSCbkjrpnbyv53dNj3NiJr-tvzhVKsGw@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAMcHhXoS0NADUmM7MuDSCbkjrpnbyv53dNj3NiJr-tvzhVKsGw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: AuGee_PWkSpkH0lgpDkaE_ET8VI8KXhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDIwNSBTYWx0ZWRfX8Jmve97Bn1tK
 OhKFUSSs94ar5/u3KnX2Eo6F2+J5KLJKRx+vIRPL0rpsMvqzf/JHT5QAG94bT30Bk9YAMi/zIu5
 oQVHeZo29hjh8SnNIQ1k5aukRL0Vf+tR70AQ+ms2/6JvmeMYm3TdL0puHlQX/kFj326BPS22YIQ
 T5UezZNQYM6r4+s6hWyD7O73WEURdz4wdz3Ju5c9sVL6toRigPfalLymXjU6xrEHGo3RIByDdkA
 AraqSergci/E/Q+vVgeljN+zlDlp46WMp2px6nbnaww1EGgu8vvXk5wcT8RwhTGyLwrANANMagL
 sXXubWYdkb4HnGZFVjol1OYJj9nS06MXEoRiugd4ZMQl6G0RqWS+tzRlxqDiw5lAQWFF6+aR2l/
 XGmFOQrZxfZrKylV3V3/oagTo+J/mUvcLJ60wGipu1X/SImlfKLqgYTJcARGiK6mNfeZs8U9
X-Authority-Analysis: v=2.4 cv=SsSQ6OO0 c=1 sm=1 tr=0 ts=681bd9ec cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=hDM-Zf2Iv-PPzXRA4XAA:9 a=aAw-u2ELL3btSpO9:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AuGee_PWkSpkH0lgpDkaE_ET8VI8KXhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_07,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070205
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

Hi Alex


On 5/7/2025 3:01 PM, Aleksandrs Vinarskis wrote:
> On Tue, 6 May 2025 at 01:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Hi Alex
>>
>> On 5/4/2025 3:06 PM, Aleksandrs Vinarskis wrote:
>>> On Sun, 4 May 2025 at 05:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> Hi Alex
>>>>
>>>> Thanks for the response.
>>>>
>>>> My updates below. I also had one question for Abel below.
>>>>
>>>> Thanks
>>>>
>>>> Abhinav
>>>>
>>>> On 5/1/2025 8:56 AM, Aleksandrs Vinarskis wrote:
>>>>> On Thu, 1 May 2025 at 04:11, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
>>>>>>> DisplayPort requires per-segment link training when LTTPR are switched
>>>>>>> to non-transparent mode, starting with LTTPR closest to the source.
>>>>>>> Only when each segment is trained individually, source can link train
>>>>>>> to sink.
>>>>>>>
>>>>>>> Implement per-segment link traning when LTTPR(s) are detected, to
>>>>>>> support external docking stations. On higher level, changes are:
>>>>>>>
>>>>>>> * Pass phy being trained down to all required helpers
>>>>>>> * Run CR, EQ link training per phy
>>>>>>> * Set voltage swing, pre-emphasis levels per phy
>>>>>>>
>>>>>>> This ensures successful link training both when connected directly to
>>>>>>> the monitor (single LTTPR onboard most X1E laptops) and via the docking
>>>>>>> station (at least two LTTPRs).
>>>>>>>
>>>>>>> Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
>>>>>>>
>>>>>>
>>>>>> Thanks for the patch to improve and add support for link training in
>>>>>> non-transparent mode.
>>>>>>
>>>>>> Some questions below as the DP 2.1a spec documentation is not very clear
>>>>>> about segmented link training as you noted in the cover letter, so I am
>>>>>> also only reviewing i915 as reference here.
>>>>>>
>>>>>>
>>>>>>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>>>>>>> Tested-by: Rob Clark <robdclark@gmail.com>
>>>>>>> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
>>>>>>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>>>>>>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
>>>>>>>      1 file changed, 89 insertions(+), 37 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>>> index d8633a596f8d..35b28c2fcd64 100644
>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>>> @@ -1034,10 +1034,12 @@ static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
>>>>>>>          return 0;
>>>>>>>      }
>>>>>>>
>>>>>>> -static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
>>>>>>> +static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private *ctrl,
>>>>>>> +                                     enum drm_dp_phy dp_phy)
>>>>>>>      {
>>>>>>>          struct msm_dp_link *link = ctrl->link;
>>>>>>> -     int ret = 0, lane, lane_cnt;
>>>>>>> +     int lane, lane_cnt, reg;
>>>>>>> +     int ret = 0;
>>>>>>>          u8 buf[4];
>>>>>>>          u32 max_level_reached = 0;
>>>>>>>          u32 voltage_swing_level = link->phy_params.v_level;
>>>>>>> @@ -1075,8 +1077,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
>>>>>>>
>>>>>>>          drm_dbg_dp(ctrl->drm_dev, "sink: p|v=0x%x\n",
>>>>>>>                          voltage_swing_level | pre_emphasis_level);
>>>>>>> -     ret = drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
>>>>>>> -                                     buf, lane_cnt);
>>>>>>> +
>>>>>>> +     if (dp_phy == DP_PHY_DPRX)
>>>>>>> +             reg = DP_TRAINING_LANE0_SET;
>>>>>>> +     else
>>>>>>> +             reg = DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
>>>>>>> +
>>>>>>> +     ret = drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
>>>>>>
>>>>>> For the max voltage and swing levels, it seems like we need to use the
>>>>>> source (DPTX) or the DPRX immediately upstream of the RX we are trying
>>>>>> to train. i915 achieves it with below:
>>>>>>
>>>>>>             /*
>>>>>>              * Get voltage_max from the DPTX_PHY (source or LTTPR) upstream
>>>>>> from
>>>>>>              * the DPRX_PHY we train.
>>>>>>              */
>>>>>>             if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
>>>>>>                     voltage_max = intel_dp->voltage_max(intel_dp, crtc_state);
>>>>>>             else
>>>>>>                     voltage_max = intel_dp_lttpr_voltage_max(intel_dp,
>>>>>> dp_phy + 1);
>>>>>>
>>>>
>>>> Before I update on the below set of questions from Alex, let me clarify
>>>> one point from Abel.
>>>>
>>>> Hi Abel
>>>>
>>>> Apologies to ask this late, but as per the earlier discussions we had
>>>> internally, I thought we wanted to set the LTTPR to transparent mode to
>>>> avoid the issues. The per-segment link training becomes a requirement if
>>>> we use non-transparent mode iiuc.
>>>>
>>>> In the description of the PHY_REPEATER_MODE DPCD register, it states
>>>> like below:
>>>>
>>>> "A DPTX operating with 8b/10b Link Layer (MAIN_LINK_CHANNEL_CODING_SET
>>>> register (DPCD Address 00108h) is programmed to 01h) may configure LTTPRs
>>>> to either Transparent (default) or Non-transparent mode.
>>>> A DPTX that establishes the DP link with 128b/132b channel coding shall
>>>> write
>>>> 02h to the MAIN_LINK_CHANNEL_CODING_SET register and configure LTTPRs
>>>> to Non-transparent mode."
>>>>
>>>> As per the msm dp code, we are using 8b/10b encoding, like below
>>>>
>>>> static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>>>                            int *training_step)
>>>> {
>>>>            int ret = 0;
>>>>            const u8 *dpcd = ctrl->panel->dpcd;
>>>>            u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
>>>>
>>>> So can you pls elaborate why we set the PHY_REPEATER_MODE to
>>>> non-transparent mode because drm_dp_lttpr_init() will set the LTTPR to
>>>> non-transparent mode.
>>>>
>>>> The second part of the section is what was described in the commit text
>>>> of the 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling") but
>>>>
>>>> "Before performing link training with LTTPR(s), the DPTX may place the
>>>> LTTPR(s) in
>>>> Non-transparent mode by first writing 55h to the PHY_REPEATER_MODE
>>>> register, and then
>>>> writing AAh. This operation does not need to be performed on subsequent
>>>> link training actions
>>>> unless a downstream device unplug event is detected."
>>>>
>>>> So just wanted to understand this better that was there any requirement
>>>> to put it to non-transparent mode other than the section of the spec
>>>> highlighted above? Because above lines are only suggesting that if we
>>>> want to put the LTTPR to non-transparent mode, how to do it but not to
>>>> always do it. Please let me know your comments.
>>>>
>>>> I shall also check internally on this to close this.
>>>>
>>>>
>>>> Hi Alex
>>>>
>>>>>>
>>>>>> But I do not see (unless I missed) how this patch takes care of this
>>>>>> requirement.
>>>>>>
>>>>>> Same holds true for preemph too
>>>>>
>>>>> Thanks for you review,
>>>>>
>>>>> This is a very good point. You are right, in the present state it does
>>>>> not. Intel's driver is verifying whether LTTPRs supports
>>>>> DP_TRAIN_LEVEL_3 or only DP_TRAIN_LEVEL_2, while my current change
>>>>> follows msm-dp's default which was recently set to DP_TRAIN_LEVEL_3
>>>>> [1]. I came to conclusion that in particular case it was not required
>>>>> to verify that LTTPR indeed supports training level 3, but do not
>>>>> remember the details as its been a few months... should've document it
>>>>> :)
>>>>>
>>>>
>>>>> As I recall, from one of the DP specs onward (has to be 1.4a then,
>>>>> since LTTPR was initially introduced in DP 1.3, but register for phy
>>>>> capabilities only added in 1.4a [2]) it mandates training level 3
>>>>> support for LTTPRs, so the assumption would've be correct in that
>>>>> case. Is this something you could verify from the official
>>>>> documentation? Unfortunately I do not have sources to back this
>>>>> statement, so it may be incorrect...
>>>>>
>>>>
>>>> I went through DP spec 1.4(a), DP 2.0 and DP 2.1(a). This is what is
>>>> mentioned below:
>>>>
>>>>
>>>> "LTTPR shall support all required voltage swing and pre-emphasis
>>>> combinations defined
>>>> in Table 3-2. The LTTPR shall reflect its support of optional Voltage
>>>> Swing Level 3
>>>> and Pre-emphasis Level 3 in the VOLTAGE_SWING_LEVEL_3_SUPPORTED and
>>>> VOLTAGE_SWING_LEVEL_3_SUPPORTED bits, respectively, in the
>>>> TRANSMITTER_CAPABILITY_PHY_REPEATERx register(s) (e.g., DPCD
>>>> Address F0021h for LTTPR1, bits 0 and 1, respectively)."
>>>>
>>>>    From this paragraph, it means that LTTPR support for levels 0/1/2 can
>>>> be assumed and level 3 is optional. Whether or not level 3 is supported
>>>> comes from the TRANSMITTER_CAPABILITY_PHY_REPEATERx register(s).
>>>>
>>>> This aligns with i915 implementation.
>>>>
>>>>
>>>> Now, right after this, there is another paragraph in the spec:
>>>>
>>>> "If the DPTX sets the voltage swing or pre-emphasis to a level that the
>>>> LTTPR does not support,
>>>> the LTTPR shall set its transmitter levels as close as possible to those
>>>> requested by the DPTX.
>>>> Although the LTTPR’s level choosing is implementation-specific, the
>>>> levels chosen shall
>>>> comply with Section 3.5.4."
>>>
>>> Hi Abhinav,
>>>
>>> Could you please provide the exact section number and DP spec version
>>> for this paragraph? For reference in the commit message, see below.
>>>
>>
>> This is in the section "3.6.7.2 8b/10b DP Link Layer LTTPR Link Training
>> Mandates" of DP spec 2.1(a)"
> 
> Perfect, thanks.
> 
>>
>>>>
>>>> This tells us that even if we try to do a level3 and the LTTPR does not
>>>> support it, it will use the one closest to this.
>>>>
>>>> So overall, even though i915's implementation is the accurate one, the
>>>> DP spec does mention that the LTTPR can adjust. I just hope all LTTPRs
>>>> can adjust to this. Hopefully this clarifies the requirements spec-wise.
>>>
>>> Thanks for this clarification, this is extremely useful. A bit sad
>>> that DP spec is only available to VESA members.
>>> So my assumption was indeed incorrect. This also explains why eg.
>>> AMD's driver works, nice.
>>>
>>
>> Yes. This was good to know.
>>
>>>>
>>>> Hence I am okay with this change as such as multiple folks including us
>>>> have given a Tested-by but I would like this to be documented in the
>>>> commit text so that full context is preserved. The only concern I have
>>>> is I hope that the level to which the LTTPR adjusts will be correct as
>>>> that again is "implementation specific".
>>>
>>> I started implementing i915's approach meanwhile, to see the
>>> difference in behaviour. POC fixup for patch 3,4 of this series can be
>>> found in [1]. Discovered something interesting:
>>> * Dell WD19TB docking station's LTTPR reports support of training level 3
>>> * PS8833 retimer in Asus Zenbook A14 reports support of training level 3
>>> * PS8830 retimer in Dell XPS 9345 claims to _not_ report support
>>> training level 3. This is the case on two different machines with BIOS
>>> 1.9.0 (PS8830 payload version 5.3.0.14) and BIOS 2.5.0 (PS8830 payload
>>> version 9.3.0.01).
>>>
>>> This leads to interesting test results:
>>> * Asus Zenbook A14 (PS8833, supports train level 3) with direct
>>> monitor connection via Type-C works, both in current version of msm-dp
>>> (aka AMD's approach) and with additional patches I linked above (aka
>>> i915's approach)
>>> * Dell XPS 9345 (PS8830, claims to not support train level 3) with
>>> Dell WD19TB (supports train level 3) works, both in current version of
>>> msm-dp and with additional patches I linked above. In this
>>> combination, PS8830->WD19TB segment training succeeds with vs=2, pe=0
>>> already.
>>> * Dell XPS 9345 (PS8830, claims to not support train level 3) with
>>> direct monitor connection via Type-C works with current version of
>>> msm-dp, but does _not_ work with additional patches I linked above.
>>> For PS8830->Monitor segment training, after reaching vs=2,pe=0 and
>>> being stopped from going higher (due to PS8830 claiming it cannot do
>>> train level 3), link training fails. With current msm-dp state
>>> however, the same PS8830->Monitor segment training succeeds with
>>> vs=2,pe=1. This is contrary to retimer reporting it does not support
>>> train level 3 - it in fact does, and in case with 1m long Type-C to DP
>>> cable it only works with train level 3. Bug in P8830's LTTPR
>>> implementation? :)
>>>
>>
>> Wow, thats a very good finding!
>>
>>> Combining both patches linked above as well as debug patch to force
>>> max train level to 3 like it was before [2], here are detailed logs:
>>> Asus Zenbook A14, BIOS version "UX3407QA.305":
>>> ```
>>> phy #1: params reset                                                 #
>>> training DPRX (phy1/PS8833)
>>> phy #1: max_v_level=3, max_p_level=3                    # DPTX source
>>> (X1E) supports train level 3
>>> phy #1: forcing max_v_level=3, max_p_level=3
>>> phy #1: v_level=0, p_level=0                                      #
>>> passes with vs=0,ps=0
>>> phy #1: max_v_level=3, max_p_level=3
>>> phy #0: params reset
>>> # training DPRX (phy0/Monitor)
>>> phy #0: max_v_level=3, max_p_level=3                     # DPTX source
>>> (phy1/PS8833) supports train level 3
>>> phy #0: forcing max_v_level=3, max_p_level=3
>>> phy #0: v_level=0, p_level=0
>>> phy #0: max_v_level=3, max_p_level=3
>>> phy #X: v_level=2, p_level=0
>>> phy #0: v_level=2, p_level=0
>>> phy #0: max_v_level=3, max_p_level=3
>>> phy #X: v_level=2, p_level=1
>>> phy #0: v_level=2, p_level=1                                       #
>>> training passes with vs=2,ps=1
>>> phy #0: max_v_level=3, max_p_level=3
>>> ```
>>>
>>> Dell XPS 9345, BIOS version "2.5.0", PS8830 payload version "9.3.0.01":
>>> ```
>>> phy #1: params reset                                                 #
>>> training DPRX (phy1/PS8830)
>>> phy #1: max_v_level=3, max_p_level=3                    # DPTX source
>>> (X1E) supports train level 3
>>> phy #1: forcing max_v_level=3, max_p_level=3
>>> phy #1: v_level=0, p_level=0                                     #
>>> passes with vs=0,ps=0
>>> phy #1: max_v_level=3, max_p_level=3
>>> phy #0: params reset                                                 #
>>> training DPRX (phy0/Monitor)
>>> phy #0: max_v_level=2, max_p_level=2                    # DPTX source
>>> (phy1/PS8830) claims to not support train level 3
>>> phy #0: forcing max_v_level=3, max_p_level=3        # Ignore
>>> advertised levels, force to max=3, otherwise training fails
>>> phy #0: v_level=0, p_level=0
>>> phy #0: max_v_level=3, max_p_level=3
>>> phy #X: v_level=2, p_level=0
>>> phy #0: v_level=2, p_level=0
>>> phy #0: max_v_level=3, max_p_level=3
>>> phy #X: v_level=2, p_level=1
>>> phy #0: v_level=2, p_level=1                                     #
>>> training passes with vs=2,ps=1 (aka train level 3)
>>> phy #0: max_v_level=3, max_p_level=3
>>> ```
>>>
>>> While, as you correctly mentioned, i915's implementation would be a
>>> more accurate one, and I can respin to v5 with [1] applied to patches
>>> 3,4 of this series respectively, it appears that at least on some X1E
>>> based devices with PS8830 that would break DP output support at least
>>> in some cases. The fact that the same device with the same monitor
>>> works on Windows suggests that Windows driver also uses AMD's approach
>>> of just assuming LTTPR can do train level 3, without verifying it, and
>>> letting LTTPR figure the rest. I have asked other community members to
>>> cross-check these findings on another X1E platform with PS8830
>>> retimers. With this in mind, I am very glad to hear that you are okay
>>> with this change as such, as it now appears that a more accurate
>>> implementation would've caused additional issues.
>>>
>>
>> Yes seems like it but certainly looks like a bug in PS8830.
>>
>>>>
>>>> I would still like to hear from Abel though about whether setting to
>>>> non-transparent mode was needed in the first place.
>>>
>>> Fwiw, without Abel's initial change DP output didn't work on X1E
>>> platform at all, neither direct monitor connection nor docking
>>> station. Not sure if that is because PS883x found in most X1E/X1P
>>> laptops do not work in transparent mode at all (even though they
>>> should've), or laptop's firmware would leave it in some weird state,
>>> and perhaps re-enabling transparent mode would've also fixed it.
>>>
>>> Lets wait for Abel's answer and the rest of this conversation to be
>>> resolved, and as I see it the next step would be for me to respin to
>>> v5 current change as is, in order to update the commit message of 4th
>>> patch to reflect the new findings and reference DP spec and section,
>>> as per the first comment of this reply.
>>>
>>
>> Yes correct, nothing else pending from your side.
>>
>> Thanks for your deep analysis and interest in this topic.
>>
>>> Thanks for your help,
>>> Alex
>>>
>>
>> By waiting for Abel, I am mostly trying to make sure :
>>
>> Was enabling non-transparent mode more of a requirement of the parade
>> retimer chip in Xelite? Because from our earlier discussion, I thought
>> we wanted to enable transparent mode. Then these issues would perhaps
>> have not happened as per-segment link training is a requirement of
>> non-transparent mode. So I am surprised how Xelite worked without this.
>>
>> It seems like to me we enabled non-transparent mode to match AMD/i915
>> behavior and not as a requirement of the retimer chip of Xelite.
>>
>> The commit text of
>> https://patchwork.freedesktop.org/patch/msgid/20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-4-c865d0e56d6e@linaro.org
>> mentions
>>
>> "The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
>> that before link training with the LTTPR is started, the DPTX may place
>> the LTTPR in non-transparent mode by first switching to transparent mode
>> and then to non-transparent mode. This operation seems to be needed only
>> on first link training and doesn't need to be done again until device is
>> unplugged."
>>
>> This talks about how to enable non-transparent mode and not why.
>>
>> But this part "It has been observed on a few X Elite-based platforms
>> which have such LTTPRs in their board design that the DPTX needs to
>> follow the procedure described above in order for the link training to
>> be successful" is really my doubt. Because from my earlier
>> understanding, I thought enabling transparent mode was enough.
> 
> To speed up the process a little as the 6.15-rcX window shrinks (and
> it appears Abel may be OOO?), I run a series of tests to attempt to
> answer your questions. In short - PS8830 is a very quirky device, and
> you were right that the current implementation could've simply set
> transparent mode.
> 
> To clarify the test matrix: PS8830 was tested with Dell XPS 9345.
> PS8833 was tested with Asus Zenbook A14. Unfortunately, my dock (Dell
> WD19TB) is a universal Thunderbolt/DP-Alt mode dock, and only works if
> it's forced to DP alt mode, since PCIE tunneling is not yet supported
> on qcom. Dell allows to disable thunderbolt/PCIE tunneling support in
> BIOS, hence forcing the dock to be Type-C/DP-alt mode (and show up
> with LTTPR onboard). No such feature exists on Asus, so I could not
> test PS8833 with the docking station at all.
> 
> Complete test matrix;
> 
> 1. Do nothing/pre Abel's series (LTTPRs assumed to be in transparent
> mode unless firmware pre-configured them):
> PS8833:
> - Type-C to HDMI: works almost always
> - Type-C to DP: never works, EDID read fails
> 
> PS8830:
> - Type-C to HDMI: never works, CR LT fails (-22)
> - Type-C to DP: never works, EDID read fails
> - Type-C to dock: never works, EQ LT fails (-110)
> 
> 2. Explicitly set LTTPRs to transparent mode (early exit LTTPR helper
> introduced by Abel, after setting transparent mode, but before setting
> non-transparent mode):
> PS8833:
> - Type-C to HDMI: works. Occasionally fails to get DP sink modes (may
> be unrelated)
> - Type-C to DP: works**
> 
> PS8830:
> - Type-C to HDMI: works
> - Type-C to DP: works**
> - Type-C to dock: Sometimes all works. Sometimes video works, but USB
> (2.0 nor 3.0) is not working. Sometimes EQ LT fails (-110) and nothing
> works. Overall extremely unstable.
> 
> 3. Explicitly set LTTPRs to non-transparent mode (aka Abel's series):
> PS8833:
> - Type-C to HDMI: never works, CR LT fails, max v_level reached (-11)
> - Type-C to DP: never works, CR LT fails, max v_level reached (-11)
> 
> PS8830:
> - Type-C to HDMI: works
> - Type-C to DP: works**
> - Type-C to dock: never works, CR LT fails (-110)
> 
> 4. Explicitly set LTTPRs to non-transparent mode, support per-segment
> training (aka Abel's initial LTTPR support series + this series):
> PS8833:
> - Type-C to HDMI: works
> - Type-C to DP: works
> 
> PS8830:
> - Type-C to HDMI: works
> - Type-C to DP: works
> - Type-C to dock: works
> 
> 

Thanks for testing these combinations.

> ** At first, Type-C to DP was frequently/always depending on the use
> case failing to read panel EDID, just like in the 1st test case. As I
> am 100% certain it worked in the past, did a few more tests. It
> appears that in an earlier version of Abel's patch (<=v4), DPRX caps
> were read _after_ LTTPR init, just like DP standard mandates (don't
> have exact quote, something along the lines 'source shall re-read sink
> caps after LTTPR init'). In v4 there was a suggestion [1] (from you
> actually :)) to first try to read DPRX caps, then init LTTPRs in order
> to fail early if caps readout fails. Reverting this change fixes EDID
> read error. Since I was running Abel's series long before it landed, I
> never used the broken v5. With the order of functions reverted, Type-C
> to DP started working/failing in the same way Type-C to HDMI dongle
> did, just as expected. Wrt to the issue itself, the first patch of
> this very series actually both fixes this issue by conforming to DP
> spec, and also takes into account your suggestion in Abel's v4 series
> to be able to fail early in case of DPRX caps readout failure.
> 
> To summarize the findings:
> - PS8830 is a very quirky device. It does not work in
> default/transparent mode unless explicitly set. It does work in
> non-transparent mode without per-segment training, even though it
> should've not. As per last email, it is lying about not supporting
> training level 3.
> - PS8833 seems to be a fixed version of PS8830. It does work in
> default/transparent mode oob. It does not work in non-transparent mode
> without per-segment training, just as expected. As per last email, it
> correctly reports training level 3 capability.
> 
> To answer some of your questions (from a 3rd party view, cannot speak
> for the authors):
> - "So I am surprised how Xelite worked without this." - From tests
> above: PS8830 worked when it should've not, seems because it's quirky.
> PS8833 did not work, which makes sense.
> - Doubts about non-transparent mode requirement for X1E/X1P systems -
>  From tests above: seems you are right. I don't know why it was forced
> to be non-transparent without per-segment training, instead of simply
> transparent. Though, seeing how weird the PS8830 is, I wouldn't be
> surprised if it behaves differently in other laptops... just
> speculating though.
>   - "Was enabling non-transparent mode more of a requirement of the
> parade retimer chip in Xelite?" - cannot fully answer. Initializing
> LTTPRs as such appears to be a requirement of the Parade PS8830 (not
> PS8833, which wasn't around back then afaik), as it just wouldn't work
> oob. Choice of non-transparent instead of transparent mode is not very
> clear to me.
> 
> Even though it appears initial LTTPR support could've been done
> slightly differently, combination of those initial patches + this
> series seem to provide both the best practical results, as well as
> most (well, almost, excluding LTTPR's train level verification)
> accurate LTTPR implementation, while also making msm-dp similar/up to
> date with Intel/AMD's LTTPR implementation. Also learned something new
> today myself, don't buy PS8830 :)
> 
> Looking forward to hearing from you,
> Alex
>

I did sync up with Abel internally and we could not conclude on why we 
did not enable transparent mode from beginning and went with 
non-transparent mode. But, I did sync up with Imre (author of i915's 
LTTPR changes) on IRC dri-devel and Imre mentioned that there is 
actually an SCR which changed the lines of the spec I was referring to that

"A DPTX operating with 8b/10b Link Layer (MAIN_LINK_CHANNEL_CODING_SET
register (DPCD Address 00108h) is programmed to 01h) may configure 
LTTPRs to either Transparent (default) or Non-transparent mode."


Although I cannot locate this SCR (working out that), I am convinced 
with the results, so feel free to re-spin this with

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Excellent work on your side with such deep testing and analysis!

