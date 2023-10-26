Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5B47D826C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 14:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E9A10E7C6;
	Thu, 26 Oct 2023 12:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380B710E7C0;
 Thu, 26 Oct 2023 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698322727; x=1729858727;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WhTiCYyZcaMi9T72mL68Bxhk4qs+XbYizDsbg8rk2pk=;
 b=he8nOJhcCktLoIUiYUp+Tpw5KSua6n3+NuVRN0sD7/iJeiL1AVySDBdr
 2qV7ZfbOeu7hbUoAJxhAPk5Kc0nQhZtfgsN4tp3jKyLfOtqNo6P8dcM9X
 zFM95H/Qz9F2wpYnAQzvn5iRNSUNDknWDTFmSUuRMrqBmjZWhCAr/DaEH
 nOIlxlfyiE9eXhEAdnfiKLRqN4iBHY9Ai7SPcLT2FPBPK/Ycv0Vz5QVAv
 L2/j1VydH3zgGh6GYtCO2pjfjtWA87c2FxwpZyk34Y1rLwDqvRooTS188
 luEyQCzHdjII4TjBmY5yUun8JudCJKu1cnYi6pudsca+g3lsmpimLVH5/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="9083937"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="9083937"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 05:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="709055919"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="709055919"
Received: from tzirr-desk2.ger.corp.intel.com (HELO localhost) ([10.252.49.68])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 05:18:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Badal Nilawar
 <badal.nilawar@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: avoid stringop-overflow warning
In-Reply-To: <87edhlbj16.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231016201012.1022812-1-arnd@kernel.org>
 <87edhlbj16.fsf@intel.com>
Date: Thu, 26 Oct 2023 15:18:39 +0300
Message-ID: <87wmv97f1c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 16 Oct 2023, Arnd Bergmann <arnd@kernel.org> wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The newly added memset() causes a warning for some reason I could not figure out:
>>
>> In file included from arch/x86/include/asm/string.h:3,
>>                  from drivers/gpu/drm/i915/gt/intel_rc6.c:6:
>> In function 'rc6_res_reg_init',
>>     inlined from 'intel_rc6_init' at drivers/gpu/drm/i915/gt/intel_rc6.c:610:2:
>> arch/x86/include/asm/string_32.h:195:29: error: '__builtin_memset' writing 16 bytes into a region of size 0 overflows the destination [-Werror=stringop-overflow=]
>>   195 | #define memset(s, c, count) __builtin_memset(s, c, count)
>>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gt/intel_rc6.c:584:9: note: in expansion of macro 'memset'
>>   584 |         memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
>>       |         ^~~~~~
>> In function 'intel_rc6_init':
>>
>> Change it to an normal initializer and an added memcpy() that does not have
>> this problem.
>>
>> Fixes: 4bb9ca7ee0745 ("drm/i915/mtl: C6 residency and C state type for MTL SAMedia")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_rc6.c | 16 ++++++++++------
>>  1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
>> index 8b67abd720be8..7090e4be29cb6 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
>> @@ -581,19 +581,23 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
>>  
>>  static void rc6_res_reg_init(struct intel_rc6 *rc6)
>>  {
>> -	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
>
> That's just bollocks. memset() is byte granularity, while
> INVALID_MMIO_REG.reg is u32. If the value was anything other than 0,
> this would break.
>
> And you're not supposed to look at the guts of i915_reg_t to begin with,
> that's why it's a typedef. Basically any code that accesses the members
> of i915_reg_t outside of its implementation are doing it wrong.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks for the patch, pushed to drm-intel-gt-next.

BR,
Jani.

>
>
>> +	i915_reg_t res_reg[INTEL_RC6_RES_MAX] = {
>> +		[0 ... INTEL_RC6_RES_MAX - 1] = INVALID_MMIO_REG,
>> +	};
>>  
>>  	switch (rc6_to_gt(rc6)->type) {
>>  	case GT_MEDIA:
>> -		rc6->res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
>> +		res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
>>  		break;
>>  	default:
>> -		rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
>> -		rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
>> -		rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
>> -		rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
>> +		res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
>> +		res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
>> +		res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
>> +		res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
>>  		break;
>>  	}
>> +
>> +	memcpy(rc6->res_reg, res_reg, sizeof(res_reg));
>>  }
>>  
>>  void intel_rc6_init(struct intel_rc6 *rc6)

-- 
Jani Nikula, Intel
