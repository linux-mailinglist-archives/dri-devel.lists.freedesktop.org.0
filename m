Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCBA53E26
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C338010E861;
	Wed,  5 Mar 2025 23:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DIb9xQyg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D09110E861
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIJKMPeeyjM+BCdj2obTh0M4U7dhUYRDeftthaamkpQ=;
 b=DIb9xQyggwJHPlAmpXJl6UAx0rFte8srP2t9mOlNkEHQR92NnAPc2TdoWqCzf5slU8hDyB
 iGo2Emb5qz9W+xEgPKlXqdyjeVfROe89yCvKFrtXKq9GhSAqO9dApdCKYbrhzpzf35AcQn
 vzc4YyLsBH5dDTUyeFC4F4f49N5USLM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-Xq7aBEVQMQ-UyuNa0PK1UQ-1; Wed,
 05 Mar 2025 18:07:19 -0500
X-MC-Unique: Xq7aBEVQMQ-UyuNa0PK1UQ-1
X-Mimecast-MFC-AGG-ID: Xq7aBEVQMQ-UyuNa0PK1UQ_1741216037
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B7DDE180899B; Wed,  5 Mar 2025 23:07:16 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 55F4930001A1; Wed,  5 Mar 2025 23:07:12 +0000 (UTC)
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
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 18/33] rust: drm/kms: Add drm_atomic_state bindings
Date: Wed,  5 Mar 2025 17:59:34 -0500
Message-ID: <20250305230406.567126-19-lyude@redhat.com>
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

Next up is introducing bindings that we can use to represent the global DRM
atomic state, along with all of the various object states contained within.
We do this by introducing a few new concepts: borrowed states, atomic state
mutators, and atomic state composers.

To understand these, we need to quickly touch upon the general life of an
atomic commit. Assuming a driver does its own internal atomic commit, the
procedure looks something like this:

* Allocate a new atomic state
* Duplicate the atomic state of each mode object we want to mutate, and add
  the duplicated state to the new atomic state
* Check (possibly more then once) the atomic state, possibly modifying it
  along the way
* Commit the atomic state to software (we'll call this commit time). At
  this point no new objects can be added to the state
* Finish committing the atomic state to hardware asynchronously

With this in mind, we introduce AtomicStateMutator and AtomicStateComposer
(along with leaky variants intended for uses in FFI calls). An
AtomicStateMutator allows mutating an atomic state but does not allow for
adding new objects to the state. Subsequently, an AtomicStateComposer
allows for both mutating an atomic state and adding new mode objects. We
control when we expose each of these types in order to implement the
limitations required by the aforementioned example.

Note as well that AtomicStateComposer is intended to eventually be usable
directly by drivers. In this scenario, a driver will be able to create an
AtomicStateComposer (the equivalent of allocating an atomic state in C) and
then commit it by passing it to our DRM bindings by-value, insuring that
once the commit process begins it is impossible to keep using the
AtomicStateComposer.

The next part of this is allowing users to modify the atomic states of all
of the objects contained within an atomic state. Since it's an extremely
common usecase for objects to mutate the atomic state of multiple objects
at once in an unpredictable order, we need a mechanism that will allow us
to hand out &mut references to each state while ensuring at runtime that we
do not break rust's data aliasing rules (which disallow us from ever having
more then one &mut reference to the same piece of data).

We do this by introducing the concept of a "borrowed" state. This is a very
similar concept to RefCell, where it is ensured during runtime that when a
&mut reference is taken out another one cannot be created until the
corresponding Ref object has been dropped. Our equivalent Ref types are
ConnectorState, BorrowedCrtcState, and BorrowedPlaneStateMutator.

