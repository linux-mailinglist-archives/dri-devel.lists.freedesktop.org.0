Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMVQI3OugWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:14:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E29D6125
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C34E10E579;
	Tue,  3 Feb 2026 08:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PQ0J6jRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC8510E56A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 08:14:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E4CD2408A8;
 Tue,  3 Feb 2026 08:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EC8C19421;
 Tue,  3 Feb 2026 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770106479;
 bh=+vC2aosMFk7TAuVXidYijONEtqq2NTUeKHA8bbK0DN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PQ0J6jRylrunBvIq7xYaf/tUum/oiLRCk3qOT4PPsIqidyJ1PhBod8TjAM+BWNmm7
 DWU4sXvrQ87RQVqQfRZ9yvdjmeUOZZtx9dpXsJ4JoMihakbrnF+LgAQkmJ3eRmheaw
 +//SDdR+LIpmauXfp00UbJpc9NhEly90wYdLYzKoo/CRYIf845r3xOgexLmcRZeJFY
 mQNUI2wPEZmhqssUdw5ibhxZgpoGb0ybqrUg5iGQ7L9O5TKe/hfD5t0/40rlqHWb93
 JJzDBY99A/+83Z9A3PooZkvvignXovLR7ar1wibPbRrCT8twqBT0YoQbB4dcTcn7d0
 8oeIt3X6ZSLkQ==
From: Philipp Stanner <phasta@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Philipp Stanner <phasta@kernel.org>,
 stable@vger.kernel.org
Subject: [RFC PATCH 1/4] rust: list: Add unsafe for container_of
Date: Tue,  3 Feb 2026 09:14:00 +0100
Message-ID: <20260203081403.68733-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203081403.68733-2-phasta@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phasta@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:phasta@kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,kernel.org,google.com,garyguo.net,amd.com,collabora.com,nvidia.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,impl_list_item_mod.rs:url]
X-Rspamd-Queue-Id: 04E29D6125
X-Rspamd-Action: no action

impl_list_item_mod.rs calls container_of() without unsafe blocks at a
couple of places. Since container_of() is an unsafe macro / function,
the blocks are strictly necessary.

For unknown reasons, that problem was so far not visible and only gets
visible once one utilizes the list implementation from within the core
crate:

error[E0133]: call to unsafe function `core::ptr::mut_ptr::<impl *mut T>::byte_sub`
is unsafe and requires unsafe block
   --> rust/kernel/lib.rs:252:29
    |
252 |           let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
    |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^ call to unsafe function
    |
   ::: rust/kernel/drm/jq.rs:98:1
    |
98  | / impl_list_item! {
99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links }; }
100 | | }
    | |_- in this macro invocation
    |
note: an unsafe function restricts its caller, but its body is safe by default
   --> rust/kernel/list/impl_list_item_mod.rs:216:13
    |
216 |               unsafe fn view_value(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
    |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
   ::: rust/kernel/drm/jq.rs:98:1
    |
98  | / impl_list_item! {
99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links }; }
100 | | }
    | |_- in this macro invocation
    = note: requested on the command line with `-D unsafe-op-in-unsafe-fn`
    = note: this error originates in the macro `$crate::container_of` which comes
    from the expansion of the macro `impl_list_item`

Add unsafe blocks to container_of to fix the issue.

Cc: stable@vger.kernel.org # v6.17+
Fixes: c77f85b347dd ("rust: list: remove OFFSET constants")
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/list/impl_list_item_mod.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
index 202bc6f97c13..7052095efde5 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -217,7 +217,7 @@ unsafe fn view_value(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
                 // SAFETY: `me` originates from the most recent call to `prepare_to_insert`, so it
                 // points at the field `$field` in a value of type `Self`. Thus, reversing that
                 // operation is still in-bounds of the allocation.
-                $crate::container_of!(me, Self, $($field).*)
+                unsafe { $crate::container_of!(me, Self, $($field).*) }
             }
 
             // GUARANTEES:
@@ -242,7 +242,7 @@ unsafe fn post_remove(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
                 // SAFETY: `me` originates from the most recent call to `prepare_to_insert`, so it
                 // points at the field `$field` in a value of type `Self`. Thus, reversing that
                 // operation is still in-bounds of the allocation.
-                $crate::container_of!(me, Self, $($field).*)
+                unsafe { $crate::container_of!(me, Self, $($field).*) }
             }
         }
     )*};
@@ -270,9 +270,9 @@ unsafe fn prepare_to_insert(me: *const Self) -> *mut $crate::list::ListLinks<$nu
                 // SAFETY: The caller promises that `me` points at a valid value of type `Self`.
                 let links_field = unsafe { <Self as $crate::list::ListItem<$num>>::view_links(me) };
 
-                let container = $crate::container_of!(
+                let container = unsafe { $crate::container_of!(
                     links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
-                );
+                ) };
 
                 // SAFETY: By the same reasoning above, `links_field` is a valid pointer.
                 let self_ptr = unsafe {
@@ -319,9 +319,9 @@ unsafe fn view_links(me: *const Self) -> *mut $crate::list::ListLinks<$num> {
             //   `ListArc` containing `Self` until the next call to `post_remove`. The value cannot
             //   be destroyed while a `ListArc` reference exists.
             unsafe fn view_value(links_field: *mut $crate::list::ListLinks<$num>) -> *const Self {
-                let container = $crate::container_of!(
+                let container = unsafe { $crate::container_of!(
                     links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
-                );
+                ) };
 
                 // SAFETY: By the same reasoning above, `links_field` is a valid pointer.
                 let self_ptr = unsafe {
-- 
2.49.0

