Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A105DA56C96
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 16:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD16410E33A;
	Fri,  7 Mar 2025 15:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="TWTiZvoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C0710E330;
 Fri,  7 Mar 2025 15:50:37 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id qZxttvad3LArrqZxxtvbTO; Fri, 07 Mar 2025 16:50:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741362632;
 bh=u4JFPpnUhifHBkLOOmUUTQNT8VWfspjFasQe3TAxw7I=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=TWTiZvoEanl972+iLSv8jS2DFAGcCStHX+F3LeX/UwgFtCfgulB3xYCDiEXu+VEya
 XcrIQ6O1UAkMyWTgoj/Tb+HF/45bnB3mms9rIUI9+ORqiA/60oUHjg9+f+IfIA//+z
 0Q+mejMCamKUPK4H9oKji5sdUgloNO8WoJ4XdQO55AbXMR15bagJPNKQWLtCmu173x
 PfYlZWuFF3UUwzbwSXFhOd1pHaVyUL6GgY3wVSlvJIU7aiBrNt6niVb8iwAxBOwhg+
 IiEdgX4nZsnpSymRVXv6aWW0tdux+oy8QJYrBldVzdPliJIG2/e6kR9gIajiUXpTW6
 dx4jLYmCymv2w==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 07 Mar 2025 16:50:32 +0100
X-ME-IP: 124.33.176.97
Message-ID: <d27b4c54-a44b-4df0-8c50-0cc818be92ba@wanadoo.fr>
Date: Sat, 8 Mar 2025 00:50:20 +0900
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
 <20250307132742.150a3a77@pumpkin>
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
In-Reply-To: <20250307132742.150a3a77@pumpkin>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/03/2025 at 22:27, David Laight wrote:
> On Fri, 7 Mar 2025 18:58:08 +0900
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:
> 
>> On 07/03/2025 at 04:23, David Laight wrote:
>>> On Thu, 06 Mar 2025 20:29:52 +0900
>>> Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org> wrote:
>>>   
>>>> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

(...)

>>>> +#define GENMASK(h, l)		__GENMASK(h, l)
>>>> +#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)  
>>>
>>> What do those actually expand to now?
>>> As I've said a few times both UL(0) and ULL(0) are just (0) for __ASSEMBLY__
>>> so the expansions of __GENMASK() and __GENMASK_ULL() contained the
>>> same numeric constants.  
>>
>> Indeed, in asm, the UL(0) and ULL(0) expands to the same thing: 0.
>>
>> But the two macros still expand to something different on 32 bits
>> architectures:
>>
>>   * __GENMASK:
>>
>>       (((~(0)) << (l)) & (~(0) >> (32 - 1 - (h))))
>>
>>   * __GENMASK_ULL:
>>
>>       (((~(0)) << (l)) & (~(0) >> (64 - 1 - (h))))
>>
>> On 64 bits architecture these are the same.
> 
> If the assembler is naive and uses the cpu shift instruction for the >>
> then a lot of cpu (including all x86 since the 286) mask off the high bits.
> So __GENMASK_ULL() may well generate the expected pattern - provided it
> is 32bits wide.

"If", "may", that's still a lot of conditionals in your sentence :)

I do not have enough knowledge to prove or disprove this, but what I am
sure of is that this uncertainty tells me that this is not something I
want to touch myself.

I picked up this stalled fixed width patch series and re-spinned it
because I had confidence here. I do not want to extend this series with
some asm clean-up which looks uncertain to me. I am not telling you are
wrong but just that I will happily delegate this to whoever has more
confidence than me!

>>> This means they should be generating the same values.
>>> I don't know the correct 'sizeof (int_type)' for the shift right of ~0.
>>> My suspicion is that a 32bit assembler used 32bit signed integers and a
>>> 64bit one 64bit signed integers (but a 32bit asm on a 64bit host might
>>> be 64bit).
>>> So the asm versions need to avoid the right shift and only do left shifts.
>>>
>>> Which probably means they need to be enirely separate from the C versions.
>>> And then the C ones can have all the ULL() removed.  
>>
>> In this v5, I already have the ULL() removed from the non-uapi C
>> version. And we are left with two distinct variants:
>>
>>   - the uapi C & asm
>>   - the non-uapi C (including fix width)
>>
>> For the uapi ones, I do not think we can modify it without a risk of
>> breaking some random userland. At least, this is not a risk I will take.
>> And if we have to keep the __GENMASK() and __GENMASK_ULL(), then I would
>> rather just reuse these for the asm variant instead of splitting further
>> more and finding ourselves with three variants:
>>
>>   - the uapi C
>>   - the asm
>>   - the non-uapi C (including fix width)
>>
>> If __GENMASK() and __GENMASK_ULL() were not in the uapi, I would have
>> agreed with you.
>>
>> If you believe that the risk of modifying the uapi GENMASK*() is low
>> enough, then you can submit a patch. But I will definitely not touch
>> these myself.
> 
> I don't think you'll break userspace by stopping the uapi .h working
> for asm files (with __ASSEMBLER__ defined).
> 
> But someone else might have a different opinion.

How do you know that there isn't someone somewhere who is using the uapi
__GENMASK*() in their userland asm code? Wouldn't such code break?

You may argue that the uapi is not meant to be used that way, but at the
end, we are not supposed to make assumptions on how the uapi code will
be used. Once it is exposed, if something break because the uapi was not
used in the intended way, it is still the kernel fault, not the userland.


Yours sincerely,
Vincent Mailhol

