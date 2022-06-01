Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA7C53B053
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 01:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD781120E7;
	Wed,  1 Jun 2022 23:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583DE1120B9;
 Wed,  1 Jun 2022 23:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654124505; x=1685660505;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3KqXwi34XKSLr7jec5wJ0ltW9KraTu5BBDO4djryD+M=;
 b=Qs85IlERaK+M3fxqXgSRUA6rrkBMWgLPDRn2bR6+havCNB44Huwff/Y5
 kKKcFdguN97vwcBj3jXHqrX1UR2CG/edeMHdhOt1jpLy+5kAwW2od7nMs
 uvuqMVoFXUHvELAUouMuitgWNsCFyU+OzJEf94IaewyBf6PCFgUUwBnIx k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 01 Jun 2022 16:01:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 16:01:44 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 1 Jun 2022 16:01:43 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 1 Jun 2022
 16:01:40 -0700
Message-ID: <7c8a6058-b67f-8e88-d5ee-34d589c2d9f4@quicinc.com>
Date: Wed, 1 Jun 2022 16:01:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/dpu: Move min BW request and full BW disable
 back to mdss
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220531160059.v2.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
 <CAA8EJpqp64eDmXPN1qMTZ78My8BKPUcu7zKunZV1SJpzjSRDuQ@mail.gmail.com>
 <f8d5e4a7-bba8-ca51-41f7-885ce14a55fe@quicinc.com>
 <CAA8EJpp5v3qR2M-6Jms=3GgrzUeMOiMzQtgvQc_LPVE78aE=aw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp5v3qR2M-6Jms=3GgrzUeMOiMzQtgvQc_LPVE78aE=aw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/1/2022 12:58 PM, Dmitry Baryshkov wrote:
> On Wed, 1 Jun 2022 at 20:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> On 6/1/2022 3:04 AM, Dmitry Baryshkov wrote:
>>> On Wed, 1 Jun 2022 at 02:01, Douglas Anderson <dianders@chromium.org> wrote:
>>>>
>>>> In commit a670ff578f1f ("drm/msm/dpu: always use mdp device to scale
>>>> bandwidth") we fully moved interconnect stuff to the DPU driver. This
>>>> had no change for sc7180 but _did_ have an impact for other SoCs. It
>>>> made them match the sc7180 scheme.
>>>
>>> [skipped the description]
>>>
>>>>
>>>> Changes in v2:
>>>> - Don't set bandwidth in init.
>>>>
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  8 ----
>>>>    drivers/gpu/drm/msm/msm_mdss.c          | 57 +++++++++++++++++++++++++
>>>>    2 files changed, 57 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index 2b9d931474e0..3025184053e0 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -49,8 +49,6 @@
>>>>    #define DPU_DEBUGFS_DIR "msm_dpu"
>>>>    #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>>>>
>>>> -#define MIN_IB_BW      400000000ULL /* Min ib vote 400MB */
>>>> -
>>>>    static int dpu_kms_hw_init(struct msm_kms *kms);
>>>>    static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
>>>>
>>>
>>> [skipped]
>>>
>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>>> index 0454a571adf7..e13c5c12b775 100644
>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>>> @@ -5,6 +5,7 @@
>>>>
>>>>    #include <linux/clk.h>
>>>>    #include <linux/delay.h>
>>>> +#include <linux/interconnect.h>
>>>>    #include <linux/irq.h>
>>>>    #include <linux/irqchip.h>
>>>>    #include <linux/irqdesc.h>
>>>> @@ -25,6 +26,8 @@
>>>>    #define UBWC_CTRL_2                    0x150
>>>>    #define UBWC_PREDICTION_MODE           0x154
>>>>
>>>> +#define MIN_IB_BW      400000000UL /* Min ib vote 400MB */
>>>
>>> As msm_mdss is now used for both DPU and MDP5 devices, could you
>>> please confirm that this value is valid for older devices too? E.g.
>>> db410c or 8974
>>>
>> I need to check with Kalyan on this value (400MB) as I am unable to find
>> documentation on this. Will update this thread when I do.
>>
>> So prior to this change 627dc55c273da ("drm/msm/disp/dpu1: icc path
>> needs to be set before dpu runtime resume"), this value was coming from
>> the hw catalog
>>
>> @@ -1191,10 +1193,10 @@ static int __maybe_unused
>> dpu_runtime_resume(struct device *dev)
>>
>>           ddev = dpu_kms->dev;
>>
>> +       WARN_ON(!(dpu_kms->num_paths));
>>           /* Min vote of BW is required before turning on AXI clk */
>>           for (i = 0; i < dpu_kms->num_paths; i++)
>> -               icc_set_bw(dpu_kms->path[i], 0,
>> -                       dpu_kms->catalog->perf.min_dram_ib);
>> +               icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
>>
>> After this, we moved to a hard-coded value, I am not sure why.
>>
>> So nothing wrong with this change as such, the only question is whether
>> this value is correct for older chips.
>>
>> But the question here is, are older chips even using icc.
>>
>> It seems like only sc7180, RB3/RB5 are unless i am mistaken.
> 
> We are not using it for msm8916 (but we should most probably). And for
> the msm8996 the icc patches were by Yassine.
> 
>> So is there really any impact to the older chips with this change.
>>
>> If not, we should probably let this one go ahead and move back to
>> catalog based approach while extending ICC for older chips.
> 
> Let's get this sorted out. I'm fine with 400 MBps, if that works for
> all chipsets.
> 

I confirm that 400MBps min vote will work for all chipsets based on the 
discussion i had with my team.

Here, the additional thing to note as per discussion with doug on IRC is

now two ICC paths get created, one from mdp5's probe and the other from 
msm_mdss_init().

So the ICC driver will aggregate the votes and take the max for the 
second parameter ( IB ).

So for normal use-cases this will still work fine.

Thanks

Abhinav

