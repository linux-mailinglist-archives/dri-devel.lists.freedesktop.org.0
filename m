Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7B96BE8F7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D10C10EEEC;
	Fri, 17 Mar 2023 12:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C389610EEEA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kJaQBIOfBDs0RWrdELn2youmyuMDTiMuE+q39Kq1BLg=; b=hTiBfpccfb2e+p5dsLtL8znqCw
 KybIWKF8huofaSYeHF5npijUa3pg8ERQM9bVNP/ctX3S+A6s8yaWMwo6UiTGKmEQ2EdpwZuoV1S1K
 S8QEaoD1s5gV5641IKz/3Px8Unlfnw5ipOt5B3MePzeAeYdLGqQZAkueB7rG5Ol7HlqFq/KBb2pua
 JheFiMmnwFQ4TdHX1vBIWXb/3qEyBmcjs8v0UjQaEIz6D1Hwj/62Mce0SVl9SkwFRguCj41s174LK
 OKlsA3RT1z/b7ZYx5VQrWuI0C7lPCoeaXnut9/8P8TWV/Rw9gusy3sQpZ0GlH5xDUCN1QA5jTfiL9
 hWYird5A==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pd8xA-00FrGz-Da; Fri, 17 Mar 2023 13:13:00 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Asahi Lina <lina@asahilina.net>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [RFC PATCH 1/9] rust: dma_resv: add DMA Reservation abstraction
Date: Fri, 17 Mar 2023 09:12:05 -0300
Message-Id: <20230317121213.93991-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317121213.93991-1-mcanal@igalia.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DMA reservation object provides a mechanism to manage a container
of dma_fence object associated with a resource. So, add an abstraction
to allow Rust drivers to interact with this subsystem.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers.c                  | 19 +++++++++
 rust/kernel/dma_resv.rs         | 75 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 96 insertions(+)
 create mode 100644 rust/kernel/dma_resv.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3fcf3ee330ad..1bf6d762d36e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -19,6 +19,7 @@
 #include <linux/dma-fence.h>
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-resv.h>
 #include <linux/fs.h>
 #include <linux/iosys-map.h>
 #include <linux/io-pgtable.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index 7cded4a36375..18c0c434ad73 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -25,6 +25,7 @@
 #include <linux/build_bug.h>
 #include <linux/device.h>
 #include <linux/dma-fence.h>
+#include <linux/dma-resv.h>
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -437,6 +438,24 @@ void rust_helper_dma_fence_set_error(struct dma_fence *fence, int error)
 }
 EXPORT_SYMBOL_GPL(rust_helper_dma_fence_set_error);
 
+enum dma_resv_usage rust_helper_dma_resv_usage_rw(bool write)
+{
+	return dma_resv_usage_rw(write);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dma_resv_usage_rw);
+
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dma_resv_lock);
+
+void rust_helper_dma_resv_unlock(struct dma_resv *obj)
+{
+	dma_resv_unlock(obj);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dma_resv_unlock);
+
 #endif
 
 #ifdef CONFIG_DRM
diff --git a/rust/kernel/dma_resv.rs b/rust/kernel/dma_resv.rs
new file mode 100644
index 000000000000..5e45aad4ae75
--- /dev/null
+++ b/rust/kernel/dma_resv.rs
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DMA resv abstraction
+//!
+//! C header: [`include/linux/dma-resv.h`](../../include/linux/dma-resv.h)
+
+use crate::bindings;
+use crate::dma_fence::RawDmaFence;
+use crate::error::{Error, Result};
+
+/// A generic DMA Resv Object
+///
+/// # Invariants
+/// ptr is a valid pointer to a dma_resv and we own a reference to it.
+pub struct DmaResv {
+    ptr: *mut bindings::dma_resv,
+}
+
+impl DmaResv {
+    /// Create a new DmaResv object from a raw pointer to a dma_resv.
+    ///
+    /// # Safety
+    /// The caller must own a reference to the dma_resv, which is transferred to the new object.
+    pub unsafe fn from_raw(ptr: *mut bindings::dma_resv) -> Self {
+        Self { ptr }
+    }
+
+    /// Returns the implicit synchronization usage for write or read accesses.
+    pub fn usage_rw(&self, write: bool) -> bindings::dma_resv_usage {
+        // SAFETY: write is a valid bool.
+        unsafe { bindings::dma_resv_usage_rw(write) }
+    }
+
+    /// Reserve space to add fences to a dma_resv object.
+    pub fn reserve_fences(&self, num_fences: u32) -> Result {
+        // SAFETY: We own a reference to this dma_resv.
+        let ret = unsafe { bindings::dma_resv_reserve_fences(self.ptr, num_fences) };
+
+        if ret != 0 {
+            return Err(Error::from_kernel_errno(ret));
+        }
+        Ok(())
+    }
+
+    /// Add a fence to the dma_resv object
+    pub fn add_fences(
+        &self,
+        fence: &dyn RawDmaFence,
+        num_fences: u32,
+        usage: bindings::dma_resv_usage,
+    ) -> Result {
+        // SAFETY: We own a reference to this dma_resv.
+        unsafe { bindings::dma_resv_lock(self.ptr, core::ptr::null_mut()) };
+
+        let ret = self.reserve_fences(num_fences);
+        if ret.is_ok() {
+            // SAFETY: ptr is locked with dma_resv_lock(), and dma_resv_reserve_fences()
+            // has been called.
+            unsafe {
+                bindings::dma_resv_add_fence(self.ptr, fence.raw(), usage);
+            }
+        }
+
+        // SAFETY: We own a reference to this dma_resv.
+        unsafe { bindings::dma_resv_unlock(self.ptr) };
+
+        ret
+    }
+
+    /// Test if a reservation object’s fences have been signaled.
+    pub fn test_signaled(&self, usage: bindings::dma_resv_usage) -> bool {
+        // SAFETY: We own a reference to this dma_resv.
+        unsafe { bindings::dma_resv_test_signaled(self.ptr, usage) }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ba18deedf6b6..b9fbb07d0bdc 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -38,6 +38,7 @@ pub mod delay;
 pub mod device;
 #[cfg(CONFIG_DMA_SHARED_BUFFER)]
 pub mod dma_fence;
+pub mod dma_resv;
 pub mod driver;
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
-- 
2.39.2

