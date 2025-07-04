Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F364CAF9B90
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 22:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740C10EA77;
	Fri,  4 Jul 2025 20:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DK9wm1D/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4300110EA76;
 Fri,  4 Jul 2025 20:16:10 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7d5dedad887so83602385a.0; 
 Fri, 04 Jul 2025 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751660169; x=1752264969; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RRnCMuqdD131ZlyvTYi0z/+zkxHVEj8TfOGSz4lWZYk=;
 b=DK9wm1D/2YpoSgzhFGZHrxEvf1NEjcRZ676T5hLjFz5vjTh4XK9tsevn7G8hot7xsJ
 PBw1VqeQ8cnkdwvuoNKzsG9lLeHlfniOABOGIuDxc2ULj44txs+T98WdDH/EH+Hy+hPX
 R56180pN5wjT9W7/dzfk/oOaxAhX9j1ogkwsY+2G0Lo16vumZ9qylIXBZ9mRfW42EAZD
 R6OgrQ1kfs1g7Tu/kjZpLKmTcdOSCpt/DM9SbVTvSwoV9G5rs+UYH1aZ88AB2eDJu/Fx
 LDdRaXnhux3qlY04IzZd3Q5UwD3QX/9flB1MWJ7SYGS7EFOxYD9Hu+Y9SZ7wP8GdTqQC
 KtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751660169; x=1752264969;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RRnCMuqdD131ZlyvTYi0z/+zkxHVEj8TfOGSz4lWZYk=;
 b=h8jCuAgQtOBluPFCRqWnXqiAWzWQWYPTEW2Jf2tVYtjeLW1BME49dMDdQ2HJ6Q0Voy
 NjGQr1Ku8Jc+14KXKYAmiZjuC0M1dkMTrx8AXVAcOmaoVrWxiTelcsgonobemwWxob5b
 qtfb+ni/7FXheEA2jeRDdCZprjknYC5SROvkl8D3ACvIJsAlaTIvrxR6OEeNDKETmKto
 Onb0OlJKmjBnGz+7EBrc1+5eL4K84mVdCLonXEwKMMljILFIr4DxBPyRiIurcTQEq56U
 sKrs8FTsHvXT/SKR0Ss8XftPAwNDeXtAo7IrQDsRPnuwFhoZrmKAkd/7PWmz8Q53PxLJ
 3rUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnvV+D4Nv0bEl7Rh2DkcalZogaLyqXrq+FkEpVqvUFpVnSf776eQNaMOEHuHSk7sFYFzVCTCiFy84=@lists.freedesktop.org,
 AJvYcCXJ4epMuRzXim5AUAAn0gBBwv9Fv45wpxFwjnbs/ysmFUhUGlbblEHjIn7V9GQn9654He3eaJW2bw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXDpoNfSN0bizSv4h3ImHOF/K2iQRSZawWlvJdLmfv7/14zTMH
 gl2Zk9wcD13gwbJwQS/x1eHuwQxXit6UEG99DsT+hNMiVAt/2RHRHjUz
X-Gm-Gg: ASbGnctSZShthbah6qxvoz6Z1zUUcwjwvnGCY9qybXpQaCfywRE7GIqQaPy+wxb0uFN
 3YwTfOrCVHjj+DeIIo4V0DuVpl6Y06BJno50n7rjU2aeeL9EqX6PIk8q3ONcuu4PJOwRJ9s5rW7
 paMjDKbiiwPgf29XnVkdaqF2X5W3vWLNXAaU5QEw87P3punAOi+AopsSkBCqShivZpaPQ+2fEb0
 8sRfU1xEzOy1cl4xo8hp3F0elLgtah406aZxMrQgrnhnuV1+7WbJdpxCVRRyDnWNSITzAG7SvLJ
 8Pev/evVaABSmrw2ISr7d7EHBSY0jOw+7/GaluQBvalu8Udj0UYuS3HAzLO/L6gvv7xG8XA2/y1
 aA7CGfrE=
