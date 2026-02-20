Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJedGOIumGkzCQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 10:52:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D2166732
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 10:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E8F10E7B9;
	Fri, 20 Feb 2026 09:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d6XvHSje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6079410E7B9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:52:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 46B0F43BE1;
 Fri, 20 Feb 2026 09:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF9CC116C6;
 Fri, 20 Feb 2026 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771581150;
 bh=p1tAAxGtFcTpyH8kJIKfeUGx7oWCMIhnPZTORNKDSkA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=d6XvHSjei+/LwJ6azNn0RPBMuwdHY2AUX0AF3emYW7STF/HogUS8+EUDj3T/d19XL
 M63tMOohnyibTXmGAA8TjFTHjntaGwGgaWECiP1PdArTlNK6cF+a8rn77fraqEu+l9
 rn4fJ/3HCn2AgMP6t4ZiM/z1B6w0A1LmozVngj7jLLVZsyjZdW4/HiMQDPyiE6cNMI
 nfC64/bFJMDvOeTurZ43+8l5zYJaQm2IBou+xxGbOSbBAnkOr723pFGtHUjzOeMbfI
 a92ibJGQDcq5yHyAYOwdM9XEoJFtH8+0zVarlQ9bdDXdTxUaadxXKkMTGrInY8ibAE
 X3eDPCS21Z1EA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Feb 2026 10:51:12 +0100
Subject: [PATCH v15 3/9] rust: Add missing SAFETY documentation for `ARef`
 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-unique-ref-v15-3-893ed86b06cc@kernel.org>
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org>
In-Reply-To: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
 Serge Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Oliver Mangold <oliver.mangold@pm.me>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777; i=a.hindborg@kernel.org; 
 h=from:subject:message-id;
 bh=0VuAJevCkYFZAUYzbU/zIm1O124y3qethT0WcgbappU=; 
 b=owEBbAKT/ZANAwAKAeG4Gj55KGN3AcsmYgBpmC6g+5r9c8hNIwBUmEKkWqrvZg384pxiRXLng
 +3sV++OUXmJAjIEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZguoAAKCRDhuBo+eShj
 d5gpD/jlKR4PuCzBrXKPcsSwhxSkegz1CUJdeYgrGfzZ9wRiOA/5ps4xbsU55RhyGnWoOb0+UvN
 QLyLhxhnDxODib1nUdt+EH74woUiQ1+tSfuwhD/bmb2FztVhX3YKoEIkULGbHAx7bZMUJVOxEKa
 FTaTy3ZNbg3E9hVWN3t0ZptiN7JGgd+inoLuRa9KrdX9z+nRozTCjZvNFqLryaBWUjuFU86k5UB
 ndhZG3zO3CHLHZ3z+qqqDH5U/qFXlhUm5dto71y9MBC57gO+G/fnEPs1340ZkwHrJUrSZ2RRhng
 vOz2ypc4kr7lIgN8Tn7SoifY0uYtm/8mKwDLDehcon3lIy6oZMQalCOO8kvFlSGwHiblbqE/Ibk
 FP+61QHkX7mYrBRbYPsNJqbi25f/rIUbNGNMfHo18A/2rmSA16Ds2/5vlwny+0hxv96/dQXcNXa
 2JpXulj0V+7noIw53LO/jknBTxQuYwd74HeM9KGf5ilIhCgdD9cQBxuvEPa3spLHS4xCVcSKCW5
 ukWuT4E7G7nRnUgSvozkeLAmTJqIWoNZFw2ZCTbmePW9Kbta+NjprXLwLR+a7Jrv1ch2bGyV6dK
 oUFVz73j3T569jm9Nl4Fyf8gsz/VEi/Q1MU5ShzSbfQjtr5+AfgxWjMQb9XxQkSWc4kBeFvYT0a
 wHpjkhcaZd+5z
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:a.hindborg@kernel.org,m:oliver.mangold@pm.me,m:igorkorotinlinux@gmail.com,s:lists@lfdr.de]
 ;
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 132D2166732
X-Rspamd-Action: no action

From: Oliver Mangold <oliver.mangold@pm.me>

SAFETY comment in rustdoc example was just 'TODO'. Fixed.

Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/aref.rs | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 61caddfd89619..efe16a7fdfa5d 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -129,12 +129,14 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     /// # Examples
     ///
     /// ```
-    /// use core::ptr::NonNull;
-    /// use kernel::sync::aref::{ARef, RefCounted};
+    /// # use core::ptr::NonNull;
+    /// # use kernel::sync::aref::{ARef, RefCounted};
     ///
     /// struct Empty {}
     ///
-    /// # // SAFETY: TODO.
+    /// // SAFETY: The `RefCounted` implementation for `Empty` does not count references and never
+    /// // frees the underlying object. Thus we can act as owning an increment on the refcount for
+    /// // the object that we pass to the newly created `ARef`.
     /// unsafe impl RefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
@@ -142,7 +144,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// let mut data = Empty {};
     /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
-    /// # // SAFETY: TODO.
+    /// // SAFETY: We keep `data` around longer than the `ARef`.
     /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
     /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
     ///

-- 
2.51.2


