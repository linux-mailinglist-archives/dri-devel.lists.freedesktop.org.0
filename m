Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE33A62EAB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 15:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE5610E3AD;
	Sat, 15 Mar 2025 14:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ThWrk6DE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9968910E3AD;
 Sat, 15 Mar 2025 14:58:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D2356A48AAA;
 Sat, 15 Mar 2025 14:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B560C4CEE5;
 Sat, 15 Mar 2025 14:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742050718;
 bh=RAeAVhJmU92U3yF+8U1vMhCGpToAH8k8bD3rXfIhF4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ThWrk6DExab+UNESD77yz99cy3ckjADVyJxnz2jMAh9lALCsgIHqc0F/d+TFWvRxA
 1OfEtqMhMnNpdSDd455c3xHLHgxc4jLVNlrhw0jwa9gMWgwx6J5U8G/9pTI17iIP8h
 AYZZZbz38Z+aNWxtJKmdPAcappLSA9xZx2Xvj3JnmJ50VlqRO371Uz8EK8StzoI6D9
 EN7PL8h059EjEFYBnAy28eTaFnk/LJxAhMNoEhDB0F8KaKyzMRVLuaJnBaCZkMfmJp
 YrS1pvMjuTpyxtsG747d5BjAP4FdeTnBWSvA8tsXbtYAMYKir5crpPBVdiIj2tYQSl
 FYO+CkdJqmqJw==
Date: Sat, 15 Mar 2025 15:58:31 +0100
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
Subject: Re: [PATCH 2/3] rust: alloc: add Vec::resize method
Message-ID: <Z9WVl9ExWznVAhtY@cassiopeiae>
References: <20250315024235.5282-1-andrewjballance@gmail.com>
 <20250315024235.5282-3-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315024235.5282-3-andrewjballance@gmail.com>
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

On Fri, Mar 14, 2025 at 09:42:34PM -0500, Andrew Ballance wrote:
> implemnts the equivalent of the rust std's Vec::resize
> on the kernel's Vec type.

Nit: It is preferred to use the imperative form, i.e. "Implement the equivalent
[...]".

> 
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  rust/kernel/alloc/kvec.rs | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 75e9feebb81f..cbfef2e56f9c 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -554,6 +554,31 @@ pub fn from_elem(value: T, n: usize, flags: Flags) -> Result<Self, AllocError> {
>  
>          Ok(v)
>      }
> +
> +    /// Resizes the [`Vec`] so that `len` is equal to `new_len`.
> +    ///
> +    /// If `new_len` is smaller than `len`, the `Vec` is [`Vec::truncate`]d.
> +    /// If `new_len` is larger, each new slot is filled with clones of `value`.
> +    ///
> +    /// # Example

Nit: Please add an empty line after the heading.

> +    /// ```
> +    /// let mut v = kernel::kvec![1, 2, 3]?;
> +    /// v.resize(1, 42, GFP_KERNEL)?;
> +    /// assert_eq!(&v, &[1]);
> +    ///
> +    /// v.resize(3, 42, GFP_KERNEL)?;
> +    /// assert_eq!(&v, &[1, 42, 42]);
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn resize(&mut self, new_len: usize, value: T, flags: Flags) -> Result<(), AllocError> {
> +        if new_len > self.len() {
> +            self.extend_with(new_len - self.len(), value, flags)
> +        } else {
> +            self.truncate(new_len);
> +            Ok(())
> +        }
> +    }
>  }
>  
>  impl<T, A> Drop for Vec<T, A>
> -- 
> 2.48.1
> 
