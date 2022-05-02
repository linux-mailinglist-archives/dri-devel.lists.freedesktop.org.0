Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75B516923
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 03:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA5110E92C;
	Mon,  2 May 2022 01:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD3110E92C;
 Mon,  2 May 2022 01:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651455528; x=1682991528;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GB5FNSl/Q5I54V+rN8pZy3Znz3ryXNi/K6XHiOqMzB4=;
 b=rATZE1J1W2JnO9AEqYZ+0ImpNUBUdmBnvARAKCjWBjNUe0WYMzBOCKDS
 w8Iwbi3xDQyMnLG7Kp4Lctj4aCQn1ooaTIGvYI7Iby4QXSuX7RYEFGRDC
 UBxegr4p5dFc32iVlQgmXRcnnyAoawpzci06eECcn0yoRiDy4SyAOBHlo E=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 01 May 2022 18:38:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 18:38:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 1 May 2022 18:38:27 -0700
Received: from [10.38.245.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 1 May 2022
 18:38:24 -0700
Message-ID: <200eddae-02b8-5479-3e81-1f3885200ac0@quicinc.com>
Date: Sun, 1 May 2022 18:38:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/disp/dpu1: avoid clearing hw
 interrupts if hw_intr is null during drm uninit
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <1650952931-31988-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n52cSR_xCxF+_UeK8CaHqsu=4HOtfWQ3BMmx2Tx3kmk-ZA@mail.gmail.com>
 <e20d94d7-a865-21f7-0514-706992294614@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <e20d94d7-a865-21f7-0514-706992294614@linaro.org>
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
Cc: quic_kalyant@quicinc.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like our new CI has given all the answers we need :) which is a 
great win for the CI in my opinion.

Take a look at this report : 
https://gitlab.freedesktop.org/drm/msm/-/jobs/22015361

This issue seems to be because this change 
https://github.com/torvalds/linux/commit/169466d4e59ca204683998b7f45673ebf0eb2de6 
is missing in our tree.

Without this change, what happens is that we are not hitting the return 
0 because we check for ENODEV.


   /*
      * External bridges are mandatory for eDP interfaces: one has to
      * provide at least an eDP panel (which gets wrapped into 
panel-bridge).
      *
      * For DisplayPort interfaces external bridges are optional, so
      * silently ignore an error if one is not present (-ENODEV).
      */
     rc = dp_parser_find_next_bridge(dp_priv->parser);
     if (!dp->is_edp && rc == -ENODEV)
         return 0;

So, I think we should do both:

1) Since we are running CI on the tree, backport this change so that 
this error path doesnt hit?

2) Add this protection as well because this shows that we can indeed hit 
this path in EDEFER cases causing this crash.

Thanks

Abhinav

On 4/27/2022 3:53 AM, Dmitry Baryshkov wrote:
> On 27/04/2022 00:50, Stephen Boyd wrote:
>> Quoting Vinod Polimera (2022-04-25 23:02:11)
>>> Avoid clearing irqs and derefernce hw_intr when hw_intr is null.
>>
>> Presumably this is only the case when the display driver doesn't fully
>> probe and something probe defers? Can you clarify how this situation
>> happens?
>>
>>>
>>> BUG: Unable to handle kernel NULL pointer dereference at virtual 
>>> address 0000000000000000
>>>
>>> Call trace:
>>>   dpu_core_irq_uninstall+0x50/0xb0
>>>   dpu_irq_uninstall+0x18/0x24
>>>   msm_drm_uninit+0xd8/0x16c
>>>   msm_drm_bind+0x580/0x5fc
>>>   try_to_bring_up_master+0x168/0x1c0
>>>   __component_add+0xb4/0x178
>>>   component_add+0x1c/0x28
>>>   dp_display_probe+0x38c/0x400
>>>   platform_probe+0xb0/0xd0
>>>   really_probe+0xcc/0x2c8
>>>   __driver_probe_device+0xbc/0xe8
>>>   driver_probe_device+0x48/0xf0
>>>   __device_attach_driver+0xa0/0xc8
>>>   bus_for_each_drv+0x8c/0xd8
>>>   __device_attach+0xc4/0x150
>>>   device_initial_probe+0x1c/0x28
>>>
>>> Fixes: a73033619ea ("drm/msm/dpu: squash dpu_core_irq into 
>>> dpu_hw_interrupts")
>>
>> The fixes tag looks odd. In dpu_core_irq_uninstall() at that commit it
>> is dealing with 'irq_obj' which isn't a pointer. After commit
>> f25f656608e3 ("drm/msm/dpu: merge struct dpu_irq into struct
>> dpu_hw_intr") dpu_core_irq_uninstall() starts using 'hw_intr' which is
>> allocated on the heap. If we backported this patch to a place that had
>> a73033619ea without f25f656608e3 it wouldn't make any sense.
> 
> I'd agree here. The following tag would be correct:
> 
> Fixes: f25f656608e3 ("drm/msm/dpu: merge struct dpu_irq into struct 
> dpu_hw_intr")
> 
> 
>>
>>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> index c515b7c..ab28577 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> @@ -599,6 +599,9 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
>>>   {
>>>          int i;
>>>
>>> +       if (!dpu_kms->hw_intr)
>>> +               return;
>>> +
>>>          pm_runtime_get_sync(&dpu_kms->pdev->dev);
>>>          for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> 
> 
