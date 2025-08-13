Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09057B24DA8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC6310E756;
	Wed, 13 Aug 2025 15:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cCTr0Bbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B7510E756;
 Wed, 13 Aug 2025 15:40:08 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7de159778d4so701558185a.1; 
 Wed, 13 Aug 2025 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099608; x=1755704408; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dvH2/B2zmQ0D9vQHtz4nqDYlqgBbI+OptHpY/wLbPQQ=;
 b=cCTr0Bbzw0oWXcXiJq+XSgY+6Iy4JY8Y0tv6SjsN6QgvZkPIyjJtH9SGzqBxkbsSD4
 6go+DKxbN4z+JvpuwA2QxMTvbYYWQqWlsi7GDV/OsLcGEi8ANv5VQ7udMUVzzRJoJQxn
 DG9bl4nZcW6llKRlOWUtSSB1kFJd+V9qEa49q06O/INNoYd0r1uSFP+1m7bYMpEfQKYY
 2HIWO2rciISz6cgDsfqBuCm3jsQ6pSuRoCIL5p9JSgH/EdGBwqCZ7qLzrsD+afI8LbyK
 jrKW/vjIChuAmGSDGxyTT3PQDj6lNfygW0dB/JA4fv2eJXEiq2Pj2RdmZH2099Yn2ADS
 q6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099608; x=1755704408;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dvH2/B2zmQ0D9vQHtz4nqDYlqgBbI+OptHpY/wLbPQQ=;
 b=A7QOgd8WkHC+sEquCI0dKHQMwWILRXXQMqG5X6+wTD35F37pD3uHMK4N4AkWMlzCk5
 jzc390sdugELkKEh+uH8RL7EGBKwYv4iEMDDbNVbR47ZRPZbJA+7H7GEKwUb4WekdGdS
 Ptdy3LX0viRt4JwdQ2L20bgZUVjcxvT8rlT1Bb3VxXrjHb5wGDB3d1IrK6sg7J6kg0Mb
 azun+anFqnxPJIQ0eTNX/oFGDolWTsKiuggzJSTFGViXzoiV2LytKe6hPMdNwtiGTcUZ
 kXCY7sFdn4wQLrqxQav/wwFKs9LREiQEtFY+IFTjE1008HVL/G6zqxFQUelHDmPI7bJb
 R9ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8804ZgfNDtohUBQxRq/Hurlfz8AONyqnKP1YnPtmh3V1Ifv0PTWNGhh1yNJTFhb58dGDmhR1UxEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV/upB+pTqjLq+8OHZ5xHyefK5jNUxnukVAuhn3xS2DJRrgBM0
 cFl+nheLpbsRmE82ESm0XfdA09a8dpibccD15eIhBtufjeI/gj8h7LQp
X-Gm-Gg: ASbGncuSXi1ehx9dK6tgndxEmvNpATcte8jrE1I7uihYvPBXG3OXkX3FSoFPG3zcZ4g
 59J06wFcZwhGu4xP/XGiD4h5CENei2nn1u7YmGG3UHJaTGyMsA48SdumzeA1DWzbX/CD+sdM608
 7ys0c+keBvmAxco2I81TficbzLXsyuDzxGWPUUkyLWplWOMwyLOCTwXtbB06WRFkcyFRu3mQ+wI
 Tg3edvs6MgM07UvMa6MCzIzp0QBEQxvj/hDA77QbFX4tCgJAVt6yDqPjhV/+B6e15/w7EL3E0En
 RDvnfkix8SUrspn+xlM5yDeU7RiTKkaqrRO6GMEQzrutrJEIqwT7hBwWE+xu+YiXOn5kbpyghKz
 iOsTX71mpKJE0QoJRK6ZqOCXWqA48eU8JCNpUtbMvQQ/z08mt9zfG3o9aFtc0NuPq/KWXD/PQuE
 6VEB6Y9FbUFZKrppVryIl2F0V1JDWfwUf/c/aZYCNh6/pM
X-Google-Smtp-Source: AGHT+IFQHqZ42a21nPnAfBqnqhi3SvB26bjyNrRjDQP3uTPdTZxNupm9Q0eYNC7DU+LaCe06RKPY/w==
X-Received: by 2002:a05:620a:608b:b0:7e0:bd35:fd23 with SMTP id
 af79cd13be357-7e8652f8d3bmr366589685a.46.1755099607447; 
 Wed, 13 Aug 2025 08:40:07 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:40:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:39:52 -0400
Subject: [PATCH v3 7/9] rust: seq_file: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-7-a15eca059c51@gmail.com>
References: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
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
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099591; l=1669;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=4r4hGm+5eFeJ1YD1XNe79Rof0MXa9XpmAsMvwuuTVcY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFJ0qGmLAvVhf4afCxnQAsgT2wKvjrpnkv9dk50qzD6Cg9FtpHbX+bHPMydLtqpXf3gEtgUpRyA
 oBpEXmc5iSAQ=
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
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
2.50.1

