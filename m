Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F0A16C8D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 13:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF18210E3E0;
	Mon, 20 Jan 2025 12:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 524 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jan 2025 12:54:22 UTC
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8496910E3E0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 12:54:22 +0000 (UTC)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id F00ED230B083; Mon, 20 Jan 2025 13:45:34 +0100 (CET)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: [PATCH] drm/panic: fix compilation issue on ARM
Date: Mon, 20 Jan 2025 13:45:29 +0100
Message-ID: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In C, the char type is specified with “The implementation shall define char to
have the same range, representation, and behavior as either signed char or
unsigned char.”

On x86 it defaults to signed char, and on ARM it defaults to unsigned char.
This carries over to Rust’s FFI, which aliases its c_char type to i8 on x86,
and to u8 on ARM.

We can fix this error by using the *const c_char type wherever it is needed,
rather than assuming we are on x86 by passing *const i8.

The only other place which uses the CStr::from_char_ptr() function is
errname(), which already uses c_char correctly thanks to bindgen.

Here is the error I encountered, building latest master:
```
error[E0308]: mismatched types
   --> drivers/gpu/drm/drm_panic_qr.rs:961:60
    |
961 |         let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
    |                                        ------------------- ^^^ expected `*const u8`, found `*const i8`
    |                                        |
    |                                        arguments to this function are incorrect
    |
    = note: expected raw pointer `*const u8`
               found raw pointer `*const i8`
note: associated function defined here
   --> rust/kernel/str.rs:187:19
    |
187 |     pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ffi::c_char) -> &'a Self {
    |                   ^^^^^^^^^^^^^

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0308`.
```
---
 drivers/gpu/drm/drm_panic_qr.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index ef2d490965ba..39ddb431b361 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -27,6 +27,7 @@
 //! * <https://github.com/bjguillot/qr>
 
 use core::cmp;
+use kernel::ffi::c_char;
 use kernel::str::CStr;
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
@@ -931,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
 /// They must remain valid for the duration of the function call.
 #[no_mangle]
 pub unsafe extern "C" fn drm_panic_qr_generate(
-    url: *const i8,
+    url: *const c_char,
     data: *mut u8,
     data_len: usize,
     data_size: usize,
-- 
2.48.1

