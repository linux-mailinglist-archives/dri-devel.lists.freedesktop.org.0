Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BF3AA83AB
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 05:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B73C10E141;
	Sun,  4 May 2025 03:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mYFdB6Vf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E7588C4C;
 Sun,  4 May 2025 03:03:08 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544303Nf023631;
 Sun, 4 May 2025 03:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xOdSXUiEYL76C7RvQQ+vroTVZEEV0mao7L1RPIg4iXM=; b=mYFdB6VfdeQZnhcw
 8Lu/XNakazbxkLsUEgnjs+o79wX10nY8fotO3lALl6uwSLqgkJlMSa0XcIxx4gfF
 j3LhrxBlgM270e3G8gdZMNMCT2eT1BDlgKG91FdIjHA+E2HFkTbVMZOjMOKH98nu
 1Oq1y1LZfLpWO3soPEDaMvR6Jbk4oi+JPvo0tilas9/YwfNo7u7VE8tX3XMS7pIc
 3A5pFTcHzlriaQXFvLMc8d1nZD9ZyI5/n1gYVR84HP8E8rqV88aCwzgHlEMsxQUJ
 5rJuKymWmkM4ge4Vb/ICggqijeq4RwlOrs8P29NgXovt5hY+RxzgF+jGCNtEPjVU
 0ujETw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfhb3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 May 2025 03:02:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54432rnH009984
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 4 May 2025 03:02:53 GMT
Received: from [10.110.124.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 20:02:52 -0700
Message-ID: <d1eb55ae-92e5-4a34-af46-5d076512a06b@quicinc.com>
Date: Sat, 3 May 2025 20:02:50 -0700
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
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAMcHhXqFE6-tnT0m9=3N1wSaTyEPMFA0zTfVqwJmgqz60tBAoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9c7cMDJ5yTGCcbBsJrIVB1Aoc0AZHhEc
X-Proofpoint-GUID: 9c7cMDJ5yTGCcbBsJrIVB1Aoc0AZHhEc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNiBTYWx0ZWRfX2KuwFykecOQj
 SPOJ6Lv53MBs7WJPK3jHcvldnkafh+6hz/selgscpimIpCc3J4LlveJoH5r3z8JFMo7BTRmZ+fF
 aHunBVrJzOnng8HV7UUhxxFNnz3ArMiz5KEzGpmo0JDG0RkfgztYMq6xntcw7wVyIpvkmYdi2uT
 gtVOHxNW7TGLRWH01HxXzcJxw0sCvDdldpobX0MujSXcyoxiPV9h0uar5PCgkpQYpQx6q2WYGxL
 zxsF+TiHGrYzombrUv3BMYwMZ2aFwNtEzHKRE5rt3nudSgBF3MJDChruYxyA1txbxtLogoBXojJ
 gqC5+5T7ChlOZgqBFseLHdTVQGzbxfoIwMZxGKsbYetqFWtMUmX1B1nC0BtHsgGYC9aFo4COroK
 YSykokC3KcopDE2Tak/hVt6NHUu9bK7RPxeT3NMgQCoG3W3M5Un/Y6lgVsVgghdfkYBhAIRN
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6816d8de cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0z53KzOdxQeSrmARfIgA:9
 a=nrCpp7BQRmMzn8sZ:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040026
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

Thanks for the response.

My updates below. I also had one question for Abel below.

Thanks

Abhinav

On 5/1/2025 8:56 AM, Aleksandrs Vinarskis wrote:
> On Thu, 1 May 2025 at 04:11, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
>>> DisplayPort requires per-segment link training when LTTPR are switched
>>> to non-transparent mode, starting with LTTPR closest to the source.
>>> Only when each segment is trained individually, source can link train
>>> to sink.
>>>
>>> Implement per-segment link traning when LTTPR(s) are detected, to
>>> support external docking stations. On higher level, changes are:
>>>
>>> * Pass phy being trained down to all required helpers
>>> * Run CR, EQ link training per phy
>>> * Set voltage swing, pre-emphasis levels per phy
>>>
>>> This ensures successful link training both when connected directly to
>>> the monitor (single LTTPR onboard most X1E laptops) and via the docking
>>> station (at least two LTTPRs).
>>>
>>> Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
>>>
>>
>> Thanks for the patch to improve and add support for link training in
>> non-transparent mode.
>>
>> Some questions below as the DP 2.1a spec documentation is not very clear
>> about segmented link training as you noted in the cover letter, so I am
>> also only reviewing i915 as reference here.
>>
>>
>>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>>> Tested-by: Rob Clark <robdclark@gmail.com>
>>> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
>>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
>>>    1 file changed, 89 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index d8633a596f8d..35b28c2fcd64 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -1034,10 +1034,12 @@ static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
>>>        return 0;
>>>    }
>>>
>>> -static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
>>> +static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private *ctrl,
>>> +                                     enum drm_dp_phy dp_phy)
>>>    {
>>>        struct msm_dp_link *link = ctrl->link;
>>> -     int ret = 0, lane, lane_cnt;
>>> +     int lane, lane_cnt, reg;
>>> +     int ret = 0;
>>>        u8 buf[4];
>>>        u32 max_level_reached = 0;
>>>        u32 voltage_swing_level = link->phy_params.v_level;
>>> @@ -1075,8 +1077,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
>>>
>>>        drm_dbg_dp(ctrl->drm_dev, "sink: p|v=0x%x\n",
>>>                        voltage_swing_level | pre_emphasis_level);
>>> -     ret = drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
>>> -                                     buf, lane_cnt);
>>> +
>>> +     if (dp_phy == DP_PHY_DPRX)
>>> +             reg = DP_TRAINING_LANE0_SET;
>>> +     else
>>> +             reg = DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
>>> +
>>> +     ret = drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
>>
>> For the max voltage and swing levels, it seems like we need to use the
>> source (DPTX) or the DPRX immediately upstream of the RX we are trying
>> to train. i915 achieves it with below:
>>
>>           /*
>>            * Get voltage_max from the DPTX_PHY (source or LTTPR) upstream
>> from
>>            * the DPRX_PHY we train.
>>            */
>>           if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
>>                   voltage_max = intel_dp->voltage_max(intel_dp, crtc_state);
>>           else
>>                   voltage_max = intel_dp_lttpr_voltage_max(intel_dp,
>> dp_phy + 1);
>>

