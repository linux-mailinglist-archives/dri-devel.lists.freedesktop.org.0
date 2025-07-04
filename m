Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033B0AF9B8D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 22:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBB510EA75;
	Fri,  4 Jul 2025 20:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NVEbUr5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DDF10EA72;
 Fri,  4 Jul 2025 20:16:07 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4a7a8c2b7b9so17462071cf.1; 
 Fri, 04 Jul 2025 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751660167; x=1752264967; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IjAX5By1woBTkVbpv4Ax05fTUisbOPE+2UGRU9+yRbU=;
 b=NVEbUr5ePDUZQ1IwB1I3F/Rb+giTob1HIkZukiSL4KTV5JkXJWC8/Ern64e5Fm8Gc0
 qgUOMgKt5rQvPOoOtF4bhH3+PgMVE6Fix38rWJGDG0ZpDlF7Jl/fz9PgiMO+xNGxn/7X
 8McGHa1WNN2iwwclBobCyH36j/ngmHHFuFbnGNvMz3ybUBKr/8+GNaKzKghKKS1FvZ6A
 no5EpeV7au8O2sAmZGn36hJfUXosykUji72PYamUMHsI1JapffbSMdM0gYvX0a9tteVL
 RqbGlwEkBNyolSa5p0bRA6FzGF5pNt18e+CYf0+xieSkD3wZVPLFAz9ho7o7Gu6CDNB/
 h+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751660167; x=1752264967;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IjAX5By1woBTkVbpv4Ax05fTUisbOPE+2UGRU9+yRbU=;
 b=iqty7QNhtd4qtZbHAI5e2aJMRKzNTmoRkPnKnGY6O2xhyXgMu0Z3LcmLWc4536VncA
 R602dpR9pkgHcubqATiwpHnU22+7T5Vwt9N8vxJAct5hQTIYcWkJhuDfESexLdxXcEHG
 9MY0jvkhYj8L26BXWr41A1NtJ0UKDk0IBrta6/cm2x3uhSBw1FsRisg1IcfRgjEBcYAt
 UAs/X34KuEcL0KuqfXo9mAh9cl6A4YKzyc7CZTWkQk539SQMUmR33SMKsDoKl2jiUXXr
 LvKv2NIFQzNNG9DWGQyYYYEYy1QysNO1ikhZUBo47ISLCkXLPatv2C74Uhzn82q9Luks
 y9uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWcCc3+kIOTT6FaY7I+PHenH9iIg/YJ59zBkq3eFnapx1xDzQoscvkJL9bVFgKGozRr5KoiS1Yes4=@lists.freedesktop.org,
 AJvYcCX3zSgbqk66mqk3zXEfaDVeNBybqZOszvDy3K9N/7NQDIG91FGk4d48JVIW0n3+8oZ1w/ehlB2h0Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfTciX/TOkpQDyccVF+BQL2c1b0uSDaauvS2xYNa4HjDKBHfDY
 BWWFtpG7bvpWQmYIEZxFM556bOBQ7PHutaxKI+KyLohGUkTRwSMrfQJ9ZJT6Imsib/n7YQ==
X-Gm-Gg: ASbGncu3Hk3/Eu4pFoJCnhgejB7229nnrEd92Mx++i64IzoETdLfb9LgVpeL6p6Yubj
 N5C7SH2BeXB9RPVuR7FhXckVJ69S/pmoUhq0pB9HDKWCv/v8wP9WseIyPQggBBlmQzubMD7didM
 8XvlwMWGC3SQJyM5NKs+UV4QAr34pHNCLqemvPEMcz4tV6KY+CK4AMpDIhc32szfYB9F7oN+nWs
 xJfiF3e+EpkflqH1OVPs8oVypl1ihcUD/L7ILUrhZJcdXUkoeli3/9S0/yNroy6m6JVkvQDyDql
 52Hx9a3QgmCnmDnrx76xjSh3BfT+HrToL5OHzYHm2ITZmeznMlrfCYf5/Bp9ODsBrB5Jn15qMHE
 bfFmrFH8=
