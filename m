Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98B798B100
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3C010E5A6;
	Mon, 30 Sep 2024 23:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="daFccErm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F054710E5A2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ks/AeHTgPHpVhwmTJF1Of6G8oz5pXr9wZPJOSOab2EM=;
 b=daFccErm2uPDhJwTn8HeF6oLx0Fmxw8kO1AzHkdeIF0bYG4nJqe3PHsr2LpWn7LWSXKd5m
 Ap7lrMTnuPUAq3yTPPueX/dgI7nN2qx4YH9PPb9YDOZHg2gPdPGlGDsBDxvIkhaY67wih2
 tCg+omBPsBK+s3Szp+0iWCO8iqzcr5E=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-351-ZiOOdnYzM3yS3u0JqSaZCg-1; Mon,
 30 Sep 2024 19:40:24 -0400
X-MC-Unique: ZiOOdnYzM3yS3u0JqSaZCg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2DAD2195395A; Mon, 30 Sep 2024 23:40:20 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 16F4A3003DEC; Mon, 30 Sep 2024 23:40:15 +0000 (UTC)
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
Subject: [WIP RFC v2 23/35] rust: drm/kms: Add DriverPlane::atomic_check()
Date: Mon, 30 Sep 2024 19:10:06 -0400
Message-ID: <20240930233257.1189730-24-lyude@redhat.com>
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

Optional trait method for implementing a plane's atomic_check().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/plane.rs | 41 +++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 506ed5ced1270..04f1bdfbb1ea2 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -74,7 +74,7 @@ pub trait DriverPlane: Send + Sync + Sized {
             cleanup_fb: None,
             begin_fb_access: None, // TODO: someday?
             end_fb_access: None, // TODO: someday?
-            atomic_check: None,
+            atomic_check: if Self::HAS_ATOMIC_CHECK { Some(atomic_check_callback::<Self>) } else { None },
             atomic_update: if Self::HAS_ATOMIC_UPDATE { Some(atomic_update_callback::<Self>) } else { None },
             atomic_enable: None, // TODO
             atomic_disable: None, // TODO
@@ -118,6 +118,21 @@ fn atomic_update(
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
+        plane: &Plane<Self>,
+        new_state: BorrowedPlaneState<'_, PlaneState<Self::State>>,
+        old_state: &PlaneState<Self::State>,
+        state: &AtomicStateComposer<Self::Driver>
+    ) -> Result {
+        build_error::build_error("This should not be reachable")
+    }
 }
 
 /// The generated C vtable for a [`DriverPlane`].
@@ -794,3 +809,27 @@ fn deref_mut(&mut self) -> &mut Self::Target {
 
     T::atomic_update(plane, new_state, old_state, &state);
 }
+
+unsafe extern "C" fn atomic_check_callback<T: DriverPlane>(
+    plane: *mut bindings::drm_plane,
+    state: *mut bindings::drm_atomic_state,
+) -> i32 {
+    // SAFETY:
+    // * We're guaranteed `plane` is of type `Plane<T>` via type invariants.
+    // * We're guaranteed by DRM that `plane` is pointing to a valid initialized state.
+    let plane = unsafe { Plane::from_raw(plane) };
+
+    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_state`
+    let state = ManuallyDrop::new(unsafe {
+        AtomicStateComposer::<T::Driver>::new(NonNull::new_unchecked(state))
+    });
+
+    // SAFETY: We're guaranteed by DRM that both the old and new atomic state are present within
+    // this `drm_atomic_state`
+    let (old_state, new_state) = unsafe {(
+        state.get_old_plane_state(plane).unwrap_unchecked(),
+        state.get_new_plane_state(plane).unwrap_unchecked(),
+    )};
+
+    from_result(|| T::atomic_check(plane, new_state, old_state, &state).map(|_| 0))
+}
-- 
2.46.1

