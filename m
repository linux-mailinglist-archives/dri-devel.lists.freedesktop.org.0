Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B67F626B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 16:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073FA10E092;
	Thu, 23 Nov 2023 15:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F4210E08B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 15:14:17 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AD15766073B4;
 Thu, 23 Nov 2023 15:14:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700752456;
 bh=gdMPknQRML7UtA6O1j4YRuqTzW4N2Z3DzX3mVKrRUZ0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yxjnoe2nGaK31xuhWBJPK3nU3cP8VnpGE3Rh81ZRRsmi4KbVBBID5DR2TmEbXcZ+d
 4IRtC4oa0H8FsmY2wWKtNoi8XDNBxCMwJB76MA3/03MvHa7G9V3hsIxosQYftHSlHX
 5uNjWcOnPrU//IQPUNvjcvz8r+M+mhEjzKN75ieahh4uacyiR3WHM+GaDacZ8GKqpP
 EwpDzPtuH2rwWqbz7cBIsKFivdzXBpntYdXNEwNZKDdlg4yrKFAky4mpbFLEsji53o
 4cL2AdipzUsRnQbPcv2rAaDFC+rrpw9rHEZ5d1SkrWm7afyrTGIpaTgOcLcRV/9FnU
 IlBdHKmOnFTHg==
Message-ID: <43cc8641-6a60-41d9-b8f2-32227235702a@collabora.com>
Date: Thu, 23 Nov 2023 16:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231123095320.41433-1-angelogioacchino.delregno@collabora.com>
 <20231123113530.46191ded@collabora.com>
 <1740797f-f3ae-4868-924a-08d6d731e506@collabora.com>
 <20231123135933.34d643f7@collabora.com>
 <5019af46-f5ae-4db5-979e-802b61025ba4@collabora.com>
 <20231123145103.23b6eac9@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231123145103.23b6eac9@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/11/23 14:51, Boris Brezillon ha scritto:
> On Thu, 23 Nov 2023 14:24:57 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>>>>
>>>> So, while I agree that it'd be slightly more readable as a diff if those
>>>> were two different commits I do have reasons against splitting.....
>>>
>>> If we just need a quick fix to avoid PWRTRANS interrupts from kicking
>>> in when we power-off the cores, I think we'd be better off dropping
>>> GPU_IRQ_POWER_CHANGED[_ALL] from the value we write to GPU_INT_MASK
>>> at [re]initialization time, and then have a separate series that fixes
>>> the problem more generically.
>>>    
>>
>> But that didn't work:
>> https://lore.kernel.org/all/d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org/
> 
> I meant, your 'ignore-core_mask' fix + the
> 'drop GPU_IRQ_POWER_CHANGED[_ALL] in GPU_INT_MASK' one.
> 
> So,
> 
> https://lore.kernel.org/all/4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com/
> +
> https://lore.kernel.org/all/d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org/
> 
>>
>>
>> ...while this "full" solution worked:
>> https://lore.kernel.org/all/39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org/
>>
>> https://lore.kernel.org/all/5b24cc73-23aa-4837-abb9-b6d138b46426@linaro.org/
>>
>>
>> ...so this *is* a "quick fix" already... :-)
> 
> It's a half-baked solution for the missing irq-synchronization-on-suspend
> issue IMHO. I understand why you want it all in one patch that can serve
> as a fix for 123b431f8a5c ("drm/panfrost: Really power off GPU cores in
> panfrost_gpu_power_off()"), which is why I'm suggesting to go for an
> even simpler diff (see below), and then fully address the
> irq-synhronization-on-suspend issue in a follow-up patchset.
> 
> --->8---
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 09f5e1563ebd..6e2d7650cc2b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -78,7 +78,10 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>          }
>   
>          gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
> -       gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL);
> +       gpu_write(pfdev, GPU_INT_MASK,
> +                 GPU_IRQ_MASK_ERROR |
> +                 GPU_IRQ_PERFCNT_SAMPLE_COMPLETED |
> +                 GPU_IRQ_CLEAN_CACHES_COMPLETED);
>   

...but if we do that, the next patch(es) will contain a partial revert of this
commit, putting back this to gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL)...

I'm not sure that it's worth changing this like that, then changing it back right
after :-\

Anyway, if anyone else agrees with doing it and then partially revert, I have no
issues going with this one instead; what I care about ultimately is resolving the
regression ASAP :-)

Cheers,
Angelo

>          /*
>           * All in-flight jobs should have released their cycle
> @@ -425,11 +428,10 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>   
>   void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>   {
> -       u64 core_mask = panfrost_get_core_mask(pfdev);
>          int ret;
>          u32 val;
>   
> -       gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & core_mask);
> +       gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
>          ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
>                                           val, !val, 1, 1000);
>          if (ret)
> @@ -441,7 +443,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>          if (ret)
>                  dev_err(pfdev->dev, "tiler power transition timeout");
>   
> -       gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);
> +       gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
>          ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
>                                   val, !val, 0, 1000);
>          if (ret)
> 
> 

