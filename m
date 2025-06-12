Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C507EAD7487
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FBB10E873;
	Thu, 12 Jun 2025 14:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J/E2HA9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E6510E0B7;
 Thu, 12 Jun 2025 14:49:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AEAF1629ED;
 Thu, 12 Jun 2025 14:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC4DC4CEEA;
 Thu, 12 Jun 2025 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749739793;
 bh=L/jFare2boLHM3Kq6L91Q4VeAxtvN/LGMzDtRx0819M=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=J/E2HA9s+Gv2XQt44E1rcH8TsrQ2039YhyGWKu4sI97tcsLJ5Xna7KWXQ8Z/c0YUJ
 xMmFvXktxdY/ialgAkjoNj3tv8c2qMeDxJ/FmAgKvbvEEISKvFBhTgX1Zsr185J+XV
 b3hNaY/pO/YSbYGCxqy/bBoeLFzXs+/KZxPUlBmJgngpqdUntJAjp8Dy+cY0yD8/Yz
 5gNmhVHJJz/4NqDy0YrtiIsYAV2wblXrPp+J5Ea0VTqaMpMnofBMxDiTbWBnoPidNK
 dZWsACxi2f+081VDZB+JPJLoSORN0qMr6ijHaACkuMUhp4gRgXZlY9ZUjjunNcN7jf
 rc7od4Q+pPR8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 16:49:46 +0200
Message-Id: <DAKMZL839IBG.1D43UR9NNWZSM@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
 <DAC2L6ZKR6U2.WOMERUJIOENK@nvidia.com>
 <DAD9TNUBUGPN.1ED519FYR29U4@kernel.org>
 <DADB6892Z31G.12LB1BVSGTEAQ@nvidia.com>
 <DADKDQ1KGJJP.3T20P9V1D2PO1@kernel.org>
 <DAKL0KOWUB1G.1DSJPRWFYC43O@nvidia.com>
 <DAKL8NQBUGH5.Y8YJIAYDWL3F@nvidia.com>
In-Reply-To: <DAKL8NQBUGH5.Y8YJIAYDWL3F@nvidia.com>
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

On Thu Jun 12, 2025 at 3:27 PM CEST, Alexandre Courbot wrote:
> On Thu Jun 12, 2025 at 10:17 PM JST, Alexandre Courbot wrote:
>> On Wed Jun 4, 2025 at 4:18 PM JST, Benno Lossin wrote:
>>> On Wed Jun 4, 2025 at 2:05 AM CEST, Alexandre Courbot wrote:
>>>> On Wed Jun 4, 2025 at 8:02 AM JST, Benno Lossin wrote:
>>>>> On Mon Jun 2, 2025 at 3:09 PM CEST, Alexandre Courbot wrote:
>>>>>> On Thu May 29, 2025 at 4:27 PM JST, Benno Lossin wrote:
>>>>>>> On Thu May 29, 2025 at 3:18 AM CEST, Alexandre Courbot wrote:
>>>>>>>> On Thu May 29, 2025 at 5:17 AM JST, Benno Lossin wrote:
>>>>>>>>> On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
>>>>>>>>>> +    /// Align `self` up to `alignment`.
>>>>>>>>>> +    ///
>>>>>>>>>> +    /// `alignment` must be a power of 2 for accurate results.
>>>>>>>>>> +    ///
>>>>>>>>>> +    /// Wraps around to `0` if the requested alignment pushes t=
he result above the type's limits.
>>>>>>>>>> +    ///
>>>>>>>>>> +    /// # Examples
>>>>>>>>>> +    ///
>>>>>>>>>> +    /// ```
>>>>>>>>>> +    /// use kernel::num::NumExt;
>>>>>>>>>> +    ///
>>>>>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>>>>>>>>>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>>>>>>>>>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>>>>>>>>>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>>>>>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>>>>>>>>>> +    /// ```
>>>>>>>>>> +    fn align_up(self, alignment: Self) -> Self;
>>>>>>>>>
>>>>>>>>> Isn't this `next_multiple_of` [1] (it also allows non power of 2
>>>>>>>>> inputs).
>>>>>>>>>
>>>>>>>>> [1]: https://doc.rust-lang.org/std/primitive.u32.html#method.next=
_multiple_of
>>>>>>>>
>>>>>>>> It is, however the fact that `next_multiple_of` works with non pow=
ers of
>>>>>>>> two also means it needs to perform a modulo operation. That operat=
ion
>>>>>>>> might well be optimized away by the compiler, but ACAICT we have n=
o way
>>>>>>>> of proving it will always be the case, hence the always-optimal
>>>>>>>> implementation here.
>>>>>>>
>>>>>>> When you use a power of 2 constant, then I'm very sure that it will=
 get
