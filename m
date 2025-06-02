Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17C3ACACFD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF4310E4F2;
	Mon,  2 Jun 2025 11:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Evq5kpWg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F75610E2FC;
 Mon,  2 Jun 2025 11:09:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8DB90A4FF8D;
 Mon,  2 Jun 2025 11:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527A8C4CEEB;
 Mon,  2 Jun 2025 11:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748862595;
 bh=a7I7HJvFQ9VEde/6Ve3ViLZ6lotsk0Tp4rZAPkF0fNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Evq5kpWgyNewVa6YT61xGlwHz1Grol3+yKM9bYOYALw03KfYmvv7GSA1oSUXJS3eM
 oFfmAhCaCJQSAvbnElZ8w2UM76LOBplvkfvTBfX/b2V44DIUArNvb5+Jl8nvZ+yJaY
 aWD9hB2h7W6+K/LCrUzUX5MjTuXVcYlLd9G+inj6nIjcK5hlHyZdpXxvi9qIq7oEq4
 GsKZJfupAMWnZI3aGqbG2KWl2qv9BaAOt+YZsapTx6OCTxbY3DkfMh2TFq3ofNAFzx
 g7Ja/ia+jkqK3Ai72I6OUUFZfIegyiPXOiIsZAp6xUpt2tZqeyrvCFq86R3BTb9Aig
 l9GfmqD20qvow==
Date: Mon, 2 Jun 2025 13:09:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>
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
Subject: Re: [PATCH v4 13/20] gpu: nova-core: register sysmem flush page
Message-ID: <aD2Ge8RM1uTT726z@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-13-05dfd4f39479@nvidia.com>
 <44f13ec88af918893e2a4b7050dce9ac184e3b75.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44f13ec88af918893e2a4b7050dce9ac184e3b75.camel@redhat.com>
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

On Fri, May 30, 2025 at 05:57:44PM -0400, Lyude Paul wrote:
> On Wed, 2025-05-21 at 15:45 +0900, Alexandre Courbot wrote:
> > Reserve a page of system memory so sysmembar can perform a read on it if
> > a system write occurred since the last flush. Do this early as it can be
> > required to e.g. reset the GPU falcons.
> > 
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> >  drivers/gpu/nova-core/gpu.rs  | 45 +++++++++++++++++++++++++++++++++++++++++--
> >  drivers/gpu/nova-core/regs.rs | 10 ++++++++++
> >  2 files changed, 53 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> > index 50417f608dc7b445958ae43444a13c7593204fcf..a4e2cf1b529cc25fc168f68f9eaa6f4a7a9748eb 100644
> > --- a/drivers/gpu/nova-core/gpu.rs
> > +++ b/drivers/gpu/nova-core/gpu.rs
> > @@ -2,6 +2,7 @@
> >  
> >  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
> >  
> > +use crate::dma::DmaObject;
> >  use crate::driver::Bar0;
> >  use crate::firmware::{Firmware, FIRMWARE_VERSION};
> >  use crate::gfw;
> > @@ -158,12 +159,32 @@ fn new(bar: &Bar0) -> Result<Spec> {
> >  }
> >  
> >  /// Structure holding the resources required to operate the GPU.
> > -#[pin_data]
> > +#[pin_data(PinnedDrop)]
> >  pub(crate) struct Gpu {
> >      spec: Spec,
> >      /// MMIO mapping of PCI BAR 0
> >      bar: Devres<Bar0>,
> >      fw: Firmware,
> > +    /// System memory page required for flushing all pending GPU-side memory writes done through
> > +    /// PCIE into system memory.
> > +    sysmem_flush: DmaObject,
> > +}
> > +
> > +#[pinned_drop]
> > +impl PinnedDrop for Gpu {
> > +    fn drop(self: Pin<&mut Self>) {
> > +        // Unregister the sysmem flush page before we release it.
> > +        let _ = self.bar.try_access_with(|b| {
> > +            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
> > +                .set_adr_39_08(0)
> > +                .write(b);
> > +            if self.spec.chipset >= Chipset::GA102 {
> > +                regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
> > +                    .set_adr_63_40(0)
> > +                    .write(b);
> > +            }
> > +        });
> > +    }

Sorry that I haven't noticed this before -- I think this should be self
contained in a new type (e.g. SysmemFlush).

We should also move this kind of cleanup into the Driver::remove() callback,
where we still have a bound device, to avoid try_access_with().

I already have this on my list to implement for quite a while, because I wasn't
quite sure yet what's the best way to approach this, but I think the simple
remove() callback to perform tear down operations on device resources is fine.

I'll prepare the corresponding patches and subsequently rework those bits
accordingly.

> >  }
> >  
> >  impl Gpu {
> > @@ -187,10 +208,30 @@ pub(crate) fn new(
> >          gfw::wait_gfw_boot_completion(bar)
> >              .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
> >  
> > +        // System memory page required for sysmembar to properly flush into system memory.
> > +        let sysmem_flush = {
> > +            let page = DmaObject::new(pdev.as_ref(), kernel::bindings::PAGE_SIZE)?;
> > +
> > +            // Register the sysmem flush page.
> > +            let handle = page.dma_handle();
> > +
> > +            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
> > +                .set_adr_39_08((handle >> 8) as u32)
> > +                .write(bar);
> > +            if spec.chipset >= Chipset::GA102 {
> > +                regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
> > +                    .set_adr_63_40((handle >> 40) as u32)
> > +                    .write(bar);
> > +            }
> > +
> 
> Small nit - would it make sense for us to just add a function for initiating a
> sysmem memory flush that you could pass the bar to? Seems like it might be a
> bit less error prone if we end up having to do this elsewhere

Agreed -- but let's solve this with a new type and make it a method instead.
