Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9862554D077
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8725410EAB0;
	Wed, 15 Jun 2022 17:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AC110EA8D;
 Wed, 15 Jun 2022 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655315781; x=1686851781;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mf4qnmQcWK+OGeMCPEBVX1U2QPkWG2jVkjuDZpuUL7E=;
 b=u739ph5AJu11aRquUlFTX0z3A2zaU7IDQDegKanM/gXfPIEaUktb73PR
 1ILHING34fxrgdOhWbVE/a/Uuk2XfcEpKKq0Pxp/bxkO3gnpGSme0eedo
 41JciYQAQu9O3uBqwDByxh2L0V5AIsgaa4fz1bUXTCUJZbMhv6Ih5mr0t U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jun 2022 10:56:21 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 10:56:21 -0700
Received: from [10.71.110.111] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 10:56:20 -0700
Message-ID: <68d35494-a68f-0c0d-87f1-bc4278f2275b@quicinc.com>
Date: Wed, 15 Jun 2022 10:56:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Freedreno] [PATCH v2 1/3] drm/msm/dpu: Move LM CRC code into
 separate method
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220614211328.216-1-quic_jesszhan@quicinc.com>
 <20220614211328.216-2-quic_jesszhan@quicinc.com>
 <CAA8EJppgyuzHipZT1SVyD5+NNnC2yB5hRy4=--DGv=dk1VRMAw@mail.gmail.com>
 <7489a181-f87f-5187-6fae-3ad5b74c2d2c@quicinc.com>
 <d91600b6-c9a6-bdae-e5c3-38a6b1133883@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <d91600b6-c9a6-bdae-e5c3-38a6b1133883@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/15/2022 9:17 AM, Dmitry Baryshkov wrote:
> On 15/06/2022 19:11, Jessica Zhang wrote:
>> On 6/15/2022 2:35 AM, Dmitry Baryshkov wrote:
>>> On Wed, 15 Jun 2022 at 00:13, Jessica Zhang 
>>> <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>> Move layer mixer-specific section of dpu_crtc_get_crc() into a separate
>>>> helper method. This way, we can make it easier to get CRCs from 
>>>> other HW
>>>> blocks by adding other get_crc helper methods.
>>>>
>>>> Changes since V1:
>>>> - Moved common bitmasks to dpu_hw_util.h
>>>> - Moved common CRC methods to dpu_hw_util.c
>>>> - Updated copyrights
>>>> - Changed crcs array to a dynamically allocated array and added it as a
>>>>    member of crtc_state
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>
>>> Please split this into separate patches. One for hw_util, one for the 
>>> rest
>>
>> Sure
>>
>>>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 88 
>>>> +++++++++++++--------
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  4 +
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 42 +---------
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 46 ++++++++++-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 16 ++++
>>>>   5 files changed, 124 insertions(+), 72 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> index b56f777dbd0e..16742a66878e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> @@ -1,5 +1,6 @@
>>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>>   /*
>>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved.
>>>>    * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>>>>    * Copyright (C) 2013 Red Hat
>>>>    * Author: Rob Clark <robdclark@gmail.com>
>>>> @@ -88,6 +89,11 @@ static int dpu_crtc_verify_crc_source(struct 
>>>> drm_crtc *crtc,
>>>>          enum dpu_crtc_crc_source source = 
>>>> dpu_crtc_parse_crc_source(src_name);
>>>>          struct dpu_crtc_state *crtc_state = 
>>>> to_dpu_crtc_state(crtc->state);
>>>>
>>>> +       if (crtc_state->crcs) {
>>>> +               kfree(crtc_state->crcs);
>>>> +               crtc_state->crcs = NULL;
>>>> +       }
>>>> +
>>>>          if (source < 0) {
>>>>                  DRM_DEBUG_DRIVER("Invalid source %s for CRTC%d\n", 
>>>> src_name, crtc->index);
>>>>                  return -EINVAL;
>>>> @@ -96,20 +102,37 @@ static int dpu_crtc_verify_crc_source(struct 
>>>> drm_crtc *crtc,
>>>>          if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>>>>                  *values_cnt = crtc_state->num_mixers;
>>>>
>>>> +       crtc_state->crcs = kcalloc(*values_cnt, 
>>>> sizeof(crtc_state->crcs), GFP_KERNEL);
>>>> +
>>>
>>> I do not quite like the idea of constantly allocating and freeing the
>>> crcs array. I'd suggest defining sensible MAX_CRC_VALUES, using a
>>> static array and verifying that no one over commits the
>>> MAX_CRC_VALUES.
>>> If at some point we decide that we really need the dynamic array, we
>>> can implement it later. We already had dynamic arrays and Rob had to
>>> fix it. See 00326bfa4e63 ("drm/msm/dpu: Remove dynamic allocation from
>>> atomic context").
>>
>> Ah, got it... the reason I used a dynamic array here was because AFAIK 
>> we don't have a defined upper limit for how many drm_encoders can be 
>> connected to a CRTC simultaneously. Do you have a suggestion on what 
>> value we can set for MAX_CRC_VALUES?
> 
> Three? Two for two hw_intfs?

Do you mean 2 hw_intfs per drm_encoder or 2 hw_intfs overall? IIRC we 
also wanted to take into account the possibility of there being multiple 
drm_encoders attached to a single CRTC.

Also, looking through Rob's fix, the warning was occuring because we 
were trying to call kcalloc in an IRQ context. However, the way I'm 
currently doing dynamic allocation will avoid the warning (since I'm 
doing kcalloc in verify_crc_source, which is called during the debugfs 
read/write/open and not during vblank). So I don't believe that we'll 
encounter the warning related to Rob's fix with my current 
implementation of the crcs dynamic array.

Thanks,

Jessica Zhang

> 
> 
> -- 
> With best wishes
> Dmitry
