Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A728AE07C3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D54510EA59;
	Thu, 19 Jun 2025 13:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ZJFOMio7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74D810EA6F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 13:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750340994; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Xg4E1OYxArkD3TA1ZtARJFjUqeqTKd93T1Gb8XIrs6l9YDUw6pIyxDn4MTmXLAejSPJgYyUlSI7leHyQ3mJfnx3ktfngXuUFCz6k6UuIFRqc73I1WuXe369HBwIB6AqUIEedQl9l1ACKWQKcf/Aof9CC37G/IUq2EDawe8hgX0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750340994;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HXoig7Q+/oEFtN4SjomCo2nMhWyT3fJq8sjjjfihsNI=; 
 b=RA09koLz/duxiHOQ0bw1Qj5jhhBDus7rzm2Abchy6wWSgiJg/fCSzRT5Eaak0I2Srcyy0VXxDIwtw9vTS4qaejnAP79LeKvh2gTBKTOnyaeAV69tPABiEhrBCY96GaaZbj7q1WO/22A93dAn/8ZzavZszVsJEmNhLUkyyOP1/i8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750340993; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=HXoig7Q+/oEFtN4SjomCo2nMhWyT3fJq8sjjjfihsNI=;
 b=ZJFOMio78GQ7fSVmxwSZmU49YIRL5zTfMV119aCb6oNzx1bsjhE7xZlPoBup++02
 ZwRTz2KV7MswUOatZ1YGja/p41Ol9MyhFqZxYnGFx/GFVNgO7Jul2a+gZ8sZbSZVI7K
 IDpHbUV3sE+114KbCGKPJE9KPfFmHo3Jn/r6qV2M=
Received: by mx.zohomail.com with SMTPS id 1750340992098417.30853778923847;
 Thu, 19 Jun 2025 06:49:52 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 2/2] rust: drm: Add GPUVM abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250619135709.634625e0@collabora.com>
Date: Thu, 19 Jun 2025 10:49:34 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Asahi Lina <lina@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <477186AF-A8D4-4D4E-9F58-86958C654333@collabora.com>
References: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
 <20250422-gpuvm-v2-2-44d4fc25e411@collabora.com>
 <aAgHGuzCZzh7YPz2@cassiopeiae>
 <DBB3E8CE-19AA-437D-AF54-BF23763B254F@collabora.com>
 <aAj7gAzFVRX3dN7L@pollux>
 <F731D6F7-312D-4633-B677-69B7CC7194A6@collabora.com>
 <20250619135709.634625e0@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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

Hi Boris,

