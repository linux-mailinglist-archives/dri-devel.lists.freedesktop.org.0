Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C05C7F43A2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 11:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CB510E06A;
	Wed, 22 Nov 2023 10:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC9710E06A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 10:23:10 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 72CFC660737B;
 Wed, 22 Nov 2023 10:23:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700648589;
 bh=ZOloRXT8TmaeWv8g6UEHGcaeuRiJMBaIUzIimZz8+Zk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X62bx65yUFSlXUR+OtecLn/nJCU+rym9ApdgXPY+P8xRJmnmD+5vTG/sxZS+I2fqZ
 wYxV3JFavBqb2+vDqXEvZF7tkchAUuWT6D5SpE+6fwDCGlNrhcqHlCwdMt9Rfzr+4b
 rM7lfu0nIkVTgrfsQ4D1iuh8wiJNX7lMf871aCIlDfBwyM8+ywN1ve5ARnTGxyOolJ
 hiNYwZ14mDFsIabJm82PyCO2D953CAizuBlqm+76tIts9SSOhkvlvOt+WSSsiCZQQn
 U4OBcvInTLuwFT2LigPVzBuGUSiz7ie0MK8QS/6QYIObLgQZityGkk7EjauUdK1lcW
 DyzNG9tW7TODw==
Message-ID: <ecea3676-5dc6-4633-9373-931cdb582190@collabora.com>
Date: Wed, 22 Nov 2023 11:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
 <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
 <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
 <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
 <20231121175531.085809f5@collabora.com>
 <d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
 <4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com>
 <20231122105419.69724739@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231122105419.69724739@collabora.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 Steven Price <steven.price@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, wenst@chromium.org,
 kernel@collabora.com, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/11/23 10:54, Boris Brezillon ha scritto:
> Hi Angelo,
> 
> On Wed, 22 Nov 2023 10:06:19 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>> Il 21/11/23 18:08, Krzysztof Kozlowski ha scritto:
>>> On 21/11/2023 17:55, Boris Brezillon wrote:
>>>> On Tue, 21 Nov 2023 17:11:42 +0100
>>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> wrote:
>>>>   
>>>>> Il 21/11/23 16:34, Krzysztof Kozlowski ha scritto:
>>>>>> On 08/11/2023 14:20, Steven Price wrote:
>>>>>>> On 02/11/2023 14:15, AngeloGioacchino Del Regno wrote:
>>>>>>>> The layout of the registers {TILER,SHADER,L2}_PWROFF_LO, used to request
>>>>>>>> powering off cores, is the same as the {TILER,SHADER,L2}_PWRON_LO ones:
>>>>>>>> this means that in order to request poweroff of cores, we are supposed
>>>>>>>> to write a bitmask of cores that should be powered off!
>>>>>>>> This means that the panfrost_gpu_power_off() function has always been
>>>>>>>> doing nothing.
>>>>>>>>
>>>>>>>> Fix powering off the GPU by writing a bitmask of the cores to poweroff
>>>>>>>> to the relevant PWROFF_LO registers and then check that the transition
>>>>>>>> (from ON to OFF) has finished by polling the relevant PWRTRANS_LO
>>>>>>>> registers.
>>>>>>>>
>>>>>>>> While at it, in order to avoid code duplication, move the core mask
>>>>>>>> logic from panfrost_gpu_power_on() to a new panfrost_get_core_mask()
>>>>>>>> function, used in both poweron and poweroff.
>>>>>>>>
>>>>>>>> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
>>>>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>>>
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> This commit was added to next recently but it causes "external abort on
>>>>>> non-linefetch" during boot of my Odroid HC1 board.
>>>>>>
>>>>>> At least bisect points to it.
>>>>>>
>>>>>> If fixed, please add:
>>>>>>
>>>>>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>
>>>>>> [    4.861683] 8<--- cut here ---
>>>>>> [    4.863429] Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0c8802c
>>>>>> [    4.871018] [f0c8802c] *pgd=433ed811, *pte=11800653, *ppte=11800453
>>>>>> ...
>>>>>> [    5.164010]  panfrost_gpu_irq_handler from __handle_irq_event_percpu+0xcc/0x31c
>>>>>> [    5.171276]  __handle_irq_event_percpu from handle_irq_event+0x38/0x80
>>>>>> [    5.177765]  handle_irq_event from handle_fasteoi_irq+0x9c/0x250
>>>>>> [    5.183743]  handle_fasteoi_irq from generic_handle_domain_irq+0x28/0x38
>>>>>> [    5.190417]  generic_handle_domain_irq from gic_handle_irq+0x88/0xa8
>>>>>> [    5.196741]  gic_handle_irq from generic_handle_arch_irq+0x34/0x44
>>>>>> [    5.202893]  generic_handle_arch_irq from __irq_svc+0x8c/0xd0
>>>>>>
>>>>>> Full log:
>>>>>> https://krzk.eu/#/builders/21/builds/4392/steps/11/logs/serial0
>>>>>>       
>>>>>
>>>>> Hey Krzysztof,
>>>>>
>>>>> This is interesting. It might be about the cores that are missing from the partial
>>>>> core_mask raising interrupts, but an external abort on non-linefetch is strange to
>>>>> see here.
>>>>
>>>> I've seen such external aborts in the past, and the fault type has
>>>> often been misleading. It's unlikely to have anything to do with a
>>>
>>> Yeah, often accessing device with power or clocks gated.
>>>    
>>
>> Except my commit does *not* gate SoC power, nor SoC clocks 🙂
> 
> It's not directly related to your commit, it's just a side effect.
> 

