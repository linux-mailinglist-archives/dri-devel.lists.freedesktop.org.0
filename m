Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC94ABED68
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 10:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0968510E134;
	Wed, 21 May 2025 08:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m2/9uM/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3CF10E0B5;
 Wed, 21 May 2025 08:00:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 01D6F629D5;
 Wed, 21 May 2025 08:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149D9C4CEE4;
 Wed, 21 May 2025 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747814434;
 bh=NXbCTTtiVf1hxjNTRc1GM2RzoMelIfvrZhBNyZ0cQJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m2/9uM/UEfrYjyZRB5+ZA8Cs/2Hmzow+6pqeB30HS4fYP9dE/0yDvbAta6DX0hKcW
 CdgvE2HGDxvB86ylvjwlpAQ5UlZ4FF2laz60QCYmYwsos8qZEvzO3e1hi84Yw8u8BA
 DrrnFuSjhGIQm7wGHSLQ6OYQUUb1p1BrhVK33smEnGBJK5BS2Pn/Dm+JZ59cH5UXlB
 uX1S5xdpjDt0HVVsA2hkx9HZdS2hwH+jsMeNXLRPxUu9VvQYzlhAzklsccQ2PKfVHQ
 UFFTZj3xOBMhocKbIJO49SEeXDGfWr0b/lDVE6GUSfsfGSJI3fMRxLFuvBUr68wz7o
 cZRSU6h8DYctw==
Date: Wed, 21 May 2025 10:00:27 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 01/20] rust: dma: expose the count and size of
 CoherentAllocation
Message-ID: <aC2IG7amsKLk6G0a@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com>
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

On Wed, May 21, 2025 at 03:44:56PM +0900, Alexandre Courbot wrote:
> These properties are very useful to have and should be accessible.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/dma.rs | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 605e01e35715667f93297fd9ec49d8e7032e0910..2a60eefa47dfc1f836c30ee342e26c6ff3e9b13a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -129,6 +129,10 @@ pub mod attrs {
>  //
>  // Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
>  // entire `CoherentAllocation` including the allocated memory itself.
> +//
> +// # Invariants
> +//
> +// The size in bytes of the allocation is equal to `size_of::<T> * count()`.

I think this also needs an invariant comment whenever self.count is set.

>  pub struct CoherentAllocation<T: AsBytes + FromBytes> {
>      dev: ARef<Device>,
>      dma_handle: bindings::dma_addr_t,
> @@ -201,6 +205,20 @@ pub fn alloc_coherent(
>          CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
>      }
>  
> +    /// Returns the number of elements `T` in this allocation.
> +    ///
> +    /// Note that this is not the size of the allocation in bytes, which is provided by
> +    /// [`Self::size`].
> +    pub fn count(&self) -> usize {
> +        self.count
> +    }
> +
> +    /// Returns the size in bytes of this allocation.
> +    pub fn size(&self) -> usize {
> +        // As per the invariants of `CoherentAllocation`.
> +        self.count * core::mem::size_of::<T>()
> +    }
> +
>      /// Returns the base address to the allocated region in the CPU's virtual address space.
>      pub fn start_ptr(&self) -> *const T {
>          self.cpu_addr
> 
> -- 
> 2.49.0
> 
