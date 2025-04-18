Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8511DA939BC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B6110EBB4;
	Fri, 18 Apr 2025 15:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BRbtGdo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4942F10EBB4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:37:26 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6ecfc7fb2aaso18576676d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744990646; x=1745595446; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HHOBuf5+1RlKV8qW8BdiM8IPEaFLBDeG4ByjToWDID0=;
 b=BRbtGdo8qjPFkxB8yI4XyhUOMQ1A0Lw0xYk7rq/ma3ArZm4aJjduOZI/ugjA0+EN7/
 iWRwtxkrujHtmh+JXdgraBJ6Tv45P8gmlmIULzUv7IiAouO5LbgJnLPklNiNC03OCMCs
 AYcKJV8jyOdh8AJ6y+y0Fkts+bVVwe3aHVwwJF6If9bi1hKfKPv6ehgiBWoWsLJ1c7Sk
 /JRFM5C3KJ/dGDijQmo+r28uv5SDzYLyv9MjYGfXCA3FONIPH4f15ylIyAKhxJi1Ish0
 PSsCxjvCmVgHhFxqZbs+Vmyxv+5/0g6oFkqJ9PDFBAmk9ZWgMYQ+q4xGt5y5GMbc46Op
 IuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744990646; x=1745595446;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHOBuf5+1RlKV8qW8BdiM8IPEaFLBDeG4ByjToWDID0=;
 b=wekOzFsI9RdrqUBK3kMpWNlpjm1SLtxJRi6DUif3chmZtN1IfEaNAnweMY03kB9oUr
 9fQAy7pETsHJuoe1U2es/9TnmDbRKSGekOyLZughtP59oTsObudUWZpEsUAr7ePcSjjx
 5xjGgrKg9AgmricexMZ74t32F9RS25g6YtZp9/aAl7ugaGhg2kSfkBynBptEW0RMtO2t
 iVRJ8TCZpAHF4Mm3cLk+3V/L/CNHDtjBx+0I//7eVECtkPNPEXB/HahrwXUW4C8Z2biQ
 v2dI1eaVV9iqHkp2NzKIxqO7c2KfN4VyjgUlrrShTF9XmGAve8OOtf7MOKYzvTro8kTN
 xIBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBF9OC/VMAZejTuCqVP6hNP0ME5QLlcvdDwM7sBCzBkDr3s3Pl80fSQH6Nf1Guk/U4qLIkhXQ8tpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhzG6IHWlaZRLagLmz94uUjWw77U8tkvTNor6bTKY+x5LL6QSd
 NcMeotXxhhswPqmAmll/2sUdYjc7KKAncGffPFeCuceOfMj9uGTQ
X-Gm-Gg: ASbGncvzPfS0kSGr7h0742BCM8pY68kcTjT5mhd1c+gLkiDIR1YdV5IYTrK05ckojxW
 RLbpFJp5BwVK6wU7Nf+4b81G6NA8f6tgJA+LyLT3TaabYTF76clch9wKE4SDtouOfcHdKZcTki3
 oCGt+wsX+rM/3Qqkr2qLqik4a4D4PASjZJI6H6sTT4jaFEz9dSEjFy9Wz2Yzw7SUUVeVWnafdn3
 czYBMT8u5U0iGYfjR3u+rOGnjDgENdGvggHHOqdE2oafkOpk1073PFLPfV4lU0LrUXI0Xic4OJ5
 QvYPyodROKf/Z5o33T3wxNi5ZEIzZiBL2JmpO+AAZ4OPIPsyPh+uRtKvu80cI89Eyi9twA==
X-Google-Smtp-Source: AGHT+IFpM+FmDpfllyOh39nFKgv1UGGuyr6Q/zuWGh7oi21np0KLAAHZASvlsSqGRLvHaeYB4G7G3w==
X-Received: by 2002:a05:6214:5097:b0:6d8:a1fe:7293 with SMTP id
 6a1803df08f44-6f2c46be785mr51606046d6.42.1744990645592; 
 Fri, 18 Apr 2025 08:37:25 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:7988:e5e5:1f4c:be78])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2c21d9bsm11623096d6.96.2025.04.18.08.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 08:37:25 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 18 Apr 2025 11:37:17 -0400
Subject: [PATCH v10 1/6] rust: enable `clippy::ptr_as_ptr` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-ptr-as-ptr-v10-1-3d63d27907aa@gmail.com>
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
In-Reply-To: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
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