Before I update on the below set of questions from Alex, let me clarify 
one point from Abel.

Hi Abel

Apologies to ask this late, but as per the earlier discussions we had 
internally, I thought we wanted to set the LTTPR to transparent mode to 
avoid the issues. The per-segment link training becomes a requirement if 
we use non-transparent mode iiuc.

In the description of the PHY_REPEATER_MODE DPCD register, it states 
like below:

"A DPTX operating with 8b/10b Link Layer (MAIN_LINK_CHANNEL_CODING_SET
register (DPCD Address 00108h) is programmed to 01h) may configure LTTPRs
to either Transparent (default) or Non-transparent mode.
A DPTX that establishes the DP link with 128b/132b channel coding shall 
write
02h to the MAIN_LINK_CHANNEL_CODING_SET register and configure LTTPRs
to Non-transparent mode."

As per the msm dp code, we are using 8b/10b encoding, like below

static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
                         int *training_step)
{
         int ret = 0;
         const u8 *dpcd = ctrl->panel->dpcd;
         u8 encoding[] = { 0, DP_SET_ANSI_8B10B };

So can you pls elaborate why we set the PHY_REPEATER_MODE to 
non-transparent mode because drm_dp_lttpr_init() will set the LTTPR to 
non-transparent mode.

The second part of the section is what was described in the commit text 
of the 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling") but

"Before performing link training with LTTPR(s), the DPTX may place the 
LTTPR(s) in
Non-transparent mode by first writing 55h to the PHY_REPEATER_MODE 
register, and then
writing AAh. This operation does not need to be performed on subsequent 
link training actions
unless a downstream device unplug event is detected."

So just wanted to understand this better that was there any requirement 
to put it to non-transparent mode other than the section of the spec 
highlighted above? Because above lines are only suggesting that if we 
want to put the LTTPR to non-transparent mode, how to do it but not to 
always do it. Please let me know your comments.

I shall also check internally on this to close this.


Hi Alex

>>
>> But I do not see (unless I missed) how this patch takes care of this
>> requirement.
>>
>> Same holds true for preemph too
> 
> Thanks for you review,
> 
> This is a very good point. You are right, in the present state it does
> not. Intel's driver is verifying whether LTTPRs supports
> DP_TRAIN_LEVEL_3 or only DP_TRAIN_LEVEL_2, while my current change
> follows msm-dp's default which was recently set to DP_TRAIN_LEVEL_3
> [1]. I came to conclusion that in particular case it was not required
> to verify that LTTPR indeed supports training level 3, but do not
> remember the details as its been a few months... should've document it
> :)
> 

