Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E8BAF9B8F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 22:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C2910EA78;
	Fri,  4 Jul 2025 20:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R1Ajk/tc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3892910EA78;
 Fri,  4 Jul 2025 20:16:11 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4a9741b513eso26494161cf.1; 
 Fri, 04 Jul 2025 13:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751660170; x=1752264970; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rFX61eKYEcol9kAG3M8tjgApkaTg0NmTOXaZhr2OWW4=;
 b=R1Ajk/tcHMHKOqz6iT+0zQ/3g32b1gnBtH//ZijmFu1R49BcxyjQuRsDBHDKLumrzW
 79kiNgPovUdIvcO4MtDkjANOWktieIgOvuXvRibNEyBINloYUIj3ombwpY65HMbBsaBO
 lBjjNPgreySXDkLeFwUNOATSKp9epLLYRfQlNJeCf4p2HZH+uIQvWK4Fcwc/k3eeVvhv
 VQkl87rbBN1UIxPTOvs+Y1saLc6saP8IqXawpmZ1N+zfx0XqZo3Z0BuWBnhoFnZcNbFz
 3hMbz/AaRqYlHnawc9hjd0x0ZAnBH5840LLN+LoLXb73toytLT2UL76WQ+VbnIPbcdUL
 Idjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751660170; x=1752264970;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFX61eKYEcol9kAG3M8tjgApkaTg0NmTOXaZhr2OWW4=;
 b=TMF/G9QU/pDvLqU3FRAXpsFXotIcRqFsZ4TSVc0X4CxmUpG5yTg5vXDTyuRrW/Zfzc
 jG7dfswL5xHV+BG9q1XCA2ZNN6SRCnB6z7HmXb2YU77Qs632lxrQ5safo2cUGbyxNYgh
 /aKVh8xxzqInvyItqdmDYDf5/m6VvJr5a5ALwnRNF2I1Oze30Gq896y/zjTsVHpWMsHF
 H6nIGMRTAY/cnYcb2KxFCI6zQXFsTDukQNHpZFJFJZxPR49EZWhi3xiKFFT+LFWX7J1+
 pppvg73tNuNTKfsA0IrsGkMaK16XnMMEEUyJX2aVRgP9U3fSLcWBE0gEBr4hvGSKdamk
 IqRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsKMn8pjVLPwJb9GvqX+Kjkqq0ADqWQfUX4SdyXtQXRFXD5DUBQIYNlImwzLvubaBhoiGQuFKPTg==@lists.freedesktop.org,
 AJvYcCX+aYTXGKUcCmjiygmP8xcnjN4J7R5G/NfSEHgLI0cebvysnZNqsmCfDwrLZJVxjMVmPq4sSA+E+0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnehhZcq+Q8eZB8aidthLya1TrG97iH3H76mu2cckFbzO6QQxO
 aV/lDVFcfbDup4coNYoLLF+9j79miGL+/Xofa3OVbZGnUxivkYe6JHfu
X-Gm-Gg: ASbGncs3yguAXmY6iUEZwns4UZscdioXb6C5SkLGCNkb0i9+dSXFPPa6wfOYAeBcLjL
 XOskfz6azmTvH+mBs9QRZU9VdIgFjqvP647ila1PSB1UvZnBIyIhBLJBkqIDwy40Yb+6muUlCQQ
 p7abo+Pynqtxi2hCXgVdbRjDus3/xgzb7Y9U9uloalGyQZdxD8iTIkFyWd0I8wejI0accy96Oyj
 GynyrU3x6jlkyN/9ZKJtT5HsLS465zVnsDpy8qzq2t3lztftMdvX9/K5TAyzmmXy7ZzGcUGTWVZ
 eoSDYrEPAB6QASGfX5Ecs7oVWOFc+CuZCPwm++UcC/8lbc6vKEtk0HRstvyLzxpgWWKskS7KpYI
 wCtR4dhI=
X-Google-Smtp-Source: AGHT+IHCClMp3qYZhSGQu4QEJmyo61DmZpj8XQCRl0CIpaNBHANR9wOTxi6Qz7IzHn6a7YD26jNiWw==
X-Received: by 2002:ac8:7f8f:0:b0:494:59b0:7347 with SMTP id
 d75a77b69052e-4a9a69f76cfmr2280131cf.37.1751660170283; 
 Fri, 04 Jul 2025 13:16:10 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa
 ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e5221sm19772941cf.2.2025.07.04.13.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 13:16:09 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 16:14:57 -0400
