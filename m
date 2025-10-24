Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C0C05638
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A4810E100;
	Fri, 24 Oct 2025 09:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4ECA210E100
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:43:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 038091516;
 Fri, 24 Oct 2025 02:43:05 -0700 (PDT)
Received: from [10.1.37.17] (e122027.cambridge.arm.com [10.1.37.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2AA83F63F;
 Fri, 24 Oct 2025 02:43:09 -0700 (PDT)
Message-ID: <e74ec0b1-4975-4fd5-bb1a-4839c45987f7@arm.com>
Date: Fri, 24 Oct 2025 10:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] drm/panthor: Implement L2 power on/off via
 PWR_CONTROL
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-7-karunika.choo@arm.com>
 <022e2ea5-74e3-4d53-9afe-8ead71853ee4@arm.com>
 <a9cd1999-12d9-41cf-aef6-a6c3f1f23e4c@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <a9cd1999-12d9-41cf-aef6-a6c3f1f23e4c@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/10/2025 23:16, Karunika Choo wrote:
> On 20/10/2025 11:50, Steven Price wrote:
>> On 14/10/2025 10:43, Karunika Choo wrote:
>>> This patch adds common helpers to issue power commands, poll
>>> transitions, and validate domain state, then wires them into the L2
>>> on/off paths.
>>>
>>> The L2 power-on sequence now delegates control of the SHADER and TILER
>>> domains to the MCU when allowed, while the L2 itself is never delegated.
>>> On power-off, dependent domains beneath the L2 are checked, and if
>>> necessary, retracted and powered down to maintain proper domain
>>> ordering.
>>>
>>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>>> ---
[...]
>>> +		u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(child_domain));
>>> +
>>> +		if (domain_ready && (pwr_status & PWR_STATUS_DOMAIN_DELEGATED(child_domain))) {
>>> +			drm_warn(&ptdev->base,
>>> +				 "L2 power off: Delegated %s domain not powered down by MCU",
>>> +				 get_domain_name(child_domain));
>>> +			ret = retract_domain(ptdev, child_domain);
>>> +			if (ret) {
>>> +				drm_err(&ptdev->base, "Failed to retract %s domain",
>>> +					get_domain_name(child_domain));
>>> +				panthor_pwr_info_show(ptdev);
>>> +				return ret;
>>> +			}
>>> +		}
>>> +
>>> +		ret = panthor_pwr_domain_power_off(ptdev, child_domain, domain_ready,
>>> +						   PWR_TRANSITION_TIMEOUT_US);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	return panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2,
>>> +					    ptdev->gpu_info.l2_present,
>>> +					    PWR_TRANSITION_TIMEOUT_US);
>>
>> Does this implicitly 'retract' the shader/tiler power domains? If so I
>> think it's worth a comment. Otherwise it looks like we don't actually
>> know the status of whether the shader/tiler power domains are retracted
>> or not.
>>
> 
> panthor_pwr_l2_power_off() will only retract the shader/tiler domains if
> they have not been powered down by the MCU. In cases where the MCU did
> power down these child domains, delegate_domain() will exit early as
> they would already be delegated. I understand the ambiguity here,
> hopefully it is somewhat acceptable.

So my question was really how does the driver know whether the domains
are delegated or not when this function returns?

I couldn't quite get my head around whether turning the L2 power domain
off would implicitly 'retract' the shader/tiler power domains -
obviously it forces them off which means the MCU doesn't have control.
So retracting would make sense, but I couldn't see anything in the spec.

It would be good to have a comment explaining what the expected state is
after this function (panthor_pwr_l2_power_off) returns. Is it unknown
whether the shader/tiler are retracted, or is there something in the
hardware which does this automatically so we know but don't have to
manually retract? Presumably if we end up fully powering down the GPU
that must effectively retract all domains (the GPU hardware is reset so
it goes back to reset conditions).

Sorry, it's a bit of a basic question but the spec is somewhat unhelpful
on this point! (Or at least I haven't found a relevant statement).

Thanks,
Steve

