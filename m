Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B398B0F0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E8110E598;
	Mon, 30 Sep 2024 23:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AtrJZ9xb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830EF10E598
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6rI5OuJT5Uhwr5YsNsmFqxJRozJhSEgscnGrLzTJHQ=;
 b=AtrJZ9xb7t4DElm5VkHqkW+K9yIcTDPWmPdcOoqQQbSM3rSZv6WqHlkc8E8DYjF1sCogQE
 lHriig8jURirmrhU5XBJMpOT1P8hZ2kiXQNXLIUJoeQaWMNyJPcqTYAenPOtqbLjztWnGJ
 DaNgZxmNWBlmWJILfYXpWfj5NRIgZkE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-T22mXw6dOM2PCD_MgYanjg-1; Mon,
 30 Sep 2024 19:39:05 -0400
X-MC-Unique: T22mXw6dOM2PCD_MgYanjg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E91D6196A122; Mon, 30 Sep 2024 23:39:02 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 25EDD3003DEC; Mon, 30 Sep 2024 23:38:58 +0000 (UTC)
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
Subject: [WIP RFC v2 13/35] WIP: rust: drm/kms: Add OpaqueConnector and
 OpaqueConnectorState
Date: Mon, 30 Sep 2024 19:09:56 -0400
Message-ID: <20240930233257.1189730-14-lyude@redhat.com>
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

Since we allow drivers to have multiple implementations of DriverConnector
and DriverConnectorState (in C, the equivalent of this is having multiple
structs which embed drm_connector) - there are some situations we will run
into where it's not possible for us to know the corresponding
DriverConnector or DriverConnectorState for a given connector. The most
obvious one is iterating through all connectors on a KMS device.

So, take advantage of the various connector traits we added to introduce
OpaqueConnector<> and OpaqueConnectorState<> which both can be used as a
DRM connector and connector state respectively without needing to know the
corresponding traits.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

TODO:
* Add upcast functions for these types

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/connector.rs | 108 +++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index ec842ebc111ae..98ac7fb781d4e 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -359,6 +359,64 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Self {
     T::get_modes(connector.guard(&guard), &guard)
 }
 
+/// A [`struct drm_connector`] without a known [`DriverConnector`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverConnector`]
+/// implementation for a [`struct drm_connector`] automatically. It is identical to [`Connector`],
+/// except that it does not provide access to the driver's private data.
+///
+/// TODO: Add upcast methods for this
+///
+/// # Invariants
+///
+/// - `connector` is initialized for as long as this object is exposed to users.
+/// - The data layout of this type is equivalent to [`struct drm_connector`].
+///
+/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
+#[repr(transparent)]
+pub struct OpaqueConnector<T: KmsDriver> {
+    connector: Opaque<bindings::drm_connector>,
+    _p: PhantomData<T>
+}
+
+impl<T: KmsDriver> Sealed for OpaqueConnector<T> {}
+
+impl<T: KmsDriver> AsRawConnector for OpaqueConnector<T> {
+    type Driver = T;
+    type State = OpaqueConnectorState<T>;
+
+    fn as_raw(&self) -> *mut bindings::drm_connector {
+        self.connector.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_connector`
+        unsafe { &*ptr.cast() }
+    }
+}
+
+impl<T: KmsDriver> ModeObject for OpaqueConnector<T> {
+    type Driver = T;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: The parent device for a DRM connector will never outlive the connector, and this
+        // pointer is invariant through the lifetime of the connector
+        unsafe { Device::borrow((*self.as_raw()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose DRM connectors to users before `base` is initialized
+        unsafe { &mut (*self.as_raw()).base }
+    }
+}
+
+// SAFETY: Connectors are reference counted mode objects
+unsafe impl<T: KmsDriver> RcModeObject for OpaqueConnector<T> {}
+
+// SAFETY: Our connector interfaces are guaranteed to be thread-safe
+unsafe impl<T: KmsDriver> Send for OpaqueConnector<T> {}
+unsafe impl<T: KmsDriver> Sync for OpaqueConnector<T> {}
+
 /// A privileged [`Connector`] obtained while holding a [`ModeConfigGuard`].
 ///
 /// This provides access to various methods for [`Connector`] that must happen under lock, such as
@@ -537,6 +595,56 @@ unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut S
     }
 }
 
+/// A [`struct drm_connector_state`] without a known [`DriverConnectorState`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverConnectorState`]
+/// implementation for a [`struct drm_connector_state`] automatically. It is identical to
+/// [`Connector`], except that it does not provide access to the driver's private data.
+///
+/// TODO: Add upcast functions
+///
+/// # Invariants
+///
+/// - `state` is initialized for as long as this object is exposed to users.
+/// - The data layout of this type is identical to [`struct drm_connector_state`].
+/// - The DRM C API and our interface guarantees that only the user has mutable access to `state`,
+///   up until [`drm_atomic_helper_commit_hw_done`] is called. Therefore, `connector` follows rust's
+///   data aliasing rules and does not need to be behind an [`Opaque`] type.
+///
+/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
+/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic_helper.h
+#[repr(transparent)]
+pub struct OpaqueConnectorState<T: KmsDriver> {
+    state: bindings::drm_connector_state,
+    _p: PhantomData<T>
+}
+
+impl<T: KmsDriver> AsRawConnectorState for OpaqueConnectorState<T> {
+    type Connector = OpaqueConnector<T>;
+}
+
+impl<T: KmsDriver> private::AsRawConnectorState for OpaqueConnectorState<T> {
+    fn as_raw(&self) -> &bindings::drm_connector_state {
+        &self.state
+    }
+
+    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_connector_state {
+        &mut self.state
+    }
+}
+
+impl<T: KmsDriver> FromRawConnectorState for OpaqueConnectorState<T> {
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_connector_state) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_connector_state`
+        unsafe { &*ptr.cast() }
+    }
+
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_connector_state`
+        unsafe { &mut *ptr.cast() }
+    }
+}
+
 unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverConnectorState>(
     connector: *mut bindings::drm_connector
 ) -> *mut bindings::drm_connector_state
-- 
2.46.1

