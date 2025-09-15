Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25423B57534
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 11:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357F810E3C1;
	Mon, 15 Sep 2025 09:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RDH2Pda8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3BC10E27D;
 Mon, 15 Sep 2025 09:48:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7AFE444465;
 Mon, 15 Sep 2025 09:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB60C4CEF1;
 Mon, 15 Sep 2025 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757929707;
 bh=aQeFPB6y0jxLv3hHgWg7/iEYKO+lhBgQVa0rrS32CaY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=RDH2Pda8qSieRtXmX5Fs8NrBrvBEqpzxrH/66DX7dacK03qCw22kGwtLM9VPTv6Ih
 ge9ps8VYDzSwYn1tJEvM9r6AaU7MhwrpOc6LUeMk4onwyo0Nttk1cZFFCdXhN6XNg7
 aSui4SEMKc72HBG/mpPd2XYkmLbmnsVr2YdR/PvnmqTskrtHM4/zPhuKifec5rQ/p9
 60vtWmBksgxaibNvL0DGHDTUnUVN0zTwBHiguRy3v7rjoNFA0kqZ/kuhjLPqeZ2Nxo
 9y7zZkjYOBS+8RSKpHewzCB3My98T+AWhcimCM7Dii5Ez+JquIwoKCg+cvFqTU5hMg
 KR1wVRytkmQEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Sep 2025 11:48:19 +0200
Message-Id: <DCTA2J6Y2PSC.1B48J5ZHUQCOI@kernel.org>
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
 <DCOZMX59W82I.1AH7XVW3RUX2D@kernel.org> <20250910180955.GA598866@joelbox2>
 <20250910190239.GA727765@joelbox2>
In-Reply-To: <20250910190239.GA727765@joelbox2>
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

On Wed Sep 10, 2025 at 9:02 PM CEST, Joel Fernandes wrote:
> On Wed, Sep 10, 2025 at 02:09:55PM -0400, Joel Fernandes wrote:
> [...]=20
>> > > +    /// Allocate IRQ vectors for this PCI device.
>> > > +    ///
>> > > +    /// Allocates between `min_vecs` and `max_vecs` interrupt vecto=
rs for the device.
>> > > +    /// The allocation will use MSI-X, MSI, or legacy interrupts ba=
sed on the `irq_types`
>> > > +    /// parameter and hardware capabilities. When multiple types ar=
e specified, the kernel
>> > > +    /// will try them in order of preference: MSI-X first, then MSI=
, then legacy interrupts.
>> > > +    /// This is called during driver probe.
>> > > +    ///
>> > > +    /// # Arguments
>> > > +    ///
>> > > +    /// * `min_vecs` - Minimum number of vectors required
>> > > +    /// * `max_vecs` - Maximum number of vectors to allocate
>> > > +    /// * `irq_types` - Types of interrupts that can be used
>> > > +    ///
>> > > +    /// # Returns
>> > > +    ///
>> > > +    /// Returns the number of vectors successfully allocated, or an=
 error if the allocation
>> > > +    /// fails or cannot meet the minimum requirement.
>> > > +    ///
>> > > +    /// # Examples
>> > > +    ///
>> > > +    /// ```
>> > > +    /// // Allocate using any available interrupt type in the order=
 mentioned above.
>> > > +    /// let nvecs =3D dev.alloc_irq_vectors(1, 32, IrqTypes::all())=
?;
>> > > +    ///
>> > > +    /// // Allocate MSI or MSI-X only (no legacy interrupts)
>> > > +    /// let msi_only =3D IrqTypes::default()
>> > > +    ///     .with(IrqType::Msi)
>> > > +    ///     .with(IrqType::MsiX);
>> > > +    /// let nvecs =3D dev.alloc_irq_vectors(4, 16, msi_only)?;
>> > > +    /// ```
>> > > +    pub fn alloc_irq_vectors(
>> > > +        &self,
>> > > +        min_vecs: u32,
>> > > +        max_vecs: u32,
>> > > +        irq_types: IrqTypes,
>> > > +    ) -> Result<u32> {
>> > > +        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a=
 valid `struct pci_dev`.
>> > > +        // `pci_alloc_irq_vectors` internally validates all paramet=
ers and returns error codes.
>> > > +        let ret =3D unsafe {
>> > > +            bindings::pci_alloc_irq_vectors(self.as_raw(), min_vecs=
, max_vecs, irq_types.raw())
>> > > +        };
>> > > +
>> > > +        to_result(ret)?;
>> > > +        Ok(ret as u32)
>> > > +    }
>> >=20
>> > This is only valid to be called from the Core context, as it modifies =
internal
>> > fields of the inner struct device.
>>=20
>> It is called from core context, the diff format confuses.
>> >=20
>> > Also, it would be nice if it would return a new type that can serve as=
 argument
>> > for irq_vector(), such that we don't have to rely on random integers.
>>=20
>> Makes sense, I will do that.
>>=20
> By the way, the "ret" value returned by pci_alloc_irq_vectors() is the nu=
mber
> of vectors, not the vector index.

Sure, but the vector index passed to pci_irq_vector() must be in the range
defined by the return value of pci_alloc_irq_vectors().

I thought of e.g. Range<pci::IrqVector> as return value. This way you can e=
asily
iterate it and prove that it's an allocated vector index.

> So basically there are 3 numbers that mean
> different things:
> 1. Number of vectors (as returned by alloc_irq_vectors).
> 2. Index of a vector (passed to pci_irq_vector).
> 3. The Linux IRQ number (passed to request_irq).
>
> And your point is well taken, in fact even in current code there is
> ambiguity: irq_vector() accepts a vector index, where as request_irq()
> accepts a Linux IRQ number, which are different numbers. I can try to cle=
an
> that up as well but let me know if you had any other thoughts. In fact, I
> think Device<device::Bound>::request_irq() pci should just accept IrqRequ=
est?

Currently, pci::Device::request_irq() takes an IRQ vector index and calls
irq_vector() internally to convert the vector index into an IRQ number.

I'd keep this semantics, but introduce a new type IrqVector rather than usi=
ng
the raw integer. So, drivers would call

	// `irq_vecs` is of type `Range<pci::IrqVector>`.
	let irq_vecs =3D dev.alloc_irq_vectors(1, 1, pci::IrqTypes::ANY)?;
	let irq =3D KBox::pin_init(
	   dev.request_irq(irq_vecs.start, ...)?,
	)?;

Alternatively, to request all of them, if we have multiple, we can leverage
KBox::pin_slice(), which will land in v6.18 (see alloc-next or rust-next br=
anch
in the Rust tree), so all irq::Registration objects can be stored in a sing=
le
allocation.
