Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC20A59190
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5278D10E3EF;
	Mon, 10 Mar 2025 10:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MKsE1Ajc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA2610E3EC;
 Mon, 10 Mar 2025 10:46:53 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id raebt34wJACDNraeftbFlA; Mon, 10 Mar 2025 11:46:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741603609;
 bh=SM+GH4W9Mgpq6UbMamTcytvpYPgAzdTWefneB42yE/0=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=MKsE1Ajc+m6LGBqtCOp+fWLgINX4uVO2Wrtli0Wf+5I3+tbC5y8eUDQpVvSr+sVVq
 LGT5lUHG3IOlheI+5av6dg7E+H+0dAGJ9PmK1E3z4ldjAqjbTNpWRlcModsGvkIBPK
 McEgwDJzub0wiygpF9OLg8yJkqz4zrzyRupxB2fdmvNSwVVbeynkkDf1dMT4h/QfzF
 anmuTlXxHZ6Y3C0MFmb/Nmz76K5aADaLEu1rl0GYuQbLqM89s9tFFezxlxTjRqYZl6
 N7de4kkml1YTIY+mUr4sBP5yGotFwTIY862lumo4VGXwgMSi0hlFMI0ujKlRCKXBst
 4aDTEeuoMWKIA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 10 Mar 2025 11:46:49 +0100
X-ME-IP: 124.33.176.97
Message-ID: <d3c88533-2af7-4dc4-87e3-e6d03cd965b5@wanadoo.fr>
Date: Mon, 10 Mar 2025 19:46:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] bits: split the definition of the asm and non-asm
 GENMASK()
To: David Laight <david.laight.linux@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
 <20250306192331.2701a029@pumpkin>
 <bdce7d99-7f02-4667-acda-9ffc62c92af2@wanadoo.fr>
 <20250309015853.01412484@pumpkin> <20250309102312.4ff08576@pumpkin>
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
In-Reply-To: <20250309102312.4ff08576@pumpkin>
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

On 09/03/2025 at 19:23, David Laight wrote:
> On Sun, 9 Mar 2025 01:58:53 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
>> On Fri, 7 Mar 2025 18:58:08 +0900
>> Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:
>>
>>> On 07/03/2025 at 04:23, David Laight wrote:  
>>>> On Thu, 06 Mar 2025 20:29:52 +0900
>>>> Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org> wrote:
>>>>     
>>>>> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>>>>>
>>>>> In an upcoming change, GENMASK() and its friends will indirectly
>>>>> depend on sizeof() which is not available in asm.
>>>>>
>>>>> Instead of adding further complexity to __GENMASK() to make it work
>>>>> for both asm and non asm, just split the definition of the two
>>>>> variants.    
>>>> ...    
>>>>> +#else /* defined(__ASSEMBLY__) */
>>>>> +
>>>>> +#define GENMASK(h, l)		__GENMASK(h, l)
>>>>> +#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)    
>>>>
>>>> What do those actually expand to now?
>>>> As I've said a few times both UL(0) and ULL(0) are just (0) for __ASSEMBLY__
>>>> so the expansions of __GENMASK() and __GENMASK_ULL() contained the
>>>> same numeric constants.    
>>>
>>> Indeed, in asm, the UL(0) and ULL(0) expands to the same thing: 0.
>>>
>>> But the two macros still expand to something different on 32 bits
>>> architectures:
>>>
>>>   * __GENMASK:
>>>
>>>       (((~(0)) << (l)) & (~(0) >> (32 - 1 - (h))))
>>>
>>>   * __GENMASK_ULL:
>>>
>>>       (((~(0)) << (l)) & (~(0) >> (64 - 1 - (h))))
>>>
>>> On 64 bits architecture these are the same.  
>>
>> I've just fed those into godbolt (https://www.godbolt.org/z/Ter6WE9qE) as:
>> int fi(void)
>> {
>>     int v;
>>     asm("mov $(((~(0)) << (8)) & (~(0) >> (32 - 1 - (15)))),%0": "=r" (v));
>>     return v -(((~(0u)) << (8)) & (~(0u) >> (32 - 1 - (15))));
>> }
>>
>> gas warns:
>> <source>:4: Warning: 0xffffffffff00 shortened to 0xffffff00
>>
>> unsigned long long fll(void)
>> {
>>     unsigned long long v;
>>     asm("mov $(((~(0)) << (8)) & (~(0) >> (64 - 1 - (15)))),%0": "=r" (v));
>>     return v -(((~(0ull)) << (8)) & (~(0ull) >> (64 - 1 - (15))));
>> }
>>
>> (for other architectures you'll need to change the opcode)
>>
>> For x86 and x86-32 the assembler seems to be doing 64bit maths with unsigned
>> right shifts - so the second function (with the 64 in it) generates 0xff00.
>> I doubt a 32bit only assembler does 64bit maths, but the '>> 48' above
>> might get masked to a '>> 16' by the cpu and generate the correct result.
>>
>> So __GENMASK() is likely to be broken for any assembler that supports 64bits
>> when generating 32bit code.
>> __GENMASK_ULL() works (assuming all have unsigned >>) on 64bit assemblers
>> (even when generating 32bit code). It may work on some 32bit assemblers.>
> I've remembered my 'pi' has a 32bit userspace (on a 64bit kernel).
> I quick test of "mov %0,#(...)" and bits 11..8 gives the correct output
> for size '32' but the error message:
> /tmp/ccPB7bWh.s:26: Warning: shift count out of range (56 is not between 0 and 31)
> with size '64'.
> 
> Assuming that part of the gnu assembler is consistent across architectures
> you can't use either GENMASK in asm for 32bit architectures.
> 
> Any change (probably including removing the asm support for the uapi) isn't
> going to make things worse!
> 
> 	David
> 
>>
>> Since most uses in the header files will be GENMASK() I doubt (hope) no
>> asm code actually uses the values!

After reading your message, I wanted to understand where these
GENMASK*() were used in asm code. It happens that most of the
architectures simply don't use it!

I see these are using in aarch64, but that's about it.

I couldn't find any use of neither GENMASK() nor GENMASK_ULL() in x86,
arm 32 bits, m68k or powerpc asm code (I did not check the other
architectures).

aarch64 uses both the long and long long variants, but this being a 64
bits architecture, these are the same. So OK.

So, this goes into the same direction as you: I guess that the fact that
no one noticed the issue is that no one uses this on a 32 bits arch,
probably for historical reasons, i.e. the asm code was written before
the introduction of the GENMASK() macros.

>> The headers assemble - but that is about all that can be said.
>>
>> Bags of worms :-)

+1 (I will not open that bag)

I think that the asm and non asm variant should have used a different
implementation from the begining. By wanting to have a single variant
that fit both the asm and the C code, we have a complex result that is
hard to understand and maintain (c.f. the bug which you pointed out
which have been unnoticed for ever).

But now that it is in the uapi, I am not sure of what is the best
approach. I sincerely hope that we can just modify it with no userland
impact.

Well, just to make it clear, I am not touching the asm part. I
acknowledge the issue, but I do not think that I have the skill to fix it.


Yours sincerely,
Vincent Mailhol
