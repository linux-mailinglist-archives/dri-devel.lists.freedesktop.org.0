Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2DAA90A0C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 19:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFE110E97F;
	Wed, 16 Apr 2025 17:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eunswoif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43710E97F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 17:36:26 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6f0ad744811so43077926d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744824985; x=1745429785; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dJDBBJuQk0zO1YYyCYhFBx0Rtrb+rmDlBpZnK9sGyyk=;
 b=eunswoif/Zt0Js93kYLwI+tjWx+SgInPKIwdw3pNFOBcOZ+PuL6ZLZNe6yBYVZn0AE
 QKprwpHGOfrRPwwWw69K9P93gFm5ObUuYU5FVROVl/lg2yvPFZQiIxMVFO/ZkwfGUPOu
 688PcoqnwtsNS/rWKpv2A2gtO6iWtI3Cdc8jv42b7frRlloIF9y93aRgrEcpkGUUHbBA
 4mjiMUYrCdAZMtTgO1kgEQKDB2LWgI/RR11x/ZnI9YfpB9Nn7I6cVqLF6kiOLzrKwDnJ
 OcDAz8pc8vvE1eVfVHPwpV+zqdYm9bdyD3ID/AVffGNJluJOnQ4CQrBBJvVu40Ob5P1T
 XP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744824985; x=1745429785;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJDBBJuQk0zO1YYyCYhFBx0Rtrb+rmDlBpZnK9sGyyk=;
 b=wBVJDJjGWWxQsKeSOktPUKw0cE+dRWtVKQ/ESAeXgYkj9Wnct4GpGqpv+fIo3ZhGf2
 0q40dqisxyxoX4hc1CiDEjZvGCgTNVCxty1ZwniaTmm31Ifu0cUEUtPk8UB9+WUXdhAR
 1+sqiQoJiJ/k/owVud4ecJ6LkfuYwxTOtSdX9EmpFAlGI5dG0klfqqp7oyptHTOoO5dw
 PCOEcb8FoNL3zj/4sJIaPMd+8O0KBDPba5ck0za/NTMzw5bHD7eDXnTcLrDeddf2vnJw
 FgjwXy4RC3nj/GZBDV17YBao9LZzTMLNZsSIStbH9mhBNUaHJa2nMA4m33U1y+RxkuFu
 XUZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCv1N3Y8KrBIYj7ghaMfo7tVdt4bP+hF763tEeEV/bdA+sho9kyR+HGHN6EW32RuHgPmwl1ygwh8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyKsqmgVvbJ6Dpjx+OOP0NuifHCWG8f1y7tD+meB8C8halCgo4
 KhCnOL6HpW1fjU3r+plx4AuYz68b+TxcyUzXLX4BX+8dBbCyh8pE
X-Gm-Gg: ASbGncuXfa2qTdqpw87PXgH6MVR0NbnsE61DnBgsvfCNu/I6j9VA4GOufi8xDKDWYhB
 aWiOL07UpK1yhZxNS/0j/01GpjpGHqcFLh4jGEJC11tDVumvQFNWkrAYnbKuVIxdir5j2HfbhHf
 5KRStk0wQepW2V/Ie8pBz+reFQTobmR2W0n0saScBVl1C/PDzbfyWjbghPdeSAWZ/R/mbZr4RmF
 KwInzR5H1CQ0v/iBgNcOI+vuNjqNFFDxJOO9hjvNqyKN2WRhTO9bTvZdI0v9Fa8g3V4W/Myc3yB
 eJ86qrPv7sUXkoPnIvME/hdZlyfYSoW+/BzKC0xVRo118Js2NKVSDN/RLcY+S88+LjlTPe1Hakt
 dFZYFZ29b+OvS/iSpCAJrmdluKBYgRMmI/s23zF/R1FzZ
X-Google-Smtp-Source: AGHT+IGvStqMejrtJadrdvE+zWRyHrQ23Hn7yDYS1rshWoBmONfgRKt3F6tOokW8CHrD7/YmbgoA2w==
X-Received: by 2002:a05:6214:1cce:b0:6e4:4288:61a3 with SMTP id
 6a1803df08f44-6f2b2f30abfmr36229256d6.18.1744824985307; 
 Wed, 16 Apr 2025 10:36:25 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:a61d]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f0dea07c50sm118289886d6.77.2025.04.16.10.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 10:36:24 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:36:06 -0400
Subject: [PATCH v9 2/6] rust: enable `clippy::ptr_cast_constness` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-ptr-as-ptr-v9-2-18ec29b1b1f3@gmail.com>
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
In-Reply-To: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

In Rust 1.72.0, Clippy introduced the `ptr_cast_constness` lint [1]:

> Though `as` casts between raw pointers are not terrible,
> `pointer::cast_mut` and `pointer::cast_const` are safer because they
> cannot accidentally cast the pointer to another type.

There are only 2 affected sites:
- `*mut T as *const U as *mut U` becomes `(*mut T).cast()`
- `&self as *const Self as *mut Self` becomes
  `core::ptr::from_ref(self).cast_mut()`.

Apply these changes and enable the lint -- no functional change
intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cast_constness [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                        | 1 +
 rust/kernel/block/mq/request.rs | 4 ++--
 rust/kernel/dma.rs              | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5d2931344490..7b85b2a8d371 100644
--- a/Makefile
+++ b/Makefile
@@ -481,6 +481,7 @@ export rust_common_flags := --edition=2021 \
 			    -Aclippy::needless_lifetimes \
 			    -Wclippy::no_mangle_with_rust_abi \
 			    -Wclippy::ptr_as_ptr \
+			    -Wclippy::ptr_cast_constness \
 			    -Wclippy::undocumented_unsafe_blocks \
 			    -Wclippy::unnecessary_safety_comment \
 			    -Wclippy::unnecessary_safety_doc \
diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index 4a5b7ec914ef..af5c9ac94f36 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -69,7 +69,7 @@ pub(crate) unsafe fn aref_from_raw(ptr: *mut bindings::request) -> ARef<Self> {
         // INVARIANT: By the safety requirements of this function, invariants are upheld.
         // SAFETY: By the safety requirement of this function, we own a
         // reference count that we can pass to `ARef`.
-        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr as *const Self as *mut Self)) }
+        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr.cast())) }
     }
 
     /// Notify the block layer that a request is going to be processed now.
@@ -155,7 +155,7 @@ pub(crate) fn wrapper_ref(&self) -> &RequestDataWrapper {
         // the private data associated with this request is initialized and
         // valid. The existence of `&self` guarantees that the private data is
         // valid as a shared reference.
-        unsafe { Self::wrapper_ptr(self as *const Self as *mut Self).as_ref() }
+        unsafe { Self::wrapper_ptr(core::ptr::from_ref(self).cast_mut()).as_ref() }
     }
 }
 
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index f395d1a6fe48..43ecf3c2e860 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -186,7 +186,7 @@ pub fn alloc_attrs(
             dev: dev.into(),
             dma_handle,
             count,
-            cpu_addr: ret.cast(),
+            cpu_addr: ret.cast::<T>(),
             dma_attrs,
         })
     }

-- 
2.49.0