X-Google-Smtp-Source: AGHT+IHoJuyrMg+1Oet7D/5z8M7VsWfC8gsB87eCJncM3DAyTr2cIYU7OHvXVugATk7u3p3qiIn2YQ==
X-Received: by 2002:a05:622a:316:b0:4a4:4063:94d1 with SMTP id
 d75a77b69052e-4a9985e0c0cmr42987461cf.8.1751660166573; 
 Fri, 04 Jul 2025 13:16:06 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa
 ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e5221sm19772941cf.2.2025.07.04.13.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 13:16:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 16:14:54 -0400
Subject: [PATCH 3/6] rust: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-core-cstr-prepare-v1-3-a91524037783@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1751660160; l=3354;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=pDl2EDPfxPEYVWR9FNKoe/jjP+2a7nwmEQia5/vDvaQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCBuyGbM9Ex3z6w+I8XsfYWnnt5RfWTJc8W/D+LryP6sut6ti1h3WTUJlGdh3zPO073i/ELXAnX
 ilrfpP+tUvgE=
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

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/error.rs            | 6 +++---
 rust/kernel/print.rs            | 6 +++---
 rust/kernel/str.rs              | 2 +-
 samples/rust/rust_print_main.rs | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 6277af1c1baa..ffa8efd2d547 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -6,10 +6,10 @@
 
 use crate::{
     alloc::{layout::LayoutError, AllocError},
+    fmt,
     str::CStr,
 };
 
-use core::fmt;
 use core::num::NonZeroI32;
 use core::num::TryFromIntError;
 use core::str::Utf8Error;
@@ -219,8 +219,8 @@ fn from(_: LayoutError) -> Error {
     }
 }
 
-impl From<core::fmt::Error> for Error {
-    fn from(_: core::fmt::Error) -> Error {
+impl From<fmt::Error> for Error {
+    fn from(_: fmt::Error) -> Error {
         code::EINVAL
     }
 }
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index ecdcee43e5a5..2d743d78d220 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -8,10 +8,10 @@
 
 use crate::{
     ffi::{c_char, c_void},
+    fmt,
     prelude::*,
     str::RawFormatter,
 };
-use core::fmt;
 
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]
@@ -149,7 +149,7 @@ macro_rules! print_macro (
         // takes borrows on the arguments, but does not extend the scope of temporaries.
         // Therefore, a `match` expression is used to keep them around, since
         // the scrutinee is kept until the end of the `match`.
-        match format_args!($($arg)+) {
+        match $crate::prelude::fmt!($($arg)+) {
             // SAFETY: This hidden macro should only be called by the documented
             // printing macros which ensure the format string is one of the fixed
             // ones. All `__LOG_PREFIX`s are null-terminated as they are generated
@@ -168,7 +168,7 @@ macro_rules! print_macro (
     // The `CONT` case.
     ($format_string:path, true, $($arg:tt)+) => (
         $crate::print::call_printk_cont(
-            format_args!($($arg)+),
+            $crate::prelude::fmt!($($arg)+),
         );
     );
 );
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 10399fb7af45..48d9a518db96 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,7 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
-use core::fmt::{self, Write};
+use crate::fmt::{self, Write};
 use core::ops::{self, Deref, DerefMut, Index};
 
 use crate::prelude::*;
diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 8ea95e8c2f36..4095c72afeab 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -40,7 +40,7 @@ fn arc_print() -> Result {
         // behaviour, contract or protocol on both `i32` and `&str` into a single `Arc` of
         // type `Arc<dyn Display>`.
 
-        use core::fmt::Display;
+        use kernel::fmt::Display;
         fn arc_dyn_print(arc: &Arc<dyn Display>) {
             pr_info!("Arc<dyn Display> says {arc}");
         }

-- 
2.50.0

