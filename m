Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC4DB24DA9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284BB10E753;
	Wed, 13 Aug 2025 15:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OvlMNaTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6A310E74F;
 Wed, 13 Aug 2025 15:40:02 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7e7f940a386so402781585a.3; 
 Wed, 13 Aug 2025 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099602; x=1755704402; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MRfZ2w/4F4Ea9f92rkBZAFGpsLi9iHZG21wugvWYEpw=;
 b=OvlMNaTWOK35YGI7AdtW/g57z8rjMSZOxx15+WPn5Nahi5oz4OaCc5dgiKUi/gfKPV
 81eeIqpLCcXYND6H4bOiCOr6hZli7rIv0S2g20tLPHwzRwkEwhRO5bSBayBKw0rz8jMU
 dUuXtnTSdGIdlPv5kII+AjGfgugrp15iNag0ztq7mKvHQhM8HlRgHhGPUcSWo087mG69
 WSXeHI3wwJmjeUETqZ9Ax8+P77U4MXzWIyN8ZLrjuzZxUY4hT5VkxP1wahAZCpTvMLPh
 AFI0dMKd4t+IG84d88EvhA3dLeBupuIJBe+6zGAsmm2x50EfamIkET/D9LwxGk80SKVF
 QwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099602; x=1755704402;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MRfZ2w/4F4Ea9f92rkBZAFGpsLi9iHZG21wugvWYEpw=;
 b=pQOGj1omo17MJ2HpOgaeWj8ZUPJN1NNL7kXmn1A2Ql60nt1Ame1v1D0wiyNmGLAtC1
 rIOHX5191dhyYiExMPy0Bm2ud+DqZDlyBghKA3SRuHZLyfJ7VXSOpRUgo/LvwtXTgTTV
 VLKiWJnQ4nDEDXXAiXmsX3RTGYa9LIXx+B6clHND8A4ma2bBOpSiHvJmFQCiNRIUOGBW
 niMVM6RwWorozJqvN7yhBYK9c68jRWNVG4/hfGpdW36my2pY62drvlDYPnVKCFEwTpo8
 ytOAkZSRVrr3RUQs+w1n90dLFvLDueAWaUtguCFNK2pjVSx7p0r7izy+T2l0Sug+vSeM
 JSJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVI8ZtufsYDeZJ1y/ay02tSvv7H+Fd2Jex8KaE+JksGh5TuLXSnPI7R18vpMlk1NYgSjKnI/m48ws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzBQKPOrgQqizcq8GalX8fkDrnmsJZpcAKptoLuZAy4pilCASk
 XvmhxLyinGUwklv6xQpkiQxuoL33JhsdjGm1zWqDS+vsuuGbJC0+jCCp
X-Gm-Gg: ASbGncuTTjH/7PMgaAihM7yZ+W36t3SWO3+dyNzX6/R2uAJT5nI62ZlZfPL4nDCfU6X
 v6AjqBJkjrIECSPybXVZ4yAFI6zrqo+MucbM7eqimNbh7VWyYrt53DxI57EJUdfSubOZN6VjLOg
 Dblnc2gNBhFFXnftboIAdcxVpxgR9tVH8EOpuSfZJNFNpCXX8y9RN5eY8a2d6u+jbw6/4XGzvhD
 boG5PYVjfxbPea2F+0NDFCWoOuRypWQw7R/MTM4Ion8j+4s21FgDOPb5lNoK0W6En9IobZIC0+K
 /9IOmjYcWdIGh3h7aFBf58LcPZncdCsXruqAX0YWzQZI55mzVAEJTVRriZzCbibGuvVZsxEJM6x
 6eUPvT1m6Xit0kvE6nrAQzEahbxWc08s+mMj+/CHX6cX6CECqLhPVYRYRPwqKckDK+9OOAUxMT6
 bKqCEQHUzqX4d5z/i0/s6FC2N5KI0d0nB1lKVhXCRm0IN7
X-Google-Smtp-Source: AGHT+IHc3zRAl0lkk0iybOGSsFCbiPVspNuo1MJksI72/kUVwI0EXzlGYnouroXpZFiNdgcqWm0lKw==
X-Received: by 2002:a05:620a:4001:b0:7e8:3a70:795c with SMTP id
 af79cd13be357-7e8653782c2mr475868385a.65.1755099601681; 
 Wed, 13 Aug 2025 08:40:01 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:40:01 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:39:49 -0400
Subject: [PATCH v3 4/9] rust: device: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-4-a15eca059c51@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099590; l=1289;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=l5FpEcw0uQYnPs0RLtDbZfxzw/E05BYYCtB2nhqouWU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QC5C2cxbS+6RI0o5ytJmwUqcqJ2t/hbVRgJ5waZwP6iVwmKa7NnILxyeTSEYvFBt+Rv1Lv2ql5F
 nY/Gb6itHSwo=
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
 rust/kernel/device.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index b8613289de8e..65306e77d97d 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -5,10 +5,10 @@
 //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
 
 use crate::{
-    bindings,
+    bindings, fmt,
     types::{ARef, ForeignOwnable, Opaque},
 };
-use core::{fmt, marker::PhantomData, ptr};
+use core::{marker::PhantomData, ptr};
 
 #[cfg(CONFIG_PRINTK)]
 use crate::c_str;
@@ -435,7 +435,7 @@ macro_rules! impl_device_context_into_aref {
 macro_rules! dev_printk {
     ($method:ident, $dev:expr, $($f:tt)*) => {
         {
-            ($dev).$method(::core::format_args!($($f)*));
+            ($dev).$method($crate::prelude::fmt!($($f)*));
         }
     }
 }

-- 
2.50.1

