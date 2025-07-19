Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B80EB0B247
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDFB10E35F;
	Sat, 19 Jul 2025 22:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JwPhXvhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF31710E346;
 Sat, 19 Jul 2025 22:42:18 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7dd8773f9d9so310925685a.2; 
 Sat, 19 Jul 2025 15:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964938; x=1753569738; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1rs1DGyghn6m5F7YPyJpVWwpTqkEtp8qoCALsZqeRz8=;
 b=JwPhXvhi3PSRP3hfNECy+yp8RQg0CJeRASLsylngxi89c46IJtw96ELDyEPaujtYZI
 ufNMIBZxSWiCc+Bao+DPq0mBnzihS46IlSu+gYKelYMkeMiz63qjcnWahiwZdXtrWY9K
 znVFQYASDarbIc9kGHsAq4szrprpMpO7ZnVDe47NsP6m/Hu0Eip13wIv86w0qCIqGIQe
 Ub1oqDPbK2VUd4S9Slp6WCV7IISbG0kt8SHXqA39qmxqIDNrZRr3P94QQ/EiVR8GepyD
 MzW+C5EnZetniTnWdu95TjI1pz17X3JuYS9lL/aNWZgCIxKi+FG16RxDeLpOGtKhWiVL
 e1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964938; x=1753569738;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rs1DGyghn6m5F7YPyJpVWwpTqkEtp8qoCALsZqeRz8=;
 b=CQU+RXfE0sYdfti2AeU90fk0auSrdlHvzJ2WHiw86l1CvUo36UgMQxFornWfdVUv1I
 omQl/AYy0p94UblFkfdkZyp1t3ea06mrqTq/iE4LSo/iTCpmLEAb7rJlf5BxCab1K63q
 Z5uPskdOkIKaTTsDKePejwiFoa4xSdFROupEqrlvgDsxB8KI9bfio35H+Yvl7GMzHSgy
 zI+2JmxS34MYIQvjXvO5R2tbn2GgqRrE/f2FlZOn1wAeA6PbYUX+2rL7vjyt8/8xSAkT
 jrcWBH6WvdkrSx9JD6uhqGJYvbd1RsyNC/dHCDKVx6iqEVIKp2NX5EjoFmXImef5CAU7
 Q/kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHQUM0cDDBix61cAay6dftFifkTmv+X7NF8HBZffhxF1FI1kdMMfjBrDANq2I2WD61kLM8mRUSYO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz69ZKV1jOjARi9BlOrRq4YNwrHcqlVu1V6idtCD5xn6CP7qFey
 xY7yqyoUHQwR8Uv2MxVfwfiEJ3jE75dy+9aOziOBESha9/Vhk6S+hB2E
X-Gm-Gg: ASbGnctoeX4ZrmMGbR/R9Mff+KP9OaFAT0GPEdTMbExtz7HeTuhdjTknQJ36UzBhvZc
 IjlwJq1p2go9TuMtRI0Nn1gJZu6R9NRM7lBUAsm3afroYWGLU93CdsVRAyGq+WnNNuNO7L9a1BT
 CGmGVNjNtwD5OxGj0TG01Wolt5sqnpevJmEJxeHx/4zEcK5LdX1ir6vUGkd9xYRfW8itEjONl+o
 rmoamG8XNT+qJQKmgtUCEsXmdBSQfIfWrFdmYh70OUtDCMFOqD2eWDM0c2dkaDzcK3dWuIMRJQa
 KVmM3etWlm4aLRgHczAX5exvPW7N6XG7j2BOQT9asnFxrlldShrLTJbG1a6Q+95VyTLx5Zi12h6
 j2RDYrXOLaEWdv1KDkTylZYBZPHUp5kx10eaKUX4o3AXHvvMAjOdmKCI4HQIF/W4CbanQKGfGfj
 2tC3ZzmXbsuaqTmafTbmwzF9u0QRiqOW6LL/Y2CLs=
X-Google-Smtp-Source: AGHT+IFtOTZ/PrQwepu0hwdAQftEUkuWxYVHS9B8D5JpfvXd++3lzu/pWaap3iuGs4DIwGCQ04QMyQ==
X-Received: by 2002:a05:620a:7203:b0:7e3:4601:9721 with SMTP id
 af79cd13be357-7e34601a170mr1752546885a.44.1752964937883; 
 Sat, 19 Jul 2025 15:42:17 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c75cf5sm251550785a.84.2025.07.19.15.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:17 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:41:55 -0400
Subject: [PATCH v2 6/8] rust: kunit: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-6-1ab5ba189c6e@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
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
 Uladzislau Rezki <urezki@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964924; l=2517;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=jyqFD6nM8ro9Ks9YCIIHVd34qdVyENgV6xpP2iUg/jQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNOn8Tovv2dHgoqC1i0lAp321l6XEurS5uFMegrG079Th4U9L3wXbn9B8imJH6UktgvZZeU5c9O
 yz00xKgktJQE=
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/kunit.rs        | 8 ++++----
 scripts/rustdoc_test_gen.rs | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 099a61bbb8f4..42498cb93f33 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -6,8 +6,8 @@
 //!
 //! Reference: <https://docs.kernel.org/dev-tools/kunit/index.html>
 
+use crate::fmt;
 use crate::prelude::*;
-use core::fmt;
 
 #[cfg(CONFIG_PRINTK)]
 use crate::c_str;
@@ -74,14 +74,14 @@ macro_rules! kunit_assert {
                 // mistake (it is hidden to prevent that).
                 //
                 // This mimics KUnit's failed assertion format.
-                $crate::kunit::err(format_args!(
+                $crate::kunit::err($crate::prelude::fmt!(
                     "    # {}: ASSERTION FAILED at {FILE}:{LINE}\n",
                     $name
                 ));
-                $crate::kunit::err(format_args!(
+                $crate::kunit::err($crate::prelude::fmt!(
                     "    Expected {CONDITION} to be true, but is false\n"
                 ));
-                $crate::kunit::err(format_args!(
+                $crate::kunit::err($crate::prelude::fmt!(
                     "    Failure not reported to KUnit since this is a non-KUnit task\n"
                 ));
                 break 'out;
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index 1ca253594d38..507d36875196 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -201,7 +201,7 @@ macro_rules! assert_eq {{
     // This follows the syntax for declaring test metadata in the proposed KTAP v2 spec, which may
     // be used for the proposed KUnit test attributes API. Thus hopefully this will make migration
     // easier later on.
-    ::kernel::kunit::info(format_args!("    # {kunit_name}.location: {real_path}:{line}\n"));
+    ::kernel::kunit::info(fmt!("    # {kunit_name}.location: {real_path}:{line}\n"));
 
     /// The anchor where the test code body starts.
     #[allow(unused)]

-- 
2.50.1