In Rust 1.51.0, Clippy introduced the `ptr_as_ptr` lint [1]:

> Though `as` casts between raw pointers are not terrible,
> `pointer::cast` is safer because it cannot accidentally change the
> pointer's mutability, nor cast the pointer to other types like `usize`.

There are a few classes of changes required:
- Modules generated by bindgen are marked
  `#[allow(clippy::ptr_as_ptr)]`.
- Inferred casts (` as _`) are replaced with `.cast()`.
- Ascribed casts (` as *... T`) are replaced with `.cast::<T>()`.
- Multistep casts from references (` as *const _ as *const T`) are
  replaced with `core::ptr::from_ref(&x).cast()` with or without `::<T>`
  according to the previous rules. The `core::ptr::from_ref` call is
  required because `(x as *const _).cast::<T>()` results in inference
  failure.
- Native literal C strings are replaced with `c_str!().as_char_ptr()`.
- `*mut *mut T as _` is replaced with `let *mut *const T = (*mut *mut
  T)`.cast();` since pointer to pointer can be confusing.

Apply these changes and enable the lint -- no functional change
intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                               |  1 +
 rust/bindings/lib.rs                   |  1 +
 rust/kernel/alloc/allocator_test.rs    |  2 +-
 rust/kernel/alloc/kvec.rs              |  4 ++--
 rust/kernel/device.rs                  |  4 ++--
 rust/kernel/devres.rs                  |  2 +-
 rust/kernel/dma.rs                     |  4 ++--
 rust/kernel/error.rs                   |  2 +-
 rust/kernel/firmware.rs                |  3 ++-
 rust/kernel/fs/file.rs                 |  2 +-
 rust/kernel/kunit.rs                   | 11 +++++++----
 rust/kernel/list/impl_list_item_mod.rs |  2 +-
 rust/kernel/pci.rs                     |  2 +-
 rust/kernel/platform.rs                |  4 +++-
 rust/kernel/print.rs                   |  6 +++---
 rust/kernel/seq_file.rs                |  2 +-
 rust/kernel/str.rs                     |  2 +-
 rust/kernel/sync/poll.rs               |  2 +-
 rust/kernel/time/hrtimer/pin.rs        |  2 +-
 rust/kernel/time/hrtimer/pin_mut.rs    |  2 +-
 rust/kernel/workqueue.rs               | 10 +++++-----
 rust/uapi/lib.rs                       |  1 +
 22 files changed, 40 insertions(+), 31 deletions(-)

diff --git a/Makefile b/Makefile
index 38689a0c3605..5d2931344490 100644
--- a/Makefile
+++ b/Makefile
@@ -480,6 +480,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::needless_continue \
 			    -Aclippy::needless_lifetimes \
 			    -Wclippy::no_mangle_with_rust_abi \
+			    -Wclippy::ptr_as_ptr \
 			    -Wclippy::undocumented_unsafe_blocks \
 			    -Wclippy::unnecessary_safety_comment \
 			    -Wclippy::unnecessary_safety_doc \
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 014af0d1fc70..0486a32ed314 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -25,6 +25,7 @@
 )]
 
 #[allow(dead_code)]
+#[allow(clippy::ptr_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 mod bindings_raw {
     // Manual definition for blocklisted types.
diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
index c37d4c0c64e9..8017aa9d5213 100644
--- a/rust/kernel/alloc/allocator_test.rs
+++ b/rust/kernel/alloc/allocator_test.rs
@@ -82,7 +82,7 @@ unsafe fn realloc(
 
         // SAFETY: Returns either NULL or a pointer to a memory allocation that satisfies or
         // exceeds the given size and alignment requirements.
-        let dst = unsafe { libc_aligned_alloc(layout.align(), layout.size()) } as *mut u8;
+        let dst = unsafe { libc_aligned_alloc(layout.align(), layout.size()) }.cast::<u8>();
         let dst = NonNull::new(dst).ok_or(AllocError)?;
 
         if flags.contains(__GFP_ZERO) {
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ae9d072741ce..c12844764671 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -262,7 +262,7 @@ pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUninit<T>] {
         // - `self.len` is smaller than `self.capacity` and hence, the resulting pointer is
         //   guaranteed to be part of the same allocated object.
         // - `self.len` can not overflow `isize`.
-        let ptr = unsafe { self.as_mut_ptr().add(self.len) } as *mut MaybeUninit<T>;
+        let ptr = unsafe { self.as_mut_ptr().add(self.len) }.cast::<MaybeUninit<T>>();
 
         // SAFETY: The memory between `self.len` and `self.capacity` is guaranteed to be allocated
         // and valid, but uninitialized.
@@ -554,7 +554,7 @@ fn drop(&mut self) {
         // - `ptr` points to memory with at least a size of `size_of::<T>() * len`,
         // - all elements within `b` are initialized values of `T`,
         // - `len` does not exceed `isize::MAX`.
-        unsafe { Vec::from_raw_parts(ptr as _, len, len) }
+        unsafe { Vec::from_raw_parts(ptr.cast(), len, len) }
     }
 }
 
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 21b343a1dc4d..9fd7da4865a8 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -174,10 +174,10 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
         #[cfg(CONFIG_PRINTK)]
         unsafe {
             bindings::_dev_printk(
-                klevel as *const _ as *const crate::ffi::c_char,
+                klevel.as_ptr().cast::<crate::ffi::c_char>(),
                 self.as_raw(),
                 c_str!("%pA").as_char_ptr(),
-                &msg as *const _ as *const crate::ffi::c_void,
+                core::ptr::from_ref(&msg).cast::<crate::ffi::c_void>(),
             )
         };
     }
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index ddb1ce4a78d9..9e649d70716a 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -157,7 +157,7 @@ fn remove_action(this: &Arc<Self>) {
 
     #[allow(clippy::missing_safety_doc)]
     unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
-        let ptr = ptr as *mut DevresInner<T>;
+        let ptr = ptr.cast::<DevresInner<T>>();
         // Devres owned this memory; now that we received the callback, drop the `Arc` and hence the
         // reference.
         // SAFETY: Safe, since we leaked an `Arc` reference to devm_add_action() in
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 8cdc76043ee7..43ecf3c2e860 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -186,7 +186,7 @@ pub fn alloc_attrs(
             dev: dev.into(),
             dma_handle,
             count,
-            cpu_addr: ret as *mut T,
+            cpu_addr: ret.cast::<T>(),
             dma_attrs,
         })
     }
@@ -293,7 +293,7 @@ fn drop(&mut self) {
             bindings::dma_free_attrs(
                 self.dev.as_raw(),
                 size,
-                self.cpu_addr as _,
+                self.cpu_addr.cast(),
                 self.dma_handle,
                 self.dma_attrs.as_raw(),
             )
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 3dee3139fcd4..afcb00cb6a75 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -153,7 +153,7 @@ pub(crate) fn to_blk_status(self) -> bindings::blk_status_t {
     /// Returns the error encoded as a pointer.
     pub fn to_ptr<T>(self) -> *mut T {
         // SAFETY: `self.0` is a valid error due to its invariant.
-        unsafe { bindings::ERR_PTR(self.0.get() as _) as *mut _ }
+        unsafe { bindings::ERR_PTR(self.0.get() as _).cast() }
     }
 
     /// Returns a string representing the error, if one exists.
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index f04b058b09b2..d96b5724b4a3 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -58,10 +58,11 @@ impl Firmware {
     fn request_internal(name: &CStr, dev: &Device, func: FwFunc) -> Result<Self> {
         let mut fw: *mut bindings::firmware = core::ptr::null_mut();
         let pfw: *mut *mut bindings::firmware = &mut fw;
+        let pfw: *mut *const bindings::firmware = pfw.cast();
 
         // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
         // `name` and `dev` are valid as by their type invariants.
-        let ret = unsafe { func.0(pfw as _, name.as_char_ptr(), dev.as_raw()) };
+        let ret = unsafe { func.0(pfw, name.as_char_ptr(), dev.as_raw()) };
         if ret != 0 {
             return Err(Error::from_errno(ret));
         }
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 13a0e44cd1aa..791f493ada10 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -364,7 +364,7 @@ fn deref(&self) -> &LocalFile {
         //
         // By the type invariants, there are no `fdget_pos` calls that did not take the
         // `f_pos_lock` mutex.
-        unsafe { LocalFile::from_raw_file(self as *const File as *const bindings::file) }
+        unsafe { LocalFile::from_raw_file((self as *const Self).cast()) }
     }
 }
 
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 1604fb6a5b1b..3afea8b96e04 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -8,6 +8,9 @@
 
 use core::{ffi::c_void, fmt};
 
+#[cfg(CONFIG_PRINTK)]
+use crate::c_str;
+
 /// Prints a KUnit error-level message.
 ///
 /// Public but hidden since it should only be used from KUnit generated code.
@@ -18,8 +21,8 @@ pub fn err(args: fmt::Arguments<'_>) {
     #[cfg(CONFIG_PRINTK)]
     unsafe {
         bindings::_printk(
-            c"\x013%pA".as_ptr() as _,
-            &args as *const _ as *const c_void,
+            c_str!("\x013%pA").as_char_ptr(),
+            core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
 }
@@ -34,8 +37,8 @@ pub fn info(args: fmt::Arguments<'_>) {
     #[cfg(CONFIG_PRINTK)]
     unsafe {
         bindings::_printk(
-            c"\x016%pA".as_ptr() as _,
-            &args as *const _ as *const c_void,
+            c_str!("\x016%pA").as_char_ptr(),
+            core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
 }
diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
index a0438537cee1..1f9498c1458f 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -34,7 +34,7 @@ pub unsafe trait HasListLinks<const ID: u64 = 0> {
     unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut ListLinks<ID> {
         // SAFETY: The caller promises that the pointer is valid. The implementer promises that the
         // `OFFSET` constant is correct.
-        unsafe { (ptr as *mut u8).add(Self::OFFSET) as *mut ListLinks<ID> }
+        unsafe { ptr.cast::<u8>().add(Self::OFFSET).cast() }
     }
 }
 
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index c97d6d470b28..391b4f070b1c 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -78,7 +78,7 @@ extern "C" fn probe_callback(
                 // Let the `struct pci_dev` own a reference of the driver's private data.
                 // SAFETY: By the type invariant `pdev.as_raw` returns a valid pointer to a
                 // `struct pci_dev`.
-                unsafe { bindings::pci_set_drvdata(pdev.as_raw(), data.into_foreign() as _) };
+                unsafe { bindings::pci_set_drvdata(pdev.as_raw(), data.into_foreign().cast()) };
             }
             Err(err) => return Error::to_errno(err),
         }
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 4917cb34e2fe..6c0bd343c61b 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -70,7 +70,9 @@ extern "C" fn probe_callback(pdev: *mut bindings::platform_device) -> kernel::ff
                 // Let the `struct platform_device` own a reference of the driver's private data.
                 // SAFETY: By the type invariant `pdev.as_raw` returns a valid pointer to a
                 // `struct platform_device`.
-                unsafe { bindings::platform_set_drvdata(pdev.as_raw(), data.into_foreign() as _) };
+                unsafe {
+                    bindings::platform_set_drvdata(pdev.as_raw(), data.into_foreign().cast())
+                };
             }
             Err(err) => return Error::to_errno(err),
         }
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index cf4714242e14..13a894abe146 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -25,7 +25,7 @@
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
     // SAFETY: TODO.
-    let _ = w.write_fmt(unsafe { *(ptr as *const fmt::Arguments<'_>) });
+    let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
 
@@ -109,7 +109,7 @@ pub unsafe fn call_printk(
         bindings::_printk(
             format_string.as_ptr(),
             module_name.as_ptr(),
-            &args as *const _ as *const c_void,
+            core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
 }
@@ -129,7 +129,7 @@ pub fn call_printk_cont(args: fmt::Arguments<'_>) {
     unsafe {
         bindings::_printk(
             format_strings::CONT.as_ptr(),
-            &args as *const _ as *const c_void,
+            core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
 }
diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 7a9403eb6e5b..8f199b1a3bb1 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -37,7 +37,7 @@ pub fn call_printf(&self, args: core::fmt::Arguments<'_>) {
             bindings::seq_printf(
                 self.inner.get(),
                 c_str!("%pA").as_char_ptr(),
-                &args as *const _ as *const crate::ffi::c_void,
+                core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(),
             );
         }
     }
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 878111cb77bc..02863c40c21b 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -237,7 +237,7 @@ pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ffi::c_char) -> &'a Self {
         // to a `NUL`-terminated C string.
         let len = unsafe { bindings::strlen(ptr) } + 1;
         // SAFETY: Lifetime guaranteed by the safety precondition.
-        let bytes = unsafe { core::slice::from_raw_parts(ptr as _, len) };
+        let bytes = unsafe { core::slice::from_raw_parts(ptr.cast(), len) };
         // SAFETY: As `len` is returned by `strlen`, `bytes` does not contain interior `NUL`.
         // As we have added 1 to `len`, the last byte is known to be `NUL`.
         unsafe { Self::from_bytes_with_nul_unchecked(bytes) }
diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d7e6e59e124b..339ab6097be7 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -73,7 +73,7 @@ pub fn register_wait(&mut self, file: &File, cv: &PollCondVar) {
             // be destroyed, the destructor must run. That destructor first removes all waiters,
             // and then waits for an rcu grace period. Therefore, `cv.wait_queue_head` is valid for
             // long enough.
-            unsafe { qproc(file.as_ptr() as _, cv.wait_queue_head.get(), self.0.get()) };
+            unsafe { qproc(file.as_ptr().cast(), cv.wait_queue_head.get(), self.0.get()) };
         }
     }
 }
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
index f760db265c7b..47154f3bd422 100644
--- a/rust/kernel/time/hrtimer/pin.rs
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -79,7 +79,7 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a T>
 
     unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
         // `HrTimer` is `repr(C)`
-        let timer_ptr = ptr as *mut HrTimer<T>;
+        let timer_ptr = ptr.cast::<HrTimer<T>>();
 
         // SAFETY: By the safety requirement of this function, `timer_ptr`
         // points to a `HrTimer<T>` contained in an `T`.
diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
index 90c0351d62e4..e29ff8837206 100644
--- a/rust/kernel/time/hrtimer/pin_mut.rs
+++ b/rust/kernel/time/hrtimer/pin_mut.rs
@@ -83,7 +83,7 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a mut T>
 
     unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
         // `HrTimer` is `repr(C)`
-        let timer_ptr = ptr as *mut HrTimer<T>;
+        let timer_ptr = ptr.cast::<HrTimer<T>>();
 
         // SAFETY: By the safety requirement of this function, `timer_ptr`
         // points to a `HrTimer<T>` contained in an `T`.
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index f98bd02b838f..223fe5e8ed82 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -170,7 +170,7 @@ impl Queue {
     pub unsafe fn from_raw<'a>(ptr: *const bindings::workqueue_struct) -> &'a Queue {
         // SAFETY: The `Queue` type is `#[repr(transparent)]`, so the pointer cast is valid. The
         // caller promises that the pointer is not dangling.
