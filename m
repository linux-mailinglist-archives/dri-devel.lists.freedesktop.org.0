Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE254A559A2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 23:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C55910EA98;
	Thu,  6 Mar 2025 22:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MbcKDMn+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5010EA98;
 Thu,  6 Mar 2025 22:24:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B31C6A45237;
 Thu,  6 Mar 2025 22:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D4AC4CEEB;
 Thu,  6 Mar 2025 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741299839;
 bh=ILGJjKKo5nQZHxzXgwewCMckflvSqIeS3xmxKI0k4uM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbcKDMn+v17Jlhx7k1of1maIC3wGlRZRcgexU9K896QzxSROQEhd5YkuHiPaEKPfp
 YNd15lAFxZ5nEXsQtXTWFtQX4EbhZRYBZhw4UxQwHF4sDXrUGs18SHeJP5xTLZGQNn
 hAEOFNMyQWxy7wX7mBDL5FfHqozrd1QbipglcV6Xi0TafZxC01zX/71bJxfdXTe0E9
 VUbQpWfSuyDow21BWdgx9ZScYZEgK9d7+ePkGYbHau+R6kL1vlhVoLkfEvIjJ1/Yka
 EhZNKq8Q6eaXv42yK9oZILxlBrXGKMonB+Gsk8TC1yKwd51UvPs6zN3kGcJGdysJan
 59FwoY6ItGEkg==
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
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v6 2/5] rust: firmware: introduce `firmware::ModInfoBuilder`
Date: Thu,  6 Mar 2025 23:23:28 +0100
Message-ID: <20250306222336.23482-3-dakr@kernel.org>
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

The `firmware` field of the `module!` only accepts literal strings,
which is due to the fact that it is implemented as a proc macro.

Some drivers require a lot of firmware files (such as nova-core) and
hence benefit from more flexibility composing firmware path strings.

The `firmware::ModInfoBuilder` is a helper component to flexibly compose
firmware path strings for the .modinfo section in const context.

It is meant to be used in combination with `kernel::module_firmware!`.

Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/firmware.rs | 127 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index c5162fdc95ff..6008b62f2de8 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -115,3 +115,130 @@ unsafe impl Send for Firmware {}
 // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, references to which are safe to
 // be used from any thread.
 unsafe impl Sync for Firmware {}
+
+/// Builder for firmware module info.
+///
+/// [`ModInfoBuilder`] is a helper component to flexibly compose firmware paths strings for the
+/// .modinfo section in const context.
+///
+/// Therefore the [`ModInfoBuilder`] provides the methods [`ModInfoBuilder::new_entry`] and
+/// [`ModInfoBuilder::push`], where the latter is used to push path components and the former to
+/// mark the beginning of a new path string.
+///
+/// [`ModInfoBuilder`] is meant to be used in combination with `kernel::module_firmware!`.
+///
+/// The const generic `N` as well as the `module_name` parameter of [`ModInfoBuilder::new`] is an
+/// internal implementation detail and supplied through the above macro.
+pub struct ModInfoBuilder<const N: usize> {
+    buf: [u8; N],
+    n: usize,
+    module_name: &'static CStr,
+}
+
+impl<const N: usize> ModInfoBuilder<N> {
+    /// Create an empty builder instance.
+    pub const fn new(module_name: &'static CStr) -> Self {
+        Self {
+            buf: [0; N],
+            n: 0,
+            module_name,
+        }
+    }
+
+    const fn push_internal(mut self, bytes: &[u8]) -> Self {
+        let mut j = 0;
+
+        if N == 0 {
+            self.n += bytes.len();
+            return self;
+        }
+
+        while j < bytes.len() {
+            if self.n < N {
+                self.buf[self.n] = bytes[j];
+            }
+            self.n += 1;
+            j += 1;
+        }
+        self
+    }
+
+    /// Push an additional path component.
+    ///
+    /// Append path components to the [`ModInfoBuilder`] instance. Paths need to be separated
+    /// with [`ModInfoBuilder::new_entry`].
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// use kernel::firmware::ModInfoBuilder;
+    ///
+    /// # const DIR: &str = "vendor/chip/";
+    /// # const fn no_run<const N: usize>(builder: ModInfoBuilder<N>) {
+    /// let builder = builder.new_entry()
+    ///     .push(DIR)
+    ///     .push("foo.bin")
+    ///     .new_entry()
+    ///     .push(DIR)
+    ///     .push("bar.bin");
+    /// # }
+    /// ```
+    pub const fn push(self, s: &str) -> Self {
+        // Check whether there has been an initial call to `next_entry()`.
+        if N != 0 && self.n == 0 {
+            crate::build_error!("Must call next_entry() before push().");
+        }
+
+        self.push_internal(s.as_bytes())
+    }
+
+    const fn push_module_name(self) -> Self {
+        let mut this = self;
+        let module_name = this.module_name;
+
+        if !this.module_name.is_empty() {
+            this = this.push_internal(module_name.as_bytes_with_nul());
+
+            if N != 0 {
+                // Re-use the space taken by the NULL terminator and swap it with the '.' separator.
+                this.buf[this.n - 1] = b'.';
+            }
+        }
+
+        this
+    }
+
+    /// Prepare the [`ModInfoBuilder`] for the next entry.
+    ///
+    /// This method acts as a separator between module firmware path entries.
+    ///
+    /// Must be called before constructing a new entry with subsequent calls to
+    /// [`ModInfoBuilder::push`].
+    ///
+    /// See [`ModInfoBuilder::push`] for an example.
+    pub const fn new_entry(self) -> Self {
+        self.push_internal(b"\0")
+            .push_module_name()
+            .push_internal(b"firmware=")
+    }
+
+    /// Build the byte array.
+    pub const fn build(self) -> [u8; N] {
+        // Add the final NULL terminator.
+        let this = self.push_internal(b"\0");
+
+        if this.n == N {
+            this.buf
+        } else {
+            crate::build_error!("Length mismatch.");
+        }
+    }
+}
+
+impl ModInfoBuilder<0> {
+    /// Return the length of the byte array to build.
+    pub const fn build_length(self) -> usize {
+        // Compensate for the NULL terminator added by `build`.
+        self.n + 1
+    }
+}
-- 
2.48.1

