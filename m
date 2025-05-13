Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0974AB5B05
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7650A10E267;
	Tue, 13 May 2025 17:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VKfFUr6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D7610E267;
 Tue, 13 May 2025 17:20:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 33FE5A4DADF;
 Tue, 13 May 2025 17:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CF0C4CEE4;
 Tue, 13 May 2025 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747156803;
 bh=MQuhWpdzL93g7rThL0qxlaSL6Ket9ASq4jJ/RLoxeI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VKfFUr6XKjwZWWOe1h2dm2026+ajtQ08OViaXvJUs32VjY9pNgCDp3vdLArWlg/ug
 puZwKFsV0jOk0iacJI6p36/oeQziVIxeiSJAUyKnqq/fBml6h8WOzbMgT2/zUegqoy
 B4fHJgF8FL0ohX1wmj5VJ4avHzsU1GTK1pwn4i0gDw5oFh/urFsYch6R3cXUojWqDX
 KJnzl3Kr6WGFJ9Lb92Rj/xUgjOsndgggZdhKrDOsqNtIsCqskFcnAFLHJarQIC1ORk
 D40A/u3s2+8SpfFgxm5uPh7YMDge5lXgrYnokS5rdcBYcNVgn3EY3M+HxeobdcBAaI
 b3saKvA8f5miA==
Date: Tue, 13 May 2025 19:19:56 +0200
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
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <aCN_PIYEEzs73AqT@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
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

