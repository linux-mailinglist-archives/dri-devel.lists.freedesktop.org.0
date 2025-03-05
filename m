Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F002EA53E02
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DAA10E84E;
	Wed,  5 Mar 2025 23:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DWobE7mX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7159F10E84E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MBAtf8b0iFaHt8G5vaAlm0/XTAjGoaebIJGPgNqjtU=;
 b=DWobE7mX4Kys1/yMWnNthYJmJl5VgutIwMz8kjDlDV1Zep3mMeVW9zLl1BakWQsZfED0qb
 YAYeeCFtHZ/tNv82ocRqrMymvYLcpVOuF1AIbpskyM51hMADM8cpsnnBalI7yONQjQQoWd
 T4nATEju6fspbGp+wBqzgXQoZeRcULQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-Ck2kwp_CP5Gvgo2lBvhYrw-1; Wed,
 05 Mar 2025 18:06:22 -0500
X-MC-Unique: Ck2kwp_CP5Gvgo2lBvhYrw-1
X-Mimecast-MFC-AGG-ID: Ck2kwp_CP5Gvgo2lBvhYrw_1741215980
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 511351955D4B; Wed,  5 Mar 2025 23:06:20 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 65A82300019E; Wed,  5 Mar 2025 23:06:16 +0000 (UTC)
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
Subject: [RFC v3 12/33] rust: drm/kms: Add RawConnector and RawConnectorState
Date: Wed,  5 Mar 2025 17:59:28 -0500
Message-ID: <20250305230406.567126-13-lyude@redhat.com>
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

Now that we have more then one way to refer to connectors, we also want to
ensure that any methods which are common to any kind of connector type can
be used on all connector representations. This is where RawConnector and
RawConnectorState come in: we implement these traits for any type which
implements AsRawConnector or AsRawConnectorState respectively.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/connector.rs | 35 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/kms/crtc.rs      | 26 ++++++++++++++++++++++--
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 244db1cfdc552..0cfe346b4760e 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -397,6 +397,27 @@ pub fn attach_encoder(&self, encoder: &impl AsRawEncoder) -> Result {
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
@@ -536,6 +557,20 @@ pub trait FromRawConnectorState: AsRawConnectorState {
     unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut Self;
 }
 
+/// Common methods available on any type which implements [`AsRawConnectorState`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// the atomic state of [`Connector`]s.
+pub trait RawConnectorState: AsRawConnectorState {
+    /// Return the connector that this atomic state belongs to.
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
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 95c79ffb584cd..9950b09754072 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -341,6 +341,26 @@ pub unsafe trait ModesettableCrtc: AsRawCrtc {
     /// The type that should be returned for a CRTC state acquired using this CRTC interface
     type State: FromRawCrtcState;
 }
+
+/// Common methods available on any type which implements [`AsRawCrtc`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// CRTCs.
+pub trait RawCrtc: AsRawCrtc {
+    /// Return the index of this CRTC.
+    fn index(&self) -> u32 {
+        // SAFETY: The index is initialized by the time we expose Crtc objects to users, and is
+        // invariant throughout the lifetime of the Crtc
+        unsafe { (*self.as_raw()).index }
+    }
+
+    /// Return the index of this DRM CRTC in the form of a bitmask.
+    fn mask(&self) -> u32 {
+        1 << self.index()
+    }
+}
+impl<T: AsRawCrtc> RawCrtc for T {}
+
 unsafe impl Zeroable for bindings::drm_crtc_state {}
 
 impl<T: DriverCrtcState> Sealed for CrtcState<T> {}
@@ -432,8 +452,10 @@ pub trait AsRawCrtcState {
     }
 }
 
-/// A trait for providing common methods which can be used on any type that can be used as an atomic
-/// CRTC state.
+/// Common methods available on any type which implements [`AsRawCrtcState`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// the atomic state of [`Crtc`]s.
 pub trait RawCrtcState: AsRawCrtcState {
     /// Return the CRTC that owns this state.
     fn crtc(&self) -> &Self::Crtc {
-- 
2.48.1

