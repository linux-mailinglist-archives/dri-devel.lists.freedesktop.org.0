Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F560ACAF15
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24B10E1D4;
	Mon,  2 Jun 2025 13:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QTbx93gx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49A610E1D4;
 Mon,  2 Jun 2025 13:34:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A0CE75C5787;
 Mon,  2 Jun 2025 13:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55687C4CEEB;
 Mon,  2 Jun 2025 13:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748871244;
 bh=iZvHDfvfAD+yKJVYln/PMQ78EgZJYPP9rx+IC7Zkrww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QTbx93gxASCTQGU/HsrECc9MgbYuQnPnkPi9dGbSj3E/zI7TsrZ/bSobLj01apVd3
 neH4I2bnm/DjWxXvd2jVsat7zqaER8ao745HV7rSSKgnTidL3E+N4U+jGLVUAGJdG6
 h9dZZjGZ5rg7U5/tFSYGGkrAHiRPwDNVtLbbxf2O0yCM3UunRjsAn2SDDw+2aMr68w
 i0ed19vNdyMrcm8TsOArOiOUzRARLJv/eCiKLuOknn6iS/R5ch3p3Ucr2y8pBTAael
 fEJngYe6nK/bNEEQWmMnCfocsnVvLnrls2t4Q/MUDGg2D6dOgq/Knd+hp4x+hdI0Nx
 uj6P+WeFhSUhQ==
Date: Mon, 2 Jun 2025 15:33:56 +0200
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
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <aD2oROKpaU8Bmyj-@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
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

On Wed, May 21, 2025 at 03:45:11PM +0900, Alexandre Courbot wrote:
> +impl Vbios {

<snip>

> +    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
> +        self.fwsec_image.fwsec_header(pdev)
> +    }
> +
> +    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
> +        self.fwsec_image.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
> +    }
> +
> +    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
> +        self.fwsec_image.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
> +    }

Can't we just implement Deref here? Why do we need this indirection?

> +impl PcirStruct {
> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +        if data.len() < core::mem::size_of::<PcirStruct>() {
> +            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
> +            return Err(EINVAL);
> +        }
> +
> +        let mut signature = [0u8; 4];
> +        signature.copy_from_slice(&data[0..4]);
> +
> +        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e)
> +        if &signature != b"PCIR" && &signature != b"NPDS" {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "Invalid signature for PcirStruct: {:?}\n",
> +                signature
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        let mut class_code = [0u8; 3];
> +        class_code.copy_from_slice(&data[13..16]);
> +
> +        Ok(PcirStruct {
> +            signature,
> +            vendor_id: u16::from_le_bytes([data[4], data[5]]),
> +            device_id: u16::from_le_bytes([data[6], data[7]]),
> +            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
> +            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
> +            pci_data_struct_rev: data[12],
> +            class_code,
> +            image_len: u16::from_le_bytes([data[16], data[17]]),
> +            vendor_rom_rev: u16::from_le_bytes([data[18], data[19]]),
> +            code_type: data[20],
> +            last_image: data[21],
> +            max_runtime_image_len: u16::from_le_bytes([data[22], data[23]]),
> +        })
> +    }
> +
> +    /// Check if this is the last image in the ROM
> +    fn is_last(&self) -> bool {
> +        self.last_image & LAST_IMAGE_BIT_MASK != 0
> +    }
> +
> +    /// Calculate image size in bytes
> +    fn image_size_bytes(&self) -> Result<usize> {
> +        if self.image_len > 0 {

Please make this check when creating the structure...

> +            // Image size is in 512-byte blocks

...and make this a type invariant.

> +            Ok(self.image_len as usize * 512)

It should also be a type invariant that this does not overflow.

The same applies to NpdeStruct.

> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +}

<snip>

> +    /// Try to find NPDE in the data, the NPDE is right after the PCIR.
> +    fn find_in_data(
> +        pdev: &pci::Device,
> +        data: &[u8],
> +        rom_header: &PciRomHeader,
> +        pcir: &PcirStruct,
> +    ) -> Option<Self> {
> +        // Calculate the offset where NPDE might be located
> +        // NPDE should be right after the PCIR structure, aligned to 16 bytes
> +        let pcir_offset = rom_header.pci_data_struct_offset as usize;
> +        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;

What's this magic offset and mask?

> +
> +        // Check if we have enough data
> +        if npde_start + 11 > data.len() {

'+ 11'?

> +            dev_err!(pdev.as_ref(), "Not enough data for NPDE\n");

BiosImageBase declares this as "NVIDIA PCI Data Extension (optional)". If it's
really optional, why is this an error?

> +            return None;
> +        }
> +
> +        // Try to create NPDE from the data
> +        NpdeStruct::new(pdev, &data[npde_start..])
> +            .inspect_err(|e| {
> +                dev_err!(pdev.as_ref(), "Error creating NpdeStruct: {:?}\n", e);
> +            })
> +            .ok()

So, this returns None if it's a real error. This indicates that the return type
should just be Result<Option<Self>>.

> +struct FwSecBiosPartial {

Since this structure follows the builder pattern, can we please call it
FwSecBiosBuilder?

> +    base: BiosImageBase,
> +    // FWSEC-specific fields
> +    // These are temporary fields that are used during the construction of
> +    // the FwSecBiosPartial. Once FwSecBiosPartial is constructed, the
> +    // falcon_ucode_offset will be copied into a new FwSecBiosImage.
> +
> +    // The offset of the Falcon data from the start of Fwsec image
> +    falcon_data_offset: Option<usize>,
> +    // The PmuLookupTable starts at the offset of the falcon data pointer
> +    pmu_lookup_table: Option<PmuLookupTable>,
> +    // The offset of the Falcon ucode
> +    falcon_ucode_offset: Option<usize>,
> +}
> +
> +struct FwSecBiosImage {
> +    base: BiosImageBase,
> +    // The offset of the Falcon ucode
> +    falcon_ucode_offset: usize,
> +}
> +
> +// Convert from BiosImageBase to BiosImage
> +impl TryFrom<BiosImageBase> for BiosImage {

Why is this a TryFrom impl, instead of a regular constructor, i.e.
BiosImage::new()?

I don't think this is a canonical conversion.

> +    type Error = Error;
> +
> +    fn try_from(base: BiosImageBase) -> Result<Self> {
> +        match base.pcir.code_type {
> +            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
> +            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
> +            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
> +            0xE0 => Ok(BiosImage::FwSecPartial(FwSecBiosPartial {
> +                base,
> +                falcon_data_offset: None,
> +                pmu_lookup_table: None,
> +                falcon_ucode_offset: None,
> +            })),
> +            _ => Err(EINVAL),
> +        }
> +    }
> +}

<snip>

> +impl TryFrom<BiosImageBase> for PciAtBiosImage {

Same here.

> +    type Error = Error;
> +
> +    fn try_from(base: BiosImageBase) -> Result<Self> {
> +        let data_slice = &base.data;
> +        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
> +
> +        Ok(PciAtBiosImage {
> +            base,
> +            bit_header,
> +            bit_offset,
> +        })
> +    }
> +}

<snip>

> +impl FwSecBiosImage {
> +    fn new(pdev: &pci::Device, data: FwSecBiosPartial) -> Result<Self> {

Please add a method FwSecBiosBuilder::build() that returns an instance of
FwSecBiosImage instead.
