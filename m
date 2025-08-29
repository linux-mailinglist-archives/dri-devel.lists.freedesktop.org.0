Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC1B3C538
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 00:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466C10EC50;
	Fri, 29 Aug 2025 22:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H56BAZrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A5B10EC4F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 22:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756507385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2F8pTf5YP3aNkFLN54qB5DgCyFojIIWqrlzr2JxhFU=;
 b=H56BAZrZIlIn47WklbSX5XTgiJYv6FZ66E4CyCyrcnESjppuMQPKzQD+lC+FpN1EhAV2w7
 7+guYXFNjE7LthtDsKGbom7ocl8CIT6cqnWj7TfLJ5nOs+KSaL+5bAK6b9HoqP0uhfj0XZ
 URu/sY3OJQLVMZnr+Nbek8hStl31w5k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-396-sNZ_ShMXOKG6hwSDIMw1iQ-1; Fri,
 29 Aug 2025 18:43:03 -0400
X-MC-Unique: sNZ_ShMXOKG6hwSDIMw1iQ-1
X-Mimecast-MFC-AGG-ID: sNZ_ShMXOKG6hwSDIMw1iQ_1756507381
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D1D6E195604F; Fri, 29 Aug 2025 22:43:00 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.78])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DFF3E1800280; Fri, 29 Aug 2025 22:42:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>,
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v3 12/14] rust: Add dma_buf stub bindings
Date: Fri, 29 Aug 2025 18:35:27 -0400
Message-ID: <20250829224116.477990-13-lyude@redhat.com>
In-Reply-To: <20250829224116.477990-1-lyude@redhat.com>
References: <20250829224116.477990-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

In order to implement the gem export callback, we need a type to represent
struct dma_buf. So - this commit introduces a set of stub bindings for
dma_buf. These bindings provide a ref-counted DmaBuf object, but don't
currently implement any functionality for using the DmaBuf.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Rename as_ref() to from_raw()

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/dma_buf.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 rust/kernel/dma_buf.rs

diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
new file mode 100644
index 0000000000000..a66829afcd129
--- /dev/null
+++ b/rust/kernel/dma_buf.rs
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! DMA buffer API
+//!
+//! C header: [`include/linux/dma-buf.h`](srctree/include/linux/dma-buf.h)
+
+use bindings;
+use kernel::types::*;
+
+/// A DMA buffer object.
+///
+/// # Invariants
+///
+/// The data layout of this type is equivalent to that of `struct dma_buf`.
+#[repr(transparent)]
+pub struct DmaBuf(Opaque<bindings::dma_buf>);
+
+// SAFETY: `struct dma_buf` is thread-safe
+unsafe impl Send for DmaBuf {}
+// SAFETY: `struct dma_buf` is thread-safe
+unsafe impl Sync for DmaBuf {}
+
+#[expect(unused)]
+impl DmaBuf {
+    /// Convert from a `*mut bindings::dma_buf` to a [`DmaBuf`].
+    ///
+    /// # Safety
+    ///
+    /// The caller guarantees that `self_ptr` points to a valid initialized `struct dma_buf` for the
+    /// duration of the lifetime of `'a`, and promises to not violate rust's data aliasing rules
+    /// using the reference provided by this function.
+    pub(crate) unsafe fn from_raw<'a>(self_ptr: *mut bindings::dma_buf) -> &'a Self {
+        // SAFETY: Our data layout is equivalent to `dma_buf` .
+        unsafe { &*self_ptr.cast() }
+    }
+
+    pub(crate) fn as_raw(&self) -> *mut bindings::dma_buf {
+        self.0.get()
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fcffc3988a903..59242d83efe21 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -81,6 +81,7 @@
 pub mod device_id;
 pub mod devres;
 pub mod dma;
+pub mod dma_buf;
 pub mod driver;
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
-- 
2.50.0

