Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB954DA15
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 07:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFA811A064;
	Thu, 16 Jun 2022 05:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A5611A05C;
 Thu, 16 Jun 2022 05:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655359170; x=1686895170;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fYTknwqyj1AQO6bgU6HRYVdX/mxtESWcssnOCYsVQYk=;
 b=jWlbAA0KnVmtGUEIsDsp7LGHfqWX5TeXsiyZ7vw88ldWEz2rFIuKROIu
 YgE+qnCz1PZP2vVpNkUbQCT1//JnQ5yD1Tn8tbtZ2a1yb87rGhd6NHqlR
 tYfv5k80jsZAbTGm6HbpUnSaQT2lpSI1ChkT9QBjbwIWSL8jXYlfQkQ5Q s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jun 2022 22:59:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:59:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 22:59:29 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 22:59:27 -0700
Message-ID: <5b35ee5a-ed94-1440-cdc2-909a82c3aa61@quicinc.com>
Date: Wed, 15 Jun 2022 22:59:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <82b09d4d-1985-519e-3657-0d15e07ccc2f@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <82b09d4d-1985-519e-3657-0d15e07ccc2f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Hi Dmitry

On 6/15/2022 10:55 PM, Dmitry Baryshkov wrote:
> On 14/06/2022 22:32, Abhinav Kumar wrote:
>> intf and wb resources are not dependent on the rm global
>> state so need not be allocated during dpu_encoder_virt_atomic_mode_set().
>>
>> Move the allocation of intf and wb resources to 
>> dpu_encoder_setup_display()
>> so that we can utilize the hw caps even during atomic_check() phase.
>>
>> Since dpu_encoder_setup_display() already has protection against
>> setting invalid intf_idx and wb_idx, these checks can now
>> be dropped as well.
>>
>> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual 
>> encoder")
> 
> Please adjust the Fixes tags in all three commits. I didn't notice this 
> beforehand and Stephen has complained.
> 
Is something wrong with the tag? Format and hash looked right to me.
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 
>> +++++++------------------
>>   1 file changed, 7 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 3a462e327e0e..e991d4ba8a40 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1048,24 +1048,6 @@ static void 
>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>           phys->hw_pp = dpu_enc->hw_pp[i];
>>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>> -        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>> -            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>> phys->intf_idx);
>> -
>> -        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
>> -            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>> -
>> -        if (!phys->hw_intf && !phys->hw_wb) {
>> -            DPU_ERROR_ENC(dpu_enc,
>> -                      "no intf or wb block assigned at idx: %d\n", i);
>> -            return;
>> -        }
>> -
>> -        if (phys->hw_intf && phys->hw_wb) {
>> -            DPU_ERROR_ENC(dpu_enc,
>> -                    "invalid phys both intf and wb block at idx: 
>> %d\n", i);
>> -            return;
>> -        }
>> -
>>           phys->cached_mode = crtc_state->adjusted_mode;
>>           if (phys->ops.atomic_mode_set)
>>               phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>> @@ -2293,7 +2275,14 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>           struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>           atomic_set(&phys->vsync_cnt, 0);
>>           atomic_set(&phys->underrun_cnt, 0);
>> +
>> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>> +            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>> phys->intf_idx);
>> +
>> +        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
>> +            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>>       }
>> +
>>       mutex_unlock(&dpu_enc->enc_lock);
>>       return ret;
> 
> 
