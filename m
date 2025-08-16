Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57EB29092
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 22:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E107910E2EF;
	Sat, 16 Aug 2025 20:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lko3moo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E939410E2EF
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 20:42:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2093C5C53CD;
 Sat, 16 Aug 2025 20:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BEAC4CEEF;
 Sat, 16 Aug 2025 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755376945;
 bh=C0cmruSQBBjqCamTnSvZt6Z6H4u/o6gYc+QMxN0dUNk=;
 h=From:To:Cc:Subject:Date:From;
 b=lko3moo/xtF64BMLgObhQ9pTtT8+94yyOMpKyfWY/CL9Jj7TX0kg4KyDDn7XbC8F+
 038Gw0mj1fT9nd7+uF0+33H8tSqMoa97lD25ath488K9gccVxYeMIlDm5mCyqOKJG8
 4jN6BOkymI/pTpcThhA2akT3UmgD5ikkv/6+3eSAmhiuDYsvWFzw/D0qzJxw5K81MG
 qbWjr7tNJJATQ030RnAan4C6z20cM0J5P3dS1tozu53jQxHEt8XQAcizLqcPRMPIof
 XodD3BktX4yJgtM5OvW8xXw5UWOXruFEVLUyHLtv3NMo8hAiTNcPOj+xcrCuArrMQH
 NmJkkb66fmniQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: [PATCH] rust: alloc: fix `rusttest` by providing
 `Cmalloc::aligned_layout` too
Date: Sat, 16 Aug 2025 22:42:15 +0200
Message-ID: <20250816204215.2719559-1-ojeda@kernel.org>
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

Commit fde578c86281 ("rust: alloc: replace aligned_size() with
Kmalloc::aligned_layout()") provides a public `aligned_layout` function
in `Kamlloc`, but not in `Cmalloc`, and thus uses of it will trigger an
error in `rusttest`.

Such a user appeared in the following commit 22ab0641b939 ("rust: drm:
ensure kmalloc() compatible Layout"):

    error[E0599]: no function or associated item named `aligned_layout` found for struct `alloc::allocator_test::Cmalloc` in the current scope
       --> rust/kernel/drm/device.rs:100:31
        |
    100 |         let layout = Kmalloc::aligned_layout(Layout::new::<Self>());
        |                               ^^^^^^^^^^^^^^ function or associated item not found in `Cmalloc`
        |
       ::: rust/kernel/alloc/allocator_test.rs:19:1
        |
    19  | pub struct Cmalloc;
        | ------------------ function or associated item `aligned_layout` not found for this struct

Thus add an equivalent one for `Cmalloc`.

Fixes: fde578c86281 ("rust: alloc: replace aligned_size() with Kmalloc::aligned_layout()")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Danilo, as usual, please feel free to rebase if that is better.

Here I just copied the function, including comments, as-is, which maybe we want
to tweak. However, we may want to remove `allocator_test` soon anyway (this adds
to the justification for doing that, so that is good news :).

I am sending that one in parallel -- hopefully we can land that removal too in
this cycle, but meanwhile, we can put something like this in your branch.

 rust/kernel/alloc/allocator_test.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
index a3074480bd8d..90dd987d40e4 100644
--- a/rust/kernel/alloc/allocator_test.rs
+++ b/rust/kernel/alloc/allocator_test.rs
@@ -22,6 +22,17 @@
 pub type Vmalloc = Kmalloc;
 pub type KVmalloc = Kmalloc;

+impl Cmalloc {
+    /// Returns a [`Layout`] that makes [`Kmalloc`] fulfill the requested size and alignment of
+    /// `layout`.
+    pub fn aligned_layout(layout: Layout) -> Layout {
+        // Note that `layout.size()` (after padding) is guaranteed to be a multiple of
+        // `layout.align()` which together with the slab guarantees means that `Kmalloc` will return
+        // a properly aligned object (see comments in `kmalloc()` for more information).
+        layout.pad_to_align()
+    }
+}
+
 extern "C" {
     #[link_name = "aligned_alloc"]
     fn libc_aligned_alloc(align: usize, size: usize) -> *mut crate::ffi::c_void;
--
2.50.1