On Wed, May 07, 2025 at 10:52:43PM +0900, Alexandre Courbot wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Add support for navigating and setting up vBIOS ucode data required for
> GSP to boot. The main data extracted from the vBIOS is the FWSEC-FRTS
> firmware which runs on the GSP processor. This firmware runs in high
> secure mode, and sets up the WPR2 (Write protected region) before the
> Booter runs on the SEC2 processor.
> 
> Also add log messages to show the BIOS images.
> 
> [102141.013287] NovaCore: Found BIOS image at offset 0x0, size: 0xfe00, type: PciAt
> [102141.080692] NovaCore: Found BIOS image at offset 0xfe00, size: 0x14800, type: Efi
> [102141.098443] NovaCore: Found BIOS image at offset 0x24600, size: 0x5600, type: FwSec
> [102141.415095] NovaCore: Found BIOS image at offset 0x29c00, size: 0x60800, type: FwSec
> 
> Tested on my Ampere GA102 and boot is successful.
> 
> [applied changes by Alex Courbot for fwsec signatures]
> [applied feedback from Alex Courbot and Timur Tabi]
> [applied changes related to code reorg, prints etc from Danilo Krummrich]
> [acourbot@nvidia.com: fix clippy warnings]
> [acourbot@nvidia.com: remove now-unneeded Devres acquisition]
> [acourbot@nvidia.com: fix read_more to read `len` bytes, not u32s]
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Shirish Baskaran <sbaskaran@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs  |    2 -
>  drivers/gpu/nova-core/gpu.rs       |    3 +
>  drivers/gpu/nova-core/nova_core.rs |    1 +
>  drivers/gpu/nova-core/vbios.rs     | 1147 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1151 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 1eb216307cd01d975b3d5beda1dc516f34b4b3f2..960982174d834c7c66a47ecfb3a15bf47116b2c5 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -80,8 +80,6 @@ pub(crate) struct FalconUCodeDescV3 {
>      _reserved: u16,
>  }
>  
> -// To be removed once that code is used.
> -#[expect(dead_code)]
>  impl FalconUCodeDescV3 {
>      pub(crate) fn size(&self) -> usize {
>          ((self.hdr & 0xffff0000) >> 16) as usize
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index ece13594fba687f3f714e255b5436e72d80dece3..4bf7f72247e5320935a517270b5a0e1ec2becfec 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -9,6 +9,7 @@
>  use crate::firmware::Firmware;
>  use crate::regs;
>  use crate::util;
> +use crate::vbios::Vbios;
>  use core::fmt;
>  
>  macro_rules! define_chipset {
> @@ -238,6 +239,8 @@ pub(crate) fn new(
>  
>          let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
>  
> +        let _bios = Vbios::new(pdev, bar)?;

Please add a comment why, even though unused, it is important to create this
instance.

Also, please use `_` if it's not intended to ever be used.

> +
>          Ok(pin_init!(Self {
>              spec,
>              bar: devres_bar,
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 8342482a1aa16da2e69f7d99143c1549a82c969e..ff6d0b40c18f36af4c7e2d5c839fdf77dba23321 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -10,6 +10,7 @@
>  mod gpu;
>  mod regs;
>  mod util;
> +mod vbios;
>  
>  kernel::module_pci_driver! {
>      type: driver::NovaCore,
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..cd55d8dbf8e12d532f776d7544c7e5f2a865d6f8
> --- /dev/null
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -0,0 +1,1147 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! VBIOS extraction and parsing.
> +
> +// To be removed when all code is used.
> +#![expect(dead_code)]
> +
> +use crate::driver::Bar0;
> +use crate::firmware::FalconUCodeDescV3;
> +use core::convert::TryFrom;
> +use kernel::device;
> +use kernel::error::Result;
> +use kernel::num::NumAlign;
> +use kernel::pci;
> +use kernel::prelude::*;
> +
> +/// The offset of the VBIOS ROM in the BAR0 space.
> +const ROM_OFFSET: usize = 0x300000;
> +/// The maximum length of the VBIOS ROM to scan into.
> +const BIOS_MAX_SCAN_LEN: usize = 0x100000;
> +/// The size to read ahead when parsing initial BIOS image headers.
> +const BIOS_READ_AHEAD_SIZE: usize = 1024;
> +/// The bit in the last image indicator byte for the PCI Data Structure that
> +/// indicates the last image. Bit 0-6 are reserved, bit 7 is last image bit.
> +const LAST_IMAGE_BIT_MASK: u8 = 0x80;
> +
> +// PMU lookup table entry types. Used to locate PMU table entries
> +// in the Fwsec image, corresponding to falcon ucodes.
> +#[expect(dead_code)]
> +const FALCON_UCODE_ENTRY_APPID_FIRMWARE_SEC_LIC: u8 = 0x05;
> +#[expect(dead_code)]
> +const FALCON_UCODE_ENTRY_APPID_FWSEC_DBG: u8 = 0x45;
> +const FALCON_UCODE_ENTRY_APPID_FWSEC_PROD: u8 = 0x85;
> +
> +/// Vbios Reader for constructing the VBIOS data
> +struct VbiosIterator<'a> {
> +    pdev: &'a pci::Device,
> +    bar0: &'a Bar0,
> +    // VBIOS data vector: As BIOS images are scanned, they are added to this vector
> +    // for reference or copying into other data structures. It is the entire
> +    // scanned contents of the VBIOS which progressively extends. It is used
> +    // so that we do not re-read any contents that are already read as we use
> +    // the cumulative length read so far, and re-read any gaps as we extend
> +    // the length.
> +    data: KVec<u8>,
> +    current_offset: usize, // Current offset for iterator
> +    last_found: bool,      // Whether the last image has been found
> +}
> +
> +impl<'a> VbiosIterator<'a> {
> +    fn new(pdev: &'a pci::Device, bar0: &'a Bar0) -> Result<Self> {
> +        Ok(Self {
> +            pdev,
> +            bar0,
> +            data: KVec::new(),
> +            current_offset: 0,
> +            last_found: false,
> +        })
> +    }
> +
> +    /// Read bytes from the ROM at the current end of the data vector
> +    fn read_more(&mut self, len: usize) -> Result {
> +        let current_len = self.data.len();
> +        let start = ROM_OFFSET + current_len;
> +
> +        // Ensure length is a multiple of 4 for 32-bit reads
> +        if len % core::mem::size_of::<u32>() != 0 {
> +            dev_err!(
> +                self.pdev.as_ref(),
> +                "VBIOS read length {} is not a multiple of 4\n",
> +                len
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        self.data.reserve(len, GFP_KERNEL)?;
> +        // Read ROM data bytes and push directly to vector
> +        for i in (0..len).step_by(core::mem::size_of::<u32>()) {
> +            // Read 32-bit word from the VBIOS ROM
> +            let word = self.bar0.try_read32(start + i)?;
> +
> +            // Convert the u32 to a 4 byte array and push each byte
> +            word.to_ne_bytes()
> +                .iter()
> +                .try_for_each(|&b| self.data.push(b, GFP_KERNEL))?;
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Read bytes at a specific offset, filling any gap
> +    fn read_more_at_offset(&mut self, offset: usize, len: usize) -> Result {
> +        if offset > BIOS_MAX_SCAN_LEN {
> +            dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
> +            return Err(EINVAL);
> +        }
> +
> +        // If offset is beyond current data size, fill the gap first
> +        let current_len = self.data.len();
> +        let gap_bytes = offset.saturating_sub(current_len);
> +
> +        // Now read the requested bytes at the offset
> +        self.read_more(gap_bytes + len)
> +    }
> +
> +    /// Read a BIOS image at a specific offset and create a BiosImage from it.
> +    /// self.data is extended as needed and a new BiosImage is returned.
> +    /// @context is a string describing the operation for error reporting
> +    fn read_bios_image_at_offset(
> +        &mut self,
> +        offset: usize,
> +        len: usize,
> +        context: &str,
> +    ) -> Result<BiosImage> {
> +        let data_len = self.data.len();
> +        if offset + len > data_len {
> +            self.read_more_at_offset(offset, len).inspect_err(|e| {
> +                dev_err!(
> +                    self.pdev.as_ref(),
> +                    "Failed to read more at offset {:#x}: {:?}\n",
> +                    offset,
> +                    e
> +                )
> +            })?;
> +        }
> +
> +        BiosImage::new(self.pdev, &self.data[offset..offset + len]).inspect_err(|err| {
> +            dev_err!(
> +                self.pdev.as_ref(),
> +                "Failed to {} at offset {:#x}: {:?}\n",
> +                context,
> +                offset,
> +                err
> +            )
> +        })
> +    }
> +}
> +
> +impl<'a> Iterator for VbiosIterator<'a> {
> +    type Item = Result<BiosImage>;
> +
> +    /// Iterate over all VBIOS images until the last image is detected or offset
> +    /// exceeds scan limit.
> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.last_found {
> +            return None;
> +        }
> +
> +        if self.current_offset > BIOS_MAX_SCAN_LEN {
> +            dev_err!(
> +                self.pdev.as_ref(),
> +                "Error: exceeded BIOS scan limit, stopping scan\n"
> +            );
> +            return None;
> +        }
> +
> +        // Parse image headers first to get image size
> +        let image_size = match self
> +            .read_bios_image_at_offset(
> +                self.current_offset,
> +                BIOS_READ_AHEAD_SIZE,
> +                "parse initial BIOS image headers",
> +            )
> +            .and_then(|image| image.image_size_bytes())
> +        {
> +            Ok(size) => size,
> +            Err(e) => return Some(Err(e)),
> +        };
> +
> +        // Now create a new BiosImage with the full image data
> +        let full_image = match self.read_bios_image_at_offset(
> +            self.current_offset,
> +            image_size,
> +            "parse full BIOS image",
> +        ) {
> +            Ok(image) => image,
> +            Err(e) => return Some(Err(e)),
> +        };
> +
> +        self.last_found = full_image.is_last();
> +
> +        // Advance to next image (aligned to 512 bytes)
> +        self.current_offset += image_size;
> +        self.current_offset = self.current_offset.align_up(512);
> +
> +        Some(Ok(full_image))
> +    }
> +}
> +
> +pub(crate) struct Vbios {
> +    pub fwsec_image: Option<FwSecBiosImage>,

Please use pub(crate) instead or provide an accessor.

Also, this shouldn't be an Option, see below comment in Vbios::new().

> +}
> +
> +impl Vbios {
> +    /// Probe for VBIOS extraction
> +    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
> +    pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
> +        // Images to extract from iteration
> +        let mut pci_at_image: Option<PciAtBiosImage> = None;
> +        let mut first_fwsec_image: Option<FwSecBiosImage> = None;
> +        let mut second_fwsec_image: Option<FwSecBiosImage> = None;
> +
> +        // Parse all VBIOS images in the ROM
> +        for image_result in VbiosIterator::new(pdev, bar0)? {
> +            let full_image = image_result?;
> +
> +            dev_info!(

Let's use dev_dbg!() instaed.

> +                pdev.as_ref(),
> +                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
> +                full_image.image_size_bytes()?,
> +                full_image.image_type_str(),
> +                full_image.is_last()
> +            );
> +
> +            // Get references to images we will need after the loop, in order to
> +            // setup the falcon data offset.
> +            match full_image {
> +                BiosImage::PciAt(image) => {
> +                    pci_at_image = Some(image);
> +                }
> +                BiosImage::FwSec(image) => {
> +                    if first_fwsec_image.is_none() {
> +                        first_fwsec_image = Some(image);
> +                    } else {
> +                        second_fwsec_image = Some(image);
> +                    }
> +                }
> +                // For now we don't need to handle these
> +                BiosImage::Efi(_image) => {}
> +                BiosImage::Nbsi(_image) => {}
> +            }
> +        }
> +
> +        // Using all the images, setup the falcon data pointer in Fwsec.
> +        // We need mutable access here, so we handle the Option manually.
> +        let final_fwsec_image = {
> +            let mut second = second_fwsec_image; // Take ownership of the option
> +
> +            if let (Some(second), Some(first), Some(pci_at)) =
> +                (second.as_mut(), first_fwsec_image, pci_at_image)
> +            {
> +                second
> +                    .setup_falcon_data(pdev, &pci_at, &first)
> +                    .inspect_err(|e| {
> +                        dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
> +                    })?;
> +            } else {
> +                dev_err!(
> +                    pdev.as_ref(),
> +                    "Missing required images for falcon data setup, skipping\n"
> +                );
> +                return Err(EINVAL);

This means that if second == None we fail, which makes sense, so why store an
Option in Vbios? All methods of Vbios fail if fwsec_image == None.

> +            }
> +            second
> +        };

I think this should be:

	let mut second = second_fwsec_image;
	
	if let (Some(second), Some(first), Some(pci_at)) =
	    (second.as_mut(), first_fwsec_image, pci_at_image)
	{
	    second
	        .setup_falcon_data(pdev, &pci_at, &first)
	        .inspect_err(|e| {
	            dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
	        })?;
	
	    Ok(Vbios(second)
	} else {
	    dev_err!(
	        pdev.as_ref(),
	        "Missing required images for falcon data setup, skipping\n"
	    );
	
	    Err(EINVAL)
	}

where Vbios can just be

	pub(crate) struct Vbios(FwSecBiosImage);

> +
> +        Ok(Vbios {
> +            fwsec_image: final_fwsec_image,
> +        })
> +    }
> +
> +    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
> +        image.fwsec_header(pdev)
> +    }
> +
> +    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
> +        image.fwsec_ucode(pdev, image.fwsec_header(pdev)?)
> +    }
> +
> +    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
> +        image.fwsec_sigs(pdev, image.fwsec_header(pdev)?)
> +    }

Those then become infallible, e.g.

	pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> &[u8] {
	    self.0.fwsec_sigs(pdev, self.fwsec_header(pdev))
	}

> +}

<snip>

I have to continue with the rest of this patch later on.

- Danilo
