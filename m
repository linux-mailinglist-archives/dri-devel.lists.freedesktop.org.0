Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3BEA4689D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBB510E998;
	Wed, 26 Feb 2025 17:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="evkfVNXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D2210E994;
 Wed, 26 Feb 2025 17:56:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CD3756143A;
 Wed, 26 Feb 2025 17:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BE1C4CEE7;
 Wed, 26 Feb 2025 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740592588;
 bh=4Gh+3oEX8TH5fL4MLDUruHVYnxd9MOSXlnIxsljSNG0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=evkfVNXhIvColJtiW+Wka01VXgpw3bttb8XHlp6+vaq4TAsdtTG7KTQPjG28FhpYd
 9shdbFyZCPr90oiBLe2J6Qu/lrTSgHMuvTmx6VjtV2SF2vzZCGYzMtjUCYtPL29oez
 WF/BLw44uZUj5i6dVtmY/NMdoBH1sLGa907B4aak2EwIEmizZpBS0Axj5KYEDM21Xu
 gKEDVfDCIQslcn/ulB+ufmBBrqpChW7jbzryDYJaj8FwfdRxT3mKlfu0ghGvqaOUPR
 TMu/eNcLBWIw3lTMULo10GQA4FxsPpZD+bfoLWF8Kn20nQv17iu5oWn1rZDj3sqqhu
 K81c8SsE9PJWQ==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 mcgrof@kernel.org, russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 4/6] rust: firmware: add `module_firmware!` macro
Date: Wed, 26 Feb 2025 18:55:46 +0100
Message-ID: <20250226175552.29381-5-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226175552.29381-1-dakr@kernel.org>
References: <20250226175552.29381-1-dakr@kernel.org>
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

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/firmware.rs | 79 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 0f27dc212d6e..5cabbbc9aeb8 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -116,6 +116,85 @@ unsafe impl Send for Firmware {}
 // be used from any thread.
 unsafe impl Sync for Firmware {}
 
+/// Create firmware .modinfo entries.
+///
+/// This macro is the counterpart of the C macro `MODULE_FIRMWARE()`, but instead of taking a
+/// simple string literals, which is already covered by the `firmware` field of
+/// [`crate::prelude::module!`], it allows the caller to pass a builder type (e.g.
+/// [`ModInfoBuilder`]) which can create the firmware modinfo strings in a more flexible way.
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
+///     const fn create(module_name: &'static kernel::str::CStr) -> firmware::ModInfoBuilder<N> {
+///         firmware::ModInfoBuilder::new(module_name)
+///             .prepare()
+///             .push(b"vendor/foo.bin")
+///             .prepare()
+///             .push(b"vendor/bar.bin")
+///     }
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
+    ($($builder:tt)*) => {
+
+        #[cfg(not(MODULE))]
+        const fn __module_name() -> &'static kernel::str::CStr {
+            <LocalModule as kernel::ModuleMetadata>::NAME
+        }
+
+        #[cfg(MODULE)]
+        const fn __module_name() -> &'static kernel::str::CStr {
+            kernel::c_str!("")
+        }
+
+        #[link_section = ".modinfo"]
+        #[used]
+        static __MODULE_FIRMWARE: [u8; $($builder)*::create(__module_name()).build_length()] =
+            $($builder)*::create(__module_name()).build();
+    };
+}
+
 /// Builder for firmware module info.
 ///
 /// [`ModInfoBuilder`] is a helper component to flexibly compose firmware paths strings for the
-- 
2.48.1

