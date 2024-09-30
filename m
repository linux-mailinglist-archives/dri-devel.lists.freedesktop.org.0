Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E8D98B112
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1442210E5AC;
	Mon, 30 Sep 2024 23:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d23S7xwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BC410E5AC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hb064is8joXzoyCGmxX+mPb868GRiJ43Hq2b6TnYY6k=;
 b=d23S7xwHQINGWoPQu53UUNMkNB5D8go9h52l0w1GVc5W/LSJAySvtqEqnOBDktpGnH3Kt2
 p1v9Actn8aj/P188uv2vAUBpAY9vmu4rv+7ua4MeulVfeHT3RpyheCtIgpWDX8GRzDMp64
 c/90X9Q1idBjR/yZLLHSUumrs9MaQrU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-rT-mv8fEP5C8UfCkbOntLA-1; Mon,
 30 Sep 2024 19:41:52 -0400
X-MC-Unique: rT-mv8fEP5C8UfCkbOntLA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1D5B0196D18E; Mon, 30 Sep 2024 23:41:50 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D6F2D3003DEC; Mon, 30 Sep 2024 23:41:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 34/35] WIP: rust: drm/kms: Add Kms::atomic_commit_tail
Date: Mon, 30 Sep 2024 19:10:17 -0400
Message-ID: <20240930233257.1189730-35-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
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

A quick note: this is one of my favorite bindings so far :). It sounds way
overly complicated, but so far actually writing implementations of this in
rust has been a breeze.

Anyway: RVKMS has a slightly different atomic_commit_tail than normal,
which means we need to write up some bindings for atomic_commit_tail. This
is a lot more interesting then it might seem on the surface as implementing
atomic_commit_tail incorrectly could result in UB. And in general, DRM has
up until now relied entirely on the programmer to do this correctly through
implicit ordering requirements.

In the universe of rust though, we want no UB at all! To ensure this, we
need to make sure that all atomic commit callbacks follow all of these
requirements:

* Disable/enable modeset commits must happen exactly once
* A disable modeset must be committed for a resource before an enable
  modeset may be committed for a resource
* Plane updates must happen exactly once
* drm_atomic_commit_hw_done() must be called exactly once, and only after
  all commits have been completed.
* The state may not be mutated after drm_atomic_commit_hw_done() is called
* Access to the prior atomic states are revoked after
  drm_atomic_commit_hw_done() is called (and our "new" states become "old"
  states)

To handle this, we introduce a number of new objects and types:
tokens:

* AtomicCommitTail
  Main object for controlling the commit_tail process
  * ModesetsReadyToken
    A single use token indicating that no modesets have been committed with
    the AtomicCommitTail yet
  * commit_modeset_disables() -> DisablesCommittedToken
    This function consumes the ModesetsReadyToken, commits modeset
    disables, and then returns a DisablesCommittedToken
  * commit_modeset_enables() -> EnablesCommittedToken
    This function consumes a DisablesCommittedToken, commits modeset
    enables, and then returns a EnablesCommittedToken
    EnablesCommittedToken - enforcing the disables -> enables order.
  * commit_planes() -> PlaneUpdatesCommittedToken
    Consumes a PlaneUpdatesReadyToken and returns a
    PlaneUpdatesCommittedToken.
  * commit_hw_done() -> CommittedAtomicState
    Revokes access to the AtomicCommitTailObject, and consumes both the
    EnablesCommittedToken and PlaneUpdatesCommitted tokens. This ensures
    that all modesets and plane updates have occurred exactly once.
* CommittedAtomicState - main object for controlling the atomic_commit_tail
  after the state has been swapped in. This must be returned from the
  atomic_commit_tail function to prove that all of the required commits
  have occurred.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

TODO:

* Currently this solution wouldn't be sufficient for drivers that need
  precise control over the order of each individual modeset or plane
  update. However, this should be very easy to add.
* Figure out something better for enforcing the plane cleanup then what we
  have right now (e.g. cleaning up planes in the destructor for
  CommittedAtomicState).
* Add iterator functions that take mutable references to the atomic state
  objects here. This will prevent functions like commit_modeset_disables()
  from being called while a state borrow is taken out, while still allowing
  easy access to the contents of the atomic state at any portion of the
  atomic commit tail.
