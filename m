Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622E0D31061
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF9210E224;
	Fri, 16 Jan 2026 12:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="D5+b3J77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B06310E224
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:23:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768566201; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FBxo/pa1pWy6uI5nMbmidCcn++S0hOmF4gWCCiGgurp50FDLJMcm6/LKhNQfwnvItE9np5Qq7NonlPY0AYZiGGFcK9ki4PNImsuCTSiBwWW7/5jQP/9L1oHHtfKwfpzXgR01cXeVuvk6/4uQhMhg/2cbhceR4qq1EtYCxhhVeF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768566201;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zINYituqZ4ks1E8gG3+jVvmlTQSl5d9jUzkTQ+ZT44o=; 
 b=nMvOOWWMAJ/SQoQPK9QBUfv8G/gBUuFrkwS1CobadMXadvkCmHFEzVnhT2MndKas0BaW6NyemgrKUAiVVXKLsd6TguLONzB35US3JNmTNVOHW2aZQAok6MUyt9fYZUsnAr3w/QhwmocuDPqjZUDa+496EOZU5Tm/8ElVrqNsIH0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768566201; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=zINYituqZ4ks1E8gG3+jVvmlTQSl5d9jUzkTQ+ZT44o=;
 b=D5+b3J77pZXzItKFvTWxR7RjjnxggUIg+xMD7UMlcXKfnR9PpZDy+oIGV7kxZpJT
 kbXZzSXu3gIKDHSuWDIuDnNEN42jVOsgmmMhD8fqcY8fJ87fedXaReT6cos+4U3VElv
 UoxlOJANJyqLsnMAIRD62zyDWBtM6nD2ac2UlaOc=
Received: by mx.zohomail.com with SMTPS id 1768566199818672.3328149731357;
 Fri, 16 Jan 2026 04:23:19 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
Date: Fri, 16 Jan 2026 09:23:02 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
To: Dirk Behme <dirk.behme@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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

Hi Dirk, thanks for the review!

