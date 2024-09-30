Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3313B98B0E1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06FD10E301;
	Mon, 30 Sep 2024 23:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PRdexgwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1000810E301
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Zb0rBlFBS6DnNXycQrkSdH1hnOzRIIqb3zhPvtIptc=;
 b=PRdexgwxr8Ff5JiHik4JwvmKQ26HWj0b4csdcC/Mb+FvVxrEureomUqMyaRCG5Gn7e0WjC
 4cl/hmBwg6mDEtKqFbvsiet+QqWK3l6ar9STq/Y3n0S0cOiaDo2mv8r+KEkPWAHDc5dHNX
 tBV52YLu9gXrKG6F9LNUg+o2opL8yfk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-478-OoxvmIacM-WG0ZEoppEFHw-1; Mon,
 30 Sep 2024 19:37:42 -0400
X-MC-Unique: OoxvmIacM-WG0ZEoppEFHw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E4735196A40C; Mon, 30 Sep 2024 23:37:39 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 738DD3003DEC; Mon, 30 Sep 2024 23:37:35 +0000 (UTC)
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
Subject: [WIP RFC v2 03/35] rust: drm/kms/fbdev: Add FbdevShmem
Date: Mon, 30 Sep 2024 19:09:46 -0400
Message-ID: <20240930233257.1189730-4-lyude@redhat.com>
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

For drivers which use the shmem based GEM helpers, they'll want to use the
relevant drm_fbdev_shmem_setup() functions instead of the
drm_fbdev_dma_setup() functions. To allow for this, introduce another
FbdevImpl that such drivers can use instead of FbdevDma.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h    |  1 +
 rust/kernel/drm/kms/fbdev.rs       |  8 +++++++-
 rust/kernel/drm/kms/fbdev/shmem.rs | 33 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/drm/kms/fbdev/shmem.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 4a8e44e11c96a..9803e0ecac7c1 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -13,6 +13,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
diff --git a/rust/kernel/drm/kms/fbdev.rs b/rust/kernel/drm/kms/fbdev.rs
index bdf97500137d8..a1035d948949a 100644
--- a/rust/kernel/drm/kms/fbdev.rs
+++ b/rust/kernel/drm/kms/fbdev.rs
@@ -5,6 +5,12 @@
 use crate::{private::Sealed, drm::{kms::*, device::Device, gem}};
 use bindings;
 
+#[cfg(CONFIG_DRM_GEM_SHMEM_HELPER = "y")]
+mod shmem;
+
+#[cfg(CONFIG_DRM_GEM_SHMEM_HELPER = "y")]
+pub use shmem::FbdevShmem;
+
 pub(crate) mod private {
     use super::*;
 
@@ -17,7 +23,7 @@ pub trait FbdevImpl {
 /// The main trait for a driver's DRM implementation.
 ///
 /// Drivers are expected not to implement this directly, and to instead use one of the objects
-/// provided by this module such as [`FbdevDma`].
+/// provided by this module such as [`FbdevDma`] and [`FbdevShmem`].
 pub trait FbdevImpl: private::FbdevImpl {}
 
 /// The fbdev implementation for drivers using the gem DMA helpers.
diff --git a/rust/kernel/drm/kms/fbdev/shmem.rs b/rust/kernel/drm/kms/fbdev/shmem.rs
new file mode 100644
index 0000000000000..16c3533ad2a0f
--- /dev/null
+++ b/rust/kernel/drm/kms/fbdev/shmem.rs
@@ -0,0 +1,33 @@
+//! The GEM shmem fbdev implementation for rust.
+//!
+//! This module provides an Fbdev implementation that can be used by Rust KMS drivers using the GEM
+//! shmem helpers provided by [`shmem`].
+
+use core::marker::*;
+use crate::drm::{gem::shmem, kms::*, device::Device};
+use super::{private::FbdevImpl as FbdevImplPrivate, FbdevImpl};
+use bindings;
+
+/// The fbdev implementation for drivers using the gem shmem helpers.
+///
+/// KMS Drivers which use the GEM helpers provided by [`shmem`] should use this for [`Kms::Fbdev`].
+pub struct FbdevShmem<T: Driver>(PhantomData<T>);
+
+impl<T, G> FbdevImplPrivate for FbdevShmem<T>
+where
+    T: Driver<Object = shmem::Object<G>>,
+    G: shmem::DriverObject
+{
+    #[inline]
+    fn setup_fbdev<D: Driver>(drm: &Device<D>, mode_config_info: &ModeConfigInfo) {
+        // SAFETY: Our implementation bounds are proof that this driver is using the gem shmem
+        // helpers
+        unsafe { bindings::drm_fbdev_shmem_setup(drm.as_raw(), mode_config_info.preferred_depth) };
+    }
+}
+
+impl<T, G> FbdevImpl for FbdevShmem<T>
+where
+    T: Driver<Object = shmem::Object<G>>,
+    G: shmem::DriverObject
+{}
-- 
2.46.1

