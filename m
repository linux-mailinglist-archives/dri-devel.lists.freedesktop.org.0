Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADDCA96811
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 13:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05A610E572;
	Tue, 22 Apr 2025 11:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W8YE7EP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6B410E571;
 Tue, 22 Apr 2025 11:45:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 408D343F85;
 Tue, 22 Apr 2025 11:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3373C4CEEA;
 Tue, 22 Apr 2025 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745322314;
 bh=+cAYzrgPIFB3bmk1XxbsIRRVowOU2YhzebrGhkUwKb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W8YE7EP8Qz+DcdeKrJkBB1/rGjSrMnbo2Q2vRh0AIMZmEgBnUY0o+AydUKhahshoj
 4Bawqk4u+v3YY/GTETtTrYIuz+VZ+PRGguLd8GUF3rW9Ak1/sh7XDc8QjCuBRGwyCe
 jIv8nmZygCFxxxMkgEueTHGnI5Gqdd9IlJGg2ou+oX28tAdkjgnoB1n54fh9osVutT
 zGcKkSp2W7XmaKO8gSBw8fT/9zIzhZp7Jrv3TOA6TkNj+DB0YmshjE15f14/5Trp3h
 xDgfM4tb75YIGHsYtJCyrjHy5f7iW3RpzHtX024NXJ4reh+jFMfsjqBZf9O+W8x0ad
 XSXB1f9E0th2Q==
Date: Tue, 22 Apr 2025 13:45:07 +0200
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
Subject: Re: [PATCH 09/16] gpu: nova-core: register sysmem flush page
Message-ID: <aAeBQ1aCQSrGFqCd@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-9-ecd1cca23963@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-9-ecd1cca23963@nvidia.com>
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

On Sun, Apr 20, 2025 at 09:19:41PM +0900, Alexandre Courbot wrote:
> A page of system memory is reserved so sysmembar can perform a read on
> it if a system write occurred since the last flush. Do this early as it
> can be required to e.g. reset the GPU falcons.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/dma.rs       | 54 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gpu.rs       | 53 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 10 +++++++
>  4 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..a4162bff597132a04e002b2b910a4537bbabc287
> --- /dev/null
> +++ b/drivers/gpu/nova-core/dma.rs
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Simple DMA object wrapper.
> +
> +// To be removed when all code is used.
> +#![allow(dead_code)]
> +
> +use kernel::device;
> +use kernel::dma::CoherentAllocation;
> +use kernel::page::PAGE_SIZE;
> +use kernel::prelude::*;
> +
> +pub(crate) struct DmaObject {
> +    pub dma: CoherentAllocation<u8>,
> +    pub len: usize,

This should be covered by CoherentAllocation already, no? If it does not have a
public accessor for its size, please add it for CoherentAllocation instead. I
can take the corresponding patch through the nova tree.

> +    #[allow(dead_code)]

Please prefer #[expect(dead_code)], such that we are forced to remove it once
it's subsequently used.

> +    pub name: &'static str,
> +}
> +
> +impl DmaObject {
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        len: usize,
> +        name: &'static str,
> +    ) -> Result<Self> {
> +        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
> +            .map_err(|_| EINVAL)?
> +            .pad_to_align()
> +            .size();
> +        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
> +
> +        Ok(Self { dma, len, name })
> +    }
> +
> +    pub(crate) fn from_data(
> +        dev: &device::Device<device::Bound>,
> +        data: &[u8],
> +        name: &'static str,
> +    ) -> Result<Self> {
> +        Self::new(dev, data.len(), name).and_then(|mut dma_obj| {
> +            // SAFETY:
> +            // - The copied data fits within the size of the allocated object.
> +            // - We have just created this object and there is no other user at this stage.
> +            unsafe {
> +                core::ptr::copy_nonoverlapping(
> +                    data.as_ptr(),
> +                    dma_obj.dma.start_ptr_mut(),
> +                    data.len(),
> +                );
> +            }
> +            Ok(dma_obj)
> +        })
> +    }
> +}

