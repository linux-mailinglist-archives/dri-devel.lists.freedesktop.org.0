Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2E992FCAE
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 16:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F2810E12B;
	Fri, 12 Jul 2024 14:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ynuebDeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B37010E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720794942;
 bh=zSMJ4n4qUBEoS8AkBGzRpsaFV2qyTeYKBK+sgDfvGQM=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=ynuebDeLjwUCWAzV86U3QofTNjnu6pm20XavAgr0bbXR5egv59MxYWcHi8MQwQFG/
 /t/0Fn30eNZcjOw9Xzh+u9Gf/ZrJvHZt5nA4dqGcLG6EO4nO8nbQH+UjK51PiFlq4O
 k0gzbo66eTYIdbL8m6HZR9wO9qT600pFm1dSnlVG+CbGSt91ZyP5yWRf7JZTO0zmTG
 39xclO00rco2oDSkxxoY//bVadgUaQuuna6FaDKxekJ3hELaxIBrlzI/4elwjYKwdC
 RBpuirq5ybtiJCJx1+RH4vZP5DC0n2DNRC3DySTnbJCWQxIN5lspZz/nVCybbjSHRE
 8ANrHpfhq7VGw==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC6353782209;
 Fri, 12 Jul 2024 14:35:38 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
Date: Fri, 12 Jul 2024 11:35:25 -0300
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, robh@kernel.org,
 lina@asahilina.net, mcanal@igalia.com, airlied@gmail.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
To: Steven Price <steven.price@arm.com>
X-Mailer: Apple Mail (2.3774.600.62)
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

Hi Steven, thanks for the review!

>=20
> This is defining the ABI to userspace and as such we'd need a way of
> exporting this for userspace tools to use. The C approach is a header =
in
> include/uabi. I'd also suggest making it obvious this enum can't be
> rearranged (e.g. a comment, or assigning specific numbers). There's =
also
> some ABI below which needs exporting in some way, along with some
> documentation (comments may be sufficient) explaining how e.g.
> header_size works.
>=20

I will defer this topic to others in the Rust for Linux community. I =
think this is the first time this scenario comes up in Rust code?

FYI I am working on a tool in Mesa to decode the dump [0]. Since the =
tool is also written in Rust, and given the RFC nature of this patch, I =
just copied and pasted things for now, including panthor_regs.rs.

IMHO, the solution here is to use cbindgen to automatically generate a C =
header to place in include/uapi. This will ensure that the header is in =
sync with the Rust code. I will do that in v2.

[0]: =
https://gitlab.freedesktop.org/dwlsalmeida/mesa/-/tree/panthor-devcoredump=
?ref_type=3Dheads


