Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD67A6843A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 05:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D90910E193;
	Wed, 19 Mar 2025 04:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Sud1uwMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB3410E0D4;
 Wed, 19 Mar 2025 04:37:50 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id ulBNtfpwMfuZZulBRtao7X; Wed, 19 Mar 2025 05:37:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1742359066;
 bh=0VV/UtG/UDZ3bpNTeojrDmrZMrZ+qC1u4f7r2O6sak4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=Sud1uwMUrmb/VgDg9o8K3hj8UGSE3pe+iPsWUs08o9YX88klI8CBGYgbivzcw+x9G
 Gcso0XQnN56aGTJ4NPH2/9ZUv9Rgl1U1Yc7U93dRZRIECq8u0OZme2yqPgV1Jc7mYO
 Ma6d5dm1AgEfE4i2/8hsrfzN3vGseKJgn6niyTMcuay96GuUyhWUYAcjVkVtf9usc4
 +4y5P+9/s6wfFBZR1UbW0VHV7fwBQLuFxLs6d1Nsl2kRChFQ7k8tyJES6OXWNGD45K
 6jTpRZn/qzK/wFJScoI+qPr04sdJMEmAZlAeVgVYExy71tr8PBXZfInQcfQHr9x+gN
 6ShqyktgoutLw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 19 Mar 2025 05:37:46 +0100
X-ME-IP: 124.33.176.97
Message-ID: <f6885fdb-4361-428c-b6dd-54cd2ac7904d@wanadoo.fr>
Date: Wed, 19 Mar 2025 13:37:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] drm/i915: Convert REG_GENMASK*() to fixed-width
 GENMASK_U*()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Yury Norov <yury.norov@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-4-f59315e73c29@wanadoo.fr>
 <Z9mqUZX4H-CzqbW4@thinkpad> <87ldt2c6lz.fsf@intel.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <87ldt2c6lz.fsf@intel.com>
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

On 19/03/2025 at 07:32, Jani Nikula wrote:
> On Tue, 18 Mar 2025, Yury Norov <yury.norov@gmail.com> wrote:
>> On Sat, Mar 08, 2025 at 01:48:51AM +0900, Vincent Mailhol via B4 Relay wrote:
>>> From: Lucas De Marchi <lucas.demarchi@intel.com>
>>>
>>> Now that include/linux/bits.h implements fixed-width GENMASK_U*(), use
>>> them to implement the i915/xe specific macros. Converting each driver
>>> to use the generic macros are left for later, when/if other
>>> driver-specific macros are also generalized.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>>> ---
>>> Changelog:
>>>
>>>   v5 -> v6:
>>>
>>>     - No changes.
>>>
>>>   v4 -> v5:
>>>
>>>     - Add braket to macro names in patch description,
>>>       e.g. 'REG_GENMASK*' -> 'REG_GENMASK*()'
>>>
>>>   v3 -> v4:
>>>
>>>     - Remove the prefixes in macro parameters,
>>>       e.g. 'REG_GENMASK(__high, __low)' -> 'REG_GENMASK(high, low)'
>>> ---
>>>  drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
>>>  1 file changed, 11 insertions(+), 97 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>>> index e251bcc0c89f5710125bc70f07851b2cb978c89c..39e5ed9511174b8757b9201bff735fa362651b34 100644
>>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>>> @@ -9,76 +9,19 @@
>>>  #include <linux/bitfield.h>
>>>  #include <linux/bits.h>
>>>  
>>> -/**
>>> - * REG_BIT() - Prepare a u32 bit value
>>> - * @__n: 0-based bit number
>>> - *
>>> - * Local wrapper for BIT() to force u32, with compile time checks.
>>> - *
>>> - * @return: Value with bit @__n set.
>>> +/*
>>> + * Wrappers over the generic BIT_* and GENMASK_* implementations,
>>> + * for compatibility reasons with previous implementation
>>>   */
>>> -#define REG_BIT(__n)							\
>>> -	((u32)(BIT(__n) +						\
>>> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&		\
>>> -				 ((__n) < 0 || (__n) > 31))))
>>> +#define REG_GENMASK(high, low)		GENMASK_U32(high, low)
>>> +#define REG_GENMASK64(high, low)	GENMASK_U64(high, low)
>>> +#define REG_GENMASK16(high, low)	GENMASK_U16(high, low)
>>> +#define REG_GENMASK8(high, low)		GENMASK_U8(high, low)
>>
>> Nit. Maybe just
>>
>>  #define REG_GENMASK		GENMASK_U32
> 
> Please just keep it as it is for clarity.

I also prefer when the argument is clearly displayed. It shows at first
glance that this is a function-like macro and reminds of the correct
order of the argument without having to look at the definitions in
bits.h. It also allows for people to grep "#define REG_GENMASK(" in
order to find the macro definition.

To be honest, I don't have a strong opinion either, but because Jani
also prefers it this way, I will keep as-is.


Yours sincerely,
Vincent Mailhol