The DMA wrapper should probably be added in a separate patch.

> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 1f7799692a0ab042f2540e01414f5ca347ae9ecc..d43e710cc983d51f053dacbd77cbbfb79fa882c3 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -3,6 +3,7 @@
>  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
>  
>  use crate::devinit;
> +use crate::dma::DmaObject;
>  use crate::driver::Bar0;
>  use crate::firmware::Firmware;
>  use crate::regs;
> @@ -145,12 +146,30 @@ fn new(bar: &Devres<Bar0>) -> Result<Spec> {
>  }
>  
>  /// Structure holding the resources required to operate the GPU.
> -#[pin_data]
> +#[pin_data(PinnedDrop)]
>  pub(crate) struct Gpu {
>      spec: Spec,
>      /// MMIO mapping of PCI BAR 0
>      bar: Devres<Bar0>,
>      fw: Firmware,
> +    sysmem_flush: DmaObject,

Please add a doc-comment for this DmaObject explaining what it is used for by
the driver and why it is needed.

> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for Gpu {
> +    fn drop(self: Pin<&mut Self>) {
> +        // Unregister the sysmem flush page before we release it.
> +        let _ = with_bar!(&self.bar, |b| {
> +            regs::PfbNisoFlushSysmemAddr::default()
> +                .set_adr_39_08(0)
> +                .write(b);
> +            if self.spec.chipset >= Chipset::GA102 {
> +                regs::PfbNisoFlushSysmemAddrHi::default()
> +                    .set_adr_63_40(0)
> +                    .write(b);
> +            }
> +        });
> +    }
>  }
>  
>  impl Gpu {
> @@ -173,6 +192,36 @@ pub(crate) fn new(
>          devinit::wait_gfw_boot_completion(&bar)
>              .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
>  
> -        Ok(pin_init!(Self { spec, bar, fw }))
> +        // System memory page required for sysmembar to properly flush into system memory.
> +        let sysmem_flush = {
> +            let page = DmaObject::new(
> +                pdev.as_ref(),
> +                kernel::bindings::PAGE_SIZE,
> +                "sysmem flush page",
> +            )?;
> +
> +            // Register the sysmem flush page.
> +            with_bar!(bar, |b| {
> +                let handle = page.dma.dma_handle();
> +
> +                regs::PfbNisoFlushSysmemAddr::default()
> +                    .set_adr_39_08((handle >> 8) as u32)
> +                    .write(b);
> +                if spec.chipset >= Chipset::GA102 {
> +                    regs::PfbNisoFlushSysmemAddrHi::default()
> +                        .set_adr_63_40((handle >> 40) as u32)
> +                        .write(b);
> +                }
> +            })?;
> +
> +            page
> +        };
> +
> +        Ok(pin_init!(Self {
> +            spec,
> +            bar,
> +            fw,
> +            sysmem_flush,
> +        }))
>      }
>  }
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 878161e060f54da7738c656f6098936a62dcaa93..37c7eb0ea7a926bee4e3c661028847291bf07fa2 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -21,6 +21,7 @@ macro_rules! with_bar {
>  }
>  
>  mod devinit;
> +mod dma;
>  mod driver;
>  mod firmware;
>  mod gpu;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index fd7096f0ddd4af90114dd1119d9715d2cd3aa2ac..1e24787c4b5f432ac25fe399c8cb38b7350e44ae 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -14,6 +14,16 @@
>      28:20   chipset => try_into Chipset, "chipset model"
>  );
>  
> +/* PFB */
> +
> +register!(PfbNisoFlushSysmemAddr@0x00100c10;
> +    31:0    adr_39_08 => as u32
> +);
> +
> +register!(PfbNisoFlushSysmemAddrHi@0x00100c40;
> +    23:0    adr_63_40 => as u32
> +);

Please add some documentation for the register and its fields.
