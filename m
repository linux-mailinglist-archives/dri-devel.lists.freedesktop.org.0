Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952BF7F9E88
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 12:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0CA10E245;
	Mon, 27 Nov 2023 11:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3340410E245
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:26:58 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 041DD66057B6;
 Mon, 27 Nov 2023 11:26:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701084416;
 bh=O3FAS936I5aIcUPU/jsyH/UCCj/iVZb8uQ5S19CyrdI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EDa3tqBMe4sdymOvzWlTPSZdVAEqyibUtjnBIWZdNz/xy3Kg8n1C3C3Iz69PII+v6
 KGWSyZd3C5wm4jQgP5qLw68990swAn27qF3aEPF+eiWZDdoTHB2KbsIii4zZu+bm12
 aAL2O4mLoP8HQuZ62U2rJ3nq56u6TxIbRALr6/R60F27eGTwr94dcfTpk3ClZAQcFw
 qn8GcrkTfr2jzCKRlXvVLH8KylTfF1pS/mk/s2lx44XKUb5927+Miy3xFUzJ32TFpu
 7+Qmb7ziPo5bi26qrCIpYtILPmA0zbBEMPVnwv9D5azOxHBP+TCF+tYKRRco2ul2z1
 U3Eb2oZ/eWXAw==
Message-ID: <ac36d1e2-36a4-473c-9acf-e0a1fc7d3bfb@collabora.com>
Date: Mon, 27 Nov 2023 12:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
 <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
 <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
 <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
 <20231121175531.085809f5@collabora.com>
 <d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
 <4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com>
 <CGME20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c@eucas1p2.samsung.com>
 <39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org>
 <37d373e1-8850-4ab2-8fdb-6b069e2d6976@samsung.com>
 <054f6a93-8911-40bb-b677-ccdfd27d132b@samsung.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <054f6a93-8911-40bb-b677-ccdfd27d132b@samsung.com>
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
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/11/23 12:24, Marek Szyprowski ha scritto:
> On 24.11.2023 13:45, Marek Szyprowski wrote:
>> On 22.11.2023 10:29, Krzysztof Kozlowski wrote:
>>> On 22/11/2023 10:06, AngeloGioacchino Del Regno wrote:
>>>>>>> Hey Krzysztof,
>>>>>>>
>>>>>>> This is interesting. It might be about the cores that are missing
>>>>>>> from the partial
>>>>>>> core_mask raising interrupts, but an external abort on
>>>>>>> non-linefetch is strange to
>>>>>>> see here.
>>>>>> I've seen such external aborts in the past, and the fault type has
>>>>>> often been misleading. It's unlikely to have anything to do with a
>>>>> Yeah, often accessing device with power or clocks gated.
>>>>>
>>>> Except my commit does *not* gate SoC power, nor SoC clocks 🙂
>>> It could be that something (like clocks or power supplies) was missing
>>> on this board/SoC, which was not critical till your patch came.
>>>
>>>> What the "Really power off ..." commit does is to ask the GPU to
>>>> internally power
>>>> off the shaders, tilers and L2, that's why I say that it is strange
>>>> to see that
>>>> kind of abort.
>>>>
>>>> The GPU_INT_CLEAR GPU_INT_STAT, GPU_FAULT_STATUS and
>>>> GPU_FAULT_ADDRESS_{HI/LO}
>>>> registers should still be accessible even with shaders, tilers and
>>>> cache OFF.
>>>>
>>>> Anyway, yes, synchronizing IRQs before calling the poweroff sequence
>>>> would also
>>>> work, but that'd add up quite a bit of latency on the
>>>> runtime_suspend() call, so
>>>> in this case I'd be more for avoiding to execute any register r/w in
>>>> the handler
>>>> by either checking if the GPU is supposed to be OFF, or clearing
>>>> interrupts, which
>>>> may not work if those are generated after the execution of the
>>>> poweroff function.
>>>> Or we could simply disable the irq after power_off, but that'd be
>>>> hacky (as well).
>>>>
>>>>
>>>> Let's see if asking to poweroff *everything* works:
>>> Worked.
>>
>> Yes, I also got into this issue some time ago, but I didn't report it
>> because I also had some power supply related problems on my test farm
>> and everything was a bit unstable. I wasn't 100% sure that the
>> $subject patch is responsible for the observed issues. Now, after
>> fixing power supply, I confirm that the issue was revealed by the
>> $subject patch and above mentioned change fixes the problem. Feel free
>> to add:
>>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> 
> I must revoke my tested-by tag for the above fix alone. Although it
> fixed the boot issue and system stability issue, it looks that there is
> still something missing and opening the panfrost dri device causes a
> system crash:
> 
> root@target:~# ./modetest -C
> trying to open device 'i915'...failed
> trying to open device 'amdgpu'...failed
> trying to open device 'radeon'...failed
> trying to open device 'nouveau'...failed
> trying to open device 'vmwgfx'...failed
> trying to open device 'omapdrm'...failed
> trying to open device 'exynos'...done
> root@target:~#
> 
> 8<--- cut here ---
> Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0c6803c
> [f0c6803c] *pgd=42d87811, *pte=11800653, *ppte=11800453
> Internal error: : 1008 [#1] PREEMPT SMP ARM
> Modules linked in: exynos_gsc s5p_mfc s5p_jpeg v4l2_mem2mem
> videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common
> videodev mc s5p_cec
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> 6.7.0-rc2-next-20231127-00055-ge14abcb527d6 #7649
> Hardware name: Samsung Exynos (Flattened Device Tree)
> PC is at panfrost_gpu_irq_handler+0x18/0xfc
> LR is at __handle_irq_event_percpu+0xcc/0x31c
> ...
> Process swapper/0 (pid: 0, stack limit = 0x0e2875ff)
> Stack: (0xc1301e48 to 0xc1302000)
> ...
>    panfrost_gpu_irq_handler from __handle_irq_event_percpu+0xcc/0x31c
>    __handle_irq_event_percpu from handle_irq_event+0x38/0x80
>    handle_irq_event from handle_fasteoi_irq+0x9c/0x250
>    handle_fasteoi_irq from generic_handle_domain_irq+0x24/0x34
>    generic_handle_domain_irq from gic_handle_irq+0x88/0xa8
>    gic_handle_irq from generic_handle_arch_irq+0x34/0x44
>    generic_handle_arch_irq from __irq_svc+0x8c/0xd0
> Exception stack(0xc1301f10 to 0xc1301f58)
> ...
>    __irq_svc from default_idle_call+0x20/0x2c4
>    default_idle_call from do_idle+0x244/0x2b4
>    do_idle from cpu_startup_entry+0x28/0x2c
>    cpu_startup_entry from rest_init+0xec/0x190
>    rest_init from arch_post_acpi_subsys_init+0x0/0x8
> Code: e591300c e593402c f57ff04f e591300c (e593903c)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Fatal exception in interrupt
> CPU2: stopping
> 
> 
> It looks that the panfrost interrupts must be somehow synchronized with
> turning power off, what has been already discussed. Let me know if you
> want me to test any patch.
> 

The new series containing the whole interrupts sync code is almost ready,
currently testing it on my machines here.

I should be able to send it between today and tomorrow.

Cheers,
Angelo

