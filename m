Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C4BA53E1A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D375910E85A;
	Wed,  5 Mar 2025 23:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NcEtAal3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD5B10E85A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2VpDj6SMIZeSrAkqn3RnehhHLuj14WMhqBC+m4f1mU=;
 b=NcEtAal3ycvE1nq0kQglPBBtldzadWcDp5Jwbu70OsuwRP3zByXJF9jBO9gevfyRfgLXYM
 Ref4+mY3o3qZizlzm+9gtxpxt/SkOStoy+mRX/0+PJOc/VygI5tNyHcVCmDaB3Y8FaAP1E
 WGUEr4GqxfOA94B4N+CQF3pWhUabqFI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-2v86yqRoN-WEcr2o8c_Y7A-1; Wed,
 05 Mar 2025 18:07:57 -0500
X-MC-Unique: 2v86yqRoN-WEcr2o8c_Y7A-1
X-Mimecast-MFC-AGG-ID: 2v86yqRoN-WEcr2o8c_Y7A_1741216075
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B3B1A1800349; Wed,  5 Mar 2025 23:07:55 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1A62C300019E; Wed,  5 Mar 2025 23:07:51 +0000 (UTC)
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
Subject: [RFC v3 23/33] rust: drm/kms: Add RawPlaneState::crtc()
Date: Wed,  5 Mar 2025 17:59:39 -0500
Message-ID: <20250305230406.567126-24-lyude@redhat.com>
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

Add a binding for checking drm_plane_state.crtc. Note that we don't have a
way of knowing what DriverCrtc implementation would be used here (and want
to make this function also available on OpaquePlaneState types), so we
return an OpaqueCrtc.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/plane.rs | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index f3adc30c17489..a30f7f8caaafb 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -5,7 +5,8 @@
 //! C header: [`include/drm/drm_plane.h`](srctree/include/drm/drm_plane.h)
 
 use super::{
-    atomic::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject, UnregisteredKmsDevice,
+    atomic::*, crtc::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject,
+    UnregisteredKmsDevice,
 };
 use crate::{
     alloc::KBox,
@@ -608,6 +609,16 @@ fn plane(&self) -> &Self::Plane {
         // invariant throughout the lifetime of the Plane
         unsafe { Self::Plane::from_raw(self.as_raw().plane) }
     }
+
+    /// Return the current [`OpaqueCrtc`] assigned to this plane, if there is one.
+    fn crtc<'a, 'b: 'a, D>(&'a self) -> Option<&'b OpaqueCrtc<D>>
+    where
+        Self::Plane: ModeObject<Driver = D>,
+        D: KmsDriver,
+    {
+        // SAFETY: This cast is guaranteed safe by `OpaqueCrtc`s invariants.
+        NonNull::new(self.as_raw().crtc).map(|c| unsafe { OpaqueCrtc::from_raw(c.as_ptr()) })
+    }
 }
 impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
 
-- 
2.48.1

