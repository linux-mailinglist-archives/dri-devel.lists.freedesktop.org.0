Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C648FAB5996
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 18:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386F110E1A1;
	Tue, 13 May 2025 16:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NKp6WFf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D31910E186;
 Tue, 13 May 2025 16:19:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E74E49EF9;
 Tue, 13 May 2025 16:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CAFC4CEE4;
 Tue, 13 May 2025 16:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747153181;
 bh=TPD0hgSQEcIoW3jnOcNGMyezHtRWBYTTpnzC0hJ4dc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKp6WFf+vQHhsMg8Jo29pvpi/C/on9TZ+8PD1aCfUI/Yu/is0rm5uAIVS+jfNJ9vW
 mMikAU15EwslOM2pGNj7pMwO1Raj4ssbgtgSLiTsdhLgyN6Ax49FsP1N815pJe6/Kd
 XpwbojclgiKAiv/p7oE0gnlT+0rnjDZZu1q/vMLq0e1SOTBizbOs07yCEZ9uPfCqS4
 MAPclLxGcHE5/AgHs8n/omBWTNNs+hZ8ouwu+4R1W9S5XT6BhGzybDuzgYnO+x6+bm
 eUEQQjU3kYjhc+NEEhGGQa+F2TXSe/ET2RmBuivDrnix72QE3owc1WJ4lbu0zlL3Bt
 uHgNACMghBwoA==
Date: Tue, 13 May 2025 18:19:33 +0200
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
Subject: Re: [PATCH v3 13/19] gpu: nova-core: add falcon register definitions
 and base code
Message-ID: <aCNxFc3Z3TMi5rYt@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-13-fcb02749754d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-13-fcb02749754d@nvidia.com>
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

