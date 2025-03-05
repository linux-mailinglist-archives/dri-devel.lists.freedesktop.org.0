Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55305A53DFE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6B010E7E6;
	Wed,  5 Mar 2025 23:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JxqJXwrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D756010E7E6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebrZLCn49Ar/u+hhgDqOxZKPNPiNI29a3OC6pvuCf4w=;
 b=JxqJXwrX4jEAVNYcsTzRVp06/vJAAWgF+TCAl3HJPtmA5WfHJyvPGK6e8nbjALHGiLhwYu
 jMjni7tboj6RGVIC3DDT1af5TYQOjvVWVi+/TXtX4FAFAEnnsa8sEjJ+o63bXHCBqFNPmY
 VUisxbI55K6QlB7rF7DrgigC+Yd0CbQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-XgmrCJ5TNj6LdSlFvAzo0Q-1; Wed,
 05 Mar 2025 18:05:46 -0500
X-MC-Unique: XgmrCJ5TNj6LdSlFvAzo0Q-1
X-Mimecast-MFC-AGG-ID: XgmrCJ5TNj6LdSlFvAzo0Q_1741215944
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2F9A51956087; Wed,  5 Mar 2025 23:05:44 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5A2A130001A1; Wed,  5 Mar 2025 23:05:40 +0000 (UTC)
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
Subject: [RFC v3 08/33] rust: drm/kms: Add
 UnregisteredConnector::attach_encoder()
Date: Wed,  5 Mar 2025 17:59:24 -0500
Message-ID: <20250305230406.567126-9-lyude@redhat.com>
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

This adds a simple binding for completing the last step of creating a DRM
connector - attaching its encoder. This function should only be called
before the connector is registered, and DRM should enforce this itself by
returning an error if a driver tries to add an encoder to an
already-registered DRM connector.

Note that unlike most of the methods we'll be adding to DRM mode objects,
this is directly implemented on the Connector<T> type since I don't really
think it would make sense for us to allow this operation on an
OpaqueConnector (a DRM connector without a known DriverConnector
implementation, something we'll be adding in the next few commits).

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Move to UnregisteredConnector interface
* Improve safety comments

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/connector.rs | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index ed65c06ece627..6fe0a7517bd55 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/drm/drm_connector.h`](srctree/include/drm/drm_connector.h)
 
-use super::{KmsDriver, ModeObject, RcModeObject};
+use super::{encoder::*, KmsDriver, ModeObject, RcModeObject};
 use crate::{
     alloc::KBox,
     bindings,
@@ -362,6 +362,18 @@ pub fn new<'a>(
         // SAFETY: We just allocated the connector above, so this pointer must be valid
         Ok(unsafe { &*this })
     }
+
+    /// Attach an encoder to this [`Connector`].
+    #[must_use]
+    pub fn attach_encoder(&self, encoder: &impl AsRawEncoder) -> Result {
+        // SAFETY:
+        // - Both as_raw() calls are guaranteed to return a valid pointer
+        // - We're guaranteed this connector is not registered via our type invariants, thus this
+        //   function is safe to call
+        to_result(unsafe {
+            bindings::drm_connector_attach_encoder(self.as_raw(), encoder.as_raw())
+        })
+    }
 }
 
 unsafe extern "C" fn connector_destroy_callback<T: DriverConnector>(
-- 
2.48.1