-        unsafe { &*(ptr as *const Queue) }
+        unsafe { &*ptr.cast::<Queue>() }
     }
 
     /// Enqueues a work item.
@@ -457,7 +457,7 @@ fn get_work_offset(&self) -> usize {
     #[inline]
     unsafe fn raw_get_work(ptr: *mut Self) -> *mut Work<T, ID> {
         // SAFETY: The caller promises that the pointer is valid.
-        unsafe { (ptr as *mut u8).add(Self::OFFSET) as *mut Work<T, ID> }
+        unsafe { ptr.cast::<u8>().add(Self::OFFSET).cast::<Work<T, ID>>() }
     }
 
     /// Returns a pointer to the struct containing the [`Work<T, ID>`] field.
@@ -472,7 +472,7 @@ unsafe fn work_container_of(ptr: *mut Work<T, ID>) -> *mut Self
     {
         // SAFETY: The caller promises that the pointer points at a field of the right type in the
         // right kind of struct.
-        unsafe { (ptr as *mut u8).sub(Self::OFFSET) as *mut Self }
+        unsafe { ptr.cast::<u8>().sub(Self::OFFSET).cast::<Self>() }
     }
 }
 
@@ -538,7 +538,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Arc<T>
 {
     unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
-        let ptr = ptr as *mut Work<T, ID>;
+        let ptr = ptr.cast::<Work<T, ID>>();
         // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
         let ptr = unsafe { T::work_container_of(ptr) };
         // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
@@ -591,7 +591,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
 {
     unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
-        let ptr = ptr as *mut Work<T, ID>;
+        let ptr = ptr.cast::<Work<T, ID>>();
         // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
         let ptr = unsafe { T::work_container_of(ptr) };
         // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 13495910271f..f03b7aead35a 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -14,6 +14,7 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     clippy::all,
+    clippy::ptr_as_ptr,
     clippy::undocumented_unsafe_blocks,
     dead_code,
     missing_docs,

-- 
2.49.0

