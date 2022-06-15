Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C165254CF78
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589CA112667;
	Wed, 15 Jun 2022 17:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2942D112668;
 Wed, 15 Jun 2022 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655313102; x=1686849102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xGSrZCrI7kO6o/hIcmiZuTVylAEc9Kxf4F3rLbkm10I=;
 b=fSSh8yXxrx/goJWNmBJ8Mgouwh9dYBIKtvVVMfiw2CyLj4mdboGrAfoI
 Zc82Q2ZiQe0XKPd26EhmaQ6wpee2LFygjTXe2LH2M9eW+iteDvSfXJT2x
 UIi9Yg9QsMJOCF/uvax6csiCBvhWypxT/jCnrXB6Ig7TDUUkc4uLvB80L 0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 15 Jun 2022 10:11:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 10:11:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 10:11:40 -0700
Received: from [10.38.242.138] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 10:11:38 -0700
Message-ID: <8cea184e-2593-015f-e151-3b2d18ac0630@quicinc.com>
Date: Wed, 15 Jun 2022 10:11:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <6ce50e83-3fbf-d97f-a4f2-0f5db389349c@linaro.org>
 <5163b520-e859-d813-46ae-91260b6230e5@quicinc.com>
 <182707ff-bff8-63f8-59ad-f727f7cfddc2@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <182707ff-bff8-63f8-59ad-f727f7cfddc2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/15/2022 10:04 AM, Dmitry Baryshkov wrote:
> On 15/06/2022 19:40, Abhinav Kumar wrote:
>>
>>
>> On 6/15/2022 5:36 AM, Dmitry Baryshkov wrote:
>>> On 14/06/2022 22:32, Abhinav Kumar wrote:
>>>> intf and wb resources are not dependent on the rm global
>>>> state so need not be allocated during 
>>>> dpu_encoder_virt_atomic_mode_set().
>>>>
>>>> Move the allocation of intf and wb resources to 
>>>> dpu_encoder_setup_display()
>>>> so that we can utilize the hw caps even during atomic_check() phase.
>>>>
>>>> Since dpu_encoder_setup_display() already has protection against
>>>> setting invalid intf_idx and wb_idx, these checks can now
>>>> be dropped as well.
>>>>
>>>> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual 
>>>> encoder")
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 
>>>> +++++++------------------
>>>>   1 file changed, 7 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 3a462e327e0e..e991d4ba8a40 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -1048,24 +1048,6 @@ static void 
>>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>           phys->hw_pp = dpu_enc->hw_pp[i];
>>>>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>>>> -        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>>> -            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>>>> phys->intf_idx);
>>>> -
>>>> -        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
>>>> -            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>>>> -
>>>> -        if (!phys->hw_intf && !phys->hw_wb) {
>>>> -            DPU_ERROR_ENC(dpu_enc,
>>>> -                      "no intf or wb block assigned at idx: %d\n", i);
>>>> -            return;
>>>> -        }
>>>> -
>>>> -        if (phys->hw_intf && phys->hw_wb) {
>>>> -            DPU_ERROR_ENC(dpu_enc,
>>>> -                    "invalid phys both intf and wb block at idx: 
>>>> %d\n", i);
>>>> -            return;
>>>> -        }
>>>
>>> Please retain these checks in dpu_encoder_setup_display().
>>> It checks that we really have got the intf or wb. For example one 
>>> might have specified the INTF that leads to INTF_NONE interface. Or 
>>> non-existing/not supported WB.
>>
>> Right, so the reason I omitted that was dpu_encoder_setup_display() 
>> already has these checks:
>>
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2273 
>>
>>
>> Please check lines 2273-2284.
>>
>> Only if all those checks succeeded we call 
>> dpu_encoder_virt_add_phys_encs which increments num_phys_encs.
> 
> As I wrote, it checks indices from phys_params, but not the acquired 
> hardware instances.

Right but today, both the get_intf() and get_wb() just return the 
intf/wb corresponding to the index. So as long as the index is valid how 
will checking hw_wb or hw_intf be different?

static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, 
enum dpu_intf intf_idx)
{
     return rm->hw_intf[intf_idx - INTF_0];
}

/**
  * dpu_rm_get_wb - Return a struct dpu_hw_wb instance given it's index.
  * @rm: DPU Resource Manager handle
  * @wb_idx: WB index
  */
static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum 
dpu_wb wb_idx)
{
     return rm->hw_wb[wb_idx - WB_0];
}
> 
>>
>> Thats why I dropped those.
>>
>> Let me know if you have more questions.
>>
>>>
>>>> -
>>>>           phys->cached_mode = crtc_state->adjusted_mode;
>>>>           if (phys->ops.atomic_mode_set)
>>>>               phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>>>> @@ -2293,7 +2275,14 @@ static int dpu_encoder_setup_display(struct 
>>>> dpu_encoder_virt *dpu_enc,
>>>>           struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>>           atomic_set(&phys->vsync_cnt, 0);
>>>>           atomic_set(&phys->underrun_cnt, 0);
>>>> +
>>>> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>>> +            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>>>> phys->intf_idx);
>>>> +
>>>> +        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
>>>> +            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>>>>       }
>>>> +
>>>>       mutex_unlock(&dpu_enc->enc_lock);
>>>>       return ret;
>>>
>>>
> 
> 
