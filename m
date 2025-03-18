Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03433A67D03
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 20:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C4D10E4C2;
	Tue, 18 Mar 2025 19:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TzxHbaWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152C710E4C2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 19:23:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742325815; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BKEbwh2MQCWz4P1R2zqqcPU93xs5X1S7FMSeWtTtupARQbFRbP1NpocXvCeq8f9AQMAPS8OvVMkHMTo/psATprDyBETB0ix77Mv4VK3bqL5k4siVwXnkfWukPa+tjL4OkBgkYQA3A4rbsoa7P1oKxTMjcT4Anjhm/TZZ7GdqUyQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742325815;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VFvk+dYAnpkou9AH4DFuJ+Nu9zjD0N7bOMF+5NpPK7A=; 
 b=Me1Ts1r3qYGEt6jl99IAwxsZ3yyJvd2873HYaHmVuBWB8AJUpIRu2+chMl5eqyspcZjhmXuSIS7NedqUiWmJJZzftC6pkvTmXr57CKCIKqUPvY/KBKlMnlLjmqdljFy9GfsDuQ2Nz+N0jPwkFQ3QA4DqGx9cmCHuHsYXFENIMhc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742325815; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=VFvk+dYAnpkou9AH4DFuJ+Nu9zjD0N7bOMF+5NpPK7A=;
 b=TzxHbaWU1iBonu2y8PYFsdKmU9LLZKO885R2SQtzuB2hitjZHptU1zrtk/2Eh0QR
 6+iy+vZzwHlzhOPqalbScfJpCXuA9FV5yUp0l+7HdoDWzLAtgWKUriPso7wBR1L1viV
 9jIMkxlP9SZjpCyUJdXpyQmiOrNdNAayUxGxTyj0=
Received: by mx.zohomail.com with SMTPS id 1742325814316498.85405764067946;
 Tue, 18 Mar 2025 12:23:34 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 18 Mar 2025 16:22:41 -0300
Subject: [PATCH 7/7] rust: drm: gem: shmem: Add share_dma_resv() function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-drm-gem-shmem-v1-7-64b96511a84f@collabora.com>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
 Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External
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

From: Asahi Lina <lina@asahilina.net>

Allow a GEM object to share another object's DMA reservation, for use
with drm_gpuvm. To keep memory safety, we hold a reference to the GEM
object owning the resv, and drop it when the child object is freed.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/gem/shmem.rs | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index fdf7dd7f2408bd2857f5b72027ef48e29c9dd9e3..e026b26a4895daea0534b93296da9a33683aa432 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -17,7 +17,7 @@
     slice,
 };
 
-use gem::BaseObject;
+use gem::{BaseObject, IntoGEMObject};
 
 /// Trait which must be implemented by drivers using shmem-backed GEM objects.
 pub trait DriverObject: gem::BaseDriverObject<Object<Self>> {
@@ -72,6 +72,8 @@ pub struct Object<T: DriverObject> {
     // The DRM core ensures the Device exists as long as its objects exist, so we don't need to
     // manage the reference count here.
     dev: *const bindings::drm_device,
+    // Parent object that owns this object's DMA reservation object
+    parent_resv_obj: *const bindings::drm_gem_object,
     #[pin]
     inner: T,
 }
@@ -101,6 +103,7 @@ unsafe impl init::Zeroable for bindings::drm_gem_shmem_object {}
         // SAFETY: GEM ensures the device lives as long as its objects live
         inner <- T::new(unsafe { device::Device::borrow(dev)}, size),
         dev,
+        parent_resv_obj: core::ptr::null(),
     });
 
     // SAFETY: p is a valid pointer to an uninitialized Object<T>.
@@ -135,6 +138,15 @@ unsafe impl init::Zeroable for bindings::drm_gem_shmem_object {}
         core::ptr::drop_in_place(&mut (*p).inner);
     }
 
+    // SAFETY: parent_resv_obj is either NULL or a valid reference to the
+    // GEM object owning the DMA reservation for this object, which we drop
+    // here.
+    unsafe {
+        if !(*p).parent_resv_obj.is_null() {
+            bindings::drm_gem_object_put((*p).parent_resv_obj as *const _ as *mut _);
+        }
+    }
+
     // SAFETY: This pointer has to be valid, since p is valid
     unsafe {
         bindings::drm_gem_shmem_free(&mut (*p).obj);
@@ -236,6 +248,25 @@ pub fn vmap(&self) -> Result<VMap<T>> {
     pub fn set_wc(&mut self, map_wc: bool) {
         self.obj.set_map_wc(map_wc);
     }
+
+    /// Share the dma_resv object from another GEM object.
+    ///
+    /// Should be called before the object is used/shared. Can only be called once.
+    pub fn share_dma_resv(&mut self, from_object: &impl IntoGEMObject) -> Result {
+        let from_obj = from_object.gem_obj();
+        if !self.parent_resv_obj.is_null() {
+            Err(EBUSY)
+        } else {
+            // SAFETY: from_obj is a valid object pointer per the trait Invariant.
+            unsafe {
+                bindings::drm_gem_object_get(from_obj as *const _ as *mut _);
+            }
+            self.parent_resv_obj = from_obj;
+            let gem = self.mut_gem_obj();
+            gem.resv = from_obj.resv;
+            Ok(())
+        }
+    }
 }
 
 impl<T: DriverObject> Deref for Object<T> {

-- 
2.48.1

