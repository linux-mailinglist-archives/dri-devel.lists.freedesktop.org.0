Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A83F7EE3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 01:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47F96E42E;
	Wed, 25 Aug 2021 23:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862056E42E;
 Wed, 25 Aug 2021 23:07:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C7EC610C7;
 Wed, 25 Aug 2021 23:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629932871;
 bh=/oV5vifeAsDt2n4hLOIWlI4IWQvQxrjGqtyQT9n8jvI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JpYeWiCC4KMCvNENg2fv2bOj8trKKz9oiYLQsqevnKexyZJTE0KqsemGDOEoAiU+j
 g+X6dnhU9dMZmVwDw9mjjacmKqGRAjeSoh4XJqvPpwPNI7MD5wTH9T1h/d8pRcQMlu
 o4YdQVXZqeYjakCMUJICySoBqgR2uruJ6VsouscfAQGCtEmUgTYJy5mlLuSlZE6Jfd
 CIBxm3qTXkKa8halFjNbtAMBElGpirlhaUoUSoPolxPWNucUXT292yKJcEE/g8nOmN
 EINqYVEwFmMYb4hkMfnNl7BZJ40bOPdEMk0v6iQCg0SIqWZ+L/EF8nEEZIXP1N9JC5
 v8CChbPcaUaOQ==
Subject: Re: [PATCH] drm/i915: Clean up disabled warnings
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, llvm@lists.linux.dev
References: <20210824232237.2085342-1-nathan@kernel.org>
 <CAKwvOdk2mLem4w05o5cdr0Mz62M2CWeW+5LFnKE5L+pMPqa7WA@mail.gmail.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <b8ff7ced-3e5e-603f-6e59-915c97a8f88d@kernel.org>
Date: Wed, 25 Aug 2021 16:07:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdk2mLem4w05o5cdr0Mz62M2CWeW+5LFnKE5L+pMPqa7WA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

On 8/25/2021 4:03 PM, Nick Desaulniers wrote:
> On Tue, Aug 24, 2021 at 4:23 PM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> i915 enables a wider set of warnings with '-Wall -Wextra' then disables
>> several with cc-disable-warning. If an unknown flag gets added to
>> KBUILD_CFLAGS when building with clang, all subsequent calls to
>> cc-{disable-warning,option} will fail, meaning that all of these
>> warnings do not get disabled [1].
>>
>> A separate series will address the root cause of the issue by not adding
>> these flags when building with clang [2]; however, the symptom of these
>> extra warnings appearing can be addressed separately by just removing
>> the calls to cc-disable-warning, which makes the build ever so slightly
>> faster because the compiler does not need to be called as much before
>> building.
>>
>> The following warnings are supported by GCC 4.9 and clang 10.0.1, which
>> are the minimum supported versions of these compilers so the call to
>> cc-disable-warning is not necessary. Masahiro cleaned this up for the
>> reset of the kernel in commit 4c8dd95a723d ("kbuild: add some extra
>> warning flags unconditionally").
>>
>> * -Wmissing-field-initializers
>> * -Wsign-compare
>> * -Wtype-limits
>> * -Wunused-parameter
>>
>> -Wunused-but-set-variable was implemented in clang 13.0.0 and
>> -Wframe-address was implemented in clang 12.0.0 so the
>> cc-disable-warning calls are kept for these two warnings.
>>
>> Lastly, -Winitializer-overrides is clang's version of -Woverride-init,
>> which is disabled for the specific files that are problematic. clang
>> added a compatibility alias in clang 8.0.0 so -Winitializer-overrides
>> can be removed.
>>
>> [1]: https://lore.kernel.org/r/202108210311.CBtcgoUL-lkp@intel.com/
>> [2]: https://lore.kernel.org/r/20210824022640.2170859-1-nathan@kernel.org/
>>
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks for the patch! Do you need to re-ping, rebase, or resend that
> other series?
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I assume you mean the series below rather than above? I sent this patch 
right after that series and it has one set of reviews so I am hoping the 
i915 maintainers will pick them up soon so this one can be applied 
afterwards or resent.

Thank you for the review!

Cheers,
Nathan

>> ---
>>
>> NOTE: This is based on my series to enable -Wsometimes-initialized here:
>>
>> https://lore.kernel.org/r/20210824225427.2065517-1-nathan@kernel.org/
>>
>> I sent it separately as this can go into whatever release but I would
>> like for that series to go into 5.15.
>>
>>   drivers/gpu/drm/i915/Makefile | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 335ba9f43d8f..6b38547543b1 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -13,13 +13,11 @@
>>   # will most likely get a sudden build breakage... Hopefully we will fix
>>   # new warnings before CI updates!
>>   subdir-ccflags-y := -Wall -Wextra
>> -subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
>> -subdir-ccflags-y += $(call cc-disable-warning, type-limits)
>> -subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
>> +subdir-ccflags-y += -Wno-unused-parameter
>> +subdir-ccflags-y += -Wno-type-limits
>> +subdir-ccflags-y += -Wno-missing-field-initializers
>> +subdir-ccflags-y += -Wno-sign-compare
>>   subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
>> -# clang warnings
>> -subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
>> -subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
>>   subdir-ccflags-y += $(call cc-disable-warning, frame-address)
>>   subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
>>
>>
>> base-commit: fb43ebc83e069625cfeeb2490efc3ffa0013bfa4
>> prerequisite-patch-id: 31c28450ed7e8785dce967a16db6d52eff3d7d6d
>> prerequisite-patch-id: 372dfa0e07249f207acc1942ab0e39b13ff229b2
>> prerequisite-patch-id: 1a585fa6cda50c32ad1e3ac8235d3cff1b599978
>> --
>> 2.33.0
>>
> 
> 
