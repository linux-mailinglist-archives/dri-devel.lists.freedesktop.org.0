Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B6A53E1D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EE710E85B;
	Wed,  5 Mar 2025 23:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b2PFf3M2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3C10E85B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOW7KDNY/rnfsCrl7d4OXtnM2CoD0PhVS/YjiuzS72A=;
 b=b2PFf3M2BRO7uZz2vsBt+NOneflcmELj07vIYT4RLUSFOprbq4CX7YqMChE+FdVKy7Iblj
 MOwHJeSS5HhWKjd+kyKlgAmQnygkB8rAIk7FZRdkbYBV73ChgHtyYZMDA/vYRm+sBwoPCg
 /FjuOA6PtAjiN90vZMVUyze9mFKEfTQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-SE5Zl_emMbu36FTP4ZVAKg-1; Wed,
 05 Mar 2025 18:08:18 -0500
X-MC-Unique: SE5Zl_emMbu36FTP4ZVAKg-1
X-Mimecast-MFC-AGG-ID: SE5Zl_emMbu36FTP4ZVAKg_1741216095
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CDB52180035E; Wed,  5 Mar 2025 23:08:15 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DCC21300019E; Wed,  5 Mar 2025 23:08:10 +0000 (UTC)
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
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 25/33] rust: drm/kms: Add drm_framebuffer bindings
Date: Wed,  5 Mar 2025 17:59:41 -0500
Message-ID: <20250305230406.567126-26-lyude@redhat.com>
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

This adds some very simple bindings for drm_framebuffer. We don't use them
much yet, but we'll eventually be using them when rvkms eventually gets CRC
and writeback support. Just like Connector objects, these use RcModeObject.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Replace Framebuffer struct with tuple
* Add safety comments for ModeObject implementation
* Add comment for why we're using Sealed

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h    |  1 +
 rust/kernel/drm/kms.rs             |  1 +
 rust/kernel/drm/kms/framebuffer.rs | 74 ++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 rust/kernel/drm/kms/framebuffer.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 846eb6eb8fc4c..2e80a62062fc8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -18,6 +18,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fbdev_shmem.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 978bb6712ffbe..429ce28229c9e 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -6,6 +6,7 @@
 pub mod connector;
 pub mod crtc;
 pub mod encoder;
+pub mod framebuffer;
 pub mod plane;
 
 use crate::{
diff --git a/rust/kernel/drm/kms/framebuffer.rs b/rust/kernel/drm/kms/framebuffer.rs
new file mode 100644
index 0000000000000..5a60b580fe0bf
--- /dev/null
+++ b/rust/kernel/drm/kms/framebuffer.rs
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM framebuffers.
+//!
+//! C header: [`include/drm/drm_framebuffer.h`](srctree/include/drm/drm_framebuffer.h)
+
+use super::{KmsDriver, ModeObject, RcModeObject};
+use crate::{drm::device::Device, types::*};
+use bindings;
+use core::{marker::*, ptr};
+
+/// The main interface for [`struct drm_framebuffer`].
+///
+/// # Invariants
+///
+/// - `self.0` is initialized for as long as this object is exposed to users.
+/// - This type has an identical data layout to [`struct drm_framebuffer`]
+///
+/// [`struct drm_framebuffer`]: srctree/include/drm/drm_framebuffer.h
+#[repr(transparent)]
+pub struct Framebuffer<T: KmsDriver>(Opaque<bindings::drm_framebuffer>, PhantomData<T>);
+
+// SAFETY:
+// - `self.0` is initialized for as long as this object is exposed to users
+// - `base` is initialized by DRM when `self.0` is initialized, thus `raw_mode_obj()` always returns
+//   a valid pointer.
+unsafe impl<T: KmsDriver> ModeObject for Framebuffer<T> {
+    type Driver = T;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: `dev` points to an initialized `struct drm_device` for as long as this type is
+        // initialized
+        unsafe { Device::borrow((*self.0.get()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose Framebuffer<T> to users before its initialized, so `base` is
+        // always initialized
+        unsafe { ptr::addr_of_mut!((*self.0.get()).base) }
+    }
+}
+
+// SAFETY: Framebuffers are refcounted mode objects.
+unsafe impl<T: KmsDriver> RcModeObject for Framebuffer<T> {}
+
+// SAFETY: References to framebuffers are safe to be accessed from any thread
+unsafe impl<T: KmsDriver> Send for Framebuffer<T> {}
+// SAFETY: References to framebuffers are safe to be accessed from any thread
+unsafe impl<T: KmsDriver> Sync for Framebuffer<T> {}
+
+// For implementing ModeObject
+impl<T: KmsDriver> crate::private::Sealed for Framebuffer<T> {}
+
+impl<T: KmsDriver> PartialEq for Framebuffer<T> {
+    fn eq(&self, other: &Self) -> bool {
+        ptr::eq(self.0.get(), other.0.get())
+    }
+}
+impl<T: KmsDriver> Eq for Framebuffer<T> {}
+
+impl<T: KmsDriver> Framebuffer<T> {
+    /// Convert a raw pointer to a `struct drm_framebuffer` into a [`Framebuffer`]
+    ///
+    /// # Safety
+    ///
+    /// The caller guarantews that `ptr` points to a initialized `struct drm_framebuffer` for at
+    /// least the entire lifetime of `'a`.
+    #[inline]
+    #[allow(dead_code)]
+    pub(super) unsafe fn from_raw<'a>(ptr: *const bindings::drm_framebuffer) -> &'a Self {
+        // SAFETY: Our data layout is identical to drm_framebuffer
+        unsafe { &*ptr.cast() }
+    }
+}
-- 
2.48.1