X-Google-Smtp-Source: AGHT+IEPhl7M3pPKVKJRRGXgxtNYr3mSuepsFyT/fNiRn/kJBm9O1QrZ8LLvefwHdmgY4q+idaONGw==
X-Received: by 2002:a05:620a:4456:b0:7d4:2925:91b8 with SMTP id
 af79cd13be357-7d5ef7c4961mr28485585a.16.1751660169087; 
 Fri, 04 Jul 2025 13:16:09 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa
 ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e5221sm19772941cf.2.2025.07.04.13.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 13:16:08 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 16:14:56 -0400
Subject: [PATCH 5/6] rust: add `CStr` methods matching `core::ffi::CStr`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-core-cstr-prepare-v1-5-a91524037783@gmail.com>
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751660161; l=3187;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=ijekkld9R1wbyb2cvN5FAg3adFOAIGh+Sl7Wg4UqSo0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPIwxczA1HLqncTECE1BZLwn/UXLVbajrq24i9LGs2u/GwbE2mHvzVz95Yp9yW1WgfD35PH8Hrr
 KgvLRh39BRgE=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

Prepare for replacing `CStr` with `core::ffi::CStr` by soft-deprecating
methods which don't exist on `core::ffi::CStr`.

We could keep `as_bytes{,_with_nul}` through an extension trait but
seeing as we have to introduce `as_char_ptr_in_const_context` as a free
function, we may as well introduce `to_bytes{,_with_nul}` here to allow
downstream code to migrate in one cycle rather than two.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/str.rs | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index f326f0c40ab0..cbb357fc0111 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -175,6 +175,15 @@ macro_rules! b_str {
     }};
 }
 
+/// Returns a C pointer to the string.
+// It is a free function rather than a method on an extension trait because:
+//
+// - error[E0379]: functions in trait impls cannot be declared const
+#[inline]
+pub const fn as_char_ptr_in_const_context(c_str: &CStr) -> *const c_char {
+    c_str.0.as_ptr()
+}
+
 /// Possible errors when using conversion functions in [`CStr`].
 #[derive(Debug, Clone, Copy)]
 pub enum CStrConvertError {
@@ -294,23 +303,45 @@ pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
     }
 
     /// Returns a C pointer to the string.
+    ///
+    /// Using this function in a const context is deprecated in favor of
+    /// [`as_char_ptr_in_const_context`] in preparation for replacing `CStr` with `core::ffi::CStr`
+    /// which does not have this method.
     #[inline]
     pub const fn as_char_ptr(&self) -> *const c_char {
-        self.0.as_ptr()
+        as_char_ptr_in_const_context(self)
     }
 
     /// Convert the string to a byte slice without the trailing `NUL` byte.
     #[inline]
-    pub fn as_bytes(&self) -> &[u8] {
+    pub fn to_bytes(&self) -> &[u8] {
         &self.0[..self.len()]
     }
 
+    /// Convert the string to a byte slice without the trailing `NUL` byte.
+    ///
+    /// This function is deprecated in favor of [`Self::to_bytes`] in preparation for replacing
+    /// `CStr` with `core::ffi::CStr` which does not have this method.
+    #[inline]
+    pub fn as_bytes(&self) -> &[u8] {
+        self.to_bytes()
+    }
+
     /// Convert the string to a byte slice containing the trailing `NUL` byte.
     #[inline]
-    pub const fn as_bytes_with_nul(&self) -> &[u8] {
+    pub const fn to_bytes_with_nul(&self) -> &[u8] {
         &self.0
     }
 
+    /// Convert the string to a byte slice containing the trailing `NUL` byte.
+    ///
+    /// This function is deprecated in favor of [`Self::to_bytes_with_nul`] in preparation for
+    /// replacing `CStr` with `core::ffi::CStr` which does not have this method.
+    #[inline]
+    pub const fn as_bytes_with_nul(&self) -> &[u8] {
+        self.to_bytes_with_nul()
+    }
+
     /// Yields a [`&str`] slice if the [`CStr`] contains valid UTF-8.
     ///
     /// If the contents of the [`CStr`] are valid UTF-8 data, this

-- 
2.50.0

