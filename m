Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE98AA62EE
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 20:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD25910E879;
	Thu,  1 May 2025 18:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GVU7n5tP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4043610E879
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 18:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746124661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yk7M5D8H8aC/JgAaxCS1maVk5f6A5cbefflNr0lOROM=;
 b=GVU7n5tPu5G7INAeg1O9LWILa21VcLiUfFijR1zuRoCdsBQe6OjG7XDWs3ISd4EnxUlot2
 qnRCVfAI5OtTNgGxjaDAiF+SEdXUUQNeSK2HqeOxUwUXJxKrYXVkI8TLu9DqZWx4HAzm7l
 iI8j3RN5PyDtGRNWJiOS5Y3kvHKNpuM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-U4in9u2YObyfp8QPw3IqWA-1; Thu,
 01 May 2025 14:37:37 -0400
X-MC-Unique: U4in9u2YObyfp8QPw3IqWA-1
X-Mimecast-MFC-AGG-ID: U4in9u2YObyfp8QPw3IqWA_1746124655
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B899F1800980; Thu,  1 May 2025 18:37:34 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0D2E41800115; Thu,  1 May 2025 18:37:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Asahi Lina <lina@asahilina.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 1/4] rust: drm: gem: Use NonNull for Object::dev
Date: Thu,  1 May 2025 14:33:16 -0400
Message-ID: <20250501183717.2058109-2-lyude@redhat.com>
In-Reply-To: <20250501183717.2058109-1-lyude@redhat.com>
References: <20250501183717.2058109-1-lyude@redhat.com>
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

There is usually not much of a reason to use a raw pointer in a data
struct, so move this to NonNull instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
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
2.48.1

