Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OPEGsdshmlaNAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:35:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02873103E0B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1317610E959;
	Fri,  6 Feb 2026 22:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AgK8zrIU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FA310E976
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 22:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770417346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTebqQ2eipm8YqiSwO1TAoGzLEbFz+blNfHKTyJxzv0=;
 b=AgK8zrIU4/GhGnEx8eadCiXOfnpLPsyeGxbwb7FBQlj9cIy+mrD/M0XTy/4B9A54pzCvCw
 TrX3nXl6HJ4NjZqNw69AaClLgFUpCwz9gZO7TOS6yHSLCFwpLczISb4uSjsGd5W7rEtOdu
 guqRi+EHq3TO/amUScY3/Myw9REOENI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-3KZVlp8tORq_6hbtHCtJMA-1; Fri,
 06 Feb 2026 17:35:41 -0500
X-MC-Unique: 3KZVlp8tORq_6hbtHCtJMA-1
X-Mimecast-MFC-AGG-ID: 3KZVlp8tORq_6hbtHCtJMA_1770417339
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B73581956094; Fri,  6 Feb 2026 22:35:39 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.226])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E264519373D8; Fri,  6 Feb 2026 22:35:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Janne Grunau <j@jannau.net>
Subject: [PATCH v7 7/7] rust: drm/gem: Add vmap functions to shmem bindings
Date: Fri,  6 Feb 2026 17:34:31 -0500
Message-ID: <20260206223431.693765-8-lyude@redhat.com>
In-Reply-To: <20260206223431.693765-1-lyude@redhat.com>
References: <20260206223431.693765-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: J2QiKimPBBvBrNw5yqom6vmmO_G-I6zbhiTeW4GLP44_1770417339
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:daniel.almeida@collabora.com,m:gary@garyguo.net,m:lossin@kernel.org,m:acourbot@nvidia.com,m:j@jannau.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 02873103E0B
X-Rspamd-Action: no action

One of the more obvious use cases for gem shmem objects is the ability to
create mappings into their contents, specifically iosys mappings. Now that
we've added iosys_map rust bindings to the kernel, let's hook these up in
gem shmem.

Similar to how we handle SGTables, we make sure there's two different types
of mappings: owned mappings (kernel::drm::gem::shmem::VMap) and borrowed
mappings (kernel::drm::gem::shmem::VMapRef).

One last note: we change the #[expect(unused)] for RawIoSysMap::from_raw()
to an #[allow(unused)]. Normally we would simply remove the lint assertion,
however - since shmem is conditionally built, we need allow to avoid
hitting warnings in certain kernel configurations.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V7:
* Switch over to the new iosys map bindings that use the Io trait

 rust/kernel/drm/gem/shmem.rs | 170 ++++++++++++++++++++++++++++++++++-
 rust/kernel/iosys_map.rs     |   3 +-
 2 files changed, 170 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index e511a9b6710e0..604fb10325d1e 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -21,6 +21,7 @@
         from_err_ptr,
         to_result, //
     },
+    iosys_map::*,
     prelude::*,
     scatterlist,
     types::{
@@ -29,13 +30,18 @@
     }, //
 };
 use core::{
+    mem::{
+        self,
+        MaybeUninit, //
+    },
     ops::{
         Deref,
         DerefMut, //
     },
-    ptr::NonNull,
+    ptr::NonNull, //
 };
 use gem::{
+    BaseObject,
     BaseObjectPrivate,
     DriverObject,
     IntoGEMObject, //
@@ -216,6 +222,72 @@ pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
             _owner: self.into(),
         })
     }
+
+    /// Attempt to create a [`RawIoSysMap`] from the gem object.
+    fn raw_vmap<const SIZE: usize>(&self) -> Result<RawIoSysMap<SIZE>> {
+        let mut map: MaybeUninit<bindings::iosys_map> = MaybeUninit::uninit();
+
+        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reservation lock held
+        to_result(unsafe {
+            // TODO: see top of file
+            bindings::dma_resv_lock(self.raw_dma_resv(), core::ptr::null_mut());
+            let ret = bindings::drm_gem_shmem_vmap_locked(self.as_shmem(), map.as_mut_ptr());
+            bindings::dma_resv_unlock(self.raw_dma_resv());
+            ret
+        })?;
+
+        // SAFETY: if drm_gem_shmem_vmap did not fail, map is initialized now
+        Ok(unsafe { RawIoSysMap::<SIZE>::from_raw(map.assume_init()) })
+    }
+
+    /// Unmap a [`RawIoSysMap`] from the gem object.
+    ///
+    /// # Safety
+    ///
+    /// - The caller promises that `map` came from a prior call to [`Self::raw_vmap`] on this gem
+    ///   object.
+    /// - The caller promises that the memory pointed to by `map` will no longer be accesed through
+    ///   this instance.
+    unsafe fn raw_vunmap<const SIZE: usize>(&self, map: &mut RawIoSysMap<SIZE>) {
+        let resv = self.raw_dma_resv();
+
+        // SAFETY:
+        // - This function is safe to call with the DMA reservation lock held
+        // - Our `ARef` is proof that the underlying gem object here is initialized and thus safe to
+        //   dereference.
+        unsafe {
+            // TODO: see top of file
+            bindings::dma_resv_lock(resv, core::ptr::null_mut());
+            bindings::drm_gem_shmem_vunmap_locked(self.as_shmem(), map.as_raw_mut());
+            bindings::dma_resv_unlock(resv);
+        }
+    }
+
+    /// Creates and returns a virtual kernel memory mapping for this object.
+    pub fn vmap<const SIZE: usize>(&self) -> Result<VMapRef<'_, T, SIZE>> {
+        let map = self.raw_vmap()?;
+
+        Ok(VMapRef {
+            // SAFETY:
+            // - The size of the vmap is the same as the size of the gem
+            // - The vmap will remain alive until this object is dropped.
+            map: unsafe { IoSysMapRef::<SIZE>::new(map, self.size()) }?,
+            owner: self,
+        })
+    }
+
+    /// Creates and returns an owned reference to a virtual kernel memory mapping for this object.
+    pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMap<T, SIZE>> {
+        // INVARIANT: We verify here that the mapping is at least of SIZE bytes.
+        if self.size() < SIZE {
+            return Err(EINVAL);
+        }
+
+        Ok(VMap {
+            map: self.raw_vmap()?,
+            owner: self.into(),
+        })
+    }
 }
 
 impl<T: DriverObject> Deref for Object<T> {
@@ -267,6 +339,102 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
     };
 }
 
