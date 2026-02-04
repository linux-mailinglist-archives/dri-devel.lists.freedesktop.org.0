Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFhjInU0g2kwjAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:58:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C39E56A3
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F57C10E624;
	Wed,  4 Feb 2026 11:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gz7NyLru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392E310E624
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 11:58:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1ECFA437CB;
 Wed,  4 Feb 2026 11:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB73C4CEF7;
 Wed,  4 Feb 2026 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770206321;
 bh=4kJUgBgTj0V7kRaDlo9MltCBPjRgIT4dj8eMOKXfB5o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Gz7NyLruiwim/m3qBSE5DCyGcBGfDnNAOVb4JpibsYAUsWYSmm1MpCPHgWwtj/fRE
 e8VUFzL72M3Zx6A1qZzoh/IA8ii2wIC7I4cJhh+uULDLUPyMKnEvCcEKQxVOEmnib9
 DoSHh3MiiduX7HJcOEoYvDR16yqzuWAG0XdMb3TjJ4hksqK25J8oJA81S9JdyO6hKT
 KumBA+dRzkFBjLvTQYFQ6GwuEX6rkbvQzlazbWUeATLs2BAmRQQCZoHCpYtJV8wBG0
 WlW6SNySBC1jA+L56+L0NXtFEY6GCjF7HOrLV7AMDGIWW1Tfv0xJw3TcrW5yiutEIv
 NrzqX1zgg14vw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 04 Feb 2026 12:56:53 +0100
Subject: [PATCH v14 9/9] rust: page: add `from_raw()`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-unique-ref-v14-9-17cb29ebacbb@kernel.org>
References: <20260204-unique-ref-v14-0-17cb29ebacbb@kernel.org>
In-Reply-To: <20260204-unique-ref-v14-0-17cb29ebacbb@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
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
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=a.hindborg@kernel.org; 
 h=from:subject:message-id;
 bh=4kJUgBgTj0V7kRaDlo9MltCBPjRgIT4dj8eMOKXfB5o=; 
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpgzQGWPeTkfQ596Yd1NnAfAqNezMquqK4g6o3T
 qdh/ZoqiCOJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYM0BgAKCRDhuBo+eShj
 d4iLD/9Q3u3EUkTrf71/HDEO1t/JE9RtrcE59R/WUUVHVBm36/KFnyuhWlTrS9tw/VZFWtGQ8So
 sTWdaMtJWEC2q3QQRpNIfuFJ+Z/+jGK5LZPDwn9KXSQXO72OFyCHmoxZ8S49BGHkcXC5J36BddJ
 oBhV1NXLnyPAz4PFYpxCpsyaIvY/ndPSnFXUaDUitUS6k8jXTbQnIThXtMjwRQYwvoZ/WV124sk
 UEf0NZdBT/tTHHljmTjmsBsfh/s31GgbOsBRNZlgQbEn1nfIKUv8rkWWsiMc2z5/CrZPZFNLLc2
 dvo/sOb/S1/XSyhIfdqBW5nu6XT3aIsRyQBNla6glkOxnRCPVwGnA0cVqLJSwGDC7HwdjQp8tg3
 6OpsRLLpT8i9c7RUWvazHkNpzYJVUiCdPvQ6bTtgozQcZ3XftPlRnYqaUc0MKuQrDp32ITc1Qpf
 2+NdHl7Ap0HGYUDWUouSvjzXWw3qRpzVu9MDGgzT/Ov44EEz/z8ouTVC8G5/wtYG2DvJ2Vt29g9
 weNYSK06rZyCIJ+f9S4SG6AsSmYmsH717vhWbdgv70nWR1sWbtA2U+0U94cRyNxeQLnmIvuY9CJ
 jUyG0IGKuA+MPWHoxjeNdu0VkFmHoW388Q536eQxeCfpBS7lljXv3TWUIUBmJqIKc7HOg81GZK1
 dE20j3imAjE0sfg==
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
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:a.hindborg@kernel.org,m:boqunfeng@gmail.com,m:igorkorotinlinux@gmail.com,s:lists@lfdr.
 de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,samsung.com:email]
X-Rspamd-Queue-Id: E8C39E56A3
X-Rspamd-Action: no action

Add a method to `Page` that allows construction of an instance from `struct
page` pointer.

Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
---
 rust/kernel/page.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 4591b7b01c3d2..803f3e3d76b22 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -191,6 +191,17 @@ pub fn nid(&self) -> i32 {
         unsafe { bindings::page_to_nid(self.as_ptr()) }
     }
 
+    /// Create a `&Page` from a raw `struct page` pointer
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be valid for use as a reference for the duration of `'a`.
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::page) -> &'a Self {
+        // SAFETY: By function safety requirements, ptr is not null and is
+        // valid for use as a reference.
+        unsafe { &*Opaque::cast_from(ptr).cast::<Self>() }
+    }
+
     /// Runs a piece of code with this page mapped to an address.
     ///
     /// The page is unmapped when this call returns.

-- 
2.51.2


