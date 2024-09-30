Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009AC98B10A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799F510E5A8;
	Mon, 30 Sep 2024 23:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QalZnnmw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFF910E5A8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hf2PwgqqoorfI7tgNpCFOlFnV5DzwsS0y6C7e13QCQQ=;
 b=QalZnnmw+f213HUQlvJoMt+dMkgcMB/K7ooPUMN40JDIpj8yckQ0ubEppYpJC5GRg7IL70
 mI7tYyktrX4jVZmimmn92hJzANRVxiq8ba5PgG5RojgRegPlVQUtEF7geuL11MWEv6oN2f
 IflL4Uc1OBNkYMT4J2d52UmSHiaTgIE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-_xPnOvVNMX-5Pb_SaZ2qGQ-1; Mon,
 30 Sep 2024 19:41:16 -0400
X-MC-Unique: _xPnOvVNMX-5Pb_SaZ2qGQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 583F8196D18E; Mon, 30 Sep 2024 23:41:14 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6EB443003DEC; Mon, 30 Sep 2024 23:41:10 +0000 (UTC)
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
Subject: [WIP RFC v2 30/35] rust: drm/kms: Add DriverCrtc::atomic_enable() and
 atomic_disable()
Date: Mon, 30 Sep 2024 19:10:13 -0400
Message-ID: <20240930233257.1189730-31-lyude@redhat.com>
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

Optional trait methods for implementing the atomic_enable and
atomic_disable callbacks of a CRTC.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/crtc.rs | 76 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index a4e955364bd8c..ef1b331f742d0 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -80,8 +80,8 @@ pub trait DriverCrtc: Send + Sync + Sized {
         },
 
         helper_funcs: bindings::drm_crtc_helper_funcs {
-            atomic_disable: None,
-            atomic_enable: None,
+            atomic_disable: if Self::HAS_ATOMIC_DISABLE { Some(atomic_disable_callback::<Self>) } else { None },
+            atomic_enable: if Self::HAS_ATOMIC_ENABLE { Some(atomic_enable_callback::<Self>) } else { None },
             atomic_check: if Self::HAS_ATOMIC_CHECK { Some(atomic_check_callback::<Self>) } else { None },
             dpms: None,
             commit: None,
@@ -162,6 +162,34 @@ fn atomic_flush(
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
+        crtc: &Crtc<Self>,
+        old_state: &CrtcState<Self::State>,
+        new_state: BorrowedCrtcState<'_, CrtcState<Self::State>>,
+        state: &AtomicStateMutator<Self::Driver>
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
+        crtc: &Crtc<Self>,
+        old_state: &CrtcState<Self::State>,
+        new_state: BorrowedCrtcState<'_, CrtcState<Self::State>>,
+        state: &AtomicStateMutator<Self::Driver>
+    ) {
+        build_error::build_error("This should never be reachable")
+    }
 }
 
 /// The generated C vtable for a [`DriverCrtc`].
@@ -850,3 +878,47 @@ fn as_raw(&self) -> *mut bindings::drm_crtc_state {
 
     T::atomic_flush(crtc, old_state, new_state, &state);
 }
+
+unsafe extern "C" fn atomic_enable_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc,
+    state: *mut bindings::drm_atomic_state,
+) {
+    // SAFETY:
+    // * We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
+    // * We're guaranteed by DRM that `crtc` is pointing to a valid initialized state.
+    let crtc = unsafe { Crtc::from_raw(crtc) };
+
+    // SAFETY: DRM never passes an invalid ptr for `state`
+    let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
+
+    // SAFETY: We're in an atomic enable callback, so we know that both the new and old state are
+    // present
+    let (old_state, new_state) = unsafe {(
+        state.get_old_crtc_state(crtc).unwrap_unchecked(),
+        state.get_new_crtc_state(crtc).unwrap_unchecked(),
+    )};
+
+    T::atomic_enable(crtc, old_state, new_state, &state);
+}
+
+unsafe extern "C" fn atomic_disable_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc,
+    state: *mut bindings::drm_atomic_state,
+) {
+    // SAFETY:
+    // * We're guaranteed `crtc` points to a valid instance of `drm_crtc`
+    // * We're guaranteed that `crtc` is of type `Plane<T>` by `DriverPlane`s type invariants.
+    let crtc = unsafe { Crtc::from_raw(crtc) };
+
+    // SAFETY: We're guaranteed that `state` points to a valid `drm_crtc_state` by DRM
+    let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
+
+    // SAFETY: We're in an atomic commit callback, so we know that both the new and old state are
+    // present
+    let (old_state, new_state) = unsafe {(
+        state.get_old_crtc_state(crtc).unwrap_unchecked(),
+        state.get_new_crtc_state(crtc).unwrap_unchecked(),
+    )};
+
+    T::atomic_disable(crtc, old_state, new_state, &state);
+}
-- 
2.46.1

