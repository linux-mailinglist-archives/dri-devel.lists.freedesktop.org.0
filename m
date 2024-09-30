Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882398B0FD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AF810E5A0;
	Mon, 30 Sep 2024 23:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fbIk37o4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E69710E5A0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXYRkES5IMRSEWy/SdffRUBHVVSOxpQy/XQZZbTshqY=;
 b=fbIk37o4uUCywcXOq95gDkAMzprMwGOxUD7ZMuTfDmbdZNMXtT5+5N9aeMHJWvB8qYmX8u
 Z+BQ68TQZJ1GuwtJXK/X6xNIcUlK601Es5BH0MF0rtMp0I1ozllXDW45mp7QZUEqJLbbbz
 qLEUqu8tUSpTJcV1dKSf+P+O0gPAjJQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-ZZjrKZJOO3uRfv2nR5MVhg-1; Mon,
 30 Sep 2024 19:40:08 -0400
X-MC-Unique: ZZjrKZJOO3uRfv2nR5MVhg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 17FEF192DE39; Mon, 30 Sep 2024 23:40:06 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4928D3003E4D; Mon, 30 Sep 2024 23:40:02 +0000 (UTC)
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
Subject: [WIP RFC v2 21/35] rust: drm/kms: Introduce DriverCrtc::atomic_check()
Date: Mon, 30 Sep 2024 19:10:04 -0400
Message-ID: <20240930233257.1189730-22-lyude@redhat.com>
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

An optional trait method for implementing a CRTC's atomic state check.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/crtc.rs | 46 +++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 7864540705f76..43c7264402b07 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -27,7 +27,7 @@
     marker::*,
     ptr::{NonNull, null, null_mut, addr_of_mut, self},
     ops::{Deref, DerefMut},
-    mem,
+    mem::{self, ManuallyDrop},
 };
 use macros::vtable;
 
@@ -82,7 +82,7 @@ pub trait DriverCrtc: Send + Sync + Sized {
         helper_funcs: bindings::drm_crtc_helper_funcs {
             atomic_disable: None,
             atomic_enable: None,
-            atomic_check: None,
+            atomic_check: if Self::HAS_ATOMIC_CHECK { Some(atomic_check_callback::<Self>) } else { None },
             dpms: None,
             commit: None,
             prepare: None,
@@ -117,6 +117,21 @@ pub trait DriverCrtc: Send + Sync + Sized {
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
+        crtc: &Crtc<Self>,
+        old_state: &CrtcState<Self::State>,
+        new_state: BorrowedCrtcState<'_, CrtcState<Self::State>>,
+        state: &AtomicStateComposer<Self::Driver>
+    ) -> Result {
+        build_error::build_error("This should not be reachable")
+    }
 }
 
 /// The generated C vtable for a [`DriverCrtc`].
@@ -726,3 +741,30 @@ fn as_raw(&self) -> *mut bindings::drm_crtc_state {
         )
     };
 }
+
+unsafe extern "C" fn atomic_check_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc,
+    state: *mut bindings::drm_atomic_state,
+) -> i32 {
+    // SAFETY:
+    // * We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
+    // * We're guaranteed by DRM that `crtc` is pointing to a valid initialized state.
+    let crtc = unsafe { Crtc::from_raw(crtc) };
+
+    // SAFETY: DRM guarantees `state` points to a valid `drm_atomic_state`
+    let state = unsafe {
+        ManuallyDrop::new(AtomicStateComposer::new(NonNull::new_unchecked(state)))
+    };
+
+    // SAFETY: Since we are in the atomic update callback, we're guaranteed by DRM that both the old
+    // and new atomic state are present within `state`
+    let (old_state, new_state) = unsafe {(
+        state.get_old_crtc_state(crtc).unwrap_unchecked(),
+        state.get_new_crtc_state(crtc).unwrap_unchecked(),
+    )};
+
+    from_result(|| {
+        T::atomic_check(crtc, old_state, new_state, &state)?;
+        Ok(0)
+    })
+}
-- 
2.46.1