On Wed, May 07, 2025 at 10:52:40PM +0900, Alexandre Courbot wrote:
> Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
> GSP and SEC2 Falcons that will be required to boot the GSP.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs           | 540 ++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/falcon/gsp.rs       |  22 ++
>  drivers/gpu/nova-core/falcon/hal.rs       |  56 ++++
>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 120 +++++++
>  drivers/gpu/nova-core/falcon/sec2.rs      |   8 +
>  drivers/gpu/nova-core/gpu.rs              |  11 +
>  drivers/gpu/nova-core/nova_core.rs        |   1 +
>  drivers/gpu/nova-core/regs.rs             | 125 +++++++
>  drivers/gpu/nova-core/util.rs             |   1 -
>  9 files changed, 883 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..b6552496ad9c5f8eeda4beaa757c7393f495072b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -0,0 +1,540 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Falcon microprocessor base support
> +
> +// To be removed when all code is used.
> +#![expect(dead_code)]
> +
> +use core::time::Duration;
> +use hal::FalconHal;
> +use kernel::bindings;
> +use kernel::device;
> +use kernel::prelude::*;
> +use kernel::sync::Arc;
> +use kernel::types::ARef;
> +
> +use crate::driver::Bar0;
> +use crate::gpu::Chipset;
> +use crate::regs;
> +use crate::util;
> +
> +pub(crate) mod gsp;
> +mod hal;
> +pub(crate) mod sec2;
> +
> +/// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
> +/// register.
> +#[repr(u8)]
> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
> +pub(crate) enum FalconCoreRev {
> +    #[default]
> +    Rev1 = 1,
> +    Rev2 = 2,
> +    Rev3 = 3,
> +    Rev4 = 4,
> +    Rev5 = 5,
> +    Rev6 = 6,
> +    Rev7 = 7,
> +}
> +
> +impl TryFrom<u8> for FalconCoreRev {
> +    type Error = Error;
> +
> +    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {

Here and below, please use Result<T>, which comes from kernel::prelude.

> +        use FalconCoreRev::*;
> +
> +        let rev = match value {
> +            1 => Rev1,
> +            2 => Rev2,
> +            3 => Rev3,
> +            4 => Rev4,
> +            5 => Rev5,
> +            6 => Rev6,
> +            7 => Rev7,
> +            _ => return Err(EINVAL),
> +        };
> +
> +        Ok(rev)
> +    }
> +}
> +
> +/// Revision subversion number of a falcon core, used in the
> +/// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
> +#[repr(u8)]
> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
> +pub(crate) enum FalconCoreRevSubversion {
> +    #[default]
> +    Subversion0 = 0,
> +    Subversion1 = 1,
> +    Subversion2 = 2,
> +    Subversion3 = 3,
> +}
> +
> +impl TryFrom<u8> for FalconCoreRevSubversion {
> +    type Error = Error;
> +
> +    fn try_from(value: u8) -> Result<Self> {
> +        use FalconCoreRevSubversion::*;
> +
> +        let sub_version = match value & 0b11 {
> +            0 => Subversion0,
> +            1 => Subversion1,
> +            2 => Subversion2,
> +            3 => Subversion3,
> +            _ => return Err(EINVAL),
> +        };
> +
> +        Ok(sub_version)
> +    }
> +}
> +
> +/// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
> +/// register.
> +#[repr(u8)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub(crate) enum FalconSecurityModel {
> +    /// Non-Secure: runs unsigned code without privileges.
> +    #[default]
> +    None = 0,
> +    /// Low-secure: runs unsigned code with some privileges. Can only be entered from `Heavy` mode.
> +    Light = 2,
> +    /// High-Secure: runs signed code with full privileges.
> +    Heavy = 3,
> +}
> +
> +impl TryFrom<u8> for FalconSecurityModel {
> +    type Error = Error;
> +
> +    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
> +        use FalconSecurityModel::*;
> +
> +        let sec_model = match value {
> +            0 => None,
> +            2 => Light,
> +            3 => Heavy,
> +            _ => return Err(EINVAL),
> +        };
> +
> +        Ok(sec_model)
> +    }
> +}
> +
> +/// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
> +/// register.
> +#[repr(u8)]
> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
> +pub(crate) enum FalconModSelAlgo {
> +    /// RSA3K.
> +    #[default]
> +    Rsa3k = 1,
> +}
> +
> +impl TryFrom<u8> for FalconModSelAlgo {
> +    type Error = Error;
> +
> +    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
> +        match value {
> +            1 => Ok(FalconModSelAlgo::Rsa3k),
> +            _ => Err(EINVAL),
> +        }
> +    }
> +}
> +
> +/// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
> +#[repr(u8)]
> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
> +pub(crate) enum DmaTrfCmdSize {
> +    /// 256 bytes transfer.
> +    #[default]
> +    Size256B = 0x6,
> +}
> +
> +impl TryFrom<u8> for DmaTrfCmdSize {
> +    type Error = Error;
> +
> +    fn try_from(value: u8) -> Result<Self> {
> +        match value {
> +            0x6 => Ok(Self::Size256B),
> +            _ => Err(EINVAL),
> +        }
> +    }
> +}
> +
> +/// Currently active core on a dual falcon/riscv (Peregrine) controller.
> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +pub(crate) enum PeregrineCoreSelect {
> +    /// Falcon core is active.
> +    Falcon = 0,
> +    /// RISC-V core is active.
> +    Riscv = 1,
> +}
> +
> +impl From<bool> for PeregrineCoreSelect {
> +    fn from(value: bool) -> Self {
> +        match value {
> +            false => PeregrineCoreSelect::Falcon,
> +            true => PeregrineCoreSelect::Riscv,
> +        }
> +    }
> +}
> +
> +/// Different types of memory present in a falcon core.
> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +pub(crate) enum FalconMem {
> +    /// Instruction Memory.
> +    Imem,
> +    /// Data Memory.
> +    Dmem,
> +}
> +
> +/// Target/source of a DMA transfer to/from falcon memory.
> +#[derive(Debug, Clone, Default)]
> +pub(crate) enum FalconFbifTarget {
> +    /// VRAM.
> +    #[default]
> +    LocalFb = 0,
> +    /// Coherent system memory.
> +    CoherentSysmem = 1,
> +    /// Non-coherent system memory.
> +    NoncoherentSysmem = 2,
> +}
> +
> +impl TryFrom<u8> for FalconFbifTarget {
> +    type Error = Error;
> +
> +    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
> +        let res = match value {
> +            0 => Self::LocalFb,
> +            1 => Self::CoherentSysmem,
> +            2 => Self::NoncoherentSysmem,
> +            _ => return Err(EINVAL),
> +        };
> +
> +        Ok(res)
> +    }
> +}
> +
> +/// Type of memory addresses to use.
> +#[derive(Debug, Clone, Default)]
> +pub(crate) enum FalconFbifMemType {
> +    /// Physical memory addresses.
> +    #[default]
> +    Virtual = 0,
> +    /// Virtual memory addresses.
> +    Physical = 1,

NIT: Looks like the doc-comments are the wrong way around.

> +}
> +
> +impl From<bool> for FalconFbifMemType {
> +    fn from(value: bool) -> Self {
> +        match value {
> +            false => Self::Virtual,
> +            true => Self::Physical,
> +        }
> +    }
> +}

