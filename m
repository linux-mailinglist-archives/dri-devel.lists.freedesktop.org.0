Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A27B45BCA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 17:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9858B10EBD6;
	Fri,  5 Sep 2025 15:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Hs1PFDyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CD710EBC7;
 Fri,  5 Sep 2025 15:10:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757085004; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=muzTrFE0xFpqDKLtdyyFMZmWlc9glOkQ15V+K9e9MAr9MDD/IZ/cD1eFfq4EG5QzJ2EcvysfV2xSGw9d5zg6RLEW+XKtBbOkC8vntTFiyY8aWE+63zyHNpWR1mIHu6AQ5HXQzMnLiHvx4eO9ZB+3Zv9X29byEFCreyixzKUmHpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757085004;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jbiMsBZ0PMAYhHiet9jWLejQpnmLCaVZIWGnKUvfBgw=; 
 b=eKv1Mk+Pe/+yy+1iIYkaTCvIqzp6kY/+nC5+3a5THVb6BDEzW6fEzaUvvR/p5xmGPTucKgiqmLCD0vrBP2j6aQNhy6y0TA7nE5wLNSbA65ALGdewkOS5Xf4o49kqKQ78sEVrn07GHHLixs7JnPBgh6Nz1/arU0OWMnEVGmwTO4k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757085004; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=jbiMsBZ0PMAYhHiet9jWLejQpnmLCaVZIWGnKUvfBgw=;
 b=Hs1PFDyLOgH2WIDI9i7X2cgb2TEegjw9O9CRWH22coFBO/5pul6A/xJY9DrTNJMx
 UjiM3vZY9oGGpdf8CdH1vFvmYYSW8ez7gjJCGdCd0vrEeZXLd5TrSATwNIIQTppOHhN
 TdapNNWVa08RV4mUmLaVYGsAZ+qLWy9UI3a9fUmI=
Received: by mx.zohomail.com with SMTPS id 1757085001454158.55519036584815;
 Fri, 5 Sep 2025 08:10:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 13/14] rust: drm: gem: Add export() callback
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-14-lyude@redhat.com>
Date: Fri, 5 Sep 2025 12:09:42 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	"open list:DRM DRIVER FOR NVIDIA GPUS [RUST]" <nouveau@lists.freedesktop.org>,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b <linux-media"@vger.kernel.org (ope>),
	"moderated list:DMA BUFFER SHARING  FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b <linaro-mm-sig"@lists.linaro.org (mod>)
Content-Transfer-Encoding: quoted-printable
Message-Id: <D47EACDC-76CE-4D36-9564-210B390C9A82@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-14-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
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



> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This introduces an optional export() callback for GEM objects, which =
is
> used to implement the drm_gem_object_funcs->export function.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> drivers/gpu/drm/nova/gem.rs  |  1 +
> rust/kernel/drm/gem/mod.rs   | 72 +++++++++++++++++++++++++++++++++++-
> rust/kernel/drm/gem/shmem.rs |  6 ++-
> 3 files changed, 76 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 015cb56061a56..bbce6b0f4e6a4 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -16,6 +16,7 @@
> #[pin_data]
> pub(crate) struct NovaObject {}
>=20
> +#[vtable]
> impl gem::DriverObject for NovaObject {
>     type Driver =3D NovaDriver;
>     type Object =3D gem::Object<Self>;
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index f9f9727f14e4a..1ac25fc6d527b 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -8,7 +8,7 @@
>=20
> use crate::{
>     alloc::flags::*,
> -    bindings,
> +    bindings, dma_buf,
>     drm::driver::{AllocImpl, AllocOps},
>     drm::{self, private::Sealed},
>     error::{to_result, Result},
> @@ -45,6 +45,7 @@ fn as_ref(&self) -> =
&kernel::drm::gem::OpaqueObject<D> {
> pub(crate) use impl_as_opaque;
>=20
> /// GEM object functions, which must be implemented by drivers.
> +#[vtable]
> pub trait DriverObject: Sync + Send + Sized {
>     /// Parent `Driver` for this object.
>     type Driver: drm::Driver;
> @@ -69,6 +70,11 @@ fn open(_obj: &Self::Object, _file: =
&DriverFile<Self>) -> Result {
>=20
>     /// Close a handle to an existing object, associated with a File.
>     fn close(_obj: &Self::Object, _file: &DriverFile<Self>) {}
> +
> +    /// Optional handle for exporting a gem object.
> +    fn export(_obj: &Self::Object, _flags: u32) -> =
Result<DmaBuf<Self::Object>> {
> +        unimplemented!()

Shouldn=E2=80=99t this be the vtable-specific build error?

> +    }
> }
>=20
> /// Trait that represents a GEM object subtype
> @@ -138,6 +144,21 @@ extern "C" fn close_callback<T: DriverObject>(
>     T::close(obj, file);
> }
>=20
> +extern "C" fn export_callback<T: DriverObject>(
> +    raw_obj: *mut bindings::drm_gem_object,
> +    flags: i32,
> +) -> *mut bindings::dma_buf {
> +    // SAFETY: `export_callback` is specified in the AllocOps =
structure for `Object<T>`, ensuring
> +    // that `raw_obj` is contained within a `Object<T>`.
> +    let obj =3D unsafe { T::Object::from_raw(raw_obj) };
> +
> +    match T::export(obj, flags as u32) {
> +        // DRM takes a hold of the reference
> +        Ok(buf) =3D> buf.into_raw(),
> +        Err(e) =3D> e.to_ptr(),
> +    }
> +}
> +
> impl<T: DriverObject> IntoGEMObject for Object<T> {
>     fn as_raw(&self) -> *mut bindings::drm_gem_object {
>         self.obj.get()
> @@ -248,7 +269,11 @@ impl<T: DriverObject> Object<T> {
>         open: Some(open_callback::<T>),
>         close: Some(close_callback::<T>),
>         print_info: None,
> -        export: None,
> +        export: if T::HAS_EXPORT {
> +            Some(export_callback::<T>)
> +        } else {
> +            None
> +        },
>         pin: None,
>         unpin: None,
>         get_sg_table: None,
> @@ -375,6 +400,49 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object =
{
>=20
> impl<D: drm::Driver> Sealed for OpaqueObject<D> {}
>=20
> +/// A [`dma_buf::DmaBuf`] which has been exported from a GEM object.
> +///
> +/// The [`dma_buf::DmaBuf`] will be released when this type is =
dropped.
> +///
> +/// # Invariants
> +///
> +/// - `self.0` points to a valid initialized [`dma_buf::DmaBuf`] for =
the lifetime of this object.
> +/// - The GEM object from which this [`dma_buf::DmaBuf`] was exported =
from is guaranteed to be of
> +///   type `T`.
> +pub struct DmaBuf<T: IntoGEMObject>(NonNull<dma_buf::DmaBuf>, =
PhantomData<T>);
> +
> +impl<T: IntoGEMObject> Deref for DmaBuf<T> {
> +    type Target =3D dma_buf::DmaBuf;
> +
> +    #[inline]
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: This pointer is guaranteed to be valid by our type =
invariants.
> +        unsafe { self.0.as_ref() }

> +    }
> +}
> +
> +impl<T: IntoGEMObject> Drop for DmaBuf<T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY:
> +        // - `dma_buf::DmaBuf` is guaranteed to have an identical =
layout to `struct dma_buf`
> +        //   by its type invariants.
> +        // - We hold the last reference to this `DmaBuf`, making it =
safe to destroy.

How can we be sure of this?

> +        unsafe { =
bindings::drm_gem_dmabuf_release(self.0.cast().as_ptr()) }
> +    }
> +}
> +
> +impl<T: IntoGEMObject> DmaBuf<T> {
> +    /// Leak the reference for this [`DmaBuf`] and return a raw =
pointer to it.
> +    #[inline]
> +    pub(crate) fn into_raw(self) -> *mut bindings::dma_buf {

Then this should perhaps be called leak()? At least if we=E2=80=99re =
following the std nomenclature.

> +        let dma_ptr =3D self.as_raw();
> +
> +        core::mem::forget(self);
> +        dma_ptr
> +    }
> +}
> +
> pub(super) const fn create_fops() -> bindings::file_operations {
>     // SAFETY: As by the type invariant, it is safe to initialize =
`bindings::file_operations`
>     // zeroed.
> diff --git a/rust/kernel/drm/gem/shmem.rs =
b/rust/kernel/drm/gem/shmem.rs
> index 1437cda27a22c..b3a70e6001842 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -66,7 +66,11 @@ impl<T: DriverObject> Object<T> {
>         open: Some(super::open_callback::<T>),
>         close: Some(super::close_callback::<T>),
>         print_info: Some(bindings::drm_gem_shmem_object_print_info),
> -        export: None,
> +        export: if T::HAS_EXPORT {
> +            Some(super::export_callback::<T>)
> +        } else {
> +            None
> +        },
>         pin: Some(bindings::drm_gem_shmem_object_pin),
>         unpin: Some(bindings::drm_gem_shmem_object_unpin),
>         get_sg_table: =
Some(bindings::drm_gem_shmem_object_get_sg_table),
> --=20
> 2.50.0
>=20

