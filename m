Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A498B0F5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9D510E59B;
	Mon, 30 Sep 2024 23:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZFqv+c9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D80310E59B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQUtNu2ymV8+ePIE/+uRZptH2R5q5/TOrvKyouxuFHU=;
 b=ZFqv+c9LpGjOXPwt7OM9yuwt416Wr2tLucpdtaD5NVjsw+8wTBhWnQTcryPGF+R/uKO4Yw
 TC3Ijuh7P3jU8Og+R5AAw5mTeANR/UTWkSf3Mkl1/g2LFsy0kT9eIVWk7uO3VAqy05OpNa
 JhER8aWsvBw4wq07qJi+IzipXQvuwPo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-iOcJtWYwNDCzdFpW_N7r0Q-1; Mon,
 30 Sep 2024 19:39:26 -0400
X-MC-Unique: iOcJtWYwNDCzdFpW_N7r0Q-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A0B15196A111; Mon, 30 Sep 2024 23:39:23 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 98B8B3003DEC; Mon, 30 Sep 2024 23:39:19 +0000 (UTC)
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
Subject: [WIP RFC v2 16/35] rust: drm/kms: Add RawConnector and
 RawConnectorState
Date: Mon, 30 Sep 2024 19:09:59 -0400
Message-ID: <20240930233257.1189730-17-lyude@redhat.com>
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

Now that we have more then one way to refer to connectors, we also want to
ensure that any methods which are common to any kind of connector type can
be used on all connector representations. This is where RawConnector and
RawConnectorState come in: we implement these traits for any type which
implements AsRawConnector or AsRawConnectorState respectively.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/connector.rs | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 98ac7fb781d4e..f62740d7f6469 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -331,6 +331,27 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Self {
     }
 }
 
+/// Common methods available on any type which implements [`AsRawConnector`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// connectors.
+pub trait RawConnector: AsRawConnector {
+    /// Return the index of this DRM connector
+    #[inline]
+    fn index(&self) -> u32 {
+        // SAFETY: The index is initialized by the time we expose DRM connector objects to users,
+        // and is invariant throughout the lifetime of the connector
+        unsafe { (*self.as_raw()).index }
+    }
+
+    /// Return the bitmask derived from this DRM connector's index
+    #[inline]
+    fn mask(&self) -> u32 {
+        1 << self.index()
+    }
+}
+impl<T: AsRawConnector> RawConnector for T {}
+
 unsafe extern "C" fn connector_destroy_callback<T: DriverConnector>(
     connector: *mut bindings::drm_connector,
 ) {
@@ -523,6 +544,19 @@ pub trait FromRawConnectorState: AsRawConnectorState {
     unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut Self;
 }
 
+/// Common methods available on any type which implements [`AsRawConnectorState`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// the atomic state of [`Connector`]s.
+pub trait RawConnectorState: AsRawConnectorState {
+    fn connector(&self) -> &Self::Connector {
+        // SAFETY: This is guaranteed safe by type invariance, and we're guaranteed by DRM that
+        // `self.state.connector` points to a valid instance of a `Connector<T>`
+        unsafe { Self::Connector::from_raw((*self.as_raw()).connector) }
+    }
+}
+impl<T: AsRawConnectorState> RawConnectorState for T {}
+
 /// The main interface for a [`struct drm_connector_state`].
 ///
 /// This type is the main interface for dealing with the atomic state of DRM connectors. In
-- 
2.46.1