This conversion seems a bit odd; how is false a canonical value to convert to
FalconFbifMemType::Virtual and true for FalconFbifMemType:::Physical?

Oh, I see. It comes from a register field of a single bit. Maybe it's worth
adding a brief comment.

> +
> +/// Trait defining the parameters of a given Falcon instance.
> +pub(crate) trait FalconEngine: Sync {
> +    /// Base I/O address for the falcon, relative from which its registers are accessed.
> +    const BASE: usize;
> +}
> +
> +/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
> +#[derive(Debug)]
> +pub(crate) struct FalconLoadTarget {
> +    /// Offset from the start of the source object to copy from.
> +    pub(crate) src_start: u32,
> +    /// Offset from the start of the destination memory to copy into.
> +    pub(crate) dst_start: u32,
> +    /// Number of bytes to copy.
> +    pub(crate) len: u32,
> +}
> +
> +/// Parameters for the falcon boot ROM.
> +#[derive(Debug)]
> +pub(crate) struct FalconBromParams {
> +    /// Offset in `DMEM`` of the firmware's signature.
> +    pub(crate) pkc_data_offset: u32,
> +    /// Mask of engines valid for this firmware.
> +    pub(crate) engine_id_mask: u16,
> +    /// ID of the ucode used to infer a fuse register to validate the signature.
> +    pub(crate) ucode_id: u8,
> +}
> +
> +/// Trait for a falcon firmware.
> +pub(crate) trait FalconFirmware {
> +    /// Engine on which this firmware is to be loaded.
> +    type Target: FalconEngine;
> +
> +    /// Returns the DMA handle of the object containing the firmware.
> +    fn dma_handle(&self) -> bindings::dma_addr_t;
> +
> +    /// Returns the load parameters for `IMEM`.
> +    fn imem_load(&self) -> FalconLoadTarget;
> +
> +    /// Returns the load parameters for `DMEM`.
> +    fn dmem_load(&self) -> FalconLoadTarget;
> +
> +    /// Returns the parameters to write into the BROM registers.
> +    fn brom_params(&self) -> FalconBromParams;
> +
> +    /// Returns the start address of the firmware.
> +    fn boot_addr(&self) -> u32;
> +}
> +
> +/// Contains the base parameters common to all Falcon instances.
> +pub(crate) struct Falcon<E: FalconEngine> {
> +    hal: Arc<dyn FalconHal<E>>,

TODO: Convert to Box, once Box supports type coercion?

Nevermind, you have the comment in create_falcon_hal().

> +    dev: ARef<device::Device>,
> +}
> +
> +impl<E: FalconEngine + 'static> Falcon<E> {
> +    /// Create a new falcon instance.
> +    ///
> +    /// `need_riscv` is set to `true` if the caller expects the falcon to be a dual falcon/riscv
> +    /// controller.
> +    pub(crate) fn new(
> +        dev: &device::Device,
> +        chipset: Chipset,
> +        bar: &Bar0,
> +        need_riscv: bool,
> +    ) -> Result<Self> {
> +        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, E::BASE);
> +        // Ensure that the revision and security model contain valid values.
> +        let _rev = hwcfg1.core_rev()?;
> +        let _sec_model = hwcfg1.security_model()?;

Why not just `_`?

