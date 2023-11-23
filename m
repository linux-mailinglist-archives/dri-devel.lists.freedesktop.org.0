Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4C7F5CA7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 11:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2B510E717;
	Thu, 23 Nov 2023 10:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BEF10E717
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 10:40:57 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D29CA6607393;
 Thu, 23 Nov 2023 10:40:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700736056;
 bh=BDmKas5cPwR4Yq39roh28T7ujEshS9pIFSvpdiu1j5A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j8/i6cTGs40hZw1mUC6nyZCcUjNs3TZ8Z1yVp26kZkXkl2lvysTR+sLdXnJo2UBsE
 OFFnOuzSV3fSZR5SxMw1kvQ2k+cHOFhf4uml5dC6O8dCmgfhF4SuVk+BwheotRJeLu
 vgzeB9V9TjrkRzklzLEILcsP7Ci/yRf9PZjtBGhAZPUiZsiccc8F65BrQVdhr1iRez
 52NwPNBAqzmye4yvprokvYgmMHog4g8sk00N7UYXnGCHdPj/V6HpOdDN2zMpmUttTt
 kpRDRzPjy/91qrnre3n8yG3ddckf7TJX/VWT29QhnL2zEZMbZwUUOVndafkb6Mx7HZ
 oC9XZ5IYMqVeA==
Message-ID: <f6abdc0e-400b-42dd-b685-73227fc0ee12@collabora.com>
Date: Thu, 23 Nov 2023 11:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, steven.price@arm.com
References: <20231123095320.41433-1-angelogioacchino.delregno@collabora.com>
 <a881a1ca-8e10-4e07-ada5-7fef30c26470@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a881a1ca-8e10-4e07-ada5-7fef30c26470@linaro.org>
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
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/11/23 11:39, Krzysztof Kozlowski ha scritto:
> On 23/11/2023 10:53, AngeloGioacchino Del Regno wrote:
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
> 
> Does not apply - I tried next 20231117/21/22/23.
> 

Sorry about that, I'll send a v2 soon.

Thanks,
Angelo

> Best regards,
> Krzysztof
> 
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com


