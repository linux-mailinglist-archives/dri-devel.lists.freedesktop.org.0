Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A360BA4AE5A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 00:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7712710E033;
	Sat,  1 Mar 2025 23:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kDyu2F3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8345C10E033
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 23:17:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D6F06115A;
 Sat,  1 Mar 2025 23:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B32C4CEDD;
 Sat,  1 Mar 2025 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740871058;
 bh=GhbeATzCXl+lMmnbqB+zXHJ3ZcWvW3mX2kTV/3tkedM=;
 h=From:To:Cc:Subject:Date:From;
 b=kDyu2F3xfqwJ+zBTUWwQdm0HaXMy7TpxSqHGkgBAm1vqD8jnPzf+r0ISkzxcTNBQC
 GIagU5WrvTeVuqgvJACZJ+Sub0iC1ydudzCId/ticfN8pIvnJt2lhGlLdPLs4FYcuZ
 9jnu6Ytq4HQqTwB1IAl7n48mJ4LO7fZj57Wz8jaTjzBR7/gUdXSNYynXMnhMv4YeYj
 e0X1yqIpUdNtkTu+gAuzYsib7WAg0X4mM/DNxdEIRDfily+Zmc0bnykvPV2E14Ewhg
 fU41iUdECVpNhyhPp3vGSVgT24qkkpRzE1CUDHAqQEcmy1Pga4aRVmUTEA6G8visYy
 wCRbTiuD3F6sw==
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
Subject: [PATCH 1/2] drm/panic: use `div_ceil` to clean Clippy warning
Date: Sun,  2 Mar 2025 00:16:01 +0100
Message-ID: <20250301231602.917580-1-ojeda@kernel.org>
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

Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
Clippy warns:

    error: manually reimplementing `div_ceil`
       --> drivers/gpu/drm/drm_panic_qr.rs:548:26
        |
    548 |         let pad_offset = (offset + 7) / 8;
        |                          ^^^^^^^^^^^^^^^^ help: consider using `.div_ceil()`: `offset.div_ceil(8)`
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_div_ceil

And similarly for `stride`. Thus apply the suggestion to both.

The behavior (and thus codegen) is not exactly equivalent [1][2], since
`div_ceil()` returns the right value for the values that currently
would overflow.

Link: https://github.com/rust-lang/rust-clippy/issues/14333 [1]
Link: https://godbolt.org/z/dPq6nGnv3 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/drm/drm_panic_qr.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index bcf248f69252..8bb5e52d75cc 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -545,7 +545,7 @@ fn add_segments(&mut self, segments: &[&Segment<'_>]) {
         }
         self.push(&mut offset, (MODE_STOP, 4));
 
-        let pad_offset = (offset + 7) / 8;
+        let pad_offset = offset.div_ceil(8);
         for i in pad_offset..self.version.max_data() {
             self.data[i] = PADDING[(i & 1) ^ (pad_offset & 1)];
         }
@@ -659,7 +659,7 @@ struct QrImage<'a> {
 impl QrImage<'_> {
     fn new<'a, 'b>(em: &'b EncodedMsg<'b>, qrdata: &'a mut [u8]) -> QrImage<'a> {
         let width = em.version.width();
-        let stride = (width + 7) / 8;
+        let stride = width.div_ceil(8);
         let data = qrdata;
 
         let mut qr_image = QrImage {

base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.48.1

