Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96D798B107
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F70010E5A5;
	Mon, 30 Sep 2024 23:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="THdhzqhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C427710E5A5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAGxt+7QcVJP+8MJM9swQ0ElPs58C/YHAc6dcv4hB6c=;
 b=THdhzqhAUckIViLBCBLG1mIZaKwxllWAlavqC6MNTYjZuJxfMKGAZjDHOkbOJnEx5TtPIj
 y/AAK3XT77vm2aY3St7IwL2MdEJTQT9EGY3ehgFqbuztozBQkwLnxqjYlRAMpJeKQXE3Gp
 puyzar8LzArR6YGTTI8JASYoeUvdtCQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-427-T8aDwVKTNQu0bBm4d0eZrg-1; Mon,
 30 Sep 2024 19:41:02 -0400
X-MC-Unique: T8aDwVKTNQu0bBm4d0eZrg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7FCB719192B1; Mon, 30 Sep 2024 23:41:00 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7F3933003E4D; Mon, 30 Sep 2024 23:40:56 +0000 (UTC)
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
Subject: [WIP RFC v2 28/35] rust: drm/kms: Add RawPlane::framebuffer()
Date: Mon, 30 Sep 2024 19:10:11 -0400
Message-ID: <20240930233257.1189730-29-lyude@redhat.com>
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

Returns the Framebuffer currently assigned in an atomic plane state.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/plane.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index cd5167e6441f1..15efa53fda8d3 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -31,6 +31,7 @@
     StaticModeObject,
     atomic::*,
     crtc::*,
+    framebuffer::*,
 };
 
 /// The main trait for implementing the [`struct drm_plane`] API for [`Plane`]
@@ -521,6 +522,13 @@ fn atomic_helper_check<S>(
             )
         })
     }
+
+    /// Return the framebuffer currently set for this plane state
+    #[inline]
+    fn framebuffer(&self) -> Option<&Framebuffer<<Self::Plane as ModeObject>::Driver>> {
+        // SAFETY: The layout of Framebuffer<T> is identical to `fb`
+        unsafe { self.as_raw().fb.as_ref().map(|fb| Framebuffer::from_raw(fb)) }
+    }
 }
 impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
 
-- 
2.46.1

