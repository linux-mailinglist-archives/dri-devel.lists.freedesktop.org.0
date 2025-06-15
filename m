Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2CBADA3C6
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 22:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A1110E24F;
	Sun, 15 Jun 2025 20:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TYlfzvHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAED310E246;
 Sun, 15 Jun 2025 20:55:24 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6fb0eb0f0fbso37521726d6.1; 
 Sun, 15 Jun 2025 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750020924; x=1750625724; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eOVACA1eFI8MiX8ijFRfc0eSr1nhHyzNP288zOTRdlY=;
 b=TYlfzvHqR7rOm+tBUtX2wax6XoHadTYfJCgVpEwdZP+JBfKh8AIQeSud6gZFKWdrq8
 jH0+KW1Cn41k8ZAzv6ys/bH0iJUW0Rf6tXZLe1L/sM1swJqIzn3w9oBFIoeyJ5oaSyzd
 +PCJnoZZXukRmiZeJJxcv4ms0yTFNpTmTfMyzebF158c3gzf/cdxIY4eWq/ngY/IjXg1
 47lkNRwIeWA21zo3Me/IIUPuWLBKij9cf8BXObDbIWUKc6R1cL0w1kAqZnLAW9dXSjxb
 frDeCqBmaAvOOAKz7r4E6IVN9Lv5vz8Tl1jiNQD4zaF9zMeESrmpe7DroIhxSGiCw7fz
 M/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750020924; x=1750625724;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOVACA1eFI8MiX8ijFRfc0eSr1nhHyzNP288zOTRdlY=;
 b=TPwL2MrSG3iSV5IpTK52Po3hJ1vL0R3Xq1faojAFimZFeD0ww9i2Pu6QCj2eSrzQ8X
 b1zlSvY/1sPGt/wtyTGkIyDCXthQBbJ+eSOo8D6pqHkef9SmL696JygvdLfXQK0SEB57
 QkZAJc55Z07A8Q7M6ZHJizsVdxip0onXod2hxgExF1zWQp9LCb9TaXlF+OyTfOQSXJ7h
 Y5PenBB0O9gjMv1a2MWL6YgDHvf84hL9sERVH0GLqvODuNJOGN1pKRayrf7y6irfGLcf
 PWEDWLDLj+iDJLryZKV8568EeXGCGIJZdnomEq4dz3NGY/BcT0luPsl37MH78/y8G4TI
 H1rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbqF+L7WZEkycltWdEi0n/vonKftXuoe2LffMmNWsm2kDqu2UA0fNCO6kjskX2N/G7SeVxxa/8b1c=@lists.freedesktop.org,
 AJvYcCXcBcnbJo8Zi44WCocIHCUoQYq9sZADryd+DxsVko+Cqh4X6Wf7t2NYfdQefFAcuVM7wShAmldysA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe6GZGj7ffoDmPgw0L8vY+L34O1CL05fAbfafWaaUeGvDXh1gr
 Qz++149qCoLS/n/wbPXjPnkR8hoPTsIM5Q2Wcep59NcCtojWctluP1IT4NDwFqJN
X-Gm-Gg: ASbGncuNCAPhDXSgsQHFaV1zl7I+rz+G7aMduay9jEyB99oLF8KOxxx7BU6PZbqXiWj
 2zBEg5BtGZ7xSx0o3BQwpXpdgJLZG2wAvO8lLIcbHyCeS/cpmD203NLr/ECB+tUHpqqeeIpGVQP
 cmZv/giEX4ubYMWgY/v5g/AOqzreoX+/tLY4hMH3YZ/VO26A9ID/VZ5DxTkkc0uiA3WkbRQItat
 nV6KfZDlp0R+fDB7/+lTqYxLfq82cKz23LvKQKGmdSqQj494WdXIgywQZdtauA/kHcbNvmJ5e8n
 xsnKGj5005I/INZvy2TJswEAQnBwKV8TMlYJKwhAmZdQaB5lzAKY7icfDfKWBRyWHdlOBQ==