> As I recall, from one of the DP specs onward (has to be 1.4a then,
> since LTTPR was initially introduced in DP 1.3, but register for phy
> capabilities only added in 1.4a [2]) it mandates training level 3
> support for LTTPRs, so the assumption would've be correct in that
> case. Is this something you could verify from the official
> documentation? Unfortunately I do not have sources to back this
> statement, so it may be incorrect...
> 

I went through DP spec 1.4(a), DP 2.0 and DP 2.1(a). This is what is 
mentioned below:


"LTTPR shall support all required voltage swing and pre-emphasis 
combinations defined
in Table 3-2. The LTTPR shall reflect its support of optional Voltage 
Swing Level 3
and Pre-emphasis Level 3 in the VOLTAGE_SWING_LEVEL_3_SUPPORTED and
VOLTAGE_SWING_LEVEL_3_SUPPORTED bits, respectively, in the
TRANSMITTER_CAPABILITY_PHY_REPEATERx register(s) (e.g., DPCD
Address F0021h for LTTPR1, bits 0 and 1, respectively)."

 From this paragraph, it means that LTTPR support for levels 0/1/2 can 
be assumed and level 3 is optional. Whether or not level 3 is supported 
comes from the TRANSMITTER_CAPABILITY_PHY_REPEATERx register(s).

This aligns with i915 implementation.


Now, right after this, there is another paragraph in the spec:

"If the DPTX sets the voltage swing or pre-emphasis to a level that the 
LTTPR does not support,
the LTTPR shall set its transmitter levels as close as possible to those 
requested by the DPTX.
Although the LTTPR’s level choosing is implementation-specific, the 
levels chosen shall
comply with Section 3.5.4."

This tells us that even if we try to do a level3 and the LTTPR does not 
support it, it will use the one closest to this.

So overall, even though i915's implementation is the accurate one, the 
DP spec does mention that the LTTPR can adjust. I just hope all LTTPRs 
can adjust to this. Hopefully this clarifies the requirements spec-wise.

Hence I am okay with this change as such as multiple folks including us 
have given a Tested-by but I would like this to be documented in the 
commit text so that full context is preserved. The only concern I have 
is I hope that the level to which the LTTPR adjusts will be correct as 
that again is "implementation specific".

I would still like to hear from Abel though about whether setting to 
non-transparent mode was needed in the first place.

Thanks

