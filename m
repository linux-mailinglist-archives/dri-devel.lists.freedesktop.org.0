Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA39D9E6A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 21:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451A410E9C0;
	Tue, 26 Nov 2024 20:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WBHFgiRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB02810E9C0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 20:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732653310; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d41CKAubd5L90gTgWCJQBtLtwpcTZlFqvUjYkFrqXiiU00ThSJfV2QtBcIVXiPK/6CCw97tpVR9tqdDqwfucR+V7kVW/Z5R1krfn2rGOMXakDwMQL392cBoK74jQD5HJemUr3PzkJ5H6pG7joQtQTq2Dg6pR82wv8ksxJiZhxfY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732653310;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SAJtL7Uot7Tvvtn5TFr/p1Mn40JIW9WD6CuXpqLxZAY=; 
 b=AGde0CyTeA4rr1E7VxgoJ7LYTjH52zK90bzjRFnfrApO9NPI81TwuCRchYYiPm6jOs6XIh+zOsVduoFBtSiQxW19xmk7gTxiVWQq0YSqDxjCmP6h9Thq7Yk1BGXbZEUDjLW76IFxibH7uoOEppRq8L7vWOdLmUobT9R5xCHZqVU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732653310; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=SAJtL7Uot7Tvvtn5TFr/p1Mn40JIW9WD6CuXpqLxZAY=;
 b=WBHFgiRklD+93GzjOJFOjK31F8UnV2wY6LiY5nmux0uute+Y+xdyPSJoh0OTUAVW
 b3v4HnMq4b8q1P/VaNKOMbwfDXO05qA1D2zJF1REiOw+ZfBMGDwQABktRxoLx5y83x9
 ACGas3AMdCdtf0WsSGf0NN89gkYoe2Mwy5kCWd6c=
Received: by mx.zohomail.com with SMTPS id 1732653306963110.44702479474108;
 Tue, 26 Nov 2024 12:35:06 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 04/35] rust: drm/kms: Introduce the main
 ModeConfigObject traits
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-5-lyude@redhat.com>
Date: Tue, 26 Nov 2024 17:34:50 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4D4D46ED-62C0-4B6A-A560-68D5F546AE21@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-5-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.200.121)
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

