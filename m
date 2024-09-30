Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C444898B10C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A3B10E5A9;
	Mon, 30 Sep 2024 23:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d5RkNiXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098E710E5A9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhLeLvV27GzVDMIsND1hL5s5tE+smtYvQODvZdGLp1k=;
 b=d5RkNiXCjA6yEhZI6EmQCcKs05346j94IThos2kAb0a5fsl46/EhiVVITRLdn48EvVxSCe
 SI5fiWTtkEAkm/PgJLie6jLzVRXvK9eQq8zDvot7dBxc9FNVEgSN/GCFJRgqyvaUl5GLrR
 FqhmQX/98vnbV4VUowi4p0vBwd1sgas=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-450-JvvOGLywPfqNFpiwe3YSlg-1; Mon,
 30 Sep 2024 19:41:22 -0400
X-MC-Unique: JvvOGLywPfqNFpiwe3YSlg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 800D1194511A; Mon, 30 Sep 2024 23:41:20 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AA03A3003DEC; Mon, 30 Sep 2024 23:41:16 +0000 (UTC)
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
 Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 31/35] rust: drm: Add Device::event_lock()
Date: Mon, 30 Sep 2024 19:10:14 -0400
Message-ID: <20240930233257.1189730-32-lyude@redhat.com>
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

This is just a crate-private helper to use Lock::from_raw() to provide an
immutable reference to the DRM event_lock, so that it can be used like a
normal rust spinlock. We'll need this for adding vblank related bindings.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/device.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index d4d6b1185f6a6..207e7ea87cf8f 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -15,6 +15,7 @@
     error::from_err_ptr,
     error::Result,
     types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
+    sync::*,
 };
 use core::{
     ffi::c_void,
@@ -159,6 +160,12 @@ pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
         unsafe { <T::Data as ForeignOwnable>::from_foreign(drm.raw_data()) };
     }
 
+    /// Returns a reference to the `event` spinlock
+    pub(crate) fn event_lock(&self) -> &SpinLockIrq<()> {
+        // SAFETY: `event_lock` is initialized for as long as `self` is exposed to users
+        unsafe { SpinLockIrq::from_raw(&mut (*self.as_raw()).event_lock) }
+    }
+
     pub(crate) const fn has_kms() -> bool {
         <T::Kms as KmsImplPrivate>::MODE_CONFIG_OPS.is_some()
     }
-- 
2.46.1

