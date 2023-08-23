Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B457852FE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B76F10E3FB;
	Wed, 23 Aug 2023 08:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8718610E3FA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 08:48:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 756F81042;
 Wed, 23 Aug 2023 01:49:02 -0700 (PDT)
Received: from [10.57.90.206] (unknown [10.57.90.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85F0A3F740;
 Wed, 23 Aug 2023 01:48:19 -0700 (PDT)
Message-ID: <b81f1ae0-68cc-f815-f1a1-98647c647950@arm.com>
Date: Wed, 23 Aug 2023 09:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/15] drm/panthor: Add the GPU logical block
To: Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-6-boris.brezillon@collabora.com>
 <b1c4d260-93a5-d1f0-7f4b-4dcb444e7a24@arm.com>
 <13815072-9403-0a9a-e6a8-d97fd727e2a0@arm.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <13815072-9403-0a9a-e6a8-d97fd727e2a0@arm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/08/2023 17:09, Robin Murphy wrote:
> On 2023-08-14 11:54, Steven Price wrote:
> [...]
>>> +/**
>>> + * panthor_gpu_l2_power_on() - Power-on the L2-cache
>>> + * @ptdev: Device.
>>> + *
>>> + * Return: 0 on success, a negative error code otherwise.
>>> + */
>>> +int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
>>> +{
>>> +    u64 core_mask = U64_MAX;
>>> +
>>> +    if (ptdev->gpu_info.l2_present != 1) {
>>> +        /*
>>> +         * Only support one core group now.
>>> +         * ~(l2_present - 1) unsets all bits in l2_present except
>>> +         * the bottom bit. (l2_present - 2) has all the bits in
>>> +         * the first core group set. AND them together to generate
>>> +         * a mask of cores in the first core group.
>>> +         */
>>> +        core_mask = ~(ptdev->gpu_info.l2_present - 1) &
>>> +                 (ptdev->gpu_info.l2_present - 2);
>>> +        drm_info_once(&ptdev->base, "using only 1st core group (%lu
>>> cores from %lu)\n",
>>> +                  hweight64(core_mask),
>>> +                  hweight64(ptdev->gpu_info.shader_present));
>>
>> I'm not sure what the point of this complexity is. This boils down to
>> the equivalent of:
>>
>>     if (ptdev->gpu_info.l2_present != 1)
>>         core_mask = 1;
> 
> Hmm, that doesn't look right - the idiom here should be to set all bits
> of the output below the *second* set bit of the input, i.e. 0x11 ->
> 0x0f. However since panthor is (somewhat ironically) unlikely to ever
> run on T628, and everything newer should pretend to have a single L2
> because software-managed coherency is a terrible idea, I would agree
> that ultimately it does all seem a bit pointless.

Sorry I should have been clearer here. Other than the message printed 
(using drm_info_once) the only use of core_mask in this function is in 
the call to panthor_gpu_power_on:

+	return panthor_gpu_power_on(ptdev, L2,
+				    ptdev->gpu_info.l2_present & core_mask,
+				    20000);

Here the core_mask variable is anded with l2_present. So using the value 
1 is equivalent to the actual core mask which is being calculated. 
Obviously '1' isn't likely to be the real core mask (it's an "L2 mask").

Mostly it just seemed odd to calculate the core_mask and then 
effectively throw the value away.

>> If we were doing shader-core power management manually (like on pre-CSF
>> GPUs, rather than letting the firmware control it) then the computed
>> core_mask would be useful. So I guess it comes down to the
>> drm_info_once() output and counting the cores - which is nice to have
>> but it took me some time figuring out what was going on here.
> As for the complexity, I'd suggest you can have some choice words with
> the guy who originally suggested that code[1] ;)

I do often have problems with the code that guy wrote ;)

Steve

> 
> Cheers,
> Robin.
> 
> [1]
> https://lore.kernel.org/dri-devel/b009b4c4-0396-58c2-7779-30c844f36f04@arm.com/

