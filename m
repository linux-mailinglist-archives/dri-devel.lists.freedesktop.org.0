Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6A6C4534
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AF510E355;
	Wed, 22 Mar 2023 08:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1E010E355;
 Wed, 22 Mar 2023 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679474414; x=1711010414;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Yosr35sxGE6pHCxLgw1tS2Bcs6vWi+uYN8nvj+6PqTo=;
 b=K/89y3qY3i0GjlA4mFRZomceFdgyi+YjJXOZayC6LuegAxJX76HvQUUS
 BYfKJU/9IwIXrVnDRKu+gYmKTSQTW/Jb3/mTvlBg/7jyaDZCldSk9irid
 7h0PfK8ChHdvl91k66B8TK9sP8zKXl6hLQ/4c03AIOplvpNAkLiSd/F2r
 gM4fdBgjqbOM7DCXuXjExWDVF7gi2JE5RRXzus163KphslsjBLjNfAVpW
 oC5wY7+/V7ZrtURTkhtjjlxpgQL6qQ59QXuyNgkeQSNb55KKxQMnn3Cfn
 WJl7kgPkmHct+8yX6X6V3YVFy2ThOtMB00sBK8iTTk7tI2uNJxYDXmenc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="404042945"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="404042945"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 01:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="712135961"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="712135961"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.22.233])
 ([10.213.22.233])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 01:40:09 -0700
Message-ID: <9fff7768-ea75-23d0-f504-03bc54788561@intel.com>
Date: Wed, 22 Mar 2023 09:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915: Sanitycheck MMIO access
 early in driver load
To: Andi Shyti <andi.shyti@kernel.org>, Matt Roper <matthew.d.roper@intel.com>
References: <20230321170936.478631-1-andi.shyti@linux.intel.com>
 <20230321170936.478631-2-andi.shyti@linux.intel.com>
 <20230321215527.GQ4085390@mdroper-desk1.amr.corp.intel.com>
 <20230321224353.h6l2gwv3iuac6vd2@intel.intel>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230321224353.h6l2gwv3iuac6vd2@intel.intel>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.03.2023 23:43, Andi Shyti wrote:
> Hi Matt,
> 
>>> We occasionally see the PCI device in a non-accessible state at the
>>> point the driver is loaded.  When this happens, all BAR accesses will
>>> read back as 0xFFFFFFFF.  Rather than reading registers and
>>> misinterpreting their (invalid) values, let's specifically check for
>>> 0xFFFFFFFF in a register that cannot have that value to see if the
>>> device is accessible.
>>>
>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/intel_uncore.c | 35 +++++++++++++++++++++++++++++
>>>   1 file changed, 35 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
>>> index e1e1f34490c8e..0b69081d6d285 100644
>>> --- a/drivers/gpu/drm/i915/intel_uncore.c
>>> +++ b/drivers/gpu/drm/i915/intel_uncore.c
>>> @@ -2602,11 +2602,46 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
>>>   	return 0;
>>>   }
>>>   
>>> +static int sanity_check_mmio_access(struct intel_uncore *uncore)
>>> +{
>>> +	struct drm_i915_private *i915 = uncore->i915;
>>> +	int ret;
>>> +
>>> +	if (GRAPHICS_VER(i915) < 8)
>>> +		return 0;
>>> +
>>> +	/*
>>> +	 * Sanitycheck that MMIO access to the device is working properly.  If
>>> +	 * the CPU is unable to communcate with a PCI device, BAR reads will
>>> +	 * return 0xFFFFFFFF.  Let's make sure the device isn't in this state
>>> +	 * before we start trying to access registers.
>>> +	 *
>>> +	 * We use the primary GT's forcewake register as our guinea pig since
>>> +	 * it's been around since HSW and it's a masked register so the upper
>>> +	 * 16 bits can never read back as 1's if device access is operating
>>> +	 * properly.


Maybe we can just check upper 16bits then. Sth like:
ret = intel_wait_for_register_fw(uncore, FORCEWAKE_MT, GENMASK(31, 16), 
0, 2000000);

Regards
Andrzej

>>> +	 *
>>> +	 * If MMIO isn't working, we'll wait up to 2 seconds to see if it
>>> +	 * recovers, then give up.
>>> +	 */
>>> +	ret = intel_wait_for_register_fw(uncore, FORCEWAKE_MT, 0, 0, 2000000);
>>
>> It looks like you lost the check for 0xFFFFFFFF specifically.  In fact
>> with a mask/value of 0, isn't this always going to just always pass
>> immediately?
> 
> uh... yes... sorry, I just got confused and lost track of the
> goal of the patch.
> 
> Sorry, then please ignore... I don't see then how
> intel_wait_for_register_fw() can be used with a '!='.
> 
> Please, ignore this v2.
> 
> Thanks and sorry, again,
> Andi
> 
>> We don't know what the value of this register will be (there may or may
>> not be some bits set), but we need to make sure that it isn't 0xFFFFFFFF
>> because that means we're not even truly accessing the register, just
>> hitting a PCI BAR read failure.
>>
>>
>> Matt
>>
>>> +	if (ret == -ETIMEDOUT) {
>>> +		drm_err(&i915->drm, "Device is non-operational; MMIO access returns 0xFFFFFFFF!\n");
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>   int intel_uncore_init_mmio(struct intel_uncore *uncore)
>>>   {
>>>   	struct drm_i915_private *i915 = uncore->i915;
>>>   	int ret;
>>>   
>>> +	ret = sanity_check_mmio_access(uncore);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>   	/*
>>>   	 * The boot firmware initializes local memory and assesses its health.
>>>   	 * If memory training fails, the punit will have been instructed to
>>> -- 
>>> 2.39.2
>>>
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation

