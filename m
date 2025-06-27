Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF09AEC2EC
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 01:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8B310E098;
	Fri, 27 Jun 2025 23:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LXsgpyVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE3E10E098
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 23:12:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 595675C69CC;
 Fri, 27 Jun 2025 23:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E36C4CEE3;
 Fri, 27 Jun 2025 23:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751065962;
 bh=Ip+eklYk1T1n5SJzzim5G5kVI2mzRD7SBDvTTPqyNNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LXsgpyVt327tyRUsEsmv3BQSrVgR+dcdKggGfIYcuVb/kDjHicOGUg9tT32c7YD48
 glV+2wZ6fLhrdCq1Xv5luTmCs6LGMYdCkMHj91kx4lcFoQ+s3WEb1rcWLwQr+rut3k
 3EMT1A6zVo83ZEq7M/B0OkiJLj3qlqNG2lY4Ybdkew9VhFUG4XyyOP+6XkHyITAHvl
 vWEK1wlfoQDeZW21a/bM3HS0jcAzBPeMoUIceIBqF88r4+QAYTf7AmtoHFdPH38Oy0
 lpqwckQ2t3DoLjQQ4LXMXKZ6YKN6eqCGayPU1WTVpUHQ3BxVO92oPOEHpwSob4QErx
 50/xxHZsYEc2g==
Date: Sat, 28 Jun 2025 01:12:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
 Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Introduce Tyr
Message-ID: <aF8lYpK_l2I-ts1k@pollux>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
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

On Fri, Jun 27, 2025 at 07:34:04PM -0300, Daniel Almeida wrote:
> +#[pin_data]
> +pub(crate) struct TyrData {
> +    pub(crate) pdev: ARef<platform::Device>,
> +
> +    #[pin]
> +    clks: Mutex<Clocks>,
> +
> +    #[pin]
> +    regulators: Mutex<Regulators>,
> +
> +    // Some inforation on the GPU. This is mainly queried by userspace (mesa).
> +    pub(crate) gpu_info: GpuInfo,
> +}
> +
> +unsafe impl Send for TyrData {}
> +unsafe impl Sync for TyrData {}

What's the safety justification for those? Why do you need them? The fact that
you seem to need to implement those traits within a driver indicates an issue.

> +fn issue_soft_reset(iomem: &Devres<IoMem<0>>) -> Result<()> {
> +    let irq_enable_cmd = 1 | bit_u32(8);
> +    regs::GPU_CMD.write(iomem, irq_enable_cmd)?;
> +
> +    let op = || regs::GPU_INT_RAWSTAT.read(iomem);
> +    let cond = |raw_stat: &u32| -> bool { (*raw_stat >> 8) & 1 == 1 };
> +    let res = io::poll::read_poll_timeout(
> +        op,
> +        cond,
> +        time::Delta::from_millis(100),
> +        Some(time::Delta::from_micros(20000)),
> +    );
> +
> +    if let Err(e) = res {
> +        pr_err!("GPU reset failed with errno {}\n", e.to_errno());
> +        pr_err!(
> +            "GPU_INT_RAWSTAT is {}\n",
> +            regs::GPU_INT_RAWSTAT.read(iomem)?
> +        );

This is a driver, please use dev_err!().

> +    }
> +
> +    Ok(())
> +}
> +
> +kernel::of_device_table!(
> +    OF_TABLE,
> +    MODULE_OF_TABLE,
> +    <TyrDriver as platform::Driver>::IdInfo,
> +    [
> +        (of::DeviceId::new(c_str!("rockchip,rk3588-mali")), ()),
> +        (of::DeviceId::new(c_str!("arm,mali-valhall-csf")), ())
> +    ]
> +);
> +
> +impl platform::Driver for TyrDriver {
> +    type IdInfo = ();
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
> +
> +    fn probe(
> +        pdev: &platform::Device<Core>,
> +        _info: Option<&Self::IdInfo>,
> +    ) -> Result<Pin<KBox<Self>>> {
> +        dev_dbg!(pdev.as_ref(), "Probed Tyr\n");
> +
> +        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
> +        let stacks_clk = Clk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
> +        let coregroup_clk = Clk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
> +
> +        core_clk.prepare_enable()?;
> +        stacks_clk.prepare_enable()?;
> +        coregroup_clk.prepare_enable()?;
> +
> +        let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
> +        let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
> +
> +        let resource = pdev.resource_by_index(0).ok_or(EINVAL)?;
> +
> +        let iomem = Arc::new(pdev.iomap_resource(resource)?, GFP_KERNEL)?;

You can do

	let io = iomem.access(pdev.as_ref())?;

which gives you an &IoMem for the whole scope of probe() without any
limitations.

Also, why not use iomap_resource_sized()? Lots of offsets are known at compile
time. This allows you to use infallible accesses, e.g. write() instead of
try_write().

> +
> +        issue_soft_reset(&iomem)?;
> +        gpu::l2_power_on(&iomem)?;
> +
> +        let gpu_info = GpuInfo::new(&iomem)?;
> +        gpu_info.log(pdev);
> +
> +        let platform: ARef<platform::Device> = pdev.into();
> +
> +        let data = try_pin_init!(TyrData {
> +                pdev: platform.clone(),
> +                clks <- new_mutex!(Clocks {
> +                    core: core_clk,
> +                    stacks: stacks_clk,
> +                    coregroup: coregroup_clk,
> +                }),
> +                regulators <- new_mutex!(Regulators {
> +                    mali: mali_regulator,
> +                    sram: sram_regulator,
> +                }),
> +                gpu_info,
> +        });
> +
> +        let data = Arc::pin_init(data, GFP_KERNEL)?;
> +
> +        let tdev: ARef<TyrDevice> = drm::device::Device::new(pdev.as_ref(), data.clone())?;
> +        drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref(), 0)?;
> +
> +        let driver = KBox::pin_init(try_pin_init!(TyrDriver { device: tdev }), GFP_KERNEL)?;
> +
> +        regs::MCU_CONTROL.write(&iomem, regs::MCU_CONTROL_AUTO)?;
> +
> +        dev_info!(pdev.as_ref(), "Tyr initialized correctly.\n");

Consider dev_dbg!() instead.

> +    pub(crate) fn log(&self, pdev: &platform::Device) {
> +        let major = (self.gpu_id >> 16) & 0xff;
> +        let minor = (self.gpu_id >> 8) & 0xff;
> +        let status = self.gpu_id & 0xff;
> +
> +        let model_name = if let Some(model) = GPU_MODELS
> +            .iter()
> +            .find(|&f| f.major == major && f.minor == minor)
> +        {
> +            model.name
> +        } else {
> +            "unknown"
> +        };
> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
> +            model_name,
> +            self.gpu_id >> 16,
> +            major,
> +            minor,
> +            status
> +        );
> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
> +            self.l2_features,
> +            self.tiler_features,
> +            self.mem_features,
> +            self.mmu_features,
> +            self.as_present
> +        );
> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
> +            self.shader_present,
> +            self.l2_present,
> +            self.tiler_present
> +        );
> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "PA bits: {}, VA bits: {}",
> +            self.pa_bits(),
> +            self.va_bits()
> +        );
> +    }

This is called from probe() and seems way too verbose for dev_info!(), please
use dev_dbg!() instead.

> +/// Represents a register in the Register Set
> +pub(crate) struct Register<const OFFSET: usize>;
> +
> +impl<const OFFSET: usize> Register<OFFSET> {
> +    #[inline]
> +    pub(crate) fn read(&self, iomem: &Devres<IoMem>) -> Result<u32> {
> +        (*iomem).try_access().ok_or(ENODEV)?.try_read32(OFFSET)
> +    }
> +
> +    #[inline]
> +    pub(crate) fn write(&self, iomem: &Devres<IoMem>, value: u32) -> Result<()> {
> +        (*iomem)
> +            .try_access()
> +            .ok_or(ENODEV)?
> +            .try_write32(value, OFFSET)
> +    }
> +}

This seems like a bad idea. You really want to use Devres::access() from each
entry point where you have a &Device<Bound> (such as probe()) and use the
returned &IoMem instead. Otherwise every read() and write() does an atomic read
and RCU read-side critical section, due to try_access().

If you really run in a case where you don't have a &Device<Bound>, you can use
Devres::try_access_with(), which takes a closure that will have an &IoMem as
argument, such that you can do things like:

	io.try_access_with(|io| my_register.write(io, ...))

Also, you want accessors for read32() and write32() rather than always use
try_read32() and try_write32(). The latter you only want to use when the offset
isn't known at compile time.

I also recommend looking at what nova-core does for register accesses. Regarding
the register!() macro in nova-core, we're working on providing this as generic
infrastructure.
