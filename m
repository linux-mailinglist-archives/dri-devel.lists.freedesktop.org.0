Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95BAB53EE7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 01:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245BF10E3ED;
	Thu, 11 Sep 2025 23:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WodLG1be";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D3D10E3ED
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 23:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757631751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpQfGQvyVQ9OG4v6u5HPL2iypq3YcMiRupYpuBp8hgk=;
 b=WodLG1beH0EoWG6r/s+UXzhKUs5TSuiJnVTGBXg+A8gOhL0cu0JpPf0QWSaOBOWI0QyO8X
 LsACeu1qFFqxIvyD/3ar9SuorIufBS7Vci/Z5ZuAIGRGs55n3EIRJuRugFRwT4GCXkrnh4
 ifgs4PEAwdxjFxiY5tvWJXyU8pQVNio=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-T_FfWwLHOvuT8_GjnlcWKw-1; Thu,
 11 Sep 2025 19:02:28 -0400
X-MC-Unique: T_FfWwLHOvuT8_GjnlcWKw-1
X-Mimecast-MFC-AGG-ID: T_FfWwLHOvuT8_GjnlcWKw_1757631745
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 156B5180028C; Thu, 11 Sep 2025 23:02:25 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.100])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7B8E61944CCA; Thu, 11 Sep 2025 23:02:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>,
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v4 3/3] rust: Add dma_buf stub bindings
Date: Thu, 11 Sep 2025 18:57:40 -0400
Message-ID: <20250911230147.650077-4-lyude@redhat.com>
In-Reply-To: <20250911230147.650077-1-lyude@redhat.com>
References: <20250911230147.650077-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V3:
* Rename as_ref() to from_raw()
V4:
* Add missing period to rustdoc at top of file

 rust/kernel/dma_buf.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 rust/kernel/dma_buf.rs

diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
new file mode 100644
index 0000000000000..50be3e4dd4098
--- /dev/null
+++ b/rust/kernel/dma_buf.rs
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! DMA buffer API.
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
2.51.0

