Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB0AB719C
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 18:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA3510E69C;
	Wed, 14 May 2025 16:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mDR1DZ62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC6610E691;
 Wed, 14 May 2025 16:38:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 476CD61155;
 Wed, 14 May 2025 16:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48083C4CEE3;
 Wed, 14 May 2025 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747240716;
 bh=z4yO4w6YWV+ihNavzuqiZiU5uLoQ1fOq+ciCWp+enGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mDR1DZ62JlzkJMUQD3V+fm4TPpAAWdPsJPSZ7fqsEAYyGAW1Fd3Rn3Deuii6zlgpM
 7fn5Fe5T4s61JUtK3XjADpLt9ZBy1s7/oOiMgsH6+ilqDZnQP9Ow8EwZGZ4Q+QpDP7
 u09YAeCRjF2NDjHFozUPWBo1kmEawdb7x9wqS+5bfqR/svcIiO5QDL9FJqmKAQs4+y
 RG6XUlB74hzwNGL6VANOsvYx6K8TbD94B8q16jo7tXOOjIGHjV+7lPL0T/Td4+iPpf
 c1Ddair5327kNfuLr6j43s37gW/kvskOAckb5wQbvp16+Y1PANDDyVAVXrNXfhZ+r7
 d8f6rJbIlSiiQ==
Date: Wed, 14 May 2025 18:38:28 +0200
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
Subject: Re: [PATCH v3 18/19] gpu: nova-core: extract FWSEC from BIOS and
 patch it to run FWSEC-FRTS
Message-ID: <aCTHBO0Wqx3rc81W@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-18-fcb02749754d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-18-fcb02749754d@nvidia.com>
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

On Wed, May 07, 2025 at 10:52:45PM +0900, Alexandre Courbot wrote:
> The FWSEC firmware needs to be extracted from the VBIOS and patched with
> the desired command, as well as the right signature. Do this so we are
> ready to load and run this firmware into the GSP falcon and create the
> FRTS region.
> 
> [joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/dma.rs            |   3 -
>  drivers/gpu/nova-core/firmware.rs       |  18 ++
>  drivers/gpu/nova-core/firmware/fwsec.rs | 359 ++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gpu.rs            |  20 +-
>  drivers/gpu/nova-core/vbios.rs          |   3 -
>  5 files changed, 395 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
> index 9d90ae01d0044eaab4ddbc3eba216741d7a623ef..a12d0dff574aa38fb5eb8f4d759611af2f8ba3ec 100644
> --- a/drivers/gpu/nova-core/dma.rs
> +++ b/drivers/gpu/nova-core/dma.rs
> @@ -2,9 +2,6 @@
>  
>  //! Simple DMA object wrapper.
>  
> -// To be removed when all code is used.
> -#![expect(dead_code)]
> -
>  use core::ops::{Deref, DerefMut};
>  
>  use kernel::device;
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 960982174d834c7c66a47ecfb3a15bf47116b2c5..3945fd18499555ddd6fb2e0ea69535b40fcc4b08 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -8,9 +8,12 @@
>  use kernel::prelude::*;
>  use kernel::str::CString;
>  
> +use crate::dma::DmaObject;
>  use crate::gpu;
>  use crate::gpu::Chipset;
>  
> +pub(crate) mod fwsec;
> +
>  pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
>  
>  /// Structure encapsulating the firmware blobs required for the GPU to operate.
> @@ -86,6 +89,21 @@ pub(crate) fn size(&self) -> usize {
>      }
>  }
>  
> +/// Patch the `ucode_dma` firmware at offset `sig_base_img` with `signature`.
> +fn patch_signature(ucode_dma: &mut DmaObject, signature: &[u8], sig_base_img: usize) -> Result<()> {
> +    if sig_base_img + signature.len() > ucode_dma.size() {
> +        return Err(EINVAL);
> +    }
> +
> +    // SAFETY: we are the only user of this object, so there cannot be any race.
> +    let dst = unsafe { ucode_dma.start_ptr_mut().add(sig_base_img) };
> +
> +    // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
> +    unsafe { core::ptr::copy_nonoverlapping(signature.as_ptr(), dst, signature.len()) };
> +
> +    Ok(())
> +}

