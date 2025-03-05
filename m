Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE205A53E16
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D9D10E859;
	Wed,  5 Mar 2025 23:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cGhLaVZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9021710E859
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8Wya8waZxf4PRUJ4SmPnCKJ5/8nzDdWThNqRlGolhE=;
 b=cGhLaVZE099ReiP/uX997zwgQjvRMj31nuVHhdvUUiJLWJtKmPVo3FEpxGbnfACuer8NY1
 syvrvj2TAfq3Rb/+4pk8g4575yRMsbSh7W1vVAN6T6yd1tG1kP7HrCBPDUkZ5JhItOuT7u
 llzya6Z92F7ZaY+J/lnSvpJsfm3iiW8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-fTF3WE_ONlOJowyS2fczRQ-1; Wed,
 05 Mar 2025 18:07:43 -0500
X-MC-Unique: fTF3WE_ONlOJowyS2fczRQ-1
X-Mimecast-MFC-AGG-ID: fTF3WE_ONlOJowyS2fczRQ_1741216061
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6C3631800262; Wed,  5 Mar 2025 23:07:41 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CAB83300019E; Wed,  5 Mar 2025 23:07:37 +0000 (UTC)
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
Subject: [RFC v3 21/33] rust: drm/kms: Add DriverPlane::atomic_check()
Date: Wed,  5 Mar 2025 17:59:37 -0500
Message-ID: <20250305230406.567126-22-lyude@redhat.com>
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

Optional trait method for implementing a plane's atomic_check().

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Document ManuallyDrop uses better

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/plane.rs | 53 ++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index b090aebc35649..f3adc30c17489 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -11,7 +11,7 @@
     alloc::KBox,
     bindings,
     drm::{device::Device, fourcc::*},
-    error::{to_result, Error},
+    error::{from_result, to_result, Error},
     init::Zeroable,
     prelude::*,
     private::Sealed,
@@ -20,7 +20,7 @@
 use core::{
     cell::Cell,
     marker::*,
-    mem,
+    mem::{self, ManuallyDrop},
     ops::*,
     pin::Pin,
     ptr::{addr_of_mut, null, null_mut, NonNull},
@@ -69,7 +69,11 @@ pub trait DriverPlane: Send + Sync + Sized {
             cleanup_fb: None,
             begin_fb_access: None,
             end_fb_access: None,
-            atomic_check: None,
+            atomic_check: if Self::HAS_ATOMIC_CHECK {
+                Some(atomic_check_callback::<Self>)
+            } else {
+                None
+            },
             atomic_update: if Self::HAS_ATOMIC_UPDATE {
                 Some(atomic_update_callback::<Self>)
             } else {
@@ -117,6 +121,21 @@ fn atomic_update(
     ) {
         build_error::build_error("This should not be reachable")
     }
+
+    /// The optional [`drm_plane_helper_funcs.atomic_check`] hook for this plane.
+    ///
+    /// Drivers may use this to customize the atomic check phase of their [`Plane`] objects. The
+    /// result of this function determines whether the atomic check passed or failed.
+    ///
+    /// [`drm_plane_helper_funcs.atomic_check`]: srctree/include/drm/drm_modeset_helper_vtables.h
+    fn atomic_check(
+        _plane: &Plane<Self>,
+        _new_state: PlaneStateMutator<'_, PlaneState<Self::State>>,
+        _old_state: &PlaneState<Self::State>,
+        _state: &AtomicStateComposer<Self::Driver>,
+    ) -> Result {
+        build_error::build_error("This should not be reachable")
+    }
 }
 
 /// The generated C vtable for a [`DriverPlane`].
@@ -974,3 +993,31 @@ fn <D, P>(PlaneStateMutator<'a, OpaquePlaneState<D>>) -> Self
 
     T::atomic_update(plane, new_state, old_state, &state);
 }
+
+unsafe extern "C" fn atomic_check_callback<T: DriverPlane>(
+    plane: *mut bindings::drm_plane,
+    state: *mut bindings::drm_atomic_state,
+) -> i32 {
+    // SAFETY:
+    // - We're guaranteed `plane` is of type `Plane<T>` via type invariants.
+    // - We're guaranteed by DRM that `plane` is pointing to a valid initialized state.
+    let plane = unsafe { Plane::from_raw(plane) };
+
+    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_state`
+    // We use ManuallyDrop here since AtomicStateComposer would otherwise drop a owned reference to
+    // the atomic state upon finishing this callback.
+    let state = ManuallyDrop::new(unsafe {
+        AtomicStateComposer::<T::Driver>::new(NonNull::new_unchecked(state))
+    });
+
+    // SAFETY: We're guaranteed by DRM that both the old and new atomic state are present within
+    // this `drm_atomic_state`
+    let (old_state, new_state) = unsafe {
+        (
+            state.get_old_plane_state(plane).unwrap_unchecked(),
+            state.get_new_plane_state(plane).unwrap_unchecked(),
+        )
+    };
+
+    from_result(|| T::atomic_check(plane, new_state, old_state, &state).map(|_| 0))
+}
-- 
2.48.1