Subject: [PATCH 6/6] rust: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250704-core-cstr-prepare-v1-6-a91524037783@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1751660161; l=4785;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Gr5Y82FzFOHSFgE4bAXR4LJsBEIiMIFEwMxnG28mI/k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLas4zvU0lCc78yU+Yb9DLjcVMQs5g7e5Va+eCFZgvaWEOcJlCw4GoHKAaftU93fC6280TgpoTe
 TE2iS8TMjrAY=
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoiding methods that only exist on the latter.

Also avoid `Deref<Target=BStr> for CStr` as that impl doesn't exist on
`core::ffi::CStr`.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/error.rs |  2 +-
 rust/kernel/str.rs   | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index ffa8efd2d547..e29a5d76300e 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -188,7 +188,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
             Some(name) => f
                 .debug_tuple(
                     // SAFETY: These strings are ASCII-only.
-                    unsafe { core::str::from_utf8_unchecked(name) },
+                    unsafe { core::str::from_utf8_unchecked(name.to_bytes()) },
                 )
                 .finish(),
         }
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index cbb357fc0111..6c892550c0ba 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -57,11 +57,11 @@ impl fmt::Display for BStr {
     /// # use kernel::{prelude::fmt, b_str, str::{BStr, CString}};
     /// let ascii = b_str!("Hello, BStr!");
     /// let s = CString::try_from_fmt(fmt!("{ascii}"))?;
-    /// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
+    /// assert_eq!(s.to_bytes(), "Hello, BStr!".as_bytes());
     ///
     /// let non_ascii = b_str!("🦀");
     /// let s = CString::try_from_fmt(fmt!("{non_ascii}"))?;
-    /// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
+    /// assert_eq!(s.to_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
@@ -89,11 +89,11 @@ impl fmt::Debug for BStr {
     /// // Embedded double quotes are escaped.
     /// let ascii = b_str!("Hello, \"BStr\"!");
     /// let s = CString::try_from_fmt(fmt!("{ascii:?}"))?;
-    /// assert_eq!(s.as_bytes(), "\"Hello, \\\"BStr\\\"!\"".as_bytes());
+    /// assert_eq!(s.to_bytes(), "\"Hello, \\\"BStr\\\"!\"".as_bytes());
     ///
     /// let non_ascii = b_str!("😺");
     /// let s = CString::try_from_fmt(fmt!("{non_ascii:?}"))?;
-    /// assert_eq!(s.as_bytes(), "\"\\xf0\\x9f\\x98\\xba\"".as_bytes());
+    /// assert_eq!(s.to_bytes(), "\"\\xf0\\x9f\\x98\\xba\"".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
@@ -465,15 +465,15 @@ impl fmt::Display for CStr {
     /// # use kernel::str::CString;
     /// let penguin = c_str!("🐧");
     /// let s = CString::try_from_fmt(fmt!("{penguin}"))?;
-    /// assert_eq!(s.as_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
+    /// assert_eq!(s.to_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
     /// let ascii = c_str!("so \"cool\"");
     /// let s = CString::try_from_fmt(fmt!("{ascii}"))?;
-    /// assert_eq!(s.as_bytes_with_nul(), "so \"cool\"\0".as_bytes());
+    /// assert_eq!(s.to_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        for &c in self.as_bytes() {
+        for &c in self.to_bytes() {
             if (0x20..0x7f).contains(&c) {
                 // Printable character.
                 f.write_char(c as char)?;
@@ -874,11 +874,11 @@ fn write_str(&mut self, s: &str) -> fmt::Result {
 /// use kernel::{str::CString, prelude::fmt};
 ///
 /// let s = CString::try_from_fmt(fmt!("{}{}{}", "abc", 10, 20))?;
-/// assert_eq!(s.as_bytes_with_nul(), "abc1020\0".as_bytes());
+/// assert_eq!(s.to_bytes_with_nul(), "abc1020\0".as_bytes());
 ///
 /// let tmp = "testing";
 /// let s = CString::try_from_fmt(fmt!("{tmp}{}", 123))?;
-/// assert_eq!(s.as_bytes_with_nul(), "testing123\0".as_bytes());
+/// assert_eq!(s.to_bytes_with_nul(), "testing123\0".as_bytes());
 ///
 /// // This fails because it has an embedded `NUL` byte.
 /// let s = CString::try_from_fmt(fmt!("a\0b{}", 123));
@@ -948,7 +948,7 @@ impl<'a> TryFrom<&'a CStr> for CString {
     fn try_from(cstr: &'a CStr) -> Result<CString, AllocError> {
         let mut buf = KVec::new();
 
-        buf.extend_from_slice(cstr.as_bytes_with_nul(), GFP_KERNEL)?;
+        buf.extend_from_slice(cstr.to_bytes_with_nul(), GFP_KERNEL)?;
 
         // INVARIANT: The `CStr` and `CString` types have the same invariants for
         // the string data, and we copied it over without changes.

-- 
2.50.0

