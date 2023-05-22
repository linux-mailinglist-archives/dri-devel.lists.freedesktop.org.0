Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B577C70BBD0
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCC310E2D4;
	Mon, 22 May 2023 11:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1EE10E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684754998; x=1716290998;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2vE1vxkZ/yDG2sKIbrPGCWDmnck+2hrLFnlbeMqrGW4=;
 b=TqhCXrO9ac+0iVhyASGxBMB9W98nUnod0mBO8lva68Y6FnoEyNZIvOy+
 IvnxMWrOo6gEJW+8o14sho3EXk72VOp+Lr0eJnv5TsRAm5A7EfOQ7apx9
 P6RgKLC5kVcoTIl+OirifPKK5whaYZhBji6EtIThK1sCIU/jexwnyFvLH
 XQbDqaK7+PcssE4Q89q/KGIheD+TB+OFkNO7VnzA7o2LuOEpzGocKx7nb
 F7hOOi4Hp1J2EsWaDkwOUIVxKVxFtK3y6ScBDsqlm70EQjZsleFeEly3l
 ZPQUauhgpOj350XaGyYtk1Bsp9dkeXxMk6kYL3o6Y3eFoS8zTMIX7NvaL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="416356598"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="416356598"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="703467971"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="703467971"
Received: from andreipo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.228])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:29:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <15330273260@189.cn>, David Laight
 <David.Laight@ACULAB.COM>, Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi
 <liyi@loongson.cn>
Subject: Re: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
In-Reply-To: <b23c41b1-e177-c81d-5327-fce5511cb97d@189.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230516173026.2990705-1-15330273260@189.cn>
 <f6bd362145124f34a1af800dd330f8e9@AcuMS.aculab.com>
 <b23c41b1-e177-c81d-5327-fce5511cb97d@189.cn>
Date: Mon, 22 May 2023 14:29:52 +0300
Message-ID: <871qj8ob7z.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 18 May 2023, Sui Jingfeng <15330273260@189.cn> wrote:
> On 2023/5/17 18:59, David Laight wrote:
>> From: 15330273260@189.cn
>>> Sent: 16 May 2023 18:30
>>>
>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>
>>> Both mode->crtc_htotal and mode->crtc_vtotal are u16 type,
>>> mode->crtc_htotal * mode->crtc_vtotal will results a unsigned type.
>> Nope, u16 gets promoted to 'signed int' and the result of the
>> multiply is also signed.
>
> I believe that signed or unsigned is dependent on the declaration.
>
> I am talk about the math, while you are talking about compiler.
>
> I admit that u16 gets promoted to 'signed int' is true, but this is=20
> irrelevant,
>
> the point is how to understand the returned value.
>
>
> How does the compiler generate the code is one thing, how do we=20
> interpret the result is another
>
> How does the compiler generate the code is NOT determined by us, while=20
> how do we interpret the result is determined by us.
>
>
> I believe that using a u32 type to interpret the result(u16 * u16) is=20
> always true, it is true in the perspective of *math*.
>
> Integer promotions is the details of C program language. If the result=20
> of the multiply is signed, then there are risks that
>
> the result is negative, what's the benefit to present this risk to the=20
> programmer?
>
> What's the benefit to tell me(and others) that u16 * u16 yield a signed=20
> value? and can be negative?
>
> Using int type as the return type bring concerns to the programmer and=20
> the user of the function,
>
> even though this is not impossible in practice.

In general, do not use unsigned types in arithmethic to avoid negative
values, because most people will be tripped over by integer promotion
rules, and you'll get negative values anyway.

I'll bet most people will be surprised to see what this prints:

#include <stdio.h>
#include <stdint.h>

int main(void)
{
	uint16_t x =3D 0xffff;
	uint16_t y =3D 0xffff;
	uint64_t z =3D x * y;

	printf("0x%016lx\n", z);
	printf("%ld\n", z);
	printf("%d\n", x * y);
}

