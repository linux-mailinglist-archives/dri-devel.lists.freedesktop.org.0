Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEDF60FF79
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 19:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68B810E282;
	Thu, 27 Oct 2022 17:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC25810E6B3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 17:40:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x21so2956420ljg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5dQ5iXYypgbJC6JVuTz64YgEiNayZPBEIXcuhjY1RiA=;
 b=MUdxN8jBJLvEPpz4xRlWyHx+U+2qnlG1s2vyNGymS4IA5POKPvoEx4n8I29061lwWR
 FOXns6ZJ9464gxWK9dYzFKPTmEAihozFtmpEUqe5jhpzMlkDKggwUaBJZjphPTzvrIGX
 sJWcGp9GYAe4GNTJXaE5hlQselL5I28H6+3CfuUvSJ43oMt6uf98C4nLNS5n0Y7Btse9
 h/K6ixcbTaJmDBBo+4ZcGrU3NWVzvi3YbN2mrkF8Wf6rKg25WGdVFdo1gC8IDaMt187N
 069vQ70kpRoLR5f/9QzZZ8jaxFnlXJ48RwD8BWYyqsd7GXpw8lzG7WeC/6eGYJZmkqKo
 8COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5dQ5iXYypgbJC6JVuTz64YgEiNayZPBEIXcuhjY1RiA=;
 b=lYqRVbh0XytQ4a1xewbabD09jjT4gaYEFzz/btHvQ+O2WLud6eZBtAbpf4nkAwAqo9
 HIb3GQCe05SSSC1Pp+anGATDUbZhgxNkMlUVNDTVZyK3cukJm7N0TTs++2hO+mTrL/eg
 gGcY0HKahuXNv8mK8kDXz7sslSO12s5jSmOyx5oi6VMtXgCz4Br3g1ZNf2o/WRAhzsZ9
 738Z8LBcJlCuseonNDp5ahd0l32FcA75B1BQgF4NXMelKiw2voUcIy6uun9AokUbWuo7
 2ww2LMO/LcWz6X/b0tOa0QBHULGECOQqi6SqZnakW/1D7cvhwepx+p6/oEkFYcjoTTvQ
 pXDw==
X-Gm-Message-State: ACrzQf0uHVa0Kgqk9QOZT7xfq6fKBgxQarnfaXToGpD19JWavlONX2zJ
 FLWWtq1mNFum6hgfJ4l/01bvJA==
X-Google-Smtp-Source: AMsMyM7il5IkwmWr4mwznK/xwHIcZqOrxqV6QhIQMw5WDa6TNpHUypqnTGu3qs9hDYuZTcnPGMVQtA==
X-Received: by 2002:a05:651c:b13:b0:277:2a88:6995 with SMTP id
 b19-20020a05651c0b1300b002772a886995mr1748143ljr.516.1666892437114; 
 Thu, 27 Oct 2022 10:40:37 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 142-20020a2e0994000000b0027706d22878sm306643ljj.94.2022.10.27.10.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 10:40:36 -0700 (PDT)
