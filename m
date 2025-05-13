Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2972BAB5F18
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 00:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4589310E5F2;
	Tue, 13 May 2025 22:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SnAThFk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF4E10E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 22:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747174266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCw2wvd2m1wTO/RjJyxO6cpVaBvDfLJZ2984Y/kSd2U=;
 b=SnAThFk+yMENEKlArQ9SR2wNoBmiKszhQ0cfvzKrPFjrr908oMsR7rgy/e6BVA1y70PKuL
 u4ej+J/s2Wz4Ja9GJsbZSm9seo4GDH/LX5NGDvI8E+3anm5f75quVVHNuuFFsYapmNTw3X
 JosD4Aa0JSzI0t0LeYP4f6A7YmG9ezA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-310-wm0OVJk3O6makUvGSG_Vyg-1; Tue,
 13 May 2025 18:11:03 -0400
X-MC-Unique: wm0OVJk3O6makUvGSG_Vyg-1
X-Mimecast-MFC-AGG-ID: wm0OVJk3O6makUvGSG_Vyg_1747174261
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6859A195DE0B; Tue, 13 May 2025 22:11:00 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.64.99])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 577821940E95; Tue, 13 May 2025 22:10:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
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
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH v2 1/4] rust: drm: gem: Use NonNull for Object::dev
Date: Tue, 13 May 2025 18:09:54 -0400
Message-ID: <20250513221046.903358-2-lyude@redhat.com>
In-Reply-To: <20250513221046.903358-1-lyude@redhat.com>
References: <20250513221046.903358-1-lyude@redhat.com>
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

There is usually not much of a reason to use a raw pointer in a data
struct, so move this to NonNull instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/gem/mod.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 0cafa4a424206..df8f9fdae5c22 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -177,7 +177,7 @@ impl<T> BaseObject for T where Self: crate::types::AlwaysRefCounted + IntoGEMObj
 #[pin_data]
 pub struct Object<T: DriverObject + Send + Sync> {
     obj: Opaque<bindings::drm_gem_object>,
-    dev: *const drm::Device<T::Driver>,
+    dev: NonNull<drm::Device<T::Driver>>,
     #[pin]
     data: T,
 }
@@ -212,7 +212,7 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
                 data <- T::new(dev, size),
                 // INVARIANT: The drm subsystem guarantees that the `struct drm_device` will live
                 // as long as the GEM object lives.
-                dev,
+                dev: dev.into(),
             }),
             GFP_KERNEL,
         )?;
@@ -237,7 +237,7 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
     pub fn dev(&self) -> &drm::Device<T::Driver> {
         // SAFETY: The DRM subsystem guarantees that the `struct drm_device` will live as long as
         // the GEM object lives, hence the pointer must be valid.
-        unsafe { &*self.dev }
+        unsafe { self.dev.as_ref() }
     }
 
     fn as_raw(&self) -> *mut bindings::drm_gem_object {
-- 
2.49.0

