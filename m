Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED7DB17424
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1873E10E7BA;
	Thu, 31 Jul 2025 15:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N/X/JNrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B3410E7BA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:49:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6E7C06020C;
 Thu, 31 Jul 2025 15:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20FCC4CEF7;
 Thu, 31 Jul 2025 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753976991;
 bh=TRPn+DgynwTBU4suc4xP+QjfUEO+i9ltjPYhmhrkr2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N/X/JNrtyFakbTS/O9iOKZ67QuJWdk2GrjRdWBqwrDqXwaiu2XP315wrn0r0Z7bBY
 UUPrHbbI2WuDp6O0ej47Bxii1HSJW7FKIYKQTuB7tSmfB/SIwnRpAUb3zVam9ibvQ4
 mQR02O6FWGqKnPce2tJPaxVy14al1kNBVFaP2f4O6gH8Sheg2zlVb8/p4j64G9Byqx
 BocWeAFMemBYxQ99Ju4Sq5UTSJg8deTAkU7kTr3tlEpKrte3IzPFD1XXcDI955jsTm
 1l0+ifKC7nsak++M9SE0fkaRB7svvRG8+GXEchuaHrs7ASH7lhektT3SUjeftJQx6G
 Q9IUshOilxNaA==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 4/4] rust: drm: don't pass the address of drm::Device to
 drm_dev_put()
Date: Thu, 31 Jul 2025 17:48:09 +0200
Message-ID: <20250731154919.4132-5-dakr@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250731154919.4132-1-dakr@kernel.org>
References: <20250731154919.4132-1-dakr@kernel.org>
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

In drm_dev_put() call in AlwaysRefCounted::dec_ref() we rely on struct
drm_device to be the first field in drm::Device, whereas everywhere
else we correctly obtain the address of the actual struct drm_device.

Analogous to the from_drm_device() helper, provide the
into_drm_device() helper in order to address this.

Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index d0a9528121f1..d29c477e89a8 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -120,9 +120,13 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
         // - `raw_data` is a valid pointer to uninitialized memory.
         // - `raw_data` will not move until it is dropped.
         unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
-            // SAFETY: `__drm_dev_alloc()` was successful, hence `raw_drm` must be valid and the
+            // SAFETY: `raw_drm` is a valid pointer to `Self`, given that `__drm_dev_alloc` was
+            // successful.
+            let drm_dev = unsafe { Self::into_drm_device(raw_drm) };
+
+            // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_dev` must be valid and the
             // refcount must be non-zero.
-            unsafe { bindings::drm_dev_put(ptr::addr_of_mut!((*raw_drm.as_ptr()).dev).cast()) };
+            unsafe { bindings::drm_dev_put(drm_dev) };
         })?;
 
         // SAFETY: The reference count is one, and now we take ownership of that reference as a
@@ -143,6 +147,14 @@ unsafe fn from_drm_device(ptr: *const bindings::drm_device) -> *mut Self {
         unsafe { crate::container_of!(Opaque::cast_from(ptr), Self, dev) }.cast_mut()
     }
 
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer to `Self`.
+    unsafe fn into_drm_device(ptr: NonNull<Self>) -> *mut bindings::drm_device {
+        // SAFETY: By the safety requirements of this function, `ptr` is a valid pointer to `Self`.
+        unsafe { &raw mut (*ptr.as_ptr()).dev }.cast()
+    }
+
     /// Not intended to be called externally, except via declare_drm_ioctls!()
     ///
     /// # Safety
@@ -192,8 +204,11 @@ fn inc_ref(&self) {
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: `obj` is a valid pointer to `Self`.
+        let drm_dev = unsafe { Self::into_drm_device(obj) };
+
         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
-        unsafe { bindings::drm_dev_put(obj.cast().as_ptr()) };
+        unsafe { bindings::drm_dev_put(drm_dev) };
     }
 }
 
-- 
2.50.0

