Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0253A642FD6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 19:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FB310E116;
	Mon,  5 Dec 2022 18:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F1B10E298;
 Mon,  5 Dec 2022 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670264605; x=1701800605;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DbbBPIj9Js7PRkPymfC7swT3Mg4Cj0w4IAFHSjOL0XU=;
 b=GEoZMs9G7gq9KJI1sy3l/oAxc0D2OwIydRsowYaJIdMiFJfz1FmhFZq1
 G7SMh1GAmMQ8vATIT1zGDwMJ0yenI8VwbChnCFJYTcAZZkh8ozG13Xx0q
 IeJ39uGCywPLDIDJOBC6vNFcxmq30Sk2AEkhS/Ip3ys00o7Qkl8qIbK3m
 FZ0SlkRQmYNw5DOTmgJaxItCP0YrKHQPzofU4MdvAFEw+0ZNdd6BkoUHi
 d+FqS9zxJsUPwKvLhOv/Drp3sN/KrVFpUD/xO++jtNBgTTZSWC/4HpVDM
 n18AZqU2iISxnIEinX5NNZoHuNodfF6VRNrOoxCKNo1mfQQxYCbvbU98d Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="304045782"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="304045782"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 10:23:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="788180372"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="788180372"
Received: from naumanha-mobl.ger.corp.intel.com (HELO [10.213.231.131])
 ([10.213.231.131])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 10:23:23 -0800
Message-ID: <b36f1b4a-6cfa-c307-fb3a-da32c6b8aa9f@linux.intel.com>
Date: Mon, 5 Dec 2022 18:23:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Check full IP version when
 applying hw steering semaphore
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221202223528.714491-1-matthew.d.roper@intel.com>
 <Y4qA760HHNU2b7RJ@intel.com>
 <9d3d31bb-039b-651f-9788-100252f53a00@linux.intel.com>
 <Y44b+z88C3HXHR7e@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y44b+z88C3HXHR7e@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/12/2022 16:27, Matt Roper wrote:
> On Mon, Dec 05, 2022 at 12:50:40PM +0000, Tvrtko Ursulin wrote:
>>
>> On 02/12/2022 22:49, Rodrigo Vivi wrote:
>>> On Fri, Dec 02, 2022 at 02:35:28PM -0800, Matt Roper wrote:
>>>> When determining whether the platform has a hardware-level steering
>>>> semaphore (i.e., MTL and beyond), we need to use GRAPHICS_VER_FULL() to
>>>> compare the full version rather than just the major version number
>>>> returned by GRAPHICS_VER().
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Fixes: 3100240bf846 ("drm/i915/mtl: Add hardware-level lock for steering")
>>>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>> index 087e4ac5b68d..41a237509dcf 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>> @@ -367,7 +367,7 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>>>>    	 * driver threads, but also with hardware/firmware agents.  A dedicated
>>>>    	 * locking register is used.
>>>>    	 */
>>>> -	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
>>>> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>>
>> Ouch, tricky class of bugs... Anyone has an idea how to maybe coerce the compiler into spotting them for us, cheaply?
> 
> I believe clang can already notice these problems with
> Wtautological-constant-out-of-range-compare (which is how the kernel
> test robot finds them):
> 
> 	>> drivers/gpu/drm/i915/gt/intel_gt_mcr.c:370:29: warning: result of comparison of constant 3142 with expression of type 'u8' (aka 'unsigned char')
> 	+is always false [-Wtautological-constant-out-of-range-compare]
> 		   if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> 		       ~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
> 	   drivers/gpu/drm/i915/gt/intel_gt_mcr.c:410:29: warning: result of comparison of constant 3142 with expression of type 'u8' (aka 'unsigned char')
> 	+is always false [-Wtautological-constant-out-of-range-compare]
> 		   if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> 		       ~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
> 	   2 warnings generated.

Hah.. curios how IS_ENABLED then works on clang builds. Maybe it has 
some special handling for that flavour of "always false".

> Unfortunately gcc doesn't seem to have anything equivalent as far as I
> can see.
> 
>>
>> This one is undefined behaviour I think so not good:
>>
>> -#define IP_VER(ver, rel)               ((ver) << 8 | (rel))
>> +typedef void * i915_full_ver_t;
>> +
>> +#define IP_VER(ver, rel) (i915_full_ver_t)(unsigned long)((ver) << 8 | (rel))
> 
> Hmm, so by casting it into a pointer, you're hoping to trigger a
> "comparison of pointer and integer without cast" warning on misuse?
> That's a good idea, but as you noted, the C99 spec says comparison of
> pointers is only guaranteed to work if both are pointers into the same
> structure/array, otherwise the results are technically undefined.

"error: comparison between pointer and integer" - it works, but yes it 
is undefined. Only == and != are allowed on random void * pointers.

Since you say clang builds report the problem we are good I guess.

Regards,

Tvrtko
