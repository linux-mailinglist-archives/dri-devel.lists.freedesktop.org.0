Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75CEAD9F51
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 21:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FD810E179;
	Sat, 14 Jun 2025 19:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LmgLRGRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AFD10E164;
 Sat, 14 Jun 2025 19:10:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7CB22A4AD3D;
 Sat, 14 Jun 2025 19:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB087C4CEEB;
 Sat, 14 Jun 2025 19:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749928203;
 bh=bjhQYBIAmrs9fPgWYClOvqQFEvjW34DMUYRym/0xXuk=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=LmgLRGRgImgkAbFP5aE23D9Mnm25p09TaVKJ9zqT+zbRd3MKgHb7Z1K9dmP9jqwC7
 yV/6kDzAOmkgICrDQwt9aswCEqh4DgkTQov3DVkY1ESAJy4psz0tc6oIBGD3VtVZa7
 bKff5WGCyT7PrORS7yrPCnnp+zoaxJ0+l5JLGDzOtm9jahYAzXGetAf7o1onU1fGV4
 dlgPTqsZPmfy3JwO2MOQC/CnRaFbB7/F306yttjk7itM4l+ak5pssywcfBpjHnEs0Q
 p2H4lsDM0zXPW2QVuAkKYPpDxRc3i1nSshFwsNlqdAkJLJo1Fq8kRpcq8RQEu03S6C
 iFvRSyLgxgbug==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 21:09:57 +0200
Message-Id: <DAMHRVOA2T1Q.OM6T75HPFO60@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
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

On Thu Jun 12, 2025 at 4:01 PM CEST, Alexandre Courbot wrote:
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee0f67ad1a89e69f5f8d2077e=
ba5541b472e7d8a
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +use crate::build_assert;
> +use core::borrow::Borrow;
> +use core::fmt::Debug;
> +use core::hash::Hash;
> +use core::ops::Deref;
> +
> +/// An unsigned integer which is guaranteed to be a power of 2.
> +#[derive(Debug, Clone, Copy)]
> +#[repr(transparent)]

Let's add a `# Safety` section with the invariant that `T` is a power of
2.

Maybe we should even have an `Int` trait for the different integer types
that we constrain `T` to.

> +pub struct PowerOfTwo<T>(T);
> +
> +macro_rules! power_of_two_impl {
> +    ($($t:ty),+) =3D> {
> +        $(
> +            impl PowerOfTwo<$t> {
> +                /// Validates that `v` is a power of two at build-time, =
and returns it wrapped into
> +                /// `PowerOfTwo`.
> +                ///
> +                /// A build error is triggered if `v` cannot be asserted=
 to be a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// let v =3D PowerOfTwo::<u32>::new(256);
> +                /// assert_eq!(v.value(), 256);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn new(v: $t) -> Self {
> +                    build_assert!(v.count_ones() =3D=3D 1);
> +                    Self(v)
> +                }

We also probably want an `unsafe new_unchecked(v: $t) -> Self`. It can
still use a `debug_assert!` to verify the value.

> +
> +                /// Validates that `v` is a power of two at runtime, and=
 returns it wrapped into
> +                /// `PowerOfTwo`.
> +                ///
> +                /// `None` is returned if `v` was not a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(16).unwrap().v=
alue(), 16);
> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(15), None);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn try_new(v: $t) -> Option<Self> {
> +                    match v.count_ones() {
> +                        1 =3D> Some(Self(v)),
> +                        _ =3D> None,
> +                    }
> +                }
> +
> +                /// Returns the value of this instance.
> +                ///
> +                /// It is guaranteed to be a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// let v =3D PowerOfTwo::<u32>::new(256);
> +                /// assert_eq!(v.value(), 256);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn value(&self) -> $t {

Since this type is `Copy`, we should use `self` here instead of `&self`.


Why not add

    if !self.0.is_power_of_two() {
        unsafe { ::core::hint::unreachable_unchecked() }
    }

here?

> +                    self.0
> +                }
> +
> +                /// Returns the mask corresponding to `self.value() - 1`=
.
> +                #[inline(always)]
> +                pub const fn mask(&self) -> $t {
> +                    self.0.wrapping_sub(1)

And then use `self.value()` here instead?

(we could even use `self.value() - 1`, since the optimizer can remove
the overflow check: https://godbolt.org/z/nvGaozGMW but wrapping_sub is
fine. The optimizations will most likely be more useful in other
arithmetic with `.value()`)

> +                }
> +
> +                /// Aligns `self` down to `alignment`.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_down=
(0x4fff), 0x4000);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn align_down(self, value: $t) -> $t {
> +                    value & !self.mask()
> +                }
> +
> +                /// Aligns `value` up to `self`.
> +                ///
> +                /// Wraps around to `0` if the requested alignment pushe=
s the result above the
> +                /// type's limits.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0=
x4fff), 0x5000);
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0=
x4000), 0x4000);
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0=
x0), 0x0);
> +                /// assert_eq!(PowerOfTwo::<u16>::new(0x100).align_up(0x=
ffff), 0x0);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn align_up(self, value: $t) -> $t {
> +                    self.align_down(value.wrapping_add(self.mask()))
> +                }
> +            }
> +        )+
> +    };
> +}
> +
> +power_of_two_impl!(usize, u8, u16, u32, u64, u128);
> +
> +impl<T> Deref for PowerOfTwo<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<T> PartialEq for PowerOfTwo<T>
> +where
> +    T: PartialEq,
> +{
> +    fn eq(&self, other: &Self) -> bool {
> +        self.0 =3D=3D other.0
> +    }
> +}
> +
> +impl<T> Eq for PowerOfTwo<T> where T: Eq {}
> +
> +impl<T> PartialOrd for PowerOfTwo<T>
> +where
> +    T: PartialOrd,
> +{
> +    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
> +        self.0.partial_cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Ord for PowerOfTwo<T>
> +where
> +    T: Ord,
> +{
> +    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
> +        self.0.cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Hash for PowerOfTwo<T>
> +where
> +    T: Hash,
> +{
> +    fn hash<H: core::hash::Hasher>(&self, state: &mut H) {
> +        self.0.hash(state);
> +    }
> +}

Can't these traits also be implemented using the derive macros?

---
Cheers,
Benno

> +
> +impl<T> Borrow<T> for PowerOfTwo<T> {
> +    fn borrow(&self) -> &T {
> +        &self.0
> +    }
> +}

