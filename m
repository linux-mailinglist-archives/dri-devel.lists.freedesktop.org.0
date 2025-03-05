Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63221A53E29
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85E310E862;
	Wed,  5 Mar 2025 23:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dsfoplQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848DB10E862
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8KtBjLaq8lmYfyJdFyEyWTSUP/Nf3HWrVvlOKUEuiU=;
 b=dsfoplQ07An9ardIy8CBAle8op1k4U4OKy6k0divvwUJ4B/g+5ItpG2nDPVG+ZTddxlRr7
 gcQThpiJLqJs+OlS/Nvy6KOZRP142krE56lIwyFgZIQ5MhDHgnnpD9Jxi6YaHfDbckbjiE
 DVGJNYxC8Qgoavv775payoro3OMX120=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-vGRJGGJLOYWUjH_Zhuyy5Q-1; Wed,
 05 Mar 2025 18:09:23 -0500
X-MC-Unique: vGRJGGJLOYWUjH_Zhuyy5Q-1
X-Mimecast-MFC-AGG-ID: vGRJGGJLOYWUjH_Zhuyy5Q_1741216161
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 04CFD1800258; Wed,  5 Mar 2025 23:09:21 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2751B300019E; Wed,  5 Mar 2025 23:09:17 +0000 (UTC)
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
Subject: [RFC v3 32/33] rust: drm/kms: Add Kms::atomic_commit_tail
Date: Wed,  5 Mar 2025 17:59:48 -0500
Message-ID: <20250305230406.567126-33-lyude@redhat.com>
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

V3:
* Fix all warnings
* Minor doc fixes

NOTES:
* Currently this solution wouldn't be sufficient for drivers that need
  precise control over the order of each individual modeset or plane
  update. However, this should be very easy to add.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms.rs        |  29 ++-
 rust/kernel/drm/kms/atomic.rs | 359 ++++++++++++++++++++++++++++++++++
 2 files changed, 387 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 38015066491f9..e38035c024930 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -219,6 +219,29 @@ fn mode_config_info(
     fn create_objects(drm: &UnregisteredKmsDevice<'_, Self>) -> Result
     where
         Self: Sized;
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
+        _state: atomic::AtomicCommitTail<'a, Self>,
+        _modeset_token: atomic::ModesetsReadyToken<'_>,
+        _plane_update_token: atomic::PlaneUpdatesReadyToken<'_>,
+    ) -> atomic::CommittedAtomicState<'a, Self>
+    where
+        Self: Sized,
+    {
+        build_error::build_error("This function should not be reachable")
+    }
 }
 
 impl<T: KmsDriver> private::KmsImpl for T {
@@ -238,7 +261,11 @@ impl<T: KmsDriver> private::KmsImpl for T {
 
         kms_helper_vtable: bindings::drm_mode_config_helper_funcs {
             atomic_commit_setup: None,
-            atomic_commit_tail: None,
+            atomic_commit_tail: if Self::HAS_ATOMIC_COMMIT_TAIL {
+                Some(atomic::commit_tail_callback::<Self>)
+            } else {
+                None
+            },
         },
     });
 
diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
index e0a1b5b860d6f..a0022c1a5e54d 100644
--- a/rust/kernel/drm/kms/atomic.rs
+++ b/rust/kernel/drm/kms/atomic.rs
@@ -356,3 +356,362 @@ pub fn add_affected_planes<C>(&self, crtc: &C) -> Result
         to_result(unsafe { bindings::drm_atomic_add_affected_planes(self.as_raw(), crtc.as_raw()) })
     }
 }
