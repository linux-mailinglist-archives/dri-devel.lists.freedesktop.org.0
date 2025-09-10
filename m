Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8253DB511C2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 10:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E48010E272;
	Wed, 10 Sep 2025 08:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZJESPZ6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FB810E272;
 Wed, 10 Sep 2025 08:47:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4996460226;
 Wed, 10 Sep 2025 08:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD53C4CEF0;
 Wed, 10 Sep 2025 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757494031;
 bh=WppBPowSewof/D5eVLXkCnHoKjpriLA2OUGq3Qnm2eI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=ZJESPZ6lxzuProG9lMdkWZnUdwptCur8qCkwbnuymnB4OzQnTCSsZvNKwlM+l14av
 avSWz9q2NGNPJ7zXztH7yMlB4il8x79co82w/jAbVLYOSFQ0aIbZHAU3hIJ4TayqDK
 1SawHkF2W6Q1FQO1zffxQ5+X7OzKE431V/h3dm5jqqM7H8V2oEPl+IWq8JRhrGAzB0
 gsWRzii0hSeix6ew8EDmTjd/KjZxhaKX1befEeCYkL33hvqcdSnI6v6PYeNtQHodZf
 d2Uxau1tFgH3LbK2rEQEmxF3f6r4NsaVDKfeeifUFW9TDSvZpKNOMc5EQyUv7chuA1
 rwE9Mop5Dwncw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 10:47:05 +0200
Message-Id: <DCOZMX59W82I.1AH7XVW3RUX2D@kernel.org>
Subject: Re: [PATCH] rust: pci: add PCI interrupt allocation and management
 support
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
References: <20250910035415.381753-1-joelagnelf@nvidia.com>
In-Reply-To: <20250910035415.381753-1-joelagnelf@nvidia.com>
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

On Wed Sep 10, 2025 at 5:54 AM CEST, Joel Fernandes wrote:
>  impl Device<device::Bound> {

The Bound context is not enough for some of the methods below, some of them
require the Core context, more below.

> +    /// Free all allocated IRQ vectors for this device.
> +    ///
> +    /// This should be called to release interrupt resources when they a=
re no longer needed,
> +    /// during driver unbind or removal.
> +    pub fn free_irq_vectors(&self) {
> +        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a vali=
d `struct pci_dev`.
> +        // `pci_free_irq_vectors` is safe to call even if no vectors are=
 currently allocated.
> +        unsafe { bindings::pci_free_irq_vectors(self.as_raw()) };
> +    }

This requires the Core context, but we should not provide this method at al=
l to
begin with; it puts the burden on drivers to remember calling this.

Instead, alloc_irq_vectors() should register a devres object with
devres::register(), so this gets called automatically when the device is
unbound.

Note that a cleanup through devres is not in conflict with the Core context
requirement.

> +    /// Allocate IRQ vectors for this PCI device.
> +    ///
> +    /// Allocates between `min_vecs` and `max_vecs` interrupt vectors fo=
r the device.
> +    /// The allocation will use MSI-X, MSI, or legacy interrupts based o=
n the `irq_types`
> +    /// parameter and hardware capabilities. When multiple types are spe=
cified, the kernel
> +    /// will try them in order of preference: MSI-X first, then MSI, the=
n legacy interrupts.
> +    /// This is called during driver probe.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `min_vecs` - Minimum number of vectors required
> +    /// * `max_vecs` - Maximum number of vectors to allocate
> +    /// * `irq_types` - Types of interrupts that can be used
> +    ///
> +    /// # Returns
> +    ///
> +    /// Returns the number of vectors successfully allocated, or an erro=
r if the allocation
> +    /// fails or cannot meet the minimum requirement.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// // Allocate using any available interrupt type in the order ment=
ioned above.
> +    /// let nvecs =3D dev.alloc_irq_vectors(1, 32, IrqTypes::all())?;
> +    ///
> +    /// // Allocate MSI or MSI-X only (no legacy interrupts)
> +    /// let msi_only =3D IrqTypes::default()
> +    ///     .with(IrqType::Msi)
> +    ///     .with(IrqType::MsiX);
> +    /// let nvecs =3D dev.alloc_irq_vectors(4, 16, msi_only)?;
> +    /// ```
> +    pub fn alloc_irq_vectors(
> +        &self,
> +        min_vecs: u32,
> +        max_vecs: u32,
> +        irq_types: IrqTypes,
> +    ) -> Result<u32> {
> +        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a vali=
d `struct pci_dev`.
> +        // `pci_alloc_irq_vectors` internally validates all parameters a=
nd returns error codes.
> +        let ret =3D unsafe {
> +            bindings::pci_alloc_irq_vectors(self.as_raw(), min_vecs, max=
_vecs, irq_types.raw())
> +        };
> +
> +        to_result(ret)?;
> +        Ok(ret as u32)
> +    }

This is only valid to be called from the Core context, as it modifies inter=
nal
fields of the inner struct device.

Also, it would be nice if it would return a new type that can serve as argu=
ment
for irq_vector(), such that we don't have to rely on random integers.

> +
> +    /// Get the Linux IRQ number for a specific vector.
> +    ///
> +    /// This is called during driver probe after successful IRQ allocati=
on
> +    /// to obtain the IRQ numbers for registering interrupt handlers.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `vector` - The vector index (0-based)
> +    ///
> +    /// # Returns
> +    ///
> +    /// Returns the Linux IRQ number for the specified vector, or an err=
or if the vector
> +    /// index is invalid or no vectors are allocated.
> +    pub fn irq_vector(&self, vector: u32) -> Result<u32> {

This method is already staged for inclusion in v6.18 in driver-core-next. P=
lease
make sure to base changes on top of the tree mentioned in the maintainers f=
ile,
driver-core in this case.

The signature of the existing method is:

	pub fn irq_vector(&self, index: u32) -> Result<IrqRequest<'_>>

We return an IrqRequest, which captures the IRQ number *and* the correspond=
ing
device, such that you can't get the combination wrong.

Maybe it's worth looking at improving the index argument with a new type as
mentioned above.

> +        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a vali=
d `struct pci_dev`.
> +        let irq =3D unsafe { bindings::pci_irq_vector(self.as_raw(), vec=
tor) };
> +
> +        to_result(irq)?;
> +        Ok(irq as u32)
> +    }
>  }
