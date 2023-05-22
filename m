Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 734C270BECA
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FB210E135;
	Mon, 22 May 2023 12:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA7C710E135
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 12:53:40 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:34822.850506710
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id E73591002C4;
 Mon, 22 May 2023 20:53:36 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 bb1ac2a014294584af587b144dad0f46 for jani.nikula@linux.intel.com; 
 Mon, 22 May 2023 20:53:37 CST
X-Transaction-ID: bb1ac2a014294584af587b144dad0f46
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <e7d2f0c6-efc1-99d0-2d63-aa62080c34b2@189.cn>
Date: Mon, 22 May 2023 20:53:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>, Li Yi <liyi@loongson.cn>
References: <20230516173026.2990705-1-15330273260@189.cn>
 <f6bd362145124f34a1af800dd330f8e9@AcuMS.aculab.com>
 <b23c41b1-e177-c81d-5327-fce5511cb97d@189.cn> <871qj8ob7z.fsf@intel.com>
 <7f81c053-ba60-a4d2-23d6-d0f032acbcff@189.cn> <87ttw4munm.fsf@intel.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <87ttw4munm.fsf@intel.com>
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/5/22 20:13, Jani Nikula wrote:
> On Mon, 22 May 2023, Sui Jingfeng <15330273260@189.cn> wrote:
>> Hi,
>>
>> On 2023/5/22 19:29, Jani Nikula wrote:
>>> On Thu, 18 May 2023, Sui Jingfeng <15330273260@189.cn> wrote:
>>>> On 2023/5/17 18:59, David Laight wrote:
>>>>> From: 15330273260@189.cn
>>>>>> Sent: 16 May 2023 18:30
>>>>>>
>>>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>>
>>>>>> Both mode->crtc_htotal and mode->crtc_vtotal are u16 type,
>>>>>> mode->crtc_htotal * mode->crtc_vtotal will results a unsigned type.
>>>>> Nope, u16 gets promoted to 'signed int' and the result of the
>>>>> multiply is also signed.
>>>> I believe that signed or unsigned is dependent on the declaration.
>>>>
>>>> I am talk about the math, while you are talking about compiler.
>>>>
>>>> I admit that u16 gets promoted to 'signed int' is true, but this is
>>>> irrelevant,
>>>>
>>>> the point is how to understand the returned value.
>>>>
>>>>
>>>> How does the compiler generate the code is one thing, how do we
>>>> interpret the result is another
>>>>
>>>> How does the compiler generate the code is NOT determined by us, while
>>>> how do we interpret the result is determined by us.
>>>>
>>>>
>>>> I believe that using a u32 type to interpret the result(u16 * u16) is
>>>> always true, it is true in the perspective of *math*.
>>>>
>>>> Integer promotions is the details of C program language. If the result
>>>> of the multiply is signed, then there are risks that
>>>>
>>>> the result is negative, what's the benefit to present this risk to the
>>>> programmer?
>>>>
>>>> What's the benefit to tell me(and others) that u16 * u16 yield a signed
>>>> value? and can be negative?
>>>>
>>>> Using int type as the return type bring concerns to the programmer and
>>>> the user of the function,
>>>>
>>>> even though this is not impossible in practice.
>>> In general, do not use unsigned types in arithmethic to avoid negative
>>> values, because most people will be tripped over by integer promotion
>>> rules, and you'll get negative values anyway.
>>>
>>> I'll bet most people will be surprised to see what this prints:
>>>
>>> #include <stdio.h>
>>> #include <stdint.h>
>>>
>>> int main(void)
>>> {
>>> 	uint16_t x = 0xffff;
>>> 	uint16_t y = 0xffff;
>>> 	uint64_t z = x * y;
>>>
>>> 	printf("0x%016lx\n", z);
>>> 	printf("%ld\n", z);
>> Here, please replace the "%ld\n" with the "%lu\n", then you will see the
>> difference.
>>
>> you are casting the variable 'z' to signed value,  "%d" is for printing
>> signed value, and "%u" is for printing unsigned value.
>>
>>
>> Your simple code explained exactly why you are still in confusion,
> Am I?
>
> Take a look at the values, and explain the math.

I meant the value itself is represent with 2's compliment,

when you print a value with '%ld', then you will get the signed version,

when you print a value with '%lu', then you will get the unsigned version.

The result of a u16*u16 couldn't be negative in math.
  

But when you using a '%ld' or '%d' to print a unsigned value, then is wrong.

This is also the case which you shouldn't using a int type to store the result of u16*u16.

because when I seen a int type, I will choose '%d' to print it,

when I seen a unsigned int type, I will choose '%u' to print it.

when using a int type as the return type, this could lead people to using '%d' to print

such a value. Then, it generate the confusion as this little test program shows.

>
> BR,
> Jani.
>
>> that is u16 * u16  can yield a negative value if you use the int as the
>> return type. Because it overflowed.
>>
>>> 	printf("%d\n", x * y);
>>> }
>>>
>>> And it's not that different from what you have below. Your patch doesn't
>>> change anything, and doesn't make it any less confusing.
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>>>>> Using a u32 is enough to store the result, but considering that the
>>>>>> result will be casted to u64 soon after. We use a u64 type directly.
>>>>>> So there no need to cast it to signed type and cast back then.
>>>>> ....
>>>>>> -		int frame_size = mode->crtc_htotal * mode->crtc_vtotal;
>>>>>> +		u64 frame_size = mode->crtc_htotal * mode->crtc_vtotal;
>>>>> ...
>>>>>> -		framedur_ns = div_u64((u64) frame_size * 1000000, dotclock);
>>>>>> +		framedur_ns = div_u64(frame_size * 1000000, dotclock);
>>>>> The (u64) cast is there to extend the value to 64bits, not
>>>>> because the original type is signed.
>>>> Sorry about my expression, I think my sentence did not mention anything
>>>> about 'because the original type is signed'.
>>>>
>>>> In the contrary, my patch eliminated the concerns to the reviewer. It
>>>> say that the results of the multiply can't be negative.
>>>>
>>>> My intent is to tell the compiler we want a unsigned return type, but
>>>> GCC emit 'imul' instruction for the multiply......
>>>>
>>>> I'm using u64 as the return type, because div_u64() function accept a
>>>> u64 type value as its first argument.
>>>>
>>>>> The compiler will detect that the old code is a 32x32 multiply
>>>>> where a 64bit result is needed, that may not be true for the
>>>>> changed code (it would need to track back as far as the u16s).
>>>> I don't believe my code could be wrong.
>>>>
>>>> when you use the word 'may', you are saying that it could be wrong after
>>>> apply my patch.
>>>>
>>>> Then you have to find at least one test example to prove you point, in
>>>> which case my codes generate wrong results.
>>>>
>>>> Again I don't believe you could find one.
>>>>
>>>>> It is not uncommon to force a 64bit result from a multiply
>>>>> by making the constant 64bit. As in:
>>>>> 	div_u64(frame_size * 1000000ULL, dotclock);
>>>> In fact, After apply this patch, the ASM code generated is same with before.
>>>>
>>>> This may because the GCC is smart enough to generate optimized code in
>>>> either case,
>>>>
>>>> I think It could be different with a different optimization-level.
>>>>
>>>> I have tested this patch on three different architecture,  I can not
>>>> find error still.
>>>>
>>>> Below is the assembly extract on x86-64: because GCC generate the same
>>>> code in either case,
>>>>
>>>> so I pasted only one copy here.
>>>>
>>>>
>>>> 0000000000000530 <drm_calc_timestamping_constants>:
>>>>         530:    f3 0f 1e fa              endbr64
>>>>         534:    e8 00 00 00 00           callq  539
>>>> <drm_calc_timestamping_constants+0x9>
>>>>         539:    55                       push   %rbp
>>>>         53a:    48 89 e5                 mov    %rsp,%rbp
>>>>         53d:    41 57                    push   %r15
>>>>         53f:    41 56                    push   %r14
>>>>         541:    41 55                    push   %r13
>>>>         543:    41 54                    push   %r12
>>>>         545:    53                       push   %rbx
>>>>         546:    48 83 ec 18              sub    $0x18,%rsp
>>>>         54a:    4c 8b 3f                 mov    (%rdi),%r15
>>>>         54d:    41 8b 87 6c 01 00 00     mov    0x16c(%r15),%eax
>>>>         554:    85 c0                    test   %eax,%eax
>>>>         556:    0f 84 ec 00 00 00        je     648
>>>> <drm_calc_timestamping_constants+0x118>
>>>>         55c:    44 8b 87 90 00 00 00     mov    0x90(%rdi),%r8d
>>>>         563:    49 89 fc                 mov    %rdi,%r12
>>>>         566:    44 39 c0                 cmp    %r8d,%eax
>>>>         569:    0f 86 40 01 00 00        jbe    6af
>>>> <drm_calc_timestamping_constants+0x17f>
>>>>         56f:    44 8b 76 1c              mov    0x1c(%rsi),%r14d
>>>>         573:    49 8b 8f 40 01 00 00     mov    0x140(%r15),%rcx
>>>>         57a:    48 89 f3                 mov    %rsi,%rbx
>>>>         57d:    45 85 f6                 test   %r14d,%r14d
>>>>         580:    0f 8e d5 00 00 00        jle    65b
>>>> <drm_calc_timestamping_constants+0x12b>
>>>>         586:    0f b7 43 2a              movzwl 0x2a(%rbx),%eax
>>>>         58a:    49 63 f6                 movslq %r14d,%rsi
>>>>         58d:    31 d2                    xor    %edx,%edx
>>>>         58f:    48 89 c7                 mov    %rax,%rdi
>>>>         592:    48 69 c0 40 42 0f 00     imul   $0xf4240,%rax,%rax
>>>>         599:    48 f7 f6                 div    %rsi
>>>>         59c:    31 d2                    xor    %edx,%edx
>>>>         59e:    48 89 45 d0              mov    %rax,-0x30(%rbp)
>>>>         5a2:    0f b7 43 38              movzwl 0x38(%rbx),%eax
>>>>         5a6:    0f af c7                 imul   %edi,%eax
>>>>         5a9:    48 98                    cltq
>>>>         5ab:    48 69 c0 40 42 0f 00     imul   $0xf4240,%rax,%rax
>>>>         5b2:    48 f7 f6                 div    %rsi
>>>>         5b5:    41 89 c5                 mov    %eax,%r13d
>>>>         5b8:    f6 43 18 10              testb  $0x10,0x18(%rbx)
>>>>         5bc:    74 0a                    je     5c8
>>>> <drm_calc_timestamping_constants+0x98>
>>>>         5be:    41 c1 ed 1f              shr    $0x1f,%r13d
>>>>         5c2:    41 01 c5                 add    %eax,%r13d
>>>>         5c5:    41 d1 fd                 sar    %r13d
>>>>         5c8:    4b 8d 04 c0              lea    (%r8,%r8,8),%rax
>>>>         5cc:    48 89 de                 mov    %rbx,%rsi
>>>>         5cf:    49 8d 3c 40              lea    (%r8,%rax,2),%rdi
>>>>         5d3:    8b 45 d0                 mov    -0x30(%rbp),%eax
>>>>         5d6:    48 c1 e7 04              shl    $0x4,%rdi
>>>>         5da:    48 01 cf                 add    %rcx,%rdi
>>>>         5dd:    89 47 78                 mov    %eax,0x78(%rdi)
>>>>         5e0:    48 83 ef 80              sub $0xffffffffffffff80,%rdi
>>>>         5e4:    44 89 6f f4              mov    %r13d,-0xc(%rdi)
>>>>         5e8:    e8 00 00 00 00           callq  5ed
>>>> <drm_calc_timestamping_constants+0xbd>
>>>>         5ed:    0f b7 53 2e              movzwl 0x2e(%rbx),%edx
>>>>         5f1:    0f b7 43 38              movzwl 0x38(%rbx),%eax
>>>>         5f5:    44 0f b7 4b 2a           movzwl 0x2a(%rbx),%r9d
>>>>         5fa:    45 8b 44 24 60           mov    0x60(%r12),%r8d
>>>>         5ff:    4d 85 ff                 test   %r15,%r15
>>>>         602:    0f 84 87 00 00 00        je     68f
>>>> <drm_calc_timestamping_constants+0x15f>
>>>>         608:    49 8b 77 08              mov    0x8(%r15),%rsi
>>>>         60c:    52                       push   %rdx
>>>>         60d:    31 ff                    xor    %edi,%edi
>>>>         60f:    48 c7 c1 00 00 00 00     mov    $0x0,%rcx
>>>>         616:    50                       push   %rax
>>>>         617:    31 d2                    xor    %edx,%edx
>>>>         619:    e8 00 00 00 00           callq  61e
>>>> <drm_calc_timestamping_constants+0xee>
>>>>         61e:    45 8b 44 24 60           mov    0x60(%r12),%r8d
>>>>         623:    4d 8b 7f 08              mov    0x8(%r15),%r15
>>>>         627:    5f                       pop    %rdi
>>>>         628:    41 59                    pop    %r9
>>>>         62a:    8b 45 d0                 mov    -0x30(%rbp),%eax
>>>>         62d:    48 c7 c1 00 00 00 00     mov    $0x0,%rcx
>>>>         634:    4c 89 fe                 mov    %r15,%rsi
>>>>         637:    45 89 f1                 mov    %r14d,%r9d
>>>>         63a:    31 d2                    xor    %edx,%edx
>>>>         63c:    31 ff                    xor    %edi,%edi
>>>>         63e:    50                       push   %rax
>>>>         63f:    41 55                    push   %r13
>>>>         641:    e8 00 00 00 00           callq  646
>>>> <drm_calc_timestamping_constants+0x116>
>>>>         646:    59                       pop    %rcx
>>>>         647:    5e                       pop    %rsi
>>>>         648:    48 8d 65 d8              lea    -0x28(%rbp),%rsp
>>>>         64c:    5b                       pop    %rbx
>>>>         64d:    41 5c                    pop    %r12
>>>>         64f:    41 5d                    pop    %r13
>>>>         651:    41 5e                    pop    %r14
>>>>         653:    41 5f                    pop    %r15
>>>>         655:    5d                       pop    %rbp
>>>>         656:    e9 00 00 00 00           jmpq   65b
>>>> <drm_calc_timestamping_constants+0x12b>
>>>>         65b:    41 8b 54 24 60           mov    0x60(%r12),%edx
>>>>         660:    49 8b 7f 08              mov    0x8(%r15),%rdi
>>>>         664:    44 89 45 c4              mov    %r8d,-0x3c(%rbp)
>>>>         668:    45 31 ed                 xor    %r13d,%r13d
>>>>         66b:    48 c7 c6 00 00 00 00     mov    $0x0,%rsi
>>>>         672:    48 89 4d c8              mov    %rcx,-0x38(%rbp)
>>>>         676:    e8 00 00 00 00           callq  67b
>>>> <drm_calc_timestamping_constants+0x14b>
>>>>         67b:    c7 45 d0 00 00 00 00     movl   $0x0,-0x30(%rbp)
>>>>         682:    44 8b 45 c4              mov    -0x3c(%rbp),%r8d
>>>>         686:    48 8b 4d c8              mov    -0x38(%rbp),%rcx
>>>>         68a:    e9 39 ff ff ff           jmpq   5c8
>>>> <drm_calc_timestamping_constants+0x98>
>>>>         68f:    52                       push   %rdx
>>>>         690:    48 c7 c1 00 00 00 00     mov    $0x0,%rcx
>>>>         697:    31 d2                    xor    %edx,%edx
>>>>         699:    31 f6                    xor    %esi,%esi
>>>>         69b:    50                       push   %rax
>>>>         69c:    31 ff                    xor    %edi,%edi
>>>>         69e:    e8 00 00 00 00           callq  6a3
>>>> <drm_calc_timestamping_constants+0x173>
>>>>         6a3:    45 8b 44 24 60           mov    0x60(%r12),%r8d
>>>>         6a8:    58                       pop    %rax
>>>>         6a9:    5a                       pop    %rdx
>>>>         6aa:    e9 7b ff ff ff           jmpq   62a
>>>> <drm_calc_timestamping_constants+0xfa>
>>>>         6af:    49 8b 7f 08              mov    0x8(%r15),%rdi
>>>>         6b3:    4c 8b 67 50              mov    0x50(%rdi),%r12
>>>>         6b7:    4d 85 e4                 test   %r12,%r12
>>>>         6ba:    74 25                    je     6e1
>>>> <drm_calc_timestamping_constants+0x1b1>
>>>>         6bc:    e8 00 00 00 00           callq  6c1
>>>> <drm_calc_timestamping_constants+0x191>
>>>>         6c1:    48 c7 c1 00 00 00 00     mov    $0x0,%rcx
>>>>         6c8:    4c 89 e2                 mov    %r12,%rdx
>>>>         6cb:    48 c7 c7 00 00 00 00     mov    $0x0,%rdi
>>>>         6d2:    48 89 c6                 mov    %rax,%rsi
>>>>         6d5:    e8 00 00 00 00           callq  6da
>>>> <drm_calc_timestamping_constants+0x1aa>
>>>>         6da:    0f 0b                    ud2
>>>>         6dc:    e9 67 ff ff ff           jmpq   648
>>>> <drm_calc_timestamping_constants+0x118>
>>>>         6e1:    4c 8b 27                 mov    (%rdi),%r12
>>>>         6e4:    eb d6                    jmp    6bc
>>>> <drm_calc_timestamping_constants+0x18c>
>>>>         6e6:    66 2e 0f 1f 84 00 00     nopw   %cs:0x0(%rax,%rax,1)
>>>>         6ed:    00 00 00
>>>>         6f0:    90                       nop
>>>>         6f1:    90                       nop
>>>>         6f2:    90                       nop
>>>>         6f3:    90                       nop
>>>>         6f4:    90                       nop
>>>>         6f5:    90                       nop
>>>>         6f6:    90                       nop
>>>>         6f7:    90                       nop
>>>>         6f8:    90                       nop
>>>>         6f9:    90                       nop
>>>>         6fa:    90                       nop
>>>>         6fb:    90                       nop
>>>>         6fc:    90                       nop
>>>>         6fd:    90                       nop
>>>>         6fe:    90                       nop
>>>>         6ff:    90                       nop
>>>>
>>>>
>>>>> 	David
>>>>>
>>>>> -
>>>>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
>>>>> Registration No: 1397386 (Wales)
>>>>>
