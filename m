Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD8B45F85
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 19:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D4610E188;
	Fri,  5 Sep 2025 17:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="OjskVgT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A390E10E188
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 17:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757091916; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bWZfnD1t+HFmlXk1E77O3FoogWu9XAYHZM7FVrITBQ5oBk9B4VjOXclgsFGEXhXY0WnWSeh/nnK/7RUgsu5qn2SNdocqYnuocORuvxehWcCRVFu2XHSYHsWSMDEg/Y/C0Gy76Ng332sCQXMbAYkT5XeqfEBiMJ8fd818A+rnID4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757091916;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lh5BYHIQ+dyNmKTm/DFnnQ6nv9QKcmJo6FHN9ZNXiK4=; 
 b=UoyfBMcKi0g39SgjpzWOt+YNacuMXXPpJyhZAO5lF0jAkfwGRNC48fAHIvCgTxrhbxobp1kGYenZT9IMsFoQsbqWgdc8aTjQ2EdpJyrKHRujX44ou703jp326u7J3q+HtBhUC0W3abvaBhVq/EFxydbhaHJL2FHNvrGwmRw0mFU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757091916; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=lh5BYHIQ+dyNmKTm/DFnnQ6nv9QKcmJo6FHN9ZNXiK4=;
 b=OjskVgT8ZL0lUjT6Yj/M/mBhLYrAnc42RsqYEhABx0Z0AHhZAPn/7OFPrtwUNQ88
 u7cHIKP6Us4YUIUL8mv9lfgI8c+7UqBbgAgV/N77tAA29YtpinLXpKfAXZ9C5qezmMS
 WJ2W0CSa+o2MiwMv4lgXUar17MadoPZJf0hCVR5I=
Received: by mx.zohomail.com with SMTPS id 1757091913564382.72745206751347;
 Fri, 5 Sep 2025 10:05:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 10/14] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-11-lyude@redhat.com>
Date: Fri, 5 Sep 2025 14:04:55 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Asahi Lina <lina@asahilina.net>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B3FB52A-2E5E-4908-B196-F55ACB42CBD0@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-11-lyude@redhat.com>
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

Hi Lyude,

> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> From: Asahi Lina <lina@asahilina.net>
>=20
> The DRM shmem helper includes common code useful for drivers which
> allocate GEM objects as anonymous shmem. Add a Rust abstraction for
> this. Drivers can choose the raw GEM implementation or the shmem =
layer,
> depending on their needs.
>=20
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> V2:
> * Use the drm_gem_shmem_init() and drm_gem_shmem_release() that I =
extracted
>  so we can handle memory allocation in rust, which means we no longer =
have
>  to handle freeing rust members of the struct by hand and have a =
closer
>  implementation to the main gem object
>  (this also gets rid of gem_create_object)
> * Get rid of GemObjectRef and UniqueGemObjectRef, we have ARef<T> at =
home.
> * Use Device<T::Driver> in Object<T>
> * Cleanup Object::<T>::new() a bit:
>  * Cleanup safety comment
>  * Use cast_mut()
> * Just import container_of!(), we use it all over anyhow
> * mut_shmem() -> as_shmem(), make it safe (there's no reason for being =
unsafe)
> * Remove any *const and *muts in structs, just use NonNull
> * Get rid of the previously hand-rolled sg_table bindings in shmem, =
use the
>  bindings from Abdiel's sg_table patch series
> * Add a TODO at the top about DMA reservation APIs and a desire for =
WwMutex
> * Get rid of map_wc() and replace it with a new ObjectConfig struct. =
While
>  it currently only specifies the map_wc flag, the idea here is that
>  settings like map_wc() and parent_resv_obj() shouldn't be exposed as
>  normal functions since the only place where it's safe to set them is
>  when we're still guaranteed unique access to the GEM object, e.g. =
before
>  returning it to the caller. Using a struct instead of individual
>  arguments here is mainly because we'll be adding at least one more
>  argument, and there's enough other gem shmem settings that trying to =
add
>  all of them as individual function arguments in the future would be a =
bit
>  messy.
> * Get rid of vm_numa_fields!, Lina didn't like this macro much either =
and I
>  think that it's fine for us to just specify the #[cfg(=E2=80=A6)] =
attributes by
>  hand since we only need to do it twice.
> * Set drm_gem_object_funcs.vm_ops directly to drm_gem_shmem_vm_ops, =
don't
>  export the various shmem funcs. I'm not sure why this wasn't possible
>  before but it seems to work fine now.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/bindings/bindings_helper.h |   2 +
> rust/helpers/drm.c              |  48 ++++-
> rust/kernel/drm/gem/mod.rs      |   3 +-
> rust/kernel/drm/gem/shmem.rs    | 311 ++++++++++++++++++++++++++++++++
> 4 files changed, 362 insertions(+), 2 deletions(-)
> create mode 100644 rust/kernel/drm/gem/shmem.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index 00fe0449ed6de..e8386e3772376 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -33,6 +33,7 @@
> #include <drm/drm_drv.h>
> #include <drm/drm_file.h>
> #include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
> #include <drm/drm_ioctl.h>
> #include <kunit/test.h>
> #include <linux/auxiliary_bus.h>
> @@ -56,6 +57,7 @@
> #include <linux/firmware.h>
> #include <linux/fs.h>
> #include <linux/ioport.h>
> +#include <linux/iosys-map.h>
> #include <linux/jiffies.h>
> #include <linux/jump_label.h>
> #include <linux/mdio.h>
> diff --git a/rust/helpers/drm.c b/rust/helpers/drm.c
> index 450b406c6f273..a4e997d0b4732 100644
> --- a/rust/helpers/drm.c
> +++ b/rust/helpers/drm.c
> @@ -1,6 +1,7 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> #include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
> #include <drm/drm_vma_manager.h>
>=20
> #ifdef CONFIG_DRM
> @@ -20,4 +21,49 @@ __u64 rust_helper_drm_vma_node_offset_addr(struct =
drm_vma_offset_node *node)
> return drm_vma_node_offset_addr(node);
> }
>=20
> -#endif
> +#ifdef CONFIG_DRM_GEM_SHMEM_HELPER
> +void rust_helper_drm_gem_shmem_object_free(struct drm_gem_object =
*obj)
> +{
> + return drm_gem_shmem_object_free(obj);
> +}
> +
> +void rust_helper_drm_gem_shmem_object_print_info(struct drm_printer =
*p, unsigned int indent,
> +                                                  const struct =
drm_gem_object *obj)
> +{
> + drm_gem_shmem_object_print_info(p, indent, obj);
> +}
> +
> +int rust_helper_drm_gem_shmem_object_pin(struct drm_gem_object *obj)
> +{
> + return drm_gem_shmem_object_pin(obj);
> +}
> +
> +void rust_helper_drm_gem_shmem_object_unpin(struct drm_gem_object =
*obj)
> +{
> + drm_gem_shmem_object_unpin(obj);
> +}
> +
> +struct sg_table *rust_helper_drm_gem_shmem_object_get_sg_table(struct =
drm_gem_object *obj)
> +{
> + return drm_gem_shmem_object_get_sg_table(obj);
> +}
> +
> +int rust_helper_drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
> +                                           struct iosys_map *map)
> +{
> + return drm_gem_shmem_object_vmap(obj, map);
> +}
> +
> +void rust_helper_drm_gem_shmem_object_vunmap(struct drm_gem_object =
*obj,
> +                                              struct iosys_map *map)
> +{
> + drm_gem_shmem_object_vunmap(obj, map);
> +}
> +
> +int rust_helper_drm_gem_shmem_object_mmap(struct drm_gem_object *obj, =
struct vm_area_struct *vma)
> +{
> + return drm_gem_shmem_object_mmap(obj, vma);
> +}
> +
> +#endif /* CONFIG_DRM_GEM_SHMEM_HELPER */
> +#endif /* CONFIG_DRM */
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index fe6ff3762a504..f9f9727f14e4a 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -3,6 +3,8 @@
> //! DRM GEM API
> //!
> //! C header: =
[`include/linux/drm/drm_gem.h`](srctree/include/linux/drm/drm_gem.h)
> +#[cfg(CONFIG_DRM_GEM_SHMEM_HELPER =3D "y")]
> +pub mod shmem;
>=20
> use crate::{
>     alloc::flags::*,
> @@ -215,7 +217,6 @@ fn create_mmap_offset(&self) -> Result<u64> {
> impl<T: IntoGEMObject> BaseObject for T {}
>=20
> /// Crate-private base operations shared by all GEM object classes.
> -#[expect(unused)]
> pub(crate) trait BaseObjectPrivate: IntoGEMObject {
>     /// Return a pointer to this object's dma_resv.
>     fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
> diff --git a/rust/kernel/drm/gem/shmem.rs =
b/rust/kernel/drm/gem/shmem.rs
> new file mode 100644
> index 0000000000000..6a8a392c3691b
> --- /dev/null
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! DRM GEM shmem helper objects
> +//!
> +//! C header: =
[`include/linux/drm/drm_gem_shmem_helper.h`](srctree/include/linux/drm/drm=
_gem_shmem_helper.h)
> +
> +// TODO:
> +// - There are a number of spots here that manually acquire/release =
the DMA reservation lock using
> +//   dma_resv_(un)lock(). In the future we should add support for ww =
mutex, expose a method to
> +//   acquire a reference to the WwMutex, and then use that directly =
instead of the C functions here.
> +
> +use crate::{
> +    container_of,
> +    drm::{device, driver, gem, private::Sealed},
> +    error::{from_err_ptr, to_result},
> +    prelude::*,
> +    scatterlist,
> +    types::{ARef, Opaque},
> +};
> +use core::{
> +    mem::MaybeUninit,
> +    ops::{Deref, DerefMut},
> +    ptr::{addr_of_mut, NonNull},
> +    slice,
> +};
> +use gem::{BaseObject, BaseObjectPrivate, DriverObject, IntoGEMObject, =
OpaqueObject};
> +
> +/// A struct for controlling the creation of shmem-backed GEM =
objects.
> +///
> +/// This is used with [`Object::new()`] to control various properties =
that can only be set when
> +/// initially creating a shmem-backed GEM object.
> +#[derive(Default)]
> +pub struct ObjectConfig<'a, T: DriverObject> {
> +    /// Whether to set the write-combine map flag.
> +    pub map_wc: bool,
> +
> +    /// Reuse the DMA reservation from another GEM object.
> +    ///
> +    /// The newly created [`Object`] will hold an owned refcount to =
`parent_resv_obj` if specified.
> +    pub parent_resv_obj: Option<&'a OpaqueObject<T::Driver>>,
> +}
> +
> +/// A shmem-backed GEM object.
> +///
> +/// # Invariants
> +///
> +/// The DRM core ensures that `dev` will remain valid for as long as =
the object.
> +#[repr(C)]
> +#[pin_data]
> +pub struct Object<T: DriverObject> {
> +    #[pin]
> +    obj: Opaque<bindings::drm_gem_shmem_object>,
> +    dev: NonNull<device::Device<T::Driver>>,
> +    // Parent object that owns this object's DMA reservation object
> +    parent_resv_obj: Option<ARef<OpaqueObject<T::Driver>>>,
> +    #[pin]
> +    inner: T,
> +}
> +
> +super::impl_as_opaque!(Object<T> where T: DriverObject);
> +
> +impl<T: DriverObject> Object<T> {
> +    /// `drm_gem_object_funcs` vtable suitable for GEM shmem objects.
> +    const VTABLE: bindings::drm_gem_object_funcs =3D =
bindings::drm_gem_object_funcs {
> +        free: Some(Self::free_callback),
> +        open: Some(super::open_callback::<T>),
> +        close: Some(super::close_callback::<T>),
> +        print_info: Some(bindings::drm_gem_shmem_object_print_info),
> +        export: None,
> +        pin: Some(bindings::drm_gem_shmem_object_pin),
> +        unpin: Some(bindings::drm_gem_shmem_object_unpin),
> +        get_sg_table: =
Some(bindings::drm_gem_shmem_object_get_sg_table),
> +        vmap: Some(bindings::drm_gem_shmem_object_vmap),
> +        vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
> +        mmap: Some(bindings::drm_gem_shmem_object_mmap),
> +        status: None,
> +        rss: None,
> +        // SAFETY: `drm_gem_shmem_vm_ops` is static const on the C =
side, so immutable references are
> +        // safe here and such references shall be valid forever
> +        vm_ops: unsafe { &bindings::drm_gem_shmem_vm_ops },
> +        evict: None,
> +    };
> +
> +    /// Return a raw pointer to the embedded drm_gem_shmem_object.
> +    fn as_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
> +        self.obj.get()
> +    }
> +
> +    /// Create a new shmem-backed DRM object of the given size.
> +    ///
> +    /// Additional config options can be specified using `config`.
> +    pub fn new(
> +        dev: &device::Device<T::Driver>,
> +        size: usize,
> +        config: ObjectConfig<'_, T>,
> +        args: T::Args,
> +    ) -> Result<ARef<Self>> {
> +        let new: Pin<KBox<Self>> =3D KBox::try_pin_init(
> +            try_pin_init!(Self {
> +                obj <- Opaque::init_zeroed(),
> +                dev: NonNull::from(dev),
> +                parent_resv_obj: config.parent_resv_obj.map(|p| =
p.into()),
> +                inner <- T::new(dev, size, args),
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        // SAFETY: `obj.as_raw()` is guaranteed to be valid by the =
initialization above.
> +        unsafe { (*new.as_raw()).funcs =3D &Self::VTABLE };
> +
> +        // SAFETY: The arguments are all valid via the type =
invariants.
> +        to_result(unsafe { bindings::drm_gem_shmem_init(dev.as_raw(), =
new.as_shmem(), size) })?;
> +
> +        // SAFETY: We never move out of `self`.
> +        let new =3D KBox::into_raw(unsafe { =
Pin::into_inner_unchecked(new) });
> +
> +        // SAFETY: We're taking over the owned refcount from =
`drm_gem_shmem_init`.
> +        let obj =3D unsafe { =
ARef::from_raw(NonNull::new_unchecked(new)) };
> +
> +        // Start filling out values from `config`
> +        if let Some(parent_resv) =3D config.parent_resv_obj {
> +            // SAFETY: We have yet to expose the new gem object =
outside of this function, so it is
> +            // safe to modify this field.
> +            unsafe { (*obj.obj.get()).base.resv =3D =
parent_resv.raw_dma_resv() };
> +        }
> +
> +        // SAFETY: We have yet to expose this object outside of this =
function, so we're guaranteed
> +        // to have exclusive access - thus making this safe to hold a =
mutable reference to.
> +        let shmem =3D unsafe { &mut *obj.as_shmem() };
> +        shmem.set_map_wc(config.map_wc);
> +
> +        Ok(obj)
> +    }
> +
> +    /// Returns the `Device` that owns this GEM object.
> +    pub fn dev(&self) -> &device::Device<T::Driver> {
> +        // SAFETY: We are guaranteed that `dev` is valid for as long =
as this object is valid by our
> +        // type invariants
> +        unsafe { self.dev.as_ref() }
> +    }
> +
> +    extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
> +        // SAFETY:
> +        // - DRM always passes a valid gem object here
> +        // - We used drm_gem_shmem_create() in our create_gem_object =
callback, so we know that
> +        //   `obj` is contained within a drm_gem_shmem_object
> +        let this =3D unsafe { container_of!(obj, =
bindings::drm_gem_shmem_object, base) };
> +
> +        // SAFETY:
> +        // - We're in free_callback - so this function is safe to =
call.
> +        // - We won't be using the gem resources on `this` after this =
call.
> +        unsafe { bindings::drm_gem_shmem_release(this) };
> +
> +        // SAFETY:
> +        // - We verified above that `obj` is valid, which makes =
`this` valid
> +        // - This function is set in AllocOps, so we know that `this` =
is contained within a
> +        //   `Object<T>`
> +        let this =3D unsafe { container_of!(this.cast::<Opaque<_>>(), =
Self, obj) };

nit: having =E2=80=9C_=E2=80=9D here makes it a bit harder to see what =
is going on.

> +
> +        // SAFETY: We're recovering the Kbox<> we created in =
gem_create_object()
> +        let _ =3D unsafe { KBox::from_raw(this) };
> +    }
> +
> +    /// Creates (if necessary) and returns an immutable reference to =
a scatter-gather table of DMA
> +    /// pages for this object.
> +    ///
> +    /// This will pin the object in memory.
> +    #[inline]
> +    pub fn sg_table(&self) -> Result<&scatterlist::SGTable> {
> +        // SAFETY:
> +        // - drm_gem_shmem_get_pages_sgt is thread-safe.
> +        // - drm_gem_shmem_get_pages_sgt returns either a valid =
pointer to a scatterlist, or an
> +        //   error pointer.
> +        let sgt =3D from_err_ptr(unsafe { =
bindings::drm_gem_shmem_get_pages_sgt(self.as_shmem()) })?;
> +
> +        // SAFETY: We checked above that `sgt` is not an error =
pointer, so it must be a valid
> +        // pointer to a scatterlist
> +        Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
> +    }
> +
> +    /// Creates and returns a virtual kernel memory mapping for this =
object.
> +    pub fn vmap(&self) -> Result<VMap<T>> {
> +        let mut map: MaybeUninit<bindings::iosys_map> =3D =
MaybeUninit::uninit();
> +
> +        // SAFETY:
> +        // - drm_gem_shmem_vmap can be called with the DMA =
reservation lock held
> +        // - Our ARef is proof that `obj` is safe to deref
> +        to_result(unsafe {
> +            // TODO: see top of file
> +            bindings::dma_resv_lock(self.raw_dma_resv(), =
core::ptr::null_mut());
> +            let ret =3D =
bindings::drm_gem_shmem_vmap_locked(self.as_shmem(), map.as_mut_ptr());
> +            bindings::dma_resv_unlock(self.raw_dma_resv());
> +            ret
> +        })?;
> +
> +        // SAFETY: if drm_gem_shmem_vmap did not fail, map is =
initialized now
> +        let map =3D unsafe { map.assume_init() };
> +
> +        Ok(VMap {
> +            map,
> +            owner: self.into(),
> +        })
> +    }
> +}
> +
> +impl<T: DriverObject> Deref for Object<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<T: DriverObject> DerefMut for Object<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.inner
> +    }
> +}
> +
> +impl<T: DriverObject> Sealed for Object<T> {}
> +
> +impl<T: DriverObject> gem::IntoGEMObject for Object<T> {
> +    fn as_raw(&self) -> *mut bindings::drm_gem_object {
> +        // SAFETY: Our immutable reference is proof that this is afe =
to dereference

Typo ^

> +        unsafe { addr_of_mut!((*self.obj.get()).base) }

&raw mut

> +    }
> +
> +    unsafe fn from_raw<'a>(obj: *mut bindings::drm_gem_object) -> &'a =
Object<T> {
> +        // SAFETY: The safety contract of from_gem_obj() guarantees =
that `obj` is contained within
> +        // `Self`
> +        unsafe {
> +            let obj: *mut Opaque<_> =3D

We should avoid =E2=80=9C_=E2=80=9D here.
=20
> +                container_of!(obj, bindings::drm_gem_shmem_object, =
base).cast();
> +
> +            &*container_of!(obj, Object<T>, obj)
> +        }
> +    }
> +}
> +
> +impl<T: DriverObject> driver::AllocImpl for Object<T> {
> +    type Driver =3D T::Driver;
> +
> +    const ALLOC_OPS: driver::AllocOps =3D driver::AllocOps {
> +        gem_create_object: None,
> +        prime_handle_to_fd: None,
> +        prime_fd_to_handle: None,
> +        gem_prime_import: None,
> +        gem_prime_import_sg_table: =
Some(bindings::drm_gem_shmem_prime_import_sg_table),
> +        dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
> +        dumb_map_offset: None,
> +    };
> +}
> +
> +/// A virtual mapping for a shmem-backed GEM object in kernel address =
space.
> +pub struct VMap<T: DriverObject> {
> +    map: bindings::iosys_map,
> +    owner: ARef<Object<T>>,
> +}
> +
> +impl<T: DriverObject> VMap<T> {
> +    /// Returns a const raw pointer to the start of the mapping.
> +    pub fn as_ptr(&self) -> *const core::ffi::c_void {
> +        // SAFETY: The shmem helpers always return non-iomem maps
> +        unsafe { self.map.__bindgen_anon_1.vaddr }
> +    }
> +
> +    /// Returns a mutable raw pointer to the start of the mapping.
> +    pub fn as_mut_ptr(&mut self) -> *mut core::ffi::c_void {
> +        // SAFETY: The shmem helpers always return non-iomem maps
> +        unsafe { self.map.__bindgen_anon_1.vaddr }
> +    }
> +
> +    /// Returns a byte slice view of the mapping.
> +    pub fn as_slice(&self) -> &[u8] {
> +        // SAFETY: The vmap maps valid memory up to the owner size
> +        unsafe { slice::from_raw_parts(self.as_ptr().cast(), =
self.owner.size()) }
> +    }

I think what we are seeing here is the same issue with the dma code.

If we are going to offer slices (which we definitely should!), then IMHO =
one of those should apply:

a) The functions are unsafe or,
b) There can only be one VMap object.

