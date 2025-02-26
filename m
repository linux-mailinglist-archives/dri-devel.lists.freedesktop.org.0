Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF3FA46899
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B782910E992;
	Wed, 26 Feb 2025 17:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MqJfmxWQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D20010E992;
 Wed, 26 Feb 2025 17:56:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35C506151D;
 Wed, 26 Feb 2025 17:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BE1C4CEE9;
 Wed, 26 Feb 2025 17:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740592581;
 bh=BQ8xHMKrltZRFNzxJKwFtK1VAIQkorDo50VJfIqedqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MqJfmxWQBjJ7tvEUfd6uYf1PEpWYAv09MkXWzee9bKtMvDe1brA+59hTUTi7Itawj
 lICX7awqJbiC+u/jdk9ZwjwPp45oSKWBUeiurrmsrtWyeM5XP2akF5TdAPLomd9N/u
 FmfocWK7R9CApGtVfmggHmJ+PvpXT1J7nIWr7+Rx9Qfu2A2pr5KM94E5jE1hUyqrwV
 5WUTyQ0Tqn57A5QoAEAwZRNw8sEhGYcR0BcFXqlPZXJLFBqpcBYkxUKDcHKCN/xpyU
 tC1vFxRDndUTHptxeO9xXM1rVEKE725QtUB2sJ6cPkfOV66qrxBIy+sQL2jIo4r05l
 L0D8hs9UQ8+sQ==
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
Subject: [PATCH v4 3/6] rust: firmware: introduce `firmware::ModInfoBuilder`
Date: Wed, 26 Feb 2025 18:55:45 +0100
Message-ID: <20250226175552.29381-4-dakr@kernel.org>
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

The `firmware` field of the `module!` only accepts literal strings,
which is due to the fact that it is implemented as a proc macro.

Some drivers require a lot of firmware files (such as nova-core) and
hence benefit from more flexibility composing firmware path strings.

The `firmware::ModInfoBuilder` is a helper component to flexibly compose
firmware path strings for the .modinfo section in const context.

It is meant to be used in combination with `kernel::module_firmware!`,
which is introduced in a subsequent patch.

Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/firmware.rs | 98 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index c5162fdc95ff..0f27dc212d6e 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -115,3 +115,101 @@ unsafe impl Send for Firmware {}
 // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, references to which are safe to
 // be used from any thread.
 unsafe impl Sync for Firmware {}
+
+/// Builder for firmware module info.
+///
+/// [`ModInfoBuilder`] is a helper component to flexibly compose firmware paths strings for the
+/// .modinfo section in const context.
+///
+/// It is meant to be used in combination with [`kernel::module_firmware!`].
+///
+/// For more details and an example, see [`kernel::module_firmware!`].
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
+    /// After a new [`ModInfoBuilder`] instance has been created, [`ModInfoBuilder::prepare`] must
+    /// be called before adding path components.
+    pub const fn push(self, bytes: &[u8]) -> Self {
+        if N != 0 && self.n == 0 {
+            crate::build_error!("Must call prepare() before push().");
+        }
+
+        self.push_internal(bytes)
+    }
+
+    const fn prepare_module_name(self) -> Self {
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
+        this.push_internal(b"firmware=")
+    }
+
+    /// Prepare for the next module info entry.
+    ///
+    /// Must be called before [`ModInfoBuilder::push`] can be called.
+    pub const fn prepare(self) -> Self {
+        self.push_internal(b"\0").prepare_module_name()
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

