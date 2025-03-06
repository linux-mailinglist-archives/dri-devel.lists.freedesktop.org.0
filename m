Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA19CA559A6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 23:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FAB10EAA0;
	Thu,  6 Mar 2025 22:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y2Bww182";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFD410EA9F;
 Thu,  6 Mar 2025 22:24:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 433105C5A92;
 Thu,  6 Mar 2025 22:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FD2C4CEE8;
 Thu,  6 Mar 2025 22:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741299845;
 bh=u2kt676m6q3TARHjfViZbJ5BSWVgsP9Th4fpQNehbLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y2Bww182MnsJr568pd3TM8g3NyXTW+FMu4S97q+cFfIZs034Z+lq+z5we5mO5E92D
 p8Te4pb5dVHmq7VOH/YqaSIlyVk6udeyhi8VC8FK7E2FECYQ/2G+wRf8JG+ASCv13T
 SUiDonu/AuwbQAlyh6fERTZ0BSonbCsX3OGZyf4SuSHyB5cZCosvbDk6TS00Tgkvda
 sawXsM0vpW45BdLGlqEraSDrb/YvPNClCz2ABAjOVX2lUQnHKGUJfQyuZnjoac1BQP
 5Xaw0J72FnKsn61NAeOvnsBsFoR2Tlnbytvx7F0IXRpU/ZksN9cSiW2QyEAOnlj0l2
 cdFGtqE9M6t/g==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH v6 3/5] rust: firmware: add `module_firmware!` macro
Date: Thu,  6 Mar 2025 23:23:29 +0100
Message-ID: <20250306222336.23482-4-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306222336.23482-1-dakr@kernel.org>
References: <20250306222336.23482-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Analogous to the `module!` macro `module_firmware!` adds additional
firmware path strings to the .modinfo section.

In contrast to `module!`, where path strings need to be string literals,
path strings can be composed with the `firmware::ModInfoBuilder`.

Some drivers require a lot of firmware files (such as nova-core) and
hence benefit from more flexibility composing firmware path strings.

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/firmware.rs | 91 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 6008b62f2de8..ae6a1ffdad3d 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -116,6 +116,95 @@ unsafe impl Send for Firmware {}
 // be used from any thread.
 unsafe impl Sync for Firmware {}
 
+/// Create firmware .modinfo entries.
+///
+/// This macro is the counterpart of the C macro `MODULE_FIRMWARE()`, but instead of taking a
+/// simple string literals, which is already covered by the `firmware` field of
+/// [`crate::prelude::module!`], it allows the caller to pass a builder type, based on the
+/// [`ModInfoBuilder`], which can create the firmware modinfo strings in a more flexible way.
+///
+/// Drivers should extend the [`ModInfoBuilder`] with their own driver specific builder type.
+///
+/// The `builder` argument must be a type which implements the following function.
+///
+/// `const fn create(module_name: &'static CStr) -> ModInfoBuilder`
+///
+/// `create` should pass the `module_name` to the [`ModInfoBuilder`] and, with the help of
+/// it construct the corresponding firmware modinfo.
+///
+/// Typically, such contracts would be enforced by a trait, however traits do not (yet) support
+/// const functions.
+///
+/// # Example
+///
+/// ```
+/// # mod module_firmware_test {
+/// # use kernel::firmware;
+/// # use kernel::prelude::*;
+/// #
+/// # struct MyModule;
+/// #
+/// # impl kernel::Module for MyModule {
+/// #     fn init(_module: &'static ThisModule) -> Result<Self> {
+/// #         Ok(Self)
+/// #     }
+/// # }
+/// #
+/// #
+/// struct Builder<const N: usize>;
+///
+/// impl<const N: usize> Builder<N> {
+///     const DIR: &str = "vendor/chip/";
+///     const FILES: [&str; 3] = [ "foo", "bar", "baz" ];
+///
+///     const fn create(module_name: &'static kernel::str::CStr) -> firmware::ModInfoBuilder<N> {
+///         let mut builder = firmware::ModInfoBuilder::new(module_name);
+///
+///         let mut i = 0;
+///         while i < Self::FILES.len() {
+///             builder = builder.new_entry()
+///                 .push(Self::DIR)
+///                 .push(Self::FILES[i])
+///                 .push(".bin");
+///
+///                 i += 1;
+///         }
+///
+///         builder
+///      }
+/// }
+///
+/// module! {
+///    type: MyModule,
+///    name: "module_firmware_test",
+///    author: "Rust for Linux",
+///    description: "module_firmware! test module",
+///    license: "GPL",
+/// }
+///
+/// kernel::module_firmware!(Builder);
+/// # }
+/// ```
+#[macro_export]
+macro_rules! module_firmware {
+    // The argument is the builder type without the const generic, since it's deferred from within
+    // this macro. Hence, we can neither use `expr` nor `ty`.
+    ($($builder:tt)*) => {
+        const _: () = {
+            const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr = if cfg!(MODULE) {
+                $crate::c_str!("")
+            } else {
+                <LocalModule as $crate::ModuleMetadata>::NAME
+            };
+
+            #[link_section = ".modinfo"]
+            #[used]
+            static __MODULE_FIRMWARE: [u8; $($builder)*::create(__MODULE_FIRMWARE_PREFIX)
+                .build_length()] = $($builder)*::create(__MODULE_FIRMWARE_PREFIX).build();
+        };
+    };
+}
+
 /// Builder for firmware module info.
 ///
 /// [`ModInfoBuilder`] is a helper component to flexibly compose firmware paths strings for the
@@ -125,7 +214,7 @@ unsafe impl Sync for Firmware {}
 /// [`ModInfoBuilder::push`], where the latter is used to push path components and the former to
 /// mark the beginning of a new path string.
 ///
-/// [`ModInfoBuilder`] is meant to be used in combination with `kernel::module_firmware!`.
+/// [`ModInfoBuilder`] is meant to be used in combination with [`kernel::module_firmware!`].
 ///
 /// The const generic `N` as well as the `module_name` parameter of [`ModInfoBuilder::new`] is an
 /// internal implementation detail and supplied through the above macro.
-- 
2.48.1