> On 30 Sep 2024, at 20:09, Lyude Paul <lyude@redhat.com> wrote:
>=20
> The KMS API has a very consistent idea of a "mode config object", =
which
> includes any object with a drm_mode_object struct embedded in it. =
These
> objects have their own object IDs which DRM exposes to userspace, and =
we
> introduce the ModeConfigObject trait to represent any object matching =
these
> characteristics.
>=20
> One slightly less consistent trait of these objects however: some mode
> objects have a reference count, while others don't. Since rust =
requires
> that we are able to define the lifetime of an object up-front, we =
introduce
> two other super-traits of ModeConfigObject for this:
>=20
> * StaticModeObject - this trait represents any mode object which does =
not
>  have a reference count of its own. Such objects can be considered to
>  share the lifetime of their parent KMS device
> * RcModeObject - this trait represents any mode object which does have =
its
>  own reference count. Objects implementing this trait get a free =
blanket
>  implementation of AlwaysRefCounted, and as such can be used with the =
ARef
>  container without us having to implement AlwaysRefCounted for each
>  individual mode object.
>=20
> This will be able to handle most lifetimes we'll need with one =
exception:
> it's entirely possible a driver may want to hold a "owned" reference =
to a
> static mode object. We allow for this by introducing the KmsRef =
container,
> which grabs an owned refcount to the parent KMS device of a
> StaticModeObject and holds a pointer to said object - essentially =
allowing
> it to act identically to an owned refcount by preventing the device's
> lifetime from ending until the KmsRef is dropped. I choose not to use
> AlwaysRefCounted for this as holding a refcount to the device has its =
own
> set of implications since if you forget to drop the KmsRef the device =
will
> never be destroyed.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/bindings/bindings_helper.h |   1 +
> rust/kernel/drm/kms.rs          | 107 ++++++++++++++++++++++++++++++++
> 2 files changed, 108 insertions(+)
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index 9803e0ecac7c1..ba1871b05b7fa 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -17,6 +17,7 @@
> #include <drm/drm_gem.h>
> #include <drm/drm_gem_framebuffer_helper.h>
> #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_mode_object.h>
> #include <drm/drm_ioctl.h>
> #include <kunit/test.h>
> #include <linux/blk-mq.h>
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index d3558a5eccc54..f1a8ba4b7e296 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -228,3 +228,110 @@ impl<T, K> KmsDriver for T
> where
>     T: Driver<Kms =3D K>,
>     K: Kms<Driver =3D T> {}
> +
> +/// A modesetting object in DRM.
> +///
> +/// This is any type of object where the underlying C object contains =
a [`struct drm_mode_object`].
> +///
> +/// [`struct drm_mode_object`]: srctree/include/drm/drm_mode_object.h
> +pub trait ModeObject: Sealed + Send + Sync {

Can you briefly document why these bounds are needed?

> +    /// The parent driver for this [`ModeObject`].
> +    type Driver: KmsDriver;
> +
> +    /// Return the [`Device`] for this [`ModeObject`].
> +    fn drm_dev(&self) -> &Device<Self::Driver>;
> +
> +    /// Return a pointer to the [`struct drm_mode_object`] for this =
[`ModeObject`].
> +    ///
> +    /// [`struct drm_mode_object`]: =
(srctree/include/drm/drm_mode_object.h)
> +    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object;
> +}
> +
> +/// A trait for modesetting objects which don't come with their own =
reference-counting.
> +///
> +/// Some [`ModeObject`] types in DRM do not have a reference count. =
These types are considered
> +/// "static" and share the lifetime of their parent [`Device`]. To =
retrieve an owned reference to
> +/// such types, see [`KmsRef`].
> +///
> +/// # Safety
> +///
> +/// This trait must only be implemented for modesetting objects which =
do not have a refcount within
> +/// their [`struct drm_mode_object`], otherwise [`KmsRef`] can't =
guarantee the object will stay
> +/// alive.
> +///
> +/// [`struct drm_mode_object`]: =
(srctree/include/drm/drm_mode_object.h)
> +pub unsafe trait StaticModeObject: ModeObject {}
> +
> +/// An owned reference to a [`StaticModeObject`].
> +///
> +/// Note that since [`StaticModeObject`] types share the lifetime of =
their parent [`Device`], the
> +/// parent [`Device`] will stay alive as long as this type exists. =
Thus, users should be aware that
> +/// storing a [`KmsRef`] within a [`ModeObject`] is a circular =
reference.
> +///
> +/// # Invariants
> +///
> +/// `self.0` points to a valid instance of `T` throughout the =
lifetime of this type.
> +pub struct KmsRef<T: StaticModeObject>(NonNull<T>);
> +
> +// SAFETY: Owned references to DRM device are thread-safe.
> +unsafe impl<T: StaticModeObject> Send for KmsRef<T> {}
> +unsafe impl<T: StaticModeObject> Sync for KmsRef<T> {}
> +
> +impl<T: StaticModeObject> From<&T> for KmsRef<T> {
> +    fn from(value: &T) -> Self {
> +        // We will drop the reference we leak here in Drop
> +        value.drm_dev().inc_ref();
> +
> +        Self(value.into())
> +    }
> +}
> +
> +impl<T: StaticModeObject> Drop for KmsRef<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: We're reclaiming the reference we leaked in =
From<&T>
> +        drop(unsafe { ARef::from_raw(self.drm_dev().into()) })
> +    }
> +}
> +
> +impl<T: StaticModeObject> Deref for KmsRef<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: We're guaranteed object will point to a valid =
object as long as we hold dev
> +        unsafe { self.0.as_ref() }
> +    }
> +}
> +
> +impl<T: StaticModeObject> Clone for KmsRef<T> {
> +    fn clone(&self) -> Self {
> +        self.drm_dev().inc_ref();
> +
> +        Self(self.0)
> +    }
> +}
> +
> +/// A trait for [`ModeObject`] which is reference counted.
> +///
> +/// This trait is implemented by DRM for any [`ModeObject`] which has =
a reference count provided by
> +/// [`struct drm_mode_object`]. It provides a common implementation =
of [`AlwaysRefCounted`], since
> +/// all [`RcModeObject`] types use the same functions for =
refcounting.
> +///
> +/// # Safety
> +///
> +/// The [`ModeObject`] must initialize the refcount in its [`struct =
drm_mode_object`] field.
> +///
> +/// [`struct drm_mode_object`]: =
(srctree/include/drm/drm_mode_object.h)
> +pub unsafe trait RcModeObject: ModeObject {}
> +
> +unsafe impl<T: RcModeObject> AlwaysRefCounted for T {
> +    fn inc_ref(&self) {
> +        // SAFETY: FFI call with no special requirements
> +        unsafe { bindings::drm_mode_object_get(self.raw_mode_obj()) }

Well, at least the pointer has to be valid. I assume that passing =
core::ptr::null_mut() here will crash,
for example. Also, do we have to worry about races? T is Sync, so I =
assume you mean to have
this call reachable from multiple threads.

The kref docs seem to indicate this is not a problem:

```
This way, it doesn=E2=80=99t matter what order the two threads handle =
the data, the kref_put() handles knowing when the data is not referenced =
any more and releasing it. The kref_get() does not require a lock, since =
we already have a valid pointer that we own a refcount for. The put =
needs no lock because nothing tries to get the data without already =
holding a pointer.
```

Regardless, IMHO it=E2=80=99s good to document it here as well.
=20
> +    }
> +
> +    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> +        // SAFETY: We never expose modesetting objects in our =
interfaces to users before they're
> +        // initialized
> +        unsafe { =
bindings::drm_mode_object_put(obj.as_ref().raw_mode_obj()) }

Same here, pointer must be valid.

> +    }
> +}
> --=20
> 2.46.1
>=20
>=20

=E2=80=94 Daniel