>>>>>>> optimized [1]. Even with non-powers of 2, you don't get a division =
[2].
>>>>>>> If you find some code that is not optimized, then sure add a custom
>>>>>>> function.
>>>>>>>
>>>>>>> [1]: https://godbolt.org/z/57M9e36T3
>>>>>>> [2]: https://godbolt.org/z/9P4P8zExh
>>>>>>
>>>>>> That's impressive and would definitely work well with a constant. Bu=
t
>>>>>> when the value is not known at compile-time, the division does occur
>>>>>> unfortunately: https://godbolt.org/z/WK1bPMeEx
>>>>>>
>>>>>> So I think we will still need a kernel-optimized version of these
>>>>>> alignment functions.
>>>>>
>>>>> Hmm what exactly is the use-case for a variable align amount? Could y=
ou
>>>>> store it in const generics?
>>>>
>>>> Say you have an IOMMU with support for different pages sizes, the size
>>>> of a particular page can be decided at runtime.
>>>>
>>>>>
>>>>> If not, there are also these two variants that are more efficient:
>>>>>
>>>>> * option: https://godbolt.org/z/ecnb19zaM
>>>>> * unsafe: https://godbolt.org/z/EqTaGov71
>>>>>
>>>>> So if the compiler can infer it from context it still optimizes it :)
>>>>
>>>> I think the `Option` (and subsequent `unwrap`) is something we want to
>>>> avoid on such a common operation.
>>>
>>> Makes sense.
>>>
>>>>> But yeah to be extra sure, you need your version. By the way, what
>>>>> happens if `align` is not a power of 2 in your version?
>>>>
>>>> It will just return `(self + (self - 1)) & (alignment - 1)`, which wil=
l
>>>> likely be a value you don't want.
>>>
>>> So wouldn't it be better to make users validate that they gave a
>>> power-of-2 alignment?
>>>
>>>> So yes, for this particular operation we would prefer to only use powe=
rs
>>>> of 2 as inputs - if we can ensure that then it solves most of our
>>>> problems (can use `next_multiple_of`, no `Option`, etc).
>>>>
>>>> Maybe we can introduce a new integer type that, similarly to `NonZero`=
,
>>>> guarantees that the value it stores is a power of 2? Users with const
>>>> values (90+% of uses) won't see any difference, and if working with a
>>>> runtime-generated value we will want to validate it anyway...
>>>
>>> I like this idea. But it will mean that we have to have a custom
>>> function that is either standalone and const or in an extension trait :=
(
>>> But for this one we can use the name `align_up` :)
>>>
>>> Here is a cool idea for the implementation: https://godbolt.org/z/x6nav=
M5WK
>>
>> Yeah that's close to what I had in mind. Actually, we can also define
>> `align_up` and `align_down` within this new type, and these methods can
>> now be const since they are not implemented via a trait!

That sounds like a good idea.

> ... with one difference though: I would like to avoid the use of
> `unsafe` for something so basic, so the implementation is close to the C
> one (using masks and logical operations). I think it's a great
> demonstration of the compiler's abilities that we can generate an
> always-optimized version of `next_multiple_of`, but for our use-case it
> feels like jumping through hoops just to show that we can jump through
> these hoops. I'll reconsider if there is pushback on v5 though. :)

It's always a balance when to use `unsafe` vs when not to. For me using
`hint::unreachable` & `next_multiple_of` is much easier to read than=20

    self.wrapping_add(alignment.wrapping_sub(1)).align_down(alignment)

given that `align_down` is

    self & !alignment.wrapping_sub(1)

But that is totally due to my lack of experience with raw bit
operations. I also looked at the resulting assembly again and it seems
like (not an assembly expert at all :) your safe version produces better
code: https://godbolt.org/z/qhMbG7Mqd

---
Cheers,
Benno
