Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71D798B0F6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A26410E59C;
	Mon, 30 Sep 2024 23:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J+BXSl+p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F5210E59C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2ZqNS7fpaukLWUM4ISWNMCXuLZuLhXZJI56Y+VCkes=;
 b=J+BXSl+pf2iIGcztwG+3bvg41upB8CJlUvBtSwZdQOmApCGJKiIkF/k+N8y51DXZrSVmuk
 x+ePwGC75aPenSzw5II5LKXEKiE2KvcQuTV0UJX3sjlVkpFR0A+EKbdsPt/uqBiKZxBinu
 IGGa4IEWRdlY+vc6pYr+xit90l3zclc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-323-Nr2P90v3PYGPy62zTVK3og-1; Mon,
 30 Sep 2024 19:39:32 -0400
X-MC-Unique: Nr2P90v3PYGPy62zTVK3og-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0E21B19626D4; Mon, 30 Sep 2024 23:39:30 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7C0EF3003DEC; Mon, 30 Sep 2024 23:39:26 +0000 (UTC)
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
Subject: [WIP RFC v2 17/35] rust: drm/kms: Add RawCrtc and RawCrtcState
Date: Mon, 30 Sep 2024 19:10:00 -0400
Message-ID: <20240930233257.1189730-18-lyude@redhat.com>
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

Same thing as RawConnector and RawConnectorState, just for CRTCs now.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/crtc.rs | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 1a3c9c448afcc..246d15a15c14d 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -302,6 +302,25 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self {
     }
 }
 
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
 /// A [`struct drm_crtc`] without a known [`DriverCrtc`] implementation.
 ///
 /// This is mainly for situations where our bindings can't infer the [`DriverCrtc`] implementation
@@ -447,8 +466,10 @@ pub trait AsRawCrtcState {
 
 pub(super) use private::AsRawCrtcState as AsRawCrtcStatePrivate;
 
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
2.46.1

