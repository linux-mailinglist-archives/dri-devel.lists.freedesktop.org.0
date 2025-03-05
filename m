Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6512A53E01
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF0A10E84D;
	Wed,  5 Mar 2025 23:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FZTtIbcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9341010E84D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrOarNfcTcrGH7ROFN5mUBFA32lVUZ4XyCrGK8TCRKY=;
 b=FZTtIbcJxxDZcHCoZmJVtwuvRxKkozuesiD9kLWHCG0SFqAZ07oCXr0/I8oq7O9iI75zzY
 aJOCzPvb6MSFJHHWKDzvSNnkti3DRPqtegq02BGiS3SLCZE9CDY0cSMktgxyUW9ijFvmje
 G1Mlrbi+1wI+/ACfZ/gYFGSZN6z619g=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-kdYPVQH0Nm-WjvXIeT85nA-1; Wed,
 05 Mar 2025 18:06:05 -0500
X-MC-Unique: kdYPVQH0Nm-WjvXIeT85nA-1
X-Mimecast-MFC-AGG-ID: kdYPVQH0Nm-WjvXIeT85nA_1741215963
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 80A51180087E; Wed,  5 Mar 2025 23:06:02 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EBE78300019E; Wed,  5 Mar 2025 23:05:57 +0000 (UTC)
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 10/33] rust: drm/kms: Add ConnectorGuard::add_modes_noedid()
Date: Wed,  5 Mar 2025 17:59:26 -0500
Message-ID: <20250305230406.567126-11-lyude@redhat.com>
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

A simple binding for drm_add_modes_noedid() using the ConnectorGuard type
we just added.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h  |  1 +
 rust/kernel/drm/kms/connector.rs | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 27828dd36d4f2..846eb6eb8fc4c 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -13,6 +13,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fbdev_dma.h>
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 14de3b0529f89..855a47b189a91 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -446,6 +446,17 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl<'a, T: DriverConnector> ConnectorGuard<'a, T> {
+    /// Add modes for a [`ConnectorGuard`] without an EDID.
+    ///
+    /// Add the specified modes to the connector's mode list up to the given maximum resultion.
+    /// Returns how many modes were added.
+    pub fn add_modes_noedid(&self, (max_h, max_v): (i32, i32)) -> i32 {
+        // SAFETY: We hold the locks required to call this via our type invariants.
+        unsafe { bindings::drm_add_modes_noedid(self.as_raw(), max_h, max_v) }
+    }
+}
+
 // SAFETY: DRM expects this struct to be zero-initialized
 unsafe impl Zeroable for bindings::drm_connector_state {}
 
-- 
2.48.1

