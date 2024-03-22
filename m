Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DD8874C9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 23:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C6C11282F;
	Fri, 22 Mar 2024 22:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Sh+jLXNE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A3311282F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 22:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711145744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+o/hq/vRaAlqZorXgz61wZ5x9VfNVOFlmD2hAnuwQc=;
 b=Sh+jLXNEBJAp5e+n6Sph14X7feQT8DmOln9Tn/pDyNqpqpi9ClzLZP52fmTIHYpvWwfDNe
 tO/BhzpHh2fcAECqrhSqjvPWu4BUruwz1zIh6GmneL5Eo7/OmFdoxd2XR/e18HYQHSUKDb
 s8M9haG6HqdBVgmEnsWJazdn+Fdt7gw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-159-JjZz40PEMPe23vRDS-XaXg-1; Fri,
 22 Mar 2024 18:15:38 -0400
X-MC-Unique: JjZz40PEMPe23vRDS-XaXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5C3D3C02454;
 Fri, 22 Mar 2024 22:15:36 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.8.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA338173;
 Fri, 22 Mar 2024 22:15:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Asahi Lina <lina@asahilina.net>,
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 rust-for-linux@vger.kernel.org (open list:RUST)
Subject: [PATCH 4/4] WIP: rust/drm/kms: Add ShadowPlaneState<T>
Date: Fri, 22 Mar 2024 18:03:36 -0400
Message-ID: <20240322221305.1403600-5-lyude@redhat.com>
In-Reply-To: <20240322221305.1403600-1-lyude@redhat.com>
References: <20240322221305.1403600-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/rvkms/plane.rs           |  7 +++-
 rust/bindings/bindings_helper.h          |  2 +
 rust/kernel/drm/kms.rs                   |  1 +
 rust/kernel/drm/kms/gem_atomic_helper.rs | 48 ++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/drm/kms/gem_atomic_helper.rs

diff --git a/drivers/gpu/drm/rvkms/plane.rs b/drivers/gpu/drm/rvkms/plane.rs
index d98a1f7bf79e2..5fb1b63842929 100644
--- a/drivers/gpu/drm/rvkms/plane.rs
+++ b/drivers/gpu/drm/rvkms/plane.rs
@@ -4,7 +4,10 @@
     prelude::*,
     drm::{
         device::Device,
-        kms::plane::{self, DriverPlaneState},
+        kms::{
+            plane::{self, DriverPlaneState},
+            gem_atomic_helper::ShadowPlaneState,
+        }
     },
 };
 
@@ -15,7 +18,7 @@ pub(crate) struct DriverPlane {
 }
 
 pub(crate) type Plane = plane::Plane<DriverPlane>;
-pub(crate) type PlaneState = plane::PlaneState<RvkmsPlaneState>;
+pub(crate) type PlaneState = ShadowPlaneState<RvkmsPlaneState>;
 
 impl plane::DriverPlane for DriverPlane {
     type Initializer = impl PinInit<Self, Error>;
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 5856afbe6e8f6..73a5eb00e8625 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -12,6 +12,8 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index b55d14415367a..14f4c3842ada0 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -6,6 +6,7 @@
 pub mod crtc;
 pub mod encoder;
 pub mod plane;
+pub mod gem_atomic_helper;
 
 use crate::{
     drm::{drv, device::Device},
diff --git a/rust/kernel/drm/kms/gem_atomic_helper.rs b/rust/kernel/drm/kms/gem_atomic_helper.rs
new file mode 100644
index 0000000000000..85bc3df32d8b7
--- /dev/null
+++ b/rust/kernel/drm/kms/gem_atomic_helper.rs
@@ -0,0 +1,48 @@
+use crate::{
+    prelude::*,
+    private::Sealed,
+    bindings,
+    init::Zeroable,
+};
+use super::plane::{IntoPlaneState, DriverPlaneState};
+
+unsafe impl Zeroable for bindings::drm_shadow_plane_state {}
+
+#[derive(Default)]
+#[repr(C)]
+pub struct ShadowPlaneState<T: DriverPlaneState> {
+    shadow_state: bindings::drm_shadow_plane_state,
+    inner: T,
+}
+
+impl<T: DriverPlaneState> Sealed for ShadowPlaneState<T> {}
+
+static_assert!(crate::offset_of!(bindings::drm_shadow_plane_state, base) == 0);
+
+// SAFETY: Our data layout starts with drm_plane_state (contained at the start of
+// drm_shadow_plane_state)
+unsafe impl<T: DriverPlaneState> IntoPlaneState for ShadowPlaneState<T> {
+    fn __duplicate_state(&self, plane: *mut bindings::drm_plane) -> Result<Box<Self>> {
+        let mut new: Box<Self> = Box::try_init(try_init!(Self {
+            shadow_state: bindings::drm_shadow_plane_state { ..Default::default() },
+            inner: self.inner.clone()
+        }))?;
+
+        // SAFETY: FFI call with no special requirements
+        unsafe { bindings::__drm_gem_duplicate_shadow_plane_state(plane, &mut new.shadow_state) };
+
+        Ok(new)
+    }
+
+    fn __destroy_state(state: *mut bindings::drm_plane_state) {
+        // SAFETY: This would not be called without a plane state to destroy, and our data layout
+        // starts with `bindings::drm_plane_state`
+        unsafe { bindings::__drm_gem_destroy_shadow_plane_state(state.cast()) };
+    }
+
+    fn __reset_state(plane: *mut bindings::drm_plane, state: *mut bindings::drm_plane_state) {
+        // SAFETY: This would not be called without a plane state to reset, and our data layout
+        // starts with `bindings::drm_plane_state`
+        unsafe { bindings::__drm_gem_reset_shadow_plane(plane, state.cast()) }
+    }
+}
-- 
2.43.0

