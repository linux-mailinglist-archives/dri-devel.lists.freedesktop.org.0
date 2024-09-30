Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170EE98B103
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D30710E5A2;
	Mon, 30 Sep 2024 23:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hsWXC2TC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F218710E5A2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OPpcmKbNeNbUSddRK0GJ79bGRqnGtk4IaTVQGxA5MmY=;
 b=hsWXC2TCaqMA9IhHR6pY97ISeMuNqJZhcImQwKqdiaysJ0wGdDEdSNpuKdAzE+pHbPOoQp
 2MZSVW3wdMdvzecRZ6J2l13ihYaDGq2ZF6xcEYl/moHm3OSdfg5ojQWUDEP9QWwKBlOL8k
 kOZqCAw28W3TUoNnkaTjkGX7GJ9yjvc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-f4W_Q1TUOOinP8t2E5kuOw-1; Mon,
 30 Sep 2024 19:40:40 -0400
X-MC-Unique: f4W_Q1TUOOinP8t2E5kuOw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DC66F191961D; Mon, 30 Sep 2024 23:40:37 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A11393004AB3; Mon, 30 Sep 2024 23:40:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 25/35] rust: drm/kms: Add RawPlaneState::crtc()
Date: Mon, 30 Sep 2024 19:10:08 -0400
Message-ID: <20240930233257.1189730-26-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
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
 rust/kernel/drm/kms/plane.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 04f1bdfbb1ea2..4d16d53179fca 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -30,6 +30,7 @@
     ModeObject,
     StaticModeObject,
     atomic::*,
+    crtc::*,
 };
 
 /// The main trait for implementing the [`struct drm_plane`] API for [`Plane`]
@@ -489,6 +490,12 @@ fn plane(&self) -> &Self::Plane {
         // invariant throughout the lifetime of the Plane
         unsafe { Self::Plane::from_raw(self.as_raw().plane) }
     }
+
+    /// Return the current [`OpaqueCrtc`] assigned to this plane, if there is one.
+    fn crtc<'a, 'b: 'a>(&'a self) -> Option<&'b OpaqueCrtc<<Self::Plane as ModeObject>::Driver>> {
+        // SAFETY: This cast is guaranteed safe by `OpaqueCrtc`s invariants.
+        NonNull::new(self.as_raw().crtc).map(|c| unsafe { OpaqueCrtc::from_raw(c.as_ptr()) })
+    }
 }
 impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
 
-- 
2.46.1