> +
> +        if need_riscv {
> +            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
> +            if !hwcfg2.riscv() {
> +                dev_err!(
> +                    dev,
> +                    "riscv support requested on a controller that does not support it\n"
> +                );
> +                return Err(EINVAL);
> +            }
> +        }
> +
> +        Ok(Self {
> +            hal: hal::create_falcon_hal(chipset)?,
> +            dev: dev.into(),
> +        })
> +    }
> +
> +    /// Wait for memory scrubbing to complete.
> +    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result<()> {

Here and below, please use `Result` instead of `Result<()>`.

> +        util::wait_on(Duration::from_millis(20), || {
> +            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
> +            if r.mem_scrubbing() {
> +                Some(())
> +            } else {
> +                None
> +            }
> +        })
> +    }
> +
> +    /// Reset the falcon engine.
> +    fn reset_eng(&self, bar: &Bar0) -> Result<()> {
> +        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
> +
> +        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
> +        // RESET_READY so a non-failing timeout is used.

Should we still warn about it?

> +        let _ = util::wait_on(Duration::from_micros(150), || {

Do we know for sure that if RESET_READY is not set after 150us, it won't ever be
set? If the answer to that is yes, and we also do not want to warn about
RESET_READY not being set, why even bother trying to read it in the first place?

> +            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
> +            if r.reset_ready() {
> +                Some(())
> +            } else {
> +                None
> +            }
> +        });
> +
> +        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(true));
> +
> +        let _: Result<()> = util::wait_on(Duration::from_micros(10), || None);

Can we please get an abstraction for udelay() for this?