Why is this not in firmware/fwsec.rs, like patch_command()?

Also, please wrap the ucode DmaObject in its own type, i.e.
`struct UcodeDma(DmaObject)` and make the patch_*() functions methods of this
type. They're only applicable for the ucode DmaObject.

> +
>  pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
>  
>  impl<const N: usize> ModInfoBuilder<N> {
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..d7e3418b49ab4ad478e73c0d447a832ed68ecd0a
> --- /dev/null
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -0,0 +1,359 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! FWSEC is a High Secure firmware that is extracted from the BIOS and performs the first step of
> +//! the GSP startup by creating the WPR2 memory region and copying critical areas of the VBIOS into
> +//! it after authenticating them, ensuring they haven't been tampered with. It runs on the GSP
> +//! falcon.
> +//!
> +//! Before being run, it needs to be patched in two areas:
> +//!
> +//! - The command to be run, as this firmware can perform several tasks ;
> +//! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
> +
> +use core::alloc::Layout;
> +
> +use kernel::bindings;
> +use kernel::device::{self, Device};
> +use kernel::prelude::*;
> +use kernel::transmute::FromBytes;
> +
> +use crate::dma::DmaObject;
> +use crate::driver::Bar0;
> +use crate::falcon::gsp::Gsp;
> +use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadTarget};
> +use crate::firmware::FalconUCodeDescV3;
> +use crate::vbios::Vbios;
> +
> +const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
> +
> +#[repr(C)]
> +#[derive(Debug)]
> +struct FalconAppifHdrV1 {
> +    version: u8,
> +    header_size: u8,
> +    entry_size: u8,
> +    entry_count: u8,
> +}
> +// SAFETY: any byte sequence is valid for this struct.
> +unsafe impl FromBytes for FalconAppifHdrV1 {}
> +
> +#[repr(C, packed)]
> +#[derive(Debug)]
> +struct FalconAppifV1 {
> +    id: u32,
> +    dmem_base: u32,
> +}
> +// SAFETY: any byte sequence is valid for this struct.
> +unsafe impl FromBytes for FalconAppifV1 {}
> +
> +#[derive(Debug)]
> +#[repr(C, packed)]
> +struct FalconAppifDmemmapperV3 {
> +    signature: u32,
> +    version: u16,
> +    size: u16,
> +    cmd_in_buffer_offset: u32,
> +    cmd_in_buffer_size: u32,
> +    cmd_out_buffer_offset: u32,
> +    cmd_out_buffer_size: u32,
> +    nvf_img_data_buffer_offset: u32,
> +    nvf_img_data_buffer_size: u32,
> +    printf_buffer_hdr: u32,
> +    ucode_build_time_stamp: u32,
> +    ucode_signature: u32,
> +    init_cmd: u32,
> +    ucode_feature: u32,
> +    ucode_cmd_mask0: u32,
> +    ucode_cmd_mask1: u32,
> +    multi_tgt_tbl: u32,
> +}
> +// SAFETY: any byte sequence is valid for this struct.
> +unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
> +
> +#[derive(Debug)]
> +#[repr(C, packed)]
> +struct ReadVbios {
> +    ver: u32,
> +    hdr: u32,
> +    addr: u64,
> +    size: u32,
> +    flags: u32,
> +}
> +// SAFETY: any byte sequence is valid for this struct.
> +unsafe impl FromBytes for ReadVbios {}
> +
> +#[derive(Debug)]
> +#[repr(C, packed)]
> +struct FrtsRegion {
> +    ver: u32,
> +    hdr: u32,
> +    addr: u32,
> +    size: u32,
> +    ftype: u32,
> +}
> +// SAFETY: any byte sequence is valid for this struct.
> +unsafe impl FromBytes for FrtsRegion {}
> +
> +const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
> +
> +#[repr(C, packed)]
> +struct FrtsCmd {
> +    read_vbios: ReadVbios,
> +    frts_region: FrtsRegion,
> +}
> +// SAFETY: any byte sequence is valid for this struct.
> +unsafe impl FromBytes for FrtsCmd {}
> +
> +const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
> +const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
> +
> +/// Command for the [`FwsecFirmware`] to execute.
> +pub(crate) enum FwsecCommand {
> +    /// Asks [`FwsecFirmware`] to carve out the WPR2 area and place a verified copy of the VBIOS
> +    /// image into it.
> +    Frts { frts_addr: u64, frts_size: u64 },
> +    /// Asks [`FwsecFirmware`] to load pre-OS apps on the PMU.
> +    #[expect(dead_code)]
> +    Sb,
> +}
> +
> +/// Reinterpret the area starting from `offset` in `fw` as an instance of `T` (which must implement
> +/// [`FromBytes`]) and return a reference to it.
> +///
> +/// # Safety
> +///
> +/// Callers must ensure that the region of memory returned is not written for as long as the
> +/// returned reference is alive.
> +///
> +/// TODO: Remove this and `transmute_mut` once we have a way to transmute objects implementing
> +/// FromBytes, e.g.:
> +/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
> +unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
> +    fw: &'a DmaObject,
> +    offset: usize,
> +) -> Result<&'b T> {
> +    if offset + core::mem::size_of::<T>() > fw.size() {
> +        return Err(EINVAL);
> +    }
> +    if (fw.start_ptr() as usize + offset) % core::mem::align_of::<T>() != 0 {
> +        return Err(EINVAL);
> +    }
> +
> +    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
> +    // large enough the contains an instance of `T`, which implements `FromBytes`.
> +    Ok(unsafe { &*(fw.start_ptr().add(offset) as *const T) })
> +}
> +
> +/// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
> +/// implement [`FromBytes`]) and return a reference to it.
> +///
> +/// # Safety
> +///
> +/// Callers must ensure that the region of memory returned is not read or written for as long as
> +/// the returned reference is alive.
> +unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
> +    fw: &'a mut DmaObject,
> +    offset: usize,
> +) -> Result<&'b mut T> {
> +    if offset + core::mem::size_of::<T>() > fw.size() {
> +        return Err(EINVAL);
> +    }
> +    if (fw.start_ptr_mut() as usize + offset) % core::mem::align_of::<T>() != 0 {
> +        return Err(EINVAL);
> +    }
> +
> +    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
> +    // large enough the contains an instance of `T`, which implements `FromBytes`.
> +    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset) as *mut T) })
> +}
> +
> +/// Patch the Fwsec firmware image in `fw` to run the command `cmd`.
> +fn patch_command(fw: &mut DmaObject, v3_desc: &FalconUCodeDescV3, cmd: FwsecCommand) -> Result<()> {
> +    let hdr_offset = (v3_desc.imem_load_size + v3_desc.interface_offset) as usize;
> +    // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared `fw` with
> +    // the hardware yet.
> +    let hdr: &FalconAppifHdrV1 = unsafe { transmute(fw, hdr_offset) }?;
> +
> +    if hdr.version != 1 {
> +        return Err(EINVAL);
> +    }
> +
> +    // Find the DMEM mapper section in the firmware.
> +    for i in 0..hdr.entry_count as usize {
> +        let app: &FalconAppifV1 =
> +            // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared
> +            // `fw` with the hardware yet.
> +            unsafe {
> +                transmute(
> +                    fw,
> +                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
> +                )
> +            }?;
> +
> +        if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
> +            continue;
> +        }
> +
> +        let dmem_mapper: &mut FalconAppifDmemmapperV3 =
> +            // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared
> +            // `fw` with the hardware yet.
> +            unsafe { transmute_mut(fw, (v3_desc.imem_load_size + app.dmem_base) as usize) }?;
> +
> +        // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared `fw`
> +        // with the hardware yet.
> +        let frts_cmd: &mut FrtsCmd = unsafe {
> +            transmute_mut(
> +                fw,
> +                (v3_desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
> +            )
> +        }?;
> +
> +        frts_cmd.read_vbios = ReadVbios {
> +            ver: 1,
> +            hdr: core::mem::size_of::<ReadVbios>() as u32,
> +            addr: 0,
> +            size: 0,
> +            flags: 2,
> +        };
> +
> +        dmem_mapper.init_cmd = match cmd {
> +            FwsecCommand::Frts {
> +                frts_addr,
> +                frts_size,
> +            } => {
> +                frts_cmd.frts_region = FrtsRegion {
> +                    ver: 1,
> +                    hdr: core::mem::size_of::<FrtsRegion>() as u32,
> +                    addr: (frts_addr >> 12) as u32,
> +                    size: (frts_size >> 12) as u32,
> +                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
> +                };
> +
> +                NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
> +            }
> +            FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
> +        };
> +
> +        // Return early as we found and patched the DMEMMAPPER region.
> +        return Ok(());
> +    }
> +
> +    Err(ENOTSUPP)
> +}
> +
> +/// Firmware extracted from the VBIOS and responsible for e.g. carving out the WPR2 region as the
> +/// first step of the GSP bootflow.
> +pub(crate) struct FwsecFirmware {
> +    desc: FalconUCodeDescV3,
> +    ucode: DmaObject,
> +}
> +
> +impl FalconFirmware for FwsecFirmware {
> +    type Target = Gsp;
> +
> +    fn dma_handle(&self) -> bindings::dma_addr_t {
> +        self.ucode.dma_handle()
> +    }
> +
> +    fn imem_load(&self) -> FalconLoadTarget {
> +        FalconLoadTarget {
> +            src_start: 0,
> +            dst_start: self.desc.imem_phys_base,
> +            len: self.desc.imem_load_size,
> +        }
> +    }
> +
> +    fn dmem_load(&self) -> FalconLoadTarget {
> +        FalconLoadTarget {
> +            src_start: self.desc.imem_load_size,
> +            dst_start: self.desc.dmem_phys_base,
> +            len: Layout::from_size_align(self.desc.dmem_load_size as usize, 256)
> +                // Cannot panic, as 256 is non-zero and a power of 2.
> +                .unwrap()
> +                .pad_to_align()
> +                .size() as u32,
> +        }
> +    }
> +
> +    fn brom_params(&self) -> FalconBromParams {
> +        FalconBromParams {
> +            pkc_data_offset: self.desc.pkc_data_offset,
> +            engine_id_mask: self.desc.engine_id_mask,
> +            ucode_id: self.desc.ucode_id,
> +        }
> +    }
> +
> +    fn boot_addr(&self) -> u32 {
> +        0
> +    }
> +}
> +
> +impl FwsecFirmware {
> +    /// Extract the Fwsec firmware from `bios` and patch it to run with the `cmd` command.
> +    pub(crate) fn new(
> +        falcon: &Falcon<Gsp>,
> +        dev: &Device<device::Bound>,
> +        bar: &Bar0,
> +        bios: &Vbios,
> +        cmd: FwsecCommand,
> +    ) -> Result<Self> {
> +        let v3_desc = bios.fwsec_header(dev)?;
> +        let ucode = bios.fwsec_ucode(dev)?;
> +
> +        let mut ucode_dma = DmaObject::from_data(dev, ucode)?;
> +        patch_command(&mut ucode_dma, v3_desc, cmd)?;
> +
> +        const SIG_SIZE: usize = 96 * 4;

96 * 4? :-)

> +        let signatures = bios.fwsec_sigs(dev)?;
> +        let sig_base_img = (v3_desc.imem_load_size + v3_desc.pkc_data_offset) as usize;
> +
> +        if v3_desc.signature_count != 0 {
> +            // Patch signature.
> +            let desc_sig_versions = v3_desc.signature_versions as u32;
> +            let reg_fuse_version = falcon.get_signature_reg_fuse_version(
> +                bar,
> +                v3_desc.engine_id_mask,
> +                v3_desc.ucode_id,
> +            )?;
> +            dev_dbg!(
> +                dev,
> +                "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
> +                desc_sig_versions,
> +                reg_fuse_version
> +            );
> +            let signature_idx = {
> +                let reg_fuse_version_bit = 1 << reg_fuse_version;
> +
> +                // Check if the fuse version is supported by the firmware.
> +                if desc_sig_versions & reg_fuse_version_bit == 0 {
> +                    dev_warn!(
> +                        dev,
> +                        "no matching signature: {:#x} {:#x}\n",
> +                        reg_fuse_version_bit,
> +                        v3_desc.signature_versions
> +                    );

Looks like this should be dev_err!().

> +                    return Err(EINVAL);
> +                }
> +
> +                // `desc_sig_versions` has one bit set per included signature. Thus, the index of
> +                // the signature to patch is the number of bits in `desc_sig_versions` set to `1`
> +                // before `reg_fuse_version_bit`.
> +
> +                // Mask of the bits of `desc_sig_versions` to preserve.
> +                let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
> +
> +                (desc_sig_versions & reg_fuse_version_mask).count_ones()
> +            };
> +
> +            dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
> +            let signature_start = signature_idx as usize * SIG_SIZE;
> +            let signature = &signatures[signature_start..signature_start + SIG_SIZE];
> +            super::patch_signature(&mut ucode_dma, signature, sig_base_img)?;
> +        }
> +
> +        Ok(FwsecFirmware {
> +            desc: v3_desc.clone(),
> +            ucode: ucode_dma,
> +        })
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index a3d96639706e808305cce66416778d2bf6e7e683..ad71402dbfced2aaa84800a32dbac276b9706803 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -6,6 +6,7 @@
>  use crate::dma::DmaObject;
>  use crate::driver::Bar0;
>  use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
> +use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
>  use crate::firmware::Firmware;
>  use crate::gsp::fb::FbLayout;
>  use crate::regs;
> @@ -197,7 +198,11 @@ pub(crate) fn new(
>      ) -> Result<impl PinInit<Self>> {
>          let bar = devres_bar.access(pdev.as_ref())?;
>          let spec = Spec::new(bar)?;
> -        let fw = Firmware::new(pdev.as_ref(), spec.chipset, "535.113.01")?;
> +        let fw = Firmware::new(
> +            pdev.as_ref(),
> +            spec.chipset,
> +            crate::firmware::FIRMWARE_VERSION,
> +        )?;
>  
>          dev_info!(
>              pdev.as_ref(),
> @@ -243,7 +248,18 @@ pub(crate) fn new(
>          let fb_layout = FbLayout::new(spec.chipset, bar)?;
>          dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
>  
> -        let _bios = Vbios::new(pdev, bar)?;
> +        let bios = Vbios::new(pdev, bar)?;
> +
> +        let _fwsec_frts = FwsecFirmware::new(
> +            &gsp_falcon,
> +            pdev.as_ref(),
> +            bar,
> +            &bios,
> +            FwsecCommand::Frts {
> +                frts_addr: fb_layout.frts.start,
> +                frts_size: fb_layout.frts.end - fb_layout.frts.start,
> +            },
> +        )?;
>  
>          Ok(pin_init!(Self {
>              spec,
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index cd55d8dbf8e12d532f776d7544c7e5f2a865d6f8..71846dbbd512b6996d9f3a3c76aecde9d62460c0 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -2,9 +2,6 @@
>  
>  //! VBIOS extraction and parsing.
>  
> -// To be removed when all code is used.
> -#![expect(dead_code)]
> -
>  use crate::driver::Bar0;
>  use crate::firmware::FalconUCodeDescV3;
>  use core::convert::TryFrom;
> 
> -- 
> 2.49.0
> 
