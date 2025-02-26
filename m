Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367E9A46896
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A017310E990;
	Wed, 26 Feb 2025 17:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CmJCfdLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B96710E990;
 Wed, 26 Feb 2025 17:56:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D4E55C7418;
 Wed, 26 Feb 2025 17:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C93C4CED6;
 Wed, 26 Feb 2025 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740592575;
 bh=hcX6vOhc/N2TdsfmPWsvTjfv/VFUxahP3QLm3YU+4SY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CmJCfdLhiLcwaqKbhTbzSCdKnpoPR/bTAd2nd1BfHdIiRvJkWywE91qRT3qSQw5kc
 9/+/9e0qLWlX5wNOaQ4wC51oHAkk735O9a7sP6TQhUHUdC05ViWD7dSS/pnwgacA/n
 M9uDFaehiKH18bGECWJTOzjImtD6bdZ7vRO+OkpWSJR8x+3tNTNtmyaybR9ZCirCIV
 KA1bRqW1sHlhVYeeJo4v3OM9RINHsybzIujLiBTrpZ85EFM+g5PMeCGhle5TF8l1ka
 NwyHLEDYvU6dYvmKIZ1WAnO8annjXgb1baNvk37u0w3NxdT3YPlSULYCC0Fo6QBAEV
 e+pgPWAUpKycg==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 mcgrof@kernel.org, russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 2/6] rust: str: provide const fn as_bytes() for BStr
Date: Wed, 26 Feb 2025 18:55:44 +0100
Message-ID: <20250226175552.29381-3-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226175552.29381-1-dakr@kernel.org>
References: <20250226175552.29381-1-dakr@kernel.org>
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

`BStr` already dereference to `&[u8]` through the `Deref` trait,
however, this can't be called from const context.

Hence, provide a separate const function for this.

This is used in subsequent nova-core patches.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 28e2201604d6..71e8a819016d 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -31,6 +31,12 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
         // SAFETY: `BStr` is transparent to `[u8]`.
         unsafe { &*(bytes as *const [u8] as *const BStr) }
     }
+
+    /// Same as `self.deref()`, but works in const context.
+    #[inline]
+    pub const fn as_bytes(&self) -> &[u8] {
+        &self.0
+    }
 }
 
 impl fmt::Display for BStr {
-- 
2.48.1

