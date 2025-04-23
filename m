Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808BAA98C5C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA12E10E6BA;
	Wed, 23 Apr 2025 14:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TIYvKHri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4170310E6BA;
 Wed, 23 Apr 2025 14:06:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5AB6C5C5752;
 Wed, 23 Apr 2025 14:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2A9C4CEE2;
 Wed, 23 Apr 2025 14:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745417184;
 bh=JR4wXEU7GWRDqF9uYmeLBdk27/7D3eiZ9meOg2nqEjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TIYvKHri2+FTM1C0uadf6sTGZ5/EzcQfv6O8+xVv8VyHdJx9wmxQyMCfD7v4hJpN5
 a6NulbkghP2R9T0hJziwV3bW2ZEI+xAxXHkFZZL8SDVHf1yRVOFi9Eor1sO3apT3hu
 7i8vJPAG5QQKCNLAhMxfXJVEQAatnUsTXSSkWemZ4xnNprq3hSoXQEH3XrjKDghTCF
 ttL9/mu6j7H4B1NXM2u+g8W3Lg2jOki0vZN8eoeZ5eP39pw8S1XDQcuiEHJhgfW4wT
 v2mQN7+AYgqPYETNDJGPnWFOrNAYTimVDfHAdZ9zNvpvPJL3XOZWE+8ZEZEJzFUoDd
 cX15lwAgb+d2w==
Date: Wed, 23 Apr 2025 16:06:16 +0200
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
Subject: Re: [PATCH 13/16] gpu: nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <aAjz2CYTsAhidiEU@pollux>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com>
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

