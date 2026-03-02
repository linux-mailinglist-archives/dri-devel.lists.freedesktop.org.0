Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDO0K+zGpWnEFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:20:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14351DDB8D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EE710E528;
	Mon,  2 Mar 2026 17:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P4TZfXyi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1360110E528
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 17:20:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 065BA60018;
 Mon,  2 Mar 2026 17:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84477C19423;
 Mon,  2 Mar 2026 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772472038;
 bh=G0tbNLTu0S+3NlNqEOJKZh3E1i+PNvPaCT+xkj3RuA4=;
 h=From:Date:Subject:To:Cc:From;
 b=P4TZfXyiPbOZRK39v1oQOIZyHQghPqrj4G84BeHW7Uk181NPqVbeyqDkhmdINCL81
 qNAQXSTfe/ID4vpXl3jTEKy3rN/ZLpSVjUedezyuB1riG6mtQxqlsGHqDioPMPh74d
 Yqj2OjRsxKxDkuJqnBhPc7LBZtundWOmDQpyC2oU8jsIadjeAblMH7FAZ8Po9qe3JI
 eiTMVrwOPiPg5Nu8jZyRH3myP0rL9/Qdgjd1qMNv0i9F+cLZoaG80z1ZLDUS30wDfJ
 v4LcLiTDo6XpU4REgwHP+HjJ9HcuCz3Efpo9aaWoAniP/BiD3rEuby+kXszwkQMyEt
 6rR8WIMtcJGYw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 02 Mar 2026 12:20:35 -0500
Subject: [PATCH] rust: rename `kernel::c_str!` to `str_to_cstr!`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cstr-rename-macro-v1-1-a269fe4dc3f0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxG4auUrA1MpzJQryIupumvRuhUklaE0
 rs76vJbvLeRwxROp2Yjw0td51LRHhqSey43sI7VFENMoQuRxRdjQ8kTeMpiM6djDO2AJH3qqXZ
 Pw1Xfv+f58revwwOyfEe07x/+7+gTdQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7334; i=tamird@kernel.org;
 h=from:subject:message-id; bh=G0tbNLTu0S+3NlNqEOJKZh3E1i+PNvPaCT+xkj3RuA4=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlLjz0pTNdQj0zSYhfhuf+h1Gxx3t7Z735LXXNaeIl1p
 /iH753JHaUsDGJcDLJiiiyJoof2pqfe3iOb+e44zBxWJpAhDFycAjCRjAaG/5Xx5/ZrBC9Mm/7H
 rPeWnbgvZ/mvs23iXVO2VS6ZpveEo4vhf6qpiEiMqJqMa0mizoKsB7nxc4RLFcqf3XtWHfZv1Wl
 jdgA=
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
X-Rspamd-Queue-Id: E14351DDB8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linuxfoundation.org:email]
X-Rspamd-Action: no action

