Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42759A4E10
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 15:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B5210E28B;
	Sat, 19 Oct 2024 13:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wiredspace.de header.i=@wiredspace.de header.b="elMYD0Ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0CC10E23B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 08:41:18 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
 s=key1; t=1729327276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5h88aRCX075gQyacCBN//xbLtbJ+w9Ld3N3jt4xAwmA=;
 b=elMYD0Ulyk0Ph6cf+QJs8Gb5ybPcrTxhHxPtJxdXOERuk4TzCZt85jgcGI02gA2eO9rnOy
 ZHaIxZmXqamLRy7xXhUt7Lshwb/1UyddIaGj4f2TcPOnvqV/yRTERoMxf0nMjD0nMOQsuV
 SQuTBf4WV/+Rs8eQnQtC5HIELNW9QOU=
From: =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
Subject: [PATCH v2 1/7] drm/panic: avoid reimplementing Iterator::find
Date: Sat, 19 Oct 2024 10:22:46 +0200
Message-ID: <20241019084048.22336-2-witcher@wiredspace.de>
In-Reply-To: <20241019084048.22336-1-witcher@wiredspace.de>
References: <20241019084048.22336-1-witcher@wiredspace.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 19 Oct 2024 13:04:47 +0000
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

Rust's standard library's `std::iter::Iterator` trait provides a function
`find` that finds the first element that satisfies a predicate.
The function `Version::from_segments` is doing the same thing but is
implementing the same logic itself.

Clippy complains about this in the `manual_find` lint:

    error: manual implementation of `Iterator::find`
       --> drivers/gpu/drm/drm_panic_qr.rs:212:9
        |
    212 | /         for v in (1..=40).map(|k| Version(k)) {
    213 | |             if v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum() {
    214 | |                 return Some(v);
    215 | |             }
    216 | |         }
    217 | |         None
        | |____________^ help: replace with an iterator: `(1..=40).map(|k| Version(k)).find(|&v| v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum())`
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_find
        = note: `-D clippy::manual-find` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(clippy::manual_find)]`

Use `Iterator::find` instead to make the intention clearer.

Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1123
Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 1ef56cb07dfb..76decf49e678 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -209,12 +209,9 @@
 impl Version {
     /// Returns the smallest QR version than can hold these segments.
     fn from_segments(segments: &[&Segment<'_>]) -> Option<Version> {
-        for v in (1..=40).map(|k| Version(k)) {
-            if v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum() {
-                return Some(v);
-            }
-        }
-        None
+        (1..=40)
+            .map(Version)
+            .find(|&v| v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum())
     }
 
     fn width(&self) -> u8 {
-- 
2.46.2