And it's not that different from what you have below. Your patch doesn't
change anything, and doesn't make it any less confusing.

BR,
Jani.


>
>>> Using a u32 is enough to store the result, but considering that the
>>> result will be casted to u64 soon after. We use a u64 type directly.
>>> So there no need to cast it to signed type and cast back then.
>> ....
>>> -		int frame_size =3D mode->crtc_htotal * mode->crtc_vtotal;
>>> +		u64 frame_size =3D mode->crtc_htotal * mode->crtc_vtotal;
>> ...
>>> -		framedur_ns =3D div_u64((u64) frame_size * 1000000, dotclock);
>>> +		framedur_ns =3D div_u64(frame_size * 1000000, dotclock);
>> The (u64) cast is there to extend the value to 64bits, not
>> because the original type is signed.
>
> Sorry about my expression, I think my sentence did not mention anything=20
> about 'because the original type is signed'.
>
> In the contrary, my patch eliminated the concerns to the reviewer. It=20
> say that the results of the multiply can't be negative.
>
> My intent is to tell the compiler we want a unsigned return type, but=20
> GCC emit 'imul' instruction for the multiply......
>
> I'm using u64 as the return type, because div_u64() function accept a=20
> u64 type value as its first argument.
>
>> The compiler will detect that the old code is a 32x32 multiply
>> where a 64bit result is needed, that may not be true for the
>> changed code (it would need to track back as far as the u16s).
>
> I don't believe my code could be wrong.
>
> when you use the word 'may', you are saying that it could be wrong after=
=20
> apply my patch.
>
> Then you have to find at least one test example to prove you point, in=20
> which case my codes generate wrong results.
>
> Again I don't believe you could find one.
>
>> It is not uncommon to force a 64bit result from a multiply
>> by making the constant 64bit. As in:
>> 	div_u64(frame_size * 1000000ULL, dotclock);
>
> In fact, After apply this patch, the ASM code generated is same with befo=
re.
>
> This may because the GCC is smart enough to generate optimized code in=20
> either case,
>
> I think It could be different with a different optimization-level.
>
> I have tested this patch on three different architecture,=C2=A0 I can not=
=20
> find error still.
>
> Below is the assembly extract on x86-64: because GCC generate the same=20
> code in either case,
>
> so I pasted only one copy here.
>
>
> 0000000000000530 <drm_calc_timestamping_constants>:
>  =C2=A0=C2=A0=C2=A0=C2=A0 530:=C2=A0=C2=A0=C2=A0 f3 0f 1e fa=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 endbr64
>  =C2=A0=C2=A0=C2=A0=C2=A0 534:=C2=A0=C2=A0=C2=A0 e8 00 00 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 callq=C2=A0 539=20
> <drm_calc_timestamping_constants+0x9>
>  =C2=A0=C2=A0=C2=A0=C2=A0 539:=C2=A0=C2=A0=C2=A0 55=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %rbp
>  =C2=A0=C2=A0=C2=A0=C2=A0 53a:=C2=A0=C2=A0=C2=A0 48 89 e5=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %rsp,%rbp
>  =C2=A0=C2=A0=C2=A0=C2=A0 53d:=C2=A0=C2=A0=C2=A0 41 57=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %r15
>  =C2=A0=C2=A0=C2=A0=C2=A0 53f:=C2=A0=C2=A0=C2=A0 41 56=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %r14
>  =C2=A0=C2=A0=C2=A0=C2=A0 541:=C2=A0=C2=A0=C2=A0 41 55=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %r13
>  =C2=A0=C2=A0=C2=A0=C2=A0 543:=C2=A0=C2=A0=C2=A0 41 54=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %r12
>  =C2=A0=C2=A0=C2=A0=C2=A0 545:=C2=A0=C2=A0=C2=A0 53=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %rbx
>  =C2=A0=C2=A0=C2=A0=C2=A0 546:=C2=A0=C2=A0=C2=A0 48 83 ec 18=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 sub=C2=A0=C2=
=A0=C2=A0 $0x18,%rsp
>  =C2=A0=C2=A0=C2=A0=C2=A0 54a:=C2=A0=C2=A0=C2=A0 4c 8b 3f=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 (%rdi),%r15
>  =C2=A0=C2=A0=C2=A0=C2=A0 54d:=C2=A0=C2=A0=C2=A0 41 8b 87 6c 01 00 00 =C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 0x16c(%r15),%eax
>  =C2=A0=C2=A0=C2=A0=C2=A0 554:=C2=A0=C2=A0=C2=A0 85 c0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 test=C2=A0=C2=A0 %eax,%eax
>  =C2=A0=C2=A0=C2=A0=C2=A0 556:=C2=A0=C2=A0=C2=A0 0f 84 ec 00 00 00=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 648=20
> <drm_calc_timestamping_constants+0x118>
>  =C2=A0=C2=A0=C2=A0=C2=A0 55c:=C2=A0=C2=A0=C2=A0 44 8b 87 90 00 00 00 =C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 0x90(%rdi),%r8d
>  =C2=A0=C2=A0=C2=A0=C2=A0 563:=C2=A0=C2=A0=C2=A0 49 89 fc=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %rdi,%r12
>  =C2=A0=C2=A0=C2=A0=C2=A0 566:=C2=A0=C2=A0=C2=A0 44 39 c0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 cmp=C2=A0=C2=A0=C2=A0 %r8d,%eax
>  =C2=A0=C2=A0=C2=A0=C2=A0 569:=C2=A0=C2=A0=C2=A0 0f 86 40 01 00 00=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 jbe=C2=A0=C2=A0=C2=A0 6af=20
> <drm_calc_timestamping_constants+0x17f>
>  =C2=A0=C2=A0=C2=A0=C2=A0 56f:=C2=A0=C2=A0=C2=A0 44 8b 76 1c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 0x1c(%rsi),%r14d
>  =C2=A0=C2=A0=C2=A0=C2=A0 573:=C2=A0=C2=A0=C2=A0 49 8b 8f 40 01 00 00 =C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 0x140(%r15),%rcx
>  =C2=A0=C2=A0=C2=A0=C2=A0 57a:=C2=A0=C2=A0=C2=A0 48 89 f3=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %rsi,%rbx
>  =C2=A0=C2=A0=C2=A0=C2=A0 57d:=C2=A0=C2=A0=C2=A0 45 85 f6=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 test=C2=A0=C2=A0 %r14d,%r14d
>  =C2=A0=C2=A0=C2=A0=C2=A0 580:=C2=A0=C2=A0=C2=A0 0f 8e d5 00 00 00=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 jle=C2=A0=C2=A0=C2=A0 65b=20
> <drm_calc_timestamping_constants+0x12b>
>  =C2=A0=C2=A0=C2=A0=C2=A0 586:=C2=A0=C2=A0=C2=A0 0f b7 43 2a=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 movzwl 0x2a(%=
rbx),%eax
>  =C2=A0=C2=A0=C2=A0=C2=A0 58a:=C2=A0=C2=A0=C2=A0 49 63 f6=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 movslq %r14d,%rsi
>  =C2=A0=C2=A0=C2=A0=C2=A0 58d:=C2=A0=C2=A0=C2=A0 31 d2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 %edx,%edx
>  =C2=A0=C2=A0=C2=A0=C2=A0 58f:=C2=A0=C2=A0=C2=A0 48 89 c7=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %rax,%rdi
>  =C2=A0=C2=A0=C2=A0=C2=A0 592:=C2=A0=C2=A0=C2=A0 48 69 c0 40 42 0f 00 =C2=
=A0=C2=A0=C2=A0 imul=C2=A0=C2=A0 $0xf4240,%rax,%rax
>  =C2=A0=C2=A0=C2=A0=C2=A0 599:=C2=A0=C2=A0=C2=A0 48 f7 f6=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 div=C2=A0=C2=A0=C2=A0 %rsi
>  =C2=A0=C2=A0=C2=A0=C2=A0 59c:=C2=A0=C2=A0=C2=A0 31 d2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 %edx,%edx
>  =C2=A0=C2=A0=C2=A0=C2=A0 59e:=C2=A0=C2=A0=C2=A0 48 89 45 d0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 %rax,-0x30(%rbp)
>  =C2=A0=C2=A0=C2=A0=C2=A0 5a2:=C2=A0=C2=A0=C2=A0 0f b7 43 38=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 movzwl 0x38(%=
rbx),%eax
>  =C2=A0=C2=A0=C2=A0=C2=A0 5a6:=C2=A0=C2=A0=C2=A0 0f af c7=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 imul=C2=A0=C2=A0 %edi,%eax
>  =C2=A0=C2=A0=C2=A0=C2=A0 5a9:=C2=A0=C2=A0=C2=A0 48 98=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 cltq
>  =C2=A0=C2=A0=C2=A0=C2=A0 5ab:=C2=A0=C2=A0=C2=A0 48 69 c0 40 42 0f 00 =C2=
=A0=C2=A0=C2=A0 imul=C2=A0=C2=A0 $0xf4240,%rax,%rax
>  =C2=A0=C2=A0=C2=A0=C2=A0 5b2:=C2=A0=C2=A0=C2=A0 48 f7 f6=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 div=C2=A0=C2=A0=C2=A0 %rsi
>  =C2=A0=C2=A0=C2=A0=C2=A0 5b5:=C2=A0=C2=A0=C2=A0 41 89 c5=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %eax,%r13d
>  =C2=A0=C2=A0=C2=A0=C2=A0 5b8:=C2=A0=C2=A0=C2=A0 f6 43 18 10=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 testb=C2=A0 $=
0x10,0x18(%rbx)
>  =C2=A0=C2=A0=C2=A0=C2=A0 5bc:=C2=A0=C2=A0=C2=A0 74 0a=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 5c8=20
> <drm_calc_timestamping_constants+0x98>
>  =C2=A0=C2=A0=C2=A0=C2=A0 5be:=C2=A0=C2=A0=C2=A0 41 c1 ed 1f=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 shr=C2=A0=C2=
=A0=C2=A0 $0x1f,%r13d
>  =C2=A0=C2=A0=C2=A0=C2=A0 5c2:=C2=A0=C2=A0=C2=A0 41 01 c5=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 add=C2=A0=C2=A0=C2=A0 %eax,%r13d
>  =C2=A0=C2=A0=C2=A0=C2=A0 5c5:=C2=A0=C2=A0=C2=A0 41 d1 fd=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 sar=C2=A0=C2=A0=C2=A0 %r13d
>  =C2=A0=C2=A0=C2=A0=C2=A0 5c8:=C2=A0=C2=A0=C2=A0 4b 8d 04 c0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 lea=C2=A0=C2=
=A0=C2=A0 (%r8,%r8,8),%rax
>  =C2=A0=C2=A0=C2=A0=C2=A0 5cc:=C2=A0=C2=A0=C2=A0 48 89 de=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %rbx,%rsi
>  =C2=A0=C2=A0=C2=A0=C2=A0 5cf:=C2=A0=C2=A0=C2=A0 49 8d 3c 40=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 lea=C2=A0=C2=
=A0=C2=A0 (%r8,%rax,2),%rdi
>  =C2=A0=C2=A0=C2=A0=C2=A0 5d3:=C2=A0=C2=A0=C2=A0 8b 45 d0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 -0x30(%rbp),%eax
>  =C2=A0=C2=A0=C2=A0=C2=A0 5d6:=C2=A0=C2=A0=C2=A0 48 c1 e7 04=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 shl=C2=A0=C2=
=A0=C2=A0 $0x4,%rdi
>  =C2=A0=C2=A0=C2=A0=C2=A0 5da:=C2=A0=C2=A0=C2=A0 48 01 cf=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 add=C2=A0=C2=A0=C2=A0 %rcx,%rdi
>  =C2=A0=C2=A0=C2=A0=C2=A0 5dd:=C2=A0=C2=A0=C2=A0 89 47 78=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %eax,0x78(%rdi)
>  =C2=A0=C2=A0=C2=A0=C2=A0 5e0:=C2=A0=C2=A0=C2=A0 48 83 ef 80=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 sub $0xffffff=
ffffffff80,%rdi
>  =C2=A0=C2=A0=C2=A0=C2=A0 5e4:=C2=A0=C2=A0=C2=A0 44 89 6f f4=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 %r13d,-0xc(%rdi)
>  =C2=A0=C2=A0=C2=A0=C2=A0 5e8:=C2=A0=C2=A0=C2=A0 e8 00 00 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 callq=C2=A0 5ed=20
> <drm_calc_timestamping_constants+0xbd>
>  =C2=A0=C2=A0=C2=A0=C2=A0 5ed:=C2=A0=C2=A0=C2=A0 0f b7 53 2e=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 movzwl 0x2e(%=
rbx),%edx
>  =C2=A0=C2=A0=C2=A0=C2=A0 5f1:=C2=A0=C2=A0=C2=A0 0f b7 43 38=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 movzwl 0x38(%=
rbx),%eax
>  =C2=A0=C2=A0=C2=A0=C2=A0 5f5:=C2=A0=C2=A0=C2=A0 44 0f b7 4b 2a=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 movzwl 0x2a(%rbx),%r9d
>  =C2=A0=C2=A0=C2=A0=C2=A0 5fa:=C2=A0=C2=A0=C2=A0 45 8b 44 24 60=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 0x60(%=
r12),%r8d
>  =C2=A0=C2=A0=C2=A0=C2=A0 5ff:=C2=A0=C2=A0=C2=A0 4d 85 ff=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 test=C2=A0=C2=A0 %r15,%r15
>  =C2=A0=C2=A0=C2=A0=C2=A0 602:=C2=A0=C2=A0=C2=A0 0f 84 87 00 00 00=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 68f=20
> <drm_calc_timestamping_constants+0x15f>
>  =C2=A0=C2=A0=C2=A0=C2=A0 608:=C2=A0=C2=A0=C2=A0 49 8b 77 08=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 0x8(%r15),%rsi
>  =C2=A0=C2=A0=C2=A0=C2=A0 60c:=C2=A0=C2=A0=C2=A0 52=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %rdx
>  =C2=A0=C2=A0=C2=A0=C2=A0 60d:=C2=A0=C2=A0=C2=A0 31 ff=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 %edi,%edi
>  =C2=A0=C2=A0=C2=A0=C2=A0 60f:=C2=A0=C2=A0=C2=A0 48 c7 c1 00 00 00 00 =C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x0,%rcx
>  =C2=A0=C2=A0=C2=A0=C2=A0 616:=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %rax
>  =C2=A0=C2=A0=C2=A0=C2=A0 617:=C2=A0=C2=A0=C2=A0 31 d2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 %edx,%edx
>  =C2=A0=C2=A0=C2=A0=C2=A0 619:=C2=A0=C2=A0=C2=A0 e8 00 00 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 callq=C2=A0 61e=20
> <drm_calc_timestamping_constants+0xee>
>  =C2=A0=C2=A0=C2=A0=C2=A0 61e:=C2=A0=C2=A0=C2=A0 45 8b 44 24 60=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 0x60(%=
r12),%r8d
>  =C2=A0=C2=A0=C2=A0=C2=A0 623:=C2=A0=C2=A0=C2=A0 4d 8b 7f 08=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 0x8(%r15),%r15
>  =C2=A0=C2=A0=C2=A0=C2=A0 627:=C2=A0=C2=A0=C2=A0 5f=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rdi
>  =C2=A0=C2=A0=C2=A0=C2=A0 628:=C2=A0=C2=A0=C2=A0 41 59=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %r9
>  =C2=A0=C2=A0=C2=A0=C2=A0 62a:=C2=A0=C2=A0=C2=A0 8b 45 d0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 -0x30(%rbp),%eax
>  =C2=A0=C2=A0=C2=A0=C2=A0 62d:=C2=A0=C2=A0=C2=A0 48 c7 c1 00 00 00 00 =C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x0,%rcx
>  =C2=A0=C2=A0=C2=A0=C2=A0 634:=C2=A0=C2=A0=C2=A0 4c 89 fe=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %r15,%rsi
>  =C2=A0=C2=A0=C2=A0=C2=A0 637:=C2=A0=C2=A0=C2=A0 45 89 f1=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %r14d,%r9d
>  =C2=A0=C2=A0=C2=A0=C2=A0 63a:=C2=A0=C2=A0=C2=A0 31 d2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 %edx,%edx
>  =C2=A0=C2=A0=C2=A0=C2=A0 63c:=C2=A0=C2=A0=C2=A0 31 ff=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 %edi,%edi
>  =C2=A0=C2=A0=C2=A0=C2=A0 63e:=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %rax
>  =C2=A0=C2=A0=C2=A0=C2=A0 63f:=C2=A0=C2=A0=C2=A0 41 55=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %r13
>  =C2=A0=C2=A0=C2=A0=C2=A0 641:=C2=A0=C2=A0=C2=A0 e8 00 00 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 callq=C2=A0 646=20
> <drm_calc_timestamping_constants+0x116>
>  =C2=A0=C2=A0=C2=A0=C2=A0 646:=C2=A0=C2=A0=C2=A0 59=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rcx
>  =C2=A0=C2=A0=C2=A0=C2=A0 647:=C2=A0=C2=A0=C2=A0 5e=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rsi
>  =C2=A0=C2=A0=C2=A0=C2=A0 648:=C2=A0=C2=A0=C2=A0 48 8d 65 d8=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 lea=C2=A0=C2=
=A0=C2=A0 -0x28(%rbp),%rsp
>  =C2=A0=C2=A0=C2=A0=C2=A0 64c:=C2=A0=C2=A0=C2=A0 5b=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rbx
>  =C2=A0=C2=A0=C2=A0=C2=A0 64d:=C2=A0=C2=A0=C2=A0 41 5c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %r12
>  =C2=A0=C2=A0=C2=A0=C2=A0 64f:=C2=A0=C2=A0=C2=A0 41 5d=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %r13
>  =C2=A0=C2=A0=C2=A0=C2=A0 651:=C2=A0=C2=A0=C2=A0 41 5e=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %r14
>  =C2=A0=C2=A0=C2=A0=C2=A0 653:=C2=A0=C2=A0=C2=A0 41 5f=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %r15
>  =C2=A0=C2=A0=C2=A0=C2=A0 655:=C2=A0=C2=A0=C2=A0 5d=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rbp
>  =C2=A0=C2=A0=C2=A0=C2=A0 656:=C2=A0=C2=A0=C2=A0 e9 00 00 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 jmpq=C2=A0=C2=A0 65b=20
> <drm_calc_timestamping_constants+0x12b>
>  =C2=A0=C2=A0=C2=A0=C2=A0 65b:=C2=A0=C2=A0=C2=A0 41 8b 54 24 60=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 0x60(%=
r12),%edx
>  =C2=A0=C2=A0=C2=A0=C2=A0 660:=C2=A0=C2=A0=C2=A0 49 8b 7f 08=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 0x8(%r15),%rdi
>  =C2=A0=C2=A0=C2=A0=C2=A0 664:=C2=A0=C2=A0=C2=A0 44 89 45 c4=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 %r8d,-0x3c(%rbp)
>  =C2=A0=C2=A0=C2=A0=C2=A0 668:=C2=A0=C2=A0=C2=A0 45 31 ed=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 xor=C2=A0=C2=A0=C2=A0 %r13d,%r13d
>  =C2=A0=C2=A0=C2=A0=C2=A0 66b:=C2=A0=C2=A0=C2=A0 48 c7 c6 00 00 00 00 =C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x0,%rsi
>  =C2=A0=C2=A0=C2=A0=C2=A0 672:=C2=A0=C2=A0=C2=A0 48 89 4d c8=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 %rcx,-0x38(%rbp)
>  =C2=A0=C2=A0=C2=A0=C2=A0 676:=C2=A0=C2=A0=C2=A0 e8 00 00 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 callq=C2=A0 67b=20
> <drm_calc_timestamping_constants+0x14b>
>  =C2=A0=C2=A0=C2=A0=C2=A0 67b:=C2=A0=C2=A0=C2=A0 c7 45 d0 00 00 00 00 =C2=
=A0=C2=A0=C2=A0 movl=C2=A0=C2=A0 $0x0,-0x30(%rbp)
>  =C2=A0=C2=A0=C2=A0=C2=A0 682:=C2=A0=C2=A0=C2=A0 44 8b 45 c4=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 -0x3c(%rbp),%r8d
>  =C2=A0=C2=A0=C2=A0=C2=A0 686:=C2=A0=C2=A0=C2=A0 48 8b 4d c8=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 -0x38(%rbp),%rcx
>  =C2=A0=C2=A0=C2=A0=C2=A0 68a:=C2=A0=C2=A0=C2=A0 e9 39 ff ff ff=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 jmpq=C2=A0=C2=A0 5c8=20
> <drm_calc_timestamping_constants+0x98>
>  =C2=A0=C2=A0=C2=A0=C2=A0 68f:=C2=A0=C2=A0=C2=A0 52=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %rdx
>  =C2=A0=C2=A0=C2=A0=C2=A0 690:=C2=A0=C2=A0=C2=A0 48 c7 c1 00 00 00 00 =C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x0,%rcx
>  =C2=A0=C2=A0=C2=A0=C2=A0 697:=C2=A0=C2=A0=C2=A0 31 d2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 %edx,%edx
>  =C2=A0=C2=A0=C2=A0=C2=A0 699:=C2=A0=C2=A0=C2=A0 31 f6=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 %esi,%esi
>  =C2=A0=C2=A0=C2=A0=C2=A0 69b:=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 push=C2=A0=C2=A0 %rax
>  =C2=A0=C2=A0=C2=A0=C2=A0 69c:=C2=A0=C2=A0=C2=A0 31 ff=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 %edi,%edi
>  =C2=A0=C2=A0=C2=A0=C2=A0 69e:=C2=A0=C2=A0=C2=A0 e8 00 00 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 callq=C2=A0 6a3=20
> <drm_calc_timestamping_constants+0x173>
>  =C2=A0=C2=A0=C2=A0=C2=A0 6a3:=C2=A0=C2=A0=C2=A0 45 8b 44 24 60=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 0x60(%=
r12),%r8d
>  =C2=A0=C2=A0=C2=A0=C2=A0 6a8:=C2=A0=C2=A0=C2=A0 58=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rax
>  =C2=A0=C2=A0=C2=A0=C2=A0 6a9:=C2=A0=C2=A0=C2=A0 5a=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rdx
>  =C2=A0=C2=A0=C2=A0=C2=A0 6aa:=C2=A0=C2=A0=C2=A0 e9 7b ff ff ff=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 jmpq=C2=A0=C2=A0 62a=20
> <drm_calc_timestamping_constants+0xfa>
>  =C2=A0=C2=A0=C2=A0=C2=A0 6af:=C2=A0=C2=A0=C2=A0 49 8b 7f 08=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 0x8(%r15),%rdi
>  =C2=A0=C2=A0=C2=A0=C2=A0 6b3:=C2=A0=C2=A0=C2=A0 4c 8b 67 50=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 0x50(%rdi),%r12
>  =C2=A0=C2=A0=C2=A0=C2=A0 6b7:=C2=A0=C2=A0=C2=A0 4d 85 e4=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 test=C2=A0=C2=A0 %r12,%r12
>  =C2=A0=C2=A0=C2=A0=C2=A0 6ba:=C2=A0=C2=A0=C2=A0 74 25=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 6e1=20
> <drm_calc_timestamping_constants+0x1b1>
>  =C2=A0=C2=A0=C2=A0=C2=A0 6bc:=C2=A0=C2=A0=C2=A0 e8 00 00 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 callq=C2=A0 6c1=20
> <drm_calc_timestamping_constants+0x191>
>  =C2=A0=C2=A0=C2=A0=C2=A0 6c1:=C2=A0=C2=A0=C2=A0 48 c7 c1 00 00 00 00 =C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x0,%rcx
>  =C2=A0=C2=A0=C2=A0=C2=A0 6c8:=C2=A0=C2=A0=C2=A0 4c 89 e2=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %r12,%rdx
>  =C2=A0=C2=A0=C2=A0=C2=A0 6cb:=C2=A0=C2=A0=C2=A0 48 c7 c7 00 00 00 00 =C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x0,%rdi
>  =C2=A0=C2=A0=C2=A0=C2=A0 6d2:=C2=A0=C2=A0=C2=A0 48 89 c6=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 %rax,%rsi
>  =C2=A0=C2=A0=C2=A0=C2=A0 6d5:=C2=A0=C2=A0=C2=A0 e8 00 00 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 callq=C2=A0 6da=20
> <drm_calc_timestamping_constants+0x1aa>
>  =C2=A0=C2=A0=C2=A0=C2=A0 6da:=C2=A0=C2=A0=C2=A0 0f 0b=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 ud2
>  =C2=A0=C2=A0=C2=A0=C2=A0 6dc:=C2=A0=C2=A0=C2=A0 e9 67 ff ff ff=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 jmpq=C2=A0=C2=A0 648=20
> <drm_calc_timestamping_constants+0x118>
>  =C2=A0=C2=A0=C2=A0=C2=A0 6e1:=C2=A0=C2=A0=C2=A0 4c 8b 27=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mov=C2=A0=C2=A0=C2=A0 (%rdi),%r12
>  =C2=A0=C2=A0=C2=A0=C2=A0 6e4:=C2=A0=C2=A0=C2=A0 eb d6=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 jmp=C2=A0=C2=A0=C2=A0 6bc=20
> <drm_calc_timestamping_constants+0x18c>
>  =C2=A0=C2=A0=C2=A0=C2=A0 6e6:=C2=A0=C2=A0=C2=A0 66 2e 0f 1f 84 00 00 =C2=
=A0=C2=A0=C2=A0 nopw=C2=A0=C2=A0 %cs:0x0(%rax,%rax,1)
>  =C2=A0=C2=A0=C2=A0=C2=A0 6ed:=C2=A0=C2=A0=C2=A0 00 00 00
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f0:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f1:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f2:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f3:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f4:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f5:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f6:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f7:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f8:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6f9:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6fa:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6fb:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6fc:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6fd:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6fe:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>  =C2=A0=C2=A0=C2=A0=C2=A0 6ff:=C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nop
>
>
>> 	David
>>
>> -
>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK=
1 1PT, UK
>> Registration No: 1397386 (Wales)
>>

--=20
Jani Nikula, Intel Open Source Graphics Center
