Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7244A53DEE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3336B10E79A;
	Wed,  5 Mar 2025 23:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M35huzuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F1A10E747
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t9G2Y/B8oV7JE32hgCTUV0vmO4Ma4WWVkNyK9m/56k4=;
 b=M35huzuuD5Pjn6T5XZq1bCEFTcsED5lQIzgsCwdWRVWjkGm3BpclFootTM2Asv+wEhSvcI
 AumJYSqQhSHu51ftlSf4s1HQS746Xgo6YNi8OYoxcUd7fbidHeo6r7XVk4Oioe+30s3U59
 sxXBssepKKMKCOKneEtawcFgMm5P/Lc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-152-fn86Z4c_Pd6p_StcYfz-ew-1; Wed,
 05 Mar 2025 18:04:55 -0500
X-MC-Unique: fn86Z4c_Pd6p_StcYfz-ew-1
X-Mimecast-MFC-AGG-ID: fn86Z4c_Pd6p_StcYfz-ew_1741215893
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D209B1955F30; Wed,  5 Mar 2025 23:04:51 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9AC0E300019E; Wed,  5 Mar 2025 23:04:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 03/33] rust: drm/kms: Introduce the main ModeConfigObject
 traits
Date: Wed,  5 Mar 2025 17:59:19 -0500
Message-ID: <20250305230406.567126-4-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

The KMS API has a very consistent idea of a "mode config object", which
includes any object with a drm_mode_object struct embedded in it. These
objects have their own object IDs which DRM exposes to userspace, and we
introduce the ModeConfigObject trait to represent any object matching these
characteristics.

One slightly less consistent trait of these objects however: some mode
objects have a reference count, while others don't. Since rust requires
that we are able to define the lifetime of an object up-front, we introduce
two other super-traits of ModeConfigObject for this:

* StaticModeObject - this trait represents any mode object which does not
  have a reference count of its own. Such objects can be considered to
  share the lifetime of their parent KMS device
* RcModeObject - this trait represents any mode object which does have its
  own reference count. Objects implementing this trait get a free blanket
  implementation of AlwaysRefCounted, and as such can be used with the ARef
  container without us having to implement AlwaysRefCounted for each
  individual mode object.

This will be able to handle most lifetimes we'll need with one exception:
it's entirely possible a driver may want to hold a "owned" reference to a
static mode object. We allow for this by introducing the KmsRef container,
which grabs an owned refcount to the parent KMS device of a
StaticModeObject and holds a pointer to said object - essentially allowing
it to act identically to an owned refcount by preventing the device's
lifetime from ending until the KmsRef is dropped. I choose not to use
AlwaysRefCounted for this as holding a refcount to the device has its own
set of implications since if you forget to drop the KmsRef the device will
never be destroyed.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Document why modesetting objects require Send + Sync
* Make `ModeObject` an unsafe trait
  I was prompted to make this change in response to one of Daniel's
  comments, as it occurred to me that we need something that ensures that
  implementers are only returning valid `drm_mode_object` pointers so we
  have something to put down for the various related safety comments in
  RcModeObject.
  Also, update the safety comments there.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms.rs | 127 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 78970c69f4cda..885bd5266a2d7 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -7,10 +7,11 @@
     drm::{device::Device, drv::Driver},
     error::to_result,
     prelude::*,
+    private::Sealed,
     types::*,
 };
 use bindings;
-use core::{marker::PhantomData, ops::Deref};
+use core::{marker::PhantomData, ops::Deref, ptr::NonNull};
 
 /// The C vtable for a [`Device`].
 ///
@@ -184,3 +185,127 @@ pub struct ModeConfigInfo {
     /// An optional default fourcc format code to be preferred for clients.
     pub preferred_fourcc: Option<u32>,
 }