> +
> +        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(false));
> +
> +        self.reset_wait_mem_scrubbing(bar)?;
> +
> +        Ok(())
> +    }
> +
> +    /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
> +    pub(crate) fn reset(&self, bar: &Bar0) -> Result<()> {
> +        self.reset_eng(bar)?;
> +        self.hal.select_core(self, bar)?;
> +        self.reset_wait_mem_scrubbing(bar)?;
> +
> +        regs::NV_PFALCON_FALCON_RM::default()
> +            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
> +            .write(bar, E::BASE);
> +
> +        Ok(())
> +    }
> +
> +    /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
> +    /// `target_mem`.
> +    ///
> +    /// `sec` is set if the loaded firmware is expected to run in secure mode.
> +    fn dma_wr(
> +        &self,
> +        bar: &Bar0,
> +        dma_handle: bindings::dma_addr_t,
> +        target_mem: FalconMem,
> +        load_offsets: FalconLoadTarget,
> +        sec: bool,
> +    ) -> Result<()> {
> +        const DMA_LEN: u32 = 256;
> +
> +        // For IMEM, we want to use the start offset as a virtual address tag for each page, since
> +        // code addresses in the firmware (and the boot vector) are virtual.
> +        //
> +        // For DMEM we can fold the start offset into the DMA handle.
> +        let (src_start, dma_start) = match target_mem {
> +            FalconMem::Imem => (load_offsets.src_start, dma_handle),
> +            FalconMem::Dmem => (
> +                0,
> +                dma_handle + load_offsets.src_start as bindings::dma_addr_t,
> +            ),
> +        };
> +        if dma_start % DMA_LEN as bindings::dma_addr_t > 0 {
> +            dev_err!(
> +                self.dev,
> +                "DMA transfer start addresses must be a multiple of {}",
> +                DMA_LEN
> +            );
> +            return Err(EINVAL);
> +        }
> +        if load_offsets.len % DMA_LEN > 0 {
> +            dev_err!(
> +                self.dev,
> +                "DMA transfer length must be a multiple of {}",
> +                DMA_LEN
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        // Set up the base source DMA address.
> +
> +        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
> +            .set_base((dma_start >> 8) as u32)
> +            .write(bar, E::BASE);
> +        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
> +            .set_base((dma_start >> 40) as u16)
> +            .write(bar, E::BASE);
> +
> +        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
> +            .set_size(DmaTrfCmdSize::Size256B)
> +            .set_imem(target_mem == FalconMem::Imem)
> +            .set_sec(if sec { 1 } else { 0 });
> +
> +        for pos in (0..load_offsets.len).step_by(DMA_LEN as usize) {
> +            // Perform a transfer of size `DMA_LEN`.
> +            regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
> +                .set_offs(load_offsets.dst_start + pos)
> +                .write(bar, E::BASE);
> +            regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
> +                .set_offs(src_start + pos)
> +                .write(bar, E::BASE);
> +            cmd.write(bar, E::BASE);
> +
> +            // Wait for the transfer to complete.
> +            util::wait_on(Duration::from_millis(2000), || {
> +                let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, E::BASE);
> +                if r.idle() {
> +                    Some(())
> +                } else {
> +                    None
> +                }
> +            })?;
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
> +    pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result<()> {
> +        let dma_handle = fw.dma_handle();
> +
> +        regs::NV_PFALCON_FBIF_CTL::alter(bar, E::BASE, |v| v.set_allow_phys_no_ctx(true));
> +        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, E::BASE);
> +        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, E::BASE, |v| {
> +            v.set_target(FalconFbifTarget::CoherentSysmem)
> +                .set_mem_type(FalconFbifMemType::Physical)
> +        });
> +
> +        self.dma_wr(bar, dma_handle, FalconMem::Imem, fw.imem_load(), true)?;
> +        self.dma_wr(bar, dma_handle, FalconMem::Dmem, fw.dmem_load(), true)?;
> +
> +        self.hal.program_brom(self, bar, &fw.brom_params())?;
> +
> +        // Set `BootVec` to start of non-secure code.
> +        regs::NV_PFALCON_FALCON_BOOTVEC::default()
> +            .set_value(fw.boot_addr())
> +            .write(bar, E::BASE);
> +
> +        Ok(())
> +    }
> +
> +    /// Start running the loaded firmware.
> +    ///
> +    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
> +    /// prior to running.
> +    ///
> +    /// Returns `MBOX0` and `MBOX1` after the firmware has stopped running.
> +    pub(crate) fn boot(
> +        &self,
> +        bar: &Bar0,
> +        mbox0: Option<u32>,
> +        mbox1: Option<u32>,
> +    ) -> Result<(u32, u32)> {
> +        if let Some(mbox0) = mbox0 {
> +            regs::NV_PFALCON_FALCON_MAILBOX0::default()
> +                .set_value(mbox0)
> +                .write(bar, E::BASE);
> +        }
> +
> +        if let Some(mbox1) = mbox1 {
> +            regs::NV_PFALCON_FALCON_MAILBOX1::default()
> +                .set_value(mbox1)
> +                .write(bar, E::BASE);
> +        }
> +
> +        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE).alias_en() {
> +            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
> +                .set_startcpu(true)
> +                .write(bar, E::BASE),
> +            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
> +                .set_startcpu(true)
> +                .write(bar, E::BASE),
> +        }
> +
> +        util::wait_on(Duration::from_secs(2), || {
> +            let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE);
> +            if r.halted() {
> +                Some(())
> +            } else {
> +                None
> +            }
> +        })?;
> +
> +        let (mbox0, mbox1) = (
> +            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, E::BASE).value(),
> +            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, E::BASE).value(),
> +        );
> +
> +        Ok((mbox0, mbox1))
> +    }
> +
> +    /// Returns the fused version of the signature to use in order to run a HS firmware on this
> +    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
> +    pub(crate) fn get_signature_reg_fuse_version(
> +        &self,
> +        bar: &Bar0,
> +        engine_id_mask: u16,
> +        ucode_id: u8,
> +    ) -> Result<u32> {
> +        self.hal
> +            .get_signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..f74aeadaee9ae96bb1961d3c55b2cf1999943377
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::{
> +    driver::Bar0,
> +    falcon::{Falcon, FalconEngine},
> +    regs,
> +};
> +
> +pub(crate) struct Gsp;
> +impl FalconEngine for Gsp {
> +    const BASE: usize = 0x00110000;
> +}
> +
> +impl Falcon<Gsp> {
> +    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
> +    /// allow GSP to signal CPU for processing new messages in message queue.
> +    pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
> +        regs::NV_PFALCON_FALCON_IRQSCLR::default()
> +            .set_swgen0(true)
> +            .write(bar, Gsp::BASE);
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..0b0ab8174caafeec3a2a2ba8211a740b7feadb75
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::prelude::*;
> +use kernel::sync::Arc;
> +
> +use crate::driver::Bar0;
> +use crate::falcon::{Falcon, FalconBromParams, FalconEngine};
> +use crate::gpu::Chipset;
> +
> +mod ga102;
> +
> +/// Hardware Abstraction Layer for Falcon cores.
> +///
> +/// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
> +/// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
> +/// registers.
> +pub(crate) trait FalconHal<E: FalconEngine>: Sync {
> +    // Activates the Falcon core if the engine is a risvc/falcon dual engine.
> +    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result<()> {
> +        Ok(())
> +    }
> +
> +    /// Returns the fused version of the signature to use in order to run a HS firmware on this
> +    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
> +    fn get_signature_reg_fuse_version(
> +        &self,
> +        falcon: &Falcon<E>,
> +        bar: &Bar0,
> +        engine_id_mask: u16,
> +        ucode_id: u8,
> +    ) -> Result<u32>;
> +
> +    // Program the boot ROM registers prior to starting a secure firmware.
> +    fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams)
> +        -> Result<()>;
> +}
> +
> +/// Returns a boxed falcon HAL adequate for the passed `chipset`.
> +///
> +/// We use this function and a heap-allocated trait object instead of statically defined trait
> +/// objects because of the two-dimensional (Chipset, Engine) lookup required to return the
> +/// requested HAL.
> +///
> +/// TODO: replace the return type with `KBox` once it gains the ability to host trait objects.
> +pub(crate) fn create_falcon_hal<E: FalconEngine + 'static>(
> +    chipset: Chipset,
> +) -> Result<Arc<dyn FalconHal<E>>> {
> +    let hal = match chipset {
> +        Chipset::GA102 | Chipset::GA103 | Chipset::GA104 | Chipset::GA106 | Chipset::GA107 => {
> +            Arc::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as Arc<dyn FalconHal<E>>
> +        }
> +        _ => return Err(ENOTSUPP),
> +    };
> +
> +    Ok(hal)
> +}
> diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..68d807c192a16a908f40b65f9b03d107f4042b63
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::marker::PhantomData;
> +use core::time::Duration;
> +
> +use kernel::{device, prelude::*};
> +
> +use crate::driver::Bar0;
> +use crate::falcon::{
> +    Falcon, FalconBromParams, FalconEngine, FalconModSelAlgo, PeregrineCoreSelect,
> +};
> +use crate::regs;
> +use crate::util;
> +
> +use super::FalconHal;
> +
> +fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result<()> {
> +    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
> +    if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
> +        regs::NV_PRISCV_RISCV_BCR_CTRL::default()
> +            .set_core_select(PeregrineCoreSelect::Falcon)
> +            .write(bar, E::BASE);
> +
> +        util::wait_on(Duration::from_millis(10), || {
> +            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
> +            if r.valid() {
> +                Some(())
> +            } else {
> +                None
> +            }
> +        })?;
> +    }
> +
> +    Ok(())
> +}
> +
> +fn get_signature_reg_fuse_version_ga102(
> +    dev: &device::Device,
> +    bar: &Bar0,
> +    engine_id_mask: u16,
> +    ucode_id: u8,
> +) -> Result<u32> {
> +    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
> +    // registers, which are an array. Our register definition macros do not allow us to manage them
> +    // properly, so we need to hardcode their addresses for now.
> +
> +    // Each engine has 16 ucode version registers numbered from 1 to 16.
> +    if ucode_id == 0 || ucode_id > 16 {
> +        dev_warn!(dev, "invalid ucode id {:#x}", ucode_id);

Given that this is an error condition, this should be dev_err!() I suppose.

> +        return Err(EINVAL);
> +    }
> +    let reg_fuse = if engine_id_mask & 0x0001 != 0 {
> +        // NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION
> +        0x824140
> +    } else if engine_id_mask & 0x0004 != 0 {
> +        // NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION
> +        0x824100
> +    } else if engine_id_mask & 0x0400 != 0 {
> +        // NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION
> +        0x8241c0
> +    } else {
> +        dev_warn!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);

s/dev_warn/dev_err/

> +        return Err(EINVAL);
> +    } + ((ucode_id - 1) as usize * core::mem::size_of::<u32>());