X-Google-Smtp-Source: AGHT+IF3hh4jupFwZOSWdFP81Ho1hBbetMpEgJhDQJSGwSq3vyb7VWe0EmAuiWSZP0mzNWtopZ28zA==
X-Received: by 2002:a05:6214:2264:b0:6fa:a428:8b1e with SMTP id
 6a1803df08f44-6fb46e1a667mr121430216d6.22.1750020923745; 
 Sun, 15 Jun 2025 13:55:23 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:b0c6:92db:d807:21a6])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fb35c84148sm43468176d6.109.2025.06.15.13.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 13:55:23 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 15 Jun 2025 16:55:10 -0400
Subject: [PATCH v12 6/6] rust: enable `clippy::ref_as_ptr` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-ptr-as-ptr-v12-6-f43b024581e8@gmail.com>
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
 Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Tamir Duberstein <tamird@gmail.com>, Benno Lossin <lossin@kernel.org>
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

In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:

> Using `as` casts may result in silently changing mutability or type.

While this doesn't eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize.  It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint -- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                 |  1 +
 rust/bindings/lib.rs     |  1 +
 rust/kernel/configfs.rs  | 20 ++++++--------------
 rust/kernel/device_id.rs |  2 +-
 rust/kernel/fs/file.rs   |  2 +-
 rust/kernel/str.rs       |  4 ++--
 rust/kernel/uaccess.rs   |  4 ++--
 rust/uapi/lib.rs         |  1 +
 8 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index 29cf39be14de..1a855f42a34a 100644
--- a/Makefile
+++ b/Makefile
@@ -489,6 +489,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::no_mangle_with_rust_abi \
 			    -Wclippy::ptr_as_ptr \
 			    -Wclippy::ptr_cast_constness \
+			    -Wclippy::ref_as_ptr \
 			    -Wclippy::undocumented_unsafe_blocks \
 			    -Wclippy::unnecessary_safety_comment \
 			    -Wclippy::unnecessary_safety_doc \
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 7631c9f6708d..474cc98c48a3 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -27,6 +27,7 @@
 #[allow(dead_code)]
 #[allow(clippy::cast_lossless)]
 #[allow(clippy::ptr_as_ptr)]
+#[allow(clippy::ref_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
 mod bindings_raw {
diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index bc8e15dcec18..1ddac786bd0d 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -426,7 +426,7 @@ impl<Parent, Child> GroupOperationsVTable<Parent, Child>
     };
 
     const fn vtable_ptr() -> *const bindings::configfs_group_operations {
-        &Self::VTABLE as *const bindings::configfs_group_operations
+        &Self::VTABLE
     }
 }
 
@@ -464,7 +464,7 @@ impl<Data> ItemOperationsVTable<Group<Data>, Data>
     };
 
     const fn vtable_ptr() -> *const bindings::configfs_item_operations {
-        &Self::VTABLE as *const bindings::configfs_item_operations
+        &Self::VTABLE
     }
 }
 
@@ -476,7 +476,7 @@ impl<Data> ItemOperationsVTable<Subsystem<Data>, Data> {
     };
 
     const fn vtable_ptr() -> *const bindings::configfs_item_operations {
-        &Self::VTABLE as *const bindings::configfs_item_operations
+        &Self::VTABLE
     }
 }
 
@@ -717,11 +717,7 @@ impl<const N: usize, Data> AttributeList<N, Data> {
 
         // SAFETY: By function safety requirements, we have exclusive access to
         // `self` and the reference created below will be exclusive.
-        unsafe {
-            (&mut *self.0.get())[I] = (attribute as *const Attribute<ID, O, Data>)
-                .cast_mut()
-                .cast()
-        };
+        unsafe { (&mut *self.0.get())[I] = core::ptr::from_ref(attribute).cast_mut().cast() };
     }
 }
 
