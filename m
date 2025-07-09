Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D09AFF246
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BB210E849;
	Wed,  9 Jul 2025 20:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FmOT/QzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CB710E846;
 Wed,  9 Jul 2025 20:00:23 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4a774209cf0so3873881cf.0; 
 Wed, 09 Jul 2025 13:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091223; x=1752696023; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rqqQEFMAMWFSxOEt2f4fSJqPiVhSkTuCXGB3ZJgmOgc=;
 b=FmOT/QzCa/Y9kK1jXEPAFcTt6T214CoO7WEEuQtKXiEuhLLtbksteyGVHboYcpTb1N
 GsjjQCQszDp95+6YfsvuRKczjIuwH9eUnKeGS2Pd/fj1+F3e+T6ZoEDtWDFqfJK0GPDS
 llGDxQEmiX7oFRTq/jBLuPdKunDZvdSZnerNIudZAGZeQLrFXpykwauUHHT/TbRyOJpD
 joxRxBcwcehNcPuLI4K5ApOu9zPblVT3fV14EgJ4gkW+GBt2WcYxJ/1/uz1xqXY6Y607
 nlt7eh/k/LFILima9r9Mct/Ix2wTk0jyvaagUzgjvTOLYs5OTTlM5mOfmCSEEb0S93Hy
 /b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091223; x=1752696023;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqqQEFMAMWFSxOEt2f4fSJqPiVhSkTuCXGB3ZJgmOgc=;
 b=Vnca1BBBiZlJ+5FHmLXe88PWvR94beqIIqs0N7kJ6IN9/NQgKtWt4HjM6MMpz7zK1Q
 atDyKs7fwDQI03NP4WBWyLd+ZbdPlzr1bYKyzjzS8kY+A1dle5be3CYkvTQ0S6UKHKQG
 6msDVbJYes7JI8LonBSpo6lo73W3v4aHqzCOIiLDU0WZA1BBHVEC8WvaRJF6FgaIpszN
 tb+gXsdDTmIz9zTV64XuUmn0y8aLLJugYhEBsvkuPCJnu22ouCksvnSp1Te1SWTB3opq
 kUfZoMt3bnhUfn7FDUwzMULSRxzXUoKQrSXrVjzgBZHfMwcZG2G3NREDrCbc3DMZMR63
 6aLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ/MRuBNixefmFAsNmYpo3UwmX3Sir3Ynr4iDGLg0cd6UV2UtHw2C5EMqzZVhrZ3F4tmroCSFOb9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLuKkX5TtJxgVjKJJ+xP0NHNi9NkANy/E/9loceZGjAPPm3y9R
 v5g0GNOZa1q6u2hrV05+lOXuh+utnD1A1Z2Bq//Xlg5MqDu3JodYRWAO
X-Gm-Gg: ASbGnctK8eXGzomZAh3KWNwM/s4Ef5EiVZRzRGEloMyqwVGPdcYfeUFgm5olrPnMLFD
 6kGGm78QoO2uiZc+ZJX9ccfFG5zxuiOuEHZX8eeqwEbBV61PAPxzdj8q1Q8/03cOdG3eYX6N1rz
 XXoQ1xLqkh3R8j54xxyBDbW/r3AkRdDiVDxLc6MnUvPjxPjwIXp6bgaRU+XNIzXxer6LfCY0sdT
 uYbVSqx2jlBPL+DHhZ0bzsAVIBV9LM0UZbj1uZ3RGsyjX7GFbq+aOIvf/XtmnvovPiDT/Qw2DFq
 KT03WgodvTLOh5CPNGH8O86c6lFWbB6qrKb7v9LQqpBmnzZkezksB2XJatOg1dLPKl4h3TN9uwR
 0kxEMwt4pcEsoJ2K8VF6vWlHJmXNSpimbBcqcodjPVQcRQJbp9UJB4vjx7g==
X-Google-Smtp-Source: AGHT+IEzgV6Gl/vLQY5H3tdFN2IVXBuNJVlJUU89GOFFkkJ8I9myDKhYc9XCB+95abmxj10FkjjiGA==
X-Received: by 2002:ac8:6f14:0:b0:476:95dd:520e with SMTP id
 d75a77b69052e-4a9dec56971mr68542311cf.16.1752091222853; 
 Wed, 09 Jul 2025 13:00:22 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:22 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 16:00:07 -0400
Subject: [PATCH 8/9] rust: seq_file: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-8-64308e7203fc@gmail.com>
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091204; l=1622;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=/btWUP0n0X4VrKOj7C0ipr6mRLMnevTc6PP+sDGYrAE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QN8Nl+PlucSORLf04de7DEfBpUFw+wQQzlTCx3giK3H5W3rjldHLVCXuta8nfIwTsuOJHC5yW7g
 GKmguS/OQOAc=
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

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/seq_file.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 8f199b1a3bb1..59fbfc2473f8 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_file.h)
 
-use crate::{bindings, c_str, types::NotThreadSafe, types::Opaque};
+use crate::{bindings, c_str, fmt, types::NotThreadSafe, types::Opaque};
 
 /// A utility for generating the contents of a seq file.
 #[repr(transparent)]
@@ -31,7 +31,7 @@ pub unsafe fn from_raw<'a>(ptr: *mut bindings::seq_file) -> &'a SeqFile {
 
     /// Used by the [`seq_print`] macro.
     #[inline]
-    pub fn call_printf(&self, args: core::fmt::Arguments<'_>) {
+    pub fn call_printf(&self, args: fmt::Arguments<'_>) {
         // SAFETY: Passing a void pointer to `Arguments` is valid for `%pA`.
         unsafe {
             bindings::seq_printf(
@@ -47,7 +47,7 @@ pub fn call_printf(&self, args: core::fmt::Arguments<'_>) {
 #[macro_export]
 macro_rules! seq_print {
     ($m:expr, $($arg:tt)+) => (
-        $m.call_printf(format_args!($($arg)+))
+        $m.call_printf($crate::prelude::fmt!($($arg)+))
     );
 }
 pub use seq_print;

-- 
2.50.0