Each one of these types can be used in the same manner as a Ref - no
additional borrows for an atomic state may be taken until the existing one
has been dropped. Subsequently, all of these types implement their
respective AsRaw* and FromRaw* counter-parts - and allow dereferencing to
each driver-private data structure for fully qualified borrows (like
CrtcState<'a, CrtcStateMutator<T>>. This allows a pretty clean way of
mutating multiple states at once without ever breaking rust's mutability
rules.

We'll use all of these types over the next few commits to begin introducing
various atomic modeset callbacks to each mode object type.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Drop the TODO about printing a kernel error in ConnectorStateMutator
  I thought this was something we'd want early on in designing this, but
  since then I'm pretty sure we just want to return None - there are valid
  cases where we'd get None while doing connector iteration through an
  atomic state
* Improve safety comments in ConnectorStateMutator::new()
* Rename Borrowed*State to *StateMutator
  I think this makes things a lot clearer, as well - cleanup the
  documentation regarding this.
* Drop plane state iterator for now. It's not that we don't need this, it's
  just that I haven't actually finished writing these up for all types so
  I'd rather focus on that later now that we've demonstrated it's a thing
  that is possible. And it at least shouldn't be needed for getting these
  bindings/rvkms upstream.
* Drop num_plane() for the time being
  Without the plane state iterator in this patch series there's no current
  usecase for this, so just drop the function for the time being and we'll
  reintroduce it when it's ready.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/helpers/drm/atomic.c        |  32 +++
 rust/helpers/drm/drm.c           |   3 +
 rust/kernel/drm/kms.rs           |   1 +
 rust/kernel/drm/kms/atomic.rs    | 359 +++++++++++++++++++++++++++++++
 rust/kernel/drm/kms/connector.rs | 104 ++++++++-
 rust/kernel/drm/kms/crtc.rs      | 103 ++++++++-
 rust/kernel/drm/kms/plane.rs     | 105 ++++++++-
 7 files changed, 700 insertions(+), 7 deletions(-)
 create mode 100644 rust/helpers/drm/atomic.c
 create mode 100644 rust/kernel/drm/kms/atomic.rs

diff --git a/rust/helpers/drm/atomic.c b/rust/helpers/drm/atomic.c
new file mode 100644
index 0000000000000..fff70053f6943
--- /dev/null
+++ b/rust/helpers/drm/atomic.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_atomic.h>
+
+void rust_helper_drm_atomic_state_get(struct drm_atomic_state *state)
+{
+	drm_atomic_state_get(state);
+}
+
+void rust_helper_drm_atomic_state_put(struct drm_atomic_state *state)
+{
+	drm_atomic_state_put(state);
+}
+
+// Macros for generating one repetitive atomic state accessors (like drm_atomic_get_new_plane_state)
+#define STATE_FUNC(type, tense)                                                                     \
+	struct drm_ ## type ## _state *rust_helper_drm_atomic_get_ ## tense ## _ ## type ## _state( \
+		const struct drm_atomic_state *state,                                               \
+		struct drm_ ## type *type                                                           \
+	) {                                                                                         \
+		return drm_atomic_get_## tense ## _ ## type ## _state(state, type);                 \
+	}
+#define STATE_FUNCS(type) \
+	STATE_FUNC(type, new); \
+	STATE_FUNC(type, old);
+
+STATE_FUNCS(plane);
+STATE_FUNCS(crtc);
+STATE_FUNCS(connector);
+
+#undef STATE_FUNCS
+#undef STATE_FUNC
diff --git a/rust/helpers/drm/drm.c b/rust/helpers/drm/drm.c
index 028b8ab429572..365f6807774d4 100644
--- a/rust/helpers/drm/drm.c
+++ b/rust/helpers/drm/drm.c
@@ -1,5 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#ifdef CONFIG_DRM_KMS_HELPER
+#include "atomic.c"
+#endif
 #include "gem.c"
 #ifdef CONFIG_DRM_GEM_SHMEM_HELPER
 #include "gem_shmem_helper.c"
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 1d6ca9c92659a..978bb6712ffbe 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -2,6 +2,7 @@
 
 //! KMS driver abstractions for rust.
 
+pub mod atomic;
 pub mod connector;
 pub mod crtc;
 pub mod encoder;
diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
new file mode 100644
index 0000000000000..3d5c70dbc4274
--- /dev/null
+++ b/rust/kernel/drm/kms/atomic.rs
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! [`struct drm_atomic_state`] related bindings for rust.
+//!
+//! [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
+use super::{connector::*, crtc::*, plane::*, KmsDriver, ModeObject};
+use crate::{
+    bindings,
+    drm::device::Device,
+    error::{from_err_ptr, to_result},
+    prelude::*,
+    types::*,
+};
+use core::{cell::Cell, marker::*, mem::ManuallyDrop, ops::*, ptr::NonNull};
+
+/// The main wrapper around [`struct drm_atomic_state`].
+///
+/// This type is usually embedded within another interface such as an [`AtomicStateMutator`].
+///
+/// # Invariants
+///
+/// - The data layout of this type is identical to [`struct drm_atomic_state`].
+/// - `state` is initialized for as long as this type is exposed to users.
+///
+/// [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
+#[repr(transparent)]
+pub struct AtomicState<T: KmsDriver> {
+    pub(super) state: Opaque<bindings::drm_atomic_state>,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> AtomicState<T> {
+    /// Reconstruct an immutable reference to an atomic state from the given pointer
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to a valid initialized instance of [`struct drm_atomic_state`].
+    ///
+    /// [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
+    #[allow(dead_code)]
+    pub(super) unsafe fn from_raw<'a>(ptr: *const bindings::drm_atomic_state) -> &'a Self {
+        // SAFETY: Our data layout is identical
+        // INVARIANT: Our safety contract upholds the guarantee that `state` is initialized for as
+        // long as this type is exposed to users.
+        unsafe { &*ptr.cast() }
+    }
+
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_state {
+        self.state.get()
+    }
+
+    /// Return the [`Device`] associated with this [`AtomicState`].
+    pub fn drm_dev(&self) -> &Device<T> {
+        // SAFETY:
+        // - `state` is initialized via our type invariants.
+        // - `dev` is invariant throughout the lifetime of `AtomicState`
+        unsafe { Device::borrow((*self.state.get()).dev) }
+    }
+
+    /// Return the old atomic state for `crtc`, if it is present within this [`AtomicState`].
+    pub fn get_old_crtc_state<C>(&self, crtc: &C) -> Option<&C::State>
+    where
+        C: ModesettableCrtc + ModeObject<Driver = T>,
+    {
+        // SAFETY: This function either returns NULL or a valid pointer to a `drm_crtc_state`
+        unsafe {
+            bindings::drm_atomic_get_old_crtc_state(self.as_raw(), crtc.as_raw())
+                .as_ref()
+                .map(|p| C::State::from_raw(p))
+        }
+    }
+
+    /// Return the old atomic state for `plane`, if it is present within this [`AtomicState`].
+    pub fn get_old_plane_state<P>(&self, plane: &P) -> Option<&P::State>
+    where
+        P: ModesettablePlane + ModeObject<Driver = T>,
+    {
+        // SAFETY: This function either returns NULL or a valid pointer to a `drm_plane_state`
+        unsafe {
+            bindings::drm_atomic_get_old_plane_state(self.as_raw(), plane.as_raw())
+                .as_ref()
+                .map(|p| P::State::from_raw(p))
+        }
+    }
+
+    /// Return the old atomic state for `connector` if it is present within this [`AtomicState`].
+    pub fn get_old_connector_state<C>(&self, connector: &C) -> Option<&C::State>
+    where
+        C: ModesettableConnector + ModeObject<Driver = T>,
+    {
+        // SAFETY: This function either returns NULL or a valid pointer to a `drm_connector_state`.
+        unsafe {
+            bindings::drm_atomic_get_old_connector_state(self.as_raw(), connector.as_raw())
+                .as_ref()
+                .map(|p| C::State::from_raw(p))
+        }
+    }
+}
+
+// SAFETY: DRM atomic state objects are always reference counted and the get/put functions satisfy
+// the requirements.
+unsafe impl<T: KmsDriver> AlwaysRefCounted for AtomicState<T> {
+    fn inc_ref(&self) {
+        // SAFETY: `state` is initialized for as long as this type is exposed to users
+        unsafe { bindings::drm_atomic_state_get(self.state.get()) }
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: `obj` contains a valid non-null pointer to an initialized `Self`.
+        unsafe { bindings::drm_atomic_state_put(obj.as_ptr().cast()) }
+    }
+}
+
+/// A smart-pointer for modifying the contents of an atomic state.
+///
+/// As it's not unreasonable for a modesetting driver to want to have references to the state of
+/// multiple modesetting objects at once, along with mutating multiple states for unique modesetting
+/// objects at once, this type provides a mechanism for safely doing both of these things.
+///
+/// To honor Rust's aliasing rules regarding mutable references, this structure ensures only one
+/// mutable reference to a mode object's atomic state may exist at a time - and refuses to provide
+/// another if one has already been taken out using runtime checks.
+pub struct AtomicStateMutator<T: KmsDriver> {
+    /// The state being mutated. Note that the use of `ManuallyDrop` here is because mutators are
+    /// only constructed in FFI callbacks and thus borrow their references to the atomic state from
+    /// DRM. Composers, which make use of mutators internally, can potentially be owned by rust code
+    /// if a driver is performing an atomic commit internally - and thus will call the drop
+    /// implementation here.
+    state: ManuallyDrop<ARef<AtomicState<T>>>,
+
+    /// Bitmask of borrowed CRTC state objects
+    pub(super) borrowed_crtcs: Cell<u32>,
+    /// Bitmask of borrowed plane state objects
+    pub(super) borrowed_planes: Cell<u32>,
+    /// Bitmask of borrowed connector state objects
+    pub(super) borrowed_connectors: Cell<u32>,
+}
+
+impl<T: KmsDriver> AtomicStateMutator<T> {
+    /// Construct a new [`AtomicStateMutator`]
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to a valid `drm_atomic_state`
+    #[allow(dead_code)]
+    pub(super) unsafe fn new(ptr: NonNull<bindings::drm_atomic_state>) -> Self {
+        Self {
+            // SAFETY: The data layout of `AtomicState<T>` is identical to drm_atomic_state
+            // We use `ManuallyDrop` because `AtomicStateMutator` is only ever provided to users in
+            // the context of KMS callbacks. As such, skipping ref inc/dec for the atomic state is
+            // convienent for our bindings.
+            state: ManuallyDrop::new(unsafe { ARef::from_raw(ptr.cast()) }),
+            borrowed_planes: Cell::default(),
+            borrowed_crtcs: Cell::default(),
+            borrowed_connectors: Cell::default(),
+        }
+    }
+
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_state {
+        self.state.as_raw()
+    }
+
+    /// Return the [`Device`] for this [`AtomicStateMutator`].
+    pub fn drm_dev(&self) -> &Device<T> {
+        self.state.drm_dev()
+    }
+
+    /// Retrieve the last committed atomic state for `crtc` if `crtc` has already been added to the
+    /// atomic state being composed.
+    ///
+    /// Returns `None` otherwise.
+    pub fn get_old_crtc_state<C>(&self, crtc: &C) -> Option<&C::State>
+    where
+        C: ModesettableCrtc + ModeObject<Driver = T>,
+    {
+        self.state.get_old_crtc_state(crtc)
+    }
+
+    /// Retrieve the last committed atomic state for `connector` if `connector` has already been
+    /// added to the atomic state being composed.
+    ///
+    /// Returns `None` otherwise.
+    pub fn get_old_connector_state<C>(&self, connector: &C) -> Option<&C::State>
+    where
+        C: ModesettableConnector + ModeObject<Driver = T>,
+    {
+        self.state.get_old_connector_state(connector)
+    }
+
+    /// Retrieve the last committed atomic state for `plane` if `plane` has already been added to
+    /// the atomic state being composed.
+    ///
+    /// Returns `None` otherwise.
+    pub fn get_old_plane_state<P>(&self, plane: &P) -> Option<&P::State>
+    where
+        P: ModesettablePlane + ModeObject<Driver = T>,
+    {
+        self.state.get_old_plane_state(plane)
+    }
+
+    /// Return a composer for `plane`s new atomic state if it was previously added to the atomic
+    /// state being composed.
+    ///
+    /// Returns `None` otherwise, or if another mutator still exists for this state.
+    pub fn get_new_crtc_state<C>(&self, crtc: &C) -> Option<CrtcStateMutator<'_, C::State>>
+    where
+        C: ModesettableCrtc + ModeObject<Driver = T>,
+    {
+        // SAFETY: DRM either returns NULL or a valid pointer to a `drm_crtc_state`
+        let state =
+            unsafe { bindings::drm_atomic_get_new_crtc_state(self.as_raw(), crtc.as_raw()) };
+
+        CrtcStateMutator::<C::State>::new(self, NonNull::new(state)?)
+    }
+
+    /// Return a composer for `plane`s new atomic state if it was previously added to the atomic
+    /// state being composed.
+    ///
+    /// Returns `None` otherwise, or if another mutator still exists for this state.
+    pub fn get_new_plane_state<P>(&self, plane: &P) -> Option<PlaneStateMutator<'_, P::State>>
+    where
+        P: ModesettablePlane + ModeObject<Driver = T>,
+    {
+        // SAFETY: DRM either returns NULL or a valid pointer to a `drm_plane_state`.
+        let state =
+            unsafe { bindings::drm_atomic_get_new_plane_state(self.as_raw(), plane.as_raw()) };
+
+        PlaneStateMutator::<P::State>::new(self, NonNull::new(state)?)
+    }
+
+    /// Return a composer for `crtc`s new atomic state if it was previously added to the atomic
+    /// state being composed.
+    ///
+    /// Returns `None` otherwise, or if another mutator still exists for this state.
+    pub fn get_new_connector_state<C>(
+        &self,
+        connector: &C,
+    ) -> Option<ConnectorStateMutator<'_, C::State>>
+    where
+        C: ModesettableConnector + ModeObject<Driver = T>,
+    {
+        // SAFETY: DRM either returns NULL or a valid pointer to a `drm_connector_state`
+        let state = unsafe {
+            bindings::drm_atomic_get_new_connector_state(self.as_raw(), connector.as_raw())
+        };
+
+        ConnectorStateMutator::<C::State>::new(self, NonNull::new(state)?)
+    }
+}
+
+/// An [`AtomicStateMutator`] wrapper which is not yet part of any commit operation.
+///
+/// Since it's not yet part of a commit operation, new mode objects may be added to the state. It
+/// also holds a reference to the underlying [`AtomicState`] that will be released when this object
+/// is dropped.
+pub struct AtomicStateComposer<T: KmsDriver>(AtomicStateMutator<T>);
+
+impl<T: KmsDriver> Deref for AtomicStateComposer<T> {
+    type Target = AtomicStateMutator<T>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl<T: KmsDriver> Drop for AtomicStateComposer<T> {
+    fn drop(&mut self) {
+        // SAFETY: We're in drop, so this is guaranteed to be the last possible reference
+        unsafe { ManuallyDrop::drop(&mut self.0.state) }
+    }
+}
+
+impl<T: KmsDriver> AtomicStateComposer<T> {
+    /// # Safety
+    ///
+    /// The caller guarantees that `ptr` points to a valid instance of `drm_atomic_state`.
+    #[allow(dead_code)]
+    pub(crate) unsafe fn new(ptr: NonNull<bindings::drm_atomic_state>) -> Self {
+        // SAFETY: see `AtomicStateMutator::from_raw()`
+        Self(unsafe { AtomicStateMutator::new(ptr) })
+    }
+
+    /// Attempt to add the state for `crtc` to the atomic state for this composer if it hasn't
+    /// already been added, and create a mutator for it.
+    ///
+    /// If a composer already exists for this `crtc`, this function returns `Error(EBUSY)`. If
+    /// attempting to add the state fails, another error code will be returned.
+    pub fn add_crtc_state<C>(&self, crtc: &C) -> Result<CrtcStateMutator<'_, C::State>>
+    where
+        C: ModesettableCrtc + ModeObject<Driver = T>,
+    {
+        // SAFETY: DRM will only return a valid pointer to a `drm_crtc_state` - or an error.
+        let state = unsafe {
+            from_err_ptr(bindings::drm_atomic_get_crtc_state(
+                self.as_raw(),
+                crtc.as_raw(),
+            ))
+            .map(|c| NonNull::new_unchecked(c))
+        }?;
+
+        CrtcStateMutator::<C::State>::new(self, state).ok_or(EBUSY)
+    }
+
+    /// Attempt to add the state for `plane` to the atomic state for this composer if it hasn't
+    /// already been added, and create a mutator for it.
+    ///
+    /// If a composer already exists for this `plane`, this function returns `Error(EBUSY)`. If
+    /// attempting to add the state fails, another error code will be returned.
+    pub fn add_plane_state<P>(&self, plane: &P) -> Result<PlaneStateMutator<'_, P::State>>
+    where
+        P: ModesettablePlane + ModeObject<Driver = T>,
+    {
+        // SAFETY: DRM will only return a valid pointer to a `drm_plane_state` - or an error.
+        let state = unsafe {
+            from_err_ptr(bindings::drm_atomic_get_plane_state(
+                self.as_raw(),
+                plane.as_raw(),
+            ))
+            .map(|p| NonNull::new_unchecked(p))
+        }?;
+
+        PlaneStateMutator::<P::State>::new(self, state).ok_or(EBUSY)
+    }
+
+    /// Attempt to add the state for `connector` to the atomic state for this composer if it hasn't
+    /// already been added, and create a mutator for it.
+    ///
+    /// If a composer already exists for this `connector`, this function returns `Error(EBUSY)`. If
+    /// attempting to add the state fails, another error code will be returned.
+    pub fn add_connector_state<C>(
+        &self,
+        connector: &C,
+    ) -> Result<ConnectorStateMutator<'_, C::State>>
+    where
+        C: ModesettableConnector + ModeObject<Driver = T>,
+    {
+        // SAFETY: DRM will only return a valid pointer to a `drm_plane_state` - or an error.
+        let state = unsafe {
+            from_err_ptr(bindings::drm_atomic_get_connector_state(
+                self.as_raw(),
+                connector.as_raw(),
+            ))
+            .map(|c| NonNull::new_unchecked(c))
+        }?;
+
+        ConnectorStateMutator::<C::State>::new(self, state).ok_or(EBUSY)
+    }
+
+    /// Attempt to add any planes affected by changes on `crtc` to this [`AtomicStateComposer`].
+    ///
+    /// Will return an [`Error`] if this fails.
+    pub fn add_affected_planes<C>(&self, crtc: &C) -> Result
+    where
+        C: ModesettableCrtc + ModeObject<Driver = T>,
+    {
+        // SAFETY: Both .as_raw() values are guaranteed to return a valid pointer
+        to_result(unsafe { bindings::drm_atomic_add_affected_planes(self.as_raw(), crtc.as_raw()) })
+    }
+}
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 4521643d19749..4435eebd60202 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -4,7 +4,9 @@
 //!
 //! C header: [`include/drm/drm_connector.h`](srctree/include/drm/drm_connector.h)
 
-use super::{encoder::*, KmsDriver, ModeConfigGuard, ModeObject, ModeObjectVtable, RcModeObject};
+use super::{
+    atomic::*, encoder::*, KmsDriver, ModeConfigGuard, ModeObject, ModeObjectVtable, RcModeObject,
+};
 use crate::{
     alloc::KBox,
     bindings,
@@ -16,10 +18,11 @@
     types::{NotThreadSafe, Opaque},
 };
 use core::{
+    cell::Cell,
     marker::*,
     mem::{self, ManuallyDrop},
     ops::*,
-    ptr::{addr_of_mut, null_mut},
+    ptr::{addr_of_mut, null_mut, NonNull},
     stringify,
 };
 use macros::{paste, pin_data};
@@ -824,6 +827,103 @@ fn vtable(&self) -> *const Self::Vtable {
     }
 }
 
+/// An interface for mutating a [`Connector`]s atomic state.
+///
+/// This type is typically returned by an [`AtomicStateMutator`] within contexts where it is
+/// possible to safely mutate a connector's state. In order to uphold rust's data-aliasing rules,
+/// only [`ConnectorStateMutator`] may exist at a time.
+pub struct ConnectorStateMutator<'a, T: FromRawConnectorState> {
+    state: &'a mut T,
+    mask: &'a Cell<u32>,
+}
+
+impl<'a, T: FromRawConnectorState> ConnectorStateMutator<'a, T> {
+    pub(super) fn new<D: KmsDriver>(
+        mutator: &'a AtomicStateMutator<D>,
+        state: NonNull<bindings::drm_connector_state>,
+    ) -> Option<Self> {
+        // SAFETY:
+        // - `connector` is invariant throughout the lifetime of the atomic state.
+        // - `state` is initialized by the time it is passed to this function.
+        // - We're guaranteed that `state` is compatible with `drm_connector` by type invariants.
+        let connector = unsafe { T::Connector::from_raw((*state.as_ptr()).connector) };
+        let conn_mask = connector.mask();
+        let borrowed_mask = mutator.borrowed_connectors.get();
+
+        if borrowed_mask & conn_mask == 0 {
+            mutator.borrowed_connectors.set(borrowed_mask | conn_mask);
+            Some(Self {
+                mask: &mutator.borrowed_connectors,
+                // SAFETY: We're guaranteed `state` is of `T` by type invariance, and we just
+                // confirmed by checking `borrowed_connectors` that no other mutable borrows have
+                // been taken out for `state`
+                state: unsafe { T::from_raw_mut(state.as_ptr()) },
+            })
+        } else {
+            None
+        }
+    }
+}
+
+impl<'a, T: DriverConnectorState> Deref for ConnectorStateMutator<'a, ConnectorState<T>> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.state.inner
+    }
+}
+
+impl<'a, T: DriverConnectorState> DerefMut for ConnectorStateMutator<'a, ConnectorState<T>> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.state.inner
+    }
+}
+
+impl<'a, T: FromRawConnectorState> Drop for ConnectorStateMutator<'a, T> {
+    fn drop(&mut self) {
+        let mask = self.state.connector().mask();
+        self.mask.set(self.mask.get() & !mask);
+    }
+}
+
+impl<'a, T: FromRawConnectorState> AsRawConnectorState for ConnectorStateMutator<'a, T> {
+    type Connector = T::Connector;
+}
+
+impl<'a, T: FromRawConnectorState> private::AsRawConnectorState for ConnectorStateMutator<'a, T> {
+    fn as_raw(&self) -> &bindings::drm_connector_state {
+        self.state.as_raw()
+    }
+
+    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_connector_state {
+        // SAFETY: We're bound by the same safety contract as this function
+        unsafe { self.state.as_raw_mut() }
+    }
+}
+
+// SAFETY: we inherit the safety guarantees of `T`
+unsafe impl<'a, T> ModeObjectVtable for ConnectorStateMutator<'a, T>
+where
+    T: FromRawConnectorState + ModeObjectVtable,
+{
+    type Vtable = T::Vtable;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        self.state.vtable()
+    }
+}
+
+impl<'a, T: DriverConnectorState> ConnectorStateMutator<'a, ConnectorState<T>> {
+    super::impl_from_opaque_mode_obj! {
+        fn <D, C>(ConnectorStateMutator<'a, OpaqueConnectorState<D>>) -> Self
+        where
+            T: DriverConnectorState<Connector = C>;
+        use
+            C as DriverConnector,
+            D as KmsDriver
+    }
+}
+
 unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverConnectorState>(
     connector: *mut bindings::drm_connector,
 ) -> *mut bindings::drm_connector_state {
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index bcdd452ff7b10..3b9c9d97fcf24 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -5,7 +5,8 @@
 //! C header: [`include/drm/drm_crtc.h`](srctree/include/drm/drm_crtc.h)
 
 use super::{
-    plane::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject, UnregisteredKmsDevice,
+    atomic::*, plane::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject,
+    UnregisteredKmsDevice,
 };
 use crate::{
     alloc::KBox,
@@ -18,11 +19,11 @@
     types::{NotThreadSafe, Opaque},
 };
 use core::{
-    cell::UnsafeCell,
+    cell::{Cell, UnsafeCell},
     marker::*,
     mem,
     ops::{Deref, DerefMut},
-    ptr::{addr_of_mut, null, null_mut},
+    ptr::{addr_of_mut, null, null_mut, NonNull},
 };
 use macros::vtable;
 
@@ -667,6 +668,102 @@ fn vtable(&self) -> *const Self::Vtable {
     }
 }
 
+/// An interface for mutating a [`Crtc`]s atomic state.
+///
+/// This type is typically returned by an [`AtomicStateMutator`] within contexts where it is
+/// possible to safely mutate a plane's state. In order to uphold rust's data-aliasing rules, only
+/// [`CrtcStateMutator`] may exist at a time.
+///
+/// # Invariants
+///
+/// `self.state` always points to a valid instance of a [`FromRawCrtcState`] object.
+pub struct CrtcStateMutator<'a, T: FromRawCrtcState> {
+    state: NonNull<T>,
+    mask: &'a Cell<u32>,
+}
+
+impl<'a, T: FromRawCrtcState> CrtcStateMutator<'a, T> {
+    pub(super) fn new<D: KmsDriver>(
+        mutator: &'a AtomicStateMutator<D>,
+        state: NonNull<bindings::drm_crtc_state>,
+    ) -> Option<Self> {
+        // SAFETY: `crtc` is invariant throughout the lifetime of the atomic state, and always
+        // points to a valid `Crtc<T::Crtc>`
+        let crtc = unsafe { T::Crtc::from_raw((*state.as_ptr()).crtc) };
+        let crtc_mask = crtc.mask();
+        let borrowed_mask = mutator.borrowed_crtcs.get();
+
+        if borrowed_mask & crtc_mask == 0 {
+            mutator.borrowed_crtcs.set(borrowed_mask | crtc_mask);
+            Some(Self {
+                mask: &mutator.borrowed_crtcs,
+                state: state.cast(),
+            })
+        } else {
+            None
+        }
+    }
+}
+
+impl<'a, T: DriverCrtcState> CrtcStateMutator<'a, CrtcState<T>> {
+    super::impl_from_opaque_mode_obj! {
+        fn <D, C>(CrtcStateMutator<'a, OpaqueCrtcState<D>>) -> Self
+        where
+            T: DriverCrtcState<Crtc = C>;
+        use
+            T as DriverCrtc,
+            D as KmsDriver
+    }
+}
+
+impl<'a, T: FromRawCrtcState> Drop for CrtcStateMutator<'a, T> {
+    fn drop(&mut self) {
+        // SAFETY: Our interface is proof that we are the only ones with a reference to this data
+        let mask = unsafe { self.state.as_ref() }.crtc().mask();
+        self.mask.set(self.mask.get() & !mask);
+    }
+}
+
+impl<'a, T: DriverCrtcState> Deref for CrtcStateMutator<'a, CrtcState<T>> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Our interface ensures that `self.state.inner` follows rust's data-aliasing rules,
+        // so this is safe
+        unsafe { &*(*self.state.as_ptr()).inner.get() }
+    }
+}
+
+impl<'a, T: DriverCrtcState> DerefMut for CrtcStateMutator<'a, CrtcState<T>> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: Our interface ensures that `self.state.inner` follows rust's data-aliasing rules,
+        // so this is safe
+        unsafe { (*self.state.as_ptr()).inner.get_mut() }
+    }
+}
+
+impl<'a, T: FromRawCrtcState> AsRawCrtcState for CrtcStateMutator<'a, T> {
+    type Crtc = T::Crtc;
+}
+
+impl<'a, T: FromRawCrtcState> private::AsRawCrtcState for CrtcStateMutator<'a, T> {
+    fn as_raw(&self) -> *mut bindings::drm_crtc_state {
+        self.state.as_ptr().cast()
+    }
+}
+
+// SAFETY: Shares the safety guarantees of T::Crtc's ModeObjectVtable impl
+unsafe impl<'a, T: FromRawCrtcState> ModeObjectVtable for CrtcStateMutator<'a, T>
+where
+    T::Crtc: ModeObjectVtable,
+{
+    type Vtable = <T::Crtc as ModeObjectVtable>::Vtable;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        self.crtc().vtable()
+    }
+}
+
 unsafe extern "C" fn crtc_destroy_callback<T: DriverCrtc>(crtc: *mut bindings::drm_crtc) {
     // SAFETY: DRM guarantees that `crtc` points to a valid initialized `drm_crtc`.
     unsafe { bindings::drm_crtc_cleanup(crtc) };
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index be69dc16c6cc7..4e73c2966ca22 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -4,7 +4,9 @@
 //!
 //! C header: [`include/drm/drm_plane.h`](srctree/include/drm/drm_plane.h)
 
-use super::{KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject, UnregisteredKmsDevice};
+use super::{
+    atomic::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject, UnregisteredKmsDevice,
+};
 use crate::{
     alloc::KBox,
     bindings,
@@ -16,11 +18,12 @@
     types::{NotThreadSafe, Opaque},
 };
 use core::{
+    cell::Cell,
     marker::*,
     mem,
     ops::*,
     pin::Pin,
-    ptr::{addr_of_mut, null, null_mut},
+    ptr::{addr_of_mut, null, null_mut, NonNull},
 };
 use macros::pin_data;
 
@@ -746,6 +749,104 @@ fn vtable(&self) -> *const Self::Vtable {
     }
 }
 
