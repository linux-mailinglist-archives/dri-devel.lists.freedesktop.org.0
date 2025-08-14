Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F74B260F8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB8D10E2A3;
	Thu, 14 Aug 2025 09:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G/o5FWLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82E810E2A3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:31:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD92D5C6F58;
 Thu, 14 Aug 2025 09:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F555C4CEED;
 Thu, 14 Aug 2025 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755163899;
 bh=AtdCut0p3HWXoX/BFy+3Zii54dnLRBC5LFi3wTrY/D8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G/o5FWLYs7exPkOr91ll44EELwbqVaVEX6wyZO4o9/qG056tfyAMNks73EVJh2Xax
 jeXxxCRYJBdCjYqYjFGcOiweiVOhknUGZEcc1WFW32fembGVZquVobIBhjBPb+MWVq
 KLEJVevGjmlQ6IhJNgVXJ5vkVRqPoCaihnuD2LnRFumlSiw9bdbxy2IMypndBfHwPA
 GwtZMJ42xAmvJYsez82bT/ZlKICjoddy/ArAuXLeJPjwrKTuKIPCTi6v4hs7O1voew
 pU7UOkjdfxFAHa9FB6br68eNj4F+Hwi/fw748IkgNLIJjdpiFYy7TqcFbmFiwimTcL
 gsQqMwKOVbhHw==
From: Benno Lossin <lossin@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina+kernel@asahilina.net>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/11] rust: drm: replace `core::mem::zeroed` with
 `pin_init::zeroed`
Date: Thu, 14 Aug 2025 11:30:35 +0200
Message-ID: <20250814093046.2071971-9-lossin@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814093046.2071971-1-lossin@kernel.org>
References: <20250814093046.2071971-1-lossin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

All types in `bindings` implement `Zeroable` if they can, so use
`pin_init::zeroed` instead of relying on `unsafe` code.

If this ends up not compiling in the future, something in bindgen or on
the C side changed and is most likely incorrect.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/kernel/drm/gem/mod.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index b71821cfb5ea..6532513090de 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -308,9 +308,7 @@ impl<T: DriverObject> AllocImpl for Object<T> {
 }
 
 pub(super) const fn create_fops() -> bindings::file_operations {
-    // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
-    // zeroed.
-    let mut fops: bindings::file_operations = unsafe { core::mem::zeroed() };
+    let mut fops: bindings::file_operations = pin_init::zeroed();
 
     fops.owner = core::ptr::null_mut();
     fops.open = Some(bindings::drm_open);
-- 
2.50.1