+/// A borrowed reference to a virtual mapping for a shmem-based GEM object in kernel address space.
+pub struct VMapRef<'a, D: DriverObject, const SIZE: usize = 0> {
+    map: IoSysMapRef<'a, SIZE>,
+    owner: &'a Object<D>,
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> Clone for VMapRef<'a, D, SIZE> {
+    fn clone(&self) -> Self {
+        // SAFETY: We have a successful vmap already, so this can't fail
+        unsafe { self.owner.vmap().unwrap_unchecked() }
+    }
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> Deref for VMapRef<'a, D, SIZE> {
+    type Target = IoSysMapRef<'a, SIZE>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.map
+    }
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> DerefMut for VMapRef<'a, D, SIZE> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.map
+    }
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> Drop for VMapRef<'a, D, SIZE> {
+    fn drop(&mut self) {
+        // SAFETY: Our existence is proof that this map was previously created using self.owner.
+        unsafe { self.owner.raw_vunmap(&mut self.map.raw_map) };
+    }
+}
+
+/// An owned reference to a virtual mapping for a shmem-based GEM object in kernel address space.
+///
+/// # Invariants
+///
+/// - The size of `owner` is >= SIZE.
+/// - The memory pointed to by `map` is at least as large as `T`.
+/// - The memory pointed to by `map` remains valid at least until this object is dropped.
+pub struct VMap<D: DriverObject, const SIZE: usize = 0> {
+    map: RawIoSysMap<SIZE>,
+    owner: ARef<Object<D>>,
+}
+
+impl<D: DriverObject, const SIZE: usize> Clone for VMap<D, SIZE> {
+    fn clone(&self) -> Self {
+        // SAFETY: We have a successful vmap already, so this can't fail
+        unsafe { self.owner.owned_vmap().unwrap_unchecked() }
+    }
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> From<VMapRef<'a, D, SIZE>> for VMap<D, SIZE> {
+    fn from(value: VMapRef<'a, D, SIZE>) -> Self {
+        let this = Self {
+            map: value.map.raw_map.clone(),
+            owner: value.owner.into(),
+        };
+
+        mem::forget(value);
+        this
+    }
+}
+
+impl<D: DriverObject, const SIZE: usize> VMap<D, SIZE> {
+    /// Return a reference to the iosys map for this `VMap`.
+    #[inline]
+    pub fn get(&self) -> IoSysMapRef<'_, SIZE> {
+        // SAFETY:
+        // - The size of the iosys_map is equivalent to the size of the gem object.
+        // - `size` is >= SIZE according to our type invariants, ensuring that we can never pass an
+        //   invalid `size` to `IoSysMapRef::new().
+        unsafe {
+            IoSysMapRef::new(self.map.clone(), self.owner.size()).unwrap_unchecked()
+        }
+    }
+
+    /// Borrows a reference to the object that owns this virtual mapping.
+    pub fn owner(&self) -> &Object<D> {
+        &self.owner
+    }
+}
+
+impl<D: DriverObject, const SIZE: usize> Drop for VMap<D, SIZE> {
+    fn drop(&mut self) {
+        // SAFETY: Our existence is proof that this map was previously created using self.owner
+        unsafe { self.owner.raw_vunmap(&mut self.map) };
+    }
+}
+
+/// SAFETY: `iosys_map` objects are safe to send across threads.
+unsafe impl<D: DriverObject, const SIZE: usize> Send for VMap<D, SIZE> {}
+/// SAFETY: `iosys_map` objects are safe to send across threads.
+unsafe impl<D: DriverObject, const SIZE: usize> Sync for VMap<D, SIZE> {}
+
 /// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
 ///
 /// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
diff --git a/rust/kernel/iosys_map.rs b/rust/kernel/iosys_map.rs
index 2070f0fb42cb8..b649d2de83093 100644
--- a/rust/kernel/iosys_map.rs
+++ b/rust/kernel/iosys_map.rs
@@ -33,7 +33,7 @@
 
 impl<const SIZE: usize> RawIoSysMap<SIZE> {
     /// Convert from a raw `bindings::iosys_map`.
-    #[expect(unused)]
+    #[allow(unused)]
     #[inline]
     pub(crate) fn from_raw(val: bindings::iosys_map) -> Self {
         Self(val)
@@ -139,7 +139,6 @@ impl<'a, const SIZE: usize> IoSysMapRef<'a, SIZE> {
     ///
     /// - The caller guarantees that the mapping is of at least `size` bytes.
     /// - The caller guarantees that the mapping remains valid for the lifetime of `'a`.
-    #[expect(unused)]
     pub(crate) unsafe fn new(map: RawIoSysMap<SIZE>, size: usize) -> Result<Self> {
         if size < SIZE {
             return Err(EINVAL);
-- 
2.53.0

