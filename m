Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54101A53E22
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00C710E080;
	Wed,  5 Mar 2025 23:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TIuOVivx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A5310E080
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRRGIfbn1O4NQuVIAQdXUxnmr9FtR81ZdEGKL5sWc/Q=;
 b=TIuOVivxMh36TAknYHCVJNiLCIwCX/sFFlrTR91wlFiWIXyDhh8o4dg+PS+2i0J+P7ZZBv
 xCUujMIGy60rTAvgvRHMCody5lghriCe18v9cdsFaUc9gt0RdF5VSf3gTP40kpFRfmrCEk
 wclRRRbOG2MTE96ypzp6qfteAs6sC04=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-EymIt6hbNLKfbKEoENAk_A-1; Wed,
 05 Mar 2025 18:08:48 -0500
X-MC-Unique: EymIt6hbNLKfbKEoENAk_A-1
X-Mimecast-MFC-AGG-ID: EymIt6hbNLKfbKEoENAk_A_1741216126
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0FE9E1809CA3; Wed,  5 Mar 2025 23:08:46 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 32191300019E; Wed,  5 Mar 2025 23:08:42 +0000 (UTC)
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
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 29/33] rust: drm: Add Device::event_lock()
Date: Wed,  5 Mar 2025 17:59:45 -0500
Message-ID: <20250305230406.567126-30-lyude@redhat.com>
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

This is just a crate-private helper to use Lock::from_raw() to provide an
immutable reference to the DRM event_lock, so that it can be used like a
normal rust spinlock. We'll need this for adding vblank related bindings.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/device.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index cf063de387329..3938ceb044645 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -11,6 +11,7 @@
     error::from_err_ptr,
     error::Result,
     ffi,
+    sync::*,
     types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
 };
 use core::{marker::PhantomData, ptr::NonNull};
@@ -154,6 +155,13 @@ pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
         unsafe { <T::Data as ForeignOwnable>::from_foreign(drm.raw_data()) };
     }
 
+    /// Returns a reference to the `event` spinlock
+    #[allow(dead_code)]
+    pub(crate) fn event_lock(&self) -> &SpinLockIrq<()> {
+        // SAFETY: `event_lock` is initialized for as long as `self` is exposed to users
+        unsafe { SpinLockIrq::from_raw(&mut (*self.as_raw()).event_lock) }
+    }
+
     pub(crate) const fn has_kms() -> bool {
         <T::Kms as KmsImplPrivate>::MODE_CONFIG_OPS.is_some()
     }
-- 
2.48.1

