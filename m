Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DA9A4E14
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 15:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9638B10E28A;
	Sat, 19 Oct 2024 13:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wiredspace.de header.i=@wiredspace.de header.b="Kvfm+hiT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA17910E0FA
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 08:41:37 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
 s=key1; t=1729327296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agn0+hQD08F841t4QY/P0Zr6g22Zhtf7LMnklweDjms=;
 b=Kvfm+hiTsQ3pcAMuEr450e9s29CFWzIUrS/dJ7oE6i4oN9vKCc2Ybk7zcVpdEovUK8kOgl
 xYnKd5e3dWmO7WRFc2dd60Sqvl7Cq+iqP6Rbnlu85fjBjbJqDb/xNdju1aiQMXZdodfSTj
 JDe1fza3mc81f6Z5Q5aZfWSE8I/CRIE=
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
Subject: [PATCH v2 7/7] drm/panic: allow verbose version check
Date: Sat, 19 Oct 2024 10:22:52 +0200
Message-ID: <20241019084048.22336-8-witcher@wiredspace.de>
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

Clippy warns about a reimplementation of `RangeInclusive::contains`:

    error: manual `!RangeInclusive::contains` implementation
       --> drivers/gpu/drm/drm_panic_qr.rs:986:8
        |
    986 |     if version < 1 || version > 40 {
        |        ^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use: `!(1..=40).contains(&version)`
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_range_contains
        = note: `-D clippy::manual-range-contains` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(clippy::manual_range_contains)]`

Ignore this and keep the current implementation as that makes it easier
to read.

Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1123
Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 2d4e367f0fcd..09500cddc009 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -983,6 +983,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
 /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
 #[no_mangle]
 pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
+    #[expect(clippy::manual_range_contains)]
     if version < 1 || version > 40 {
         return 0;
     }
-- 
2.46.2

