Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08B5A62AAD
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 11:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC6B10E1DF;
	Sat, 15 Mar 2025 10:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="Tp+loHx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E1510E1DF
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1742033372; x=1742292572;
 bh=OHcE70XPvRML9VaosSBT33NiXD1wPq+xwAXL+OkphTA=;
 h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=Tp+loHx48iHnl0Mbfw+IQKG0pY7CIKt+S8b5Qp0/uQFjpiVqxywW8bQJ1qjOxzgM3
 vZCvMH00hXsp4ZHB0GmTvxu/2jse5RgkhYpBzM+Hsn5PGzqPyC770t/HIBAvkQ2D97
 iTRoGMLHWXkjzR6pzV1/afXKBkftflUctRtFac7nXpyClHlxb5Lm/MLGY3Q8AgrxBp
 OMcGiqzQmSe8u8kXrlqF5fdpzMu1V3kibmmDoyVHiUuqDYryV6d9Zu2MvR+z0Y1oMF
 IgIeZoVDz/psd+eQBCBNU93NgINwW23tb+K3uZ48gep/Ytg7DidfZl4kjLPimZc4P5
 8eSzA3OKeOWKg==
Date: Sat, 15 Mar 2025 10:09:26 +0000
To: Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, acourbot@nvidia.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH 1/3] rust: alloc: add Vec::truncate method
Message-ID: <D8GRAC8YQIVC.2LS1EIIIRZU3I@proton.me>
In-Reply-To: <20250315024235.5282-2-andrewjballance@gmail.com>
References: <20250315024235.5282-1-andrewjballance@gmail.com>
 <20250315024235.5282-2-andrewjballance@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: f76ad4a7a800f1deeb9c27a5c54e750de1d80a8c
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat Mar 15, 2025 at 3:42 AM CET, Andrew Ballance wrote:
> implements the equivalent to the std's Vec::truncate
> on the kernel's Vec type.
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741ce..75e9feebb81f 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -452,6 +452,42 @@ pub fn reserve(&mut self, additional: usize, flags: =
Flags) -> Result<(), AllocEr
> =20
>          Ok(())
>      }
> +
> +    /// Shortens the vector, setting the length to `len` and drops the r=
emoved values.
> +    /// If `len` is greater than or equal to the current length, this do=
es nothing.
> +    ///
> +    /// This has no effect on the capacity and will not allocate.
> +    /// # Examples
> +    /// ```
> +    /// let mut v =3D kernel::kvec![1, 2, 3]?;
> +    /// v.truncate(1);
> +    /// assert_eq!(v.len(), 1);
> +    /// assert_eq!(&v, &[1]);
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn truncate(&mut self, len: usize) {
> +        if len >=3D self.len() {
> +            return;
> +        }
> +
> +        // [new_len, len) is guaranteed to be valid because [0, len) is =
guaranteed to be valid
> +        let drop_range =3D len..self.len();
> +
> +        // SAFETY:
> +        // we can safely ignore the bounds check because we already did =
our own check
> +        let ptr: *mut [T] =3D unsafe { self.get_unchecked_mut(drop_range=
) };

What's this `get_unchecked_mut` method, I don't see it in `rust-next` or
`alloc-next`.

> +
> +        // SAFETY:
> +        // it is safe to shrink the length because the new length is
> +        // guaranteed to be less than the old length

Please take a look at the documentation of `set_len`, in the safety
section you'll find what you need to justify here.

> +        unsafe { self.set_len(len) };
> +
> +        // SAFETY:

A couple points missing:
- why is the pointer valid?

> +        // - the dropped values are valid `T`s
> +        // - we are allowed to invalidate [new_len, old_len) because we =
just changed the len

This should justify why the value will never be accessed again.

---
Cheers,
Benno

> +        unsafe { ptr::drop_in_place(ptr) };
> +    }
>  }
> =20
>  impl<T: Clone, A: Allocator> Vec<T, A> {