>> +}
>> +
>> +#[repr(C)]
>> +pub(crate) struct DumpArgs {
>> +    dev: *mut bindings::device,
>> +    /// The slot for the job
>> +    slot: i32,
>> +    /// The active buffer objects
>> +    bos: *mut *mut bindings::drm_gem_object,
>> +    /// The number of active buffer objects
>> +    bo_count: usize,
>> +    /// The base address of the registers to use when reading.
>> +    reg_base_addr: *mut core::ffi::c_void,
>> +}
>> +
>> +#[repr(C)]
>> +pub(crate) struct Header {
>> +    magic: u32,
>> +    ty: HeaderType,
>> +    header_size: u32,
>> +    data_size: u32,
>> +}
>> +
>> +#[repr(C)]
>> +#[derive(Clone, Copy)]
>> +pub(crate) struct RegisterDump {
>> +    register: GpuRegister,
>> +    value: u32,
>> +}
>> +
>> +/// The registers to dump
>> +const REGISTERS: [GpuRegister; 18] =3D [
>> +    regs::SHADER_READY_LO,
>> +    regs::SHADER_READY_HI,
>> +    regs::TILER_READY_LO,
>> +    regs::TILER_READY_HI,
>> +    regs::L2_READY_LO,
>> +    regs::L2_READY_HI,
>> +    regs::JOB_INT_MASK,
>> +    regs::JOB_INT_STAT,
>> +    regs::MMU_INT_MASK,
>> +    regs::MMU_INT_STAT,
>=20
> I'm not sure how much thought you've put into these registers. Most of
> these are 'boring'. And for a "standalone" dump we'd want =
identification
> registers.

Not much, to be honest. I based myself a bit on the registers dumped by =
the panfrost driver if they matched something in panthor_regs.h

What would you suggest here? Boris also suggested dumping a snapshot of =
the FW interface.

(Disclaimer: Most of my experience is in video codecs, so I must say I =
am a bit new to GPU code)

>=20
>> +    regs::as_transtab_lo(0),
>> +    regs::as_transtab_hi(0),
>> +    regs::as_memattr_lo(0),
>> +    regs::as_memattr_hi(0),
>> +    regs::as_faultstatus(0),
>> +    regs::as_faultaddress_lo(0),
>> +    regs::as_faultaddress_hi(0),
>> +    regs::as_status(0),
>=20
> AS 0 is interesting (because it's the MMU for the firmware) but we'd
> also be interested in another active address spaces. Hardcoding the
> zeros here looks like the abstraction is probably wrong.
>=20
>> +];
>> +
>> +mod alloc {
>> +    use core::ptr::NonNull;
>> +
>> +    use kernel::bindings;
>> +    use kernel::prelude::*;
>> +
>> +    use crate::dump::Header;
>> +    use crate::dump::HeaderType;
>> +    use crate::dump::MAGIC;
>> +
>> +    pub(crate) struct DumpAllocator {
>> +        mem: NonNull<core::ffi::c_void>,
>> +        pos: usize,
>> +        capacity: usize,
>> +    }
>> +
>> +    impl DumpAllocator {
>> +        pub(crate) fn new(size: usize) -> Result<Self> {
>> +            if isize::try_from(size).unwrap() =3D=3D isize::MAX {
>> +                return Err(EINVAL);
>> +            }
>> +
>> +            // Let's cheat a bit here, since there is no Rust =
vmalloc allocator
>> +            // for the time being.
>> +            //
>> +            // Safety: just a FFI call to alloc memory
>> +            let mem =3D NonNull::new(unsafe {
>> +                bindings::__vmalloc_noprof(
>> +                    size.try_into().unwrap(),
>> +                    bindings::GFP_KERNEL | bindings::GFP_NOWAIT | 1 =
<< bindings::___GFP_NORETRY_BIT,
>> +                )
>> +            });
>> +
>> +            let mem =3D match mem {
>> +                Some(buffer) =3D> buffer,
>> +                None =3D> return Err(ENOMEM),
>> +            };
>> +
>> +            // Ssfety: just a FFI call to zero out the memory. Mem =
and size were
>> +            // used to allocate the memory above.
>=20
> In C you could just use vzalloc(), I think this could be done in the
> above by passing in __GFP_ZERO.

True, but this will be reworked to use Danilo=E2=80=99s work on the new =
allocators. This means that we
won=E2=80=99t have to manually call vmalloc here.

>=20
>> +            unsafe { core::ptr::write_bytes(mem.as_ptr(), 0, size) =
};
>> +            Ok(Self {
>> +                mem,
>> +                pos: 0,
>> +                capacity: size,
>> +            })
>> +        }
>> +
>> +        fn alloc_mem(&mut self, size: usize) -> Option<*mut u8> {
>> +            assert!(size % 8 =3D=3D 0, "Allocation size must be =
8-byte aligned");
>> +            if isize::try_from(size).unwrap() =3D=3D isize::MAX {
>> +                return None;
>> +            } else if self.pos + size > self.capacity {
>> +                kernel::pr_debug!("DumpAllocator out of memory");
>> +                None
>> +            } else {
>> +                let offset =3D self.pos;
>> +                self.pos +=3D size;
>> +
>> +                // Safety: we know that this is a valid allocation, =
so
>> +                // dereferencing is safe. We don't ever return two =
pointers to
>> +                // the same address, so we adhere to the aliasing =
rules. We make
>> +                // sure that the memory is zero-initialized before =
being handed
>> +                // out (this happens when the allocator is first =
created) and we
>> +                // enforce a 8 byte alignment rule.
>> +                Some(unsafe { self.mem.as_ptr().offset(offset as =
isize) as *mut u8 })
>> +            }
>> +        }
>> +
>> +        pub(crate) fn alloc<T>(&mut self) -> Option<&mut T> {
>> +            let mem =3D self.alloc_mem(core::mem::size_of::<T>())? =
as *mut T;
>> +            // Safety: we uphold safety guarantees in alloc_mem(), =
so this is
>> +            // safe to dereference.
>> +            Some(unsafe { &mut *mem })
>> +        }
>> +
>> +        pub(crate) fn alloc_bytes(&mut self, num_bytes: usize) -> =
Option<&mut [u8]> {
>> +            let mem =3D self.alloc_mem(num_bytes)?;
>> +
>> +            // Safety: we uphold safety guarantees in alloc_mem(), =
so this is
>> +            // safe to build a slice
>> +            Some(unsafe { core::slice::from_raw_parts_mut(mem, =
num_bytes) })
>> +        }
>> +
>> +        pub(crate) fn alloc_header(&mut self, ty: HeaderType, =
data_size: u32) -> &mut Header {
>> +            let hdr: &mut Header =3D self.alloc().unwrap();
>> +            hdr.magic =3D MAGIC;
>> +            hdr.ty =3D ty;
>> +            hdr.header_size =3D core::mem::size_of::<Header>() as =
u32;
>> +            hdr.data_size =3D data_size;
>> +            hdr
>> +        }
>> +
>> +        pub(crate) fn is_end(&self) -> bool {
>> +            self.pos =3D=3D self.capacity
>> +        }
>> +
>> +        pub(crate) fn dump(self) -> (NonNull<core::ffi::c_void>, =
usize) {
>> +            (self.mem, self.capacity)
>=20
> I see below that the expectation is that is_end() is true before this =
is
> called. But I find returning the "capacity" as the size here =
confusing.
> Would it be better to combine is_end() and dump() and have a single
> function which either returns the dump or an error if !is_end()?

Sure, that is indeed better.

>=20
>> +        }
>> +    }
>> +}
>> +
>> +fn dump_registers(alloc: &mut DumpAllocator, args: &DumpArgs) {
>> +    let sz =3D core::mem::size_of_val(&REGISTERS);
>> +    alloc.alloc_header(HeaderType::Registers, =
sz.try_into().unwrap());
>> +
>> +    for reg in &REGISTERS {
>> +        let dumped_reg: &mut RegisterDump =3D =
alloc.alloc().unwrap();
>> +        dumped_reg.register =3D *reg;
>> +        dumped_reg.value =3D reg.read(args.reg_base_addr);
>> +    }
>> +}
>> +
>> +fn dump_bo(alloc: &mut DumpAllocator, bo: &mut =
bindings::drm_gem_object) {
>> +    let mut map =3D bindings::iosys_map::default();
>> +
>> +    // Safety: we trust the kernel to provide a valid BO.
>> +    let ret =3D unsafe { bindings::drm_gem_vmap_unlocked(bo, &mut =
map as _) };
>> +    if ret !=3D 0 {
>> +        pr_warn!("Failed to map BO");
>> +        return;
>> +    }
>> +
>> +    let sz =3D bo.size;
>> +
>> +    // Safety: we know that the vaddr is valid and we know the BO =
size.
>> +    let mapped_bo: &mut [u8] =3D
>> +        unsafe { =
core::slice::from_raw_parts_mut(map.__bindgen_anon_1.vaddr as *mut _, =
sz) };
>> +
>> +    alloc.alloc_header(HeaderType::Vm, sz as u32);
>> +
>> +    let bo_data =3D alloc.alloc_bytes(sz).unwrap();
>> +    bo_data.copy_from_slice(&mapped_bo[..]);
>> +
>> +    // Safety: BO is valid and was previously mapped.
>> +    unsafe { bindings::drm_gem_vunmap_unlocked(bo, &mut map as _) };
>> +}
>> +
>> +/// Dumps the current state of the GPU to a file
>> +///
>> +/// # Safety
>> +///
>> +/// `Args` must be aligned and non-null.
>> +/// All fields of `DumpArgs` must be valid.
>> +#[no_mangle]
>> +pub(crate) extern "C" fn panthor_core_dump(args: *const DumpArgs) -> =
core::ffi::c_int {
>> +    assert!(!args.is_null());
>> +    // Safety: we checked whether the pointer was null. It is =
assumed to be
>> +    // aligned as per the safety requirements.
>> +    let args =3D unsafe { &*args };
>> +    //
>> +    // TODO: Ideally, we would use the safe GEM abstraction from the =
kernel
>> +    // crate, but I see no way to create a drm::gem::ObjectRef from =
a
>> +    // bindings::drm_gem_object. drm::gem::IntoGEMObject is only =
implemented for
>> +    // drm::gem::Object, which means that new references can only be =
created
>> +    // from a Rust-owned GEM object.
>> +    //
>> +    // It also has a has a `type Driver: drv::Driver` associated =
type, from
>> +    // which it can access the `File` associated type. But not all =
GEM functions
>> +    // take a file, though. For example, `drm_gem_vmap_unlocked` =
(used here)
>> +    // does not.
>> +    //
>> +    // This associated type is a blocker here, because there is no =
actual
>> +    // drv::Driver. We're only implementing a few functions in Rust.
>> +    let mut bos =3D match Vec::with_capacity(args.bo_count, =
GFP_KERNEL) {
>> +        Ok(bos) =3D> bos,
>> +        Err(_) =3D> return ENOMEM.to_errno(),
>> +    };
>> +    for i in 0..args.bo_count {
>> +        // Safety: `args` is assumed valid as per the safety =
requirements.
>> +        // `bos` is a valid pointer to a valid array of valid =
pointers.
>> +        let bo =3D unsafe { &mut **args.bos.add(i) };
>> +        bos.push(bo, GFP_KERNEL).unwrap();
>> +    }
>> +
>> +    let mut sz =3D core::mem::size_of::<Header>();
>> +    sz +=3D REGISTERS.len() * core::mem::size_of::<RegisterDump>();
>> +
>> +    for bo in &mut *bos {
>> +        sz +=3D core::mem::size_of::<Header>();
>> +        sz +=3D bo.size;
>> +    }
>> +
>> +    // Everything must fit within this allocation, otherwise it was =
miscomputed.
>> +    let mut alloc =3D match DumpAllocator::new(sz) {
>> +        Ok(alloc) =3D> alloc,
>> +        Err(e) =3D> return e.to_errno(),
>> +    };
>> +
>> +    dump_registers(&mut alloc, &args);
>> +    for bo in bos {
>> +        dump_bo(&mut alloc, bo);
>> +    }
>> +
>> +    if !alloc.is_end() {
>> +        pr_warn!("DumpAllocator: wrong allocation size");
>> +    }
>> +
>> +    let (mem, size) =3D alloc.dump();
>> +
>> +    // Safety: `mem` is a valid pointer to a valid allocation of =
`size` bytes.
>> +    unsafe { bindings::dev_coredumpv(args.dev, mem.as_ptr(), size, =
bindings::GFP_KERNEL) };
>> +
>> +    0
>> +}
>> diff --git a/drivers/gpu/drm/panthor/lib.rs =
b/drivers/gpu/drm/panthor/lib.rs
>> new file mode 100644
>> index 000000000000..faef8662d0f5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panthor/lib.rs
>> @@ -0,0 +1,10 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright Collabora 2024
>> +
>> +//! The Rust components of the Panthor driver
>> +
>> +#[cfg(CONFIG_DRM_PANTHOR_COREDUMP)]
>> +mod dump;
>> +mod regs;
>> +
>> +const __LOG_PREFIX: &[u8] =3D b"panthor\0";
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c =
b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index fa0a002b1016..f8934de41ffa 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -2,6 +2,8 @@
>> /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>> /* Copyright 2023 Collabora ltd. */
>>=20
>> +#include "drm/drm_gem.h"
>> +#include "linux/gfp_types.h"
>> #include <drm/drm_debugfs.h>
>> #include <drm/drm_drv.h>
>> #include <drm/drm_exec.h>
>> @@ -2619,6 +2621,43 @@ int panthor_vm_prepare_mapped_bos_resvs(struct =
drm_exec *exec, struct panthor_vm
>> return drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
>> }
>>=20
>> +/**
>> + * panthor_vm_bo_dump() - Dump the VM BOs for debugging purposes.
>> + *
>> + *
>> + * @vm: VM targeted by the GPU job.
>> + * @count: The number of BOs returned
>> + *
>> + * Return: an array of pointers to the BOs backing the whole VM.
>> + */
>> +struct drm_gem_object **
>> +panthor_vm_dump(struct panthor_vm *vm, u32 *count)
>> +{
>> + struct drm_gpuva *va, *next;
>> + struct drm_gem_object **objs;
>> + *count =3D 0;
>> + u32 i =3D 0;
>> +
>> + mutex_lock(&vm->op_lock);
>> + drm_gpuvm_for_each_va_safe(va, next, &vm->base) {
>=20
> There's no need to use the _safe() variety here - we're not modifying
> the list.
>=20
>> + (*count)++;
>=20
> NIT: Personally I'd use a local u32 and assign the "out_count" at the
> end. This sort of dereference in a loop can significantly affect
> compiler optimisations. Although you probably get away with it here.
>=20
>> + }
>> +
>> + objs =3D kcalloc(*count, sizeof(struct drm_gem_object *), =
GFP_KERNEL);
>> + if (!objs) {
>> + mutex_unlock(&vm->op_lock);
>> + return ERR_PTR(-ENOMEM);
>> + }
>> +
>> + drm_gpuvm_for_each_va_safe(va, next, &vm->base) {
>=20
> Same here.
>=20
>> + objs[i] =3D va->gem.obj;
>> + i++;
>> + }
>> + mutex_unlock(&vm->op_lock);
>> +
>> + return objs;
>> +}
>> +
>> /**
>>  * panthor_mmu_unplug() - Unplug the MMU logic
>>  * @ptdev: Device.
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h =
b/drivers/gpu/drm/panthor/panthor_mmu.h
>> index f3c1ed19f973..e9369c19e5b5 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
>> @@ -50,6 +50,9 @@ int panthor_vm_add_bos_resvs_deps_to_job(struct =
panthor_vm *vm,
>> void panthor_vm_add_job_fence_to_bos_resvs(struct panthor_vm *vm,
>>    struct drm_sched_job *job);
>>=20
>> +struct drm_gem_object **
>> +panthor_vm_dump(struct panthor_vm *vm, u32 *count);
>> +
>> struct dma_resv *panthor_vm_resv(struct panthor_vm *vm);
>> struct drm_gem_object *panthor_vm_root_gem(struct panthor_vm *vm);
>>=20
>> diff --git a/drivers/gpu/drm/panthor/panthor_rs.h =
b/drivers/gpu/drm/panthor/panthor_rs.h
>> new file mode 100644
>> index 000000000000..024db09be9a1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panthor/panthor_rs.h
>> @@ -0,0 +1,40 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright Collabora 2024
>> +
>> +#include <drm/drm_gem.h>
>> +
>> +struct PanthorDumpArgs {
>> + struct device *dev;
>> + /**
>> +   * The slot for the job
>> +   */
>> + s32 slot;
>> + /**
>> +   * The active buffer objects
>> +   */
>> + struct drm_gem_object **bos;
>> + /**
>> +   * The number of active buffer objects
>> +   */
>> + size_t bo_count;
>> + /**
>> +   * The base address of the registers to use when reading.
>> +   */
>> + void *reg_base_addr;
>=20
> NIT: There's something up with your tabs-vs-spaces here.
>=20
>> +};
>> +
>> +/**
>> + * Dumps the current state of the GPU to a file
>> + *
>> + * # Safety
>> + *
>> + * All fields of `DumpArgs` must be valid.
>> + */
>> +#ifdef CONFIG_DRM_PANTHOR_RS
>> +int panthor_core_dump(const struct PanthorDumpArgs *args);
>> +#else
>> +inline int panthor_core_dump(const struct PanthorDumpArgs *args)
>> +{
>> + return 0;
>=20
> This should return an error (-ENOTSUPP ? ). Not that the return value =
is
> used...
>=20

I think that returning 0 in stubs is a bit of a pattern throughout the =
kernel? But sure, I can
change that to ENOTSUPP.=20


>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c =
b/drivers/gpu/drm/panthor/panthor_sched.c
>> index 79ffcbc41d78..39e1654d930e 100644
>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>> @@ -1,6 +1,9 @@
>> // SPDX-License-Identifier: GPL-2.0 or MIT
>> /* Copyright 2023 Collabora ltd. */
>>=20
>> +#include "drm/drm_gem.h"
>> +#include "linux/gfp_types.h"
>> +#include "linux/slab.h"
>> #include <drm/drm_drv.h>
>> #include <drm/drm_exec.h>
>> #include <drm/drm_gem_shmem_helper.h>
>> @@ -31,6 +34,7 @@
>> #include "panthor_mmu.h"
>> #include "panthor_regs.h"
>> #include "panthor_sched.h"
>> +#include "panthor_rs.h"
>>=20
>> /**
>>  * DOC: Scheduler
>> @@ -2805,6 +2809,27 @@ static void group_sync_upd_work(struct =
work_struct *work)
>> group_put(group);
>> }
>>=20
>> +static void dump_job(struct panthor_device *dev, struct panthor_job =
*job)
>> +{
>> + struct panthor_vm *vm =3D job->group->vm;
>> + struct drm_gem_object **objs;
>> + u32 count;
>> +
>> + objs =3D panthor_vm_dump(vm, &count);
>> +
>> + if (!IS_ERR(objs)) {
>> + struct PanthorDumpArgs args =3D {
>> + .dev =3D job->group->ptdev->base.dev,
>> + .bos =3D objs,
>> + .bo_count =3D count,
>> + .reg_base_addr =3D dev->iomem,
>> + };
>> + panthor_core_dump(&args);
>> + kfree(objs);
>> + }
>> +}
>=20
> It would be better to avoid generating the dump if panthor_core_dump()
> is a no-op.

I will gate that behind #ifdefs in v2.

>=20
>> +
>> +
>> static struct dma_fence *
>> queue_run_job(struct drm_sched_job *sched_job)
>> {
>> @@ -2929,7 +2954,7 @@ queue_run_job(struct drm_sched_job *sched_job)
>> }
>>=20
>> done_fence =3D dma_fence_get(job->done_fence);
>> -
>> + dump_job(ptdev, job);
>=20
> This doesn't look right - is this left from debugging?

Yes, I wanted a way for people to test this patch if they wanted to, and =
dumping just the failed
jobs wouldn=E2=80=99t work for this purpose.

OTOH, I am thinking about adding a debugfs knob to control this, what do =
you think?

This would allow us to dump successful jobs in a tidy manner. Something =
along the lines of
"dump the next N successful jobs=E2=80=9D. Failed jobs would always be =
dumped, though.

>=20
>> out_unlock:
>> mutex_unlock(&sched->lock);
>> pm_runtime_mark_last_busy(ptdev->base.dev);
>> @@ -2950,6 +2975,7 @@ queue_timedout_job(struct drm_sched_job =
*sched_job)
>> drm_warn(&ptdev->base, "job timeout\n");
>>=20
>> drm_WARN_ON(&ptdev->base, atomic_read(&sched->reset.in_progress));
>> + dump_job(ptdev, job);
>=20
> This looks like the right place.
>=20
>>=20
>> queue_stop(queue, job);
>>=20
>> diff --git a/drivers/gpu/drm/panthor/regs.rs =
b/drivers/gpu/drm/panthor/regs.rs
>> new file mode 100644
>> index 000000000000..514bc9ee2856
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panthor/regs.rs
>> @@ -0,0 +1,264 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright Collabora 2024
>> +// SPDX-FileCopyrightText: (C) COPYRIGHT 2010-2022 ARM Limited. All =
rights reserved.
>> +
>> +//! The registers for Panthor, extracted from panthor_regs.h
>=20
> Was this a manual extraction, or is this scripted? Ideally we wouldn't
> have two locations to maintain the register list.

This was generated by a Python script. Should the script be included in =
the patch then?

>=20
>> +
>> +#![allow(unused_macros, unused_imports, dead_code)]
>> +
>> +use kernel::bindings;
>> +
>> +use core::ops::Add;
>> +use core::ops::Shl;
>> +use core::ops::Shr;
>> +
>> +#[repr(transparent)]
>> +#[derive(Clone, Copy)]
>> +pub(crate) struct GpuRegister(u64);
>> +
>> +impl GpuRegister {
>> +    pub(crate) fn read(&self, iomem: *const core::ffi::c_void) -> =
u32 {
>> +        // Safety: `reg` represents a valid address
>> +        unsafe {
>> +            let addr =3D iomem.offset(self.0 as isize);
>> +            bindings::readl_relaxed(addr as *const _)
>> +        }
>> +    }
>> +}
>> +
>> +pub(crate) const fn bit(index: u64) -> u64 {
>> +    1 << index
>> +}
>> +pub(crate) const fn genmask(high: u64, low: u64) -> u64 {
>> +    ((1 << (high - low + 1)) - 1) << low
>> +}
>=20
> These look like they should be in a more generic header - but maybe I
> don't understand Rust ;)
>=20

Ideally these should be exposed by the kernel crate - i.e.: the code in =
the rust top-level directory.

I specifically did not want to touch that in this first submission. =
Maybe a separate patch would be in order here.


>> +
>> +pub(crate) const GPU_ID: GpuRegister =3D GpuRegister(0x0);
>> +pub(crate) const fn gpu_arch_major(x: u64) -> GpuRegister {
>> +    GpuRegister((x) >> 28)
>> +}
>> +pub(crate) const fn gpu_arch_minor(x: u64) -> GpuRegister {
>> +    GpuRegister((x) & genmask(27, 24) >> 24)
>> +}
>> +pub(crate) const fn gpu_arch_rev(x: u64) -> GpuRegister {
>> +    GpuRegister((x) & genmask(23, 20) >> 20)
>> +}
>> +pub(crate) const fn gpu_prod_major(x: u64) -> GpuRegister {
>> +    GpuRegister((x) & genmask(19, 16) >> 16)
>> +}
>> +pub(crate) const fn gpu_ver_major(x: u64) -> GpuRegister {
>> +    GpuRegister((x) & genmask(15, 12) >> 12)
>> +}
>> +pub(crate) const fn gpu_ver_minor(x: u64) -> GpuRegister {
>> +    GpuRegister((x) & genmask(11, 4) >> 4)
>> +}
>> +pub(crate) const fn gpu_ver_status(x: u64) -> GpuRegister {
>> +    GpuRegister(x & genmask(3, 0))
>> +}
>> +pub(crate) const GPU_L2_FEATURES: GpuRegister =3D GpuRegister(0x4);
>> +pub(crate) const fn gpu_l2_features_line_size(x: u64) -> GpuRegister =
{
>> +    GpuRegister(1 << ((x) & genmask(7, 0)))
>> +}
>> +pub(crate) const GPU_CORE_FEATURES: GpuRegister =3D =
GpuRegister(0x8);
>> +pub(crate) const GPU_TILER_FEATURES: GpuRegister =3D =
GpuRegister(0xc);
>> +pub(crate) const GPU_MEM_FEATURES: GpuRegister =3D =
GpuRegister(0x10);
>> +pub(crate) const GROUPS_L2_COHERENT: GpuRegister =3D =
GpuRegister(bit(0));
>> +pub(crate) const GPU_MMU_FEATURES: GpuRegister =3D =
GpuRegister(0x14);
>> +pub(crate) const fn gpu_mmu_features_va_bits(x: u64) -> GpuRegister =
{
>> +    GpuRegister((x) & genmask(7, 0))
>> +}
>> +pub(crate) const fn gpu_mmu_features_pa_bits(x: u64) -> GpuRegister =
{
>> +    GpuRegister(((x) >> 8) & genmask(7, 0))
>> +}
>> +pub(crate) const GPU_AS_PRESENT: GpuRegister =3D GpuRegister(0x18);
>> +pub(crate) const GPU_CSF_ID: GpuRegister =3D GpuRegister(0x1c);
>> +pub(crate) const GPU_INT_RAWSTAT: GpuRegister =3D GpuRegister(0x20);
>> +pub(crate) const GPU_INT_CLEAR: GpuRegister =3D GpuRegister(0x24);
>> +pub(crate) const GPU_INT_MASK: GpuRegister =3D GpuRegister(0x28);
>> +pub(crate) const GPU_INT_STAT: GpuRegister =3D GpuRegister(0x2c);
>> +pub(crate) const GPU_IRQ_FAULT: GpuRegister =3D GpuRegister(bit(0));
>> +pub(crate) const GPU_IRQ_PROTM_FAULT: GpuRegister =3D =
GpuRegister(bit(1));
>> +pub(crate) const GPU_IRQ_RESET_COMPLETED: GpuRegister =3D =
GpuRegister(bit(8));
>> +pub(crate) const GPU_IRQ_POWER_CHANGED: GpuRegister =3D =
GpuRegister(bit(9));
>> +pub(crate) const GPU_IRQ_POWER_CHANGED_ALL: GpuRegister =3D =
GpuRegister(bit(10));
>> +pub(crate) const GPU_IRQ_CLEAN_CACHES_COMPLETED: GpuRegister =3D =
GpuRegister(bit(17));
>> +pub(crate) const GPU_IRQ_DOORBELL_MIRROR: GpuRegister =3D =
GpuRegister(bit(18));
>> +pub(crate) const GPU_IRQ_MCU_STATUS_CHANGED: GpuRegister =3D =
GpuRegister(bit(19));
>> +pub(crate) const GPU_CMD: GpuRegister =3D GpuRegister(0x30);
>> +const fn gpu_cmd_def(ty: u64, payload: u64) -> u64 {
>> +    (ty) | ((payload) << 8)
>> +}
>> +pub(crate) const fn gpu_soft_reset() -> GpuRegister {
>> +    GpuRegister(gpu_cmd_def(1, 1))
>> +}
>> +pub(crate) const fn gpu_hard_reset() -> GpuRegister {
>> +    GpuRegister(gpu_cmd_def(1, 2))
>> +}
>> +pub(crate) const CACHE_CLEAN: GpuRegister =3D GpuRegister(bit(0));
>> +pub(crate) const CACHE_INV: GpuRegister =3D GpuRegister(bit(1));
>> +pub(crate) const GPU_STATUS: GpuRegister =3D GpuRegister(0x34);
>> +pub(crate) const GPU_STATUS_ACTIVE: GpuRegister =3D =
GpuRegister(bit(0));
>> +pub(crate) const GPU_STATUS_PWR_ACTIVE: GpuRegister =3D =
GpuRegister(bit(1));
>> +pub(crate) const GPU_STATUS_PAGE_FAULT: GpuRegister =3D =
GpuRegister(bit(4));
>> +pub(crate) const GPU_STATUS_PROTM_ACTIVE: GpuRegister =3D =
GpuRegister(bit(7));
>> +pub(crate) const GPU_STATUS_DBG_ENABLED: GpuRegister =3D =
GpuRegister(bit(8));
>> +pub(crate) const GPU_FAULT_STATUS: GpuRegister =3D =
GpuRegister(0x3c);
>> +pub(crate) const GPU_FAULT_ADDR_LO: GpuRegister =3D =
GpuRegister(0x40);
>> +pub(crate) const GPU_FAULT_ADDR_HI: GpuRegister =3D =
GpuRegister(0x44);
>> +pub(crate) const GPU_PWR_KEY: GpuRegister =3D GpuRegister(0x50);
>> +pub(crate) const GPU_PWR_KEY_UNLOCK: GpuRegister =3D =
GpuRegister(0x2968a819);
>> +pub(crate) const GPU_PWR_OVERRIDE0: GpuRegister =3D =
GpuRegister(0x54);
>> +pub(crate) const GPU_PWR_OVERRIDE1: GpuRegister =3D =
GpuRegister(0x58);
>> +pub(crate) const GPU_TIMESTAMP_OFFSET_LO: GpuRegister =3D =
GpuRegister(0x88);
>> +pub(crate) const GPU_TIMESTAMP_OFFSET_HI: GpuRegister =3D =
GpuRegister(0x8c);
>> +pub(crate) const GPU_CYCLE_COUNT_LO: GpuRegister =3D =
GpuRegister(0x90);
>> +pub(crate) const GPU_CYCLE_COUNT_HI: GpuRegister =3D =
GpuRegister(0x94);
>> +pub(crate) const GPU_TIMESTAMP_LO: GpuRegister =3D =
GpuRegister(0x98);
>> +pub(crate) const GPU_TIMESTAMP_HI: GpuRegister =3D =
GpuRegister(0x9c);
>> +pub(crate) const GPU_THREAD_MAX_THREADS: GpuRegister =3D =
GpuRegister(0xa0);
>> +pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: GpuRegister =3D =
GpuRegister(0xa4);
>> +pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: GpuRegister =3D =
GpuRegister(0xa8);
>> +pub(crate) const GPU_THREAD_FEATURES: GpuRegister =3D =
GpuRegister(0xac);
>> +pub(crate) const fn gpu_texture_features(n: u64) -> GpuRegister {
>> +    GpuRegister(0xB0 + ((n) * 4))
>> +}
>> +pub(crate) const GPU_SHADER_PRESENT_LO: GpuRegister =3D =
GpuRegister(0x100);
>> +pub(crate) const GPU_SHADER_PRESENT_HI: GpuRegister =3D =
GpuRegister(0x104);
>> +pub(crate) const GPU_TILER_PRESENT_LO: GpuRegister =3D =
GpuRegister(0x110);
>> +pub(crate) const GPU_TILER_PRESENT_HI: GpuRegister =3D =
GpuRegister(0x114);
>> +pub(crate) const GPU_L2_PRESENT_LO: GpuRegister =3D =
GpuRegister(0x120);
>> +pub(crate) const GPU_L2_PRESENT_HI: GpuRegister =3D =
GpuRegister(0x124);
>> +pub(crate) const SHADER_READY_LO: GpuRegister =3D =
GpuRegister(0x140);
>> +pub(crate) const SHADER_READY_HI: GpuRegister =3D =
GpuRegister(0x144);
>> +pub(crate) const TILER_READY_LO: GpuRegister =3D GpuRegister(0x150);
>> +pub(crate) const TILER_READY_HI: GpuRegister =3D GpuRegister(0x154);
>> +pub(crate) const L2_READY_LO: GpuRegister =3D GpuRegister(0x160);
>> +pub(crate) const L2_READY_HI: GpuRegister =3D GpuRegister(0x164);
>> +pub(crate) const SHADER_PWRON_LO: GpuRegister =3D =
GpuRegister(0x180);
>> +pub(crate) const SHADER_PWRON_HI: GpuRegister =3D =
GpuRegister(0x184);
>> +pub(crate) const TILER_PWRON_LO: GpuRegister =3D GpuRegister(0x190);
>> +pub(crate) const TILER_PWRON_HI: GpuRegister =3D GpuRegister(0x194);
>> +pub(crate) const L2_PWRON_LO: GpuRegister =3D GpuRegister(0x1a0);
>> +pub(crate) const L2_PWRON_HI: GpuRegister =3D GpuRegister(0x1a4);
>> +pub(crate) const SHADER_PWROFF_LO: GpuRegister =3D =
GpuRegister(0x1c0);
>> +pub(crate) const SHADER_PWROFF_HI: GpuRegister =3D =
GpuRegister(0x1c4);
>> +pub(crate) const TILER_PWROFF_LO: GpuRegister =3D =
GpuRegister(0x1d0);
>> +pub(crate) const TILER_PWROFF_HI: GpuRegister =3D =
GpuRegister(0x1d4);
>> +pub(crate) const L2_PWROFF_LO: GpuRegister =3D GpuRegister(0x1e0);
>> +pub(crate) const L2_PWROFF_HI: GpuRegister =3D GpuRegister(0x1e4);
>> +pub(crate) const SHADER_PWRTRANS_LO: GpuRegister =3D =
GpuRegister(0x200);
>> +pub(crate) const SHADER_PWRTRANS_HI: GpuRegister =3D =
GpuRegister(0x204);
>> +pub(crate) const TILER_PWRTRANS_LO: GpuRegister =3D =
GpuRegister(0x210);
>> +pub(crate) const TILER_PWRTRANS_HI: GpuRegister =3D =
GpuRegister(0x214);
>> +pub(crate) const L2_PWRTRANS_LO: GpuRegister =3D GpuRegister(0x220);
>> +pub(crate) const L2_PWRTRANS_HI: GpuRegister =3D GpuRegister(0x224);
>> +pub(crate) const SHADER_PWRACTIVE_LO: GpuRegister =3D =
GpuRegister(0x240);
>> +pub(crate) const SHADER_PWRACTIVE_HI: GpuRegister =3D =
GpuRegister(0x244);
>> +pub(crate) const TILER_PWRACTIVE_LO: GpuRegister =3D =
GpuRegister(0x250);
>> +pub(crate) const TILER_PWRACTIVE_HI: GpuRegister =3D =
GpuRegister(0x254);
>> +pub(crate) const L2_PWRACTIVE_LO: GpuRegister =3D =
GpuRegister(0x260);
>> +pub(crate) const L2_PWRACTIVE_HI: GpuRegister =3D =
GpuRegister(0x264);
>> +pub(crate) const GPU_REVID: GpuRegister =3D GpuRegister(0x280);
>> +pub(crate) const GPU_COHERENCY_FEATURES: GpuRegister =3D =
GpuRegister(0x300);
>> +pub(crate) const GPU_COHERENCY_PROTOCOL: GpuRegister =3D =
GpuRegister(0x304);
>> +pub(crate) const GPU_COHERENCY_ACE: GpuRegister =3D GpuRegister(0);
>> +pub(crate) const GPU_COHERENCY_ACE_LITE: GpuRegister =3D =
GpuRegister(1);
>> +pub(crate) const GPU_COHERENCY_NONE: GpuRegister =3D =
GpuRegister(31);
>> +pub(crate) const MCU_CONTROL: GpuRegister =3D GpuRegister(0x700);
>> +pub(crate) const MCU_CONTROL_ENABLE: GpuRegister =3D GpuRegister(1);
>> +pub(crate) const MCU_CONTROL_AUTO: GpuRegister =3D GpuRegister(2);
>> +pub(crate) const MCU_CONTROL_DISABLE: GpuRegister =3D =
GpuRegister(0);
>=20
> =46rom this I presume it was scripted. These MCU_CONTROL_xxx defines =
are
> not GPU registers but values for the GPU registers. We might need to
> make changes to the C header to make it easier to convert to Rust. Or
> indeed generate both the C and Rust headers from a common source.
>=20
> Generally looks reasonable, although as it stands this would of course
> be a much smaller patch in plain C ;) It would look better if you =
split
> the Rust-enabling parts from the actual new code. I also think there
> needs to be a little more thought into what registers are useful to =
dump
> and some documentation on the dump format.
>=20
> Na=C3=AFve Rust question: there are a bunch of unwrap() calls in the =
code
> which to my C-trained brain look like BUG_ON()s - and in C I'd be
> complaining about them. What is the Rust style here? AFAICT they are =
all
> valid (they should never panic) but it makes me uneasy when I'm =
reading
> the code.
>=20
> Steve
>=20

Yeah, the unwraps() have to go. I didn=E2=80=99t give much thought to =
error handling here.

Although, as you pointed out, most of these should never panic, unless =
the size of the dump was miscomputed.

What do you suggest instead? I guess that printing a warning and then =
returning from panthor_core_dump() would be a good course of action. I =
don=E2=80=99t think there=E2=80=99s a Rust equivalent to WARN_ONCE, =
though.


=E2=80=94 Daniel


