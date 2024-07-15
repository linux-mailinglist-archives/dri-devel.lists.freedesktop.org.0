Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D29310EC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B0910E19A;
	Mon, 15 Jul 2024 09:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3579710E19A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:12:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16628DA7;
 Mon, 15 Jul 2024 02:12:47 -0700 (PDT)
Received: from [10.57.9.1] (unknown [10.57.9.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB86B3F73F;
 Mon, 15 Jul 2024 02:12:18 -0700 (PDT)
Message-ID: <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
Date: Mon, 15 Jul 2024 10:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, robh@kernel.org,
 lina@asahilina.net, mcanal@igalia.com, airlied@gmail.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
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

On 12/07/2024 15:35, Daniel Almeida wrote:
> Hi Steven, thanks for the review!
> 
>>
>> This is defining the ABI to userspace and as such we'd need a way of
>> exporting this for userspace tools to use. The C approach is a header in
>> include/uabi. I'd also suggest making it obvious this enum can't be
>> rearranged (e.g. a comment, or assigning specific numbers). There's also
>> some ABI below which needs exporting in some way, along with some
>> documentation (comments may be sufficient) explaining how e.g.
>> header_size works.
>>
> 
> I will defer this topic to others in the Rust for Linux community. I think this is the first time this scenario comes up in Rust code?
> 
> FYI I am working on a tool in Mesa to decode the dump [0]. Since the tool is also written in Rust, and given the RFC nature of this patch, I just copied and pasted things for now, including panthor_regs.rs.
> 
> IMHO, the solution here is to use cbindgen to automatically generate a C header to place in include/uapi. This will ensure that the header is in sync with the Rust code. I will do that in v2.
> 
> [0]: https://gitlab.freedesktop.org/dwlsalmeida/mesa/-/tree/panthor-devcoredump?ref_type=heads

Nice to see there's a user space tool - it's always good to signpost
such things because it shows how the interface is going to be used.

I note it also shows that the "panthor_regs.rs" would ideally be shared.
For arm64 we have been moving to generating system register descriptions
from a text source (see arch/arm64/tools/sysreg) - I'm wondering whether
something similar is needed for Panthor to generate both C and Rust
headers? Although perhaps that's overkill, sysregs are certainly
somewhat more complex.

>>> +}
>>> +
>>> +#[repr(C)]
>>> +pub(crate) struct DumpArgs {
>>> +    dev: *mut bindings::device,
>>> +    /// The slot for the job
>>> +    slot: i32,
>>> +    /// The active buffer objects
>>> +    bos: *mut *mut bindings::drm_gem_object,
>>> +    /// The number of active buffer objects
>>> +    bo_count: usize,
>>> +    /// The base address of the registers to use when reading.
>>> +    reg_base_addr: *mut core::ffi::c_void,
>>> +}
>>> +
>>> +#[repr(C)]
>>> +pub(crate) struct Header {
>>> +    magic: u32,
>>> +    ty: HeaderType,
>>> +    header_size: u32,
>>> +    data_size: u32,
>>> +}
>>> +
>>> +#[repr(C)]
>>> +#[derive(Clone, Copy)]
>>> +pub(crate) struct RegisterDump {
>>> +    register: GpuRegister,
>>> +    value: u32,
>>> +}
>>> +
>>> +/// The registers to dump
>>> +const REGISTERS: [GpuRegister; 18] = [
>>> +    regs::SHADER_READY_LO,
>>> +    regs::SHADER_READY_HI,
>>> +    regs::TILER_READY_LO,
>>> +    regs::TILER_READY_HI,
>>> +    regs::L2_READY_LO,
>>> +    regs::L2_READY_HI,
>>> +    regs::JOB_INT_MASK,
>>> +    regs::JOB_INT_STAT,
>>> +    regs::MMU_INT_MASK,
>>> +    regs::MMU_INT_STAT,
>>
>> I'm not sure how much thought you've put into these registers. Most of
>> these are 'boring'. And for a "standalone" dump we'd want identification
>> registers.
> 
> Not much, to be honest. I based myself a bit on the registers dumped by the panfrost driver if they matched something in panthor_regs.h
> 
> What would you suggest here? Boris also suggested dumping a snapshot of the FW interface.
> 
> (Disclaimer: Most of my experience is in video codecs, so I must say I am a bit new to GPU code)

I would think it useful to have a copy of the identification registers
so that it's immediately clear from a dump which GPU it was from, so:

* GPU_ID
* GPU_L2_FEATURES
* GPU_CORE_FEATURES
* GPU_TILER_FEATURES
* GPU_MEM_FEATURES
* GPU_MMU_FEATURES
* GPU_CSF_ID
* GPU_THREAD_MAX_THREAD
* GPU_THREAD_MAX_WORKGROUP_SIZE
* GPU_THREAD_MAX_BARRIER_SIZE
* GPU_TEXTURE_FEATURES (multiple registers)
* GPU_COHERENCY_FEATURES

(Basically the information already presented to user space in struct
drm_panthor_gpu_info)

In terms of the registers you've got:
* _READY_ registers seem like an odd choice, I'd go for the _PRESENT_
registers which describe the hardware. I'll admit it would be
interesting to know if the GPU didn't actually power up all cores, but
because this is a snapshot after the job fails it wouldn't answer the
question as to whether the cores were powered up while the job was
running, so I'm not convinced it makes sense for this interface.

* _INT_MASK/_INT_STAT - again because this is a snapshot after the job
completes, I don't think this would actually be very useful.

* Address space registers - I'm not sure these will actually contain
anything useful by the time the job is dumped. Information on page
faults caused by a job could be interesting, but it might require
another mechanism. As mentioned below AS 0 is the MMU for the firmware,
which should be boring unless firmware is the thing being debugged. But
generally I'd expect a different mechanism for that because firmware
debugging isn't tied to particular jobs.


As Boris says a snapshot of the FW interface could also be interesting.
That's not from registers, so it should be similar to dumping BOs.

<snip>

>>> +};
>>> +
>>> +/**
>>> + * Dumps the current state of the GPU to a file
>>> + *
>>> + * # Safety
>>> + *
>>> + * All fields of `DumpArgs` must be valid.
>>> + */
>>> +#ifdef CONFIG_DRM_PANTHOR_RS
>>> +int panthor_core_dump(const struct PanthorDumpArgs *args);
>>> +#else
>>> +inline int panthor_core_dump(const struct PanthorDumpArgs *args)
>>> +{
>>> + return 0;
>>
>> This should return an error (-ENOTSUPP ? ). Not that the return value is
>> used...
>>
> 
> I think that returning 0 in stubs is a bit of a pattern throughout the kernel? But sure, I can
> change that to ENOTSUPP. 

It depends whether the stub is "successful" or not. The usual pattern is
that the stubs do nothing because there is nothing to do (the feature is
disabled) and so are successful at performing that nothing.

Although really here the problem is that we shouldn't be preparing the
dump arguments if dumping isn't built in. So the stub is at the wrong
level - it would be better to stub dump_job() instead.

>>> +}
>>> +#endif
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>>> index 79ffcbc41d78..39e1654d930e 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>> @@ -1,6 +1,9 @@
>>> // SPDX-License-Identifier: GPL-2.0 or MIT
>>> /* Copyright 2023 Collabora ltd. */
>>>
>>> +#include "drm/drm_gem.h"
>>> +#include "linux/gfp_types.h"
>>> +#include "linux/slab.h"
>>> #include <drm/drm_drv.h>
>>> #include <drm/drm_exec.h>
>>> #include <drm/drm_gem_shmem_helper.h>
>>> @@ -31,6 +34,7 @@
>>> #include "panthor_mmu.h"
>>> #include "panthor_regs.h"
>>> #include "panthor_sched.h"
>>> +#include "panthor_rs.h"
>>>
>>> /**
>>>  * DOC: Scheduler
>>> @@ -2805,6 +2809,27 @@ static void group_sync_upd_work(struct work_struct *work)
>>> group_put(group);
>>> }
>>>
>>> +static void dump_job(struct panthor_device *dev, struct panthor_job *job)
>>> +{
>>> + struct panthor_vm *vm = job->group->vm;
>>> + struct drm_gem_object **objs;
>>> + u32 count;
>>> +
>>> + objs = panthor_vm_dump(vm, &count);
>>> +
>>> + if (!IS_ERR(objs)) {
>>> + struct PanthorDumpArgs args = {
>>> + .dev = job->group->ptdev->base.dev,
>>> + .bos = objs,
>>> + .bo_count = count,
>>> + .reg_base_addr = dev->iomem,
>>> + };
>>> + panthor_core_dump(&args);
>>> + kfree(objs);
>>> + }
>>> +}
>>
>> It would be better to avoid generating the dump if panthor_core_dump()
>> is a no-op.
> 
> I will gate that behind #ifdefs in v2.
> 
>>
>>> +
>>> +
>>> static struct dma_fence *
>>> queue_run_job(struct drm_sched_job *sched_job)
>>> {
>>> @@ -2929,7 +2954,7 @@ queue_run_job(struct drm_sched_job *sched_job)
>>> }
>>>
>>> done_fence = dma_fence_get(job->done_fence);
>>> -
>>> + dump_job(ptdev, job);
>>
>> This doesn't look right - is this left from debugging?
> 
> Yes, I wanted a way for people to test this patch if they wanted to, and dumping just the failed
> jobs wouldn’t work for this purpose.
> 
> OTOH, I am thinking about adding a debugfs knob to control this, what do you think?
> 
> This would allow us to dump successful jobs in a tidy manner. Something along the lines of
> "dump the next N successful jobs”. Failed jobs would always be dumped, though.

Yes that could be very useful for debugging purposes - although I
believe devcoredump will drop new dumps if there's already an unread one
- so I'm not sure "N successful jobs" will work well, it might just have
to be a (self-resetting) flag for "dump next job".

>>
>>> out_unlock:
>>> mutex_unlock(&sched->lock);
>>> pm_runtime_mark_last_busy(ptdev->base.dev);
>>> @@ -2950,6 +2975,7 @@ queue_timedout_job(struct drm_sched_job *sched_job)
>>> drm_warn(&ptdev->base, "job timeout\n");
>>>
>>> drm_WARN_ON(&ptdev->base, atomic_read(&sched->reset.in_progress));
>>> + dump_job(ptdev, job);
>>
>> This looks like the right place.
>>
>>>
>>> queue_stop(queue, job);
>>>
>>> diff --git a/drivers/gpu/drm/panthor/regs.rs b/drivers/gpu/drm/panthor/regs.rs
>>> new file mode 100644
>>> index 000000000000..514bc9ee2856
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/panthor/regs.rs
>>> @@ -0,0 +1,264 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +// SPDX-FileCopyrightText: Copyright Collabora 2024
>>> +// SPDX-FileCopyrightText: (C) COPYRIGHT 2010-2022 ARM Limited. All rights reserved.
>>> +
>>> +//! The registers for Panthor, extracted from panthor_regs.h
>>
>> Was this a manual extraction, or is this scripted? Ideally we wouldn't
>> have two locations to maintain the register list.
> 
> This was generated by a Python script. Should the script be included in the patch then?

It's useful to know (it means there's no point reviewing every line). I
think we need some way of avoiding multiple places to maintain the
register list - a script to covert from C would be one way, but
obviously the script then needs to be available too.

>>
>>> +
>>> +#![allow(unused_macros, unused_imports, dead_code)]
>>> +
>>> +use kernel::bindings;
>>> +
>>> +use core::ops::Add;
>>> +use core::ops::Shl;
>>> +use core::ops::Shr;
>>> +
>>> +#[repr(transparent)]
>>> +#[derive(Clone, Copy)]
>>> +pub(crate) struct GpuRegister(u64);
>>> +
>>> +impl GpuRegister {
>>> +    pub(crate) fn read(&self, iomem: *const core::ffi::c_void) -> u32 {
>>> +        // Safety: `reg` represents a valid address
>>> +        unsafe {
>>> +            let addr = iomem.offset(self.0 as isize);
>>> +            bindings::readl_relaxed(addr as *const _)
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +pub(crate) const fn bit(index: u64) -> u64 {
>>> +    1 << index
>>> +}
>>> +pub(crate) const fn genmask(high: u64, low: u64) -> u64 {
>>> +    ((1 << (high - low + 1)) - 1) << low
>>> +}
>>
>> These look like they should be in a more generic header - but maybe I
>> don't understand Rust ;)
>>
> 
> Ideally these should be exposed by the kernel crate - i.e.: the code in the rust top-level directory.
> 
> I specifically did not want to touch that in this first submission. Maybe a separate patch would be in order here.

A separate patch adding to the kernel crate is the right way to go. Keep
it in the same series to demonstrate there is a user for the new functions.

>>> +
>>> +pub(crate) const GPU_ID: GpuRegister = GpuRegister(0x0);
>>> +pub(crate) const fn gpu_arch_major(x: u64) -> GpuRegister {
>>> +    GpuRegister((x) >> 28)
>>> +}
>>> +pub(crate) const fn gpu_arch_minor(x: u64) -> GpuRegister {
>>> +    GpuRegister((x) & genmask(27, 24) >> 24)
>>> +}
>>> +pub(crate) const fn gpu_arch_rev(x: u64) -> GpuRegister {
>>> +    GpuRegister((x) & genmask(23, 20) >> 20)
>>> +}
>>> +pub(crate) const fn gpu_prod_major(x: u64) -> GpuRegister {
>>> +    GpuRegister((x) & genmask(19, 16) >> 16)
>>> +}
>>> +pub(crate) const fn gpu_ver_major(x: u64) -> GpuRegister {
>>> +    GpuRegister((x) & genmask(15, 12) >> 12)
>>> +}
>>> +pub(crate) const fn gpu_ver_minor(x: u64) -> GpuRegister {
>>> +    GpuRegister((x) & genmask(11, 4) >> 4)
>>> +}
>>> +pub(crate) const fn gpu_ver_status(x: u64) -> GpuRegister {
>>> +    GpuRegister(x & genmask(3, 0))
>>> +}
>>> +pub(crate) const GPU_L2_FEATURES: GpuRegister = GpuRegister(0x4);
>>> +pub(crate) const fn gpu_l2_features_line_size(x: u64) -> GpuRegister {
>>> +    GpuRegister(1 << ((x) & genmask(7, 0)))
>>> +}
>>> +pub(crate) const GPU_CORE_FEATURES: GpuRegister = GpuRegister(0x8);
>>> +pub(crate) const GPU_TILER_FEATURES: GpuRegister = GpuRegister(0xc);
>>> +pub(crate) const GPU_MEM_FEATURES: GpuRegister = GpuRegister(0x10);
>>> +pub(crate) const GROUPS_L2_COHERENT: GpuRegister = GpuRegister(bit(0));
>>> +pub(crate) const GPU_MMU_FEATURES: GpuRegister = GpuRegister(0x14);
>>> +pub(crate) const fn gpu_mmu_features_va_bits(x: u64) -> GpuRegister {
>>> +    GpuRegister((x) & genmask(7, 0))
>>> +}
>>> +pub(crate) const fn gpu_mmu_features_pa_bits(x: u64) -> GpuRegister {
>>> +    GpuRegister(((x) >> 8) & genmask(7, 0))
>>> +}
>>> +pub(crate) const GPU_AS_PRESENT: GpuRegister = GpuRegister(0x18);
>>> +pub(crate) const GPU_CSF_ID: GpuRegister = GpuRegister(0x1c);
>>> +pub(crate) const GPU_INT_RAWSTAT: GpuRegister = GpuRegister(0x20);
>>> +pub(crate) const GPU_INT_CLEAR: GpuRegister = GpuRegister(0x24);
>>> +pub(crate) const GPU_INT_MASK: GpuRegister = GpuRegister(0x28);
>>> +pub(crate) const GPU_INT_STAT: GpuRegister = GpuRegister(0x2c);
>>> +pub(crate) const GPU_IRQ_FAULT: GpuRegister = GpuRegister(bit(0));
>>> +pub(crate) const GPU_IRQ_PROTM_FAULT: GpuRegister = GpuRegister(bit(1));
>>> +pub(crate) const GPU_IRQ_RESET_COMPLETED: GpuRegister = GpuRegister(bit(8));
>>> +pub(crate) const GPU_IRQ_POWER_CHANGED: GpuRegister = GpuRegister(bit(9));
>>> +pub(crate) const GPU_IRQ_POWER_CHANGED_ALL: GpuRegister = GpuRegister(bit(10));
>>> +pub(crate) const GPU_IRQ_CLEAN_CACHES_COMPLETED: GpuRegister = GpuRegister(bit(17));
>>> +pub(crate) const GPU_IRQ_DOORBELL_MIRROR: GpuRegister = GpuRegister(bit(18));
>>> +pub(crate) const GPU_IRQ_MCU_STATUS_CHANGED: GpuRegister = GpuRegister(bit(19));
>>> +pub(crate) const GPU_CMD: GpuRegister = GpuRegister(0x30);
>>> +const fn gpu_cmd_def(ty: u64, payload: u64) -> u64 {
>>> +    (ty) | ((payload) << 8)
>>> +}
>>> +pub(crate) const fn gpu_soft_reset() -> GpuRegister {
>>> +    GpuRegister(gpu_cmd_def(1, 1))
>>> +}
>>> +pub(crate) const fn gpu_hard_reset() -> GpuRegister {
>>> +    GpuRegister(gpu_cmd_def(1, 2))
>>> +}
>>> +pub(crate) const CACHE_CLEAN: GpuRegister = GpuRegister(bit(0));
>>> +pub(crate) const CACHE_INV: GpuRegister = GpuRegister(bit(1));
>>> +pub(crate) const GPU_STATUS: GpuRegister = GpuRegister(0x34);
>>> +pub(crate) const GPU_STATUS_ACTIVE: GpuRegister = GpuRegister(bit(0));
>>> +pub(crate) const GPU_STATUS_PWR_ACTIVE: GpuRegister = GpuRegister(bit(1));
>>> +pub(crate) const GPU_STATUS_PAGE_FAULT: GpuRegister = GpuRegister(bit(4));
>>> +pub(crate) const GPU_STATUS_PROTM_ACTIVE: GpuRegister = GpuRegister(bit(7));
>>> +pub(crate) const GPU_STATUS_DBG_ENABLED: GpuRegister = GpuRegister(bit(8));
>>> +pub(crate) const GPU_FAULT_STATUS: GpuRegister = GpuRegister(0x3c);
>>> +pub(crate) const GPU_FAULT_ADDR_LO: GpuRegister = GpuRegister(0x40);
>>> +pub(crate) const GPU_FAULT_ADDR_HI: GpuRegister = GpuRegister(0x44);
>>> +pub(crate) const GPU_PWR_KEY: GpuRegister = GpuRegister(0x50);
>>> +pub(crate) const GPU_PWR_KEY_UNLOCK: GpuRegister = GpuRegister(0x2968a819);
>>> +pub(crate) const GPU_PWR_OVERRIDE0: GpuRegister = GpuRegister(0x54);
>>> +pub(crate) const GPU_PWR_OVERRIDE1: GpuRegister = GpuRegister(0x58);
>>> +pub(crate) const GPU_TIMESTAMP_OFFSET_LO: GpuRegister = GpuRegister(0x88);
>>> +pub(crate) const GPU_TIMESTAMP_OFFSET_HI: GpuRegister = GpuRegister(0x8c);
>>> +pub(crate) const GPU_CYCLE_COUNT_LO: GpuRegister = GpuRegister(0x90);
>>> +pub(crate) const GPU_CYCLE_COUNT_HI: GpuRegister = GpuRegister(0x94);
>>> +pub(crate) const GPU_TIMESTAMP_LO: GpuRegister = GpuRegister(0x98);
>>> +pub(crate) const GPU_TIMESTAMP_HI: GpuRegister = GpuRegister(0x9c);
>>> +pub(crate) const GPU_THREAD_MAX_THREADS: GpuRegister = GpuRegister(0xa0);
>>> +pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: GpuRegister = GpuRegister(0xa4);
>>> +pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: GpuRegister = GpuRegister(0xa8);
>>> +pub(crate) const GPU_THREAD_FEATURES: GpuRegister = GpuRegister(0xac);
>>> +pub(crate) const fn gpu_texture_features(n: u64) -> GpuRegister {
>>> +    GpuRegister(0xB0 + ((n) * 4))
>>> +}
>>> +pub(crate) const GPU_SHADER_PRESENT_LO: GpuRegister = GpuRegister(0x100);
>>> +pub(crate) const GPU_SHADER_PRESENT_HI: GpuRegister = GpuRegister(0x104);
>>> +pub(crate) const GPU_TILER_PRESENT_LO: GpuRegister = GpuRegister(0x110);
>>> +pub(crate) const GPU_TILER_PRESENT_HI: GpuRegister = GpuRegister(0x114);
>>> +pub(crate) const GPU_L2_PRESENT_LO: GpuRegister = GpuRegister(0x120);
>>> +pub(crate) const GPU_L2_PRESENT_HI: GpuRegister = GpuRegister(0x124);
>>> +pub(crate) const SHADER_READY_LO: GpuRegister = GpuRegister(0x140);
>>> +pub(crate) const SHADER_READY_HI: GpuRegister = GpuRegister(0x144);
>>> +pub(crate) const TILER_READY_LO: GpuRegister = GpuRegister(0x150);
>>> +pub(crate) const TILER_READY_HI: GpuRegister = GpuRegister(0x154);
>>> +pub(crate) const L2_READY_LO: GpuRegister = GpuRegister(0x160);
>>> +pub(crate) const L2_READY_HI: GpuRegister = GpuRegister(0x164);
>>> +pub(crate) const SHADER_PWRON_LO: GpuRegister = GpuRegister(0x180);
>>> +pub(crate) const SHADER_PWRON_HI: GpuRegister = GpuRegister(0x184);
>>> +pub(crate) const TILER_PWRON_LO: GpuRegister = GpuRegister(0x190);
>>> +pub(crate) const TILER_PWRON_HI: GpuRegister = GpuRegister(0x194);
>>> +pub(crate) const L2_PWRON_LO: GpuRegister = GpuRegister(0x1a0);
>>> +pub(crate) const L2_PWRON_HI: GpuRegister = GpuRegister(0x1a4);
>>> +pub(crate) const SHADER_PWROFF_LO: GpuRegister = GpuRegister(0x1c0);
>>> +pub(crate) const SHADER_PWROFF_HI: GpuRegister = GpuRegister(0x1c4);
>>> +pub(crate) const TILER_PWROFF_LO: GpuRegister = GpuRegister(0x1d0);
>>> +pub(crate) const TILER_PWROFF_HI: GpuRegister = GpuRegister(0x1d4);
>>> +pub(crate) const L2_PWROFF_LO: GpuRegister = GpuRegister(0x1e0);
>>> +pub(crate) const L2_PWROFF_HI: GpuRegister = GpuRegister(0x1e4);
>>> +pub(crate) const SHADER_PWRTRANS_LO: GpuRegister = GpuRegister(0x200);
>>> +pub(crate) const SHADER_PWRTRANS_HI: GpuRegister = GpuRegister(0x204);
>>> +pub(crate) const TILER_PWRTRANS_LO: GpuRegister = GpuRegister(0x210);
>>> +pub(crate) const TILER_PWRTRANS_HI: GpuRegister = GpuRegister(0x214);
>>> +pub(crate) const L2_PWRTRANS_LO: GpuRegister = GpuRegister(0x220);
>>> +pub(crate) const L2_PWRTRANS_HI: GpuRegister = GpuRegister(0x224);
>>> +pub(crate) const SHADER_PWRACTIVE_LO: GpuRegister = GpuRegister(0x240);
>>> +pub(crate) const SHADER_PWRACTIVE_HI: GpuRegister = GpuRegister(0x244);
>>> +pub(crate) const TILER_PWRACTIVE_LO: GpuRegister = GpuRegister(0x250);
>>> +pub(crate) const TILER_PWRACTIVE_HI: GpuRegister = GpuRegister(0x254);
>>> +pub(crate) const L2_PWRACTIVE_LO: GpuRegister = GpuRegister(0x260);
>>> +pub(crate) const L2_PWRACTIVE_HI: GpuRegister = GpuRegister(0x264);
>>> +pub(crate) const GPU_REVID: GpuRegister = GpuRegister(0x280);
>>> +pub(crate) const GPU_COHERENCY_FEATURES: GpuRegister = GpuRegister(0x300);
>>> +pub(crate) const GPU_COHERENCY_PROTOCOL: GpuRegister = GpuRegister(0x304);
>>> +pub(crate) const GPU_COHERENCY_ACE: GpuRegister = GpuRegister(0);
>>> +pub(crate) const GPU_COHERENCY_ACE_LITE: GpuRegister = GpuRegister(1);
>>> +pub(crate) const GPU_COHERENCY_NONE: GpuRegister = GpuRegister(31);
>>> +pub(crate) const MCU_CONTROL: GpuRegister = GpuRegister(0x700);
>>> +pub(crate) const MCU_CONTROL_ENABLE: GpuRegister = GpuRegister(1);
>>> +pub(crate) const MCU_CONTROL_AUTO: GpuRegister = GpuRegister(2);
>>> +pub(crate) const MCU_CONTROL_DISABLE: GpuRegister = GpuRegister(0);
>>
>> From this I presume it was scripted. These MCU_CONTROL_xxx defines are
>> not GPU registers but values for the GPU registers. We might need to
>> make changes to the C header to make it easier to convert to Rust. Or
>> indeed generate both the C and Rust headers from a common source.
>>
>> Generally looks reasonable, although as it stands this would of course
>> be a much smaller patch in plain C ;) It would look better if you split
>> the Rust-enabling parts from the actual new code. I also think there
>> needs to be a little more thought into what registers are useful to dump
>> and some documentation on the dump format.
>>
>> Naïve Rust question: there are a bunch of unwrap() calls in the code
>> which to my C-trained brain look like BUG_ON()s - and in C I'd be
>> complaining about them. What is the Rust style here? AFAICT they are all
>> valid (they should never panic) but it makes me uneasy when I'm reading
>> the code.
>>
>> Steve
>>
> 
> Yeah, the unwraps() have to go. I didn’t give much thought to error handling here.
> 
> Although, as you pointed out, most of these should never panic, unless the size of the dump was miscomputed.
> 
> What do you suggest instead? I guess that printing a warning and then returning from panthor_core_dump() would be a good course of action. I don’t think there’s a Rust equivalent to WARN_ONCE, though.

In C I'd be handling at least the allocation failures and returning
errors up the stack - most likely with some sort of WARN_ON() or similar
(because these are 'should never happen' programming bugs - but trivial
to recover from).

For the try_from(size).unwrap() type cases, I've no idea to be honest -
Ideally they would be compile time checks. I've very little clue about
Rust but on the surface it looks like you've got the wrong type because
it's checking that things don't overflow when changing type. Of course
the standard C approach is to just do the type conversion and pretend
you're sure that an overflow can never happen ;)

In particular for alloc<T>() - core::mem::size_of::<T>() is returning a
value (of type usize) which is then being converted to isize. A C
programmer wouldn't have any qualms about assigning a sizeof() into an
int, even though theorectically that could overflow if the structure was
massive. But this should really be a compile time check as it's clearly
dead code at runtime.

Steve

