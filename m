Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C28A53E17
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D0E10E858;
	Wed,  5 Mar 2025 23:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NQJBGNbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF10B10E85A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Sa15p0zk9/0E89lqNYU9Y3htAIogxJ6GNdp/TIXh9E=;
 b=NQJBGNbc73lSIyX37/g2VGF00ucTURTVWRRUkj4tiVot30r7Fz3X3WeTbjMMM9XkQVqv6C
 jP620sto5tzwFt9QdrSNuFZta88rMcQUHmM+OjhMI5LUxQUTMMeouxoLQNTiOZXM+LwhE/
 eVXi+CQZtR89gk3mEDK5qqw9bYxkm4M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-gMt0t3KrPU-Esgh-380sOA-1; Wed,
 05 Mar 2025 18:07:36 -0500
X-MC-Unique: gMt0t3KrPU-Esgh-380sOA-1
X-Mimecast-MFC-AGG-ID: gMt0t3KrPU-Esgh-380sOA_1741216054
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E452E18001D0; Wed,  5 Mar 2025 23:07:33 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 802F5300019E; Wed,  5 Mar 2025 23:07:30 +0000 (UTC)
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
Subject: [RFC v3 20/33] rust: drm/kms: Add DriverPlane::atomic_update()
Date: Wed,  5 Mar 2025 17:59:36 -0500
Message-ID: <20250305230406.567126-21-lyude@redhat.com>
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

A mandatory trait method used for implementing DRM's atomic plane update
callback.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/plane.rs | 45 +++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 4e73c2966ca22..b090aebc35649 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -70,7 +70,11 @@ pub trait DriverPlane: Send + Sync + Sized {
             begin_fb_access: None,
             end_fb_access: None,
             atomic_check: None,
-            atomic_update: None,
+            atomic_update: if Self::HAS_ATOMIC_UPDATE {
+                Some(atomic_update_callback::<Self>)
+            } else {
+                None
+            },
             atomic_enable: None,
             atomic_disable: None,
             atomic_async_check: None,
@@ -98,6 +102,21 @@ pub trait DriverPlane: Send + Sync + Sized {
     ///
     /// Drivers may use this to instantiate their [`DriverPlane`] object.
     fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl PinInit<Self, Error>;
+
+    /// The optional [`drm_plane_helper_funcs.atomic_update`] hook for this plane.
+    ///
+    /// Drivers may use this to customize the atomic update phase of their [`Plane`] objects. If not
+    /// specified, this function is a no-op.
+    ///
+    /// [`drm_plane_helper_funcs.atomic_update`]: srctree/include/drm/drm_modeset_helper_vtables.h
+    fn atomic_update(
+        _plane: &Plane<Self>,
+        _new_state: PlaneStateMutator<'_, PlaneState<Self::State>>,
+        _old_state: &PlaneState<Self::State>,
+        _state: &AtomicStateMutator<Self::Driver>,
+    ) {
+        build_error::build_error("This should not be reachable")
+    }
 }
 
 /// The generated C vtable for a [`DriverPlane`].
@@ -931,3 +950,27 @@ fn <D, P>(PlaneStateMutator<'a, OpaquePlaneState<D>>) -> Self
     // - The cast to `drm_plane_state` is safe via `PlaneState`s type invariants.
     unsafe { bindings::__drm_atomic_helper_plane_reset(plane, KBox::into_raw(new).cast()) };
 }
+
+unsafe extern "C" fn atomic_update_callback<T: DriverPlane>(
+    plane: *mut bindings::drm_plane,
+    state: *mut bindings::drm_atomic_state,
+) {
+    // SAFETY:
+    // - We're guaranteed `plane` is of type `Plane<T>` via type invariants.
+    // - We're guaranteed by DRM that `plane` is pointing to a valid initialized state.
+    let plane = unsafe { Plane::from_raw(plane) };
+
+    // SAFETY: DRM guarantees `state` points to a valid `drm_atomic_state`
+    let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
+
+    // SAFETY: Since we are in the atomic update callback, we're guaranteed by DRM that both the old
+    // and new atomic state are present within `state`
+    let (old_state, new_state) = unsafe {
+        (
+            state.get_old_plane_state(plane).unwrap_unchecked(),
+            state.get_new_plane_state(plane).unwrap_unchecked(),
+        )
+    };
+
+    T::atomic_update(plane, new_state, old_state, &state);
+}
-- 
2.48.1

