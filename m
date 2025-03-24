Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D74CA6EB32
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 09:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3E910E4FF;
	Tue, 25 Mar 2025 08:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.b="Jio6aTEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C6D10E4AC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 18:29:35 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 4444F240103
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 19:29:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1742840967; bh=ET4b3AaYE8Ghc/W+tl4x1TdMZ5xfmseummAar90bY94=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=Jio6aTEk1qtcDU+YObeSnJg6KCEhBPxz2pICHEscwOIp03oSyJB78N1vlPJwxOrom
 9UkLBsdgYQkH+znfnLmUg3gl8O6iiZDmtl6IJU9U1DERwR43h3G9U0tRqfBZ/xZpnj
 zk4ji2MHtSZ336EINFjTCxcpJoD3WZsUVOtPf8g9xocIw8o+vBQGMfLcwtN8Avw6sc
 yf5xCCoIbKHpYKWG+Z78P3Ejyg5+xITnqkUXIJSv/xAJ2siUUZoHEhTUP1JAaLhybJ
 /XqHmasKzt3AoAHFJdHY+bMfuLeVrZUo1G8K7u7vVb3X+8de6eBuEzHvKt6REZL9Zv
 t53xoK8UviKjw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4ZM1mM3SgSz9rxG;
 Mon, 24 Mar 2025 19:29:23 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
 Sumit Semwal <sumit.semwal@linaro.org>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>,  linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Asahi
 Lina <lina@asahilina.net>
Subject: Re: [PATCH 2/2] rust: drm: Add GPUVM abstraction
In-Reply-To: <20250324-gpuvm-v1-2-7f8213eebb56@collabora.com> (Daniel
 Almeida's message of "Mon, 24 Mar 2025 12:13:55 -0300")
References: <20250324-gpuvm-v1-0-7f8213eebb56@collabora.com>
 <20250324-gpuvm-v1-2-7f8213eebb56@collabora.com>
Date: Mon, 24 Mar 2025 18:29:22 +0000
Message-ID: <m2pli62sfx.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 25 Mar 2025 08:12:54 +0000
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

Daniel Almeida <daniel.almeida@collabora.com> writes:

> +/// The object returned after a call to [`GpuVm::lock`].
> +///
> +/// This object has access to operations that modify the VM's interval t=
ree.
> +pub struct LockedGpuVm<'a, T: DriverGpuVm> {
> +    gpuvm: &'a GpuVm<T>,
> +}
> +
> +impl<T: DriverGpuVm> LockedGpuVm<'_, T> {
> +    /// Finds the [`GpuVmBo`] object that connects `obj` to this VM.
> +    ///
> +    /// If found, increases the reference count of the GpuVmBo object
> +    /// accordingly.
> +    pub fn find_bo(&mut self, obj: &DriverObject<T>) -> Option<ARef<GpuV=
mBo<T>>> {
> +        // SAFETY: LockedGpuVm implies the right locks are held.
> +        let p =3D unsafe {
> +            bindings::drm_gpuvm_bo_find(
> +                self.gpuvm.gpuvm() as *mut _,
> +                obj.gem_obj() as *const _ as *mut _,
> +            )
> +        };
> +        if p.is_null() {
> +            None
> +        } else {
> +            // SAFETY: All the drm_gpuvm_bo objects in this GpuVm are al=
ways allocated by us as GpuVmBo<T>.
> +            let p =3D unsafe { crate::container_of!(p, GpuVmBo<T>, bo) a=
s *mut GpuVmBo<T> };
> +            // SAFETY: We checked for NULL above, and the types ensure t=
hat
> +            // this object was created by vm_bo_alloc_callback<T>.
> +            Some(unsafe { ARef::from_raw(NonNull::new_unchecked(p)) })
> +        }

Hi Daniel,

This is mostly eye candy=E2=80=94maybe we can simplify it to just:
    if p.is_null() {
       return None;
    }

    // SAFETY: All the drm_gpuvm_bo objects in this GpuVm are always alloca=
ted by us as GpuVmBo<T>.
    let p =3D unsafe { crate::container_of!(p, GpuVmBo<T>, bo) as *mut GpuV=
mBo<T> };
    // SAFETY: We checked for NULL above, and the types ensure that
    // this object was created by vm_bo_alloc_callback<T>.
    Some(unsafe { ARef::from_raw(NonNull::new_unchecked(p)) })


Same with `fn obtain_bo`?

--
C. Mitrodimas

> +    }
> +
> +    /// Obtains the [`GpuVmBo`] object that connects `obj` to this VM.
> +    ///
> +    /// This connection is unique, so an instane of [`GpuVmBo`] will be
> +    /// allocated for `obj` once, and that instance will be returned fro=
m that
> +    /// point forward.
> +    pub fn obtain_bo(&mut self, obj: &DriverObject<T>) -> Result<ARef<Gp=
uVmBo<T>>> {
> +        // SAFETY: LockedGpuVm implies the right locks are held.
> +        let p =3D unsafe {
> +            bindings::drm_gpuvm_bo_obtain(
> +                self.gpuvm.gpuvm() as *mut _,
> +                obj.gem_obj() as *const _ as *mut _,
> +            )
> +        };
> +        if p.is_null() {
> +            Err(ENOMEM)
> +        } else {
> +            // SAFETY: Container invariant is guaranteed for GpuVmBo obj=
ects for this GpuVm.
> +            let p =3D unsafe { crate::container_of!(p, GpuVmBo<T>, bo) a=
s *mut GpuVmBo<T> };
> +            // SAFETY: We checked for NULL above, and the types ensure t=
hat
> +            // this object was created by vm_bo_alloc_callback<T>.
> +            Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(p)) })
> +        }
> +    }