Abhinav
> Now reviewing it again, my reasoning may to be wrong, as source
> supporting training level 3 and DP 1.4a does not necessarily imply
> that external LTTPR does, nor that external LTTPR is DP 1.4a
> compliant.
> 
> fwiw, after quickly inspecting AMD's driver it seems it also assumes
> DP_TRAIN_LEVEL_3 support for LTTPR and does not explicitly verify it.
> Similarly to proposed msm solution, iteration over phys [3] calls
> `perform_8b_10b_clock_recovery_sequence` [4] which is generic for both
> DPRX and LTTPR(s). This eventually calls `dp_is_max_vs_reached` [5] to
> check against hardcoded value of 3 [6]. Generally, it appears no other
> driver use `
> drm_dp_lttpr_voltage_swing_level_3_supported` or
> `drm_dp_lttpr_pre_emphasis_level_3_supported` helpers introduced by
> Intel, nor directly use register 0xf0021.
> 
> Alternatively, if we cannot verify that LTTPR is expected to always
> support DP_TRAIN_LEVEL_3, I change this patch to match Intel's example
> of retrieving max vs and pe per phy. As it appears to be a bit time
> sensitive, can have it done and re-tested on all available hardware by
> Monday. Please let me know your thoughts.
> 
> Thanks,
> Alex
> 
> [1] https://lore.kernel.org/all/20240203-dp-swing-3-v1-1-6545e1706196@linaro.org/
> [2] https://patchwork.freedesktop.org/patch/329863/
> [3] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c#L396-L430
> [4] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c#L176-L294
> [5] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c#L462-L475
> [6] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/amd/display/dc/dc_dp_types.h#L80
> 
>>
>>           if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
>>                   preemph_max = intel_dp->preemph_max(intel_dp);
>>           else
>>                   preemph_max = intel_dp_lttpr_preemph_max(intel_dp,
>> dp_phy + 1);
>>
>>           drm_WARN_ON_ONCE(display->drm,
>>                            preemph_max != DP_TRAIN_PRE_EMPH_LEVEL_2 &&
>>                            preemph_max != DP_TRAIN_PRE_EMPH_LEVEL_3);
>>
>>
>>>        if (ret == lane_cnt)
>>>                ret = 0;
>>>
>>> @@ -1084,9 +1091,10 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
>>>    }
>>>
>>>    static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
>>> -             u8 pattern)
>>> +             u8 pattern, enum drm_dp_phy dp_phy)
>>>    {
>>>        u8 buf;
>>> +     int reg;
>>>        int ret = 0;
>>>
>>>        drm_dbg_dp(ctrl->drm_dev, "sink: pattern=%x\n", pattern);
>>> @@ -1096,7 +1104,12 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
>>>        if (pattern && pattern != DP_TRAINING_PATTERN_4)
>>>                buf |= DP_LINK_SCRAMBLING_DISABLE;
>>>
>>> -     ret = drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf);
>>> +     if (dp_phy == DP_PHY_DPRX)
>>> +             reg = DP_TRAINING_PATTERN_SET;
>>> +     else
>>> +             reg = DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);
>>> +
>>> +     ret = drm_dp_dpcd_writeb(ctrl->aux, reg, buf);
>>>        return ret == 1;
>>>    }
>>>
>>> @@ -1115,12 +1128,16 @@ static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
>>>    }
>>>
>>>    static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
>>> -                     int *training_step)
>>> +                     int *training_step, enum drm_dp_phy dp_phy)
>>>    {
>>> +     int delay_us;
>>>        int tries, old_v_level, ret = 0;
>>>        u8 link_status[DP_LINK_STATUS_SIZE];
>>>        int const maximum_retries = 4;
>>>
>>> +     delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
>>> +                                                 ctrl->panel->dpcd, dp_phy, false);
>>> +
>>>        msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>>>
>>>        *training_step = DP_TRAINING_1;
>>> @@ -1129,18 +1146,19 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
>>>        if (ret)
>>>                return ret;
>>>        msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
>>> -             DP_LINK_SCRAMBLING_DISABLE);
>>> +             DP_LINK_SCRAMBLING_DISABLE, dp_phy);
>>>
>>> -     ret = msm_dp_ctrl_update_vx_px(ctrl);
>>> +     msm_dp_link_reset_phy_params_vx_px(ctrl->link);
>>> +     ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>>>        if (ret)
>>>                return ret;
>>>
>>>        tries = 0;
>>>        old_v_level = ctrl->link->phy_params.v_level;
>>>        for (tries = 0; tries < maximum_retries; tries++) {
>>> -             drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
>>> +             fsleep(delay_us);
>>>
>>> -             ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
>>> +             ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
>>>                if (ret)
>>>                        return ret;
>>>
>>> @@ -1161,7 +1179,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
>>>                }
>>>
>>>                msm_dp_link_adjust_levels(ctrl->link, link_status);
>>> -             ret = msm_dp_ctrl_update_vx_px(ctrl);
>>> +             ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>>>                if (ret)
>>>                        return ret;
>>>        }
>>> @@ -1213,21 +1231,31 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
>>>        return 0;
>>>    }
>>>
>>> -static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
>>> +static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
>>> +                                            enum drm_dp_phy dp_phy)
>>>    {
>>> -     msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
>>> -     drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
>>> +     int delay_us;
>>> +
>>> +     msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, dp_phy);
>>> +
>>> +     delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
>>> +                                             ctrl->panel->dpcd, dp_phy, false);
>>> +     fsleep(delay_us);
>>>    }
>>>
>>>    static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>>> -                     int *training_step)
>>> +                     int *training_step, enum drm_dp_phy dp_phy)
>>>    {
>>> +     int delay_us;
>>>        int tries = 0, ret = 0;
>>>        u8 pattern;
>>>        u32 state_ctrl_bit;
>>>        int const maximum_retries = 5;
>>>        u8 link_status[DP_LINK_STATUS_SIZE];
>>>
>>> +     delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
>>> +                                             ctrl->panel->dpcd, dp_phy, false);
>>> +
>>>        msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>>>
>>>        *training_step = DP_TRAINING_2;
>>> @@ -1247,12 +1275,12 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>>>        if (ret)
>>>                return ret;
>>>
>>> -     msm_dp_ctrl_train_pattern_set(ctrl, pattern);
>>> +     msm_dp_ctrl_train_pattern_set(ctrl, pattern, dp_phy);
>>>
>>>        for (tries = 0; tries <= maximum_retries; tries++) {
>>> -             drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
>>> +             fsleep(delay_us);
>>>
>>> -             ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
>>> +             ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
>>>                if (ret)
>>>                        return ret;
>>>
>>> @@ -1262,7 +1290,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>>>                }
>>>
>>>                msm_dp_link_adjust_levels(ctrl->link, link_status);
>>> -             ret = msm_dp_ctrl_update_vx_px(ctrl);
>>> +             ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>>>                if (ret)
>>>                        return ret;
>>>
>>> @@ -1271,9 +1299,32 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>>>        return -ETIMEDOUT;
>>>    }
>>>
>>> +static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
>>> +                                   int *training_step, enum drm_dp_phy dp_phy)
>>> +{
>>> +     int ret;
>>> +
>>> +     ret = msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
>>> +     if (ret) {
>>> +             DRM_ERROR("link training #1 on phy %d failed. ret=%d\n", dp_phy, ret);
>>> +             return ret;
>>> +     }
>>> +     drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\n", dp_phy);
>>> +
>>> +     ret = msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
>>> +     if (ret) {
>>> +             DRM_ERROR("link training #2 on phy %d failed. ret=%d\n", dp_phy, ret);
>>> +             return ret;
>>> +     }
>>> +     drm_dbg_dp(ctrl->drm_dev, "link training #2 on phy %d successful\n", dp_phy);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>    static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>>                        int *training_step)
>>>    {
>>> +     int i;
>>>        int ret = 0;
>>>        const u8 *dpcd = ctrl->panel->dpcd;
>>>        u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
>>> @@ -1286,8 +1337,6 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>>        link_info.rate = ctrl->link->link_params.rate;
>>>        link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
>>>
>>> -     msm_dp_link_reset_phy_params_vx_px(ctrl->link);
>>> -
>>>        msm_dp_aux_link_configure(ctrl->aux, &link_info);
>>>
>>>        if (drm_dp_max_downspread(dpcd))
>>> @@ -1302,24 +1351,27 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>>                                &assr, 1);
>>>        }
>>>
>>> -     ret = msm_dp_ctrl_link_train_1(ctrl, training_step);
>>> +     for (i = ctrl->link->lttpr_count - 1; i >= 0; i--) {
>>> +             enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
>>> +
>>> +             ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
>>> +             msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
>>> +
>>> +             if (ret)
>>> +                     break;
>>> +     }
>>> +
>>>        if (ret) {
>>> -             DRM_ERROR("link training #1 failed. ret=%d\n", ret);
>>> +             DRM_ERROR("link training of LTTPR(s) failed. ret=%d\n", ret);
>>>                goto end;
>>>        }
>>>
>>> -     /* print success info as this is a result of user initiated action */
>>> -     drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
>>> -
>>> -     ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
>>> +     ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
>>>        if (ret) {
>>> -             DRM_ERROR("link training #2 failed. ret=%d\n", ret);
>>> +             DRM_ERROR("link training on sink failed. ret=%d\n", ret);
>>>                goto end;
>>>        }
>>>
>>> -     /* print success info as this is a result of user initiated action */
>>> -     drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
>>> -
>>>    end:
>>>        msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>>>
>>> @@ -1636,7 +1688,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>>>        if (ret)
>>>                goto end;
>>>
>>> -     msm_dp_ctrl_clear_training_pattern(ctrl);
>>> +     msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>>>
>>>        msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
>>>
>>> @@ -1660,7 +1712,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>>>                return false;
>>>        }
>>>        msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
>>> -     msm_dp_ctrl_update_vx_px(ctrl);
>>> +     msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
>>>        msm_dp_link_send_test_response(ctrl->link);
>>>
>>>        pattern_sent = msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
>>> @@ -1902,7 +1954,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>>>                        }
>>>
>>>                        /* stop link training before start re training  */
>>> -                     msm_dp_ctrl_clear_training_pattern(ctrl);
>>> +                     msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>>>                }
>>>
>>>                rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
>>> @@ -1926,7 +1978,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>>>                 * link training failed
>>>                 * end txing train pattern here
>>>                 */
>>> -             msm_dp_ctrl_clear_training_pattern(ctrl);
>>> +             msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>>>
>>>                msm_dp_ctrl_deinitialize_mainlink(ctrl);
>>>                rc = -ECONNRESET;
>>> @@ -1997,7 +2049,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>>>                msm_dp_ctrl_link_retrain(ctrl);
>>>
>>>        /* stop txing train pattern to end link training */
>>> -     msm_dp_ctrl_clear_training_pattern(ctrl);
>>> +     msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>>>
>>>        /*
>>>         * Set up transfer unit values and set controller state to send
>>

