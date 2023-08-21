Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25584782DEE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 18:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9C010E282;
	Mon, 21 Aug 2023 16:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D044810E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 16:10:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EC102F4;
 Mon, 21 Aug 2023 09:10:48 -0700 (PDT)
Received: from [10.57.3.137] (unknown [10.57.3.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBC7F3F64C;
 Mon, 21 Aug 2023 09:10:05 -0700 (PDT)
Message-ID: <13815072-9403-0a9a-e6a8-d97fd727e2a0@arm.com>
Date: Mon, 21 Aug 2023 17:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 05/15] drm/panthor: Add the GPU logical block
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-6-boris.brezillon@collabora.com>
 <b1c4d260-93a5-d1f0-7f4b-4dcb444e7a24@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <b1c4d260-93a5-d1f0-7f4b-4dcb444e7a24@arm.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-14 11:54, Steven Price wrote:
[...]
>> +/**
>> + * panthor_gpu_l2_power_on() - Power-on the L2-cache
>> + * @ptdev: Device.
>> + *
>> + * Return: 0 on success, a negative error code otherwise.
>> + */
>> +int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
>> +{
>> +	u64 core_mask = U64_MAX;
>> +
>> +	if (ptdev->gpu_info.l2_present != 1) {
>> +		/*
>> +		 * Only support one core group now.
>> +		 * ~(l2_present - 1) unsets all bits in l2_present except
>> +		 * the bottom bit. (l2_present - 2) has all the bits in
>> +		 * the first core group set. AND them together to generate
>> +		 * a mask of cores in the first core group.
>> +		 */
>> +		core_mask = ~(ptdev->gpu_info.l2_present - 1) &
>> +			     (ptdev->gpu_info.l2_present - 2);
>> +		drm_info_once(&ptdev->base, "using only 1st core group (%lu cores from %lu)\n",
>> +			      hweight64(core_mask),
>> +			      hweight64(ptdev->gpu_info.shader_present));
> 
> I'm not sure what the point of this complexity is. This boils down to
> the equivalent of:
> 
> 	if (ptdev->gpu_info.l2_present != 1)
> 		core_mask = 1;

Hmm, that doesn't look right - the idiom here should be to set all bits 
of the output below the *second* set bit of the input, i.e. 0x11 -> 
0x0f. However since panthor is (somewhat ironically) unlikely to ever 
run on T628, and everything newer should pretend to have a single L2 
because software-managed coherency is a terrible idea, I would agree 
that ultimately it does all seem a bit pointless.

> If we were doing shader-core power management manually (like on pre-CSF
> GPUs, rather than letting the firmware control it) then the computed
> core_mask would be useful. So I guess it comes down to the
> drm_info_once() output and counting the cores - which is nice to have
> but it took me some time figuring out what was going on here.
As for the complexity, I'd suggest you can have some choice words with 
the guy who originally suggested that code[1] ;)

Cheers,
Robin.

[1] 
https://lore.kernel.org/dri-devel/b009b4c4-0396-58c2-7779-30c844f36f04@arm.com/
