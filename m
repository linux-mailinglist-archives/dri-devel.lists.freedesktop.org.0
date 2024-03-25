Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726388A0F7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973F110E896;
	Mon, 25 Mar 2024 13:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dV8t9WSv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10A110E896
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711372069;
 bh=U9O7+ZqD+2fD0l3G8D/pX/GvM4FGztjDRut/f5Cvyc4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dV8t9WSvWBKo1C1B67HZ5sd3Mg8kjoo9GpROBXVRYajSE/Vf9bFjeHtvRgaq3PHeR
 yV19mZbZrSkJx1/IHJ9Zs2AGcGICB9m8rCUWEUIDTgtWlkvHP39/fhGR8FqP+L9kFa
 WGH/kSUgAtq8Wt0Cd33tAk41LMDc2+dkiM1A+uGTwWmH6TgUViOIHAlCu2VIuA/Ifo
 WLrU+5hKJgcRjrPScruHtX9PSnVn1tCRpVRoNvErpmWc8Gng6MKoL4/QhmTFafKRGs
 etf6+9u4VWYxv7ITxn6mXbh2gUYp6wzAnPl1WtaUyOsLF/SQCGCCpHv6auFDgIk0eM
 XDnBdXTuNz7TA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D6451378209A;
 Mon, 25 Mar 2024 13:07:48 +0000 (UTC)
Message-ID: <8f815a5c-e891-468f-8e8a-1ad9cee7a36f@collabora.com>
Date: Mon, 25 Mar 2024 14:07:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: fix power transition timeout warnings
To: Christian Hewitt <christianshewitt@gmail.com>,
 Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
References: <20240322164525.2617508-1-christianshewitt@gmail.com>
 <bad16bba-5469-4f20-bf23-7f3c2953edc5@arm.com>
 <620A6EF4-4361-4B5F-889B-268091FB72D9@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <620A6EF4-4361-4B5F-889B-268091FB72D9@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 25/03/24 12:36, Christian Hewitt ha scritto:
>> On 25 Mar 2024, at 2:28 pm, Steven Price <steven.price@arm.com> wrote:
>>
>> On 22/03/2024 16:45, Christian Hewitt wrote:
>>> Increase the timeout value to prevent system logs on Amlogic boards flooding
>>> with power transition warnings:
>>>
>>> [   13.047638] panfrost ffe40000.gpu: shader power transition timeout
>>> [   13.048674] panfrost ffe40000.gpu: l2 power transition timeout
>>> [   13.937324] panfrost ffe40000.gpu: shader power transition timeout
>>> [   13.938351] panfrost ffe40000.gpu: l2 power transition timeout
>>> ...
>>> [39829.506904] panfrost ffe40000.gpu: shader power transition timeout
>>> [39829.507938] panfrost ffe40000.gpu: l2 power transition timeout
>>> [39949.508369] panfrost ffe40000.gpu: shader power transition timeout
>>> [39949.509405] panfrost ffe40000.gpu: l2 power transition timeout
>>>
>>> The 2000 value has been found through trial and error testing with devices
>>> using G52 and G31 GPUs.
>>
>> How close to 2ms did you need in your trial and error testing? I'm
>> wondering if we should increase it further in case this might still
>> trigger occasionally?
> 
> I backed it off progressively but still saw occasional messages at 1.6ms
> so padded it a little with 2ms, and those systems haven’t shown errors
> since so I currently see it as a ’safe’ value. The one possible wildcard
> is testing with older T820/T628 boards; but that needs to wait until I’m
> back home from a long trip and able to test them. The possible theory
> being that older/slower systems might require more time. Worst case I’ll
> have to send another change.
> 
>> kbase seems to have a 5s (5000ms!) timeout before it will actually
>> complain. But equally it doesn't busy wait on the registers in the same
>> way as panfrost, so the impact to the rest of the system of a long wait
>> is less.
>>
>> But 2ms doesn't sound an unreasonable timeout so:
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>>> Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
>>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>> ---
>>> drivers/gpu/drm/panfrost/panfrost_gpu.c | 6 +++---
>>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> index 9063ce254642..fd8e44992184 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> @@ -441,19 +441,19 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>>>
>>> gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
>>> ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
>>> -  val, !val, 1, 1000);
>>> +  val, !val, 1, 2000);
>>> if (ret)
>>> dev_err(pfdev->dev, "shader power transition timeout");
>>>
>>> gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
>>> ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
>>> -  val, !val, 1, 1000);
>>> +  val, !val, 1, 2000);
>>> if (ret)
>>> dev_err(pfdev->dev, "tiler power transition timeout");
>>
>> As Angelo points out the tiler probably doesn't need such a long
>> timeout, but I can't see the harm in consistency so I'm happy with this
>> change. If my memory of the hardware is correct then the tiler power off
>> actually does very little and so I wouldn't expect it to take very long.
> 
> I’ve seen tiler timeouts once I think and thus included it, but not since
> the values were increased. As long as it’s acceptable I won’t over-think
> it but if more testing is needed I can look at it more.
> 

Thanks for clarifying.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