I feel like this calculation deserves a comment.

> +
> +    let reg_fuse_version = bar.read32(reg_fuse);

I feel like the calculation of reg_fuse should be abstracted with a dedicated
type in regs.rs. that takes the magic number derived from the engine_id_mask
(which I assume is chip specific) and the ucode_id.

> +
> +    // Equivalent of Find Last Set bit.
> +    Ok(u32::BITS - reg_fuse_version.leading_zeros())

Maybe we should create a generic helper for that?

> +}
> +
> +fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result<()> {
> +    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
> +        .set_value(params.pkc_data_offset)
> +        .write(bar, E::BASE);
> +    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
> +        .set_value(params.engine_id_mask as u32)
> +        .write(bar, E::BASE);
> +    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
> +        .set_ucode_id(params.ucode_id)
> +        .write(bar, E::BASE);
> +    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
> +        .set_algo(FalconModSelAlgo::Rsa3k)
> +        .write(bar, E::BASE);
> +
> +    Ok(())
> +}
> +
> +pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
> +
> +impl<E: FalconEngine> Ga102<E> {
> +    pub(super) fn new() -> Self {
> +        Self(PhantomData)
> +    }
> +}
> +
> +impl<E: FalconEngine> FalconHal<E> for Ga102<E> {
> +    fn select_core(&self, _falcon: &Falcon<E>, bar: &Bar0) -> Result<()> {
> +        select_core_ga102::<E>(bar)
> +    }
> +
> +    fn get_signature_reg_fuse_version(
> +        &self,
> +        falcon: &Falcon<E>,
> +        bar: &Bar0,
> +        engine_id_mask: u16,
> +        ucode_id: u8,
> +    ) -> Result<u32> {
> +        get_signature_reg_fuse_version_ga102(&falcon.dev, bar, engine_id_mask, ucode_id)
> +    }
> +
> +    fn program_brom(
> +        &self,
> +        _falcon: &Falcon<E>,
> +        bar: &Bar0,
> +        params: &FalconBromParams,
> +    ) -> Result<()> {
> +        program_brom_ga102::<E>(bar, params)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..c1efdaa7c4e1b8c04c4e041aae3b61a8b65f656b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/sec2.rs
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::falcon::FalconEngine;
> +
> +pub(crate) struct Sec2;
> +impl FalconEngine for Sec2 {
> +    const BASE: usize = 0x00840000;
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index c338da69ecbc2200f1ef3061a4d62971b021e3eb..ece13594fba687f3f714e255b5436e72d80dece3 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -5,6 +5,7 @@
>  use crate::devinit;
>  use crate::dma::DmaObject;
>  use crate::driver::Bar0;
> +use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
>  use crate::firmware::Firmware;
>  use crate::regs;
>  use crate::util;
> @@ -227,6 +228,16 @@ pub(crate) fn new(
>              page
>          };
>  
> +        let gsp_falcon = Falcon::<Gsp>::new(
> +            pdev.as_ref(),
> +            spec.chipset,
> +            bar,
> +            spec.chipset > Chipset::GA100,
> +        )?;
> +        gsp_falcon.clear_swgen0_intr(bar);
> +
> +        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;

Just `_` instead? Also, please add a comment why it is important to create this
instance even though it's never used.

> +
>          Ok(pin_init!(Self {
>              spec,
>              bar: devres_bar,
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 1c7333e9fabe357f3ecbc6944ca98b66fa17c9a5..8342482a1aa16da2e69f7d99143c1549a82c969e 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -5,6 +5,7 @@
>  mod devinit;
>  mod dma;
>  mod driver;
> +mod falcon;
>  mod firmware;
>  mod gpu;
>  mod regs;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 218cb6441eb0e5c6e5b52eabba006163eec0c8b4..b5c6eeb6ed873a06b4aefcb375f4944eb0b20597 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -9,6 +9,10 @@
>  #[macro_use]
>  mod macros;
>  
> +use crate::falcon::{
> +    DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
> +    FalconModSelAlgo, FalconSecurityModel, PeregrineCoreSelect,
> +};
>  use crate::gpu::{Architecture, Chipset};
>  
>  /* PMC */
> @@ -59,3 +63,124 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
>  register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
>      31:0    value as u32;
>  });
> +
> +/* PFALCON */
> +
> +register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {
> +    4:4     halt as bool;
> +    6:6     swgen0 as bool;
> +});
> +
> +register!(NV_PFALCON_FALCON_MAILBOX0 @ +0x00000040 {
> +    31:0    value as u32;
> +});
> +
> +register!(NV_PFALCON_FALCON_MAILBOX1 @ +0x00000044 {
> +    31:0    value as u32;
> +});
> +
> +register!(NV_PFALCON_FALCON_RM @ +0x00000084 {
> +    31:0    value as u32;
> +});
> +
> +register!(NV_PFALCON_FALCON_HWCFG2 @ +0x000000f4 {
> +    10:10   riscv as bool;
> +    12:12   mem_scrubbing as bool;
> +    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
> +});
> +
> +register!(NV_PFALCON_FALCON_CPUCTL @ +0x00000100 {
> +    1:1     startcpu as bool;
> +    4:4     halted as bool;
> +    6:6     alias_en as bool;
> +});
> +
> +register!(NV_PFALCON_FALCON_BOOTVEC @ +0x00000104 {
> +    31:0    value as u32;
> +});
> +
> +register!(NV_PFALCON_FALCON_DMACTL @ +0x0000010c {
> +    0:0     require_ctx as bool;
> +    1:1     dmem_scrubbing as bool;
> +    2:2     imem_scrubbing as bool;
> +    6:3     dmaq_num as u8;
> +    7:7     secure_stat as bool;
> +});
> +
> +register!(NV_PFALCON_FALCON_DMATRFBASE @ +0x00000110 {
> +    31:0    base as u32;
> +});
> +
> +register!(NV_PFALCON_FALCON_DMATRFMOFFS @ +0x00000114 {
> +    23:0    offs as u32;
> +});
> +
> +register!(NV_PFALCON_FALCON_DMATRFCMD @ +0x00000118 {
> +    0:0     full as bool;
> +    1:1     idle as bool;
> +    3:2     sec as u8;
> +    4:4     imem as bool;
> +    5:5     is_write as bool;
> +    10:8    size as u8 ?=> DmaTrfCmdSize;
> +    14:12   ctxdma as u8;
> +    16:16   set_dmtag as u8;
> +});
> +
> +register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ +0x0000011c {
> +    31:0    offs as u32;
> +});
> +
> +register!(NV_PFALCON_FALCON_DMATRFBASE1 @ +0x00000128 {
> +    8:0     base as u16;
> +});
> +
> +register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
> +    3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
> +    5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
> +    7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
> +});
> +
> +register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ +0x00000130 {
> +    1:1     startcpu as bool;
> +});
> +
> +// Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
> +// instance.
> +register!(NV_PFALCON_FALCON_ENGINE @ +0x000003c0 {
> +    0:0     reset as bool;
> +});
> +
> +// TODO: this is an array of registers.
> +register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
> +    1:0     target as u8 ?=> FalconFbifTarget;
> +    2:2     mem_type as bool => FalconFbifMemType;
> +});
> +
> +register!(NV_PFALCON_FBIF_CTL @ +0x00000624 {
> +    7:7     allow_phys_no_ctx as bool;
> +});
> +
> +register!(NV_PFALCON2_FALCON_MOD_SEL @ +0x00001180 {
> +    7:0     algo as u8 ?=> FalconModSelAlgo;
> +});
> +
> +register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ +0x00001198 {
> +    7:0    ucode_id as u8;
> +});
> +
> +register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ +0x0000119c {
> +    31:0    value as u32;
> +});
> +
> +// TODO: this is an array of registers.
> +register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ +0x00001210 {
> +    31:0    value as u32;
> +});
> +
> +/* PRISCV */
> +
> +register!(NV_PRISCV_RISCV_BCR_CTRL @ +0x00001668 {
> +    0:0     valid as bool;
> +    4:4     core_select as bool => PeregrineCoreSelect;
> +    8:8     br_fetch as bool;
> +});
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
> index afb525228431a2645afe7bb34988e9537757b1d7..81fcfff1f6f437d2f6a2130ce2249fbf4c1501be 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -34,7 +34,6 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
>  ///
>  /// TODO: replace with `read_poll_timeout` once it is available.
>  /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
> -#[expect(dead_code)]
>  pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
>      let start_time = Ktime::ktime_get();
>  
> 
> -- 
> 2.49.0
> 