+
+/// A token proving that no modesets for a commit have completed.
+///
+/// This token is proof that no commits have yet completed, and is provided as an argument to
+/// [`KmsDriver::atomic_commit_tail`]. This may be used with
+/// [`AtomicCommitTail::commit_modeset_disables`].
+pub struct ModesetsReadyToken<'a>(PhantomData<&'a ()>);
+
+/// A token proving that modeset disables for a commit have completed.
+///
+/// This token is proof that an implementor's [`KmsDriver::atomic_commit_tail`] phase has finished
+/// committing any operations which disable mode objects. It is returned by
+/// [`AtomicCommitTail::commit_modeset_disables`], and can be used with
+/// [`AtomicCommitTail::commit_modeset_enables`] to acquire a [`EnablesCommittedToken`].
+pub struct DisablesCommittedToken<'a>(PhantomData<&'a ()>);
+
+/// A token proving that modeset enables for a commit have completed.
+///
+/// This token is proof that an implementor's [`KmsDriver::atomic_commit_tail`] phase has finished
+/// committing any operations which enable mode objects. It is returned by
+/// [`AtomicCommitTail::commit_modeset_enables`].
+pub struct EnablesCommittedToken<'a>(PhantomData<&'a ()>);
+
+/// A token proving that no plane updates for a commit have completed.
+///
+/// This token is proof that no plane updates have yet been completed within an implementor's
+/// [`KmsDriver::atomic_commit_tail`] implementation, and that we are ready to begin updating planes. It
+/// is provided as an argument to [`KmsDriver::atomic_commit_tail`].
+pub struct PlaneUpdatesReadyToken<'a>(PhantomData<&'a ()>);
+
+/// A token proving that all plane updates for a commit have completed.
+///
+/// This token is proof that all plane updates within an implementor's [`KmsDriver::atomic_commit_tail`]
+/// implementation have completed. It is returned by [`AtomicCommitTail::commit_planes`].
+pub struct PlaneUpdatesCommittedToken<'a>(PhantomData<&'a ()>);
+
+/// An [`AtomicState`] interface that allows a driver to control the [`atomic_commit_tail`]
+/// callback.
+///
+/// This object is provided as an argument to [`KmsDriver::atomic_commit_tail`], and represents an atomic
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
+                self.0.as_raw(),
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
+        flags: PlaneCommitFlags,
+    ) -> PlaneUpdatesCommittedToken<'b> {
+        // SAFETY: Both `as_raw()` calls are guaranteed to return valid pointers
+        unsafe {
+            bindings::drm_atomic_helper_commit_planes(
+                self.0.drm_dev().as_raw(),
+                self.0.as_raw(),
+                flags.into(),
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
+        _token: DisablesCommittedToken<'_>,
+    ) -> EnablesCommittedToken<'b> {
+        // SAFETY: Both `as_raw()` calls are guaranteed to return valid pointers
+        unsafe {
+            bindings::drm_atomic_helper_commit_modeset_enables(
+                self.0.drm_dev().as_raw(),
+                self.0.as_raw(),
+            )
+        }
+
+        EnablesCommittedToken(PhantomData)
+    }
+
+    /// Fake vblank events if needed.
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
+        'a: 'b,
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
+pub(crate) unsafe extern "C" fn commit_tail_callback<T: KmsDriver>(
+    state: *mut bindings::drm_atomic_state,
+) {
+    // SAFETY:
+    // - We're guaranteed by DRM that `state` always points to a valid instance of
+    //   `bindings::drm_atomic_state`
+    // - This conversion is safe via the type invariants
+    let state = unsafe { AtomicState::from_raw(state.cast_const()) };
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
+/// [`atomic_commit_tail`]: KmsDriver::atomic_commit_tail
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
+                self.0.as_raw(),
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
+            bindings::drm_atomic_helper_cleanup_planes(self.0.drm_dev().as_raw(), self.0.as_raw())
+        }
+    }
+}
+
+/// An enumator representing a single flag in [`PlaneCommitFlags`].
+///
+/// This is a non-exhaustive list, as the C side could add more later.
+#[derive(Copy, Clone, PartialEq, Eq)]
+#[repr(u32)]
+#[non_exhaustive]
+pub enum PlaneCommitFlag {
+    /// Don't notify applications of plane updates for newly-disabled planes. Drivers are encouraged
+    /// to set this flag by default, as otherwise they need to ignore plane updates for disabled
+    /// planes by hand.
+    ActiveOnly = (1 << 0),
+    /// Tell the DRM core that the display hardware requires that a [`Crtc`]'s planes must be
+    /// disabled when the [`Crtc`] is disabled. When not specified,
+    /// [`AtomicCommitTail::commit_planes`] will skip the atomic disable callbacks for a plane if
+    /// the [`Crtc`] in the old [`PlaneState`] needs a modesetting operation. It is still up to the
+    /// driver to disable said planes in their [`DriverCrtc::atomic_disable`] callback.
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
+/// A bitmask for controlling the behavior of [`AtomicCommitTail::commit_planes`].
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
+    /// Create a new bitmask.
+    pub fn new() -> Self {
+        Self::default()
+    }
+
+    /// Check if the bitmask has the given commit flag set.
+    pub fn has(&self, flag: PlaneCommitFlag) -> bool {
+        *self & flag == flag.into()
+    }
+}
-- 
2.48.1

