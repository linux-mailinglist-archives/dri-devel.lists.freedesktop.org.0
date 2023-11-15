Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4701C7EC8C0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 17:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C7610E0EE;
	Wed, 15 Nov 2023 16:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE6710E116
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:39:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA7C661726;
 Wed, 15 Nov 2023 16:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724F0C433C7;
 Wed, 15 Nov 2023 16:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700066371;
 bh=ZLWT97N45Ta6Fe0IDs/iYeT0WAcl/lGZt3orsFz1SZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oLySOhiA1mXQwPlJpUqWK6eDz8jnmmkOA3SHWQaXScZmE4Yutq6tywwIANg93u2t5
 hshGS8/bRmU/Zrw/0Xp91Qzcik5L1i1ZdRv4vlD0ghsUGjLuWOsbWVlUSKwwP1ZyIa
 Kq1d/BAvV0KbVPwJ9vAROTVbyS6fwm/Q0o3UpH8gyy+BDqowDrXLJUTk33pQB1Gg7b
 EuvYULcCEzVkEk9FyXEJN3TMrFNAAG3Nj4qxn+3MaiPJeCHqW98dXCVwT6JmGNalLr
 Z4uwtAB9VoDTpnamehPzdzOl6Q+SBrqbgC1cCnX+3F//gPqiIKsPUWIfmhkoCgsl6a
 j7tBTY3JPC/ag==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] accel/habanalabs: print error code when mapping fails
Date: Wed, 15 Nov 2023 18:39:11 +0200
Message-Id: <20231115163912.1243175-9-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115163912.1243175-1-ogabbay@kernel.org>
References: <20231115163912.1243175-1-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

Failure to map is considered a non-trivial error and we need to notify
the user about it.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 0b8689fe0b64..3348ad12c237 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -955,8 +955,8 @@ static int map_phys_pg_pack(struct hl_ctx *ctx, u64 vaddr,
 				(i + 1) == phys_pg_pack->npages);
 		if (rc) {
 			dev_err(hdev->dev,
-				"map failed for handle %u, npages: %llu, mapped: %llu",
-				phys_pg_pack->handle, phys_pg_pack->npages,
+				"map failed (%d) for handle %u, npages: %llu, mapped: %llu\n",
+				rc, phys_pg_pack->handle, phys_pg_pack->npages,
 				mapped_pg_cnt);
 			goto err;
 		}
@@ -1186,7 +1186,8 @@ static int map_device_va(struct hl_ctx *ctx, struct hl_mem_in *args, u64 *device
 
 	rc = map_phys_pg_pack(ctx, ret_vaddr, phys_pg_pack);
 	if (rc) {
-		dev_err(hdev->dev, "mapping page pack failed for handle %u\n", handle);
+		dev_err(hdev->dev, "mapping page pack failed (%d) for handle %u\n",
+			rc, handle);
 		mutex_unlock(&hdev->mmu_lock);
 		goto map_err;
 	}
-- 
2.34.1

