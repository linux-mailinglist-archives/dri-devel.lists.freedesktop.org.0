Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B99ABB9667
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 14:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5B010E2A1;
	Sun,  5 Oct 2025 12:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f4bFxHk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3A210E29E;
 Sun,  5 Oct 2025 12:56:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 387B6438F9;
 Sun,  5 Oct 2025 12:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70800C4CEF4;
 Sun,  5 Oct 2025 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759668975;
 bh=2dWQPeBmfuCIMPI8LT0IPUyJaGtEuhcG7d4a+m1kWHs=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=f4bFxHk+quP1JF210mDDlL9TCVKpGGccU9y+5XwqDlIA4j8aEkmc2dwo/w+FiccQV
 k3UW9lTihn/StIeqmtzX4XG3VaHtgMRmK5yhijokglmC1pSwvDWQsIR60Kf8jrkIW0
 oGRf898QGoD6NE9q/SyWhs1+9h5myxxtYgVwcAtxlXgDAyRoz2q8RXfwse9995rd5/
 tSGuXQ2J//EUkpogJhdM7Gx0Sw/zOYuJT3AObg7+kMJuyTT54YwjIZx16RnQ5bxoJM
 HyEq1W9V5JRuu2rcQ7nQ7kPopWTbdhN4AewkeKJxykNQs5f/FT2XSVeNfdkACuBuMX
 ywBqJLBMWIfFQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Oct 2025 14:56:08 +0200
Message-Id: <DDAEL8DQFWKX.1BSBDMMN9I5B0@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <joel@joelfernandes.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] rust: pci: Allocate and manage PCI interrupt vectors
References: <20251002183912.1096508-1-joelagnelf@nvidia.com>
In-Reply-To: <20251002183912.1096508-1-joelagnelf@nvidia.com>
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

On Thu Oct 2, 2025 at 8:39 PM CEST, Joel Fernandes wrote:
> Add support to PCI rust module to allocate, free and manage IRQ vectors.
> Integrate with devres for managing the allocated resources.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
> Previous patch was here:
> https://lore.kernel.org/all/20250910035415.381753-1-joelagnelf@nvidia.com=
/
>
>  rust/kernel/pci.rs | 199 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 186 insertions(+), 13 deletions(-)
>
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 78271bf88cea..f97a6a36cf5e 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -6,8 +6,9 @@
> =20
>  use crate::{
>      bindings, container_of, device,
> +    device::Bound,
>      device_id::{RawDeviceId, RawDeviceIdIndex},
> -    devres::Devres,
> +    devres::{self, Devres},
>      driver,
>      error::{from_result, to_result, Result},
>      io::{Io, IoRaw},
> @@ -19,7 +20,7 @@
>  };
>  use core::{
>      marker::PhantomData,
> -    ops::Deref,
> +    ops::{Deref, RangeInclusive},
>      ptr::{addr_of_mut, NonNull},
>  };
>  use kernel::prelude::*;
> @@ -28,6 +29,59 @@
> =20
>  pub use self::id::{Class, ClassMask, Vendor};
> =20
> +/// IRQ type flags for PCI interrupt allocation.
> +#[derive(Debug, Clone, Copy)]
> +pub enum IrqType {
> +    /// Legacy INTx interrupts
> +    Legacy,

Like Bjorn said, I'd go with INTx too, also given that the C define is
PCI_IRQ_INTX.

> +    /// Message Signaled Interrupts (MSI)
> +    Msi,
> +    /// Extended Message Signaled Interrupts (MSI-X)
> +    MsiX,
> +}
> +
> +impl IrqType {
> +    /// Convert to the corresponding kernel flags

Please end with a period, here and in multiple other places.

> +    const fn as_raw(self) -> u32 {
> +        match self {
> +            IrqType::Legacy =3D> bindings::PCI_IRQ_INTX,
> +            IrqType::Msi =3D> bindings::PCI_IRQ_MSI,
> +            IrqType::MsiX =3D> bindings::PCI_IRQ_MSIX,
> +        }
> +    }
> +}
> +
> +/// Set of IRQ types that can be used for PCI interrupt allocation.
> +#[derive(Debug, Clone, Copy, Default)]
> +pub struct IrqTypes(u32);
> +
> +impl IrqTypes {
> +    /// Create a set containing all IRQ types (MSI-X, MSI, and Legacy)
> +    pub const fn all() -> Self {
> +        Self(bindings::PCI_IRQ_ALL_TYPES)
> +    }
> +
> +    /// Build a set of IRQ types
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```ignore
> +    /// // Create a set with only MSI and MSI-X (no legacy interrupts)
> +    /// let msi_only =3D IrqTypes::default()
> +    ///     .with(IrqType::Msi)
> +    ///     .with(IrqType::MsiX);
> +    /// ```
> +    pub const fn with(mut self, irq_type: IrqType) -> Self {
> +        self.0 |=3D irq_type.as_raw();
> +        self

NIT: I'd probably write this as:
=09
	Self(self.0 | irq_type.as_raw())

> +    }
> +
> +    /// Get the raw flags value
> +    const fn as_raw(self) -> u32 {
> +        self.0
> +    }
> +}
> +
>  /// An adapter for the registration of PCI drivers.
>  pub struct Adapter<T: Driver>(T);
> =20
> @@ -516,6 +570,76 @@ pub fn pci_class(&self) -> Class {
>      }
>  }
> =20
> +/// Represents an allocated IRQ vector for a specific PCI device.
> +///
> +/// This type ties an IRQ vector to the device it was allocated for,
> +/// ensuring the vector is only used with the correct device.
> +#[derive(Clone, Copy)]
> +pub struct IrqVector<'a> {
> +    dev: &'a Device<Bound>,
> +    index: u32,
> +}
> +
> +impl<'a> IrqVector<'a> {
> +    /// Creates a new `IrqVector` for the given device and index.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `index` must be a valid IRQ vector index for `dev`.
> +    unsafe fn new(dev: &'a Device<Bound>, index: u32) -> Self {
> +        Self { dev, index }
> +    }
> +
> +    /// Returns the raw vector index.
> +    fn index(&self) -> u32 {
> +        self.index
> +    }
> +}
> +
> +/// Represents an IRQ vector allocation for a PCI device.
> +///
> +/// This type ensures that IRQ vectors are properly allocated and freed =
by
> +/// tying the allocation to the lifetime of this registration object.
> +struct IrqVectorRegistration {
> +    dev: ARef<Device>,
> +}
> +
> +impl IrqVectorRegistration {
> +    /// Allocate IRQ vectors for the given PCI device.
> +    ///
> +    /// Returns the registration object and a range of valid IRQ vectors=
.
> +    fn new<'a>(
> +        dev: &'a Device<Bound>,
> +        min_vecs: u32,
> +        max_vecs: u32,
> +        irq_types: IrqTypes,
> +    ) -> Result<(Self, RangeInclusive<IrqVector<'a>>)> {
> +        // SAFETY: `dev.as_raw()` is guaranteed to be a valid pointer to=
 a `struct pci_dev`
> +        // by the type invariant of `Device`.
> +        // `pci_alloc_irq_vectors` internally validates all parameters a=
nd returns error codes.

"all other parameters"?

Please also format multiple statements in a safety comment as list.

> +        let ret =3D unsafe {
> +            bindings::pci_alloc_irq_vectors(dev.as_raw(), min_vecs, max_=
vecs, irq_types.as_raw())
> +        };
> +
> +        to_result(ret)?;
> +        let count =3D ret as u32;
> +
> +        // SAFETY: Vectors are 0-based, so valid indices are [0, count-1=
].
> +        // pci_alloc_irq_vectors guarantees count >=3D min_vecs > 0, so =
count - 1 is valid.

