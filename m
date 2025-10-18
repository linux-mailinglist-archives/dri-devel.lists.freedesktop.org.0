Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA50BED8D9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 21:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA3410E1BB;
	Sat, 18 Oct 2025 19:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QCD74lRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC1910E1B1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 19:17:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B0F9611AA;
 Sat, 18 Oct 2025 19:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B232C4CEF9;
 Sat, 18 Oct 2025 19:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760815031;
 bh=fJabrPUxe/0BzRSdGSTnGlGPwAz5wbczhVYqBvgrLLI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QCD74lRhyTIsOoeBfH6mAy2YDTiLur6l8EL36/KC/gZ13zjZy3BzCtVt6vx3Rln0J
 7h5BEF0mt4RmPrXavxluZepBBRcEh0CH17+h8UiY4gozAXtTM+E0ADJp6avB/lqoP9
 Cxo9wbwbA1qxiFGmEySInciL8nXhLuHWYhsTWb2TrlINlbT/B8iPPBFNzpgoyfRyaZ
 BZyuOiGeQC6KWtrwSaELSyieDlI29Djzgt/7MfOlXRt5G3VC5gzNn5BZZ+El8Bo8ig
 LtSzxpSs/SnVauFXAC1QJQ56Kq2YZF6MhJ2gswvPgQuyeq3emQPP+DqkJ0hqo3qquQ
 WZUox8/rzgZUA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 18 Oct 2025 15:16:28 -0400
Subject: [RESEND PATCH v18 07/16] rust: debugfs: use `kernel::fmt`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-7-9378a54385f8@gmail.com>
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
 llvm@lists.linux.dev, Tamir Duberstein <tamird@gmail.com>, 
 Matthew Maurer <mmaurer@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760814988; l=4664;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=2RO1O8x8vlwhifkhfd816jOQiIu5L43+GQ3qhkZvCCc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGNJfGku7Uu7NvyKkNEwrEqxvI/AmZxlQE8vnZn/IZ7EV7W/LhqTlclv+M+5nbMh+MNdgCGx6ur
 t8Sj0GlS3ZgM=
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

From: Tamir Duberstein <tamird@gmail.com>

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit 40ecc49466c8 ("rust: debugfs: Add support for
callback-based files") and commit 5e40b591cb46 ("rust: debugfs: Add
support for read-only files").

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/debugfs.rs                   |  2 +-
 rust/kernel/debugfs/callback_adapters.rs |  7 +++----
 rust/kernel/debugfs/file_ops.rs          |  6 +++---
 rust/kernel/debugfs/traits.rs            | 10 +++++-----
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 381c23b3dd83..8c35d032acfe 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -8,12 +8,12 @@
 // When DebugFS is disabled, many parameters are dead. Linting for this isn't helpful.
 #![cfg_attr(not(CONFIG_DEBUG_FS), allow(unused_variables))]
 
+use crate::fmt;
 use crate::prelude::*;
 use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
 use crate::uaccess::UserSliceReader;
-use core::fmt;
 use core::marker::PhantomData;
 use core::marker::PhantomPinned;
 #[cfg(CONFIG_DEBUG_FS)]
diff --git a/rust/kernel/debugfs/callback_adapters.rs b/rust/kernel/debugfs/callback_adapters.rs
index 6c024230f676..a260d8dee051 100644
--- a/rust/kernel/debugfs/callback_adapters.rs
+++ b/rust/kernel/debugfs/callback_adapters.rs
@@ -5,10 +5,9 @@
 //! than a trait implementation. If provided, it will override the trait implementation.
 
 use super::{Reader, Writer};
+use crate::fmt;
 use crate::prelude::*;
 use crate::uaccess::UserSliceReader;
-use core::fmt;
-use core::fmt::Formatter;
 use core::marker::PhantomData;
 use core::ops::Deref;
 
@@ -76,9 +75,9 @@ fn deref(&self) -> &D {
 
 impl<D, F> Writer for FormatAdapter<D, F>
 where
-    F: Fn(&D, &mut Formatter<'_>) -> fmt::Result + 'static,
+    F: Fn(&D, &mut fmt::Formatter<'_>) -> fmt::Result + 'static,
 {
-    fn write(&self, fmt: &mut Formatter<'_>) -> fmt::Result {
+    fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
         // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
         let f: &F = unsafe { materialize_zst() };
         f(&self.inner, fmt)
diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index 50fead17b6f3..9ad5e3fa6f69 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -3,11 +3,11 @@
 
 use super::{Reader, Writer};
 use crate::debugfs::callback_adapters::Adapter;
+use crate::fmt;
 use crate::prelude::*;
 use crate::seq_file::SeqFile;
 use crate::seq_print;
 use crate::uaccess::UserSlice;
-use core::fmt::{Display, Formatter, Result};
 use core::marker::PhantomData;
 
 #[cfg(CONFIG_DEBUG_FS)]
@@ -65,8 +65,8 @@ fn deref(&self) -> &Self::Target {
 
 struct WriterAdapter<T>(T);
 
-impl<'a, T: Writer> Display for WriterAdapter<&'a T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+impl<'a, T: Writer> fmt::Display for WriterAdapter<&'a T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         self.0.write(f)
     }
 }
diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index ab009eb254b3..ad33bfbc7669 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -3,10 +3,10 @@
 
 //! Traits for rendering or updating values exported to DebugFS.
 
+use crate::fmt;
 use crate::prelude::*;
 use crate::sync::Mutex;
 use crate::uaccess::UserSliceReader;
-use core::fmt::{self, Debug, Formatter};
 use core::str::FromStr;
 use core::sync::atomic::{
     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
@@ -24,17 +24,17 @@
 /// explicitly instead.
 pub trait Writer {
     /// Formats the value using the given formatter.
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result;
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result;
 }
 
 impl<T: Writer> Writer for Mutex<T> {
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         self.lock().write(f)
     }
 }
 
-impl<T: Debug> Writer for T {
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T: fmt::Debug> Writer for T {
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         writeln!(f, "{self:?}")
     }
 }

-- 
2.51.1