* Actually add some macros for generating bitmasks like we do with
  PlaneCommitFlags - right now we just do this by hand.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms.rs        |  27 ++-
 rust/kernel/drm/kms/atomic.rs | 365 +++++++++++++++++++++++++++++++++-
 2 files changed, 386 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index e13f35d9e223f..117c97a9e7165 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -142,6 +142,26 @@ fn mode_config_info(
 
     /// Create mode objects like [`crtc::Crtc`], [`plane::Plane`], etc. for this device
     fn create_objects(drm: &UnregisteredKmsDevice<'_, Self::Driver>) -> Result;
+
+    /// The optional [`atomic_commit_tail`] callback for this [`Device`].
+    ///
+    /// It must return a [`CommittedAtomicState`] to prove that it has signaled completion of the hw
+    /// commit phase. Drivers may use this function to customize the order in which commits are
+    /// performed during the atomic commit phase.
+    ///
+    /// If not provided, DRM will use its own default atomic commit tail helper
+    /// [`drm_atomic_helper_commit_tail`].
+    ///
+    /// [`CommittedAtomicState`]: atomic::CommittedAtomicState
+    /// [`atomic_commit_tail`]: srctree/include/drm/drm_modeset_helper_vtables.h
+    /// [`drm_atomic_helper_commit_tail`]: srctree/include/drm/drm_atomic_helpers.h
+    fn atomic_commit_tail<'a>(
+        state: atomic::AtomicCommitTail<'a, Self::Driver>,
+        _modeset_token: atomic::ModesetsReadyToken<'_>,
+        _plane_update_token: atomic::PlaneUpdatesReadyToken<'_>
+    ) -> atomic::CommittedAtomicState<'a, Self::Driver> {
+        build_error::build_error("This function should not be reachable")
+    }
 }
 
 impl<T: Kms> private::KmsImpl for T {
@@ -164,7 +184,12 @@ impl<T: Kms> private::KmsImpl for T {
 
         kms_helper_vtable: bindings::drm_mode_config_helper_funcs {
             atomic_commit_setup: None, // TODO
-            atomic_commit_tail: None, // TODO
+            atomic_commit_tail:
+                if Self::HAS_ATOMIC_COMMIT_TAIL {
+                    Some(atomic::commit_tail_callback::<Self>)
+                } else {
+                    None
+                },
         },
     });
 
diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
index a4354b89b07cc..f9398edbca3d6 100644
--- a/rust/kernel/drm/kms/atomic.rs
+++ b/rust/kernel/drm/kms/atomic.rs
@@ -14,14 +14,14 @@
     private::Sealed
 };
 use core::{
-    marker::*,
-    ptr::NonNull,
     cell::Cell,
     ffi::*,
-    slice,
-    ops::*,
-    mem::ManuallyDrop,
     iter::Iterator,
+    marker::*,
+    mem::ManuallyDrop,
+    ops::*,
+    ptr::NonNull,
+    slice
 };
 use super::{
     crtc::*,
@@ -372,6 +372,361 @@ pub fn add_affected_planes(&self, crtc: &impl AsRawCrtc<Driver = T>) -> Result {
     }
 }
 
