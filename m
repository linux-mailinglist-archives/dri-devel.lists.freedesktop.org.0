Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4471C636B9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 11:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DDE10E334;
	Mon, 17 Nov 2025 10:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="qfqQACR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1CA10E330
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1763374098; x=1763633298;
 bh=pb28HdCGm3MdNVkZGIzE5Ia1bSAczOh9PTgSydObUhU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=qfqQACR3EMQ/VXj7DdMIeOQSJBOKwkz0YVM7Rh7/Aqt7XHToWwDO5+5h8e9p71Od8
 fww+ZzgZ5yh+Athct4PLzqZwBrywuoLA5ytS1Bj97PrO5su4sMCq60gBj2NV3e9txR
 PkIdmBHcyF5l6sGl8PPxLA2X2Mdz/s26w1btXKgC2SjWy2GdCmxzQ/mwAgPfdPktJg
 PK8MflXGO4dO2gl2DdF0z7CFNgxrSNMIw4wcXDrk1cxZ+I28dm9SYACznAajqXCckt
 XZ+//7HDASX1RKh6xtp6IUA97jHNNk91dqbzJxt4iwCjYx4tD3nfpn5/Z9N5sdEdEP
 NF26T+J6OGmtw==
Date: Mon, 17 Nov 2025 10:08:10 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-security-module@vger.kernel.org,
 Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v13 3/4] rust: Add missing SAFETY documentation for `ARef`
 example
Message-ID: <20251117-unique-ref-v13-3-b5b243df1250@pm.me>
In-Reply-To: <20251117-unique-ref-v13-0-b5b243df1250@pm.me>
References: <20251117-unique-ref-v13-0-b5b243df1250@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: ae16d73f393bc00b39a87ca6f2993d137d719ee7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

SAFETY comment in rustdoc example was just 'TODO'. Fixed.

Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/aref.rs | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 4226119d5ac9..937dcf6ed5de 100644
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
+    /// // SAFETY: The `RefCounted` implementation for `Empty` does not co=
unt references and
+    /// // never frees the underlying object. Thus we can act as having a =
refcount on the object
+    /// // that we pass to the newly created `ARef`.
     /// unsafe impl RefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
@@ -142,7 +144,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// let mut data =3D Empty {};
     /// let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
-    /// # // SAFETY: TODO.
+    /// // SAFETY: We keep `data` around longer than the `ARef`.
     /// let data_ref: ARef<Empty> =3D unsafe { ARef::from_raw(ptr) };
     /// let raw_ptr: NonNull<Empty> =3D ARef::into_raw(data_ref);
     ///

--=20
2.51.2


