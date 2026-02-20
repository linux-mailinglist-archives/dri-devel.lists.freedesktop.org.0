Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPewHcIumGlaCQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 10:52:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283991666E4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 10:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F6D10E7A5;
	Fri, 20 Feb 2026 09:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TBlUoq08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB4410E7A5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:51:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5895943BE1;
 Fri, 20 Feb 2026 09:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC2AC116C6;
 Fri, 20 Feb 2026 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771581118;
 bh=B5FbaZHoWu3lXzLWsvxiL2xffXnxnFX4nBQhSLyFXlg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TBlUoq08h8THjyqgOPa5qFuSUJ9EA2rl/GDN9uRVQwt25XUkK2RxR0vWqjtTL+7yR
 cxoufxtl3dRE9KagTQfI7RkbgRykxBYpq8jJ357TWuSs3n6WeNy78TnJ/OsGZlbPKT
 Thm6Otw7Q8bFXfFocqjTXBUKiV7Vq5W/wpQDQS4W6T/s8x/iBPpgcY0S/jf3hOLE33
 0EliLnOFmz9t6PWADdrJir83Vzp8lwr1ATpcd8KGS9kH3OtcrnuhXChO/0fBhJkudy
 zok60YIdfXuLJ3TKGwePrpf4o1T+iRXL6mZVb9VWayQRcEU3mgx8PQfbIuGjqMAxUD
 GWwJKsOvDrPrg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Feb 2026 10:51:17 +0100
Subject: [PATCH v15 8/9] rust: implement `ForeignOwnable` for `Owned`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-unique-ref-v15-8-893ed86b06cc@kernel.org>
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
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2835; i=a.hindborg@kernel.org; 
 h=from:subject:message-id;
 bh=B5FbaZHoWu3lXzLWsvxiL2xffXnxnFX4nBQhSLyFXlg=; 
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpmC6lQ8ViWhXfTBxkBwYXwCvpZEQQpsFdLjSWt
 Z/0DPcp01iJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZgupQAKCRDhuBo+eShj
 dynCD/wPCHcbzgHFtI1xHdF07F3Sl7RvyuqebxX7QafkNthmS2wK+6fYvfrTUdnL1z/OBT1a29v
 Ekv+847w5ksZlRBgGMKWxazpNxfKF5eWQvBoKPWlYxkyWDMvo5kyar5hxw0w3x3COrfeu9QKl56
 KhsRSpsbaevfgdJSut7YliqvTpAiGKoUhon8VZJN9MfpgxHFA8h4daaTbVL7VknN+9j2z7j7sy1
 Sgk87Kl23zumku0CP8xCTL/v2iQdTZkeAo0DqBaYMIqW99TDPpzpfzfY0vMKWUdz3CKfi0NVOL1
 ha+JjyDc1y9rbdiDLBax6CvmSMa3YTUcETVRBpfR1iK9Nv5jfwJ/ahTThdwfuq27a98NOsjeZM7
 xSMg0DOPOZm2bogbOUFEwQxYUeZawSZw5998KQzSnn9YHKJwKEyRhqKqLDSfv8O35BgPsTCYfZx
 ulAarVM09f3S8iZXGFdpWCwIIZXvoyMEV5vsnhvNxrcgESzwem5PCkmknWlGyJB4BTjaB7CVwu4
 EhB+2yo3w2A6G3YxFFEK2Y+4pBEXalKlRTVLSKaOAPoKkXmw4MtJptUOgpKFlnAlWsJJPvDVAPX
 Zj4fG0pZkGwmYQf3x8c6EhW/QFvUIWp3kCah+QYzszA1iz7lJcu0LsCpfHpmCOqa9mFhCq4JFVx
 H3Cwg/+isbapMRQ==
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
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:a.hindborg@kernel.org,m:igorkorotinlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 283991666E4
X-Rspamd-Action: no action

Implement `ForeignOwnable` for `Owned<T>`. This allows use of `Owned<T>` in
places such as the `XArray`.

Note that `T` does not need to implement `ForeignOwnable` for `Owned<T>` to
implement `ForeignOwnable`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/owned.rs | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/owned.rs b/rust/kernel/owned.rs
index a9bc871e07ce1..b115b4f3db6d0 100644
--- a/rust/kernel/owned.rs
+++ b/rust/kernel/owned.rs
@@ -16,7 +16,10 @@
 };
 use kernel::{
     sync::aref::ARef,
-    types::RefCounted, //
+    types::{
+        ForeignOwnable, //
+        RefCounted,
+    }, //
 };
 
 /// Types that specify their own way of performing allocation and destruction. Typically, this trait
@@ -120,6 +123,7 @@ pub unsafe trait Ownable {
 ///
 /// - The [`Owned<T>`] has exclusive access to the instance of `T`.
 /// - The instance of `T` will stay alive at least as long as the [`Owned<T>`] is alive.
+#[repr(transparent)]
 pub struct Owned<T: Ownable> {
     ptr: NonNull<T>,
 }
@@ -201,6 +205,45 @@ fn drop(&mut self) {
     }
 }
 
+// SAFETY: We derive the pointer to `T` from a valid `T`, so the returned
+// pointer satisfy alignment requirements of `T`.
+unsafe impl<T: Ownable + 'static> ForeignOwnable for Owned<T> {
+    const FOREIGN_ALIGN: usize = core::mem::align_of::<Owned<T>>();
+
+    type Borrowed<'a> = &'a T;
+    type BorrowedMut<'a> = Pin<&'a mut T>;
+
+    fn into_foreign(self) -> *mut kernel::ffi::c_void {
+        let ptr = self.ptr.as_ptr().cast();
+        core::mem::forget(self);
+        ptr
+    }
+
+    unsafe fn from_foreign(ptr: *mut kernel::ffi::c_void) -> Self {
+        Self {
+            // SAFETY: By function safety contract, `ptr` came from
+            // `into_foreign` and cannot be null.
+            ptr: unsafe { NonNull::new_unchecked(ptr.cast()) },
+        }
+    }
+
+    unsafe fn borrow<'a>(ptr: *mut kernel::ffi::c_void) -> Self::Borrowed<'a> {
+        // SAFETY: By function safety requirements, `ptr` is valid for use as a
+        // reference for `'a`.
+        unsafe { &*ptr.cast() }
+    }
+
+    unsafe fn borrow_mut<'a>(ptr: *mut kernel::ffi::c_void) -> Self::BorrowedMut<'a> {
+        // SAFETY: By function safety requirements, `ptr` is valid for use as a
+        // unique reference for `'a`.
+        let inner = unsafe { &mut *ptr.cast() };
+
+        // SAFETY: We never move out of inner, and we do not hand out mutable
+        // references when `T: !Unpin`.
+        unsafe { Pin::new_unchecked(inner) }
+    }
+}
+
 /// A trait for objects that can be wrapped in either one of the reference types [`Owned`] and
 /// [`ARef`].
 ///

-- 
2.51.2