+/// An interface for mutating a [`Plane`]s atomic state.
+///
+/// This type is typically returned by an [`AtomicStateMutator`] within contexts where it is
+/// possible to safely mutate a plane's state. In order to uphold rust's data-aliasing rules, only
+/// [`PlaneStateMutator`] may exist at a time.
+pub struct PlaneStateMutator<'a, T: FromRawPlaneState> {
+    state: &'a mut T,
+    mask: &'a Cell<u32>,
+}
+
+impl<'a, T: FromRawPlaneState> PlaneStateMutator<'a, T> {
+    pub(super) fn new<D: KmsDriver>(
+        mutator: &'a AtomicStateMutator<D>,
+        state: NonNull<bindings::drm_plane_state>,
+    ) -> Option<Self> {
+        // SAFETY: `plane` is invariant throughout the lifetime of the atomic state, is
+        // initialized by this point, and we're guaranteed it is of type `AsRawPlane` by type
+        // invariance
+        let plane = unsafe { T::Plane::from_raw((*state.as_ptr()).plane) };
+        let plane_mask = plane.mask();
+        let borrowed_mask = mutator.borrowed_planes.get();
+
+        if borrowed_mask & plane_mask == 0 {
+            mutator.borrowed_planes.set(borrowed_mask | plane_mask);
+            Some(Self {
+                mask: &mutator.borrowed_planes,
+                // SAFETY: We're guaranteed `state` is of `FromRawPlaneState` by type invariance,
+                // and we just confirmed by checking `borrowed_planes` that no other mutable borrows
+                // have been taken out for `state`
+                state: unsafe { T::from_raw_mut(state.as_ptr()) },
+            })
+        } else {
+            None
+        }
+    }
+}
+
+impl<'a, T: FromRawPlaneState> Drop for PlaneStateMutator<'a, T> {
+    fn drop(&mut self) {
+        let mask = self.state.plane().mask();
+        self.mask.set(self.mask.get() & !mask);
+    }
+}
+
+impl<'a, T: FromRawPlaneState> AsRawPlaneState for PlaneStateMutator<'a, T> {
+    type Plane = T::Plane;
+}
+
+impl<'a, T: FromRawPlaneState> private::AsRawPlaneState for PlaneStateMutator<'a, T> {
+    fn as_raw(&self) -> &bindings::drm_plane_state {
+        self.state.as_raw()
+    }
+
+    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_plane_state {
+        // SAFETY: This function is bound by the same safety contract as `self.inner.as_raw_mut()`
+        unsafe { self.state.as_raw_mut() }
+    }
+}
+
+impl<'a, T: FromRawPlaneState> Sealed for PlaneStateMutator<'a, T> {}
+
+impl<'a, T: DriverPlaneState> Deref for PlaneStateMutator<'a, PlaneState<T>> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.state.inner
+    }
+}
+
+impl<'a, T: DriverPlaneState> DerefMut for PlaneStateMutator<'a, PlaneState<T>> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.state.inner
+    }
+}
+
+// SAFETY: Shares the safety guarantees of `T`'s ModeObjectVtable impl
+unsafe impl<'a, T: FromRawPlaneState> ModeObjectVtable for PlaneStateMutator<'a, T>
+where
+    T: FromRawPlaneState + ModeObjectVtable,
+{
+    type Vtable = T::Vtable;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        self.state.vtable()
+    }
+}
+
+impl<'a, T: DriverPlaneState> PlaneStateMutator<'a, PlaneState<T>> {
+    super::impl_from_opaque_mode_obj! {
+        fn <D, P>(PlaneStateMutator<'a, OpaquePlaneState<D>>) -> Self
+        where
+            T: DriverPlaneState<Plane = P>;
+        use
+            P as DriverPlane,
+            D as KmsDriver
+    }
+}
+
 unsafe extern "C" fn plane_destroy_callback<T: DriverPlane>(plane: *mut bindings::drm_plane) {
     // SAFETY: DRM guarantees that `plane` points to a valid initialized `drm_plane`.
     unsafe { bindings::drm_plane_cleanup(plane) };
-- 
2.48.1