Indeed!

>>
>> What the "Really power off ..." commit does is to ask the GPU to internally power
>> off the shaders, tilers and L2, that's why I say that it is strange to see that
>> kind of abort.
>>
>> The GPU_INT_CLEAR GPU_INT_STAT, GPU_FAULT_STATUS and GPU_FAULT_ADDRESS_{HI/LO}
>> registers should still be accessible even with shaders, tilers and cache OFF.
> 
> It's not the power_off() call that's problematic, it's when it happens
> (the last thing called in panfrost_device_runtime_suspend()), and the
> fact it generates interrupts. Yes, you don't explicitly gate the clocks
> in panfrost_device_runtime_suspend(), but the PM layer does interact
> directly with power domains, and shutting down a power domain might
> result in other clks/components being gated, which might make the
> register bank inaccessible from the CPU.
> 
>>
>> Anyway, yes, synchronizing IRQs before calling the poweroff sequence would also
>> work, but that'd add up quite a bit of latency on the runtime_suspend() call,
> 
> Really? In practice I'd expect no pending interrupts, other than the
> power transition ones, which are purely and simply ignored by the
> handler. If we had any other pending interrupts on suspend, we would
> have faced this problem before. To sum-up, I'd expect the extra latency
> to just be the overhead of the synchronize_irq() call, which, after
> looking at the code, shouldn't be such a big deal.
> 
>> so
>> in this case I'd be more for avoiding to execute any register r/w in the handler
>> by either checking if the GPU is supposed to be OFF,
> 
> Yes, that's an option, but I don't think that's enough (see below).
> 
>> or clearing interrupts,
> 
> The handler might have been called already when you clear the
> interrupt, and you'd still need to make sure the handler has returned
> before returning from panfrost_device_runtime_suspend() if you want to
> guarantee no one is touching the registers when the power domains are
> shutdown.
> 
>> which
>> may not work if those are generated after the execution of the poweroff function.
> 
> They are generated while you poll the register, but that doesn't
> guarantee they will be processed by the time you return from your
> power_off() function, which I think is exactly the problem we're facing
> here.
> 
>> Or we could simply disable the irq after power_off, but that'd be hacky (as well).
> 
> If by disabling the interrupt you mean calling disable_irq(), that
> would work if the irq lines were not declared as shared (IRQF_SHARED
> flag passed at request time). Beside, the latency of disable_irq()
> should be pretty much the same as synchronize_irq(), given
> synchronize_irq() from there.
> 
> If by disabling the interrupt, you mean masking it with _INT_MASK,
> then, as said above, that's not enough. You need to make sure any
> handler that may have been called as a result of this interrupt,
> returns before you return from the suspend function, so you need some
> kind of synchronization.
> 

Your reasons are totally valid and I see the point.

That's what I'll do as a follow-up Fixes patch:
  - gpu_write(pfdev, GPU_INT_MASK, 0);
  - gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
  - synchronize_irq()
  - poweroff *all* shaders/tilers/l2 (without caring about core_mask)
  - *No* INT_MASK restore, as we rely on soft_reset() to do that for us
    once we resume the GPU.


>>
>>
>> Let's see if asking to poweroff *everything* works:
> 
> It might slightly change the timing, making this problem disappear by
> chance (if the interrupt gets processed before power_off() returns),
> but it doesn't make the suspend logic more robust. We really have to
> guarantee that no one will touch the registers when we enter suspend,
> be it some interrupt handler, or any kind of deferred work.
> 
> Again, none of this is a direct result of your patch, it's just that
> your patch uncovered the problem, and I think now is a good time to fix
> it properly.
> 

Yes, I am well aware of that and I was trying to make that clear in the first
place - I'm sorry if I gave the impression of having any kind of doubt around
that, or any other.

Cheers!
Angelo

