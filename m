Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE0A53E24
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC82310E863;
	Wed,  5 Mar 2025 23:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SxLQxawg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DA810E863
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0oBqLHoJsFA0rDr7+FKi6nHZ+YcDKW3Lfid1N4qEKas=;
 b=SxLQxawg8YNaO1Z9LIcJqkTI4rNIBh4VdDT8BdDmkP5KmGadUymu6pG0rmbH8IW9th8vOf
 /9Hi/I8vUl9V0ZPa9HCqzqWVhjBfcywf+lMT9fmOmN8LgVr8jExkoFw/E/a+3n+SnuqZrI
 8TQlpvL0kjU+k2G353qGgMBScZsb3Mw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-287-OiC-7E2VMbeGGViGqm6hkg-1; Wed,
 05 Mar 2025 18:08:45 -0500
X-MC-Unique: OiC-7E2VMbeGGViGqm6hkg-1
X-Mimecast-MFC-AGG-ID: OiC-7E2VMbeGGViGqm6hkg_1741216119
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 94E071800257; Wed,  5 Mar 2025 23:08:39 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3944D300019E; Wed,  5 Mar 2025 23:08:35 +0000 (UTC)
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
Subject: [RFC v3 28/33] rust: drm/kms: Add DriverCrtc::atomic_enable() and
 atomic_disable()
Date: Wed,  5 Mar 2025 17:59:44 -0500
Message-ID: <20250305230406.567126-29-lyude@redhat.com>
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

Optional trait methods for implementing the atomic_enable and
atomic_disable callbacks of a CRTC.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/crtc.rs | 88 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 131d10505ba07..9026d0911aa86 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -76,8 +76,16 @@ pub trait DriverCrtc: Send + Sync + Sized {
         },
 
         helper_funcs: bindings::drm_crtc_helper_funcs {
-            atomic_disable: None,
-            atomic_enable: None,
+            atomic_disable: if Self::HAS_ATOMIC_DISABLE {
+                Some(atomic_disable_callback::<Self>)
+            } else {
+                None
+            },
+            atomic_enable: if Self::HAS_ATOMIC_ENABLE {
+                Some(atomic_enable_callback::<Self>)
+            } else {
+                None
+            },
             atomic_check: if Self::HAS_ATOMIC_CHECK {
                 Some(atomic_check_callback::<Self>)
             } else {
@@ -170,6 +178,34 @@ fn atomic_flush(
     ) {
         build_error::build_error("This should never be reachable")
     }
+
+    /// The optional [`drm_crtc_helper_funcs.atomic_enable`] hook.
+    ///
+    /// This hook will be called before enabling a [`Crtc`] in an atomic commit.
+    ///
+    /// [`drm_crtc_helper_funcs.atomic_enable`]: srctree/include/drm/drm_modeset_helper_vtables.h
+    fn atomic_enable(
+        _crtc: &Crtc<Self>,
+        _old_state: &CrtcState<Self::State>,
+        _new_state: CrtcStateMutator<'_, CrtcState<Self::State>>,
+        _state: &AtomicStateMutator<Self::Driver>,
+    ) {
+        build_error::build_error("This should never be reachable")
+    }
+
+    /// The optional [`drm_crtc_helper_funcs.atomic_disable`] hook.
+    ///
+    /// This hook will be called before disabling a [`Crtc`] in an atomic commit.
+    ///
+    /// [`drm_crtc_helper_funcs.atomic_disable`]: srctree/include/drm/drm_modeset_helper_vtables.h
+    fn atomic_disable(
+        _crtc: &Crtc<Self>,
+        _old_state: &CrtcState<Self::State>,
+        _new_state: CrtcStateMutator<'_, CrtcState<Self::State>>,
+        _state: &AtomicStateMutator<Self::Driver>,
+    ) {
+        build_error::build_error("This should never be reachable")
+    }
 }
 
 /// The generated C vtable for a [`DriverCrtc`].
@@ -1004,3 +1040,51 @@ fn vtable(&self) -> *const Self::Vtable {
 
     T::atomic_flush(crtc, old_state, new_state, &state);
 }
+
+unsafe extern "C" fn atomic_enable_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc,
+    state: *mut bindings::drm_atomic_state,
+) {
+    // SAFETY:
+    // - We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
+    // - We're guaranteed by DRM that `crtc` is pointing to a valid initialized state.
+    let crtc = unsafe { Crtc::from_raw(crtc) };
+
+    // SAFETY: DRM never passes an invalid ptr for `state`
+    let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
+
+    // SAFETY: We're in an atomic enable callback, so we know that both the new and old state are
+    // present
+    let (old_state, new_state) = unsafe {
+        (
+            state.get_old_crtc_state(crtc).unwrap_unchecked(),
+            state.get_new_crtc_state(crtc).unwrap_unchecked(),
+        )
+    };
+
+    T::atomic_enable(crtc, old_state, new_state, &state);
+}
+
+unsafe extern "C" fn atomic_disable_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc,
+    state: *mut bindings::drm_atomic_state,
+) {
+    // SAFETY:
+    // - We're guaranteed `crtc` points to a valid instance of `drm_crtc`
+    // - We're guaranteed that `crtc` is of type `Plane<T>` by `DriverPlane`s type invariants.
+    let crtc = unsafe { Crtc::from_raw(crtc) };
+
+    // SAFETY: We're guaranteed that `state` points to a valid `drm_crtc_state` by DRM
+    let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
+
+    // SAFETY: We're in an atomic commit callback, so we know that both the new and old state are
+    // present
+    let (old_state, new_state) = unsafe {
+        (
+            state.get_old_crtc_state(crtc).unwrap_unchecked(),
+            state.get_new_crtc_state(crtc).unwrap_unchecked(),
+        )
+    };
+
+    T::atomic_disable(crtc, old_state, new_state, &state);
+}
-- 
2.48.1

