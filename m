Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC63A53E21
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303F010E85E;
	Wed,  5 Mar 2025 23:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TmJHuMyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C7B10E85E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YYipArKfP/H/ebwT6dHqlh88VV98EgX7zofrorIO0I=;
 b=TmJHuMyHTIoaw/yq5+Ey6K+SqyyM8NTgtlxxeY8FQDmga8YsNY+4YWFJyhJR3OlBnB5S2Q
 MjBE6+pZj0HOVKnXxLkXwHd56z7VMCcMerFiwTiQNy9R4oM5p3PUWNb5olSnr8VX9LsT/u
 TNfivwGaFuZI5/boyhsy8GOFE/+hh7Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-64-lGH8R1nMOOuHUE3SfhubMQ-1; Wed,
 05 Mar 2025 18:08:34 -0500
X-MC-Unique: lGH8R1nMOOuHUE3SfhubMQ-1
X-Mimecast-MFC-AGG-ID: lGH8R1nMOOuHUE3SfhubMQ_1741216111
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B94781801A03; Wed,  5 Mar 2025 23:08:31 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0DC5A300019E; Wed,  5 Mar 2025 23:08:27 +0000 (UTC)
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
Subject: [RFC v3 27/33] rust: drm/kms: Add DriverCrtc::atomic_begin() and
 atomic_flush()
Date: Wed,  5 Mar 2025 17:59:43 -0500
Message-ID: <20250305230406.567126-28-lyude@redhat.com>
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

Optional trait methods for implementing the atomic_begin and atomic_flush
callbacks for a CRTC.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/crtc.rs | 90 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index aaa208b35c3c1..131d10505ba07 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -90,8 +90,16 @@ pub trait DriverCrtc: Send + Sync + Sized {
             mode_set: None,
             mode_valid: None,
             mode_fixup: None,
-            atomic_begin: None,
-            atomic_flush: None,
+            atomic_begin: if Self::HAS_ATOMIC_BEGIN {
+                Some(atomic_begin_callback::<Self>)
+            } else {
+                None
+            },
+            atomic_flush: if Self::HAS_ATOMIC_FLUSH {
+                Some(atomic_flush_callback::<Self>)
+            } else {
+                None
+            },
             mode_set_nofb: None,
             mode_set_base: None,
             mode_set_base_atomic: None,
@@ -132,6 +140,36 @@ fn atomic_check(
     ) -> Result {
         build_error::build_error("This should not be reachable")
     }
+
+    /// The optional [`drm_crtc_helper_funcs.atomic_begin`] hook.
+    ///
+    /// This hook will be called before a set of [`Plane`] updates are performed for the given
+    /// [`Crtc`].
+    ///
+    /// [`drm_crtc_helper_funcs.atomic_begin`]: srctree/include/drm/drm_modeset_helper_vtables.h
+    fn atomic_begin(
+        _crtc: &Crtc<Self>,
+        _old_state: &CrtcState<Self::State>,
+        _new_state: CrtcStateMutator<'_, CrtcState<Self::State>>,
+        _state: &AtomicStateMutator<Self::Driver>,
+    ) {
+        build_error::build_error("This should not be reachable")
+    }
+
+    /// The optional [`drm_crtc_helper_funcs.atomic_flush`] hook.
+    ///
+    /// This hook will be called after a set of [`Plane`] updates are performed for the given
+    /// [`Crtc`].
+    ///
+    /// [`drm_crtc_helper_funcs.atomic_flush`]: srctree/include/drm/drm_modeset_helper_vtables.h
+    fn atomic_flush(
+        _crtc: &Crtc<Self>,
+        _old_state: &CrtcState<Self::State>,
+        _new_state: CrtcStateMutator<'_, CrtcState<Self::State>>,
+        _state: &AtomicStateMutator<Self::Driver>,
+    ) {
+        build_error::build_error("This should never be reachable")
+    }
 }
 
 /// The generated C vtable for a [`DriverCrtc`].
@@ -918,3 +956,51 @@ fn vtable(&self) -> *const Self::Vtable {
         Ok(0)
     })
 }
+
+unsafe extern "C" fn atomic_begin_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc,
+    state: *mut bindings::drm_atomic_state,
+) {
+    // SAFETY:
+    // * We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
+    // * We're guaranteed by DRM that `crtc` is pointing to a valid initialized state.
+    let crtc = unsafe { Crtc::from_raw(crtc) };
+
+    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_state`
+    let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
+
+    // SAFETY: We're guaranteed by DRM that both the old and new atomic state are present within
+    // this `drm_atomic_state`
+    let (old_state, new_state) = unsafe {
+        (
+            state.get_old_crtc_state(crtc).unwrap_unchecked(),
+            state.get_new_crtc_state(crtc).unwrap_unchecked(),
+        )
+    };
+
+    T::atomic_begin(crtc, old_state, new_state, &state);
+}
+
+unsafe extern "C" fn atomic_flush_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc,
+    state: *mut bindings::drm_atomic_state,
+) {
+    // SAFETY:
+    // - We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
+    // - We're guaranteed by DRM that `crtc` is pointing to a valid initialized state.
+    let crtc = unsafe { Crtc::from_raw(crtc) };
+
+    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_state`
+    let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
+
+    // SAFETY: We're in an atomic flush callback, so we know that both the new and old state are
+    // present
+    let (old_state, new_state) = unsafe {
+        (
+            state.get_old_crtc_state(crtc).unwrap_unchecked(),
+            state.get_new_crtc_state(crtc).unwrap_unchecked(),
+        )
+    };
+
+    T::atomic_flush(crtc, old_state, new_state, &state);
+}
-- 
2.48.1

