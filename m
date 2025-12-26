Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C669CDED78
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 18:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE7C10E030;
	Fri, 26 Dec 2025 17:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NppR/zRY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771D110E030
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 17:23:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1FEA144209;
 Fri, 26 Dec 2025 17:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6CD6C4CEF7;
 Fri, 26 Dec 2025 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766769782;
 bh=4cVn8UL6hNWEcg/YdhbCzOX9yeZWfbignrYfO4IkjYU=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=NppR/zRY6hVQHrSy1rvfbiL36FVszbN8T+YBp0QUapzE4D9UYEhWSiH/XFwGfzdx8
 vqWQM7WE43LAaep06loLgtDnP88lYHTsJTNZ8myh8Da11zGI5wZCaRSL7mjsa0RuXv
 d7qf0c7Wg0BUahRlUDO6jr3T7PFz3H9ZnP9qlitjSyA0J7Of04cXT1z5vaMdH5PpFJ
 hJu5cUisEntG7qFAxCe4gJbMufifJj8+cav68aZE3JLg571u9QNFQDVTvJg9jBlAaW
 ua1Z9nFWGMdwmJpuXAZ8OhKeCHUtWSEFuiI8XZlHsypZjW3JjFcWZrEnlFXpU3tc8j
 bSz+m6dDKnPyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CCDFBE7AD77;
 Fri, 26 Dec 2025 17:23:01 +0000 (UTC)
From: Ewan Chorynski via B4 Relay <devnull+ewan.chorynski.ik.me@kernel.org>
Date: Fri, 26 Dec 2025 18:22:36 +0100
Subject: [PATCH] rust: drm: Improve safety comment when using
 `Pin::into_inner_unchecked`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-drm-gem-safety-comment-v1-1-5ae56d8194b9@ik.me>
X-B4-Tracking: v=1; b=H4sIAFvETmkC/x2MMQqAMBAEvyJXe2AOo+BXxEJ0o1ckSiKiiH83y
 FRTzDyUEBWJuuKhiFOTbiGLKQua1jEsYJ2zk1RijUjDc/S8wHMaHY6bp817hIONsYLathlHOd4
 jnF7/uB/e9wOI2Z1/aAAAAA==
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ewan Chorynski <ewan.chorynski@ik.me>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766769780; l=1350;
 i=ewan.chorynski@ik.me; s=20251226; h=from:subject:message-id;
 bh=cr9xZXsdzg4gFRm4XD7QgBo5pAiTHyiIcr0OoAXNvbY=;
 b=QHme9hYoeeJ096eavEfMxvGDXboOP72kgL0MmQOVOXx33RBK6szLkQSKUzNcIeKuHaFxRcIZi
 jsIytm5GTXxDf0S/2mC8WMFLNWBe7z61mZQe6bTkFCq8FR1FjEYKKYt
X-Developer-Key: i=ewan.chorynski@ik.me; a=ed25519;
 pk=Qzaw5giL/U3IFVpYyrZjtONgXMAOpXYyUsXRpiS8hUQ=
X-Endpoint-Received: by B4 Relay for ewan.chorynski@ik.me/20251226 with
 auth_id=587
X-Original-From: Ewan Chorynski <ewan.chorynski@ik.me>
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
Reply-To: ewan.chorynski@ik.me
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ewan Chorynski <ewan.chorynski@ik.me>

The safety requirements for `Pin::into_inner_unchecked` state that the
returned pointer must be treated as pinned until it is dropped. Such a
guarantee is provided by the `ARef` type. This patch improve the safety
comment to to better reflect this.

---
Signed-off-by: Ewan Chorynski <ewan.chorynski@ik.me>
---
 rust/kernel/drm/gem/mod.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index a7f682e95c01..ed11d9c0f427 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -210,7 +210,7 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
         // SAFETY: The arguments are all valid per the type invariants.
         to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size) })?;
 
-        // SAFETY: We never move out of `Self`.
+        // SAFETY: We will never move out of `Self` as `ARef<Self>` is always treated as pinned.
         let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(obj) });
 
         // SAFETY: `ptr` comes from `KBox::into_raw` and hence can't be NULL.

---
base-commit: 6c8e404891e1059564d1a15a71d3d76070304dde
change-id: 20251226-drm-gem-safety-comment-1152e457575f

Best regards,
-- 
Ewan Chorynski <ewan.chorynski@ik.me>


