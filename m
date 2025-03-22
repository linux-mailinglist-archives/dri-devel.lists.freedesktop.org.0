Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE869A6C9F7
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 12:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB3310E098;
	Sat, 22 Mar 2025 11:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="TOvo37+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-72.smtpout.orange.fr [193.252.22.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CA810E098;
 Sat, 22 Mar 2025 11:47:11 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id vxJVt69rhpih5vxJZtV7CB; Sat, 22 Mar 2025 12:47:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1742644026;
 bh=UTGUGbQUE2yBy6fNmytOVRCkloT3VUILyaQFDzsliS0=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=TOvo37+NuAbEYBETmhToZGFCO3XSA5A1TrbT/NKcYuQv0poRsQ5d7DFMcFpNEvptu
 3LL0OJhePxXiuXBgCAq6ScWL0H6AYnx2YCTTtueGLcwm1YT1Nv9om3ykr+qlV8qKBv
 t3aIsgQnpWbcyCI5DAJu4u/Q4X/3CEhDjyg0+aHS7opuCUb2WVNvDbhYiSoyf35X4p
 VVuWK0ILd6Ftj1bXvaaLNXWhWOubtzjBnkGf7ULseUgH8rV/J1CfHOwvTYcGAmu7pT
 liTnqE7rhR4C2PE4UICzKxE1RQPABxi1Oqvg31DicrVppqpBX7o0h+zCM7o0oYuGar
 Wmpz5nqaTnLeA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 22 Mar 2025 12:47:06 +0100
X-ME-IP: 124.33.176.97
Message-ID: <5d2af209-46bd-4a40-b82f-7772ed0b825d@wanadoo.fr>
Date: Sat, 22 Mar 2025 20:46:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
To: Yury Norov <yury.norov@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hsRJvpjYoqh9RG@thinkpad> <Z9oiEkQEcHhA0a80@thinkpad>
 <5cbaefa8-e51f-415f-a9b3-4841e69bb3fa@arm.com>
 <1aba17f1-0cd2-429c-8338-28387ec16314@arm.com> <Z92cThxAyXu9JJdk@thinkpad>
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
In-Reply-To: <Z92cThxAyXu9JJdk@thinkpad>
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

On 22/03/2025 at 02:05, Yury Norov wrote:
> On Wed, Mar 19, 2025 at 09:43:06AM +0530, Anshuman Khandual wrote:
>> 
>> 
>> On 3/19/25 09:04, Anshuman Khandual wrote:
>>> On 3/19/25 07:16, Yury Norov wrote:
>>>> + Catalin Marinas, ARM maillist

(...)

>>> These were moved into uapi subsequently via the following 
>>> commit.
>>> 
>>> 21a3a3d015aee ("tools headers: Synchronize {uapi/}linux/bits.h 
>>> with the kernel sources")
>>> 
>>> But in general GENMASK_U128() is needed for generating 128 bit 
>>> page table entries, related flags and masks whether in kernel or
>>> in user space for writing kernel test cases etc.
>> 
>> In the commit 947697c6f0f7 ("uapi: Define GENMASK_U128"), 
>> GENMASK_U128() gets defined using __GENMASK_U128() which in turn 
>> calls __BIT128() - both of which are defined in UAPI headers 
>> inside (include/uapi/linux/).
>> 
>> Just wondering - are you suggesting to move these helpers from 
>> include/uapi/linux/ to include/linux/bits.h instead ?
> 
> Vincent is working on fixed-width GENMASK_Uxx() based on 
> GENMASK_TYPE().
> 
> https://lore.kernel.org/lkml/20250308-fixed-type-genmasks-v6-0- 
> f59315e73c29@wanadoo.fr/T/
> 
> The series adds a general GENMASK_TYPE() in the linux/bits.h. I'd 
> like all fixed-widh genmasks to be based on it. The implementation 
> doesn't allow to move GENMASK_TYPE() the to uapi easily.
> 
> There was a discussion regarding that, and for now the general 
> understanding is that userspace doesn't need GENMASK_Uxx().
> 
> Are your proposed tests based on the in-kernel tools/ ? If so, 
> linux/ bits.h will be available for you.
> 
> Vincent,
> 
> Can you please experiment with moving GENMASK_U128() to linux/ 
> bits.h and switching it to GENMASK_TYPE()-based implementation?
> 
> If it works, we can do it after merging of GENMASK_TYPE() and 
> ancestors.

I sent the new version with the split as you asked in a separate message.

I switched GENMASK_U128() from using __GENMASK_U128() to using
GENMASK_TYPE() in this patch of the second series:

https://lore.kernel.org/all/20250322-consolidate-genmask-
v1-2-54bfd36c5643@wanadoo.fr/

After this, the genmask_u128_test() unit tests from lib/test_bits.c are
all green, so this looks good. Note that because it is not yet used,
there isn't much more things to test aside from that unit test.

To be precise, I am not yet *moving* it. For now, I decoupled
GENMASK_U128() from __GENMASK_U128(). To complete the move, all what is
left is to remove __GENMASK_U128() from the uapi. To be honest, I am not
keen on touching either of the uapi or the asm variants myself. But, if
my work gets merged, that last step should be easy for you.



On a side note, at first glance, I was disturbed by the current
__GENMASK_U128() implementation:

  #define __GENMASK_U128(h, l) \
  	((_BIT128((h)) << 1) - (_BIT128(l)))

If calling __GENMASK_U128(127, x), the macro does a:

  _BIT128(127) << 1

which expands to:

  (unsigned __int128)1 << 127 << 1

So, while (unsigned __int128)1 << 128 is an undefined behaviour, doing
it in two steps: << 127 and << 1 is well defined and gives zero. Then,
when doing the subtraction, the unsigned integer wraparound restores the
most significant bits making things go back to normal.


The same applies to all the other variants. If doing:

  #define GENMASK_TYPE(t, h, l)				\
  	((t)(GENMASK_INPUT_CHECK(h, l) +		\
  	     (((t)1 << (h) << 1) - ((t)1 << (l)))))

The unit tests pass for everything and you even still get the warning if
h is out of bound.

But then, bloat-o-meter (x86_64, defconfig, GCC 12.4.1) shows a small
increase:

  Total: Before=22723482, After=22724586, chg +0.00%

So, probably not worth the change anyway. I am keeping the current version.


Yours sincerely,
Vincent Mailhol
