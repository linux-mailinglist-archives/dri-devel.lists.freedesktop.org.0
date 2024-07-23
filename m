Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED9F93A1BE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 15:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9B710E5D2;
	Tue, 23 Jul 2024 13:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PBSLDkha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A5310E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 13:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721742084;
 bh=rGiZce2UvS0TxDn7bviX8P2aUovlh43UO19YvUxtOBI=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=PBSLDkhacll3Cwsx/LZ0H9ehcHmWds+/elFRpMuHuHfL67zY8GNHUX2/cSeJCWOHF
 OqJqxCrB02qW6oe3L8UGSh9qp7fG3t9B8OwBw46loqYPnVMIC1sOJPr8IVKWU8UjGl
 qrG/0mui960dEE/k6WdB+qGAxSS/nPGwW2oDg8mFhkwBI59Ime7cnKOztAfMXzS8kB
 Nebbcd2xrx7vgapJuY//H3+5ZYI00cp86drNDHB3A0e0AaTWwwdsR3A7Su65Xhns8A
 ObwTNVLohMGM1x304g6r0ics1rd1CXGQOaMnEjz+j2Ua1swO3hzYX1Vc0Y/V+d44K0
 It9ZUUKZ1usxw==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AA867378143B;
 Tue, 23 Jul 2024 13:41:21 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAH5fLghWQQfrKWFr+vd0B4YjxKwEd+pMV5zeiTCnRtX3_1oRYQ@mail.gmail.com>
Date: Tue, 23 Jul 2024 10:41:08 -0300
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, robh@kernel.org,
 lina@asahilina.net, mcanal@igalia.com, airlied@gmail.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A1B4B2C-7FAB-4656-90AE-B30DC636349E@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <CAH5fLghWQQfrKWFr+vd0B4YjxKwEd+pMV5zeiTCnRtX3_1oRYQ@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
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

Hi Alice, thanks for the review!


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
>=20
> This code doesn't properly handle when T requires a large alignment.
>=20

Can you expand a bit on this? IIRC the alignment of a structure/enum =
will be dictated=20
by the field with the largest alignment requirement, right? Given that =
the largest primitive
allowed in the kernel is u64/i64, shouldn=E2=80=99t this suffice, e.g.:

 +            assert!(size % 8 =3D=3D 0, "Allocation size must be 8-byte =
aligned");


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
>=20
> Using references for functions that allocate is generally wrong.
> References imply that you don't have ownership of the memory, but
> allocator functions would normally return ownership of the allocation.
> As-is, the code seems to leak these allocations.

All the memory must be given to dev_coredumpv(), which will then take
ownership.  dev_coredumpv() will free all the memory, so there should be =
no
leaks here.

I=E2=80=99ve switched to KVec in v2, so that will also cover the error =
paths,
which do leak in this version, sadly.

As-is, all the memory is pre-allocated as a single chunk. When space is =
carved
for a given T, a &mut is returned so that the data can be written =
in-place at
the right spot in said chunk.

Not only there shouldn=E2=80=99t be any leaks, but I can actually decode =
this from
userspace.

I agree that this pattern isn=E2=80=99t usual, but I don=E2=80=99t see =
anything
incorrect. Maybe I missed something?

>=20
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
>=20
> You don't write to this memory, so I would avoid the mutable =
reference.
>=20
>> +    alloc.alloc_header(HeaderType::Vm, sz as u32);
>> +
>> +    let bo_data =3D alloc.alloc_bytes(sz).unwrap();
>> +    bo_data.copy_from_slice(&mapped_bo[..]);
>> +
>> +    // Safety: BO is valid and was previously mapped.
>> +    unsafe { bindings::drm_gem_vunmap_unlocked(bo, &mut map as _) };
>=20
> You don't need `as _` here. You can just pass a mutable reference and
> Rust will automatically cast it to raw pointer.
>=20
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
>=20
> Creating a reference requires that it isn't dangling, so the safety
> requirements should require that.
>=20
> Also, panthor_core_dump should be unsafe.
>=20

