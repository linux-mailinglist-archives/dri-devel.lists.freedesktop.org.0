Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518DABA3C1D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8FE10EA75;
	Fri, 26 Sep 2025 13:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="irpcXReg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4875110EA69;
 Fri, 26 Sep 2025 13:06:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDBDE4399F;
 Fri, 26 Sep 2025 13:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8998C4CEF4;
 Fri, 26 Sep 2025 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758891994;
 bh=uMQrPsVoatO/qweCSMz0PCGRojzxgqhUQv+HHNkqOI8=;
 h=From:To:Cc:Subject:Date:From;
 b=irpcXRegHZNeVzJBfCg/jIR8wxf6/oVqgxaiB6V0Q/cyj9+EmZWTakiKgZbJzy0Ip
 o21j97FRZ8IfrSh2njzSPd5zJhlm5hVy2ZI4H+TrZtymOmkGx6CUPdReynRoicTHPs
 AqlWqfJiwodstpP6SN5cjD3LYGo61cgxA4xkqvrYM+qAy4SFYU6zdoR/Y085/o+1ov
 VhnEby7Mn2ReKFId6o+nJooi6GpE5+2dlUzLC/oNy3Tt6v0AXs1xW7f/S2yrFXqswM
 KAF9cCXgzrZdfXLX5+POEf4+xvwZScmo0mO6kv5OYEeODTcGHDy/aXmT9HKdbdBk+H
 oJHZ5owLoFCyw==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] gpu: nova-core: gsp: remove useless conversion
Date: Fri, 26 Sep 2025 15:05:52 +0200
Message-ID: <20250926130623.61316-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Meanwhile nova-core depends on CONFIG_64BIT and a raw DmaAddress is
always a u64, hence remove the now actually useless conversion.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9b70095434c6..ca785860e1c8 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -202,8 +202,7 @@ pub(crate) fn new<'a, 'b>(
                 let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
 
                 // Fill level 1 page entry.
-                #[allow(clippy::useless_conversion)]
-                let level1_entry = u64::from(level1.iter().next().unwrap().dma_address());
+                let level1_entry = level1.iter().next().unwrap().dma_address();
                 let dst = &mut level0_data[..size_of_val(&level1_entry)];
                 dst.copy_from_slice(&level1_entry.to_le_bytes());
 

base-commit: 299eb32863e584cfff7c6b667c3e92ae7d4d2bf9
-- 
2.51.0

