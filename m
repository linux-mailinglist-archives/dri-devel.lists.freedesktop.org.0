Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEAE98B106
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF6D10E5A3;
	Mon, 30 Sep 2024 23:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X+J+XuJZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF4510E5A5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JS1c0OCCFpRlXiQX91H1LkrlyJCKWK3k0GLCh/QD2fY=;
 b=X+J+XuJZbyp6oUJg++dE3ETdEYznByeiitLdjYbJTsY8YDJFGkmpLieXdX32ProahJD12Y
 fw7MxTHDE18VEHt3gbIHcoNtEjywNB7xlXHUjTOc2YYQuREXw0dS9RagZq19Ven2DrAM7m
 +ZyzHMrq4xaXNHC2b9Ripq41uJNUW6I=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-570-mojEH0EhNHi2ABqV4vN0Nw-1; Mon,
 30 Sep 2024 19:40:56 -0400
X-MC-Unique: mojEH0EhNHi2ABqV4vN0Nw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A954819626FA; Mon, 30 Sep 2024 23:40:53 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3E4333003DEC; Mon, 30 Sep 2024 23:40:49 +0000 (UTC)
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
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 27/35] rust: drm/kms: Add drm_framebuffer bindings
Date: Mon, 30 Sep 2024 19:10:10 -0400
Message-ID: <20240930233257.1189730-28-lyude@redhat.com>
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

This adds some very simple bindings for drm_framebuffer. We don't use them
much yet, but we'll eventually be using them when rvkms eventually gets CRC
and writeback support. Just like Connector objects, these use RcModeObject.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h    |  1 +
 rust/kernel/drm/kms.rs             |  1 +
 rust/kernel/drm/kms/framebuffer.rs | 58 ++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 rust/kernel/drm/kms/framebuffer.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 7695f11f4363c..7c324003c3885 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -15,6 +15,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fbdev_shmem.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 4ab039d67352e..3edd90bc0025a 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -7,6 +7,7 @@
 pub mod crtc;
 pub mod encoder;
 pub mod fbdev;
+pub mod framebuffer;
 pub mod plane;
 
 use crate::{
diff --git a/rust/kernel/drm/kms/framebuffer.rs b/rust/kernel/drm/kms/framebuffer.rs
new file mode 100644
index 0000000000000..bbe408c187670
--- /dev/null
+++ b/rust/kernel/drm/kms/framebuffer.rs
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//! DRM Framebuffer related bindings
+
+use crate::{
+    drm::{
+        device::Device,
+        fourcc::*,
+    },
+    types::*,
+    prelude::*,
+};
+use bindings;
+use core::{
+    marker::*,
+    slice,
+};
+use super::{ModeObject, RcModeObject, KmsDriver};
+
+/// The main interface for [`struct drm_framebuffer`].
+///
+/// [`struct drm_framebuffer`]: srctree/include/drm/drm_framebuffer.h
+#[repr(transparent)]
+pub struct Framebuffer<T: KmsDriver> {
+    inner: Opaque<bindings::drm_framebuffer>,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> ModeObject for Framebuffer<T> {
+    type Driver = T;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        unsafe { Device::borrow((*self.inner.get()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose Framebuffer<T> to users before it's initialized, so `base` is
+        // always initialized
+        unsafe { &mut (*self.inner.get()).base }
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
+impl<T: KmsDriver> crate::private::Sealed for Framebuffer<T> {}
+
+impl<T: KmsDriver> Framebuffer<T> {
+    #[inline]
+    pub(super) unsafe fn from_raw<'a>(ptr: *const bindings::drm_framebuffer) -> &'a Self {
+        // SAFETY: Our data layout is identical to drm_framebuffer
+        unsafe { &*ptr.cast() }
+    }
+}
-- 
2.46.1

