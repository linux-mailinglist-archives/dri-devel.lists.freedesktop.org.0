Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE01F5A28C4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 15:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30DC10E90F;
	Fri, 26 Aug 2022 13:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0A210E90F;
 Fri, 26 Aug 2022 13:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661521483; x=1693057483;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MSnUTu6FaQCyjdRNvKe1+Uu2Wb/cFVcz00a0vJvcSVA=;
 b=HvDI9qke6NtExlaOO0T6Ti8hTP7j43tIAOXn2DdB8gxhBr4WbvIc+bw3
 LUl6dep7IDjNhQiHFdC+cTwfymIMNmVA+Ov6MtrOIoiYHqICw4u2p6IY+
 NxcmRWeWNg6bT6E0gQ7m9M/tXv0u4Lr5m64FAoCXgUDCPi8frfOyiG4fd
 9lsvjAzMrWyp92mGZ9m60DS9FsjIF4no7ESyg8vlqRh2o0D/4mUIYAIvr
 eOAr62t+TYxSyw3Vrn/oV4cgq5DrOdaDiozMKcFBjf/uNqC05zEgi8OhH
 iNqGT9c4c/mMsHs9fqcR9YVM95GDkB5kMrwHUkJmTa7Mnt4Kse0b5XKLw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="320604253"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="320604253"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 06:44:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="561442376"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.16.200])
 ([10.213.16.200])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 06:44:38 -0700
