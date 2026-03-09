Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFRYFBT9rmkxLQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:02:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A637B23D472
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943AB10E56F;
	Mon,  9 Mar 2026 17:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vGQaIc0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE5310E56F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 17:02:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A6C443200;
 Mon,  9 Mar 2026 17:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31E7C4CEF7;
 Mon,  9 Mar 2026 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773075728;
 bh=3uq35Ktmul8lpGjhELuw35FYfyLMGaLFJUwwLb4+sqk=;
 h=From:Date:Subject:To:Cc:From;
 b=vGQaIc0lzv94/DjCNdOx3HxYGXxjHc6qx9q1d91GLq5/o3T03wVt2wH+pdUTpPYv7
 rb90DuZ1Aydd0zJPwPbsMTU/wrE/Mx4wn5rnPUe1ALUpeairiFaK9G22SYA65+LH1V
 16AH+15ktsUg5Y/rb7noPGX+CyHqOP0Dgkg0RMP3wiNCoOcyBHoO0uctz44N7nWcxw
 /1Whozd6GsDVxtLBsA09v0f0twG//xThJw4k0Aqqk4U1BwG0K+2y29DtUp6G19IZgE
 3jh1YW42LdYFJlKCH0KwiKiYmwv+CCtrs5pFnbpV2XSwVT6kZgZgOfOOwUOITcQt5A
 RNT3eotrqExaQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 09 Mar 2026 13:01:57 -0400
Subject: [PATCH v2] rust: update `kernel::c_str!` documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7Zi2kCa48h6GRSkDVKUlUyQaw
 t1tce/yJe+/v0EkdhThUmzAtLrogk+gTgXY0fiB0HWJQQmlRSkU2rgwMnkzEU7GckBdKSFb0rb
 WNaTdzNS799G8NT+Or/ZOdsmhbIwuLoE/x+kqs/evv0qUaJSue6o6W/bi+iD29DwHHqDZ9/0Ln
 xlhYsUAAAA=
X-Change-ID: 20260302-cstr-rename-macro-64201be6c969
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Breno Leitao <leitao@debian.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2588; i=tamird@kernel.org;
 h=from:subject:message-id; bh=3uq35Ktmul8lpGjhELuw35FYfyLMGaLFJUwwLb4+sqk=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJnr/rJ/Tal7XLv2ZHIAx++NsRPfc24IZ3B7lGztnlRuV
 JeY+jS6o5SFQYyLQVZMkSVR9NDe9NTbe2Qz3x2HmcPKBDKEgYtTACZy7SHDbzbpKayz/LZbF89M
 uRfLbJy/0uS7XH6N89s/e72TpsRPF2T4Z52eW/VSNnZ59JYzP7q/aPr6rd424aVut/WP3ad8c4O
 OsQEA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
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
X-Rspamd-Queue-Id: A637B23D472
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:leitao@debian.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:brendan.higgins@linux.dev,m:davidgow@google.com,m:raemoar63@gmail.com,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:longman@redhat.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:gregkh@linuxfoundation.org,m:tamird@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tamird@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,debian.org,gmail.com,ffwll.ch,linux.dev,infradead.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,msgid.link:url]
X-Rspamd-Action: no action

Now that all literals are C-Strings, update the documentation to explain
that use of this macro should be limited to non-literal strings.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
This patch completes the work of replacing our custom `CStr` with
upstream's.
---
Changes in v2:
- Drop rename, keep only documentation update. (Gary Guo)
- Add example of misuse to documentation. (Gary Guo)
- Link to v1: https://patch.msgid.link/20260302-cstr-rename-macro-v1-1-a269fe4dc3f0@kernel.org
---
 rust/kernel/str.rs | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fa87779d2253..6dae82e7d875 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -376,19 +376,32 @@ fn as_ref(&self) -> &BStr {
     }
 }
 
-/// Creates a new [`CStr`] from a string literal.
+/// Creates a new [`CStr`] at compile time.
 ///
-/// The string literal should not contain any `NUL` bytes.
+/// Rust supports C string literals since Rust 1.77, and they should be used instead of this macro
+/// where possible. This macro exists to allow static *non-literal* C strings to be created at
+/// compile time. This is most often used in other macros.
+///
+/// # Panics
+///
+/// This macro panics if the operand contains an interior `NUL` byte.
 ///
 /// # Examples
 ///
 /// ```
 /// # use kernel::c_str;
 /// # use kernel::str::CStr;
-/// const MY_CSTR: &CStr = c_str!("My awesome CStr!");
+/// // This is allowed, but `c"literal"` should be preferred for literals.
+/// const BAD: &CStr = c_str!("literal");
+///
+/// // `c_str!` is still needed for static non-literal C strings.
+/// const GOOD: &CStr = c_str!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
 macro_rules! c_str {
+    // NB: we could write `($str:lit) => compile_error!("use a C string literal instead");` here but
+    // that would trigger when the literal is at the top of several macro expansions. That would be
+    // too limiting to macro authors.
     ($str:expr) => {{
         const S: &str = concat!($str, "\0");
         const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260302-cstr-rename-macro-64201be6c969

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