> On 15 Jan 2026, at 14:05, Dirk Behme <dirk.behme@gmail.com> wrote:
>=20
> Hi Daniel,
>=20
> On 14.01.26 23:53, Daniel Almeida wrote:
>> Replace regs::Register with kernel::register. This allow us to more
>> succinctly express the register set by introducing the ability to =
describe
>> fields and their documentation and to auto-generate the accessors. In
>> particular, this is very helpful as it does away with a lot of manual =
masks
>> and shifts.
>=20
>=20
> As mentioned somewhere else already I really like switching to
> register!(). Thanks!
>=20
> Some coments below:
>=20
>=20
>> A future commit will eliminate HI/LO pairs once there is support for =
64bit
>> reads and writes in kernel::register.
>>=20
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> ---
>> Note that this patch depends on a rebased version of Joel's patch at =
[0].
>>=20
>> That version is stale, so I ended up rebasing it locally myself for =
the
>> purpose of developing this patch and gathering some reviews on the =
list. In
>> other words, the current patch does not apply for the time being, but =
will
>> once a v7 for Joel's series is out.
>>=20
>> [0]: =
https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-joelagnelf=
@nvidia.com/
>> ---
>> drivers/gpu/drm/tyr/driver.rs |  15 ++-
>> drivers/gpu/drm/tyr/gpu.rs    |  55 ++++----
>> drivers/gpu/drm/tyr/regs.rs   | 302 =
++++++++++++++++++++++++++++++++----------
>> 3 files changed, 267 insertions(+), 105 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
>> index 0389c558c036..8e06db5320bf 100644
>> --- a/drivers/gpu/drm/tyr/driver.rs
>> +++ b/drivers/gpu/drm/tyr/driver.rs
>> @@ -66,19 +66,20 @@ unsafe impl Send for TyrData {}
>> unsafe impl Sync for TyrData {}
>>=20
>> fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> =
Result {
>> -    regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
>> +    let io =3D iomem.access(dev)?;
>> +
>> +    regs::GpuCommand::default()
>> +        .set_command(regs::GPU_CMD_SOFT_RESET)
>> +        .write(io);
>>=20
>>     // TODO: We cannot poll, as there is no support in Rust =
currently, so we
>>     // sleep. Change this when read_poll_timeout() is implemented in =
Rust.
>>     kernel::time::delay::fsleep(time::Delta::from_millis(100));
>>=20
>> -    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & =
regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED =3D=3D 0 {
>> +    let rawstat =3D regs::GpuIrqRawstat::read(io);
>> +    if !rawstat.reset_completed() {
>>         dev_err!(dev, "GPU reset failed with errno\n");
>> -        dev_err!(
>> -            dev,
>> -            "GPU_INT_RAWSTAT is {}\n",
>> -            regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
>> -        );
>> +        dev_err!(dev, "GPU_INT_RAWSTAT is {}\n", =
u32::from(rawstat));
>=20
>=20
> This is pre-existing, but printing `... INT ...` for `...IRQ...`
> register looks confusing (wrong?).

Yeah, this needs to change indeed.

>=20
>=20
>>         return Err(EIO);
>>     }
>> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
>> index 6c582910dd5d..7c698fb1e36a 100644
>> --- a/drivers/gpu/drm/tyr/gpu.rs
>> +++ b/drivers/gpu/drm/tyr/gpu.rs
>> @@ -44,34 +44,36 @@ pub(crate) struct GpuInfo {
>>=20
>> impl GpuInfo {
>>     pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> =
Result<Self> {
>> -        let gpu_id =3D regs::GPU_ID.read(dev, iomem)?;
>> -        let csf_id =3D regs::GPU_CSF_ID.read(dev, iomem)?;
>> -        let gpu_rev =3D regs::GPU_REVID.read(dev, iomem)?;
>> -        let core_features =3D regs::GPU_CORE_FEATURES.read(dev, =
iomem)?;
>> -        let l2_features =3D regs::GPU_L2_FEATURES.read(dev, iomem)?;
>> -        let tiler_features =3D regs::GPU_TILER_FEATURES.read(dev, =
iomem)?;
>> -        let mem_features =3D regs::GPU_MEM_FEATURES.read(dev, =
iomem)?;
>> -        let mmu_features =3D regs::GPU_MMU_FEATURES.read(dev, =
iomem)?;
>> -        let thread_features =3D regs::GPU_THREAD_FEATURES.read(dev, =
iomem)?;
>> -        let max_threads =3D regs::GPU_THREAD_MAX_THREADS.read(dev, =
iomem)?;
>> -        let thread_max_workgroup_size =3D =
regs::GPU_THREAD_MAX_WORKGROUP_SIZE.read(dev, iomem)?;
>> -        let thread_max_barrier_size =3D =
regs::GPU_THREAD_MAX_BARRIER_SIZE.read(dev, iomem)?;
>> -        let coherency_features =3D =
regs::GPU_COHERENCY_FEATURES.read(dev, iomem)?;
>> -
>> -        let texture_features =3D =
regs::GPU_TEXTURE_FEATURES0.read(dev, iomem)?;
>> -
>> -        let as_present =3D regs::GPU_AS_PRESENT.read(dev, iomem)?;
>> -
>> -        let shader_present =3D =
u64::from(regs::GPU_SHADER_PRESENT_LO.read(dev, iomem)?);
>> +        let io =3D (*iomem).access(dev)?;
>> +
>> +        let gpu_id =3D regs::GpuId::read(io).into();
>> +        let csf_id =3D regs::CsfId::read(io).into();
>> +        let gpu_rev =3D regs::RevIdr::read(io).into();
>> +        let core_features =3D regs::CoreFeatures::read(io).into();
>> +        let l2_features =3D regs::L2Features::read(io).into();
>> +        let tiler_features =3D regs::TilerFeatures::read(io).into();
>> +        let mem_features =3D regs::MemFeatures::read(io).into();
>> +        let mmu_features =3D regs::MmuFeatures::read(io).into();
>> +        let thread_features =3D =
regs::ThreadFeatures::read(io).into();
>> +        let max_threads =3D regs::ThreadMaxThreads::read(io).into();
>> +        let thread_max_workgroup_size =3D =
regs::ThreadMaxWorkgroupSize::read(io).into();
>> +        let thread_max_barrier_size =3D =
regs::ThreadMaxBarrierSize::read(io).into();
>> +        let coherency_features =3D =
regs::CoherencyFeatures::read(io).into();
>=20
>=20
> Is there any reason why you replace the UPPERCASE register names with
> CamelCase ones?
>=20
> I was under the impression that we want to use UPPERCASE for register
> names. Like in nova
>=20
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/gpu/nova-core/regs.rs

Not really. UPPERCASE for non-const items will trigger the linter. The =
Nova
people chose to #[allow] this to align with OpenRM and, IIRC from the =
LPC
discussions, their registers are automatically generated from some =
internal
docs.

We have only a few, we can simply convert them to CamelCase.
>=20
>=20
>=20
>> +        let texture_features =3D regs::TextureFeatures::read(io, =
0).into();
>> +
>> +        let as_present =3D regs::AsPresent::read(io).into();
>> +
>> +        let shader_present =3D =
u64::from(u32::from(regs::ShaderPresentLo::read(io)));
>>         let shader_present =3D
>> -            shader_present | =
u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) << 32;
>> +            shader_present | =
u64::from(u32::from(regs::ShaderPresentHi::read(io))) << 32;
>>=20
>> -        let tiler_present =3D =
u64::from(regs::GPU_TILER_PRESENT_LO.read(dev, iomem)?);
>> +        let tiler_present =3D =
u64::from(u32::from(regs::TilerPresentLo::read(io)));
>>         let tiler_present =3D
>> -            tiler_present | =
u64::from(regs::GPU_TILER_PRESENT_HI.read(dev, iomem)?) << 32;
>> +            tiler_present | =
u64::from(u32::from(regs::TilerPresentHi::read(io))) << 32;
>>=20
>> -        let l2_present =3D =
u64::from(regs::GPU_L2_PRESENT_LO.read(dev, iomem)?);
>> -        let l2_present =3D l2_present | =
u64::from(regs::GPU_L2_PRESENT_HI.read(dev, iomem)?) << 32;
>> +        let l2_present =3D =
u64::from(u32::from(regs::L2PresentLo::read(io)));
>> +        let l2_present =3D l2_present | =
u64::from(u32::from(regs::L2PresentHi::read(io))) << 32;
>>=20
>>         Ok(Self {
>>             gpu_id,
>> @@ -204,13 +206,14 @@ fn from(value: u32) -> Self {
>>=20
>> /// Powers on the l2 block.
>> pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) =
-> Result {
>> -    regs::L2_PWRON_LO.write(dev, iomem, 1)?;
>> +    let io =3D (*iomem).access(dev)?;
>> +    regs::L2PwrOnLo::default().set_l2_pwron_lo(1).write(io);
>>=20
>>     // TODO: We cannot poll, as there is no support in Rust =
currently, so we
>>     // sleep. Change this when read_poll_timeout() is implemented in =
Rust.
>>     kernel::time::delay::fsleep(time::Delta::from_millis(100));
>>=20
>> -    if regs::L2_READY_LO.read(dev, iomem)? !=3D 1 {
>> +    if regs::L2ReadyLo::read(io).l2_ready_lo() !=3D 1 {
>>         dev_err!(dev, "Failed to power on the GPU\n");
>>         return Err(EIO);
>>     }
>> diff --git a/drivers/gpu/drm/tyr/regs.rs =
b/drivers/gpu/drm/tyr/regs.rs
>> index f46933aaa221..a4e05ff463c0 100644
>> --- a/drivers/gpu/drm/tyr/regs.rs
>> +++ b/drivers/gpu/drm/tyr/regs.rs
>> @@ -8,44 +8,62 @@
>> #![allow(dead_code)]
>>=20
>> use kernel::bits::bit_u32;
>> -use kernel::device::Bound;
>> -use kernel::device::Device;
>> -use kernel::devres::Devres;
>> use kernel::prelude::*;
>> +use kernel::register;
>>=20
>> -use crate::driver::IoMem;
>> -
>> -/// Represents a register in the Register Set
>> -///
>> -/// TODO: Replace this with the Nova `register!()` macro when it is =
available.
>> -/// In particular, this will automatically give us 64bit register =
reads and
>> -/// writes.
>> -pub(crate) struct Register<const OFFSET: usize>;
>> -
>> -impl<const OFFSET: usize> Register<OFFSET> {
>> -    #[inline]
>> -    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: =
&Devres<IoMem>) -> Result<u32> {
>> -        let value =3D (*iomem).access(dev)?.read32(OFFSET);
>> -        Ok(value)
>> -    }
>> -
>> -    #[inline]
>> -    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: =
&Devres<IoMem>, value: u32) -> Result {
>> -        (*iomem).access(dev)?.write32(value, OFFSET);
>> -        Ok(())
>> -    }
>> -}
>> -
>> -pub(crate) const GPU_ID: Register<0x0> =3D Register;
>> -pub(crate) const GPU_L2_FEATURES: Register<0x4> =3D Register;
>> -pub(crate) const GPU_CORE_FEATURES: Register<0x8> =3D Register;
>> -pub(crate) const GPU_CSF_ID: Register<0x1c> =3D Register;
>> -pub(crate) const GPU_REVID: Register<0x280> =3D Register;
>> -pub(crate) const GPU_TILER_FEATURES: Register<0xc> =3D Register;
>> -pub(crate) const GPU_MEM_FEATURES: Register<0x10> =3D Register;
>> -pub(crate) const GPU_MMU_FEATURES: Register<0x14> =3D Register;
>> -pub(crate) const GPU_AS_PRESENT: Register<0x18> =3D Register;
>> -pub(crate) const GPU_IRQ_RAWSTAT: Register<0x20> =3D Register;
>> +register!(GpuId @ 0x0, "Information about the GPU architecture and =
release version" {
>> +    3:0     version_status as u32, "Status of the GPU release";
>> +    11:4    version_minor as u32, "Minor release version number";
>> +    15:12   version_major as u32, "Major release version number";
>> +    19:16   product_major as u32, "Product identifier";
>> +    23:20   arch_rev as u32, "Architecture patch revision";
>> +    27:24   arch_minor as u32, "Architecture minor revision";
>> +    31:28   arch_major as u32, "Architecture major revision";
>> +});
>> +
>> +register!(L2Features @ 0x4, "Level 2 cache features" {
>> +    7:0     line_size as u32, "L2 cache line size";
>> +    15:8    associativity as u32, "L2 cache associativity";
>> +    23:16   cache_size as u32, "L2 cache slice size";
>> +    31:24   bus_width as u32, "L2 cache bus width";
>> +});
>> +
>> +register!(CoreFeatures @ 0x8, "Information about the features of a =
shader core" {
>> +    7:0     core_variant as u32, "Shader core variant";
>> +});
>> +
>> +register!(CsfId @ 0x1c, "Version of the CSF hardware and MMU =
subsystem" {
>> +    3:0     mcu_rev as u32, "MCU revision ID";
>> +    9:4     mcu_minor as u32, "MCU minor revision number";
>> +    15:10   mcu_major as u32, "MCU major revision number";
>> +    19:16   cshw_rev as u32, "CSHW revision ID";
>> +    25:20   cshw_minor as u32, "CSHW minor revision number";
>> +    31:26   cshw_major as u32, "CSHW major revision number";
>> +});
>> +
>> +register!(RevIdr @ 0x280, "Extra revision information" {
>> +    31:0    revision as u32, "Revision information";
>> +});
>> +
>> +register!(TilerFeatures @ 0xc, "Tiler features" {
>> +    5:0     bin_size as u32, "Log of the tiler's bin size";
>> +    11:8    max_levels as u32, "Maximum number of available levels";
>> +});
>> +
>> +register!(MemFeatures @ 0x10, "Memory features" {
>> +    0:0     coherent_core_group as bool, "Core group is coherent";
>> +    1:1     coherent_super_group as bool, "Core supergroup is =
coherent";
>> +    11:8    l2_slices as u32, "L2 slice count";
>> +});
>> +
>> +register!(MmuFeatures @ 0x14, "MMU features" {
>> +    7:0     va_bits as u32, "Number of bits supported in virtual =
addresses";
>> +    15:8    pa_bits as u32, "Number of bits supported in physical =
addresses";
>> +});
>> +
>> +register!(AsPresent @ 0x18, "Address spaces present" {
>> +    31:0    as_present as u32, "Bitmask of present address spaces";
>> +});
>>=20
>> pub(crate) const GPU_IRQ_RAWSTAT_FAULT: u32 =3D bit_u32(0);
>> pub(crate) const GPU_IRQ_RAWSTAT_PROTECTED_FAULT: u32 =3D bit_u32(1);
>> @@ -56,53 +74,193 @@ pub(crate) fn write(&self, dev: &Device<Bound>, =
iomem: &Devres<IoMem>, value: u3
>> pub(crate) const GPU_IRQ_RAWSTAT_DOORBELL_STATUS: u32 =3D =
bit_u32(18);
>> pub(crate) const GPU_IRQ_RAWSTAT_MCU_STATUS: u32 =3D bit_u32(19);
>>=20
>> -pub(crate) const GPU_IRQ_CLEAR: Register<0x24> =3D Register;
>> -pub(crate) const GPU_IRQ_MASK: Register<0x28> =3D Register;
>> -pub(crate) const GPU_IRQ_STAT: Register<0x2c> =3D Register;
>> -pub(crate) const GPU_CMD: Register<0x30> =3D Register;
>> +register!(GpuIrqRawstat @ 0x20, "Raw unmasked interrupt status for =
the GPU" {
>> +    0:0     fault as bool, "A GPU fault has occourred";
>> +    1:1     protected_fault as bool, "Indicates a protected memory =
fault has occurred";
>> +    8:8     reset_completed as bool, "Indicates that a GPU reset has =
completed";
>> +    9:9     power_changed_single as bool, "Set when a single power =
domain has powered up or down";
>> +    10:10   power_changed_all as bool, "Set when all pending power =
domain changes are completed ";
>> +    17:17   clean_caches_completed as bool, "Indicates that a cache =
clean operation has completed";
>> +    18:18   doorbell_status as bool, "Mirrors the doorbell interrupt =
line to the CPU";
>> +    19:19   mcu_status as bool, "The MCU requires attention";
>> +});
>> +
>> +register!(GpuIrqClear @ 0x24, "Clears pending GPU interrupts" {
>> +    0:0     fault as bool, "Clear the fault interrupt";
>> +    1:1     protected_fault as bool, "Clear the protected_fault =
interrupt";
>> +    8:8     reset_completed as bool, "Clear the reset_completed =
interrupt";
>> +    9:9     power_changed_single as bool, "Clear the =
power_changed_single interrupt";
>> +    10:10   power_changed_all as bool, "Clear the power_changed_all =
interrupt";
>> +    17:17   clean_caches_completed as bool, "Clear the =
clean_caches_completed interrupt";
>> +    18:18   doorbell_status as bool, "Clear the doorbell_status =
interrupt";
>> +    19:19   mcu_status as bool, "Clear the mcu_status interrupt";
>> +});
>> +
>> +register!(GpuIrqMask @ 0x28, "Enabled GPU interrupts" {
>> +    0:0     fault as bool, "Enable the fault interrupt";
>> +    1:1     protected_fault as bool, "Enable the protected_fault =
interrupt";
>> +    8:8     reset_completed as bool, "Enable the reset_completed =
interrupt";
>> +    9:9     power_changed_single as bool, "Enable the =
power_changed_single interrupt";
>> +    10:10   power_changed_all as bool, "Enable the power_changed_all =
interrupt";
>> +    17:17   clean_caches_completed as bool, "Enable the =
clean_caches_completed interrupt";
>> +    18:18   doorbell_status as bool, "Enable the doorbell_status =
interrupt";
>> +    19:19   mcu_status as bool, "Enable the mcu_status interrupt";
>> +});
>> +
>> +register!(GpuIrqStatus @ 0x2c, "Masked GPU interrupt status" {
>> +    0:0     fault as bool, "The fault interrupt is pending";
>> +    1:1     protected_fault as bool, "The protected_fault interrupt =
is pending";
>> +    8:8     reset_completed as bool, "The reset_completed interrupt =
is pending";
>> +    9:9     power_changed_single as bool, "The power_changed_single =
interrupt is pending";
>> +    10:10   power_changed_all as bool, "The power_changed_all =
interrupt is pending";
>> +    17:17   clean_caches_completed as bool, "The =
clean_caches_completed interrupt is pending";
>> +    18:18   doorbell_status as bool, "The doorbell_status interrupt =
is pending";
>> +    19:19   mcu_status as bool, "The mcu_status interrupt is =
pending";
>> +});
>> +
>> pub(crate) const GPU_CMD_SOFT_RESET: u32 =3D 1 | (1 << 8);
>> pub(crate) const GPU_CMD_HARD_RESET: u32 =3D 1 | (2 << 8);
>> -pub(crate) const GPU_THREAD_FEATURES: Register<0xac> =3D Register;
>> -pub(crate) const GPU_THREAD_MAX_THREADS: Register<0xa0> =3D =
Register;
>> -pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: Register<0xa4> =3D =
Register;
>> -pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: Register<0xa8> =3D =
Register;
>> -pub(crate) const GPU_TEXTURE_FEATURES0: Register<0xb0> =3D Register;
>> -pub(crate) const GPU_SHADER_PRESENT_LO: Register<0x100> =3D =
Register;
>> -pub(crate) const GPU_SHADER_PRESENT_HI: Register<0x104> =3D =
Register;
>> -pub(crate) const GPU_TILER_PRESENT_LO: Register<0x110> =3D Register;
>> -pub(crate) const GPU_TILER_PRESENT_HI: Register<0x114> =3D Register;
>> -pub(crate) const GPU_L2_PRESENT_LO: Register<0x120> =3D Register;
>> -pub(crate) const GPU_L2_PRESENT_HI: Register<0x124> =3D Register;
>> -pub(crate) const L2_READY_LO: Register<0x160> =3D Register;
>> -pub(crate) const L2_READY_HI: Register<0x164> =3D Register;
>> -pub(crate) const L2_PWRON_LO: Register<0x1a0> =3D Register;
>> -pub(crate) const L2_PWRON_HI: Register<0x1a4> =3D Register;
>> -pub(crate) const L2_PWRTRANS_LO: Register<0x220> =3D Register;
>> -pub(crate) const L2_PWRTRANS_HI: Register<0x204> =3D Register;
>> -pub(crate) const L2_PWRACTIVE_LO: Register<0x260> =3D Register;
>> -pub(crate) const L2_PWRACTIVE_HI: Register<0x264> =3D Register;
>> -
>> -pub(crate) const MCU_CONTROL: Register<0x700> =3D Register;
>> +
>> +register!(GpuCommand @ 0x30, "GPU command register" {
>> +    7:0     command as u32, "GPU-specific command to execute";
>> +    31:8    payload as u32, "Payload for the command";
>> +});
>> +
>> +register!(ThreadFeatures @ 0xac, "Thread features of the GPU's =
threading system" {
>> +    21:0    max_registers as u32, "Total number of registers per =
core";
>> +    23:22   implementation_technology as u32;
>> +    31:24   max_task_queue as u32, "Maximum number of compute tasks =
waiting";
>> +
>> +});
>> +
>> +register!(ThreadMaxThreads @ 0xa0, "Maximum number of threads per =
core" {
>> +    31:0    max_threads as u32, "Maximum number of threads per =
core";
>> +});
>> +
>> +register!(ThreadMaxWorkgroupSize @ 0xa4, "Maximum number of threads =
per workgroup" {
>> +    31:0    max_workgroup_size as u32, "Maximum number of threads =
per workgroup";
>> +});
>> +
>> +register!(ThreadMaxBarrierSize @ 0xa8, "Maximum number of threads =
per barrier" {
>> +    31:0    max_barrier_size as u32, "Maximum number of threads per =
barrier";
>> +});
>> +
>> +register!(TextureFeatures @ 0xb0 [4], "Bitmap of supported texture =
formats" {});
>> +
>> +register!(ShaderPresentLo @ 0x100, "Bitmap of shader cores present =
in the hardware (lower 32 bits)" {
>> +    31:0    shader_present_lo as u32, "Bitmap of shader cores =
present in the hardware (lower 32 bits)";
>> +});
>> +
>> +register!(ShaderPresentHi @ 0x104, "Bitmap of shader cores present =
in the hardware (higher 32 bits)" {
>> +    31:0    shader_present_hi as u32, "Bitmap of shader cores =
present in the hardware (higher 32 bits)";
>> +});
>> +
>> +register!(TilerPresentLo @ 0x110, "Bitmap of tiler cores present in =
the hardware (lower 32 bits)" {
>> +    31:0    tiler_present_lo as u32, "Bitmap of tiler cores present =
in the hardware (lower 32 bits)";
>> +});
>> +
>> +register!(TilerPresentHi @ 0x114, "Bitmap of tiler cores present in =
the hardware (higher 32 bits)" {
>> +    31:0    tiler_present_hi as u32, "Bitmap of tiler cores present =
in the hardware (higher 32 bits)";
>> +});
>> +
>> +register!(L2PresentLo @ 0x120, "Bitmap of L2 caches present in the =
hardware (lower 32 bits)" {
>> +    31:0    l2_present_lo as u32, "Bitmap of L2 caches present in =
the hardware (lower 32 bits)";
>> +});
>> +
>> +register!(L2PresentHi @ 0x124, "Bitmap of L2 caches present in the =
hardware (higher 32 bits)" {
>> +    31:0    l2_present_hi as u32, "Bitmap of L2 caches present in =
the hardware (higher 32 bits)";
>> +});
>> +
>> +register!(L2ReadyLo @ 0x160, "Bitmap of L2 caches ready (lower 32 =
bits)" {
>> +    31:0    l2_ready_lo as u32, "Bitmap of L2 caches ready (lower 32 =
bits)";
>> +});
>> +
>> +register!(L2ReadyHi @ 0x164, "Bitmap of L2 caches ready (higher 32 =
bits)" {
>> +    31:0    l2_ready_hi as u32, "Bitmap of L2 caches ready (higher =
32 bits)";
>> +});
>> +
>> +register!(L2PwrOnLo @ 0x1a0, "Bitmap of L2 caches power on requests =
(lower 32 bits)" {
>> +    31:0    l2_pwron_lo as u32, "Bitmap of L2 caches power on =
requests (lower 32 bits)";
>> +});
>> +
>> +register!(L2PwrOnHi @ 0x1a4, "Bitmap of L2 caches power on requests =
(higher 32 bits)" {
>> +    31:0    l2_pwron_hi as u32, "Bitmap of L2 caches power on =
requests (higher 32 bits)";
>> +});
>> +
>> +register!(L2PwrTransLo @ 0x200, "Bitmap of L2 caches in power =
transition (lower 32 bits)" {
>> +    31:0    l2_pwrtrans_lo as u32, "Bitmap of L2 caches in power =
transition (lower 32 bits)";
>> +});
>> +
>> +register!(L2PwrTransHi @ 0x204, "Bitmap of L2 caches in power =
transition (higher 32 bits)" {
>> +    31:0    l2_pwrtrans_hi as u32, "Bitmap of L2 caches in power =
transition (higher 32 bits)";
>> +});
>> +
>> +register!(L2PowerActiveLo @ 0x260, "Bitmap of L2 caches active =
(lower 32 bits)" {
>> +    31:0    l2_pwractive_lo as u32, "Bitmap of L2 caches active =
(lower 32 bits)";
>> +});
>> +
>> +register!(L2PowerActiveHi @ 0x264, "Bitmap of L2 caches active =
(higher 32 bits)" {
>> +    31:0    l2_pwractive_hi as u32, "Bitmap of L2 caches active =
(higher 32 bits)";
>> +});
>> +
>> pub(crate) const MCU_CONTROL_ENABLE: u32 =3D 1;
>> pub(crate) const MCU_CONTROL_AUTO: u32 =3D 2;
>> pub(crate) const MCU_CONTROL_DISABLE: u32 =3D 0;
>>=20
>> -pub(crate) const MCU_STATUS: Register<0x704> =3D Register;
>> +register!(McuControl @ 0x700, "Controls the execution state of the =
MCU subsystem" {
>> +    1:0     req as u32, "Request state change";
>> +});
>=20
>=20
> Any reason why req is a u32 and not a u8? Same for some other places.


I tend to default to u32/i32 in general, as that=E2=80=99s usually the =
native machine integer type.

All we get from smaller types is a spam of `into()`, `from()` and their =
`try_`
equivalents. When stored in a struct, they usually do not save space due =
to
padding that is usually inserted to fix the alignment for the type. IMHO =
not
worth it unless it really matters. Correct me if I'm wrong, but it =
doesn't seem
to be the case here.

>=20
> And would it be an option to move the const MCU_CONTROL* to an =C3=ACmpl=

> McuControl Same for STATUS below.

Ah true! I forgot about this. Thanks.


=E2=80=94 Daniel