Message-ID: <780a3aeb-2e7f-b3ca-be58-ab24bd06d805@linaro.org>
Date: Thu, 27 Oct 2022 20:40:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v8 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Content-Language: en-GB
To: Vinod Polimera <vpolimer@qti.qualcomm.com>,
 "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1665576159-3749-1-git-send-email-quic_vpolimer@quicinc.com>
 <1665576159-3749-2-git-send-email-quic_vpolimer@quicinc.com>
 <52e7a83b-bd83-ba63-55f9-a75cf549546d@linaro.org>
 <BN0PR02MB8173F084DD0DDAD2E312CA6DE4339@BN0PR02MB8173.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB8173F084DD0DDAD2E312CA6DE4339@BN0PR02MB8173.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/10/2022 16:34, Vinod Polimera wrote:
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Monday, October 24, 2022 8:52 PM
>> To: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; dri-
>> devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org; robdclark@gmail.com;
>> dianders@chromium.org; swboyd@chromium.org; Kalyan Thota (QUIC)
>> <quic_kalyant@quicinc.com>; Kuogee Hsieh (QUIC)
>> <quic_khsieh@quicinc.com>; Vishnuvardhan Prodduturi (QUIC)
>> <quic_vproddut@quicinc.com>; Bjorn Andersson (QUIC)
>> <quic_bjorande@quicinc.com>; Aravind Venkateswaran (QUIC)
>> <quic_aravindh@quicinc.com>; Abhinav Kumar (QUIC)
>> <quic_abhinavk@quicinc.com>; Sankeerth Billakanti (QUIC)
>> <quic_sbillaka@quicinc.com>
>> Subject: Re: [PATCH v8 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and
>> get crtc from connector state instead of dpu_enc
>>
>> WARNING: This email originated from outside of Qualcomm. Please be wary
>> of any links or attachments, and do not enable macros.
>>
>> On 12/10/2022 15:02, Vinod Polimera wrote:
>>> Update crtc retrieval from dpu_enc to dpu_enc connector state,
>>> since new links get set as part of the dpu enc virt mode set.
>>> The dpu_enc->crtc cache is no more needed, hence cleaning it as
>>> part of this change.
>>>
>>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 +++++++++---------
>> -----------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 ------
>>>    3 files changed, 13 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 13ce321..8ec9a13 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -1029,7 +1029,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>>>                 */
>>>                if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
>>>                        release_bandwidth = true;
>>> -             dpu_encoder_assign_crtc(encoder, NULL);
>>>        }
>>>
>>>        /* wait for frame_event_done completion */
>>> @@ -1099,9 +1098,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>>>        trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
>>>        dpu_crtc->enabled = true;
>>>
>>> -     drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state-
>>> encoder_mask)
>>> -             dpu_encoder_assign_crtc(encoder, crtc);
>>> -
>>>        /* Enable/restore vblank irq handling */
>>>        drm_crtc_vblank_on(crtc);
>>>    }
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 9c6817b..d05b353 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -132,11 +132,6 @@ enum dpu_enc_rc_states {
>>>     * @intfs_swapped:  Whether or not the phys_enc interfaces have been
>> swapped
>>>     *                  for partial update right-only cases, such as pingpong
>>>     *                  split where virtual pingpong does not generate IRQs
>>> - * @crtc:            Pointer to the currently assigned crtc. Normally you
>>> - *                   would use crtc->state->encoder_mask to determine the
>>> - *                   link between encoder/crtc. However in this case we need
>>> - *                   to track crtc in the disable() hook which is called
>>> - *                   _after_ encoder_mask is cleared.
>>>     * @connector:              If a mode is set, cached pointer to the active
>> connector
>>>     * @crtc_kickoff_cb:                Callback into CRTC that will flush & start
>>>     *                          all CTL paths
>>> @@ -181,7 +176,6 @@ struct dpu_encoder_virt {
>>>
>>>        bool intfs_swapped;
>>>
>>> -     struct drm_crtc *crtc;
>>>        struct drm_connector *connector;
>>>
>>>        struct dentry *debugfs_root;
>>> @@ -1288,7 +1282,7 @@ static void dpu_encoder_vblank_callback(struct
>> drm_encoder *drm_enc,
>>>                struct dpu_encoder_phys *phy_enc)
>>>    {
>>>        struct dpu_encoder_virt *dpu_enc = NULL;
>>> -     unsigned long lock_flags;
>>> +     struct drm_crtc *crtc;
>>>
>>>        if (!drm_enc || !phy_enc)
>>>                return;
>>> @@ -1296,12 +1290,13 @@ static void dpu_encoder_vblank_callback(struct
>> drm_encoder *drm_enc,
>>>        DPU_ATRACE_BEGIN("encoder_vblank_callback");
>>>        dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>
>>> -     atomic_inc(&phy_enc->vsync_cnt);
>>> +     if (!dpu_enc->connector || !dpu_enc->connector->state ||
>>> +         !dpu_enc->connector->state->crtc)
>>> +             return;
>>>
>>> -     spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
>>> -     if (dpu_enc->crtc)
>>> -             dpu_crtc_vblank_callback(dpu_enc->crtc);
>>> -     spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>>> +     atomic_inc(&phy_enc->vsync_cnt);
>>> +     crtc = dpu_enc->connector->state->crtc;
>>> +     dpu_crtc_vblank_callback(crtc);
>>
>> So, what if the user commits the mode setting change on another CPU,
>> while we are handling the vblank callback here? Can this happen?
>>
> If user issues a commit on another CPU, it will wait in the drm_atomic_helper_swap_state
> as drm_atomic_helper_commit_hw_done which does the complete_all(&commit->hw_done)
> for the current commit didn't finish yet.

Yes. But there is no interlock between commit->hw_done and vblank IRQ 
processing, isn't it? This call happens when DPU processes the vblank 
IRQ, so nobody stops other core from swapping the encode state on 
another core.

>>>
>>>        DPU_ATRACE_END("encoder_vblank_callback");
>>>    }
>> --
>> With best wishes
>> Dmitry
> 
> Thanks,
> Vinod P.

-- 
With best wishes
Dmitry

