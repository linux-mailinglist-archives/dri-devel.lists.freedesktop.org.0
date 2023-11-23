Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B65A7F5F43
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 13:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D1910E72E;
	Thu, 23 Nov 2023 12:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C98B10E72E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 12:44:26 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 83BF466073A7;
 Thu, 23 Nov 2023 12:44:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700743465;
 bh=Pa2QYm+OXYCOPTslAZUn4HsfAc4k7tJU3XsjaVT4JPc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EX6uzfvDoId7KXRQaSrHdrUbXnRiWHfYVw5oWBrtXUU3zNsXXuOVreG9Hk2HcDl/K
 UL47SRyDKfTJv4vVeaXxYkV65hrp4fKpiBmKijQkkjnOpkHzUyZ7zcqsA/52BphINu
 cxBCFPwy6RnLsscPIWWN+SThoVmQ6u0axpDC0mgvDjMpe2gUYAfpGxvOG7UlQJW5Pj
 dVvFEGCvSwQm6E+mLcYm598BjSt3SXhC36DhjQ6Qg36hw/kWD1YFJrQXmVoDIb5xWy
 3tpieb94QpIic/dRpX6d2Tm9VezflMFY463Se/F/KJp3oFozuho8iXbvtxjmrbsru/
 muTnB+qzoYMeQ==
Message-ID: <140cff33-3421-4d78-9d58-83de5eec4dce@collabora.com>
Date: Thu, 23 Nov 2023 13:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, steven.price@arm.com
References: <20231123120521.147695-1-angelogioacchino.delregno@collabora.com>
 <5b24cc73-23aa-4837-abb9-b6d138b46426@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5b24cc73-23aa-4837-abb9-b6d138b46426@linaro.org>
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

Il 23/11/23 13:43, Krzysztof Kozlowski ha scritto:
> On 23/11/2023 13:05, AngeloGioacchino Del Regno wrote:
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
> 
> 
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Thank you for the test and, more importantly, for your patience.

Cheers,
Angelo

> Best regards,
> Krzysztof
> 


