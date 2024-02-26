Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D971866795
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 02:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CCC10E57B;
	Mon, 26 Feb 2024 01:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="K4q0+VKp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9D10E567;
 Mon, 26 Feb 2024 01:33:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41Q1Xg7i004227; Mon, 26 Feb 2024 01:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=EQcNerH5zlqRogyZtmxYs0V0RQjRviVf4F1C9HUrbY4=; b=K4
 q0+VKpk0Zj6NFu9BFS5p+ZzcGkdv0KPH9r5vmeCg5L2s4XMexRlK6Z+EpgPTGzSs
 iCVG5xaPJG91ei8q+BlCQrHmlfgfjzcsU2As+b0xHrRQlbzyyF4/Zwm/izfqVm62
 vVWw+cZjpqM53G2oe4Z2k64/Lm9g4QTVjuHZVjTxHlawyaBwceturYkBfX062Ji+
 +5IKYBfV374bD98fgtU53RUlqAXJJ7bZ9uSbZL/Ub23dqg2k5Y5Hm/8WrVM2tFjx
 heKtIbWhqTnIdgVF///iP1zOuzJffhM6pE0ehuqyC1oDNe5LM6IKviQ2UYBs4+uh
 ZvTTk14e2HeIVpuwYrPg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wf7dv2pxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 01:33:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41Q1Xe1B004662
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 01:33:40 GMT
Received: from [10.110.76.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 25 Feb
 2024 17:33:39 -0800
Message-ID: <b412dd01-126b-155d-5961-b544da821ce6@quicinc.com>
Date: Sun, 25 Feb 2024 17:33:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: split dpu_encoder_wait_for_event into
 two functions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steev Klimaszewski <steev@kali.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
 <20240225-fd-dpu-debug-timeout-v3-2-252f2b21cdcc@linaro.org>
 <f3c304b3-7cd3-6f90-c438-8c2c0ded8bd2@quicinc.com>
 <CAA8EJpqfERqpxeSY_cd=T4Rdfjh6SsGOj7phN_cpfByaM7pt1Q@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqfERqpxeSY_cd=T4Rdfjh6SsGOj7phN_cpfByaM7pt1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: g6QEntQV3M3yENABosRIXgXdf3WPIdbl
X-Proofpoint-ORIG-GUID: g6QEntQV3M3yENABosRIXgXdf3WPIdbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-25_29,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260010
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



On 2/25/2024 12:52 PM, Dmitry Baryshkov wrote:
> On Sun, 25 Feb 2024 at 21:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/25/2024 6:12 AM, Dmitry Baryshkov wrote:
>>> Stop multiplexing several events via the dpu_encoder_wait_for_event()
>>> function. Split it into two distinct functions two allow separate
>>> handling of those events.
>>>
>>
>> I understand the idea but would handling of those events be really distinct?
> 
> We are interested in capturing the state after the first
> wait_for_commit_done() timeout. The wait_for_tx_complete doesn't need
> such handling. Even if we were to handle it in some way, it would be a
> different conditional.
> 

wait_for_tx_complete timeout also needs similar handling.

the timeout mechanisms need to be unified at some point, that time I 
will re-visit the need to have a common wait_timeout handler.

Lets see how this code evolves.

So with that nit about the kernel doc addressed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> Last but not least, I don't like multiplexing just for the sake of it.
> There is nearly no common behaviour.
> 

the multiplexing allows us to have one common timeout path which I think 
will eventually happen. So i dont think its true that there is no common 
behavior.

>>
>> Like if wait_for_commit_done timedout or wait_for_tx_complete timedout,
>> the handling will be similar from my PoV.
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 74 +++++++++++++++++++++--------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 ++-------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
>>>    drivers/gpu/drm/msm/msm_drv.h               | 10 ----
>>>    4 files changed, 59 insertions(+), 49 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 194dbb08331d..30f349c8a1e5 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -1282,7 +1282,7 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>>>        trace_dpu_enc_disable(DRMID(drm_enc));
>>>
>>>        /* wait for idle */
>>> -     dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
>>> +     dpu_encoder_wait_for_tx_complete(drm_enc);
>>>
>>>        dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
>>>
>>> @@ -2402,10 +2402,23 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>>>        return &dpu_enc->base;
>>>    }
>>>
>>> -int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
>>> -     enum msm_event_wait event)
>>> +/**
>>> + * dpu_encoder_wait_for_commit_done() - Wait for encoder to flush pending state
>>> + * @drm_enc: encoder pointer
>>> + *
>>> + * Wait for hardware to have flushed the current pending frames to hardware at
>>> + * a vblank or ctl_start Encoders will map this differently depending on the
>>> + * panel type.
>>> + *
>>
>> Missing a '.' between ctl_start and Encoder?
> 
> Ack. Also I should drop the leftovers afterwards.
> 
>>
>>> + * MSM_ENC_TX_COMPLETE -  Wait for the hardware to transfer all the pixels to
>>> + *                        the panel. Encoders will map this differently
>>> + *                        depending on the panel type.
>>> + *                        vid mode -> vsync_irq
>>> + *                        cmd mode -> pp_done
>>> + * Return: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
>>> + */
>>> +int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_enc)
>>>    {
>>> -     int (*fn_wait)(struct dpu_encoder_phys *phys_enc) = NULL;
>>>        struct dpu_encoder_virt *dpu_enc = NULL;
>>>        int i, ret = 0;
>>>
>>> @@ -2419,23 +2432,46 @@ int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
>>>        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>                struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>
>>> -             switch (event) {
>>> -             case MSM_ENC_COMMIT_DONE:
>>> -                     fn_wait = phys->ops.wait_for_commit_done;
>>> -                     break;
>>> -             case MSM_ENC_TX_COMPLETE:
>>> -                     fn_wait = phys->ops.wait_for_tx_complete;
>>> -                     break;
>>> -             default:
>>> -                     DPU_ERROR_ENC(dpu_enc, "unknown wait event %d\n",
>>> -                                     event);
>>> -                     return -EINVAL;
>>> +             if (phys->ops.wait_for_commit_done) {
>>> +                     DPU_ATRACE_BEGIN("wait_for_commit_done");
>>> +                     ret = phys->ops.wait_for_commit_done(phys);
>>> +                     DPU_ATRACE_END("wait_for_commit_done");
>>> +                     if (ret)
>>> +                             return ret;
>>>                }
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +/**
>>> + * dpu_encoder_wait_for_tx_complete() - Wait for encoder to transfer pixels to panel
>>> + * @drm_enc: encoder pointer
>>> + *
>>> + * Wait for the hardware to transfer all the pixels to the panel. Encoders will
>>> + * map this differently depending on the panel type.
>>> + *
>>> + * Return: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
>>> + */
>>> +int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_enc)
>>> +{
>>> +     struct dpu_encoder_virt *dpu_enc = NULL;
>>> +     int i, ret = 0;
>>> +
>>> +     if (!drm_enc) {
>>> +             DPU_ERROR("invalid encoder\n");
>>> +             return -EINVAL;
>>> +     }
>>> +     dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> +     DPU_DEBUG_ENC(dpu_enc, "\n");
>>> +
>>> +     for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>> +             struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>
>>> -             if (fn_wait) {
>>> -                     DPU_ATRACE_BEGIN("wait_for_completion_event");
>>> -                     ret = fn_wait(phys);
>>> -                     DPU_ATRACE_END("wait_for_completion_event");
>>> +             if (phys->ops.wait_for_tx_complete) {
>>> +                     DPU_ATRACE_BEGIN("wait_for_tx_complete");
>>> +                     ret = phys->ops.wait_for_tx_complete(phys);
>>> +                     DPU_ATRACE_END("wait_for_tx_complete");
>>>                        if (ret)
>>>                                return ret;
>>>                }
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> index fe6b1d312a74..0c928d1876e4 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> @@ -93,25 +93,9 @@ void dpu_encoder_kickoff(struct drm_encoder *encoder);
>>>     */
>>>    int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time);
>>>
>>> -/**
>>> - * dpu_encoder_wait_for_event - Waits for encoder events
>>> - * @encoder: encoder pointer
>>> - * @event:      event to wait for
>>> - * MSM_ENC_COMMIT_DONE -  Wait for hardware to have flushed the current pending
>>> - *                        frames to hardware at a vblank or ctl_start
>>> - *                        Encoders will map this differently depending on the
>>> - *                        panel type.
>>> - *                     vid mode -> vsync_irq
>>> - *                        cmd mode -> ctl_start
>>> - * MSM_ENC_TX_COMPLETE -  Wait for the hardware to transfer all the pixels to
>>> - *                        the panel. Encoders will map this differently
>>> - *                        depending on the panel type.
>>> - *                        vid mode -> vsync_irq
>>> - *                        cmd mode -> pp_done
>>> - * Returns: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
>>> - */
>>> -int dpu_encoder_wait_for_event(struct drm_encoder *drm_encoder,
>>> -                                             enum msm_event_wait event);
>>> +int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_encoder);
>>> +
>>> +int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_encoder);
>>>
>>>    /*
>>>     * dpu_encoder_get_intf_mode - get interface mode of the given encoder
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index d6412395bacc..26b5e54031d9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -476,7 +476,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
>>>                 * mode panels. This may be a no-op for command mode panels.
>>>                 */
>>>                trace_dpu_kms_wait_for_commit_done(DRMID(crtc));
>>> -             ret = dpu_encoder_wait_for_event(encoder, MSM_ENC_COMMIT_DONE);
>>> +             ret = dpu_encoder_wait_for_commit_done(encoder);
>>>                if (ret && ret != -EWOULDBLOCK) {
>>>                        DPU_ERROR("wait for commit done returned %d\n", ret);
>>>                        break;
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>>> index 762e13e2df74..91cf57f72321 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>> @@ -74,16 +74,6 @@ enum msm_dsi_controller {
>>>    #define MSM_GPU_MAX_RINGS 4
>>>    #define MAX_H_TILES_PER_DISPLAY 2
>>>
>>> -/**
>>> - * enum msm_event_wait - type of HW events to wait for
>>> - * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
>>> - * @MSM_ENC_TX_COMPLETE - wait for the HW to transfer the frame to panel
>>> - */
>>> -enum msm_event_wait {
>>> -     MSM_ENC_COMMIT_DONE = 0,
>>> -     MSM_ENC_TX_COMPLETE,
>>> -};
>>> -
>>>    /**
>>>     * struct msm_display_topology - defines a display topology pipeline
>>>     * @num_lm:       number of layer mixers used
>>>
> 
> 
> 