@@ -761,9 +757,7 @@ pub const fn new_with_child_ctor<const N: usize, Child>(
                         ct_owner: owner.as_ptr(),
                         ct_group_ops: GroupOperationsVTable::<Data, Child>::vtable_ptr().cast_mut(),
                         ct_item_ops: ItemOperationsVTable::<$tpe, Data>::vtable_ptr().cast_mut(),
-                        ct_attrs: (attributes as *const AttributeList<N, Data>)
-                            .cast_mut()
-                            .cast(),
+                        ct_attrs: core::ptr::from_ref(attributes).cast_mut().cast(),
                         ct_bin_attrs: core::ptr::null_mut(),
                     }),
                     _p: PhantomData,
@@ -780,9 +774,7 @@ pub const fn new<const N: usize>(
                         ct_owner: owner.as_ptr(),
                         ct_group_ops: core::ptr::null_mut(),
                         ct_item_ops: ItemOperationsVTable::<$tpe, Data>::vtable_ptr().cast_mut(),
-                        ct_attrs: (attributes as *const AttributeList<N, Data>)
-                            .cast_mut()
-                            .cast(),
+                        ct_attrs: core::ptr::from_ref(attributes).cast_mut().cast(),
                         ct_bin_attrs: core::ptr::null_mut(),
                     }),
                     _p: PhantomData,
diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index f9d55ac7b9e6..3dc72ca8cfc2 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -136,7 +136,7 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, U> for IdArray<T, U, N> {
     fn as_ptr(&self) -> *const T::RawType {
         // This cannot be `self.ids.as_ptr()`, as the return pointer must have correct provenance
         // to access the sentinel.
-        (self as *const Self).cast()
+        core::ptr::from_ref(self).cast()
     }
 
     fn id(&self, index: usize) -> &T::RawType {
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index e9bfbad00755..35fd5db35c46 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -366,7 +366,7 @@ fn deref(&self) -> &LocalFile {
         //
         // By the type invariants, there are no `fdget_pos` calls that did not take the
         // `f_pos_lock` mutex.
-        unsafe { LocalFile::from_raw_file((self as *const Self).cast()) }
+        unsafe { LocalFile::from_raw_file(core::ptr::from_ref(self).cast()) }
     }
 }
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 43597eb7c5c1..cbc8b459ed41 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -29,7 +29,7 @@ pub const fn is_empty(&self) -> bool {
     #[inline]
     pub const fn from_bytes(bytes: &[u8]) -> &Self {
         // SAFETY: `BStr` is transparent to `[u8]`.
-        unsafe { &*(bytes as *const [u8] as *const BStr) }
+        unsafe { &*(core::ptr::from_ref(bytes) as *const BStr) }
     }
 
     /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`].
@@ -290,7 +290,7 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
     #[inline]
     pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
         // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
-        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
+        unsafe { &mut *(core::ptr::from_mut(bytes) as *mut CStr) }
     }
 
     /// Returns a C pointer to the string.
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 6d70edd8086a..4ef13cf13a78 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -240,7 +240,7 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
     pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
         // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
         // `out`.
-        let out = unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<u8>]) };
+        let out = unsafe { &mut *(core::ptr::from_mut(out) as *mut [MaybeUninit<u8>]) };
         self.read_raw(out)
     }
 
@@ -355,7 +355,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         let res = unsafe {
             bindings::_copy_to_user(
                 self.ptr as *mut c_void,
-                (value as *const T).cast::<c_void>(),
+                core::ptr::from_ref(value).cast::<c_void>(),
                 len,
             )
         };
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 08e68ebef606..31c2f713313f 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -16,6 +16,7 @@
     clippy::all,
     clippy::cast_lossless,
     clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
     clippy::undocumented_unsafe_blocks,
     dead_code,
     missing_docs,

-- 
2.49.0

