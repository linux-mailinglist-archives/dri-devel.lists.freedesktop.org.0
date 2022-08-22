Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A581659C197
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 16:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F38790678;
	Mon, 22 Aug 2022 14:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB222BF9D;
 Mon, 22 Aug 2022 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661178389; x=1692714389;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=lfQZ8Fx5e1wrffmsI6V8HXxbBTXhtMYllCy72e/dWN8=;
 b=Bk3AH6i5QmKMvcCFRVGXprX5c+JuiqWA7HM4qGdXBTxE4ecHMJ/5OWtx
 XIVqJmJt0+RDgYNspjBAtmuaTPCCmaaSJibBQO5LuHMOhMDfXI7MTK1Dp
 O9ztd8L/mBc89b1oV0agQhN/D/KsTUC+qvVI6XcppX8bkkwLtK4QQ11ba
 Qjohy80HYA6pxeQOm4Y18SC7FCHuyOnvFbDIehyLsvxGf9xx8qfrItxCV
 azdHjj604yFYNth4A5zbD21ukne9xYKgvPYzRFviT4rB9AwWTotlb2zvb
 llrYWsLSXSc3Qdhf6Q8Wu5QRty/ef7qmmLLh3YsS4R1XpHknG1G1Kmvyo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="290980640"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="290980640"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 07:26:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669563881"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.27.97])
 ([10.213.27.97])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 07:26:26 -0700
Message-ID: <cbaff83b-db5e-c41d-ffab-86562ef60e8b@intel.com>
Date: Mon, 22 Aug 2022 16:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v7 1/8] overflow: Move and add few utility
 macros into overflow
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Kees Cook <keescook@chromium.org>, Andi Shyti <andi.shyti@linux.intel.com>
References: <20220816093525.184940-1-gwan-gyeong.mun@intel.com>
 <20220816093525.184940-2-gwan-gyeong.mun@intel.com>
 <Yv10sQADwdZrIV42@alfio.lan> <202208171657.63AE7AC@keescook>
 <f3370fb1-5318-c662-294b-2c7fe693efd6@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <f3370fb1-5318-c662-294b-2c7fe693efd6@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, linux-hardening@vger.kernel.org,
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22.08.2022 16:05, Andrzej Hajda wrote:
> On 18.08.2022 02:12, Kees Cook wrote:
>> On Thu, Aug 18, 2022 at 01:07:29AM +0200, Andi Shyti wrote:
>>> Hi Kees,
>>>
>>> would you mind taking a look at this patch?
>>
>> Hi! Thanks for the heads-up!
>>
>>>
>>> Thanks,
>>> Andi
>>>
>>> On Tue, Aug 16, 2022 at 06:35:18PM +0900, Gwan-gyeong Mun wrote:
>>>> It moves overflows_type utility macro into overflow header from 
>>>> i915_utils
>>>> header. The overflows_type can be used to catch the truncation 
>>>> between data
>>>> types. And it adds safe_conversion() macro which performs a type 
>>>> conversion
>>>> (cast) of an source value into a new variable, checking that the
>>>> destination is large enough to hold the source value. And the 
>>>> functionality
>>>> of overflows_type has been improved to handle the signbit.
>>>> The is_unsigned_type macro has been added to check the sign bit of the
>>>> built-in type.
>>>>
>>>> v3: Add is_type_unsigned() macro (Mauro)
>>>>      Modify overflows_type() macro to consider signed data types 
>>>> (Mauro)
>>>>      Fix the problem that safe_conversion() macro always returns true
>>>> v4: Fix kernel-doc markups
>>>> v6: Move macro addition location so that it can be used by other 
>>>> than drm
>>>>      subsystem (Jani, Mauro, Andi)
>>>>      Change is_type_unsigned to is_unsigned_type to have the same 
>>>> name form
>>>>      as is_signed_type macro
>>>>
>>>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
>>>> ---

(...)

>>>> +
>>>> +/**
>>>> + * overflows_type - helper for checking the truncation between data 
>>>> types
>>>> + * @x: Source for overflow type comparison
>>>> + * @T: Destination for overflow type comparison
>>>> + *
>>>> + * It compares the values and size of each data type between the 
>>>> first and
>>>> + * second argument to check whether truncation can occur when 
>>>> assigning the
>>>> + * first argument to the variable of the second argument.
>>>> + * Source and Destination can be used with or without sign bit.
>>>> + * Composite data structures such as union and structure are not 
>>>> considered.
>>>> + * Enum data types are not considered.
>>>> + * Floating point data types are not considered.
>>>> + *
>>>> + * Returns:
>>>> + * True if truncation can occur, false otherwise.
>>>> + */
>>>> +#define overflows_type(x, T) \
>>>> +    (is_unsigned_type(x) ? \
>>>> +        is_unsigned_type(T) ? \
>>>> +            (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 
>>>> : 0 \
>>>> +            : (sizeof(x) >= sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 
>>>> 1)) ? 1 : 0 \
>>>> +    : is_unsigned_type(T) ? \
>>>> +        ((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> 
>>>> BITS_PER_TYPE(T)) ? 1 : 0 \
>>>> +        : (sizeof(x) > sizeof(T)) ? \
>>>> +            ((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>>>> +                : ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>>>> +            : 0)
>>
>> Like the other, I'd much rather this was rephrased in terms of the
>> existing macros (e.g. type_min()/type_max().)
> 
> 
> I am not sure how it could be rephrased with type_(min|max), but I guess 
> the shortest could be sth like:
> 
> #define overflows_type(x, T) __builtin_add_overflow_p(x, (typeof(T))0, 
> (typeof(T))0)

Except this macro is available since gcc 7, but apparently 
__builtin_add_overflow is supported since gcc 5, which should be OK:
#define overflows_type(x, T) ({ typeof(T) r = 0; 
__builtin_add_overflow_p((x), r, r); })

Regards
Andrzej

> 
> Regards
> Andrzej
> 
> 
>>
>>>> +
>>>> +/**
>>>> + * safe_conversion - perform a type conversion (cast) of an source 
>>>> value into
>>>> + * a new variable, checking that the destination is large enough to 
>>>> hold the
>>>> + * source value.
>>>> + * @ptr: Destination pointer address
>>>> + * @value: Source value
>>>> + *
>>>> + * Returns:
>>>> + * If the value would overflow the destination, it returns false.
>>>> + */
>>>> +#define safe_conversion(ptr, value) ({ \
>>>> +    typeof(value) __v = (value); \
>>>> +    typeof(ptr) __ptr = (ptr); \
>>>> +    overflows_type(__v, *__ptr) ? 0 : ((*__ptr = 
>>>> (typeof(*__ptr))__v), 1); \
>>>> +})
>>
>> I try to avoid "safe" as an adjective for interface names, since it
>> doesn't really answer "safe from what?" This looks more like "assign, but
>> zero when out of bounds". And it can be built from existing macros here:
>>
>>     if (check_add_overflow(0, value, ptr))
>>         *ptr = 0;
>>
>> I actually want to push back on this a bit, because there can still be
>> logic bugs built around this kind of primitive. Shouldn't out-of-bounds
>> assignments be seen as a direct failure? I would think this would be
>> sufficient:
>>
>> #define check_assign(value, ptr)    check_add_overflow(0, value, ptr)
>>
>> And callers would do:
>>
>>     if (check_assign(value, &var))
>>         return -EINVAL;
>>
>> etc.
>>
>>
> 
