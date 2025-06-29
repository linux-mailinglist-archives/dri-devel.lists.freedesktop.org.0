Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E98AECE57
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 17:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4272310E04F;
	Sun, 29 Jun 2025 15:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dcokncIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FC510E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 15:38:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1F8B5C5740;
 Sun, 29 Jun 2025 15:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91771C4CEEB;
 Sun, 29 Jun 2025 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751211492;
 bh=irUPTlS0/NWtgLLK+FiDb0DkltPA9zyPBDyAIy/e0yQ=;
 h=From:To:Cc:Subject:Date:From;
 b=dcokncIV/YPkA0m+7Bwp2Vi5gCxmxRwI/iyVW+7H0p3gw/ZpyGt75bZUgj6KXsoyi
 dCF1KWbvh8ktk80BeKQmTk+0ioNU6QPHCTgc6qEwoqITBSdJEp88p/PcYYI4ZQ1LjQ
 vvFZ4gDk2LlDtSsPRSdPAP2CRefem4M3fNhmUdzg9nKlPWXc0rWorkKWbNvr79gkCK
 hVpooeP1rLsfqrpRSvnmlYli38MtNbf1VDRlulc4j27YVVCHti7VdM7hukl1HgxOZP
 xebAX0B6NP2cu0lZdkokZLnLM4ougWAvmLoGQel9hPiz4QYOJPOC92++jASMIXLnhb
 +kA9j2qV7IvxA==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, acourbot@nvidia.com, alyssa@rosenzweig.io,
 lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] rust: drm: device: drop_in_place() the drm::Device in
 release()
Date: Sun, 29 Jun 2025 17:37:42 +0200
Message-ID: <20250629153747.72536-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm::Device::new() we allocate with __drm_dev_alloc() and return an
ARef<drm::Device>.

When the reference count of the drm::Device falls to zero, the C code
automatically calls drm_dev_release(), which eventually frees the memory
allocated in drm::Device::new().

However, due to that, drm::Device::drop() is never called. As a result
the destructor of the user's private data, i.e. drm::Device::data is
never called. Hence, fix this by calling drop_in_place() from the DRM
device's release callback.

Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 624d7a4c83ea..14c1aa402951 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -66,7 +66,7 @@ impl<T: drm::Driver> Device<T> {
         open: Some(drm::File::<T::File>::open_callback),
         postclose: Some(drm::File::<T::File>::postclose_callback),
         unload: None,
-        release: None,
+        release: Some(Self::release),
         master_set: None,
         master_drop: None,
         debugfs_init: None,
@@ -162,6 +162,16 @@ pub unsafe fn as_ref<'a>(ptr: *const bindings::drm_device) -> &'a Self {
         // SAFETY: `ptr` is valid by the safety requirements of this function.
         unsafe { &*ptr.cast() }
     }
+
+    extern "C" fn release(ptr: *mut bindings::drm_device) {
+        // SAFETY: `ptr` is a valid pointer to a `struct drm_device` and embedded in `Self`.
+        let this = unsafe { Self::from_drm_device(ptr) };
+
+        // SAFETY:
+        // - When `release` runs it is guaranteed that there is no further access to `this`.
+        // - `this` is valid for dropping.
+        unsafe { core::ptr::drop_in_place(this) };
+    }
 }
 
 impl<T: drm::Driver> Deref for Device<T> {

base-commit: 615cc4223fcbe1e0e6f68b8494b26bb6c08d917a
-- 
2.50.0

