Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86CC16EA2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B8010E664;
	Tue, 28 Oct 2025 21:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M9M6dhWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4E210E664
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761686321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y3nwp4Z0ASTtEBy9o0lzASbp97r7aV+PhV9s+jY8TFw=;
 b=M9M6dhWX6G9pp+yVH14sOvt26weAxiWyAogbn9NhxpC1nvT/KjoNhNBtwS+MLPBtIo20Rx
 IkEu1hnNxIPoom0miIJkE3aC/lhaX9I3UKLazrVwAK32da3gRehmGfsm6iEZlVopqxzs/6
 E0IuJEqZKUcyNE3qfea8uViA9BiFfw0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-103-_q7sbWDIPfC_G3Nhc-J9gg-1; Tue,
 28 Oct 2025 17:18:39 -0400
X-MC-Unique: _q7sbWDIPfC_G3Nhc-J9gg-1
X-Mimecast-MFC-AGG-ID: _q7sbWDIPfC_G3Nhc-J9gg_1761686317
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA6A51800743; Tue, 28 Oct 2025 21:18:36 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.64.42])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 30478180035A; Tue, 28 Oct 2025 21:18:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Subject: [PATCH] rust/dma: Take &mut self in CoherentAllocation::field_write()
Date: Tue, 28 Oct 2025 17:18:01 -0400
Message-ID: <20251028211801.85215-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

At the moment - CoherentAllocation::field_write() only takes an immutable
reference to self. This means it's possible for a user to mistakenly call
field_write() while Rust still has a slice taken out for the coherent
allocation:

  let alloc: CoherentAllocation<CoolStruct> = /* … */;

  let evil_slice = unsafe { alloc.as_slice(/* … */)? };
  dma_write!(alloc[1].cool_field = 42); /* UB! */

Keep in mind: the above example is technically a violation of the safety
contract of as_slice(), so luckily this detail shouldn't currently be
causing any UB in the kernel. But, there's no reason we should be solely
relying on the safety contract for enforcing this when we can just use a
mutable reference and already do so in other parts of the API.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 4e0af3e1a3b9a..e6ac0be80da96 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -611,7 +611,7 @@ pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
     ///
     /// Public but hidden since it should only be used from [`dma_write`] macro.
     #[doc(hidden)]
-    pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
+    pub unsafe fn field_write<F: AsBytes>(&mut self, field: *mut F, val: F) {
         // SAFETY:
         // - By the safety requirements field is valid.
         // - Using write_volatile() here is not sound as per the usual rules, the usage here is
@@ -708,7 +708,7 @@ macro_rules! dma_read {
 /// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
 /// unsafe impl kernel::transmute::AsBytes for MyStruct{};
 ///
-/// # fn test(alloc: &kernel::dma::CoherentAllocation<MyStruct>) -> Result {
+/// # fn test(mut alloc: &mut kernel::dma::CoherentAllocation<MyStruct>) -> Result {
 /// kernel::dma_write!(alloc[2].member = 0xf);
 /// kernel::dma_write!(alloc[1] = MyStruct { member: 0xf });
 /// # Ok::<(), Error>(()) }
@@ -725,7 +725,7 @@ macro_rules! dma_write {
         (|| -> ::core::result::Result<_, $crate::error::Error> {
             let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
             // SAFETY: `item_from_index` ensures that `item` is always a valid item.
-            unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, item, $val) }
+            unsafe { $crate::dma::CoherentAllocation::field_write(&mut $dma, item, $val) }
             ::core::result::Result::Ok(())
         })()
     };
@@ -737,7 +737,7 @@ macro_rules! dma_write {
             // is a member of `item` when expanded by the macro.
             unsafe {
                 let ptr_field = ::core::ptr::addr_of_mut!((*item) $(.$field)*);
-                $crate::dma::CoherentAllocation::field_write(&$dma, ptr_field, $val)
+                $crate::dma::CoherentAllocation::field_write(&mut $dma, ptr_field, $val)
             }
             ::core::result::Result::Ok(())
         })()

base-commit: 3b83f5d5e78ac5cddd811a5e431af73959864390
-- 
2.51.0