IIUC, it=E2=80=99s trivial to get two VMaps in the current code and then =
call
as_mut_slice() on each of them, which technically grants mutable access =
to the
same memory region.

> +
> +    /// Returns mutable a byte slice view of the mapping.
> +    pub fn as_mut_slice(&mut self) -> &mut [u8] {
> +        // SAFETY: The vmap maps valid memory up to the owner size
> +        unsafe { slice::from_raw_parts_mut(self.as_mut_ptr().cast(), =
self.owner.size()) }
> +    }
> +
> +    /// Borrows a reference to the object that owns this virtual =
mapping.
> +    pub fn owner(&self) -> &Object<T> {
> +        &self.owner
> +    }
> +}
> +
> +impl<T: DriverObject> Drop for VMap<T> {
> +    fn drop(&mut self) {
> +        // SAFETY:
> +        // - This function is safe to call with the DMA reservation =
lock held
> +        // - Our `ARef` is proof that the underlying gem object here =
is initialized and thus safe to
> +        //   dereference.
> +        unsafe {
> +            let resv =3D self.owner.raw_dma_resv();
> +
> +            // TODO: see top of file

Note: Onur is working on ww_mutexes, and IMHO his latest patches [0] =
seem to be
converging towards the API we want . We should perhaps check whether his =
work
is a good fit here?

> +            bindings::dma_resv_lock(resv, core::ptr::null_mut());
> +            =
bindings::drm_gem_shmem_vunmap_locked(self.owner.as_shmem(), &mut =
self.map);
> +            bindings::dma_resv_unlock(resv);
> +        }
> +    }
> +}
> +
> +/// SAFETY: `iosys_map` objects are safe to send across threads.
> +unsafe impl<T: DriverObject> Send for VMap<T> {}
> +/// SAFETY: `iosys_map` objects are safe to send across threads.
> +unsafe impl<T: DriverObject> Sync for VMap<T> {}
> --=20
> 2.50.0
>=20

[0]: =
https://lore.kernel.org/rust-for-linux/20250903131313.4365-1-work@onurozka=
n.dev/

