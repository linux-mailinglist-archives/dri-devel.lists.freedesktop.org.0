Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F017F3352
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 17:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA7610E502;
	Tue, 21 Nov 2023 16:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1DD10E502
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 16:11:47 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 735D16607325;
 Tue, 21 Nov 2023 16:11:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700583106;
 bh=GxIVE1tU4kysthfZEaW7+CMMGUoCzHenFFVWHpjOR5o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fsHS24tXweaBckKKdHR1EnLzt8TlBejWUh9DHXG2QiRQ//Rl64ecSsw/rCxqTJx8o
 dpAQNDsOhWBkv3WZp0Q/VcsKZkCl4JbwKZ4CbKHI0APscxbH0Kz7gzlUk6PaYmTwdp
 YKjCUWloG7fF84/x44mpJ0iPVnRuHtWOy3P0UE7n+3aK2kz4u+yZ4GP3NvIj5TcVao
 ZwaUsKdoW4TZsX5TmKMQB8LRPWq1QEHJYlVYU8jBYAu+LzVwc965KbWdyVArc17YQX
 pXZSL1zQANTNbAPRt5R7vBB1RQkO4uUIrXRzwATMUlyyWgdVwrXCjDw5FytYRFd/74
 31HQLrprMGufA==
Message-ID: <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
Date: Tue, 21 Nov 2023 17:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
 <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
 <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, wenst@chromium.org,
 kernel@collabora.com, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 21/11/23 16:34, Krzysztof Kozlowski ha scritto:
> On 08/11/2023 14:20, Steven Price wrote:
>> On 02/11/2023 14:15, AngeloGioacchino Del Regno wrote:
>>> The layout of the registers {TILER,SHADER,L2}_PWROFF_LO, used to request
>>> powering off cores, is the same as the {TILER,SHADER,L2}_PWRON_LO ones:
>>> this means that in order to request poweroff of cores, we are supposed
>>> to write a bitmask of cores that should be powered off!
>>> This means that the panfrost_gpu_power_off() function has always been
>>> doing nothing.
>>>
>>> Fix powering off the GPU by writing a bitmask of the cores to poweroff
>>> to the relevant PWROFF_LO registers and then check that the transition
>>> (from ON to OFF) has finished by polling the relevant PWRTRANS_LO
>>> registers.
>>>
>>> While at it, in order to avoid code duplication, move the core mask
>>> logic from panfrost_gpu_power_on() to a new panfrost_get_core_mask()
>>> function, used in both poweron and poweroff.
>>>
>>> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 
> Hi,
> 
> This commit was added to next recently but it causes "external abort on
> non-linefetch" during boot of my Odroid HC1 board.
> 
> At least bisect points to it.
> 
> If fixed, please add:
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [    4.861683] 8<--- cut here ---
> [    4.863429] Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0c8802c
> [    4.871018] [f0c8802c] *pgd=433ed811, *pte=11800653, *ppte=11800453
> ...
> [    5.164010]  panfrost_gpu_irq_handler from __handle_irq_event_percpu+0xcc/0x31c
> [    5.171276]  __handle_irq_event_percpu from handle_irq_event+0x38/0x80
> [    5.177765]  handle_irq_event from handle_fasteoi_irq+0x9c/0x250
> [    5.183743]  handle_fasteoi_irq from generic_handle_domain_irq+0x28/0x38
> [    5.190417]  generic_handle_domain_irq from gic_handle_irq+0x88/0xa8
> [    5.196741]  gic_handle_irq from generic_handle_arch_irq+0x34/0x44
> [    5.202893]  generic_handle_arch_irq from __irq_svc+0x8c/0xd0
> 
> Full log:
> https://krzk.eu/#/builders/21/builds/4392/steps/11/logs/serial0
> 

Hey Krzysztof,

This is interesting. It might be about the cores that are missing from the partial
core_mask raising interrupts, but an external abort on non-linefetch is strange to
see here.

Would you be available for some tests?

I'm thinking to call power_off on all cores (all shaders, all tilers, all l2s),
regardless of what panfrost_get_core_mask() says, as it could be that your GPU
powers on the cores that are unused by Panfrost by default, and that then we never
turn them off, escalating to this issue.

If you can please please please test:

void panfrost_gpu_power_off(struct panfrost_device *pfdev)
{
	u64 core_mask = panfrost_get_core_mask(pfdev);
	int ret;
	u32 val;

	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
	gpu_write(pfdev, SHADER_PWROFF_HI, pfdev->features.shader_present >> 32);
	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
					 val, !val, 1, 1000);
	if (ret)
		dev_err(pfdev->dev, "shader power transition timeout");

	gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
	gpu_write(pfdev, TILER_PWROFF_HI, pfdev->features.tiler_present >> 32);
	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
					 val, !val, 1, 1000);
	if (ret)
		dev_err(pfdev->dev, "tiler power transition timeout");

	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
					 val, !val, 0, 1000);
	if (ret)
		dev_err(pfdev->dev, "l2 power transition timeout");

	gpu_write(pfdev, L2_PWROFF_HI, pfdev->features.l2_present >> 32);
	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_HI,
					 val, !val, 0, 1000);
	if (ret)
		dev_err(pfdev->dev, "l2 power transition timeout");
}


This is a quick hack that might work. If this does actually work, the real fix
will be to PWROFF the extra cores only once, at panfrost_gpu_init() time, before
calling panfrost_gpu_power_on(), and to leave them disabled forever (until Panfrost
actually gets to support those extra cores for real).

Thanks,
Angelo

> 1. exynos_defconfig
> 2. HW: Odroid HC1
>     ARMv7, octa-core (Cortex-A7+A15), Exynos5422 SoC
>     arm,mali-t628
>     
> Bisect log:
> 
> git bisect start
> # bad: [07b677953b9dca02928be323e2db853511305fa9] Add linux-next specific files for 20231121
> git bisect bad 07b677953b9dca02928be323e2db853511305fa9
> # good: [98b1cc82c4affc16f5598d4fa14b1858671b2263] Linux 6.7-rc2
> git bisect good 98b1cc82c4affc16f5598d4fa14b1858671b2263
> # good: [13e2401d5bdc7f5a30f2651c99f0e3374cdda815] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
> git bisect good 13e2401d5bdc7f5a30f2651c99f0e3374cdda815
> # bad: [3b586cd6d8e51c428675312e7c3f634eb96337e9] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git
> git bisect bad 3b586cd6d8e51c428675312e7c3f634eb96337e9
> # bad: [9d63fd5f05248c78d9a66ce5dbc9cf5649054848] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
> git bisect bad 9d63fd5f05248c78d9a66ce5dbc9cf5649054848
> # bad: [5dea0c3fedee65413271a5700e653eff633e9a7f] drm/panel-elida-kd35t133: Drop shutdown logic
> git bisect bad 5dea0c3fedee65413271a5700e653eff633e9a7f
> # good: [48d45fac3940347becd290b96b2fc6d5ad8171f7] accel/ivpu: Remove support for uncached buffers
> git bisect good 48d45fac3940347becd290b96b2fc6d5ad8171f7
> # bad: [809ef191ee600e8bcbe2f8a769e00d2d54c16094] drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
> git bisect bad 809ef191ee600e8bcbe2f8a769e00d2d54c16094
> # good: [a78422e9dff366b3a46ae44caf6ec8ded9c9fc2f] drm/sched: implement dynamic job-flow control
> git bisect good a78422e9dff366b3a46ae44caf6ec8ded9c9fc2f
> # bad: [e4178256094a76cc36d9b9aabe7482615959b26f] drm/virtio: use uint64_t more in virtio_gpu_context_init_ioctl
> git bisect bad e4178256094a76cc36d9b9aabe7482615959b26f
> # bad: [56e76c0179185568049913257c18069293f8bde9] drm/panfrost: Implement ability to turn on/off GPU clocks in suspend
> git bisect bad 56e76c0179185568049913257c18069293f8bde9
> # bad: [57d4e26717b030fd794df3534e6b2e806eb761e4] drm/panfrost: Perform hard reset to recover GPU if soft reset fails
> git bisect bad 57d4e26717b030fd794df3534e6b2e806eb761e4
> # bad: [22aa1a209018dc2eca78745f7666db63637cd5dc] drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()
> git bisect bad 22aa1a209018dc2eca78745f7666db63637cd5dc
> # first bad commit: [22aa1a209018dc2eca78745f7666db63637cd5dc] drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()
>    
> 
> Best regards,
> Krzysztof
> 

