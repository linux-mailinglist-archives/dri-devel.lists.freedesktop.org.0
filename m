Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB11ABFE59
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 22:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E9A10E7A1;
	Wed, 21 May 2025 20:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OZjRrL1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735BF10E796
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 20:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747860503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bc4vl3FfO4NWd/Y8TRWSzMpXYyQRCKKle6LlSMQQ/wk=;
 b=OZjRrL1bPQF5k3nPerhwoe8ujhP5nYvcgINRDAKxlVSdDfbcRfbjimlwXHaKgeT9yFt76c
 vkG5eSMZDV5uDnzdacIE9FtuYA+tB8FdNUlQASskMOgVErWpTKZY0/8Q2C0AkkXwNtdv0c
 7EBQ5JfELKqKj7akPg63gqFsbM/xIgY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-496-ZDoT-cCNMqG29_PosTHevQ-1; Wed,
 21 May 2025 16:48:19 -0400
X-MC-Unique: ZDoT-cCNMqG29_PosTHevQ-1
X-Mimecast-MFC-AGG-ID: ZDoT-cCNMqG29_PosTHevQ_1747860496
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9BF281800447; Wed, 21 May 2025 20:48:16 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5A9A519560B7; Wed, 21 May 2025 20:48:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v2 08/12] rust: drm: gem: shmem: Add share_dma_resv to
 ObjectConfig
Date: Wed, 21 May 2025 16:29:15 -0400
Message-ID: <20250521204654.1610607-9-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 57ec2538a905e..c38fca715429e 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -41,9 +41,14 @@
 /// This is used with [`Object::new()`] to control various properties that can only be set when
 /// initially creating a shmem-backed GEM object.
 #[derive(Default)]
-pub struct ObjectConfig {
+pub struct ObjectConfig<'a, T: BaseDriverObject> {
     /// Whether to set the write-combine map flag.
     pub map_wc: bool,
+
+    /// Reuse the DMA reservation from another GEM object.
+    ///
+    /// The newly created [`Object`] will hold an owned refcount to `parent_resv_obj` if specified.
+    pub parent_resv_obj: Option<&'a OpaqueObject<T::Driver>>,
 }
 
 /// A shmem-backed GEM object.
@@ -57,6 +62,8 @@ pub struct Object<T: BaseDriverObject> {
     #[pin]
     obj: Opaque<bindings::drm_gem_shmem_object>,
     dev: NonNull<device::Device<T::Driver>>,
+    // Parent object that owns this object's DMA reservation object
+    parent_resv_obj: Option<ARef<OpaqueObject<T::Driver>>>,
     #[pin]
     inner: T,
 }
@@ -96,13 +103,14 @@ fn as_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
     pub fn new(
         dev: &device::Device<T::Driver>,
         size: usize,
-        config: ObjectConfig,
+        config: ObjectConfig<'_, T>,
         args: T::Args,
     ) -> Result<ARef<Self>> {
         let new: Pin<KBox<Self>> = KBox::try_pin_init(
             try_pin_init!(Self {
                 obj <- pin_init::zeroed(),
                 dev: NonNull::from(dev),
+                parent_resv_obj: config.parent_resv_obj.map(|p| p.into()),
                 inner <- T::new(dev, size, args),
             }),
             GFP_KERNEL
@@ -118,7 +126,14 @@ pub fn new(
         let new = KBox::into_raw(unsafe { Pin::into_inner_unchecked(new) });
 
         // SAFETY: We're taking over the owned refcount from `drm_gem_shmem_init`.
-        let mut obj = unsafe { ARef::from_raw(NonNull::new_unchecked(new)) };
+        let obj = unsafe { ARef::from_raw(NonNull::new_unchecked(new)) };
+
+        // Start filling out values from `config`
+        if let Some(parent_resv) = config.parent_resv_obj {
+            // SAFETY: We have yet to expose the new gem object outside of this function, so it is
+            // safe to modify this field.
+            unsafe { (*obj.obj.get()).base.resv = parent_resv.raw_dma_resv() };
+        }
 
         // SAFETY: We have yet to expose this object outside of this function, so we're guaranteed
         // to have exclusive access - thus making this safe to hold a mutable reference to.
-- 
2.49.0

