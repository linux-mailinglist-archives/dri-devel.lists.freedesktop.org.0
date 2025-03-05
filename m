Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA2EA53E06
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554210E851;
	Wed,  5 Mar 2025 23:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LwtiUu4i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E307C10E852
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lI0pBqW1V5q10bkXXVuUMbPUNgGv55fdwvDT8YLI59Y=;
 b=LwtiUu4iv3krIpP0t6wORNd8nFFIeKuycHYwC3HrFS606okNKLPg3tGVuCALF2Unojtj9U
 CLLgtsqRHKt2VRRsZWEGMSYkp8ZDkOwvXDA1yKAJXOPz1urDy9i6JeHVX4xeJ2SxHaIEeN
 1Rf5E3azYfOrPwKxksYt/OUI45fLbbU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-CS-WicQbPn64VR2-SL284A-1; Wed,
 05 Mar 2025 18:06:29 -0500
X-MC-Unique: CS-WicQbPn64VR2-SL284A-1
X-Mimecast-MFC-AGG-ID: CS-WicQbPn64VR2-SL284A_1741215987
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 61E7419560B4; Wed,  5 Mar 2025 23:06:27 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A6C8430001A1; Wed,  5 Mar 2025 23:06:23 +0000 (UTC)
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
Subject: [RFC v3 13/33] rust: drm/kms: Add RawPlane and RawPlaneState
Date: Wed,  5 Mar 2025 17:59:29 -0500
Message-ID: <20250305230406.567126-14-lyude@redhat.com>
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

Same thing as RawCrtc and RawCrtcState, but for DRM planes now

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Limit unsafe scope in RawPlane::index()
* Improve safety comments

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/plane.rs | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 9f262156eac6c..d1fabdf42df54 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -373,6 +373,29 @@ pub unsafe trait ModesettablePlane: AsRawPlane {
     type State: FromRawPlaneState;
 }
 
+/// Common methods available on any type which implements [`AsRawPlane`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// planes.
+pub trait RawPlane: AsRawPlane {
+    /// Return the index of this DRM plane
+    #[inline]
+    fn index(&self) -> u32 {
+        // SAFETY:
+        // - The index is initialized by the time we expose planes to users, and does not change
+        //   throughout its lifetime
+        // - `.as_raw()` always returns a valid poiinter.
+        unsafe { *self.as_raw() }.index
+    }
+
+    /// Return the index of this DRM plane in the form of a bitmask
+    #[inline]
+    fn mask(&self) -> u32 {
+        1 << self.index()
+    }
+}
+impl<T: AsRawPlane> RawPlane for T {}
+
 /// A trait implemented by any type which can produce a reference to a [`struct drm_plane_state`].
 ///
 /// This is implemented internally by DRM.
@@ -436,6 +459,20 @@ pub trait FromRawPlaneState: AsRawPlaneState {
     unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self;
 }
 
+/// Common methods available on any type which implements [`AsRawPlane`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// the atomic state of [`Plane`]s.
+pub trait RawPlaneState: AsRawPlaneState {
+    /// Return the plane that this plane state belongs to.
+    fn plane(&self) -> &Self::Plane {
+        // SAFETY: The index is initialized by the time we expose Plane objects to users, and is
+        // invariant throughout the lifetime of the Plane
+        unsafe { Self::Plane::from_raw(self.as_raw().plane) }
+    }
+}
+impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
+
 /// The main interface for a [`struct drm_plane_state`].
 ///
 /// This type is the main interface for dealing with the atomic state of DRM planes. In addition, it
-- 
2.48.1

