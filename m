Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2CFAB5479
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 14:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C118410E1A4;
	Tue, 13 May 2025 12:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PnypvhNr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD9810E0C4;
 Tue, 13 May 2025 12:15:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 636C54A0F2;
 Tue, 13 May 2025 12:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B342C4CEE4;
 Tue, 13 May 2025 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747138524;
 bh=idUfsrQz4c6EAsJ61Lq5mzmfS9aeS/MECofu2KJDb1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PnypvhNrpMfQY13NqEm+v3dGZQaDT9RrOzjNpzu5ZexvD5a8i4aaQHNy6qaBtW6Re
 zQJ5P0+GEZ7DJbuOe0oihM/SKmSBnu/Efjqfqf9lChGf+MK1LM/auFwEPaDRGDEL7W
 m1D8Gc/7vi+5fwa7a9Y2tQkGaWo85VP0i8n44iFm6SfsuDZ1D6mQ3aYuHqtmUt64OA
 m0byRgs/EMIDOfL7J8fsUfaImyXULMSbZjQLrJdduuhDIgNgz4i+J5zPxwKlNa0GIM
 6eHvmwDA+xVHk1vpRGCYup/VuuHzWAt4k+S7hBcHR2TwbGCPF1IEzeax5opSqIi4MY
 xlqB8rYz23uqQ==
Date: Tue, 13 May 2025 14:15:16 +0200
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 01/19] rust: dma: expose the count and size of
 CoherentAllocation
Message-ID: <aCM31J-B8aOf8Dg2@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-1-fcb02749754d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-1-fcb02749754d@nvidia.com>
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

On Wed, May 07, 2025 at 10:52:28PM +0900, Alexandre Courbot wrote:
> These properties are very useful to have and should be accessible.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/dma.rs | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 605e01e35715667f93297fd9ec49d8e7032e0910..18602d771054fceb80c29278b1945254312ed7c6 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -201,6 +201,20 @@ pub fn alloc_coherent(
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
> +        // This is guaranteed not to overflow as the same operation has been done in `alloc_attrs`.

Please make this an invariant of CoherentAllocation and refer to that instead.

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
