Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9144CA53E1E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017FE10E85D;
	Wed,  5 Mar 2025 23:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gp8HOiyX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA0D10E85D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JGaidaXItPxvHOgKUEqHTZ0I38IyrDd5JklCvf8qG1Y=;
 b=Gp8HOiyXpqGjGLLcMmjluXKufEYPkxpQp+Jp0NuL0/9ZXht/w/bP9SjAlAqFzNpUMN0Se+
 g6hCvGKZKS0TOWocGs/4Ky++XZq+0rAsUB7BG/5MqyPZz713KsV0CjWZIjs0ubwSHH7OMK
 FQbXapj6R8fD1xwpZEVXYjr7ZtLhjeo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-7W8r-8dGNmCViAT1HOLdig-1; Wed,
 05 Mar 2025 18:08:27 -0500
X-MC-Unique: 7W8r-8dGNmCViAT1HOLdig-1
X-Mimecast-MFC-AGG-ID: 7W8r-8dGNmCViAT1HOLdig_1741216105
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EB601195605E; Wed,  5 Mar 2025 23:08:24 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E4CA9300019E; Wed,  5 Mar 2025 23:08:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 26/33] rust: drm/kms: Add RawPlane::framebuffer()
Date: Wed,  5 Mar 2025 17:59:42 -0500
Message-ID: <20250305230406.567126-27-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
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

Returns the Framebuffer currently assigned in an atomic plane state.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/framebuffer.rs |  1 -
 rust/kernel/drm/kms/plane.rs       | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/kms/framebuffer.rs b/rust/kernel/drm/kms/framebuffer.rs
index 5a60b580fe0bf..99f366e8813e2 100644
--- a/rust/kernel/drm/kms/framebuffer.rs
+++ b/rust/kernel/drm/kms/framebuffer.rs
@@ -66,7 +66,6 @@ impl<T: KmsDriver> Framebuffer<T> {
     /// The caller guarantews that `ptr` points to a initialized `struct drm_framebuffer` for at
     /// least the entire lifetime of `'a`.
     #[inline]
-    #[allow(dead_code)]
     pub(super) unsafe fn from_raw<'a>(ptr: *const bindings::drm_framebuffer) -> &'a Self {
         // SAFETY: Our data layout is identical to drm_framebuffer
         unsafe { &*ptr.cast() }
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 63b453b7307fd..1d50632ae473f 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/drm/drm_plane.h`](srctree/include/drm/drm_plane.h)
 
 use super::{
-    atomic::*, crtc::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject,
+    atomic::*, crtc::*, framebuffer::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject,
     UnregisteredKmsDevice,
 };
 use crate::{
@@ -646,6 +646,22 @@ fn atomic_helper_check<S, D>(
             )
         })
     }
+
+    /// Return the framebuffer currently set for this plane state
+    #[inline]
+    fn framebuffer<D>(&self) -> Option<&Framebuffer<D>>
+    where
+        Self::Plane: ModeObject<Driver = D>,
+        D: KmsDriver,
+    {
+        // SAFETY: The layout of Framebuffer<T> is identical to `fb`
+        unsafe {
+            self.as_raw()
+                .fb
+                .as_ref()
+                .map(|fb| Framebuffer::from_raw(fb))
+        }
+    }
 }
 impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
 
-- 
2.48.1

