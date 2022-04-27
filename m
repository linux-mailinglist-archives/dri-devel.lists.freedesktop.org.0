Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C9E51152F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 12:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFAB10F160;
	Wed, 27 Apr 2022 10:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9327210F160
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 10:53:04 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g19so2460512lfv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 03:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/MDg5A9f9rvXZp1xmjZTzHZIeAwlmtx2mQRfLrQsy7E=;
 b=pIfuPJr7nqblgDaRQ4dMb03d0stbXtuCVITICOO7D+Sw4d+0uljC/gJd1LCHv7Wm9B
 y2F0N82TJJBYu0rQaIMQKnpmzGNTPTX5A+GLOyh8RADJXlYzT/kGOqQhs7QPP6GHlFJ5
 kmLGvEhadsTzLtWOODP2aBnJUHIf7Hk/jn1ipAPo0UhWS72L3ZzXTQ+w41iM/nmLTfl8
 wmzpzsg2qFyv1MxvPC3mFzATo055/Ji8SfudiSp05BcwrRzxyyN/sgMAt6+nNg/dWo5X
 nzaD0OWmvYHrz0atobccvico61skaUsgrUdBzgcJP3W3slbs/JsbPCWA0WzOuMTUYJcg
 Qwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/MDg5A9f9rvXZp1xmjZTzHZIeAwlmtx2mQRfLrQsy7E=;
 b=SpzePXkDKccnuEa7i48tKGc28SymV0IAVYDiQtIQodHygpiknZkRjZdEKcqJZaTSMe
 sywsNOOROIlB/0iCuwzESHgHXwOJ7+Eca3VHp58TRrkfu/wDsAfKlTUu21SPjtHs3tmg
 6O7X3A4kXt3P/qxziRa+TcZ4iOgsPiK/Fng7Q2FsZ7PpADXtjjI7mLsxS7nu8OzINboo
 swzEa0WHtcoOKfYxL0vxzaASQhFMwt18zaje/LkcfscOKj4KofYqmD4sIZ7JW3LGYRWu
 7rB3dhyH7FZ6ZxXJ3jKQI7228RHgcN5W+ukXHsqxJy60tEMpb5ge7Pxe28/dAIKWxNpo
 UGEg==
X-Gm-Message-State: AOAM533wchZ20sD4m9AAp+KPLzL4/YqUWAQwTfpmI/jwK/oB2zfjNcxJ
 l9CMgbBqs/d3Hsl2yREV4F6ZUg==
X-Google-Smtp-Source: ABdhPJzYAmcUZabicyvLvDv5FdlC1iUQgJ59NCULUae//BS2fAbM2zBP4v+0xt14oQfazbKVtV3ERA==
X-Received: by 2002:ac2:4add:0:b0:471:fc6d:a71d with SMTP id
 m29-20020ac24add000000b00471fc6da71dmr14050863lfp.350.1651056782925; 
 Wed, 27 Apr 2022 03:53:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a19e346000000b0046b8aac6e16sm2022462lfk.26.2022.04.27.03.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 03:53:02 -0700 (PDT)
Message-ID: <e20d94d7-a865-21f7-0514-706992294614@linaro.org>
Date: Wed, 27 Apr 2022 13:53:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/disp/dpu1: avoid clearing hw interrupts if
 hw_intr is null during drm uninit
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <1650952931-31988-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n52cSR_xCxF+_UeK8CaHqsu=4HOtfWQ3BMmx2Tx3kmk-ZA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52cSR_xCxF+_UeK8CaHqsu=4HOtfWQ3BMmx2Tx3kmk-ZA@mail.gmail.com>
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
Cc: quic_kalyant@quicinc.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2022 00:50, Stephen Boyd wrote:
> Quoting Vinod Polimera (2022-04-25 23:02:11)
>> Avoid clearing irqs and derefernce hw_intr when hw_intr is null.
> 
> Presumably this is only the case when the display driver doesn't fully
> probe and something probe defers? Can you clarify how this situation
> happens?
> 
>>
>> BUG: Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>>
>> Call trace:
>>   dpu_core_irq_uninstall+0x50/0xb0
>>   dpu_irq_uninstall+0x18/0x24
>>   msm_drm_uninit+0xd8/0x16c
>>   msm_drm_bind+0x580/0x5fc
>>   try_to_bring_up_master+0x168/0x1c0
>>   __component_add+0xb4/0x178
>>   component_add+0x1c/0x28
>>   dp_display_probe+0x38c/0x400
>>   platform_probe+0xb0/0xd0
>>   really_probe+0xcc/0x2c8
>>   __driver_probe_device+0xbc/0xe8
>>   driver_probe_device+0x48/0xf0
>>   __device_attach_driver+0xa0/0xc8
>>   bus_for_each_drv+0x8c/0xd8
>>   __device_attach+0xc4/0x150
>>   device_initial_probe+0x1c/0x28
>>
>> Fixes: a73033619ea ("drm/msm/dpu: squash dpu_core_irq into dpu_hw_interrupts")
> 
> The fixes tag looks odd. In dpu_core_irq_uninstall() at that commit it
> is dealing with 'irq_obj' which isn't a pointer. After commit
> f25f656608e3 ("drm/msm/dpu: merge struct dpu_irq into struct
> dpu_hw_intr") dpu_core_irq_uninstall() starts using 'hw_intr' which is
> allocated on the heap. If we backported this patch to a place that had
> a73033619ea without f25f656608e3 it wouldn't make any sense.

I'd agree here. The following tag would be correct:

Fixes: f25f656608e3 ("drm/msm/dpu: merge struct dpu_irq into struct 
dpu_hw_intr")


> 
>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> index c515b7c..ab28577 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> @@ -599,6 +599,9 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
>>   {
>>          int i;
>>
>> +       if (!dpu_kms->hw_intr)
>> +               return;
>> +
>>          pm_runtime_get_sync(&dpu_kms->pdev->dev);
>>          for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)


-- 
With best wishes
Dmitry
