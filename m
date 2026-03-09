Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAomIND2rmnZKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:35:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3386D23CC9F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47410E564;
	Mon,  9 Mar 2026 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UyLYSwNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542410E558;
 Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 144166011F;
 Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D450C2BCAF;
 Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773074118;
 bh=gvPoHfp4kILjun0x+PiFZTGPIwNfY5nP6rl8dO323WQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=UyLYSwNI19v9fIU/UbWQcc5LMvSlHh2m1+TmiGF9bUNaACjOvtlccovTSWh9MZjOu
 FRjSnf/V5MzFcFzJlOXhxossZXZYcvi2ULR2U0DcU7BvOSd5AQpdYQPftTVApp3LeC
 DdaoRbnIqtjX4kzODRi7OISkxtYKvCjqe9aamimi8IykwcmXBq2K5mA2e11fF6XfOn
 EEeJuwI3Ay0TEzU5vsUR9rWGgBJg7hT6fDYWpRsSC+GxxkGgxEvGNnAp+yZhvtLemF
 NYfDCOQgK3qCxuv5q0owT3xbZkd9kfsFebgC6HOpEZN3r68PQgLWV5vsPmBJr3pMkD
 rNvIeysjpvkKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 7F83BF41810;
 Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Date: Mon, 09 Mar 2026 12:34:18 -0400
Subject: [PATCH v4 1/4] rust: ptr: add `KnownSize` trait to support DST
 size info extraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-drm-rust-next-v4-1-4ef485b19a4c@proton.me>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Boqun Feng <boqun@kernel.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, driver-core@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773074117; l=2158;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=FheLpAl87yI4UaHfqa3k20aJCUg9ixwJ8DWS/cDgRg4=;
 b=45N81LFvbnZxj7EBp15VjpGQhHombjwrqodP4FxEVsCd0JDjLKei5FWNCjy3jFam1BlfUrrI7
 tx8XLpQNe94AjeTcEcFGAGgbnHF9RBdYUogAKI4RUMXskNkIfccBCVr
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
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
Reply-To: tim.kovalenko@proton.me
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 3386D23CC9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[tim.kovalenko.proton.me];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[tim.kovalenko@proton.me];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

Add a `KnownSize` trait which is used obtain a size from a raw pointer's
metadata. This makes it possible to obtain size information on a raw slice
pointer. This is similar to Rust `core::mem::size_of_val_raw` which is not
yet stable.

Signed-off-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/ptr.rs | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4eed16335c3c251e6bff68dcf7e781e..510cc7fe496113f85c34f420b1c4be95596297ad 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -20,6 +20,7 @@
 #![feature(generic_nonzero)]
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
+#![feature(slice_ptr_len)]
 //
 // Stable since Rust 1.80.0.
 #![feature(slice_flatten)]
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fef11e9c0ae9122906422a970d7fcd..cf980a103acf19ee3bd17bb1dfdbcadfe30467ae 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,7 +2,10 @@
 
 //! Types and functions to work with pointers and addresses.
 
-use core::mem::align_of;
+use core::mem::{
+    align_of,
+    size_of, //
+};
 use core::num::NonZero;
 
 /// Type representing an alignment, which is always a power of two.
@@ -225,3 +228,25 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Trait to represent compile-time known size information.
+///
+/// This is a generalization of what [`size_of`] which works for dynamically sized types.
+pub trait KnownSize {
+    /// Get the size of an object of this type in bytes, with the metadata of the given pointer.
+    fn size(p: *const Self) -> usize;
+}
+
+impl<T> KnownSize for T {
+    #[inline(always)]
+    fn size(_: *const Self) -> usize {
+        size_of::<T>()
+    }
+}
+
+impl<T> KnownSize for [T] {
+    #[inline(always)]
+    fn size(p: *const Self) -> usize {
+        p.len() * size_of::<T>()
+    }
+}

-- 
2.53.0


