Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FACA62F94
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 16:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A3010E0CA;
	Sat, 15 Mar 2025 15:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m5ov9XE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (unknown [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDA510E0BB;
 Sat, 15 Mar 2025 15:50:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D18A5C3F24;
 Sat, 15 Mar 2025 15:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC78AC4CEE5;
 Sat, 15 Mar 2025 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742053793;
 bh=//VI9Ejxt3BysY3bBXysrBbAfxCY7XJI4CQgc51yUmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m5ov9XE2YyrA++4prSzQ7wQsF4OyCJztO3HJFlvwrvgFKdEbYU+hRxDc/0gjFMi6D
 ZSsc17tBd6HhqsJQUe+ymMjrT3aAnvhuriYVNsX/0KML/TfhemJUlx/mvHKfDDAiip
 2dGgM00BWbcYjgnbPPX1hfkU2OMh18PX+JAyxpBzplAOEP3Oja994fpUcRQ+GM38M0
 Ju38U18/eQp62jo93PzWM8TtRPAPtBx24r2UsoRZzXSAnDMmPcPZ/tMnV9lwY7fE+6
 15ZK5b867+B/zIpyqmVUlHNPpgiUJhfqvjSoeqAIfr/y2IzqOD8Isq+SRADN2LE7ks
 0dlyKpEl8xhWA==
Date: Sat, 15 Mar 2025 16:49:47 +0100
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
Subject: Re: [PATCH 1/3] rust: alloc: add Vec::truncate method
Message-ID: <Z9Whm43kUWaiTETX@cassiopeiae>
References: <20250315024235.5282-1-andrewjballance@gmail.com>
 <20250315024235.5282-2-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315024235.5282-2-andrewjballance@gmail.com>
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

On Fri, Mar 14, 2025 at 09:42:33PM -0500, Andrew Ballance wrote:
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
> @@ -452,6 +452,42 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
>  
>          Ok(())
>      }
> +
> +    /// Shortens the vector, setting the length to `len` and drops the removed values.
> +    /// If `len` is greater than or equal to the current length, this does nothing.
> +    ///
> +    /// This has no effect on the capacity and will not allocate.

Nit: Please also add an empty line here.

> +    /// # Examples
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
> +        // [new_len, len) is guaranteed to be valid because [0, len) is guaranteed to be valid

We typically use markdown for comments.

> +        let drop_range = len..self.len();
> +
> +        // SAFETY:
> +        // we can safely ignore the bounds check because we already did our own check
> +        let ptr: *mut [T] = unsafe { self.get_unchecked_mut(drop_range) };
> +
> +        // SAFETY:
> +        // it is safe to shrink the length because the new length is
> +        // guaranteed to be less than the old length
> +        unsafe { self.set_len(len) };

I just sent out a fix [1] for the safety requirements of set_len() in [1], which
I think would be good to consider.

[1] https://lore.kernel.org/rust-for-linux/20250315154436.65065-1-dakr@kernel.org/