On Sun, Apr 20, 2025 at 09:19:45PM +0900, Alexandre Courbot wrote:
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
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs  |    2 -
>  drivers/gpu/nova-core/gpu.rs       |    5 +
>  drivers/gpu/nova-core/nova_core.rs |    1 +
>  drivers/gpu/nova-core/vbios.rs     | 1103 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1109 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 4ef5ba934b9d255635aa9a902e1d3a732d6e5568..58c0513d49e9a0cef36917c8e2b25c414f6fc596 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -44,7 +44,6 @@ pub(crate) fn new(
>  }
>  
>  /// Structure used to describe some firmwares, notable fwsec-frts.
> -#[allow(dead_code)]
>  #[repr(C)]
>  #[derive(Debug, Clone)]
>  pub(crate) struct FalconUCodeDescV3 {
> @@ -64,7 +63,6 @@ pub(crate) struct FalconUCodeDescV3 {
>      _reserved: u16,
>  }
>  
> -#[allow(dead_code)]
>  impl FalconUCodeDescV3 {
>      pub(crate) fn size(&self) -> usize {
>          ((self.hdr & 0xffff0000) >> 16) as usize
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index ec4c648c6e8b4aa7d06c627ed59c0e66a08c679e..2344dfc69fe4246644437d70572680a4450b5bd7 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -11,6 +11,7 @@
>  use crate::regs;
>  use crate::timer::Timer;
>  use crate::util;
> +use crate::vbios::Vbios;
>  use core::fmt;
>  
>  macro_rules! define_chipset {
> @@ -157,6 +158,7 @@ pub(crate) struct Gpu {
>      fw: Firmware,
>      sysmem_flush: DmaObject,
>      timer: Timer,
> +    bios: Vbios,
>  }
>  
>  #[pinned_drop]
> @@ -237,12 +239,15 @@ pub(crate) fn new(
>  
>          let _sec2_falcon = Sec2Falcon::new(pdev, spec.chipset, &bar, true)?;
>  
> +        let bios = Vbios::probe(&bar)?;
> +
>          Ok(pin_init!(Self {
>              spec,
>              bar,
>              fw,
>              sysmem_flush,
>              timer,
> +            bios,
>          }))
>      }
>  }
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 4dde8004d24882c60669b5acd6af9d6988c66a9c..2858f4a0dc35eb9d6547d5cbd81de44c8fc47bae 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -29,6 +29,7 @@ macro_rules! with_bar {
>  mod regs;
>  mod timer;
>  mod util;
> +mod vbios;
>  
>  kernel::module_pci_driver! {
>      type: driver::NovaCore,
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..534107b708cab0eb8d0accf7daa5718edf030358
> --- /dev/null
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -0,0 +1,1103 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// To be removed when all code is used.
> +#![allow(dead_code)]

Please not, use 'expect' and and only where needed. If it would be too much,
it's probably a good indicator that we want to reduce the size of the patch for
now.

> +
> +//! VBIOS extraction and parsing.
> +
> +use crate::driver::Bar0;
> +use crate::firmware::FalconUCodeDescV3;
> +use core::convert::TryFrom;
> +use kernel::devres::Devres;
> +use kernel::error::Result;
> +use kernel::prelude::*;
> +
> +/// The offset of the VBIOS ROM in the BAR0 space.
> +const ROM_OFFSET: usize = 0x300000;
> +/// The maximum length of the VBIOS ROM to scan into.
> +const BIOS_MAX_SCAN_LEN: usize = 0x100000;
> +/// The size to read ahead when parsing initial BIOS image headers.
> +const BIOS_READ_AHEAD_SIZE: usize = 1024;
> +
> +// PMU lookup table entry types. Used to locate PMU table entries
> +// in the Fwsec image, corresponding to falcon ucodes.
> +#[allow(dead_code)]
> +const FALCON_UCODE_ENTRY_APPID_FIRMWARE_SEC_LIC: u8 = 0x05;
> +#[allow(dead_code)]
> +const FALCON_UCODE_ENTRY_APPID_FWSEC_DBG: u8 = 0x45;
> +const FALCON_UCODE_ENTRY_APPID_FWSEC_PROD: u8 = 0x85;
> +
> +pub(crate) struct Vbios {
> +    pub fwsec_image: Option<FwSecBiosImage>,
> +}
> +
> +impl Vbios {
> +    /// Read bytes from the ROM at the current end of the data vector
> +    fn read_more(bar0: &Devres<Bar0>, data: &mut KVec<u8>, len: usize) -> Result {
> +        let current_len = data.len();
> +        let start = ROM_OFFSET + current_len;
> +
> +        // Ensure length is a multiple of 4 for 32-bit reads
> +        if len % core::mem::size_of::<u32>() != 0 {
> +            pr_err!("VBIOS read length {} is not a multiple of 4\n", len);

Please don't use any of the pr_*() print macros within a driver, use the dev_*()
ones instead.

> +            return Err(EINVAL);
> +        }
> +
> +        // Allocate and zero-initialize the required memory

That's obvious from the code, if you feel this needs a comment, better explain
what we need it for, why zero-initialize, etc.

> +        data.extend_with(len, 0, GFP_KERNEL)?;
> +        with_bar!(?bar0, |bar0_ref| {
> +            let dst = &mut data[current_len..current_len + len];
> +            for (idx, chunk) in dst
> +                .chunks_exact_mut(core::mem::size_of::<u32>())
> +                .enumerate()
> +            {
> +                let addr = start + (idx * core::mem::size_of::<u32>());
> +                // Convert the u32 to a 4 byte array. We use the .to_ne_bytes()
> +                // method out of convenience to convert the 32-bit integer as it
> +                // is in memory into a byte array without any endianness
> +                // conversion or byte-swapping.
> +                chunk.copy_from_slice(&bar0_ref.try_read32(addr)?.to_ne_bytes());
> +            }
> +            Ok(())
> +        })?;
> +
> +        Ok(())
> +    }
> +
> +    /// Read bytes at a specific offset, filling any gap
> +    fn read_more_at_offset(
> +        bar0: &Devres<Bar0>,
> +        data: &mut KVec<u8>,
> +        offset: usize,
> +        len: usize,
> +    ) -> Result {
> +        if offset > BIOS_MAX_SCAN_LEN {
> +            pr_err!("Error: exceeded BIOS scan limit.\n");
> +            return Err(EINVAL);
> +        }
> +
> +        // If offset is beyond current data size, fill the gap first
> +        let current_len = data.len();
> +        let gap_bytes = if offset > current_len {
> +            offset - current_len
> +        } else {
> +            0
> +        };
> +
> +        // Now read the requested bytes at the offset
> +        Self::read_more(bar0, data, gap_bytes + len)
> +    }
> +
> +    /// Read a BIOS image at a specific offset and create a BiosImage from it.
> +    /// @data is extended as needed and a new BiosImage is returned.
> +    fn read_bios_image_at_offset(
> +        bar0: &Devres<Bar0>,
> +        data: &mut KVec<u8>,
> +        offset: usize,
> +        len: usize,
> +    ) -> Result<BiosImage> {
> +        if offset + len > data.len() {
> +            Self::read_more_at_offset(bar0, data, offset, len).inspect_err(|e| {
> +                pr_err!("Failed to read more at offset {:#x}: {:?}\n", offset, e)
> +            })?;
> +        }
> +
> +        BiosImage::try_from(&data[offset..offset + len]).inspect_err(|e| {
> +            pr_err!(
> +                "Failed to create BiosImage at offset {:#x}: {:?}\n",
> +                offset,
> +                e
> +            )
> +        })
> +    }
> +
> +    /// Probe for VBIOS extraction
> +    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
> +    pub(crate) fn probe(bar0: &Devres<Bar0>) -> Result<Self> {

Let's not call it probe(), what about VBios::parse(), or simply VBios::new()?

> +        // VBIOS data vector: As BIOS images are scanned, they are added to this vector
> +        // for reference or copying into other data structures. It is the entire
> +        // scanned contents of the VBIOS which progressively extends. It is used
> +        // so that we do not re-read any contents that are already read as we use
> +        // the cumulative length read so far, and re-read any gaps as we extend
> +        // the length
> +        let mut data = KVec::new();
> +
> +        // Loop through all the BiosImage and extract relevant ones and relevant data from them
> +        let mut cur_offset = 0;

I suggest to create a new type that contains data and offset and implement
read_bios_image_at_offset() and friends as methods of this type. I think this
would turn out much cleaner.

> +        let mut pci_at_image: Option<PciAtBiosImage> = None;
> +        let mut first_fwsec_image: Option<FwSecBiosImage> = None;
> +        let mut second_fwsec_image: Option<FwSecBiosImage> = None;

I don't really like that we need those mutable Option types because of the below
match, but I can't really see a better option, so I won't object.

> +
> +        // loop till break

This comment seems unnecessary, better explain what we loop over and why.

> +        loop {
> +            // Try to parse a BIOS image at the current offset
> +            // This will now check for all valid ROM signatures (0xAA55, 0xBB77, 0x4E56)
> +            let image_size =
> +                Self::read_bios_image_at_offset(bar0, &mut data, cur_offset, BIOS_READ_AHEAD_SIZE)
> +                    .and_then(|image| image.image_size_bytes())
> +                    .inspect_err(|e| {
> +                        pr_err!(
> +                            "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
> +                            cur_offset,
> +                            e
> +                        );
> +                    })?;
> +
> +            // Create a new BiosImage with the full image data
> +            let full_image =
> +                Self::read_bios_image_at_offset(bar0, &mut data, cur_offset, image_size)
> +                    .inspect_err(|e| {
> +                        pr_err!(
> +                            "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
> +                            cur_offset,
> +                            e
> +                        );
> +                    })?;
> +
> +            // Determine the image type
> +            let image_type = full_image.image_type_str();
> +
> +            pr_info!(

I think this should be a debug print.

> +                "Found BIOS image at offset {:#x}, size: {:#x}, type: {}\n",
> +                cur_offset,
> +                image_size,
> +                image_type
> +            );
> +
> +            let is_last = full_image.is_last();
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
> +
> +            // Break if this is the last image
> +            if is_last {
> +                break;
> +            }
> +
> +            // Move to the next image (aligned to 512 bytes)
> +            cur_offset += image_size;
> +            cur_offset = (cur_offset + 511) & !511;

This looks like we want some align_up() helper that should go into the kernel
crate.

Alternatively you can use Layout, but that doesn't really seem to match well.

> +
> +            // Safety check - don't go beyond BIOS_MAX_SCAN_LEN (1MB)
> +            if cur_offset > BIOS_MAX_SCAN_LEN {
> +                pr_err!("Error: exceeded BIOS scan limit, stopping scan\n");
> +                break;
> +            }
> +        } // end of loop

That's a good indicator that the loop is too long, can we please break it down a
bit? There seems to be some potential for moving things into subroutines.

> +
> +        // Using all the images, setup the falcon data pointer in Fwsec.
> +        // We need mutable access here, so we handle the Option manually.
> +        let final_fwsec_image = {
> +            let mut second = second_fwsec_image; // Take ownership of the option
> +            let first_ref = first_fwsec_image.as_ref();
> +            let pci_at_ref = pci_at_image.as_ref();

You could change this as follows, since first_fwsec_image and pci_at_image
aren't used afterwards anyways.

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 74735c083d47..62e2da576161 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -200,14 +200,12 @@ pub(crate) fn probe(bar0: &Devres<Bar0>) -> Result<Self> {
         // We need mutable access here, so we handle the Option manually.
         let final_fwsec_image = {
             let mut second = second_fwsec_image; // Take ownership of the option
-            let first_ref = first_fwsec_image.as_ref();
-            let pci_at_ref = pci_at_image.as_ref();

             if let (Some(second), Some(first), Some(pci_at)) =
-                (second.as_mut(), first_ref, pci_at_ref)
+                (second.as_mut(), first_fwsec_image, pci_at_image)
             {
                 second
-                    .setup_falcon_data(pci_at, first)
+                    .setup_falcon_data(&pci_at, &first)
                     .inspect_err(|e| pr_err!("Falcon data setup failed: {:?}\n", e))?;
             } else {
                 pr_err!("Missing required images for falcon data setup, skipping\n");

> +
> +            if let (Some(second), Some(first), Some(pci_at)) =
> +                (second.as_mut(), first_ref, pci_at_ref)
> +            {
> +                second
> +                    .setup_falcon_data(pci_at, first)
> +                    .inspect_err(|e| pr_err!("Falcon data setup failed: {:?}\n", e))?;
> +            } else {
> +                pr_err!("Missing required images for falcon data setup, skipping\n");
> +            }
> +            second // Return the potentially modified second image

What happens if we hit the else case above? Should this method be fallible
instead?

> +        };
> +
> +        Ok(Self {
> +            fwsec_image: final_fwsec_image,
> +        })
> +    }
> +
> +    pub(crate) fn fwsec_header(&self) -> Result<&FalconUCodeDescV3> {
> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
> +        image.fwsec_header()
> +    }
> +
> +    pub(crate) fn fwsec_ucode(&self) -> Result<&[u8]> {
> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
> +        image.fwsec_ucode(image.fwsec_header()?)
> +    }
> +
> +    pub(crate) fn fwsec_sigs(&self) -> Result<&[u8]> {
> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
> +        image.fwsec_sigs(image.fwsec_header()?)
> +    }
> +}
> +
> +/// PCI Data Structure as defined in PCI Firmware Specification
> +#[derive(Debug, Clone)]
> +#[repr(C)]
> +#[allow(dead_code)]
> +struct PcirStruct {
> +    /// PCI Data Structure signature ("PCIR" or "NPDS")
> +    pub signature: [u8; 4],
> +    /// PCI Vendor ID (e.g., 0x10DE for NVIDIA)
> +    pub vendor_id: u16,
> +    /// PCI Device ID
> +    pub device_id: u16,
> +    /// Device List Pointer
> +    pub device_list_ptr: u16,
> +    /// PCI Data Structure Length
> +    pub pci_data_struct_len: u16,
> +    /// PCI Data Structure Revision
> +    pub pci_data_struct_rev: u8,
> +    /// Class code (3 bytes, 0x03 for display controller)
> +    pub class_code: [u8; 3],
> +    /// Size of this image in 512-byte blocks
> +    pub image_len: u16,
> +    /// Revision Level of the Vendor's ROM
> +    pub vendor_rom_rev: u16,
> +    /// ROM image type (0x00 = PC-AT compatible, 0x03 = EFI, 0x70 = NBSI)
> +    pub code_type: u8,
> +    /// Last image indicator (0x00 = Not last image, 0x80 = Last image)
> +    pub last_image: u8,
> +    /// Maximum Run-time Image Length (units of 512 bytes)
> +    pub max_runtime_image_len: u16,
> +}
> +
> +impl TryFrom<&[u8]> for PcirStruct {
> +    type Error = Error;
> +
> +    fn try_from(data: &[u8]) -> Result<Self> {
> +        if data.len() < core::mem::size_of::<PcirStruct>() {
> +            pr_err!("Not enough data for PcirStruct\n");
> +            return Err(EINVAL);
> +        }
> +
> +        let mut signature = [0u8; 4];
> +        signature.copy_from_slice(&data[0..4]);
> +
> +        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e)
> +        if &signature != b"PCIR" && &signature != b"NPDS" {
> +            pr_err!("Invalid signature for PcirStruct: {:?}\n", signature);
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
> +}
> +
> +impl PcirStruct {
> +    /// Check if this is the last image in the ROM
> +    fn is_last(&self) -> bool {
> +        self.last_image & 0x80 != 0
> +    }
> +
> +    /// Calculate image size in bytes
> +    fn image_size_bytes(&self) -> Result<usize> {
> +        if self.image_len > 0 {
> +            // Image size is in 512-byte blocks
> +            Ok(self.image_len as usize * 512)
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +}
> +
> +/// BIOS Information Table (BIT) Header
> +/// This is the head of the BIT table, that is used to locate the Falcon data.
> +/// The BIT table (with its header) is in the PciAtBiosImage and the falcon data
> +/// it is pointing to is in the FwSecBiosImage.
> +#[derive(Debug, Clone, Copy)]
> +#[allow(dead_code)]
> +struct BitHeader {
> +    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
> +    pub id: u16,
> +    /// 2h: BIT Header Signature ("BIT\0")
> +    pub signature: [u8; 4],
> +    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
> +    pub bcd_version: u16,
> +    /// 8h: Size of BIT Header (in bytes)
> +    pub header_size: u8,
> +    /// 9h: Size of BIT Tokens (in bytes)
> +    pub token_size: u8,
> +    /// 10h: Number of token entries that follow
> +    pub token_entries: u8,
> +    /// 11h: BIT Header Checksum
> +    pub checksum: u8,
> +}
> +
> +impl TryFrom<&[u8]> for BitHeader {
> +    type Error = Error;
> +
> +    fn try_from(data: &[u8]) -> Result<Self> {
> +        if data.len() < 12 {
> +            return Err(EINVAL);
> +        }
> +
> +        let mut signature = [0u8; 4];
> +        signature.copy_from_slice(&data[2..6]);
> +
> +        // Check header ID and signature
> +        let id = u16::from_le_bytes([data[0], data[1]]);
> +        if id != 0xB8FF || &signature != b"BIT\0" {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(BitHeader {
> +            id,
> +            signature,
> +            bcd_version: u16::from_le_bytes([data[6], data[7]]),
> +            header_size: data[8],
> +            token_size: data[9],
> +            token_entries: data[10],
> +            checksum: data[11],
> +        })
> +    }
> +}
> +
> +/// BIT Token Entry: Records in the BIT table followed by the BIT header
> +#[derive(Debug, Clone, Copy)]
> +#[allow(dead_code)]
> +struct BitToken {
> +    /// 00h: Token identifier
> +    pub id: u8,
> +    /// 01h: Version of the token data
> +    pub data_version: u8,
> +    /// 02h: Size of token data in bytes
> +    pub data_size: u16,
> +    /// 04h: Offset to the token data
> +    pub data_offset: u16,
> +}
> +
> +// Define the token ID for the Falcon data
> +pub(in crate::vbios) const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;
> +
> +impl BitToken {
> +    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
> +    pub(in crate::vbios) fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
> +        let header = image.bit_header.as_ref().ok_or(EINVAL)?;
> +
> +        // Offset to the first token entry
> +        let tokens_start = image.bit_offset.unwrap() + header.header_size as usize;

Please don't use unwrap(). In case it is None this panics the kernel. Please
handle it properly and return an Error if it has an unexpected value.

> +
> +        for i in 0..header.token_entries as usize {
> +            let entry_offset = tokens_start + (i * header.token_size as usize);
> +
> +            // Make sure we don't go out of bounds
> +            if entry_offset + header.token_size as usize > image.base.data.len() {
> +                return Err(EINVAL);
> +            }
> +
> +            // Check if this token has the requested ID
> +            if image.base.data[entry_offset] == token_id {
> +                return Ok(BitToken {
> +                    id: image.base.data[entry_offset],
> +                    data_version: image.base.data[entry_offset + 1],
> +                    data_size: u16::from_le_bytes([
> +                        image.base.data[entry_offset + 2],
> +                        image.base.data[entry_offset + 3],
> +                    ]),
> +                    data_offset: u16::from_le_bytes([
> +                        image.base.data[entry_offset + 4],
> +                        image.base.data[entry_offset + 5],
> +                    ]),
> +                });
> +            }
> +        }
> +
> +        // Token not found
> +        Err(ENOENT)
> +    }
> +}
> +
> +/// PCI ROM Expansion Header as defined in PCI Firmware Specification.
> +/// This is header is at the beginning of every image in the set of
> +/// images in the ROM. It contains a pointer to the PCI Data Structure
> +/// which describes the image.
> +/// For "NBSI" images (NoteBook System Information), the ROM
> +/// header deviates from the standard and contains an offset to the
> +/// NBSI image however we do not yet parse that in this module and keep
> +/// it for future reference.
> +#[derive(Debug, Clone, Copy)]
> +#[allow(dead_code)]
> +struct PciRomHeader {
> +    /// 00h: Signature (0xAA55)
> +    pub signature: u16,
> +    /// 02h: Reserved bytes for processor architecture unique data (20 bytes)
> +    pub reserved: [u8; 20],
> +    /// 16h: NBSI Data Offset (NBSI-specific, offset from header to NBSI image)
> +    pub nbsi_data_offset: Option<u16>,
> +    /// 18h: Pointer to PCI Data Structure (offset from start of ROM image)
> +    pub pci_data_struct_offset: u16,
> +    /// 1Ah: Size of block (this is NBSI-specific)
> +    pub size_of_block: Option<u32>,
> +}
> +
> +impl TryFrom<&[u8]> for PciRomHeader {
> +    type Error = Error;
> +
> +    fn try_from(data: &[u8]) -> Result<Self> {
> +        if data.len() < 26 {
> +            // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock
> +            return Err(EINVAL);
> +        }
> +
> +        let signature = u16::from_le_bytes([data[0], data[1]]);
> +
> +        // Check for valid ROM signatures
> +        match signature {
> +            0xAA55 | 0xBB77 | 0x4E56 => {}
> +            _ => {
> +                pr_err!("ROM signature unknown {:#x}\n", signature);
> +                return Err(EINVAL);
> +            }
> +        }
> +
> +        // Read the pointer to the PCI Data Structure at offset 0x18
> +        let pci_data_struct_ptr = u16::from_le_bytes([data[24], data[25]]);
> +
> +        // Try to read optional fields if enough data
> +        let mut size_of_block = None;
> +        let mut nbsi_data_offset = None;
> +
> +        if data.len() >= 30 {
> +            // Read size_of_block at offset 0x1A
> +            size_of_block = Some(
> +                (data[29] as u32) << 24
> +                    | (data[28] as u32) << 16
> +                    | (data[27] as u32) << 8
> +                    | (data[26] as u32),
> +            );
> +        }
> +
> +        // For NBSI images, try to read the nbsiDataOffset at offset 0x16
> +        if data.len() >= 24 {
> +            nbsi_data_offset = Some(u16::from_le_bytes([data[22], data[23]]));
> +        }
> +
> +        Ok(PciRomHeader {
> +            signature,
> +            reserved: [0u8; 20],
> +            pci_data_struct_offset: pci_data_struct_ptr,
> +            size_of_block,
> +            nbsi_data_offset,
> +        })
> +    }
> +}
> +
> +/// NVIDIA PCI Data Extension Structure. This is similar to the
> +/// PCI Data Structure, but is Nvidia-specific and is placed right after
> +/// the PCI Data Structure. It contains some fields that are redundant
> +/// with the PCI Data Structure, but are needed for traversing the
> +/// BIOS images. It is expected to be present in all BIOS images except
> +/// for NBSI images.
> +#[derive(Debug, Clone)]
> +#[allow(dead_code)]
> +struct NpdeStruct {
> +    /// 00h: Signature ("NPDE")
> +    pub signature: [u8; 4],
> +    /// 04h: NVIDIA PCI Data Extension Revision
> +    pub npci_data_ext_rev: u16,
> +    /// 06h: NVIDIA PCI Data Extension Length
> +    pub npci_data_ext_len: u16,
> +    /// 08h: Sub-image Length (in 512-byte units)
> +    pub subimage_len: u16,
> +    /// 0Ah: Last image indicator flag
> +    pub last_image: u8,
> +}
> +
> +impl TryFrom<&[u8]> for NpdeStruct {
> +    type Error = Error;
> +
> +    fn try_from(data: &[u8]) -> Result<Self> {
> +        if data.len() < 11 {
> +            pr_err!("Not enough data for NpdeStruct\n");
> +            return Err(EINVAL);
> +        }
> +
> +        let mut signature = [0u8; 4];
> +        signature.copy_from_slice(&data[0..4]);
> +
> +        // Signature should be "NPDE" (0x4544504E)
> +        if &signature != b"NPDE" {
> +            pr_err!("Invalid signature for NpdeStruct: {:?}\n", signature);
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(NpdeStruct {
> +            signature,
> +            npci_data_ext_rev: u16::from_le_bytes([data[4], data[5]]),
> +            npci_data_ext_len: u16::from_le_bytes([data[6], data[7]]),
> +            subimage_len: u16::from_le_bytes([data[8], data[9]]),
> +            last_image: data[10],
> +        })
> +    }
> +}
> +
> +impl NpdeStruct {
> +    /// Check if this is the last image in the ROM
> +    fn is_last(&self) -> bool {
> +        self.last_image & 0x80 != 0

What's the magic number for?

> +    }
> +
> +    /// Calculate image size in bytes
> +    fn image_size_bytes(&self) -> Result<usize> {
> +        if self.subimage_len > 0 {
> +            // Image size is in 512-byte blocks
> +            Ok(self.subimage_len as usize * 512)
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +
> +    /// Try to find NPDE in the data, the NPDE is right after the PCIR.
> +    fn find_in_data(data: &[u8], rom_header: &PciRomHeader, pcir: &PcirStruct) -> Option<Self> {
> +        // Calculate the offset where NPDE might be located
> +        // NPDE should be right after the PCIR structure, aligned to 16 bytes
> +        let pcir_offset = rom_header.pci_data_struct_offset as usize;
> +        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
> +
> +        // Check if we have enough data
> +        if npde_start + 11 > data.len() {
> +            pr_err!("Not enough data for NPDE\n");
> +            return None;
> +        }
> +
> +        // Try to create NPDE from the data
> +        NpdeStruct::try_from(&data[npde_start..])
> +            .inspect_err(|e| {
> +                pr_err!("Error creating NpdeStruct: {:?}\n", e);
> +            })
> +            .ok()
> +    }
> +}
> +// Use a macro to implement BiosImage enum and methods. This avoids having to
> +// repeat each enum type when implementing functions like base() in BiosImage.
> +macro_rules! bios_image {
> +    (
> +        $($variant:ident $class:ident),* $(,)?
> +    ) => {
> +        // BiosImage enum with variants for each image type
> +        enum BiosImage {
> +            $($variant($class)),*
> +        }
> +
> +        impl BiosImage {
> +            /// Get a reference to the common BIOS image data regardless of type
> +            fn base(&self) -> &BiosImageBase {
> +                match self {
> +                    $(Self::$variant(img) => &img.base),*
> +                }
> +            }
> +
> +            /// Returns a string representing the type of BIOS image
> +            fn image_type_str(&self) -> &'static str {
> +                match self {
> +                    $(Self::$variant(_) => stringify!($variant)),*
> +                }
> +            }
> +        }
> +    }
> +}
> +
> +impl BiosImage {
> +    /// Check if this is the last image
> +    fn is_last(&self) -> bool {
> +        let base = self.base();
> +
> +        // For NBSI images (type == 0x70), return true as they're
> +        // considered the last image
> +        if matches!(self, Self::Nbsi(_)) {
> +            return true;
> +        }
> +
> +        // For other image types, check NPDE first if available
> +        if let Some(ref npde) = base.npde {
> +            return npde.is_last();
> +        }
> +
> +        // Otherwise, fall back to checking the PCIR last_image flag
> +        base.pcir.is_last()
> +    }
> +
> +    /// Get the image size in bytes
> +    fn image_size_bytes(&self) -> Result<usize> {
> +        let base = self.base();
> +
> +        // Prefer NPDE image size if available
> +        if let Some(ref npde) = base.npde {
> +            return npde.image_size_bytes();
> +        }
> +
> +        // Otherwise, fall back to the PCIR image size
> +        base.pcir.image_size_bytes()
> +    }
> +}
> +
> +bios_image! {
> +    PciAt PciAtBiosImage,   // PCI-AT compatible BIOS image
> +    Efi EfiBiosImage,       // EFI (Extensible Firmware Interface)
> +    Nbsi NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
> +    FwSec FwSecBiosImage    // FWSEC (Firmware Security)
> +}
> +
> +struct PciAtBiosImage {
> +    base: BiosImageBase,
> +    bit_header: Option<BitHeader>,
> +    bit_offset: Option<usize>,
> +}
> +
> +struct EfiBiosImage {
> +    base: BiosImageBase,
> +    // EFI-specific fields can be added here in the future.
> +}
> +
> +struct NbsiBiosImage {
> +    base: BiosImageBase,
> +    // NBSI-specific fields can be added here in the future.
> +}
> +
> +pub(crate) struct FwSecBiosImage {
> +    base: BiosImageBase,
> +    // FWSEC-specific fields
> +    // The offset of the Falcon data from the start of Fwsec image
> +    falcon_data_offset: Option<usize>,
> +    // The PmuLookupTable starts at the offset of the falcon data pointer
> +    pmu_lookup_table: Option<PmuLookupTable>,
> +    // The offset of the Falcon ucode
> +    falcon_ucode_offset: Option<usize>,
> +}
> +
> +// Convert from BiosImageBase to BiosImage
> +impl TryFrom<BiosImageBase> for BiosImage {
> +    type Error = Error;
> +
> +    fn try_from(base: BiosImageBase) -> Result<Self> {
> +        match base.pcir.code_type {
> +            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
> +            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
> +            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
> +            0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage {
> +                base,
> +                falcon_data_offset: None,
> +                pmu_lookup_table: None,
> +                falcon_ucode_offset: None,
> +            })),
> +            _ => {
> +                pr_err!("Unknown BIOS image type {:#x}\n", base.pcir.code_type);
> +                Err(EINVAL)
> +            }
> +        }
> +    }
> +}
> +
> +/// BiosImage creation from a byte slice. This creates a BiosImageBase
> +/// and then converts it to a BiosImage which triggers the constructor of
> +/// the specific BiosImage enum variant.
> +impl TryFrom<&[u8]> for BiosImage {
> +    type Error = Error;
> +
> +    fn try_from(data: &[u8]) -> Result<Self> {
> +        let base = BiosImageBase::try_from(data)?;
> +        let image = base.to_image()?;
> +
> +        image
> +            .image_size_bytes()
> +            .inspect_err(|_| pr_err!("Invalid image size computed during BiosImage creation\n"))?;
> +
> +        Ok(image)
> +    }
> +}
> +
> +/// BIOS Image structure containing various headers and references
> +/// fields base to all BIOS images. Each BiosImage type has a
> +/// BiosImageBase type along with other image-specific fields.
> +/// Note that Rust favors composition of types over inheritance.
> +#[derive(Debug)]
> +#[allow(dead_code)]
> +struct BiosImageBase {
> +    /// PCI ROM Expansion Header
> +    pub rom_header: PciRomHeader,
> +    /// PCI Data Structure
> +    pub pcir: PcirStruct,
> +    /// NVIDIA PCI Data Extension (optional)
> +    pub npde: Option<NpdeStruct>,
> +    /// Image data (includes ROM header and PCIR)
> +    pub data: KVec<u8>,

I think those fields don't need to have public visibility, given that the
structure has private visibility.

> +}
> +
> +impl BiosImageBase {
> +    fn to_image(self) -> Result<BiosImage> {
> +        BiosImage::try_from(self)
> +    }
> +}
> +
> +impl TryFrom<&[u8]> for BiosImageBase {
> +    type Error = Error;
> +
> +    fn try_from(data: &[u8]) -> Result<Self> {
> +        // Ensure we have enough data for the ROM header
> +        if data.len() < 26 {
> +            pr_err!("Not enough data for ROM header\n");
> +            return Err(EINVAL);
> +        }
> +
> +        // Parse the ROM header
> +        let rom_header = PciRomHeader::try_from(&data[0..26])
> +            .inspect_err(|e| pr_err!("Failed to create PciRomHeader: {:?}\n", e))?;
> +
> +        // Get the PCI Data Structure using the pointer from the ROM header
> +        let pcir_offset = rom_header.pci_data_struct_offset as usize;
> +        let pcir_data = data
> +            .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| {
> +                pr_err!(
> +                    "PCIR offset {:#x} out of bounds (data length: {})\n",
> +                    pcir_offset,
> +                    data.len()
> +                );
> +                pr_err!("Consider reading more data for construction of BiosImage\n");
> +            })?;
> +
> +        let pcir = PcirStruct::try_from(pcir_data)
> +            .inspect_err(|e| pr_err!("Failed to create PcirStruct: {:?}\n", e))?;
> +
> +        // Look for NPDE structure if this is not an NBSI image (type != 0x70)
> +        let npde = NpdeStruct::find_in_data(data, &rom_header, &pcir);
> +
> +        // Create a copy of the data
> +        let mut data_copy = KVec::new();
> +        data_copy.extend_with(data.len(), 0, GFP_KERNEL)?;
> +        data_copy.copy_from_slice(data);
> +
> +        Ok(BiosImageBase {
> +            rom_header,
> +            pcir,
> +            npde,
> +            data: data_copy,
> +        })
> +    }
> +}
> +
> +/// The PciAt BIOS image is typically the first BIOS image type found in the
> +/// BIOS image chain. It contains the BIT header and the BIT tokens.
> +impl PciAtBiosImage {
> +    /// Find a byte pattern in a slice
> +    fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Option<usize> {
> +        haystack
> +            .windows(needle.len())
> +            .position(|window| window == needle)
> +    }
> +
> +    /// Find the BIT header in the PciAtBiosImage
> +    fn find_bit_header(data: &[u8]) -> Result<(BitHeader, usize)> {
> +        let bit_pattern = [0xff, 0xb8, b'B', b'I', b'T', 0x00];
> +        let bit_offset = Self::find_byte_pattern(data, &bit_pattern);
> +        if bit_offset.is_none() {
> +            return Err(EINVAL);
> +        }
> +
> +        let bit_header = BitHeader::try_from(&data[bit_offset.unwrap()..])?;
> +        Ok((bit_header, bit_offset.unwrap()))
> +    }
> +
> +    /// Get a BIT token entry from the BIT table in the PciAtBiosImage
> +    fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
> +        BitToken::from_id(self, token_id)
> +    }
> +
> +    /// Find the Falcon data pointer structure in the PciAtBiosImage
> +    /// This is just a 4 byte structure that contains a pointer to the
> +    /// Falcon data in the FWSEC image.
> +    fn falcon_data_ptr(&self) -> Result<u32> {
> +        let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
> +
> +        // Make sure we don't go out of bounds
> +        if token.data_offset as usize + 4 > self.base.data.len() {
> +            return Err(EINVAL);
> +        }
> +
> +        // read the 4 bytes at the offset specified in the token
> +        let offset = token.data_offset as usize;
> +        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
> +            pr_err!("Failed to convert data slice to array");
> +            EINVAL
> +        })?;
> +
> +        let data_ptr = u32::from_le_bytes(bytes);
> +
> +        if (data_ptr as usize) < self.base.data.len() {
> +            pr_err!("Falcon data pointer out of bounds\n");
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(data_ptr)
> +    }
> +}
> +
> +impl TryFrom<BiosImageBase> for PciAtBiosImage {
> +    type Error = Error;
> +
> +    fn try_from(base: BiosImageBase) -> Result<Self> {
> +        let data_slice = &base.data;
> +        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
> +
> +        Ok(PciAtBiosImage {
> +            base,
> +            bit_header: Some(bit_header),
> +            bit_offset: Some(bit_offset),
> +        })
> +    }
> +}
> +
> +/// The PmuLookupTableEntry structure is a single entry in the PmuLookupTable.
> +/// See the PmuLookupTable description for more information.
> +#[allow(dead_code)]
> +struct PmuLookupTableEntry {
> +    application_id: u8,
> +    target_id: u8,
> +    data: u32,
> +}
> +
> +impl TryFrom<&[u8]> for PmuLookupTableEntry {
> +    type Error = Error;
> +
> +    fn try_from(data: &[u8]) -> Result<Self> {
> +        if data.len() < 5 {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(PmuLookupTableEntry {
> +            application_id: data[0],
> +            target_id: data[1],
> +            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
> +        })
> +    }
> +}
> +
> +/// The PmuLookupTableEntry structure is used to find the PmuLookupTableEntry
> +/// for a given application ID. The table of entries is pointed to by the falcon
> +/// data pointer in the BIT table, and is used to locate the Falcon Ucode.
> +#[allow(dead_code)]
> +struct PmuLookupTable {
> +    version: u8,
> +    header_len: u8,
> +    entry_len: u8,
> +    entry_count: u8,
> +    table_data: KVec<u8>,
> +}
> +
> +impl TryFrom<&[u8]> for PmuLookupTable {
> +    type Error = Error;
> +
> +    fn try_from(data: &[u8]) -> Result<Self> {
> +        if data.len() < 4 {
> +            return Err(EINVAL);
> +        }
> +
> +        let header_len = data[1] as usize;
> +        let entry_len = data[2] as usize;
> +        let entry_count = data[3] as usize;
> +
> +        let required_bytes = header_len + (entry_count * entry_len);
> +
> +        if data.len() < required_bytes {
> +            return Err(EINVAL);
> +        }
> +
> +        // Create a copy of only the table data
> +        let mut table_data = KVec::new();
> +
> +        // "last_entry_bytes" is a debugging aid.
> +        // let mut last_entry_bytes: Option<KVec<u8>> = Some(KVec::new());
> +
> +        for &byte in &data[header_len..required_bytes] {
> +            table_data.push(byte, GFP_KERNEL)?;
> +            /*
> +             * Uncomment for debugging (dumps the table data to dmesg):
> +             * last_entry_bytes.as_mut().ok_or(EINVAL)?.push(byte, GFP_KERNEL)?;
> +             *
> +             * let last_entry_bytes_len = last_entry_bytes.as_ref().ok_or(EINVAL)?.len();
> +             * if last_entry_bytes_len == entry_len {
> +             *     pr_info!("Last entry bytes: {:02x?}\n", &last_entry_bytes.as_ref().ok_or(EINVAL)?[..]);
> +             *     last_entry_bytes = Some(KVec::new());
> +             * }
> +             */

You could hide this behind cfg!(debug_assertions).

> +        }
> +
> +        Ok(PmuLookupTable {
> +            version: data[0],
> +            header_len: header_len as u8,
> +            entry_len: entry_len as u8,
> +            entry_count: entry_count as u8,
> +            table_data,
> +        })
> +    }
> +}
> +
> +impl PmuLookupTable {
> +    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
> +        if idx >= self.entry_count {
> +            return Err(EINVAL);
> +        }
> +
> +        let index = (idx as usize) * self.entry_len as usize;
> +        Ok(PmuLookupTableEntry::try_from(&self.table_data[index..])?)
> +    }
> +
> +    // find entry by type value
> +    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
> +        for i in 0..self.entry_count {
> +            let entry = self.lookup_index(i)?;
> +            if entry.application_id == entry_type {
> +                return Ok(entry);
> +            }
> +        }
> +
> +        Err(EINVAL)
> +    }
> +}
> +
> +/// The FwSecBiosImage structure contains the PMU table and the Falcon Ucode.
> +/// The PMU table contains voltage/frequency tables as well as a pointer to the
> +/// Falcon Ucode.
> +impl FwSecBiosImage {
> +    fn setup_falcon_data(
> +        &mut self,
> +        pci_at_image: &PciAtBiosImage,
> +        first_fwsec_image: &FwSecBiosImage,
> +    ) -> Result<()> {
> +        let mut offset = pci_at_image.falcon_data_ptr()? as usize;
> +
> +        // The falcon data pointer assumes that the PciAt and FWSEC images
> +        // are contiguous in memory. However, testing shows the EFI image sits in
> +        // between them. So calculate the offset from the end of the PciAt image
> +        // rather than the start of it. Compensate.
> +        offset -= pci_at_image.base.data.len();
> +
> +        // The offset is now from the start of the first Fwsec image, however
> +        // the offset points to a location in the second Fwsec image. Since
> +        // the fwsec images are contiguous, subtract the length of the first Fwsec
> +        // image from the offset to get the offset to the start of the second
> +        // Fwsec image.
> +        offset -= first_fwsec_image.base.data.len();
> +
> +        self.falcon_data_offset = Some(offset);
> +
> +        // The PmuLookupTable starts at the offset of the falcon data pointer
> +        self.pmu_lookup_table = Some(PmuLookupTable::try_from(&self.base.data[offset..])?);
> +
> +        match self
> +            .pmu_lookup_table
> +            .as_ref()
> +            .ok_or(EINVAL)?
> +            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
> +        {
> +            Ok(entry) => {
> +                let mut ucode_offset = entry.data as usize;
> +                ucode_offset -= pci_at_image.base.data.len();
> +                ucode_offset -= first_fwsec_image.base.data.len();
> +                self.falcon_ucode_offset = Some(ucode_offset);
> +
> +                /*
> +                 * Uncomment for debug: print the v3_desc header
> +                 * let v3_desc = self.fwsec_header()?;
> +                 * pr_info!("PmuLookupTableEntry v3_desc: {:#?}\n", v3_desc);
> +                 */
> +            }
> +            Err(e) => {
> +                pr_err!("PmuLookupTableEntry not found, error: {:?}\n", e);
> +            }
> +        }
> +        Ok(())
> +    }
> +
> +    /// TODO: These were borrowed from the old code for integrating this module
> +    /// with the outside world. They should be cleaned up and integrated properly.
> +    ///
> +    /// Get the FwSec header (FalconUCodeDescV3)
> +    fn fwsec_header(&self) -> Result<&FalconUCodeDescV3> {
> +        // Get the falcon ucode offset that was found in setup_falcon_data
> +        let falcon_ucode_offset = self.falcon_ucode_offset.ok_or(EINVAL)? as usize;
> +
> +        // Make sure the offset is within the data bounds
> +        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
> +            pr_err!("fwsec-frts header not contained within BIOS bounds\n");
> +            return Err(ERANGE);
> +        }
> +
> +        // Read the first 4 bytes to get the version
> +        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
> +            .try_into()
> +            .map_err(|_| EINVAL)?;
> +        let hdr = u32::from_le_bytes(hdr_bytes);
> +        let ver = (hdr & 0xff00) >> 8;
> +
> +        if ver != 3 {
> +            pr_err!("invalid fwsec firmware version\n");
> +            return Err(EINVAL);
> +        }
> +
> +        // Return a reference to the FalconUCodeDescV3 structure
> +        Ok(unsafe {
> +            &*(self.base.data.as_ptr().add(falcon_ucode_offset) as *const FalconUCodeDescV3)
> +        })
> +    }
> +    /// Get the ucode data as a byte slice
> +    fn fwsec_ucode(&self, v3_desc: &FalconUCodeDescV3) -> Result<&[u8]> {
> +        let falcon_ucode_offset = self.falcon_ucode_offset.ok_or(EINVAL)? as usize;
> +
> +        // The ucode data follows the descriptor
> +        let ucode_data_offset = falcon_ucode_offset + v3_desc.size();
> +        let size = (v3_desc.imem_load_size + v3_desc.dmem_load_size) as usize;
> +
> +        // Get the data slice, checking bounds in a single operation
> +        self.base
> +            .data
> +            .get(ucode_data_offset..ucode_data_offset + size)
> +            .ok_or(ERANGE)
> +            .inspect_err(|_| pr_err!("fwsec ucode data not contained within BIOS bounds\n"))
> +    }
> +
> +    /// Get the signatures as a byte slice
> +    fn fwsec_sigs(&self, v3_desc: &FalconUCodeDescV3) -> Result<&[u8]> {
> +        const SIG_SIZE: usize = 96 * 4;
> +
> +        let falcon_ucode_offset = self.falcon_ucode_offset.ok_or(EINVAL)? as usize;
> +
> +        // The signatures data follows the descriptor
> +        let sigs_data_offset = falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
> +        let size = v3_desc.signature_count as usize * SIG_SIZE;
> +
> +        // Make sure the data is within bounds
> +        if sigs_data_offset + size > self.base.data.len() {
> +            pr_err!("fwsec signatures data not contained within BIOS bounds\n");
> +            return Err(ERANGE);
> +        }
> +
> +        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
> +    }
> +}
> 
> -- 
> 2.49.0
> 
