Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E6A53E14
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F43010E854;
	Wed,  5 Mar 2025 23:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eYdGplTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B62010E854
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/D4SEgwMMDnFfsGfNIexwP9lfVhLyJ7Nk/oo5mITW4=;
 b=eYdGplTg6VVMWYu4/qadzNpfzBtnnkWh6673giK8nw4hHWhoonEEYWOlVZxnn6gqfLK8FN
 Ich45VxPD2IaBARVEkSYU4gzmZ/l/ch+c+iJR71hnm7x5teLuqvF74ac2KESHjst3SEOG3
 QQalCwVW9YX1go5civRLTdca3NPYEtM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-251-oPRhXijONZ-enFPmMxsMWA-1; Wed,
 05 Mar 2025 18:07:29 -0500
X-MC-Unique: oPRhXijONZ-enFPmMxsMWA-1
X-Mimecast-MFC-AGG-ID: oPRhXijONZ-enFPmMxsMWA_1741216046
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BB960180025B; Wed,  5 Mar 2025 23:07:26 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A13EB30001A1; Wed,  5 Mar 2025 23:07:22 +0000 (UTC)
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
Subject: [RFC v3 19/33] rust: drm/kms: Add DriverCrtc::atomic_check()
Date: Wed,  5 Mar 2025 17:59:35 -0500
Message-ID: <20250305230406.567126-20-lyude@redhat.com>
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

An optional trait method for implementing a CRTC's atomic state check.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Document uses of ManuallyDrop

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/atomic.rs |  1 -
 rust/kernel/drm/kms/crtc.rs   | 55 +++++++++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
index 3d5c70dbc4274..e0a1b5b860d6f 100644
--- a/rust/kernel/drm/kms/atomic.rs
+++ b/rust/kernel/drm/kms/atomic.rs
@@ -274,7 +274,6 @@ impl<T: KmsDriver> AtomicStateComposer<T> {
     /// # Safety
     ///
     /// The caller guarantees that `ptr` points to a valid instance of `drm_atomic_state`.
-    #[allow(dead_code)]
     pub(crate) unsafe fn new(ptr: NonNull<bindings::drm_atomic_state>) -> Self {
         // SAFETY: see `AtomicStateMutator::from_raw()`
         Self(unsafe { AtomicStateMutator::new(ptr) })
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 3b9c9d97fcf24..50f5b68f4a3fe 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -12,7 +12,7 @@
     alloc::KBox,
     bindings,
     drm::device::Device,
-    error::to_result,
+    error::{from_result, to_result},
     init::Zeroable,
     prelude::*,
     private::Sealed,
@@ -21,7 +21,7 @@
 use core::{
     cell::{Cell, UnsafeCell},
     marker::*,
-    mem,
+    mem::{self, ManuallyDrop},
     ops::{Deref, DerefMut},
     ptr::{addr_of_mut, null, null_mut, NonNull},
 };
@@ -78,7 +78,11 @@ pub trait DriverCrtc: Send + Sync + Sized {
         helper_funcs: bindings::drm_crtc_helper_funcs {
             atomic_disable: None,
             atomic_enable: None,
-            atomic_check: None,
+            atomic_check: if Self::HAS_ATOMIC_CHECK {
+                Some(atomic_check_callback::<Self>)
+            } else {
+                None
+            },
             dpms: None,
             commit: None,
             prepare: None,
@@ -113,6 +117,21 @@ pub trait DriverCrtc: Send + Sync + Sized {
     ///
     /// Drivers may use this to instantiate their [`DriverCrtc`] object.
     fn new(device: &Device<Self::Driver>, args: &Self::Args) -> impl PinInit<Self, Error>;
+
+    /// The optional [`drm_crtc_helper_funcs.atomic_check`] hook for this crtc.
+    ///
+    /// Drivers may use this to customize the atomic check phase of their [`Crtc`] objects. The
+    /// result of this function determines whether the atomic check passed or failed.
+    ///
+    /// [`drm_crtc_helper_funcs.atomic_check`]: srctree/include/drm/drm_modeset_helper_vtables.h
+    fn atomic_check(
+        _crtc: &Crtc<Self>,
+        _old_state: &CrtcState<Self::State>,
+        _new_state: CrtcStateMutator<'_, CrtcState<Self::State>>,
+        _state: &AtomicStateComposer<Self::Driver>,
+    ) -> Result {
+        build_error::build_error("This should not be reachable")
+    }
 }
 
 /// The generated C vtable for a [`DriverCrtc`].
@@ -859,3 +878,33 @@ fn vtable(&self) -> *const Self::Vtable {
     // SAFETY: DRM takes ownership of the state from here, and will never move it
     unsafe { bindings::__drm_atomic_helper_crtc_reset(crtc.as_raw(), KBox::into_raw(new).cast()) };
 }
+
+unsafe extern "C" fn atomic_check_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc,
+    state: *mut bindings::drm_atomic_state,
+) -> i32 {
+    // SAFETY:
+    // - We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
+    // - We're guaranteed by DRM that `crtc` is pointing to a valid initialized state.
+    let crtc = unsafe { Crtc::from_raw(crtc) };
+
+    // SAFETY: DRM guarantees `state` points to a valid `drm_atomic_state`
+    // We use a ManuallyDrop here to avoid AtomicStateComposer dropping an owned reference we never
+    // acquired.
+    let state =
+        unsafe { ManuallyDrop::new(AtomicStateComposer::new(NonNull::new_unchecked(state))) };
+
+    // SAFETY: Since we are in the atomic update callback, we're guaranteed by DRM that both the old
+    // and new atomic state are present within `state`
+    let (old_state, new_state) = unsafe {
+        (
+            state.get_old_crtc_state(crtc).unwrap_unchecked(),
+            state.get_new_crtc_state(crtc).unwrap_unchecked(),
+        )
+    };
+
+    from_result(|| {
+        T::atomic_check(crtc, old_state, new_state, &state)?;
+        Ok(0)
+    })
+}
-- 
2.48.1

