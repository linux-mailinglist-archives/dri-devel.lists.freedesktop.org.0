Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001BB98B0EB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6971C10E487;
	Mon, 30 Sep 2024 23:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WbaAr0ZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009F210E487
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJ3TeIAd9cs6+pu/8iyKEZ6SOjd6owM+icv2Rkamtr8=;
 b=WbaAr0ZMJONEqyZEyYkN51RUty/B0BG5+JPBiROXp3DQ/LOFM+oY6LloQND+vVVc7aYrln
 U5znVjqsda+IkvyI1kkqymTFcqDP8iowQAKpJZLdnji112OMVZSEKkLo7aEA6VFGHlNkjO
 t4QUy7o4OzRfqc4ExSbB5Asq7er6pYQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-540-w3nDE2ciOuyU1w2ZEh1kUw-1; Mon,
 30 Sep 2024 19:38:34 -0400
X-MC-Unique: w3nDE2ciOuyU1w2ZEh1kUw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9D37519560B7; Mon, 30 Sep 2024 23:38:31 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 36C723003FD1; Mon, 30 Sep 2024 23:38:27 +0000 (UTC)
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
Subject: [WIP RFC v2 09/35] WIP: rust: drm/kms: Add Connector.attach_encoder()
Date: Mon, 30 Sep 2024 19:09:52 -0400
Message-ID: <20240930233257.1189730-10-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

TODO:
* Figure out a solution for making sure that this can only be called when a
  Connector is unregistered, probably via an UnregisteredConnector type.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/connector.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 0fa927a3743b2..54457b327c365 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -28,6 +28,7 @@
 use super::{
     ModeObject,
     RcModeObject,
+    encoder::*,
     KmsDriver,
 };
 use macros::pin_data;
@@ -227,6 +228,20 @@ pub fn new(
             ARef::from_raw(NonNull::new_unchecked(Box::into_raw(Pin::into_inner_unchecked(new))))
         })
     }
+
+    /// Attach an encoder to this [`Connector`].
+    ///
+    /// TODO: Move this to an `UnregisteredConnector` interface somehow…
+    #[must_use]
+    pub fn attach_encoder<E>(&self, encoder: &Encoder<E>) -> Result
+    where
+        E: DriverEncoder<Driver = T::Driver>
+    {
+        // SAFETY: FFI call with no special requirements
+        to_result(unsafe {
+            bindings::drm_connector_attach_encoder(self.as_raw(), encoder.as_raw())
+        })
+    }
 }
 
 /// A trait implemented by any type that acts as a [`struct drm_connector`] interface.
-- 
2.46.1