> On 19 Jun 2025, at 08:57, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> Hi,
>=20
> On Fri, 13 Jun 2025 13:42:59 -0300
> Daniel Almeida <daniel.almeida@collabora.com> wrote:
>=20
>> Danilo,
>>=20
>>=20
>>> <snip>
>>>=20
>>>>>> +// SAFETY: DRM GpuVmBo objects are always reference counted and =
the get/put functions
>>>>>> +// satisfy the requirements.
>>>>>> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
>>>>>> +    fn inc_ref(&self) {
>>>>>> +        // SAFETY: The drm_gpuvm_get function satisfies the =
requirements for inc_ref().
>>>>>> +        unsafe { bindings::drm_gpuvm_bo_get(&self.bo as *const _ =
as *mut _) };
>>>>>> +    }
>>>>>> +
>>>>>> +    unsafe fn dec_ref(mut obj: NonNull<Self>) {
>>>>>> +        // SAFETY: drm_gpuvm_bo_put() requires holding the gpuva =
lock, which is
>>>>>> +        // the dma_resv lock by default.
>>>>>> +        // The drm_gpuvm_put function satisfies the requirements =
for dec_ref().
>>>>>> +        // (We do not support custom locks yet.)
>>>>>> +        unsafe {
>>>>>> +            let resv =3D (*obj.as_mut().bo.obj).resv;
>>>>>> +            bindings::dma_resv_lock(resv, =
core::ptr::null_mut());
>>>>>> +            bindings::drm_gpuvm_bo_put(&mut obj.as_mut().bo);
>>>>>> +            bindings::dma_resv_unlock(resv); =20
>>>>>=20
>>>>> What if the resv_lock is held already? Please also make sure to =
put multiple
>>>>> unsafe calls each in a separate unsafe block. =20
>>>>=20
>>>> By whom? =20
>>>=20
>>> The lock might be held already by the driver or by TTM when things =
are called
>>> from TTM callbacks.
>>>=20
>>> This is why GPUVM never takes locks by itself, but asserts that the =
correct lock
>>> is held.
>>>=20
>>> I think we really want to get proof by the driver by providing lock =
guard
>>> references.
>>>=20
>>=20
>> There doesn=E2=80=99t seem to be a solution that fits all the boxes =
here.
>>=20
>> As you said, at this point the current status of the resv is unknown. =
If we
>> simply assume that it is not taken, we run into the problem you =
pointed out:
>> i.e.: recursive locking where ttm or some other layer has the lock =
already.
>>=20
>> Alternatively, if we assume that the resv must be locked in =
dec_ref(), then we
>> may build a lock::Guard from it and assert that it is held, but in =
any case
>> it's very confusing to expect the reservation to be locked on a =
dec_ref() call.
>>=20
>> The fact that dec_ref() is placed automatically on drop will =
massively
>> complicate the call sites:
>=20
> I'm digressing, but there's an aspect I found very annoying in the C
> version of the API: the fact that we have to take a BO ref, then lock,
> then release the vm_bo [1], because otherwise the vm_bo might be the
> last owner of a BO ref leading to a UAF on the lock itself. This to =
me,
> denotes a lifetime issue that I think would be good to address in the
> rust version of the API.
>=20
> It's not exactly the same problem, but I think it comes from the same
> root issue: lax ownership definition. By that I mean it's not clear
> who's the owner and who's the owned. gem_object::gpuva::list has
> weak refs on the vm_bos contained in this list, which kinda makes =
sense
> because vm_bos themselves have a ref on the gem_object, and if we were
> to make this weak ref a strong ref we'd never free any of these two
> objects. The lock is also part of the BO (either the BO resv lock, or =
a
> custom lock), and since it's the very same lock we use to =
insert/remove
> vm_bos, that's problematic.
>=20
> If we were making the gpuvm_bo_list a separate object that's =
originally
> created by the BO, and then let the GPUVM layer manipulate only this
> list, it could work. Of course that means the resv lock/driver custom
> lock should come from this object too, and I'm not too sure that's an
> option when dma_buf imports are involved.

This would require changes to the C side, because the C helpers expect =
the gpuva
list to be inside drm_gem_object, and these helpers are used in the Rust
bindings.

Don't get me wrong, IMHO we can definitely pursue this if needed, or if =
it's an
improvement. I am merely stating the fact that it's a more elaborate =
solution
that what I had originally proposed so that we are all aware.

>=20
>>=20
>> We will have to ensure that the resv is locked at all times where we =
interface
>> with a GpuVmBo, because each of these points could possibly be the =
last active
>> ref. If we don't, then we've introduced a race where the list is =
modified but
>> no lock is taken, which will be a pretty easy mistake to make. This =
seems to
>> also be the case in C, which we should try to improve upon.
>=20
> Yep, with auto-unref thrown into the mix you have to be very careful =
on
> which paths might release the last vm_bo ref, and make sure an extra
> ref is taken on the BO, and the resv/custom lock is held when that
> happens.
>=20
>>=20
>> My suggestion is to introduce a separate GPU-VA lock here:
>>=20
>> /// A base GEM object.
>> #[repr(C)]
>> #[pin_data]
>> pub struct Object<T: DriverObject> {
>>    obj: bindings::drm_gem_object,
>>    // The DRM core ensures the Device exists as long as its objects =
exist, so we don't need to
>>    // manage the reference count here.
>>    dev: *const bindings::drm_device,
>>    #[pin]
>>    inner: T,
>>    #[pin]
>>    _p: PhantomPinned,
>>    // Add a GPU-VA lock here <--------
>> }
>>=20
>> And only support custom locks in Rust, to the detriment of the =
optimization
>> where the resv is used and to the detriment of any perf improvements =
that
>> reusing the reservation might bring to the table.
>=20
> Yes, if it was only about perf optimizations, then I'd like to see
> numbers that prove taking an extra lock that's always going to be free
> in a path where you already took the BO resv lock actually makes a
> difference, and honestly, I doubt it. But my fear is that it's not so
> much about avoiding an extra lock to be taken, and more about making
> sure this list insertion/deletion doesn't race with other paths that
> are assuming that taking the resv lock is enough to guarantee =
exclusive
> access to this vm_bo list (I mean places outside gpuvm, in the drivers
> directly). I guess the is fixable.
>=20
>>=20
>> Notice that this would sidestep this entire discussion: nobody else =
would be
>> aware of this new lock so we could safely lock it in dec_ref(). We =
would also
>> be transparently managing the locking on behalf of drivers in all the =
other
>> calls where the VA list is accessed, which is another plus as I said =
above.
>=20
> If the lock is part of the gem_object, it's not solving the problem I
> described above, because you might be taking a lock that disappears if
> you don't take a BO ref before taking the lock. In the end, that's
> still a risky business.

I must confess I was not aware of the issue you're discussing. We can =
add an
instance of gem::ObjectRef in gpuvm::GpuVmBo if you think this will =
solve it.
This will make sure that the vmbo owns the gem object (or rather that it =
has a
+1 on the refcount) for its lifetime. That seems to be the semantics =
you're
looking for?

I thought about adding this lock to the Rust wrapper for the vmbo, but =
then
we'd run into the issue of shared BOs, where each would be connected to =
a
different vmbo and would thus take a different lock when attempting to =
modify
the same underlying gpuva list.

Just to be clear, by shared BO here I specifically mean a BO that's =
connected
to more than one VM, which is possible, IIUC.

=E2=80=94 Daniel