Message-ID: <1d8cc163-2435-42bc-83c8-62648d3c5ada@intel.com>
Date: Fri, 26 Aug 2022 15:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH v9 1/8] overflow: Move and add few utility
 macros into overflow
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20220824084514.2261614-1-gwan-gyeong.mun@intel.com>
 <20220824084514.2261614-2-gwan-gyeong.mun@intel.com>
 <202208250848.1C77B9C38@keescook>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <202208250848.1C77B9C38@keescook>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, intel-gfx-trybot@lists.freedesktop.org,
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.08.2022 18:47, Kees Cook wrote:
> On Wed, Aug 24, 2022 at 05:45:07PM +0900, Gwan-gyeong Mun wrote:
>> It moves overflows_type utility macro into overflow header from i915_utils
>> header. The overflows_type can be used to catch the truncaion (overflow)
>> between different data types. And it adds check_assign() macro which
>> performs an assigning source value into destination ptr along with an
>> overflow check. overflow_type macro has been improved to handle the signbit
>> by gcc's built-in overflow check function. And it adds overflows_ptr()
>> helper macro for checking the overflows between a value and a pointer
>> type/value.
>>
>> v3: Add is_type_unsigned() macro (Mauro)
>>      Modify overflows_type() macro to consider signed data types (Mauro)
>>      Fix the problem that safe_conversion() macro always returns true
>> v4: Fix kernel-doc markups
>> v6: Move macro addition location so that it can be used by other than drm
>>      subsystem (Jani, Mauro, Andi)
>>      Change is_type_unsigned to is_unsigned_type to have the same name form
>>      as is_signed_type macro
>> v8: Add check_assign() and remove safe_conversion() (Kees)
>>      Fix overflows_type() to use gcc's built-in overflow function (Andrzej)
>>      Add overflows_ptr() to allow overflow checking when assigning a value
>>      into a pointer variable (G.G.)
>> v9: Fix overflows_type() to use __builtin_add_overflow() instead of
>>      __builtin_add_overflow_p() (Andrzej)
>>      Fix overflows_ptr() to use overflows_type() with the unsigned long type
>>      (Andrzej)
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
>> ---
>>   drivers/gpu/drm/i915/i915_user_extensions.c |  3 +-
>>   drivers/gpu/drm/i915/i915_utils.h           |  5 +-
>>   include/linux/overflow.h                    | 62 +++++++++++++++++++++
>>   3 files changed, 64 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_user_extensions.c b/drivers/gpu/drm/i915/i915_user_extensions.c
>> index c822d0aafd2d..6f6b5b910968 100644
>> --- a/drivers/gpu/drm/i915/i915_user_extensions.c
>> +++ b/drivers/gpu/drm/i915/i915_user_extensions.c
>> @@ -50,8 +50,7 @@ int i915_user_extensions(struct i915_user_extension __user *ext,
>>   		if (err)
>>   			return err;
>>   
>> -		if (get_user(next, &ext->next_extension) ||
>> -		    overflows_type(next, ext))
>> +		if (get_user(next, &ext->next_extension) || overflows_ptr(next))
>>   			return -EFAULT;
>>   
>>   		ext = u64_to_user_ptr(next);
> 
> I continue to dislike the layers of macros and specialization here.
> This is just a fancy version of check_assign():
> 
> 	if (get_user(next, &ext->next_extension) || check_assign(next, &ext))
> 		return -EFAULT;
> 
> However, the __builtin_*_overflow() family only wants to work on
> integral types, so this needs to be slightly expanded:
> 
> 	uintptr_t kptr;
> 	...
> 	if (get_user(next, &ext->next_extension) || check_assign(next, &kptr))
> 		return -EFAULT;
> 
> 	ext = (void * __user)kptr;
> 
> But, it does seem like the actual problem here is that u64_to_user_ptr()
> is not performing the checking? It's used heavily in the drm code.
> 
> Is a check_assign_user_ptr() needed?
> 
>> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
>> index c10d68cdc3ca..eb0ded23fa9c 100644
>> --- a/drivers/gpu/drm/i915/i915_utils.h
>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>> @@ -32,6 +32,7 @@
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/sched/clock.h>
>> +#include <linux/overflow.h>
>>   
>>   #ifdef CONFIG_X86
>>   #include <asm/hypervisor.h>
>> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>>   #define range_overflows_end_t(type, start, size, max) \
>>   	range_overflows_end((type)(start), (type)(size), (type)(max))
>>   
>> -/* Note we don't consider signbits :| */
>> -#define overflows_type(x, T) \
>> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>> -
>>   #define ptr_mask_bits(ptr, n) ({					\
>>   	unsigned long __v = (unsigned long)(ptr);			\
>>   	(typeof(ptr))(__v & -BIT(n));					\
>> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
>> index f1221d11f8e5..6af9df1d67a1 100644
>> --- a/include/linux/overflow.h
>> +++ b/include/linux/overflow.h
>> @@ -52,6 +52,68 @@ static inline bool __must_check __must_check_overflow(bool overflow)
>>   	return unlikely(overflow);
>>   }
>>   
>> +/**
>> + * overflows_type - helper for checking the overflows between data types or
>> + *                  values
>> + *
>> + * @x: Source value or data type for overflow check
>> + * @T: Destination value or data type for overflow check
>> + *
>> + * It compares the values or data type between the first and second argument to
>> + * check whether overflow can occur when assigning the first argument to the
>> + * variable of the second argument. Source and Destination can be singned or
>> + * unsigned data types. Source and Destination can be different data types.
>> + *
>> + * Returns:
>> + * True if overflow can occur, false otherwise.
>> + */
>> +#define overflows_type(x, T) __must_check_overflow(({	\
>> +	typeof(T) v = 0;				\
>> +	__builtin_add_overflow((x), v, &v);		\
>> +}))
> 
> I'd like to avoid "externalizing" these kinds of checks when the better
> path is to catch the issue at operation type (add, sub, mul, assign).
> Looking at existing users, I see stuff like:
> 
>                  if (overflows_type(item.query_id - 1, unsigned long))
>                          return -EINVAL;
> 
>                  func_idx = item.query_id - 1;
> 
> This requires too much open-coded checking, IMO. It's better as:
> 
> 		if (check_assign(item.query_id - 1, &func_idx))
> 			return -EINVAL;
> 
> or other similar:
> 
>          if (overflows_type(user->slice_mask, context->slice_mask) ||
> 	...
>          context->slice_mask = user->slice_mask;
> 
> and some that don't make sense to me. Why check argument types? Is this
> trying to avoid implicit type conversions?
> 
> So, if it's _really_ needed, I can live with adding overflows_type().
> 
>> +
>> +/**
>> + * overflows_ptr - helper for checking the occurrence of overflows when a value
>> + *                 assigns to  the pointer data type
>> + *
>> + * @x: Source value for overflow check
>> + *
>> + * gcc's built-in overflow check functions don't support checking between the
>> + * pointer type and non-pointer type. And ILP32 and LP64 have the same bit size
>> + * between long and pointer. Therefore it internally compares the source value
>> + * and unsigned long data type for checking overflow.
>> + *
>> + * Returns:
>> + * True if overflow can occur, false otherwise.
>> + */
>> +#define overflows_ptr(x) __must_check_overflow(overflows_type(x, unsigned long))
> 
> I'd rather not have this -- it's just a specialized use of
> overflows_type(), and only used in 1 place.
> 
>> +
>> +/**
>> + * check_assign - perform an assigning source value into destination ptr along
>> + *                with an overflow check.
>> + *
>> + * @value: Source value
>> + * @ptr: Destination pointer address, If the pointer type is not used,
>> + *       a warning message is output during build.
>> + *
>> + * It checks internally the ptr is a pointer type. And it uses gcc's built-in
>> + * overflow check function.
>> + * It does not use the check_*() wrapper functions, but directly uses gcc's
>> + * built-in overflow check function so that it can be used even when
>> + * the type of value and the type pointed to by ptr are different without build
>> + * warning messages.
> 
> This is a good point: the check_{add,sub,mul}_overflow() helpers
> currently require all the params be the same type, which rather limits
> their usage. Perhaps this can be weakened now that we're not using[1]
> the fallback logic any more? (Separate patch.)
> 
>> + *
>> + * Returns:
>> + * If the value would overflow the destination, it returns true. If not return
>> + * false. When overflow does not occur, the assigning into ptr from value
>> + * succeeds. It follows the return policy as other check_*_overflow() functions
>> + * return non-zero as a failure.
>> + */
>> +#define check_assign(value, ptr) __must_check_overflow(({	\
>> +	typecheck_pointer(ptr); 		\
>> +	__builtin_add_overflow(0, value, ptr);	\
>> +}))
> 
> But yes, this looks correct. I really like it. :)


One more thing, I suspect __builtin_add_overflow checks already if ptr 
is pointer, so typecheck_pointer seems redundant.

Regards
Andrzej


> 
>> +
>>   /*
>>    * For simplicity and code hygiene, the fallback code below insists on
>>    * a, b and *d having the same type (similar to the min() and max()
>> -- 
>> 2.37.1
>>
> 
> -Kees
> 
> [1] 4eb6bd55cfb2 ("compiler.h: drop fallback overflow checkers")
> 

