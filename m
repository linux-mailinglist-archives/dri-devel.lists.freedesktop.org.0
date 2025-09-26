Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B894EBA3C26
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0150510EA5C;
	Fri, 26 Sep 2025 13:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qye7OXoc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7E110EA5B;
 Fri, 26 Sep 2025 13:06:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3757740490;
 Fri, 26 Sep 2025 13:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E40C4CEF7;
 Fri, 26 Sep 2025 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758891998;
 bh=FKkIiVgmauLuoE4CX7B/Gf3qfhdLuT98aa1FlsvPKNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qye7OXoc8nQAt5arXQCUc8aIsOoCDhga+O7gMNme9J0DVX2unt9QnkQ/Nr8cFrLSF
 yp/uWYn977vQvTj5Q6Yl7ehiduaqR0JqvrMnrqoziKn9+wvn5vnDn7q/LeWLn24PrG
 HwpAIirADiCEFsPVvegGkzKC9BI4AcHripjywC59vQZ2BJU8Ug2M4Qt+WCeQeTEHP4
 IghEV8SEa3/94sMOX0+ZtvAAyFSOfUxkUkZKzG4FSQ7NDnJzA9+v5opImTsZYEidcn
 3sUiCOJ7xPQJQ69cC/4yygHIIlTekiMbiHyPuB5CLOQ1TUvCn2/9orD1yrSxZfN8Uh
 Xlle3kkdgh8kQ==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] gpu: nova-core: gsp: do not unwrap() SGEntry
Date: Fri, 26 Sep 2025 15:05:53 +0200
Message-ID: <20250926130623.61316-2-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926130623.61316-1-dakr@kernel.org>
References: <20250926130623.61316-1-dakr@kernel.org>
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

Don't use unwrap() to extract an Option<SGEntry>, instead handle the
error condition gracefully.

Fixes: a841614e607c ("gpu: nova-core: firmware: process and prepare the GSP firmware")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index ca785860e1c8..6b0761460a57 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -202,9 +202,10 @@ pub(crate) fn new<'a, 'b>(
                 let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
 
                 // Fill level 1 page entry.
-                let level1_entry = level1.iter().next().unwrap().dma_address();
-                let dst = &mut level0_data[..size_of_val(&level1_entry)];
-                dst.copy_from_slice(&level1_entry.to_le_bytes());
+                let level1_entry = level1.iter().next().ok_or(EINVAL)?;
+                let level1_entry_addr = level1_entry.dma_address();
+                let dst = &mut level0_data[..size_of_val(&level1_entry_addr)];
+                dst.copy_from_slice(&level1_entry_addr.to_le_bytes());
 
                 // Turn the level0 page table into a [`DmaObject`].
                 DmaObject::from_data(dev, &level0_data)?
-- 
2.51.0