+
+/// A modesetting object in DRM.
+///
+/// This is any type of object where the underlying C object contains a [`struct drm_mode_object`].
+/// This type requires [`Send`] + [`Sync`] as all modesetting objects in DRM are able to be sent
+/// between threads.
+///
+/// This type is only implemented by the DRM crate itself.
+///
+/// # Safety
+///
+/// [`raw_mode_obj()`] must always return a valid pointer to an initialized
+/// [`struct drm_mode_object`].
+///
+/// [`struct drm_mode_object`]: srctree/include/drm/drm_mode_object.h
+/// [`raw_mode_obj()`]: ModeObject::raw_mode_obj()
+pub unsafe trait ModeObject: Sealed + Send + Sync {
+    /// The parent driver for this [`ModeObject`].
+    type Driver: KmsDriver;
+
+    /// Return the [`Device`] for this [`ModeObject`].
+    fn drm_dev(&self) -> &Device<Self::Driver>;
+
+    /// Return a pointer to the [`struct drm_mode_object`] for this [`ModeObject`].
+    ///
+    /// [`struct drm_mode_object`]: (srctree/include/drm/drm_mode_object.h)
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object;
+}
+
+/// A trait for modesetting objects which don't come with their own reference-counting.
+///
+/// Some [`ModeObject`] types in DRM do not have a reference count. These types are considered
+/// "static" and share the lifetime of their parent [`Device`]. To retrieve an owned reference to
+/// such types, see [`KmsRef`].
+///
+/// # Safety
+///
+/// This trait must only be implemented for modesetting objects which do not have a refcount within
+/// their [`struct drm_mode_object`], otherwise [`KmsRef`] can't guarantee the object will stay
+/// alive.
+///
+/// [`struct drm_mode_object`]: (srctree/include/drm/drm_mode_object.h)
+pub unsafe trait StaticModeObject: ModeObject {}
+
+/// An owned reference to a [`StaticModeObject`].
+///
+/// Note that since [`StaticModeObject`] types share the lifetime of their parent [`Device`], the
+/// parent [`Device`] will stay alive as long as this type exists. Thus, users should be aware that
+/// storing a [`KmsRef`] within a [`ModeObject`] is a circular reference.
+///
+/// # Invariants
+///
+/// `self.0` points to a valid instance of `T` throughout the lifetime of this type.
+pub struct KmsRef<T: StaticModeObject>(NonNull<T>);
+
+// SAFETY: Owned references to DRM device are thread-safe.
+unsafe impl<T: StaticModeObject> Send for KmsRef<T> {}
+// SAFETY: Owned references to DRM device are thread-safe.
+unsafe impl<T: StaticModeObject> Sync for KmsRef<T> {}
+
+impl<T: StaticModeObject> From<&T> for KmsRef<T> {
+    fn from(value: &T) -> Self {
+        // INVARIANT: Because the lifetime of the StaticModeObject is the same as the lifetime of
+        // its parent device, we can ensure that `value` remains alive by incrementing the device's
+        // reference count. The device will only disappear once we drop this reference in `Drop`.
+        value.drm_dev().inc_ref();
+
+        Self(value.into())
+    }
+}
+
+impl<T: StaticModeObject> Drop for KmsRef<T> {
+    fn drop(&mut self) {
+        // SAFETY: We're reclaiming the reference we leaked in From<&T>
+        drop(unsafe { ARef::from_raw(self.drm_dev().into()) })
+    }
+}
+
+impl<T: StaticModeObject> Deref for KmsRef<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: We're guaranteed object will point to a valid object as long as we hold dev
+        unsafe { self.0.as_ref() }
+    }
+}
+
+impl<T: StaticModeObject> Clone for KmsRef<T> {
+    fn clone(&self) -> Self {
+        // INVARIANT: Because the lifetime of the StaticModeObject is the same as the lifetime of
+        // its parent device, we can ensure that `value` remains alive by incrementing the device's
+        // reference count. The device will only disappear once we drop this reference in `Drop`.
+        self.drm_dev().inc_ref();
+
+        Self(self.0)
+    }
+}
+
+/// A trait for [`ModeObject`] which is reference counted.
+///
+/// This trait is implemented by DRM for any [`ModeObject`] which has a reference count provided by
+/// [`struct drm_mode_object`]. It provides a common implementation of [`AlwaysRefCounted`], since
+/// all [`RcModeObject`] types use the same functions for refcounting.
+///
+/// # Safety
+///
+/// The [`ModeObject`] must initialize the refcount in its [`struct drm_mode_object`] field.
+///
+/// [`struct drm_mode_object`]: (srctree/include/drm/drm_mode_object.h)
+pub unsafe trait RcModeObject: ModeObject {}
+
+unsafe impl<T: RcModeObject> AlwaysRefCounted for T {
+    fn inc_ref(&self) {
+        // SAFETY: We're guaranteed by the safety contract of `ModeObject` that `raw_mode_obj()`
+        // always returns a pointer to an initialized `drm_mode_object`.
+        unsafe { bindings::drm_mode_object_get(self.raw_mode_obj()) }
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: We're guaranteed by the safety contract of `ModeObject` that `raw_mode_obj()`
+        // always returns a pointer to an initialized `drm_mode_object`.
+        unsafe { bindings::drm_mode_object_put(obj.as_ref().raw_mode_obj()) }
+    }
+}
-- 
2.48.1