Now that all literals are C-Strings, rename and update the documentation
of this macro to clarify its intended purpose.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
This patch completes the work of replacing our custom `CStr` with
upstream's.
---
 rust/kernel/bug.rs              |  2 +-
 rust/kernel/configfs.rs         |  2 +-
 rust/kernel/drm/ioctl.rs        |  2 +-
 rust/kernel/kunit.rs            |  3 ++-
 rust/kernel/str.rs              | 19 ++++++++++++++-----
 rust/kernel/sync.rs             |  4 ++--
 rust/kernel/sync/lock/global.rs |  3 ++-
 rust/kernel/workqueue.rs        |  6 +++---
 8 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..f7cb673b1766 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -80,7 +80,7 @@ macro_rules! warn_flags {
         // with a valid null-terminated string.
         unsafe {
             $crate::bindings::warn_slowpath_fmt(
-                $crate::c_str!(::core::file!()).as_char_ptr(),
+                $crate::str_to_cstr!(::core::file!()).as_char_ptr(),
                 line!() as $crate::ffi::c_int,
                 $flags as $crate::ffi::c_uint,
                 ::core::ptr::null(),
diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 2339c6467325..930f17bb2041 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -1000,7 +1000,7 @@ macro_rules! configfs_attrs {
                         $crate::configfs::Attribute<$attr, $data, $data> =
                             unsafe {
                                 $crate::configfs::Attribute::new(
-                                    $crate::c_str!(::core::stringify!($name)),
+                                    $crate::str_to_cstr!(::core::stringify!($name)),
                                 )
                             };
                 )*
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index cf328101dde4..6a87f489dc88 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -157,7 +157,7 @@ macro_rules! declare_drm_ioctls {
                     },
                     flags: $flags,
                     name: $crate::str::as_char_ptr_in_const_context(
-                        $crate::c_str!(::core::stringify!($cmd)),
+                        $crate::str_to_cstr!(::core::stringify!($cmd)),
                     ),
                 }
             ),*];
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index f93f24a60bdd..5802a3507ecc 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -59,7 +59,8 @@ macro_rules! kunit_assert {
 
             static FILE: &'static $crate::str::CStr = $file;
             static LINE: i32 = ::core::line!() as i32 - $diff;
-            static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
+            static CONDITION: &'static $crate::str::CStr =
+                $crate::str_to_cstr!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
             let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fa87779d2253..8bb40de007d4 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -376,19 +376,28 @@ fn as_ref(&self) -> &BStr {
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
-/// # use kernel::c_str;
+/// # use kernel::str_to_cstr;
 /// # use kernel::str::CStr;
-/// const MY_CSTR: &CStr = c_str!("My awesome CStr!");
+/// const MY_CSTR: &CStr = str_to_cstr!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
-macro_rules! c_str {
+macro_rules! str_to_cstr {
+    // NB: we could write `($str:lit) => compile_error!("use a C string literal instead");` here but
+    // that would trigger when the literal is at the top of several macro expansions. That would be
+    // too limiting to macro authors, so we rely on the name as a hint instead.
     ($str:expr) => {{
         const S: &str = concat!($str, "\0");
         const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 993dbf2caa0e..ecf02a67ec35 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -154,9 +154,9 @@ macro_rules! static_lock_class {
 #[macro_export]
 macro_rules! optional_name {
     () => {
-        $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()))
+        $crate::str_to_cstr!(::core::concat!(::core::file!(), ":", ::core::line!()))
     };
     ($name:literal) => {
-        $crate::c_str!($name)
+        $crate::str_to_cstr!($name)
     };
 }
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index aecbdc34738f..81f46229be7d 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -272,7 +272,8 @@ macro_rules! global_lock {
         $pub enum $name {}
 
         impl $crate::sync::lock::GlobalLockBackend for $name {
-            const NAME: &'static $crate::str::CStr = $crate::c_str!(::core::stringify!($name));
+            const NAME: &'static $crate::str::CStr =
+                $crate::str_to_cstr!(::core::stringify!($name));
             type Item = $valuety;
             type Backend = $crate::global_lock_inner!(backend $kind);
 
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..7616d71df68e 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -212,7 +212,7 @@ macro_rules! new_delayed_work {
         $crate::workqueue::DelayedWork::new(
             $crate::optional_name!(),
             $crate::static_lock_class!(),
-            $crate::c_str!(::core::concat!(
+            $crate::str_to_cstr!(::core::concat!(
                 ::core::file!(),
                 ":",
                 ::core::line!(),
@@ -223,9 +223,9 @@ macro_rules! new_delayed_work {
     };
     ($name:literal) => {
         $crate::workqueue::DelayedWork::new(
-            $crate::c_str!($name),
+            $crate::str_to_cstr!($name),
             $crate::static_lock_class!(),
-            $crate::c_str!(::core::concat!($name, "_timer")),
+            $crate::str_to_cstr!(::core::concat!($name, "_timer")),
             $crate::static_lock_class!(),
         )
     };

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260302-cstr-rename-macro-64201be6c969

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

