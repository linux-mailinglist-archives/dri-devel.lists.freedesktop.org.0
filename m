Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53CAD92FA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 18:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657A410E013;
	Fri, 13 Jun 2025 16:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BtvhkdJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1BD10E013
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 16:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749832998; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RXubKtilc4Hk7wiBtOfWMoEAbVkLii7p4eDasW98tipyK9ilfg/iaY17T61v/3qtT3TQIbOG7jeJD0TFTMcmNfIN0kJzTJ/jRTAEGBmPzIr3c6toeRmg9u2MeiQ7o4Wjz5lULCPFKR62H4lF9gUvl7mYANFBR7XVfoHWiJPbBRM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749832998;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=74vSUUgcxDPegdL/S7B0LL/ZhYlU7BQBdrEJIw3o8/4=; 
 b=iy18LtjMHnhpfdyQHYdGpuVWAq/zxfeJQPMGRuZtdG3WjaQBw5Ja67/cbsW/OMXG66y4+tHWbTjVDGYXyOwK5xf6r1Afk64kFQrYFZG847nq2Ab1QVaCo7YWSsdFe+7ySGw7HiJyVVwsRaviLA7c9gQm8frNWEWfJT6JlaKHLu4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749832998; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=74vSUUgcxDPegdL/S7B0LL/ZhYlU7BQBdrEJIw3o8/4=;
 b=BtvhkdJMHuKUHvpRZBnkYO2cNQVC1z/dDCPSr5TGD/9vwqOSMEqveDBN4COmd8VX
 N9u3ePms9mT0Zca95widsqJll4DCUqd9/YdWG6PYzsP5RQAm4KUwgN/+Rqhr8KC0Y2v
 fqs5SWMoGc74qxykJhNT/HDDkK4ZBBQxtwnyBW8A=
Received: by mx.zohomail.com with SMTPS id 1749832997036813.3804981283496;
 Fri, 13 Jun 2025 09:43:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 2/2] rust: drm: Add GPUVM abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aAj7gAzFVRX3dN7L@pollux>
Date: Fri, 13 Jun 2025 13:42:59 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Asahi Lina <lina@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F731D6F7-312D-4633-B677-69B7CC7194A6@collabora.com>
References: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
 <20250422-gpuvm-v2-2-44d4fc25e411@collabora.com>
 <aAgHGuzCZzh7YPz2@cassiopeiae>
 <DBB3E8CE-19AA-437D-AF54-BF23763B254F@collabora.com>
 <aAj7gAzFVRX3dN7L@pollux>
To: Danilo Krummrich <dakr@kernel.org>
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

Danilo,


> <snip>
>=20
>>>> +// SAFETY: DRM GpuVmBo objects are always reference counted and =
the get/put functions
>>>> +// satisfy the requirements.
>>>> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
>>>> +    fn inc_ref(&self) {
>>>> +        // SAFETY: The drm_gpuvm_get function satisfies the =
requirements for inc_ref().
>>>> +        unsafe { bindings::drm_gpuvm_bo_get(&self.bo as *const _ =
as *mut _) };
>>>> +    }
>>>> +
>>>> +    unsafe fn dec_ref(mut obj: NonNull<Self>) {
>>>> +        // SAFETY: drm_gpuvm_bo_put() requires holding the gpuva =
lock, which is
>>>> +        // the dma_resv lock by default.
>>>> +        // The drm_gpuvm_put function satisfies the requirements =
for dec_ref().
>>>> +        // (We do not support custom locks yet.)
>>>> +        unsafe {
>>>> +            let resv =3D (*obj.as_mut().bo.obj).resv;
>>>> +            bindings::dma_resv_lock(resv, core::ptr::null_mut());
>>>> +            bindings::drm_gpuvm_bo_put(&mut obj.as_mut().bo);
>>>> +            bindings::dma_resv_unlock(resv);
>>>=20
>>> What if the resv_lock is held already? Please also make sure to put =
multiple
>>> unsafe calls each in a separate unsafe block.
>>=20
>> By whom?
>=20
> The lock might be held already by the driver or by TTM when things are =
called
> from TTM callbacks.
>=20
> This is why GPUVM never takes locks by itself, but asserts that the =
correct lock
> is held.
>=20
> I think we really want to get proof by the driver by providing lock =
guard
> references.
>=20

There doesn=E2=80=99t seem to be a solution that fits all the boxes =
here.

As you said, at this point the current status of the resv is unknown. If =
we
simply assume that it is not taken, we run into the problem you pointed =
out:
i.e.: recursive locking where ttm or some other layer has the lock =
already.

Alternatively, if we assume that the resv must be locked in dec_ref(), =
then we
may build a lock::Guard from it and assert that it is held, but in any =
case
it's very confusing to expect the reservation to be locked on a =
dec_ref() call.

The fact that dec_ref() is placed automatically on drop will massively
complicate the call sites:

We will have to ensure that the resv is locked at all times where we =
interface
with a GpuVmBo, because each of these points could possibly be the last =
active
ref. If we don't, then we've introduced a race where the list is =
modified but
no lock is taken, which will be a pretty easy mistake to make. This =
seems to
also be the case in C, which we should try to improve upon.

My suggestion is to introduce a separate GPU-VA lock here:

/// A base GEM object.
#[repr(C)]
#[pin_data]
pub struct Object<T: DriverObject> {
    obj: bindings::drm_gem_object,
    // The DRM core ensures the Device exists as long as its objects =
exist, so we don't need to
    // manage the reference count here.
    dev: *const bindings::drm_device,
    #[pin]
    inner: T,
    #[pin]
    _p: PhantomPinned,
    // Add a GPU-VA lock here <--------
}

And only support custom locks in Rust, to the detriment of the =
optimization
where the resv is used and to the detriment of any perf improvements =
that
reusing the reservation might bring to the table.

Notice that this would sidestep this entire discussion: nobody else =
would be
aware of this new lock so we could safely lock it in dec_ref(). We would =
also
be transparently managing the locking on behalf of drivers in all the =
other
calls where the VA list is accessed, which is another plus as I said =
above.

I understand that most C drivers do not need an extra lock, but it's =
getting
hard to emulate this behavior in Rust.

Also, the fact that they don't need an extra lock does not invalidate =
the fact
that it would be simply safer to have this extra lock anyways. In other =
words,
it is still completely possible to use GPUVM without locking anything =
and IMHO
we shouldn't bring this over if we can help it.

=E2=80=94 Daniel