This is a justification why the range makes sense (which makes sense to kee=
p as
a separate comment), but it doesn't justify the safety requirement of
IrqVector::new().

> +        let range =3D unsafe { IrqVector::new(dev, 0)..=3DIrqVector::new=
(dev, count - 1) };
> +
> +        Ok((Self { dev: dev.into() }, range))
> +    }
> +}
> +
> +impl Drop for IrqVectorRegistration {
> +    fn drop(&mut self) {
> +        // SAFETY: `self.dev` is a valid ARef to a `struct pci_dev` that=
 has successfully
> +        // allocated IRQ vectors.

The "successfully allocated IRQ vectors" part should be a type invariant.

NIT: s/ARef/`ARef`/

> +        unsafe { bindings::pci_free_irq_vectors(self.dev.as_raw()) };
> +    }
> +}

<snip>

> +    /// Allocate IRQ vectors for this PCI device with automatic cleanup.
> +    ///
> +    /// Allocates between `min_vecs` and `max_vecs` interrupt vectors fo=
r the device.
> +    /// The allocation will use MSI-X, MSI, or legacy interrupts based o=
n the `irq_types`
> +    /// parameter and hardware capabilities. When multiple types are spe=
cified, the kernel
> +    /// will try them in order of preference: MSI-X first, then MSI, the=
n legacy interrupts.
> +    ///
> +    /// The allocated vectors are automatically freed when the device is=
 unbound, using the
> +    /// devres (device resource management) system.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `min_vecs` - Minimum number of vectors required
> +    /// * `max_vecs` - Maximum number of vectors to allocate
> +    /// * `irq_types` - Types of interrupts that can be used
> +    ///
> +    /// # Returns
> +    ///
> +    /// Returns a range of IRQ vectors that were successfully allocated,=
 or an error if the
> +    /// allocation fails or cannot meet the minimum requirement.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```ignore
> +    /// // Allocate using any available interrupt type in the order ment=
ioned above.
> +    /// let vectors =3D dev.alloc_irq_vectors(1, 32, IrqTypes::all())?;
> +    ///
> +    /// // Allocate MSI or MSI-X only (no legacy interrupts)
> +    /// let msi_only =3D IrqTypes::default()
> +    ///     .with(IrqType::Msi)
> +    ///     .with(IrqType::MsiX);
> +    /// let vectors =3D dev.alloc_irq_vectors(4, 16, msi_only)?;
> +    /// ```
> +    pub fn alloc_irq_vectors(
> +        &self,
> +        min_vecs: u32,
> +        max_vecs: u32,
> +        irq_types: IrqTypes,
> +    ) -> Result<RangeInclusive<IrqVector<'_>>> {
> +        let (irq_vecs, range) =3D IrqVectorRegistration::new(self, min_v=
ecs, max_vecs, irq_types)?;
> +
> +        devres::register(self.as_ref(), irq_vecs, GFP_KERNEL)?;

If we move the call to devres::register() into IrqVectorRegistration::new()
(which I'd call IrqVectorRegistration::register() then) we can enforce the
guarantee that an IrqVectorRegistration must not out-live the device / driv=
er
binding internally.

> +        Ok(range)
> +    }
>  }
