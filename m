Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0407F3481
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 18:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D5710E03E;
	Tue, 21 Nov 2023 17:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08D810E03E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 17:08:48 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso13060852a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 09:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700586527; x=1701191327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y2Z8Oswmnv5l8+iIKs5J+rFuuGNL4BAW7e05DiFReYg=;
 b=mEYcaMiwF8Czone5WZ1Y+YJk2LONs7rq57OQX8vsQAABWTw3HSBVywww6iJo53CDnJ
 BxtwMVSLuKyaK6D4OAcIoZrutNlsKEsuEKCMqps7LYv5AVl5yus3Rz0OIzFvIobpwKrZ
 bYpvDbHDOlYKLP6oR24hOJVUVKNXJkV4oR74Vo0I2j9W2vjdRZCZQPV/ykuGbUHmRxG+
 EyrQfDLwnDsGOXyY6rNsnFUSAfPo5Cy4G7ILM6DV3cJNng5raogwiciJQstcn+/Wx3Uc
 msrqXE++drMYzkWUcgse5+o/nWtFGKT2hS8rCH2YM8xlGak97RVqSXlJiuxoG/GT4Eew
 rtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700586527; x=1701191327;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2Z8Oswmnv5l8+iIKs5J+rFuuGNL4BAW7e05DiFReYg=;
 b=tpMxZSVhg5zwKiD+1xscMUx71k2SdeIpfr17EzWJf3Yk1zSVKK0vGzcIf7rf6yOWW+
 QK3o0jIFZLz/DgOGiJGUuJB9jvMAY3gINb5QkGtdjSAPyCfa7Goe6Pmm5WQQVt66wbi8
 gMOVOYLrmtVlMJAJ2uJJWbYzLo9OXwkA451oBJgUylDlukmkZWSu+j/LVfKZrB/dhIbL
 siGCIUZYOHGzoqnw4kIvzq4SHFvSIfTPTfBb1+yA63NWeHkUIoIWfQoh/VryOXdxy6jb
 EEONqn7A9Y34jtqTrUTOU/bAxeN4CoE3/6HbNQdMYnKRc113qJWrcgLUQF2OYvcCML0V
 ki0A==
X-Gm-Message-State: AOJu0Yy5s0BbAEPu2QGW2y9elYeq1m1zeC2OyBpJL4YJLAdVoZveYjqw
 l0yGQE8ZTwmzRjR0GV/nCd66vO57GO76kDVguUs=
X-Google-Smtp-Source: AGHT+IFU+ucUurpD3NInIELWrMjSq/3YnWFAmOoNBFAmW6JPS743rtRV3AJeTDeclL+9mxrOC242qQ==
X-Received: by 2002:a17:906:3c17:b0:9ad:8a9e:23ee with SMTP id
 h23-20020a1709063c1700b009ad8a9e23eemr2994699ejg.13.1700586526782; 
 Tue, 21 Nov 2023 09:08:46 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
 by smtp.gmail.com with ESMTPSA id
 ka13-20020a170907990d00b009a9fbeb15f2sm5481360ejc.62.2023.11.21.09.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 09:08:46 -0800 (PST)
Message-ID: <d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
Date: Tue, 21 Nov 2023 18:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
 <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
 <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
 <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
 <20231121175531.085809f5@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231121175531.085809f5@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, wenst@chromium.org, kernel@collabora.com,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/11/2023 17:55, Boris Brezillon wrote:
> On Tue, 21 Nov 2023 17:11:42 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>> Il 21/11/23 16:34, Krzysztof Kozlowski ha scritto:
>>> On 08/11/2023 14:20, Steven Price wrote:  
>>>> On 02/11/2023 14:15, AngeloGioacchino Del Regno wrote:  
>>>>> The layout of the registers {TILER,SHADER,L2}_PWROFF_LO, used to request
>>>>> powering off cores, is the same as the {TILER,SHADER,L2}_PWRON_LO ones:
>>>>> this means that in order to request poweroff of cores, we are supposed
>>>>> to write a bitmask of cores that should be powered off!
>>>>> This means that the panfrost_gpu_power_off() function has always been
>>>>> doing nothing.
>>>>>
>>>>> Fix powering off the GPU by writing a bitmask of the cores to poweroff
>>>>> to the relevant PWROFF_LO registers and then check that the transition
>>>>> (from ON to OFF) has finished by polling the relevant PWRTRANS_LO
>>>>> registers.
>>>>>
>>>>> While at it, in order to avoid code duplication, move the core mask
>>>>> logic from panfrost_gpu_power_on() to a new panfrost_get_core_mask()
>>>>> function, used in both poweron and poweroff.
>>>>>
>>>>> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>  
>>>
>>>
>>> Hi,
>>>
>>> This commit was added to next recently but it causes "external abort on
>>> non-linefetch" during boot of my Odroid HC1 board.
>>>
>>> At least bisect points to it.
>>>
>>> If fixed, please add:
>>>
>>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> [    4.861683] 8<--- cut here ---
>>> [    4.863429] Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0c8802c
>>> [    4.871018] [f0c8802c] *pgd=433ed811, *pte=11800653, *ppte=11800453
>>> ...
>>> [    5.164010]  panfrost_gpu_irq_handler from __handle_irq_event_percpu+0xcc/0x31c
>>> [    5.171276]  __handle_irq_event_percpu from handle_irq_event+0x38/0x80
>>> [    5.177765]  handle_irq_event from handle_fasteoi_irq+0x9c/0x250
>>> [    5.183743]  handle_fasteoi_irq from generic_handle_domain_irq+0x28/0x38
>>> [    5.190417]  generic_handle_domain_irq from gic_handle_irq+0x88/0xa8
>>> [    5.196741]  gic_handle_irq from generic_handle_arch_irq+0x34/0x44
>>> [    5.202893]  generic_handle_arch_irq from __irq_svc+0x8c/0xd0
>>>
>>> Full log:
>>> https://krzk.eu/#/builders/21/builds/4392/steps/11/logs/serial0
>>>   
>>
>> Hey Krzysztof,
>>
>> This is interesting. It might be about the cores that are missing from the partial
>> core_mask raising interrupts, but an external abort on non-linefetch is strange to
>> see here.
> 
> I've seen such external aborts in the past, and the fault type has
> often been misleading. It's unlikely to have anything to do with a

Yeah, often accessing device with power or clocks gated.

> non-linefetch access, but it might be caused by a register access after
> the clock or power domain driving the register bank has been disabled.
> The following diff might help validate this theory. If that works, we
> probably want to make sure we synchronize IRQs before disabling in the
> suspend path.
> 
> --->8---
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index 55ec807550b3..98df66e5cc9b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -34,8 +34,6 @@
>           (GPU_IRQ_FAULT                        |\
>            GPU_IRQ_MULTIPLE_FAULT               |\
>            GPU_IRQ_RESET_COMPLETED              |\
> -          GPU_IRQ_POWER_CHANGED                |\
> -          GPU_IRQ_POWER_CHANGED_ALL            |\

This helped, at least for this issue (next-20231121). Much later in
user-space boot I have lockups:
watchdog: BUG: soft lockup - CPU#4 stuck for 26s! [kworker/4:1:61]

[   56.329224]  smp_call_function_single from
__sync_rcu_exp_select_node_cpus+0x29c/0x78c
[   56.337111]  __sync_rcu_exp_select_node_cpus from
sync_rcu_exp_select_cpus+0x334/0x878
[   56.344995]  sync_rcu_exp_select_cpus from wait_rcu_exp_gp+0xc/0x18
[   56.351231]  wait_rcu_exp_gp from process_one_work+0x20c/0x620
[   56.357038]  process_one_work from worker_thread+0x1d0/0x488
[   56.362668]  worker_thread from kthread+0x104/0x138
[   56.367521]  kthread from ret_from_fork+0x14/0x28

But anyway the external abort does not appear.

Best regards,
Krzysztof

