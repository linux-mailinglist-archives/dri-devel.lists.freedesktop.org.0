Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225CBAC7207
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 22:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF4810E6A8;
	Wed, 28 May 2025 20:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b1CaswHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC77110E6A8;
 Wed, 28 May 2025 20:17:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 592BCA4FA08;
 Wed, 28 May 2025 20:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E56C4CEE3;
 Wed, 28 May 2025 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748463464;
 bh=/Np1zwPyXNowrj8gyBj7aEg2EQY/YKZNBSPDvnx555E=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=b1CaswHvKBYzgEicvj492JV/JryFjFWop3NOENUCSBtgUz3d/1BiYve+5mKTgGwkm
 rqHRV3N6+Ei7bt1ekFi18wFDcQNKJNLXpgt09+BOrHYqcvNGdzSWLPedW9m4v7o5a1
 6Gvy4Ic8IfeL2h8YtT0wZHAYpLdN7PqaCfoFrjnAvqfuKt42eCGlJryF29gBcRuh5L
 Tvko8B+A4+q4JVFNFQsZNpXMsRfKYLkcTBcMqAoag8Va/RVsQqMyLdyAaeYZKxQb6I
 uv+CpiNw7QeUBOIlkT/uK48jZDboTlPo001jfY34cqCnjvojDUOH6aLS7M7VBcRM4L
 239fEyc3wKAxg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 22:17:37 +0200
Message-Id: <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
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
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
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

On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
> Introduce the `num` module, featuring the `NumExt` extension trait
> that expands unsigned integers with useful operations for the kernel.
>
> These are to be used by the nova-core driver, but they are so ubiquitous
> that other drivers should be able to take advantage of them as well.
>
> The currently implemented operations are:
>
> - align_down()
> - align_up()
> - fls()
>
> But this trait is expected to be expanded further.
>
> `NumExt` is on unsigned types using a macro. An approach using another
> trait constrained by the operator traits that we need (`Add`, `Sub`,
> etc) was also considered, but had to be dropped as we need to use
> wrapping operations, which are not provided by any trait.
>
> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs |  1 +
>  rust/kernel/num.rs | 82 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 83 insertions(+)

Have you proposed `align_down` to upstream rust? Not saying that we
shouldn't do it here, but if we haven't tried yet, it might be a good
idea to just get them upstreamed. (if you do, it should probably be
named `prev_multiple_of`)

> +    /// Align `self` up to `alignment`.
> +    ///
> +    /// `alignment` must be a power of 2 for accurate results.
> +    ///
> +    /// Wraps around to `0` if the requested alignment pushes the result=
 above the type's limits.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::NumExt;
> +    ///
> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
> +    /// ```
> +    fn align_up(self, alignment: Self) -> Self;

Isn't this `next_multiple_of` [1] (it also allows non power of 2
inputs).

[1]: https://doc.rust-lang.org/std/primitive.u32.html#method.next_multiple_=
of

> +
> +    /// Find Last Set Bit: return the 1-based index of the last (i.e. mo=
st significant) set bit in
> +    /// `self`.
> +    ///
> +    /// Equivalent to the C `fls` function.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::NumExt;
> +    ///
> +    /// assert_eq!(0x0u32.fls(), 0);
> +    /// assert_eq!(0x1u32.fls(), 1);
> +    /// assert_eq!(0x10u32.fls(), 5);
> +    /// assert_eq!(0xffffu32.fls(), 16);
> +    /// assert_eq!(0x8000_0000u32.fls(), 32);
> +    /// ```
> +    fn fls(self) -> u32;

Isn't this just `trailing_zeros` [2]?

[2]: https://doc.rust-lang.org/std/primitive.u32.html#method.trailing_zeros

---
Cheers,
Benno
