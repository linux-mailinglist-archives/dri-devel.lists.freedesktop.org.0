Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC64A53E1B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AA210E85C;
	Wed,  5 Mar 2025 23:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hfYtKTuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EE310E85C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bGbLhta6NjlzPjR8SQEXQQ3XRNfxpmzeftS1Pw9ReGk=;
 b=hfYtKTucEwVPLcWlGEh2jYnCyeYdOxDyAsVgKNSGpR6+lmJLAlRduRZUyAkyOh9cuq8KvN
 DotGWLPGSPSO9YvgOyuh2SZ1Wf1pMaQQPooIOb0Y5+JkucRuoMscuGelT0BhsxwxtKn9a7
 R7Kh6ekfVTemstyrZ17BSFSqp3+uuAA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-NEQZTfTCPGGuhlnexhj2qg-1; Wed,
 05 Mar 2025 18:08:08 -0500
X-MC-Unique: NEQZTfTCPGGuhlnexhj2qg-1
X-Mimecast-MFC-AGG-ID: NEQZTfTCPGGuhlnexhj2qg_1741216086
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DA39218001D7; Wed,  5 Mar 2025 23:08:05 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4906B300019E; Wed,  5 Mar 2025 23:08:02 +0000 (UTC)
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
Subject: [RFC v3 24/33] rust: drm/kms: Add RawPlaneState::atomic_helper_check()
Date: Wed,  5 Mar 2025 17:59:40 -0500
Message-ID: <20250305230406.567126-25-lyude@redhat.com>
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

Add a binding for drm_atomic_helper_check_plane_state(). Since we want to
make sure that the user is passing in the new state for a Crtc instead of
an old state, we explicitly ask for a reference to a CrtcStateMutator.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/crtc.rs  |  2 ++
 rust/kernel/drm/kms/plane.rs | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 99719c4e288e6..aaa208b35c3c1 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -593,6 +593,8 @@ pub trait AsRawCrtcState {
     }
 }
 
+pub(super) use private::AsRawCrtcState as AsRawCrtcStatePrivate;
+
 /// Common methods available on any type which implements [`AsRawCrtcState`].
 ///
 /// This is implemented internally by DRM, and provides many of the basic methods for working with
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index a30f7f8caaafb..63b453b7307fd 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -619,6 +619,33 @@ fn crtc<'a, 'b: 'a, D>(&'a self) -> Option<&'b OpaqueCrtc<D>>
         // SAFETY: This cast is guaranteed safe by `OpaqueCrtc`s invariants.
         NonNull::new(self.as_raw().crtc).map(|c| unsafe { OpaqueCrtc::from_raw(c.as_ptr()) })
     }
+
+    /// Run the atomic check helper for this plane and the given CRTC state.
+    fn atomic_helper_check<S, D>(
+        &mut self,
+        crtc_state: &CrtcStateMutator<'_, S>,
+        can_position: bool,
+        can_update_disabled: bool,
+    ) -> Result
+    where
+        D: KmsDriver,
+        S: FromRawCrtcState,
+        S::Crtc: ModesettableCrtc + ModeObject<Driver = D>,
+        Self::Plane: ModeObject<Driver = D>,
+    {
+        // SAFETY: We're passing the mutable reference from `self.as_raw_mut()` directly to DRM,
+        // which is safe.
+        to_result(unsafe {
+            bindings::drm_atomic_helper_check_plane_state(
+                self.as_raw_mut(),
+                crtc_state.as_raw(),
+                bindings::DRM_PLANE_NO_SCALING as _, // TODO: add parameters for scaling
+                bindings::DRM_PLANE_NO_SCALING as _,
+                can_position,
+                can_update_disabled,
+            )
+        })
+    }
 }
 impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
 
-- 
2.48.1

