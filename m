Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF93A96F33
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 16:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E43A10E5C1;
	Tue, 22 Apr 2025 14:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bo3pshyw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E86D10E0D0;
 Tue, 22 Apr 2025 14:44:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE43A5C0F2C;
 Tue, 22 Apr 2025 14:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9394DC4CEE9;
 Tue, 22 Apr 2025 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745333088;
 bh=3YYaqQpGD2G06m6l7TNEk6e+fszKrUbeTO6Ooav+qp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bo3pshywgwiQ55LGqsFt0ZNMt+RA6vhHs94QZrDfNyo0GnWanguufJ5VFoPaZU1kT
 wBwD6ZIWyFaBsT7pBSyEm9s2Xf77yNW/fKnXigEhBuWQI5rtr1mSr8uOt4rh5fXI49
 q1HhG3AV0qzi65yZinAyj3RBJSTAhnP+lri+/IJxhfzCFwKeSk8wqN/gNu6a6U9i/W
 iDUDZzxFnC3ru1wnHFcYSDbPm+n+7Vgrl6vVyOqRbOsOOE9RXvcVbIHR4asJ4/foRC
 8Ffvp2W6Hj/AaVfJixdc/iXZAvMsdb82UnMw8jpPVGEvjC5ZjoyHH56qi6s0WFrsME
 aSAAZWt/eh1Jg==
Date: Tue, 22 Apr 2025 16:44:40 +0200
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
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions
 and base code
Message-ID: <aAerWF9j5d01pQv0@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
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

This patch could probably split up a bit, to make it more pleasant to review. :)

On Sun, Apr 20, 2025 at 09:19:43PM +0900, Alexandre Courbot wrote:
> 
> +#[repr(u8)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub(crate) enum FalconSecurityModel {
> +    #[default]
> +    None = 0,
> +    Light = 2,
> +    Heavy = 3,
> +}

Please add an explanation for the different security modules. Where are the
differences?

I think most of the structures, registers, abbreviations, etc. introduced in
this patch need some documentation.

Please see https://docs.kernel.org/gpu/nova/guidelines.html#documentation.

