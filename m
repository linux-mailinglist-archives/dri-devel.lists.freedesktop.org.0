Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EC1A63730
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 20:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFDC10E1EE;
	Sun, 16 Mar 2025 19:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WJdidqDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7B310E190;
 Sun, 16 Mar 2025 19:20:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0C506A48C63;
 Sun, 16 Mar 2025 19:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F366DC4CEDD;
 Sun, 16 Mar 2025 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742152801;
 bh=Qs48kSaF/rFe+8NfU92PP5vQtEx0UzxhcUOSBSvxEDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WJdidqDDOv7uWe12OaeqnPPha7scvUBMk+l6gdylCwvV/zT9cMOQ6+xZ21CHNOIwn
 aD9inRyiQDkSwzZYldkIG8H4qck6e4osY8jPmPNSlW8C5/Dk55/utuoRXn4GtsklGX
 Y30RWzdQchRAFb+5LLJVGu1XzrNgME8tMt1c9eiJlSL7TeBVKBiz3oYTi37Ga0RGZ7
 AG3GyNhmhQTW1zIsn2qip28yvN/AHvx7RWVMZcfBPIEjp7KsLG4kEQWtkS4npkhg9B
 Atcczprp7hl05p4QBj8kX+Tbk8Ygg4cyWYOT+/SuCylYTPZuJbQn2A3+hVwfPc+9uT
 b5UeyzqmBL+KA==
Date: Sun, 16 Mar 2025 20:19:54 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 acourbot@nvidia.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/3] rust: alloc: add Vec::truncate method
Message-ID: <Z9ckWiW7X0hX5Wvt@pollux>
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-2-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316111644.154602-2-andrewjballance@gmail.com>
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

On Sun, Mar 16, 2025 at 06:16:42AM -0500, Andrew Ballance wrote:
> implement the equivalent to the std's Vec::truncate
> on the kernel's Vec type.
> 
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741ce..18bcc59f0b38 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -452,6 +452,42 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
>  
>          Ok(())
>      }
> +
> +    /// Shortens the vector, setting the length to `len` and drops the removed values.
> +    /// If `len` is greater than or equal to the current length, this does nothing.
> +    ///
> +    /// This has no effect on the capacity and will not allocate.
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v = kernel::kvec![1, 2, 3]?;
> +    /// v.truncate(1);
> +    /// assert_eq!(v.len(), 1);
> +    /// assert_eq!(&v, &[1]);
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn truncate(&mut self, len: usize) {
> +        if len >= self.len() {
> +            return;
> +        }
> +
> +        let drop_range = len..self.len();
> +
> +        // SAFETY: `drop_range` is a subrange of `[0, len)` by the bounds check above.
> +        let ptr: *mut [T] = unsafe { self.get_unchecked_mut(drop_range) };
> +
> +        // SAFETY:
> +        // - this will always shrink the vector because of the above bounds check
> +        // - [`new_len`, `self.len`) will be dropped through the call to `drop_in_place` below

We've just figured out that this part is not needed after all, sorry for the
inconvenience. No need to resend for this though, I can remove this line when
applying the patch.

> +        unsafe { self.set_len(len) };
> +
> +        // SAFETY:
> +        // - the dropped values are valid `T`s by the type invariant
> +        // - we are allowed to invalidate [`new_len`, `old_len`) because we just changed the
> +        //   len, therefore we have exclusive access to [`new_len`, `old_len`)
> +        unsafe { ptr::drop_in_place(ptr) };
> +    }
>  }
>  
>  impl<T: Clone, A: Allocator> Vec<T, A> {
> -- 
> 2.48.1
> 