+/// A token proving that no modesets for a commit have completed.
+///
+/// This token is proof that no commits have yet completed, and is provided as an argument to
+/// [`Kms::atomic_commit_tail`]. This may be used with
+/// [`AtomicCommitTail::commit_modeset_disables`].
+pub struct ModesetsReadyToken<'a>(PhantomData<&'a ()>);
+
+/// A token proving that modeset disables for a commit have completed.
+///
+/// This token is proof that an implementor's [`Kms::atomic_commit_tail`] phase has finished
+/// committing any operations which disable mode objects. It is returned by
+/// [`AtomicCommitTail::commit_modeset_disables`], and can be used with
+/// [`AtomicCommitTail::commit_modeset_enables`] to acquire a [`EnablesCommittedToken`].
+pub struct DisablesCommittedToken<'a>(PhantomData<&'a ()>);
+
+/// A token proving that modeset enables for a commit have completed.
+///
+/// This token is proof that an implementor's [`Kms::atomic_commit_tail`] phase has finished
+/// committing any operations which enable mode objects. It is returned by
+/// [`AtomicCommitTail::commit_modeset_enables`].
+pub struct EnablesCommittedToken<'a>(PhantomData<&'a ()>);
+
+/// A token proving that no plane updates for a commit have completed.
+///
+/// This token is proof that no plane updates have yet been completed within an implementor's
+/// [`Kms::atomic_commit_tail`] implementation, and that we are ready to begin updating planes. It
+/// is provided as an argument to [`Kms::atomic_commit_tail`].
+pub struct PlaneUpdatesReadyToken<'a>(PhantomData<&'a ()>);
+
+/// A token proving that all plane updates for a commit have completed.
+///
+/// This token is proof that all plane updates within an implementor's [`Kms::atomic_commit_tail`]
+/// implementation have completed. It is returned by [`AtomicCommitTail::commit_planes`].
+pub struct PlaneUpdatesCommittedToken<'a>(PhantomData<&'a ()>);
+
+/// An [`AtomicState`] interface that allows a driver to control the [`atomic_commit_tail`]
+/// callback.
+///
+/// This object is provided as an argument to [`Kms::atomic_commit_tail`], and represents an atomic
+/// state within the commit tail phase which is still in the process of being committed to hardware.
+/// It may be used to control the order in which the commit process happens.
+///
+/// # Invariants
+///
+/// Same as [`AtomicState`].
+///
+/// [`atomic_commit_tail`]: srctree/include/drm/drm_modeset_helper_vtables.h
+pub struct AtomicCommitTail<'a, T: KmsDriver>(&'a AtomicState<T>);
+
+impl<'a, T: KmsDriver> AtomicCommitTail<'a, T> {
+    /// Commit modesets which would disable outputs.
+    ///
+    /// This function commits any modesets which would shut down outputs, along with preparing them
+    /// for a new mode (if needed).
+    ///
+    /// Since it is physically impossible to disable an output multiple times, and since it is
+    /// logically unsound to disable an output within an atomic commit after the output was enabled
+    /// in the same commit - this function requires a [`ModesetsReadyToken`] to consume and returns
+    /// a [`DisablesCommittedToken`].
+    ///
+    /// If compatibility with legacy CRTC helpers is desired, this
+    /// should be called before [`commit_planes`] which is what the default commit function does.
+    /// But drivers with different needs can group the modeset commits tgether and do the plane
+    /// commits at the end. This is useful for drivers doing runtime PM since then plane updates
+    /// only happen when the CRTC is actually enabled.
+    ///
+    /// [`commit_planes`]: AtomicCommitTail::commit_planes
+    #[inline]
+    #[must_use]
+    pub fn commit_modeset_disables<'b>(
+        &mut self,
+        _token: ModesetsReadyToken<'_>,
+    ) -> DisablesCommittedToken<'b> {
+        // SAFETY: Both `as_raw()` calls are guaranteed to return valid pointers
+        unsafe {
+            bindings::drm_atomic_helper_commit_modeset_disables(
+                self.0.drm_dev().as_raw(),
+                self.0.as_raw()
+            )
+        }
+
+        DisablesCommittedToken(PhantomData)
+    }
+
+    /// Commit all plane updates.
+    ///
+    /// This function performs all plane updates for the given [`AtomicCommitTail`]. Since it is
+    /// logically unsound to perform the same plane update more then once in a given atomic commit,
+    /// this function requires a [`PlaneUpdatesReadyToken`] to consume and returns a
+    /// [`PlaneUpdatesCommittedToken`] to prove that plane updates for the state have completed.
+    #[inline]
+    #[must_use]
+    pub fn commit_planes<'b>(
+        &mut self,
+        _token: PlaneUpdatesReadyToken<'_>,
+        flags: PlaneCommitFlags
+    ) -> PlaneUpdatesCommittedToken<'b> {
+        // SAFETY: Both `as_raw()` calls are guaranteed to return valid pointers
+        unsafe {
+            bindings::drm_atomic_helper_commit_planes(
+                self.0.drm_dev().as_raw(),
+                self.0.as_raw(),
+                flags.into()
+            )
+        }
+
+        PlaneUpdatesCommittedToken(PhantomData)
+    }
+
+    /// Commit modesets which would enable outputs.
+    ///
+    /// This function commits any modesets in the given [`AtomicCommitTail`] which would enable
+    /// outputs, along with preparing them for their new modes (if needed).
+    ///
+    /// Since it is logically unsound to enable an output before any disabling modesets within the
+    /// same atomic commit have been performed, and physically impossible to enable the same output
+    /// multiple times - this function requires a [`DisablesCommittedToken`] to consume and returns
+    /// a [`EnablesCommittedToken`] which may be used as proof that all modesets in the state have
+    /// been completed.
+    #[inline]
+    #[must_use]
+    pub fn commit_modeset_enables<'b>(
+        &mut self,
+        _token: DisablesCommittedToken<'_>
+    ) -> EnablesCommittedToken<'b> {
+        // SAFETY: Both `as_raw()` calls are guaranteed to return valid pointers
+        unsafe {
+            bindings::drm_atomic_helper_commit_modeset_enables(
+                self.0.drm_dev().as_raw(),
+                self.0.as_raw()
+            )
+        }
+
+        EnablesCommittedToken(PhantomData)
+    }
+
+    /// Fake VBLANK events if needed
+    ///
+    /// Note that this is still relevant to drivers which don't implement [`VblankSupport`] for any
+    /// of their CRTCs.
+    ///
+    /// TODO: more doc
+    ///
+    /// [`VblankSupport`]: super::vblank::VblankSupport
+    pub fn fake_vblank(&mut self) {
+        // SAFETY: `as_raw()` is guaranteed to always return a valid pointer
+        unsafe { bindings::drm_atomic_helper_fake_vblank(self.0.as_raw()) }
+    }
+
+    /// Signal completion of the hardware commit step.
+    ///
+    /// This swaps the atomic state into the relevant atomic state pointers and marks the hardware
+    /// commit step as completed. Since this step can only happen after all plane updates and
+    /// modesets within an [`AtomicCommitTail`] have been completed, it requires both a
+    /// [`EnablesCommittedToken`] and a [`PlaneUpdatesCommittedToken`] to consume. After this
+    /// function is called, the caller no longer has exclusive access to the underlying atomic
+    /// state. As such, this function consumes the [`AtomicCommitTail`] object and returns a
+    /// [`CommittedAtomicState`] accessor for performing post-hw commit tasks.
+    pub fn commit_hw_done<'b>(
+        self,
+        _modeset_token: EnablesCommittedToken<'_>,
+        _plane_updates_token: PlaneUpdatesCommittedToken<'_>,
+    ) -> CommittedAtomicState<'b, T>
+    where
+        'a: 'b
+    {
+        // SAFETY: we consume the `AtomicCommitTail` object, making it impossible for the user to
+        // mutate the state after this function has been called - which upholds the safety
+        // requirements of the C API allowing us to safely call this function
+        unsafe { bindings::drm_atomic_helper_commit_hw_done(self.0.as_raw()) };
+
+        CommittedAtomicState(self.0)
+    }
+}
+
+// The actual raw C callback for custom atomic commit tail implementations
+pub(crate) unsafe extern "C" fn commit_tail_callback<T: Kms>(
+    state: *mut bindings::drm_atomic_state
+) {
+    // SAFETY:
+    // * We're guaranteed by DRM that `state` always points to a valid instance of
+    //   `bindings::drm_atomic_state`
+    // * This conversion is safe via the type invariants
+    let state = unsafe { AtomicState::<T::Driver>::from_raw(state.cast_const()) };
+
+    T::atomic_commit_tail(
+        AtomicCommitTail(state),
+        ModesetsReadyToken(PhantomData),
+        PlaneUpdatesReadyToken(PhantomData),
+    );
+}
+
+/// An [`AtomicState`] which was just committed with [`AtomicCommitTail::commit_hw_done`].
+///
+/// This object represents an [`AtomicState`] which has been fully committed to hardware, and as
+/// such may no longer be mutated as it is visible to userspace. It may be used to control what
+/// happens immediately after an atomic commit finishes within the [`atomic_commit_tail`] callback.
+///
+/// Since acquiring this object means that all modesetting locks have been dropped, a non-blocking
+/// commit could happen at the same time an [`atomic_commit_tail`] implementer has access to this
+/// object. Thus, it cannot be assumed that this object represents the current hardware state - and
+/// instead only represents the final result of the [`AtomicCommitTail`] that was just committed.
+///
+/// # Invariants
+///
+/// It may be assumed that [`drm_atomic_helper_commit_hw_done`] has been called as long as this type
+/// exists.
+///
+/// [`atomic_commit_tail`]: Kms::atomic_commit_tail
+/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic_helper.h
+pub struct CommittedAtomicState<'a, T: KmsDriver>(&'a AtomicState<T>);
+
+impl<'a, T: KmsDriver> CommittedAtomicState<'a, T> {
+    /// Wait for page flips on this state to complete
+    pub fn wait_for_flip_done(&self) {
+        // SAFETY: `drm_atomic_helper_commit_hw_done` has been called via our invariants
+        unsafe {
+            bindings::drm_atomic_helper_wait_for_flip_done(
+                self.0.drm_dev().as_raw(),
+                self.0.as_raw()
+            )
+        }
+    }
+}
+
+impl<'a, T: KmsDriver> Drop for CommittedAtomicState<'a, T> {
+    fn drop(&mut self) {
+        // SAFETY:
+        // * This interface represents the last atomic state accessor which could be affected as a
+        //   result of resources from an atomic commit being cleaned up.
+        unsafe {
+            bindings::drm_atomic_helper_cleanup_planes(
+                self.0.drm_dev().as_raw(),
+                self.0.as_raw()
+            )
+        }
+    }
+}
+
+/// An enumerator representing all the possible flags in a [`PlaneCommitFlags`] mask
+///
+/// This is a non-exhaustive list, as the C side could add more later.
+///
+/// TODO: this idea kinda sick we should add some macros for this :3c
+#[derive(Copy, Clone, PartialEq, Eq)]
+#[repr(u32)]
+pub enum PlaneCommitFlag {
+    ActiveOnly = (1 << 0),
+    NoDisableAfterModeset = (1 << 1),
+}
+
+impl BitOr for PlaneCommitFlag {
+    type Output = PlaneCommitFlags;
+
+    fn bitor(self, rhs: Self) -> Self::Output {
+        PlaneCommitFlags(self as u32 | rhs as u32)
+    }
+}
+
+impl BitOr<PlaneCommitFlags> for PlaneCommitFlag {
+    type Output = PlaneCommitFlags;
+
+    fn bitor(self, rhs: PlaneCommitFlags) -> Self::Output {
+        PlaneCommitFlags(self as u32 | rhs.0)
+    }
+}
+
+/// A bitmask for controlling the behavior of [`AtomicCommitTail::commit_planes`]
+///
+/// This corresponds to the `DRM_PLANE_COMMIT_*` flags on the C side. Note that this bitmask does
+/// not discard unknown values in order to ensure that adding new flags on the C side of things does
+/// not break anything in the future.
+#[derive(Copy, Clone, Default, PartialEq, Eq)]
+pub struct PlaneCommitFlags(u32);
+
+impl From<PlaneCommitFlag> for PlaneCommitFlags {
+    fn from(value: PlaneCommitFlag) -> Self {
+        Self(value as u32)
+    }
+}
+
+impl From<PlaneCommitFlags> for u32 {
+    fn from(value: PlaneCommitFlags) -> Self {
+        value.0
+    }
+}
+
+impl BitOr for PlaneCommitFlags {
+    type Output = Self;
+
+    fn bitor(self, rhs: Self) -> Self::Output {
+        Self(self.0 | rhs.0)
+    }
+}
+
+impl BitOrAssign for PlaneCommitFlags {
+    fn bitor_assign(&mut self, rhs: Self) {
+        *self = *self | rhs
+    }
+}
+
+impl BitAnd for PlaneCommitFlags {
+    type Output = PlaneCommitFlags;
+
+    fn bitand(self, rhs: Self) -> Self::Output {
+        Self(self.0 & rhs.0)
+    }
+}
+
+impl BitAndAssign for PlaneCommitFlags {
+    fn bitand_assign(&mut self, rhs: Self) {
+        *self = *self & rhs
+    }
+}
+
+impl BitOr<PlaneCommitFlag> for PlaneCommitFlags {
+    type Output = Self;
+
+    fn bitor(self, rhs: PlaneCommitFlag) -> Self::Output {
+        self | Self::from(rhs)
+    }
+}
+
+impl BitOrAssign<PlaneCommitFlag> for PlaneCommitFlags {
+    fn bitor_assign(&mut self, rhs: PlaneCommitFlag) {
+        *self = *self | rhs
+    }
+}
+
+impl BitAnd<PlaneCommitFlag> for PlaneCommitFlags {
+    type Output = PlaneCommitFlags;
+
+    fn bitand(self, rhs: PlaneCommitFlag) -> Self::Output {
+        self & Self::from(rhs)
+    }
+}
+
+impl BitAndAssign<PlaneCommitFlag> for PlaneCommitFlags {
+    fn bitand_assign(&mut self, rhs: PlaneCommitFlag) {
+        *self = *self & rhs
+    }
+}
+
+impl PlaneCommitFlags {
+    /// Create a new bitmask
+    fn new() -> Self {
+        Self::default()
+    }
+
+    /// Check if the bitmask has the given commit flag set
+    fn has(&self, flag: PlaneCommitFlag) -> bool {
+        *self & flag == flag.into()
+    }
+}
+
 /// An iterator which goes through each DRM plane currently in an atomic state.
 ///
 /// Note that this iterator will return [`OpaquePlane`]s, because it's entirely possible for a
-- 
2.46.1

