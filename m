Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBAA7F5E8C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 12:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A8A10E721;
	Thu, 23 Nov 2023 11:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F8C10E721
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 11:58:22 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 77D6C660739C;
 Thu, 23 Nov 2023 11:58:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700740701;
 bh=NUR7NWmLJG7x3qkoi7nPz/LMqTSzR6NXYNSINLPbFko=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LIjrCro2/jqzussd+3G5b/ksbF+N7x0hbAl/xffwiaEBVWI4oNSOStDCEdvIwSr0N
 PSb8YNLyCgeYEsow8ZZ4cox4a8m7dk/pYduxd+msa7nLDyxEEVe6zSj3CmVAyP0GjO
 G/W1HNhEsX5aUkQD8HRB8z781UdIA+xotevHOkJ4yvW4yLUKUQxFBqxdUfTR0eZnw9
 cRyOTvP5+4rHFXR0M0XxX3JMcqOtfAUZ7ki5ttq+/o1tkTn5yl8ueIRLVet5/qcA7b
 /71XSIATnecHQW1iLGQryC+UedZ6imRZD7BX5MUsfRH9+WFiGS/sZW2Er7LIHQH+mb
 GIcVRCzUwovvA==
Message-ID: <3eef79bd-d271-4916-b3f0-220a5ce984ba@collabora.com>
Date: Thu, 23 Nov 2023 12:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, steven.price@arm.com
References: <20231123115029.68422-1-angelogioacchino.delregno@collabora.com>
 <2bd59614-49d8-4829-861e-3b95c44008df@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2bd59614-49d8-4829-861e-3b95c44008df@linaro.org>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org,
 boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/11/23 12:57, Krzysztof Kozlowski ha scritto:
> On 23/11/2023 12:50, AngeloGioacchino Del Regno wrote:
>> Some SoCs may be equipped with a GPU containing two core groups
>> and this is exactly the case of Samsung's Exynos 5422 featuring
>> an ARM Mali-T628 MP6 GPU: the support for this GPU in Panfrost
>> is partial, as this driver currently supports using only one
>> core group and that's reflected on all parts of it, including
>> the power on (and power off, previously to this patch) function.
>>
>> The issue with this is that even though executing the soft reset
>> operation should power off all cores unconditionally, on at least
>> one platform we're seeing a crash that seems to be happening due
>> to an interrupt firing which may be because we are calling power
>> transition only on the first core group, leaving the second one
>> unchanged, or because ISR execution was pending before entering
>> the panfrost_gpu_power_off() function and executed after powering
>> off the GPU cores, or all of the above.
>>
>> Finally, solve this by introducing a new panfrost_gpu_suspend_irq()
>> helper function and changing the panfrost_device_suspend() flow to
>>   1. Mask and clear all interrupts: we don't need nor want any, as
>>      for power_off() we are polling PWRTRANS, but we anyway don't
>>      want GPU IRQs to fire while it is suspended/powered off;
>>   2. Call synchronize_irq() after that to make sure that any pending
>>      ISR is executed before powering off the GPU Shaders/Tilers/L2
>>      hence avoiding unpowered registers R/W; and
>>   3. Ignore the core_mask and ask the GPU to poweroff both core groups
>>
>> Of course it was also necessary to add a `irq` variable to `struct
>> panfrost_device` as we need to get that in panfrost_gpu_power_off()
>> for calling synchronize_irq() on it.
>>
>> Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
>> [Regression detected on Odroid HC1, Exynos5422, Mali-T628 MP6]
>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>
>> Changes in v2:
>>   - Fixed the commit hash of "Really power off [...]"
>>   - Actually based on a clean next-20231121
>>   - Renamed "irq" to "gpu_irq" as per Boris' suggestion
>>   - Moved the IRQ mask/clear/sync to a helper function and added
>>     a call to that in panfrost_device.c instead of doing that in
>>     panfrost_gpu_power_off().
>>
>> NOTE: I didn't split 1+2 from 3 as suggested by Boris, and I'm sending
>> this one without waiting for feedback on my reasons for that which I
>> explained as a reply to v1 because the former couldn't be applied to
>> linux-next, and I want to unblock Krzysztof ASAP to get this tested.
>>
> 
> This does not compile.
> 

I really have to take a break. My brain starts failing, as I can see.

Sorry.