> +
> +impl TryFrom<u32> for FalconSecurityModel {
> +    type Error = Error;
> +
> +    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
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
> +impl From<u32> for FalconCoreRevSubversion {
> +    fn from(value: u32) -> Self {
> +        use FalconCoreRevSubversion::*;
> +
> +        match value & 0b11 {
> +            0 => Subversion0,
> +            1 => Subversion1,
> +            2 => Subversion2,
> +            3 => Subversion3,
> +            // SAFETY: the `0b11` mask limits the possible values to `0..=3`.
> +            4..=u32::MAX => unsafe { unreachable_unchecked() },
> +        }

FalconCoreRev uses TryFrom to avoid unsafe code, I think FalconCoreRevSubversion
should do the same thing.

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
> +#[derive(Debug)]
> +pub(crate) struct FalconBromParams {
> +    pub(crate) pkc_data_offset: u32,
> +    pub(crate) engine_id_mask: u16,
> +    pub(crate) ucode_id: u8,
> +}
> +
> +pub(crate) trait FalconFirmware {
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
> +    pub hal: Arc<dyn FalconHal<E>>,

This should probably be private and instead should be exposed via Deref.

Also, please see my comment at create_falcon_hal() regarding the dynamic
dispatch.

> +}
> +
> +impl<E: FalconEngine + 'static> Falcon<E> {
> +    pub(crate) fn new(
> +        pdev: &pci::Device,
> +        chipset: Chipset,
> +        bar: &Devres<Bar0>,
> +        need_riscv: bool,
> +    ) -> Result<Self> {
> +        let hwcfg1 = with_bar!(bar, |b| regs::FalconHwcfg1::read(b, E::BASE))?;
> +        // Ensure that the revision and security model contain valid values.
> +        let _rev = hwcfg1.core_rev()?;
> +        let _sec_model = hwcfg1.security_model()?;
> +
> +        if need_riscv {
> +            let hwcfg2 = with_bar!(bar, |b| regs::FalconHwcfg2::read(b, E::BASE))?;
> +            if !hwcfg2.riscv() {
> +                dev_err!(
> +                    pdev.as_ref(),
> +                    "riscv support requested on falcon that does not support it\n"
> +                );
> +                return Err(EINVAL);
> +            }
> +        }
> +
> +        Ok(Self {
> +            hal: hal::create_falcon_hal(chipset)?,

I'd prefer to move the contents of create_falcon_hal() into this constructor.

> +        })
> +    }
> +
> +    fn reset_wait_mem_scrubbing(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
> +        timer.wait_on(bar, Duration::from_millis(20), || {
> +            bar.try_access_with(|b| regs::FalconHwcfg2::read(b, E::BASE))
> +                .and_then(|r| if r.mem_scrubbing() { Some(()) } else { None })
> +        })
> +    }
> +
> +    fn reset_eng(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
> +        let _ = with_bar!(bar, |b| regs::FalconHwcfg2::read(b, E::BASE))?;
> +
> +        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
> +        // RESET_READY so a non-failing timeout is used.
> +        let _ = timer.wait_on(bar, Duration::from_micros(150), || {
> +            bar.try_access_with(|b| regs::FalconHwcfg2::read(b, E::BASE))
> +                .and_then(|r| if r.reset_ready() { Some(()) } else { None })
> +        });
> +
> +        with_bar!(bar, |b| regs::FalconEngine::alter(b, E::BASE, |v| v
> +            .set_reset(true)))?;
> +
> +        let _: Result<()> = timer.wait_on(bar, Duration::from_micros(10), || None);
> +
> +        with_bar!(bar, |b| regs::FalconEngine::alter(b, E::BASE, |v| v
> +            .set_reset(false)))?;
> +
> +        self.reset_wait_mem_scrubbing(bar, timer)?;
> +
> +        Ok(())
> +    }
> +
> +    pub(crate) fn reset(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
> +        self.reset_eng(bar, timer)?;
> +        self.hal.select_core(bar, timer)?;
> +        self.reset_wait_mem_scrubbing(bar, timer)?;
> +
> +        with_bar!(bar, |b| {
> +            regs::FalconRm::default()
> +                .set_val(regs::Boot0::read(b).into())
> +                .write(b, E::BASE)
> +        })
> +    }
> +
> +    fn dma_wr(
> +        &self,
> +        bar: &Devres<Bar0>,
> +        timer: &Timer,
> +        dma_handle: bindings::dma_addr_t,
> +        target_mem: FalconMem,
> +        load_offsets: FalconLoadTarget,
> +        sec: bool,
> +    ) -> Result<()> {
> +        const DMA_LEN: u32 = 256;
> +        const DMA_LEN_ILOG2_MINUS2: u8 = (DMA_LEN.ilog2() - 2) as u8;
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
> +            pr_err!(
> +                "DMA transfer start addresses must be a multiple of {}",
> +                DMA_LEN
> +            );
> +            return Err(EINVAL);
> +        }
> +        if load_offsets.len % DMA_LEN > 0 {
> +            pr_err!("DMA transfer length must be a multiple of {}", DMA_LEN);
> +            return Err(EINVAL);
> +        }
> +
> +        // Set up the base source DMA address.
> +        with_bar!(bar, |b| {
> +            regs::FalconDmaTrfBase::default()
> +                .set_base((dma_start >> 8) as u32)
> +                .write(b, E::BASE);
> +            regs::FalconDmaTrfBase1::default()
> +                .set_base((dma_start >> 40) as u16)
> +                .write(b, E::BASE)
> +        })?;
> +
> +        let cmd = regs::FalconDmaTrfCmd::default()
> +            .set_size(DMA_LEN_ILOG2_MINUS2)
> +            .set_imem(target_mem == FalconMem::Imem)
> +            .set_sec(if sec { 1 } else { 0 });
> +
> +        for pos in (0..load_offsets.len).step_by(DMA_LEN as usize) {
> +            // Perform a transfer of size `DMA_LEN`.
> +            with_bar!(bar, |b| {
> +                regs::FalconDmaTrfMOffs::default()
> +                    .set_offs(load_offsets.dst_start + pos)
> +                    .write(b, E::BASE);
> +                regs::FalconDmaTrfBOffs::default()
> +                    .set_offs(src_start + pos)
> +                    .write(b, E::BASE);
> +                cmd.write(b, E::BASE)
> +            })?;
> +
> +            // Wait for the transfer to complete.
> +            timer.wait_on(bar, Duration::from_millis(2000), || {
> +                bar.try_access_with(|b| regs::FalconDmaTrfCmd::read(b, E::BASE))
> +                    .and_then(|v| if v.idle() { Some(()) } else { None })
> +            })?;
> +        }
> +
> +        Ok(())
> +    }
> +
> +    pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(
> +        &self,
> +        bar: &Devres<Bar0>,
> +        timer: &Timer,
> +        fw: &F,
> +    ) -> Result<()> {
> +        let dma_handle = fw.dma_handle();
> +
> +        with_bar!(bar, |b| {
> +            regs::FalconFbifCtl::alter(b, E::BASE, |v| v.set_allow_phys_no_ctx(true));
> +            regs::FalconDmaCtl::default().write(b, E::BASE);
> +            regs::FalconFbifTranscfg::alter(b, E::BASE, |v| {
> +                v.set_target(FalconFbifTarget::CoherentSysmem)
> +                    .set_mem_type(FalconFbifMemType::Physical)
> +            });
> +        })?;
> +
> +        self.dma_wr(
> +            bar,
> +            timer,
> +            dma_handle,
> +            FalconMem::Imem,
> +            fw.imem_load(),
> +            true,
> +        )?;
> +        self.dma_wr(
> +            bar,
> +            timer,
> +            dma_handle,
> +            FalconMem::Dmem,
> +            fw.dmem_load(),
> +            true,
> +        )?;
> +
> +        self.hal.program_brom(bar, &fw.brom_params())?;
> +
> +        with_bar!(bar, |b| {
> +            // Set `BootVec` to start of non-secure code.
> +            regs::FalconBootVec::default()
> +                .set_boot_vec(fw.boot_addr())
> +                .write(b, E::BASE);
> +        })?;
> +
> +        Ok(())
> +    }
> +
> +    pub(crate) fn boot(
> +        &self,
> +        bar: &Devres<Bar0>,
> +        timer: &Timer,
> +        mbox0: Option<u32>,
> +        mbox1: Option<u32>,
> +    ) -> Result<(u32, u32)> {
> +        with_bar!(bar, |b| {
> +            if let Some(mbox0) = mbox0 {
> +                regs::FalconMailbox0::default()
> +                    .set_mailbox0(mbox0)
> +                    .write(b, E::BASE);
> +            }
> +
> +            if let Some(mbox1) = mbox1 {
> +                regs::FalconMailbox1::default()
> +                    .set_mailbox1(mbox1)
> +                    .write(b, E::BASE);
> +            }
> +
> +            match regs::FalconCpuCtl::read(b, E::BASE).alias_en() {
> +                true => regs::FalconCpuCtlAlias::default()
> +                    .set_start_cpu(true)
> +                    .write(b, E::BASE),
> +                false => regs::FalconCpuCtl::default()
> +                    .set_start_cpu(true)
> +                    .write(b, E::BASE),
> +            }
> +        })?;
> +
> +        timer.wait_on(bar, Duration::from_secs(2), || {
> +            bar.try_access()
> +                .map(|b| regs::FalconCpuCtl::read(&*b, E::BASE))
> +                .and_then(|v| if v.halted() { Some(()) } else { None })
> +        })?;
> +
> +        let (mbox0, mbox1) = with_bar!(bar, |b| {
> +            let mbox0 = regs::FalconMailbox0::read(b, E::BASE).mailbox0();
> +            let mbox1 = regs::FalconMailbox1::read(b, E::BASE).mailbox1();
> +
> +            (mbox0, mbox1)
> +        })?;
> +
> +        Ok((mbox0, mbox1))
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..44b8dc118eda1263eaede466efd55408c6e7cded
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::devres::Devres;
> +use kernel::prelude::*;
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
> +pub(crate) type GspFalcon = Falcon<Gsp>;

Please drop this type alias, Falcon<Gsp> seems simple enough and is much more
obvious IMHO.

> +
> +impl Falcon<Gsp> {
> +    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
> +    /// allow GSP to signal CPU for processing new messages in message queue.
> +    pub(crate) fn clear_swgen0_intr(&self, bar: &Devres<Bar0>) -> Result<()> {
> +        with_bar!(bar, |b| regs::FalconIrqsclr::default()
> +            .set_swgen0(true)
> +            .write(b, Gsp::BASE))
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..5ebf4e88f1f25a13cf47859a53507be53e795d34
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::devres::Devres;
> +use kernel::prelude::*;
> +use kernel::sync::Arc;
> +
> +use crate::driver::Bar0;
> +use crate::falcon::{FalconBromParams, FalconEngine};
> +use crate::gpu::Chipset;
> +use crate::timer::Timer;
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
> +    fn select_core(&self, _bar: &Devres<Bar0>, _timer: &Timer) -> Result<()> {
> +        Ok(())
> +    }
> +
> +    fn get_signature_reg_fuse_version(
> +        &self,
> +        bar: &Devres<Bar0>,
> +        engine_id_mask: u16,
> +        ucode_id: u8,
> +    ) -> Result<u32>;
> +
> +    // Program the BROM registers prior to starting a secure firmware.
> +    fn program_brom(&self, bar: &Devres<Bar0>, params: &FalconBromParams) -> Result<()>;
> +}
> +
> +/// Returns a boxed falcon HAL adequate for the passed `chipset`.
> +///
> +/// We use this function and a heap-allocated trait object instead of statically defined trait
> +/// objects because of the two-dimensional (Chipset, Engine) lookup required to return the
> +/// requested HAL.

Do we really need the dynamic dispatch? AFAICS, there's only E::BASE that is
relevant to FalconHal impls?

Can't we do something like I do in the following example [1]?

```
use std::marker::PhantomData;
use std::ops::Deref;

trait Engine {
    const BASE: u32;
}

trait Hal<E: Engine> {
    fn access(&self);
}

struct Gsp;

impl Engine for Gsp {
    const BASE: u32 = 0x1;
}

struct Sec2;

impl Engine for Sec2 {
    const BASE: u32 = 0x2;
}

struct GA100<E: Engine>(PhantomData<E>);

impl<E: Engine> Hal<E> for GA100<E> {
    fn access(&self) {
        println!("Base: {}", E::BASE);
    }
}

impl<E: Engine> GA100<E> {
    fn new() -> Self {
        Self(PhantomData)
    }
}

//struct Falcon<E: Engine>(GA100<E>);

struct Falcon<H: Hal<E>, E: Engine>(H, PhantomData<E>);

impl<H: Hal<E>, E: Engine> Falcon<H, E> {
    fn new(hal: H) -> Self {
        Self(hal, PhantomData)
    }
}

impl<H: Hal<E>, E: Engine> Deref for Falcon<H, E> {
    type Target = H;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

fn main() {
    let gsp = Falcon::new(GA100::<Gsp>::new());
    let sec2 = Falcon::new(GA100::<Sec2>::new());

    gsp.access();
    sec2.access();
}
```

[1] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=bf7035a07e79a4047fb6834eac03a9f2

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
> index 0000000000000000000000000000000000000000..747b02ca671f7d4a97142665a9ba64807c87391e
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::marker::PhantomData;
> +use core::time::Duration;
> +
> +use kernel::devres::Devres;
> +use kernel::prelude::*;
> +
> +use crate::driver::Bar0;
> +use crate::falcon::{FalconBromParams, FalconEngine, FalconModSelAlgo, RiscvCoreSelect};
> +use crate::regs;
> +use crate::timer::Timer;
> +
> +use super::FalconHal;
> +
> +fn select_core_ga102<E: FalconEngine>(bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
> +    let bcr_ctrl = with_bar!(bar, |b| regs::RiscvBcrCtrl::read(b, E::BASE))?;
> +    if bcr_ctrl.core_select() != RiscvCoreSelect::Falcon {
> +        with_bar!(bar, |b| regs::RiscvBcrCtrl::default()
> +            .set_core_select(RiscvCoreSelect::Falcon)
> +            .write(b, E::BASE))?;
> +
> +        timer.wait_on(bar, Duration::from_millis(10), || {
> +            bar.try_access_with(|b| regs::RiscvBcrCtrl::read(b, E::BASE))
> +                .and_then(|v| if v.valid() { Some(()) } else { None })
> +        })?;
> +    }
> +
> +    Ok(())
> +}
> +
> +fn get_signature_reg_fuse_version_ga102(
> +    bar: &Devres<Bar0>,
> +    engine_id_mask: u16,
> +    ucode_id: u8,
> +) -> Result<u32> {
> +    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
> +    // registers, which are an array. Our register definition macros do not allow us to manage them
> +    // properly, so we need to hardcode their addresses for now.
> +
> +    // Each engine has 16 ucode version registers numbered from 1 to 16.
> +    if ucode_id == 0 || ucode_id > 16 {
> +        pr_warn!("invalid ucode id {:#x}", ucode_id);
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
> +        pr_warn!("unexpected engine_id_mask {:#x}", engine_id_mask);
> +        return Err(EINVAL);
> +    } + ((ucode_id - 1) as usize * core::mem::size_of::<u32>());
> +
> +    let reg_fuse_version = with_bar!(bar, |b| { b.read32(reg_fuse) })?;
> +
> +    // Equivalent of Find Last Set bit.
> +    Ok(u32::BITS - reg_fuse_version.leading_zeros())
> +}
> +
> +fn program_brom_ga102<E: FalconEngine>(
> +    bar: &Devres<Bar0>,
> +    params: &FalconBromParams,
> +) -> Result<()> {
> +    with_bar!(bar, |b| {
> +        regs::FalconBromParaaddr0::default()
> +            .set_addr(params.pkc_data_offset)
> +            .write(b, E::BASE);
> +        regs::FalconBromEngidmask::default()
> +            .set_mask(params.engine_id_mask as u32)
> +            .write(b, E::BASE);
> +        regs::FalconBromCurrUcodeId::default()
> +            .set_ucode_id(params.ucode_id as u32)
> +            .write(b, E::BASE);
> +        regs::FalconModSel::default()
> +            .set_algo(FalconModSelAlgo::Rsa3k)
> +            .write(b, E::BASE)
> +    })
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
> +    fn select_core(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
> +        select_core_ga102::<E>(bar, timer)
> +    }
> +
> +    fn get_signature_reg_fuse_version(
> +        &self,
> +        bar: &Devres<Bar0>,
> +        engine_id_mask: u16,
> +        ucode_id: u8,
> +    ) -> Result<u32> {
> +        get_signature_reg_fuse_version_ga102(bar, engine_id_mask, ucode_id)
> +    }
> +
> +    fn program_brom(&self, bar: &Devres<Bar0>, params: &FalconBromParams) -> Result<()> {
> +        program_brom_ga102::<E>(bar, params)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..85dda3e8380a3d31d34c92c4236c6f81c63ce772
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/sec2.rs
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::falcon::{Falcon, FalconEngine};
> +
> +pub(crate) struct Sec2;
> +impl FalconEngine for Sec2 {
> +    const BASE: usize = 0x00840000;
> +}
> +pub(crate) type Sec2Falcon = Falcon<Sec2>;
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 1b3e43e0412e2a2ea178c7404ea647c9e38d4e04..ec4c648c6e8b4aa7d06c627ed59c0e66a08c679e 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -5,6 +5,8 @@
>  use crate::devinit;
>  use crate::dma::DmaObject;
>  use crate::driver::Bar0;
> +use crate::falcon::gsp::GspFalcon;
> +use crate::falcon::sec2::Sec2Falcon;
>  use crate::firmware::Firmware;
>  use crate::regs;
>  use crate::timer::Timer;
> @@ -221,6 +223,20 @@ pub(crate) fn new(
>  
>          let timer = Timer::new();
>  
> +        let gsp_falcon = GspFalcon::new(
> +            pdev,
> +            spec.chipset,
> +            &bar,
> +            if spec.chipset > Chipset::GA100 {
> +                true
> +            } else {
> +                false
> +            },
> +        )?;
> +        gsp_falcon.clear_swgen0_intr(&bar)?;
> +
> +        let _sec2_falcon = Sec2Falcon::new(pdev, spec.chipset, &bar, true)?;
> +
>          Ok(pin_init!(Self {
>              spec,
>              bar,
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index df3468c92c6081b3e2db218d92fbe1c40a0a75c3..4dde8004d24882c60669b5acd6af9d6988c66a9c 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -23,6 +23,7 @@ macro_rules! with_bar {
>  mod devinit;
>  mod dma;
>  mod driver;
> +mod falcon;
>  mod firmware;
>  mod gpu;
>  mod regs;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index f191cf4eb44c2b950e5cfcc6d04f95c122ce29d3..c76a16dc8e7267a4eb54cb71e1cca6fb9e00188f 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -6,6 +6,10 @@
>  #[macro_use]
>  mod macros;
>  
> +use crate::falcon::{
> +    FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget, FalconModSelAlgo,
> +    FalconSecurityModel, RiscvCoreSelect,
> +};
>  use crate::gpu::Chipset;
>  
>  register!(Boot0@0x00000000, "Basic revision information about the GPU";
> @@ -44,3 +48,188 @@
>  register!(Pgc6AonSecureScratchGroup05@0x00118234;
>      31:0    value => as u32
>  );
> +
> +/* PFALCON */
> +
> +register!(FalconIrqsclr@+0x00000004;
> +    4:4     halt => as_bit bool;
> +    6:6     swgen0 => as_bit bool;
> +);
> +
> +register!(FalconIrqstat@+0x00000008;
> +    4:4     halt => as_bit bool;
> +    6:6     swgen0 => as_bit bool;
> +);
> +
> +register!(FalconIrqmclr@+0x00000014;
> +    31:0    val => as u32
> +);
> +
> +register!(FalconIrqmask@+0x00000018;
> +    31:0    val => as u32
> +);
> +
> +register!(FalconRm@+0x00000084;
> +    31:0    val => as u32
> +);
> +
> +register!(FalconIrqdest@+0x0000001c;
> +    31:0    val => as u32
> +);
> +
> +register!(FalconMailbox0@+0x00000040;
> +    31:0    mailbox0 => as u32
> +);
> +register!(FalconMailbox1@+0x00000044;
> +    31:0    mailbox1 => as u32
> +);
> +
> +register!(FalconHwcfg2@+0x000000f4;
> +    10:10   riscv => as_bit bool;
> +    12:12   mem_scrubbing => as_bit bool;
> +    31:31   reset_ready => as_bit bool;
> +);
> +
> +register!(FalconCpuCtl@+0x00000100;
> +    1:1     start_cpu => as_bit bool;
> +    4:4     halted => as_bit bool;
> +    6:6     alias_en => as_bit bool;
> +);
> +
> +register!(FalconBootVec@+0x00000104;
> +    31:0    boot_vec => as u32
> +);
> +
> +register!(FalconHwCfg@+0x00000108;
> +    8:0     imem_size => as u32;
> +    17:9    dmem_size => as u32;
> +);
> +
> +register!(FalconDmaCtl@+0x0000010c;
> +    0:0     require_ctx => as_bit bool;
> +    1:1     dmem_scrubbing  => as_bit bool;
> +    2:2     imem_scrubbing => as_bit bool;
> +    6:3     dmaq_num => as_bit u8;
> +    7:7     secure_stat => as_bit bool;
> +);
> +
> +register!(FalconDmaTrfBase@+0x00000110;
> +    31:0    base => as u32;
> +);
> +
> +register!(FalconDmaTrfMOffs@+0x00000114;
> +    23:0    offs => as u32;
> +);
> +
> +register!(FalconDmaTrfCmd@+0x00000118;
> +    0:0     full => as_bit bool;
> +    1:1     idle => as_bit bool;
> +    3:2     sec => as_bit u8;
> +    4:4     imem => as_bit bool;
> +    5:5     is_write => as_bit bool;
> +    10:8    size => as u8;
> +    14:12   ctxdma => as u8;
> +    16:16   set_dmtag => as u8;
> +);
> +
> +register!(FalconDmaTrfBOffs@+0x0000011c;
> +    31:0    offs => as u32;
> +);
> +
> +register!(FalconDmaTrfBase1@+0x00000128;
> +    8:0     base => as u16;
> +);
> +
> +register!(FalconHwcfg1@+0x0000012c;
> +    3:0     core_rev => try_into FalconCoreRev, "core revision of the falcon";
> +    5:4     security_model => try_into FalconSecurityModel, "security model of the falcon";
> +    7:6     core_rev_subversion => into FalconCoreRevSubversion;
> +    11:8    imem_ports => as u8;
> +    15:12   dmem_ports => as u8;
> +);
> +
> +register!(FalconCpuCtlAlias@+0x00000130;
> +    1:1     start_cpu => as_bit bool;
> +);
> +
> +/* TODO: this is an array of registers */
> +register!(FalconImemC@+0x00000180;
> +    7:2     offs => as u8;
> +    23:8    blk => as u8;
> +    24:24   aincw => as_bit bool;
> +    25:25   aincr => as_bit bool;
> +    28:28   secure => as_bit bool;
> +    29:29   sec_atomic => as_bit bool;
> +);
> +
> +register!(FalconImemD@+0x00000184;
> +    31:0    data => as u32;
> +);
> +
> +register!(FalconImemT@+0x00000188;
> +    15:0    data => as u16;
> +);
> +
> +register!(FalconDmemC@+0x000001c0;
> +    7:2     offs => as u8;
> +    23:0    addr => as u32;
> +    23:8    blk => as u8;
> +    24:24   aincw => as_bit bool;
> +    25:25   aincr => as_bit bool;
> +    26:26   settag => as_bit bool;
> +    27:27   setlvl => as_bit bool;
> +    28:28   va => as_bit bool;
> +    29:29   miss => as_bit bool;
> +);
> +
> +register!(FalconDmemD@+0x000001c4;
> +    31:0    data => as u32;
> +);
> +
> +register!(FalconModSel@+0x00001180;
> +    7:0     algo => try_into FalconModSelAlgo;
> +);
> +register!(FalconBromCurrUcodeId@+0x00001198;
> +    31:0    ucode_id => as u32;
> +);
> +register!(FalconBromEngidmask@+0x0000119c;
> +    31:0    mask => as u32;
> +);
> +register!(FalconBromParaaddr0@+0x00001210;
> +    31:0    addr => as u32;
> +);
> +
> +register!(RiscvCpuctl@+0x00000388;
> +    0:0     startcpu => as_bit bool;
> +    4:4     halted => as_bit bool;
> +    5:5     stopped => as_bit bool;
> +    7:7     active_stat => as_bit bool;
> +);
> +
> +register!(FalconEngine@+0x000003c0;
> +    0:0     reset => as_bit bool;
> +);
> +
> +register!(RiscvIrqmask@+0x00000528;
> +    31:0    mask => as u32;
> +);
> +
> +register!(RiscvIrqdest@+0x0000052c;
> +    31:0    dest => as u32;
> +);
> +
> +/* TODO: this is an array of registers */
> +register!(FalconFbifTranscfg@+0x00000600;
> +    1:0     target => try_into FalconFbifTarget;
> +    2:2     mem_type => as_bit FalconFbifMemType;
> +);
> +
> +register!(FalconFbifCtl@+0x00000624;
> +    7:7     allow_phys_no_ctx => as_bit bool;
> +);
> +
> +register!(RiscvBcrCtrl@+0x00001668;
> +    0:0     valid => as_bit bool;
> +    4:4     core_select => as_bit RiscvCoreSelect;
> +    8:8     br_fetch => as_bit bool;
> +);
> diff --git a/drivers/gpu/nova-core/timer.rs b/drivers/gpu/nova-core/timer.rs
> index 8987352f4192bc9b4b2fc0fb5f2e8e62ff27be68..c03a5c36d1230dfbf2bd6e02a793264280c6d509 100644
> --- a/drivers/gpu/nova-core/timer.rs
> +++ b/drivers/gpu/nova-core/timer.rs
> @@ -2,9 +2,6 @@
>  
>  //! Nova Core Timer subdevice
>  
> -// To be removed when all code is used.
> -#![allow(dead_code)]
> -
>  use core::fmt::Display;
>  use core::ops::{Add, Sub};
>  use core::time::Duration;
> 
> -- 
> 2.49.0
> 
