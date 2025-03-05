Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF9A53DE9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451DF10E0D7;
	Wed,  5 Mar 2025 23:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GoYhkgAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DD410E0D7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIuY6TyfKud/M9WMFn5VR3J80u8Grm+L9fJlJoOSHhY=;
 b=GoYhkgAvPSkfF63prYHDgqxKHMUnKvFjaHqVaKmci1J2oCeLupfUQfGYaxAktobuofKH3x
 j43mm0ri2nYKPfNCdUuWUG1TLRhvEPWvsQna7mGNm9IoXgBquEz6t6lgKt1dOkPV5L7Doj
 JN8n/3J1soxgvbzVqCskULuc5XVVhR4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-jnJ7gJu3Nuqg6hYvZ-kGQg-1; Wed,
 05 Mar 2025 18:04:29 -0500
X-MC-Unique: jnJ7gJu3Nuqg6hYvZ-kGQg-1
X-Mimecast-MFC-AGG-ID: jnJ7gJu3Nuqg6hYvZ-kGQg_1741215867
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8A93A1800349; Wed,  5 Mar 2025 23:04:26 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 78BB9300019E; Wed,  5 Mar 2025 23:04:21 +0000 (UTC)
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
Subject: [RFC v3 01/33] rust: drm: Add a small handful of fourcc bindings
Date: Wed,  5 Mar 2025 17:59:17 -0500
Message-ID: <20250305230406.567126-2-lyude@redhat.com>
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

This adds some very basic rust bindings for fourcc. We only have a single
format code added for the moment, but this is enough to get a driver
registered.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Drop FormatList and ModifierList
  These aren't actually needed as pointed out by Louis Chauvet
* Add a constant for FORMAT_MOD_INVALID
  I realized that we actually need this because the format list isn't
  terminated with a 0 like I thought, and we can't pick this up
  automatically through bindgen
* Split out the FormatInfo WIP
  We'll want this someday, but not yet.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/fourcc.rs | 21 +++++++++++++++++++++
 rust/kernel/drm/mod.rs    |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 rust/kernel/drm/fourcc.rs

diff --git a/rust/kernel/drm/fourcc.rs b/rust/kernel/drm/fourcc.rs
new file mode 100644
index 0000000000000..62203478b5955
--- /dev/null
+++ b/rust/kernel/drm/fourcc.rs
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM fourcc bindings.
+//!
+//! C header: [`include/uapi/drm/drm_fourcc.h`](srctree/include/uapi/drm/drm_fourcc.h)
+
+/// Return a fourcc format code.
+const fn fourcc_code(a: u8, b: u8, c: u8, d: u8) -> u32 {
+    (a as u32) | (b as u32) << 8 | (c as u32) << 16 | (d as u32) << 24
+}
+
+// TODO: We manually import this because we don't have a reasonable way of getting constants from
+// function-like macros in bindgen yet.
+#[allow(dead_code)]
+pub(crate) const FORMAT_MOD_INVALID: u64 = 0xffffffffffffff;
+
+// TODO: We need to automate importing all of these. For the time being, just add the single one
+// that we need
+
+/// 32 bpp RGB
+pub const XRGB888: u32 = fourcc_code(b'X', b'R', b'2', b'4');
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index c44760a1332fa..2c12dbd181997 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -5,5 +5,6 @@
 pub mod device;
 pub mod drv;
 pub mod file;
+pub mod fourcc;
 pub mod gem;
 pub mod ioctl;
-- 
2.48.1

