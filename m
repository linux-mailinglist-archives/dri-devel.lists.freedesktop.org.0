Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F89D8F30
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 00:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2D110E0E0;
	Mon, 25 Nov 2024 23:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L9MqDI9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF10F10E0E0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 23:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B29B85C5AE2;
 Mon, 25 Nov 2024 23:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3690BC4CECE;
 Mon, 25 Nov 2024 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732577636;
 bh=ZI88yhG9GI0DouWMQIl4znxd8wu87u5uaWf+pyuEVRU=;
 h=From:To:Cc:Subject:Date:From;
 b=L9MqDI9A8/KhvycwCCGcaVwWb8yODG0T+dRLdZeqzdDheGLoL7PkFNXvfI7WCSpzW
 llfh2jTJeI+nsQEpXwk7qan/ZPth4NVXXN72Zq6lNhs3Mam3bWimDBlS/x4AWG/hoK
 3TGZ0U3jqz8HjZ153FaovFS5k/wLNJ4ucK0Nre7Fk4SA2jbbAOwhfWu0tc/Z0K43+q
 rXLBLzPjVmO3vOMxkrmHtScCjM+XRDjaZuwB35RX+xXLN5LOmzR9TJ8QNyAoah2RVL
 AmZk2gEmqUhKa0vLgYjp0xBDpvmeX2o6FMpBqnMtN+UkpxtZN4gpzr7auBq99ie+/F
 gEA4vVKFguUDw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 stable@vger.kernel.org
Subject: [PATCH] drm/panic: remove spurious empty line to clean warning
Date: Tue, 26 Nov 2024 00:33:32 +0100
Message-ID: <20241125233332.697497-1-ojeda@kernel.org>
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

Clippy in the upcoming Rust 1.83.0 spots a spurious empty line since the
`clippy::empty_line_after_doc_comments` warning is now enabled by default
given it is part of the `suspicious` group [1]:

    error: empty line after doc comment
       --> drivers/gpu/drm/drm_panic_qr.rs:931:1
        |
    931 | / /// They must remain valid for the duration of the function call.
    932 | |
        | |_
    933 |   #[no_mangle]
    934 | / pub unsafe extern "C" fn drm_panic_qr_generate(
    935 | |     url: *const i8,
    936 | |     data: *mut u8,
    937 | |     data_len: usize,
    ...   |
    940 | |     tmp_size: usize,
    941 | | ) -> u8 {
        | |_______- the comment documents this function
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_doc_comments
        = note: `-D clippy::empty-line-after-doc-comments` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(clippy::empty_line_after_doc_comments)]`
        = help: if the empty line is unintentional remove it

Thus remove the empty line.

Cc: stable@vger.kernel.org
Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Link: https://github.com/rust-lang/rust-clippy/pull/13091 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
I added the Fixes and stable tags since it would be nice to keep the 6.12 LTS
Clippy-clean (since that one is the first that supports several Rust compilers).

 drivers/gpu/drm/drm_panic_qr.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 09500cddc009..ef2d490965ba 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -929,7 +929,6 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
 /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
 ///
 /// They must remain valid for the duration of the function call.
-
 #[no_mangle]
 pub unsafe extern "C" fn drm_panic_qr_generate(
     url: *const i8,

base-commit: b7ed2b6f4e8d7f64649795e76ee9db67300de8eb
--
2.47.0
