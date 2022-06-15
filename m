Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3772054D0FF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8E610EFA4;
	Wed, 15 Jun 2022 18:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC4110EFD5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 18:34:27 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r24so2067063ljn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QI8n9YUkTgYjxzVttUQ7bRkQISblsHdScbH63kL+0d0=;
 b=ZdvOORGAktn86r5VX6vX1ahoY182nvjrXOViK6j7hbo01PnyrwMF2/JRPphnV5mFQK
 UL2X/flTedsQPVnzKwB+eIL6nw0Qovv2V5AvKS8ReE3xYMC8iBL5gIVWPg8Y8Io+n7Ym
 JSvV01jeUv4Ct7Mc+2Vh4PrsIrCTLV3F2LWBAdLc/RGK8o1vQCN9KKdz7bdLPzAHC29O
 hn/kGMeqrVjc984i09dNzC1biU1qFUqSHvIsrhNwSHRQvC9k9KIaHV/a/wJ5mqn/0hKG
 JQ9Af7cs9jk5ep0zst3KkXCp/4+Vw85fHatnGgn3J9JrQa8MlXnYoPjJEbcVbxiXTK3A
 bUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QI8n9YUkTgYjxzVttUQ7bRkQISblsHdScbH63kL+0d0=;
 b=oqDDI92EreU9ny0oN+BuOFhHYUMZNV26hQPbjamQkPNChwWjXN2eOxHgk1z1WECxlB
 SAZDER9ci6IPFn1wl39QIWWsSbNzTYQPvNwAoYB7pBjsZE0LV9da2WTusg6PP8PZ6IWx
 ajVUDJgOi0lUMla0UquSUgej0Lpe7DFpG6JMg5rjzBJ4tB7HFVGujcahTFx6gwuUXyVi
 jPBD0s3IhbrEt5qVFI6LUKIC1bQ0augbIkpAfN8w7xAy6BevX46Gcm7jK3hmnF2vVCrl
 afCUsPtLPpKEC2D0l5b2eSo9b5LbEJXI3vTS0TPJ4p3LB2XVEPJEkRiu+3BsWNy+HY+j
 rdyA==
X-Gm-Message-State: AJIora8nerUPx3e5P5FHcB8EqDartUzf6LDBB04sjvCndmhXo+r61IW5
 xg8G/WA3MadVjeMBP4+KAbweQQ==
X-Google-Smtp-Source: AGRyM1tl4JwWmdUjK3oW1l9ByOpMxXQHafy4kzWn+cbAdGpbvBKsVFcABqHc/ov4y01EidLeHdTdfg==
X-Received: by 2002:a2e:9bd0:0:b0:255:8a2d:155b with SMTP id
 w16-20020a2e9bd0000000b002558a2d155bmr560141ljj.185.1655318066079; 
 Wed, 15 Jun 2022 11:34:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a056512078c00b0047255d211f7sm1880440lfr.294.2022.06.15.11.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 11:34:25 -0700 (PDT)
Message-ID: <7387f822-5e42-55f8-5101-0f76cc70522b@linaro.org>
Date: Wed, 15 Jun 2022 21:34:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <6ce50e83-3fbf-d97f-a4f2-0f5db389349c@linaro.org>
 <5163b520-e859-d813-46ae-91260b6230e5@quicinc.com>
 <182707ff-bff8-63f8-59ad-f727f7cfddc2@linaro.org>
 <8cea184e-2593-015f-e151-3b2d18ac0630@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8cea184e-2593-015f-e151-3b2d18ac0630@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 15/06/2022 20:11, Abhinav Kumar wrote:
> 
> 
> On 6/15/2022 10:04 AM, Dmitry Baryshkov wrote:
>> On 15/06/2022 19:40, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/15/2022 5:36 AM, Dmitry Baryshkov wrote:
>>>> On 14/06/2022 22:32, Abhinav Kumar wrote:
>>>>> intf and wb resources are not dependent on the rm global
>>>>> state so need not be allocated during 
>>>>> dpu_encoder_virt_atomic_mode_set().
>>>>>
>>>>> Move the allocation of intf and wb resources to 
>>>>> dpu_encoder_setup_display()
>>>>> so that we can utilize the hw caps even during atomic_check() phase.
>>>>>
>>>>> Since dpu_encoder_setup_display() already has protection against
>>>>> setting invalid intf_idx and wb_idx, these checks can now
>>>>> be dropped as well.
>>>>>
>>>>> Fixes: e02a559a720f ("make changes to dpu_encoder to support 
>>>>> virtual encoder")
>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 
>>>>> +++++++------------------
>>>>>   1 file changed, 7 insertions(+), 18 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>> index 3a462e327e0e..e991d4ba8a40 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>> @@ -1048,24 +1048,6 @@ static void 
>>>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>>           phys->hw_pp = dpu_enc->hw_pp[i];
>>>>>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>>>>> -        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>>>> -            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>>>>> phys->intf_idx);
>>>>> -
>>>>> -        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
>>>>> -            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>>>>> -
>>>>> -        if (!phys->hw_intf && !phys->hw_wb) {
>>>>> -            DPU_ERROR_ENC(dpu_enc,
>>>>> -                      "no intf or wb block assigned at idx: %d\n", 
>>>>> i);
>>>>> -            return;
>>>>> -        }
>>>>> -
>>>>> -        if (phys->hw_intf && phys->hw_wb) {
>>>>> -            DPU_ERROR_ENC(dpu_enc,
>>>>> -                    "invalid phys both intf and wb block at idx: 
>>>>> %d\n", i);
>>>>> -            return;
>>>>> -        }
>>>>
>>>> Please retain these checks in dpu_encoder_setup_display().
>>>> It checks that we really have got the intf or wb. For example one 
>>>> might have specified the INTF that leads to INTF_NONE interface. Or 
>>>> non-existing/not supported WB.
>>>
>>> Right, so the reason I omitted that was dpu_encoder_setup_display() 
>>> already has these checks:
>>>
>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2273 
>>>
>>>
>>> Please check lines 2273-2284.
>>>
>>> Only if all those checks succeeded we call 
>>> dpu_encoder_virt_add_phys_encs which increments num_phys_encs.
>>
>> As I wrote, it checks indices from phys_params, but not the acquired 
>> hardware instances.
> 
> Right but today, both the get_intf() and get_wb() just return the 
> intf/wb corresponding to the index. So as long as the index is valid how 
> will checking hw_wb or hw_intf be different?
> 
> static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, 
> enum dpu_intf intf_idx)
> {
>      return rm->hw_intf[intf_idx - INTF_0];
> }
> 
> /**
>   * dpu_rm_get_wb - Return a struct dpu_hw_wb instance given it's index.
>   * @rm: DPU Resource Manager handle
>   * @wb_idx: WB index
>   */
> static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum 
> dpu_wb wb_idx)
> {
>      return rm->hw_wb[wb_idx - WB_0];
> }

WB_0 is valid, but dpu_rm_get_wb(WB_0) will return NULL.
INTF_0 is valid, but dpu_rm_get_intf(INTF_0) on qcm2290 will return NULL.

Etc.

>>
>>>
>>> Thats why I dropped those.
>>>
>>> Let me know if you have more questions.
>>>
>>>>
>>>>> -
>>>>>           phys->cached_mode = crtc_state->adjusted_mode;
>>>>>           if (phys->ops.atomic_mode_set)
>>>>>               phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>>>>> @@ -2293,7 +2275,14 @@ static int dpu_encoder_setup_display(struct 
>>>>> dpu_encoder_virt *dpu_enc,
>>>>>           struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>>>           atomic_set(&phys->vsync_cnt, 0);
>>>>>           atomic_set(&phys->underrun_cnt, 0);
>>>>> +
>>>>> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>>>> +            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>>>>> phys->intf_idx);
>>>>> +
>>>>> +        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
>>>>> +            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>>>>>       }
>>>>> +
>>>>>       mutex_unlock(&dpu_enc->enc_lock);
>>>>>       return ret;
>>>>
>>>>
>>
>>


-- 
With best wishes
Dmitry
