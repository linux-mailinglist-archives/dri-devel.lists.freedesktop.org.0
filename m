Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF26CA4BAD8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A863A10E3B1;
	Mon,  3 Mar 2025 09:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zot24OU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F214B10E3AD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:33:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C01D75C4C2F;
 Mon,  3 Mar 2025 09:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E6CC4CED6;
 Mon,  3 Mar 2025 09:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740994391;
 bh=uxWb5weZnx4w75c+cNd9geof+3mOOtF83ztdgamkHZc=;
 h=From:To:Cc:Subject:Date:From;
 b=Zot24OU+Kr3IVKlNxS8Ms3Pi6PvMwu9DHSIsqRFgjxP7aaO6HBF+zxguPxwkhaO2a
 xrdRh9uBrtzK+Ykgl393iwGLK8grS93jXMrw/M0Jj0oWxBTRY58YtHO+mmTaRseX2I
 bwx01tB5PVV+suC6VLbWhT09Tqr1VNPpdd3/9dK4QlGfahn05Hh3Kp5xbqtzv3xwhm
 O65rL/CJBPtzWDzv1AOWI5Q5YPz+w3dHiYps7UNc3zVcLGycvh5U026fbDNLbGuWdj
 Bnj8SfZx8IFw+vKyH2xq2DVorZGK5IOZDXsua4NUVPxKkq4g9T8Y1Rw4H+/nn9pxqK
 tcLnUaY4LNqEQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: [PATCH] drm/panic: clean Clippy warning
Date: Mon,  3 Mar 2025 10:32:42 +0100
Message-ID: <20250303093242.1011790-1-ojeda@kernel.org>
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

Clippy warns:

    error: manual implementation of an assign operation
       --> drivers/gpu/drm/drm_panic_qr.rs:418:25
        |
    418 |                         self.carry = self.carry % pow;
        |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: replace it with: `self.carry %= pow`
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#assign_op_pattern

Thus clean it up.

Fixes: dbed4a797e00 ("drm/panic: Better binary encoding in QR code")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 62cb8a162483..3b0dd59781d4 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -415,7 +415,7 @@ fn next(&mut self) -> Option<Self::Item> {
                         self.carry_len -= out_len;
                         let pow = u64::pow(10, self.carry_len as u32);
                         let out = (self.carry / pow) as u16;
-                        self.carry = self.carry % pow;
+                        self.carry %= pow;
                         Some((out, NUM_CHARS_BITS[out_len]))
                     }
                 }

base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1
-- 
2.48.1

