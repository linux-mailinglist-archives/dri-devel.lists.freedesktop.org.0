Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE803AEE283
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEFE10E48C;
	Mon, 30 Jun 2025 15:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99F2210E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:31:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D0541516;
 Mon, 30 Jun 2025 08:31:34 -0700 (PDT)
Received: from [10.57.28.116] (unknown [10.57.28.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97E153F6A8;
 Mon, 30 Jun 2025 08:31:38 -0700 (PDT)
Message-ID: <a1b3561d-f5de-4474-85ef-1525a6c36bc5@arm.com>
Date: Mon, 30 Jun 2025 16:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Introduce Tyr
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <6bb2344c-de0f-4bf9-b9ff-b7c7338ea1d7@arm.com>
 <1ADD8502-39D2-4705-8426-67AA8865E7BC@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <1ADD8502-39D2-4705-8426-67AA8865E7BC@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Daniel,

On 30/06/2025 15:56, Daniel Almeida wrote:
> Hi Steven,
> 
>> On 30 Jun 2025, at 07:11, Steven Price <steven.price@arm.com> wrote:
>>
>> Hi Daniel,
>>
>> My Rust is still quite weak, so I'll just review the GPU-specific parts.
>> Please CC me on future posts.
> 
> I just realized I forgot about cc’ing the current Panthor maintainers. My bad.

No big deal, but I'm not always on top of checking the lists.

>>> +
>>> +fn issue_soft_reset(iomem: &Devres<IoMem<0>>) -> Result<()> {
>>> +    let irq_enable_cmd = 1 | bit_u32(8);
>>
>> Badly named variable? This appears to be the encoding for a soft_reset
>> command.
> 
> You’re right.
> 
>>
>>> +    regs::GPU_CMD.write(iomem, irq_enable_cmd)?;
>>> +
>>> +    let op = || regs::GPU_INT_RAWSTAT.read(iomem);
>>> +    let cond = |raw_stat: &u32| -> bool { (*raw_stat >> 8) & 1 == 1 };
>>
>> You appear to have a define (GPU_INT_RAWSTAT_RESET_COMPLETED) but are
>> not using it?
> 
> That’s true, I missed it.
> 
>>
>> Also I know panthor also gets this wrong. But the names here don't match
>> the architecture (this is GPU_IRQ_RAWSTAT). Panthor is actually somewhat
>> confused as some defines are GPU_IRQ_xxx, but cross-referencing with the
>> architecture specs is so much easier when the names match up.
> 
> So.. that’s something I’ve been meaning to discuss for a while actually.
> 
> If the best approach here is to stick to the nomenclature from the spec I can
> definitely rework it. However, when working on the downstream code, I found
> that a few of the names used in the shared region were a bit cryptic. From the
> top of my mind I can recall things like "db_req/db_ack" and "ep_cfg". I just
> found "doorbell_request/doorbell_ack" and "endpoint_config" to be more
> descriptive. There were others too that I can't recall now.

We've generally been somewhat sloppy in the past and definitely
preferred more descriptive names when the architecture is overly terse.
I don't have any strong opinions, but IRQ changed to INT bugs me because
it's no shorter or more descriptive - just harder to search for when you
can't remember which term is used ;)

> […]
> 
>>
>>> +
>>> +const INFO: drm::driver::DriverInfo = drm::driver::DriverInfo {
>>> +    major: 0,
>>> +    minor: 0,
>>> +    patchlevel: 0,
>>> +    name: c_str!("panthor"),
>>> +    desc: c_str!("ARM Mali CSF-based Rust GPU driver"),
>>
>> I'm not sure what your long-term plan here is. I can see the benefit of
>> keeping the major/minor and name matching panthor. I would have thought
>> including "Tyr" in the description might be handy to make it obvious
>> which driver is being used (panthor already has "Panthor"). There are
>> also other marketing nitpicks over the description, but I don't know if
>> anyone actually cares ;)
> 
> 
> So the main idea here at Collabora is to have Tyr work as a drop-in replacement
> for Panthor in panvk. In other words, the objective is to not have to add yet a
> new panvk backend.

Cool, that is what I expected but I wanted to check because you
obviously haven't yet got to v1.0.

> 
> Feel free to suggest whatever is on your mind for the description field. I am
> pretty sure we can replace it with your version instead.

Well I'm not a marketing expert, but "Arm Mali Tyr DRM driver" would be
my suggestion. ARM has been Arm for a few years now, and for 'reasons'
there's been reluctance to refer to 'CSF' in the past. But the only part
I really care about is a easy/obvious way to distinguish Panthor/Tyr for
debugging purposes.

> 
> […]
> 
>>> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..a33caa7b2968e62da136f245422023ba6e3ad5c3
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/tyr/gpu.rs
>>> @@ -0,0 +1,217 @@
>>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>>> +
>>> +use crate::regs::*;
>>> +use kernel::bits;
>>> +use kernel::bits::genmask_u32;
>>> +use kernel::devres::Devres;
>>> +use kernel::io;
>>> +use kernel::io::mem::IoMem;
>>> +use kernel::platform;
>>> +use kernel::prelude::*;
>>> +use kernel::time;
>>> +use kernel::transmute::AsBytes;
>>> +
>>> +// This can be queried by userspace to get information about the GPU.
>>> +#[repr(C)]
>>> +pub(crate) struct GpuInfo {
>>> +    pub(crate) gpu_id: u32,
>>> +    pub(crate) csf_id: u32,
>>> +    pub(crate) gpu_rev: u32,
>>> +    pub(crate) core_features: u32,
>>> +    pub(crate) l2_features: u32,
>>> +    pub(crate) tiler_features: u32,
>>> +    pub(crate) mem_features: u32,
>>> +    pub(crate) mmu_features: u32,
>>> +    pub(crate) thread_features: u32,
>>> +    pub(crate) max_threads: u32,
>>> +    pub(crate) thread_max_workgroup_size: u32,
>>> +    pub(crate) thread_max_barrier_size: u32,
>>> +    pub(crate) coherency_features: u32,
>>> +    pub(crate) texture_features: [u32; 4],
>>> +    pub(crate) as_present: u32,
>>> +    pub(crate) shader_present: u64,
>>> +    pub(crate) tiler_present: u64,
>>> +    pub(crate) l2_present: u64,
>>> +}
>>
>> This may be me not understanding Rust. But this doesn't match struct
>> drm_panthor_gpu_info - the ordering is different and you haven't
>> included the padding. Does this actually work?
> 
> Oh, that is just a major bug :)
> 
> The fields and their ordering must definitely match if we want this to work. I
> will fix it on v2.
> 
> Thanks for catching it.
> 
> By the way, it works in the sense that something can be read from userspace,
> i.e.: you can run the IGT branch to test it. Of course, with the field ordering
> being shuffled, we won't read the right things.
> 
> Note that I did not test with panvk yet, that would have probably caught it.

Yeah I suspected that might have been the case. I was just unsure of my
abilty to read Rust and wondered if there was some magic reordering that
I didn't understand.

[...]
>>> +    }
>>> +
>>> +    pub(crate) fn log(&self, pdev: &platform::Device) {
>>> +        let major = (self.gpu_id >> 16) & 0xff;
>>> +        let minor = (self.gpu_id >> 8) & 0xff;
>>> +        let status = self.gpu_id & 0xff;
>>> +
>>> +        let model_name = if let Some(model) = GPU_MODELS
>>> +            .iter()
>>> +            .find(|&f| f.major == major && f.minor == minor)
>>> +        {
>>> +            model.name
>>> +        } else {
>>> +            "unknown"
>>> +        };
>>
>> Just a heads up, we have some horrible naming rules for later GPUs (see
>> Karunika's patch[1] adding panthor support). E.g. for major 11, minor 2:
>>
>> * If shaders > 10 && ray tracing then Mali-G715-Immortalis
>> * else if shaders >= 7 then Mali-G715
>> * else Mali-G615 (also for major 11, minor 3).
>>
>> Although you may want to ignore this craziness for now ;)
>>
>> [1]
>> https://lore.kernel.org/all/20250602143216.2621881-6-karunika.choo@arm.com/
> 
> I think we should ignore this for now. Tyr will probably not work on anything
> else other than the rk3588 for the time being anyway.

Yes, that makes sense.

>>> +}
>>> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..db36cfd030d202e47619cb744cae5597d47f6029
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/tyr/regs.rs
>>> @@ -0,0 +1,252 @@
>>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>>> +
>>> +#![allow(dead_code)]
>>> +
>>> +use kernel::bits::bit_u64;
>>> +use kernel::devres::Devres;
>>> +use kernel::io::mem::IoMem;
>>> +use kernel::{bits::bit_u32, prelude::*};
>>> +
>>> +/// Represents a register in the Register Set
>>> +pub(crate) struct Register<const OFFSET: usize>;
>>> +
>>> +impl<const OFFSET: usize> Register<OFFSET> {
>>> +    #[inline]
>>> +    pub(crate) fn read(&self, iomem: &Devres<IoMem>) -> Result<u32> {
>>> +        (*iomem).try_access().ok_or(ENODEV)?.try_read32(OFFSET)
>>> +    }
>>> +
>>> +    #[inline]
>>> +    pub(crate) fn write(&self, iomem: &Devres<IoMem>, value: u32) -> Result<()> {
>>> +        (*iomem)
>>> +            .try_access()
>>> +            .ok_or(ENODEV)?
>>> +            .try_write32(value, OFFSET)
>>> +    }
>>> +}
>>
>> You might want to consider a 64 bit register abstraction as well.
>> Panthor recently switched over to avoid the whole _HI/_LO dance.
> 
> Right, that should be achievable for v2.
> 
>>
>>> +
>>> +pub(crate) const GPU_ID: Register<0x0> = Register;
>>> +pub(crate) const GPU_L2_FEATURES: Register<0x4> = Register;
>>> +pub(crate) const GPU_CORE_FEATURES: Register<0x8> = Register;
>>> +pub(crate) const GPU_CSF_ID: Register<0x1c> = Register;
>>> +pub(crate) const GPU_REVID: Register<0x280> = Register;
>>> +pub(crate) const GPU_TILER_FEATURES: Register<0xc> = Register;
>>> +pub(crate) const GPU_MEM_FEATURES: Register<0x10> = Register;
>>> +pub(crate) const GPU_MMU_FEATURES: Register<0x14> = Register;
>>> +pub(crate) const GPU_AS_PRESENT: Register<0x18> = Register;
>>> +pub(crate) const GPU_INT_RAWSTAT: Register<0x20> = Register;
>>> +
>>> +pub(crate) const GPU_INT_RAWSTAT_FAULT: u32 = bit_u32(0);
>>> +pub(crate) const GPU_INT_RAWSTAT_PROTECTED_FAULT: u32 = bit_u32(1);
>>> +pub(crate) const GPU_INT_RAWSTAT_RESET_COMPLETED: u32 = bit_u32(8);
>>> +pub(crate) const GPU_INT_RAWSTAT_POWER_CHANGED_SINGLE: u32 = bit_u32(9);
>>> +pub(crate) const GPU_INT_RAWSTAT_POWER_CHANGED_ALL: u32 = bit_u32(10);
>>> +pub(crate) const GPU_INT_RAWSTAT_CLEAN_CACHES_COMPLETED: u32 = bit_u32(17);
>>> +pub(crate) const GPU_INT_RAWSTAT_DOORBELL_STATUS: u32 = bit_u32(18);
>>> +pub(crate) const GPU_INT_RAWSTAT_MCU_STATUS: u32 = bit_u32(19);
>>> +
>>> +pub(crate) const GPU_INT_CLEAR: Register<0x24> = Register;
>>> +pub(crate) const GPU_INT_MASK: Register<0x28> = Register;
>>> +pub(crate) const GPU_INT_STAT: Register<0x2c> = Register;
>>> +pub(crate) const GPU_CMD: Register<0x30> = Register;
>>> +pub(crate) const GPU_THREAD_FEATURES: Register<0xac> = Register;
>>> +pub(crate) const GPU_THREAD_MAX_THREADS: Register<0xa0> = Register;
>>> +pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: Register<0xa4> = Register;
>>> +pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: Register<0xa8> = Register;
>>> +pub(crate) const GPU_TEXTURE_FEATURES0: Register<0xb0> = Register;
>>> +pub(crate) const GPU_SHADER_PRESENT_LO: Register<0x100> = Register;
>>> +pub(crate) const GPU_SHADER_PRESENT_HI: Register<0x104> = Register;
>>> +pub(crate) const GPU_TILER_PRESENT_LO: Register<0x110> = Register;
>>> +pub(crate) const GPU_TILER_PRESENT_HI: Register<0x114> = Register;
>>> +pub(crate) const GPU_L2_PRESENT_LO: Register<0x120> = Register;
>>> +pub(crate) const GPU_L2_PRESENT_HI: Register<0x124> = Register;
>>> +pub(crate) const L2_READY_LO: Register<0x160> = Register;
>>> +pub(crate) const L2_READY_HI: Register<0x164> = Register;
>>> +pub(crate) const L2_PWRON_LO: Register<0x1a0> = Register;
>>> +pub(crate) const L2_PWRON_HI: Register<0x1a4> = Register;
>>> +pub(crate) const L2_PWRTRANS_LO: Register<0x220> = Register;
>>> +pub(crate) const L2_PWRTRANS_HI: Register<0x204> = Register;
>>> +pub(crate) const L2_PWRACTIVE_LO: Register<0x260> = Register;
>>> +pub(crate) const L2_PWRACTIVE_HI: Register<0x264> = Register;
>>> +
>>> +pub(crate) const MCU_CONTROL: Register<0x700> = Register;
>>> +pub(crate) const MCU_CONTROL_ENABLE: u32 = 1;
>>> +pub(crate) const MCU_CONTROL_AUTO: u32 = 2;
>>> +pub(crate) const MCU_CONTROL_DISABLE: u32 = 0;
>>> +
>>> +pub(crate) const MCU_STATUS: Register<0x704> = Register;
>>> +pub(crate) const MCU_STATUS_DISABLED: u32 = 0;
>>> +pub(crate) const MCU_STATUS_ENABLED: u32 = 1;
>>> +pub(crate) const MCU_STATUS_HALT: u32 = 2;
>>> +pub(crate) const MCU_STATUS_FATAL: u32 = 3;
>>> +
>>> +pub(crate) const GPU_COHERENCY_FEATURES: Register<0x300> = Register;
>>> +
>>> +pub(crate) const JOB_INT_RAWSTAT: Register<0x1000> = Register;
>>> +pub(crate) const JOB_INT_CLEAR: Register<0x1004> = Register;
>>> +pub(crate) const JOB_INT_MASK: Register<0x1008> = Register;
>>> +pub(crate) const JOB_INT_STAT: Register<0x100c> = Register;
>>> +
>>> +pub(crate) const JOB_INT_GLOBAL_IF: u32 = bit_u32(31);
>>> +
>>> +pub(crate) const MMU_INT_RAWSTAT: Register<0x2000> = Register;
>>> +pub(crate) const MMU_INT_CLEAR: Register<0x2004> = Register;
>>> +pub(crate) const MMU_INT_MASK: Register<0x2008> = Register;
>>> +pub(crate) const MMU_INT_STAT: Register<0x200c> = Register;
>>> +
>>> +pub(crate) const AS_TRANSCFG_ADRMODE_UNMAPPED: u64 = bit_u64(0);
>>> +pub(crate) const AS_TRANSCFG_ADRMODE_IDENTITY: u64 = bit_u64(1);
>>> +pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_4K: u64 = bit_u64(2) | bit_u64(1);
>>> +pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_64K: u64 = bit_u64(3);
>>> +pub(crate) const fn as_transcfg_ina_bits(x: u64) -> u64 {
>>> +    x << 6
>>> +}
>>> +pub(crate) const fn as_transcfg_outa_bits(x: u64) -> u64 {
>>> +    x << 14
>>> +}
>>> +pub(crate) const AS_TRANSCFG_SL_CONCAT: u64 = bit_u64(22);
>>> +pub(crate) const AS_TRANSCFG_PTW_MEMATTR_NC: u64 = bit_u64(24);
>>> +pub(crate) const AS_TRANSCFG_PTW_MEMATTR_WB: u64 = bit_u64(25);
>>> +pub(crate) const AS_TRANSCFG_PTW_SH_NS: u64 = 0 << 28;
>>> +pub(crate) const AS_TRANSCFG_PTW_SH_OS: u64 = bit_u64(29);
>>> +pub(crate) const AS_TRANSCFG_PTW_SH_IS: u64 = bit_u64(29) | bit_u64(28);
>>> +pub(crate) const AS_TRANSCFG_PTW_RA: u64 = bit_u64(30);
>>> +pub(crate) const AS_TRANSCFG_DISABLE_HIER_AP: u64 = bit_u64(33);
>>> +pub(crate) const AS_TRANSCFG_DISABLE_AF_FAULT: u64 = bit_u64(34);
>>> +pub(crate) const AS_TRANSCFG_WXN: u64 = bit_u64(35);
>>> +
>>> +pub(crate) const MMU_BASE: usize = 0x2400;
>>> +pub(crate) const MMU_AS_SHIFT: usize = 6;
>>> +
>>> +const fn mmu_as(as_nr: usize) -> usize {
>>> +    MMU_BASE + (as_nr << MMU_AS_SHIFT)
>>> +}
>>> +
>>> +pub(crate) struct AsRegister(usize);
>>> +
>>> +impl AsRegister {
>>> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
>>> +        if as_nr >= 32 {
>>
>> Should be 16 really. This is a bit of an architectural quirk. There are
>> only ever 16 sets of address space registers, but the AS_PRESENT
>> register is defined as 32 bit.
> 
> Oh, I did not know that.

It's somewhat non-obvious from the spec. I'd never really thought about
it before - it's one of those things that seems obvious when you've
worked Mali for too long ;)

Thanks,
Steve

>>
>>> +            Err(EINVAL)
>>> +        } else {
>>> +            Ok(AsRegister(mmu_as(as_nr) + offset))
>>> +        }
>>> +    }
>>> +
>>> +    #[inline]
>>> +    pub(crate) fn read(&self, iomem: &Devres<IoMem>) -> Result<u32> {
>>> +        (*iomem).try_access().ok_or(ENODEV)?.try_read32(self.0)
>>> +    }
>>> +
>>> +    #[inline]
>>> +    pub(crate) fn write(&self, iomem: &Devres<IoMem>, value: u32) -> Result<()> {
>>> +        (*iomem)
>>> +            .try_access()
>>> +            .ok_or(ENODEV)?
>>> +            .try_write32(value, self.0)
>>> +    }
>>> +}
>>> +
>>> +pub(crate) fn as_transtab_lo(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x0)
>>> +}
>>> +
>>> +pub(crate) fn as_transtab_hi(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x4)
>>> +}
>>> +
>>> +pub(crate) fn as_memattr_lo(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x8)
>>> +}
>>> +
>>> +pub(crate) fn as_memattr_hi(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0xc)
>>> +}
>>> +
>>> +pub(crate) fn as_lockaddr_lo(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x10)
>>> +}
>>> +
>>> +pub(crate) fn as_lockaddr_hi(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x14)
>>> +}
>>> +
>>> +pub(crate) fn as_command(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x18)
>>> +}
>>> +
>>> +pub(crate) fn as_faultstatus(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x1c)
>>> +}
>>> +
>>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_MASK: u32 = 0x3 << 8;
>>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_ATOMIC: u32 = 0x0 << 8;
>>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_EX: u32 = 0x1 << 8;
>>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_READ: u32 = 0x2 << 8;
>>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_WRITE: u32 = 0x3 << 8;
>>> +
>>> +pub(crate) fn as_faultaddress_lo(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x20)
>>> +}
>>> +
>>> +pub(crate) fn as_faultaddress_hi(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x24)
>>> +}
>>> +
>>> +pub(crate) const AS_COMMAND_NOP: u32 = 0;
>>> +pub(crate) const AS_COMMAND_UPDATE: u32 = 1;
>>> +pub(crate) const AS_COMMAND_LOCK: u32 = 2;
>>> +pub(crate) const AS_COMMAND_UNLOCK: u32 = 3;
>>> +pub(crate) const AS_COMMAND_FLUSH_PT: u32 = 4;
>>> +pub(crate) const AS_COMMAND_FLUSH_MEM: u32 = 5;
>>
>> These should be moved up next to as_command().
> 
> Ack
> 
>>
>>> +
>>> +pub(crate) fn as_status(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x28)
>>> +}
>>> +
>>> +pub(crate) const AS_STATUS_ACTIVE: u32 = bit_u32(0);
>>> +
>>> +pub(crate) fn as_transcfg_lo(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x30)
>>> +}
>>> +pub(crate) fn as_transcfg_hi(as_nr: usize) -> Result<AsRegister> {
>>> +    AsRegister::new(as_nr, 0x34)
>>> +}
>>> +
>>> +pub(crate) const AS_LOCK_REGION_MIN_SIZE: u32 = bit_u32(15);
>>> +
>>> +pub(crate) const AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL: u32 = 2 << 2;
>>> +
>>> +pub(crate) fn as_memattr_aarch64_inner_alloc_expl(w: bool, r: bool) -> u32 {
>>> +    (3 << 2) | ((w as u32) << 0) | ((r as u32) << 1)
>>> +}
>>> +pub(crate) const AS_MEMATTR_AARCH64_SH_MIDGARD_INNER: u32 = 0 << 4;
>>> +pub(crate) const AS_MEMATTR_AARCH64_SH_CPU_INNER: u32 = 1 << 4;
>>> +pub(crate) const AS_MEMATTR_AARCH64_SH_CPU_INNER_SHADER_COH: u32 = 2 << 4;
>>> +pub(crate) const AS_MEMATTR_AARCH64_SHARED: u32 = 0 << 6;
>>> +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_NC: u32 = 1 << 6;
>>> +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_WB: u32 = 2 << 6;
>>> +pub(crate) const AS_MEMATTR_AARCH64_FAULT: u32 = 3 << 6;
>>
>> These also should be moved.
> 
> Ack
> 
> […]
> 
>>> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
>>> index 1409441359f510236256bc17851f9aac65c45c4e..f9959c1d889170ebe6ad5f98a431225fb08625b5 100644
>>> --- a/rust/uapi/uapi_helper.h
>>> +++ b/rust/uapi/uapi_helper.h
>>> @@ -9,6 +9,7 @@
>>> #include <uapi/asm-generic/ioctl.h>
>>> #include <uapi/drm/drm.h>
>>> #include <uapi/drm/nova_drm.h>
>>> +#include<uapi/drm/panthor_drm.h>
>>
>> Missing space, I can review C for style :)
> 
> Ack
> 
>>
>> Thanks,
>> Steve
>>
>>> #include <uapi/linux/mdio.h>
>>> #include <uapi/linux/mii.h>
>>> #include <uapi/linux/ethtool.h>
>>>
>>> ---
>>> base-commit: 1b1d6cbeba24e4c9ff39580101472efeb3bd9b6f
>>> change-id: 20250627-tyr-683ec49113ba
>>>
>>> Best regards,
> 
> — Daniel
> 
> 

