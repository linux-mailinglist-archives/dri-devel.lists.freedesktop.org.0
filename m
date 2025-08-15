Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94691B27E34
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 12:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A7510E255;
	Fri, 15 Aug 2025 10:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8C0C10E255
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 10:25:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A0511691;
 Fri, 15 Aug 2025 03:25:49 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com
 [10.1.29.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 155723F738;
 Fri, 15 Aug 2025 03:25:55 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karunika Choo <karunika.choo@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH] drm/panthor: Remove dead code in mmu_hw_do_operation_locked
Date: Fri, 15 Aug 2025 11:25:39 +0100
Message-ID: <20250815102539.39711-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
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

The only callers to mmu_hw_do_operation_locked() pass an 'op' of either
AS_COMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT. So remove the code paths
that test for other operations and add a drm_WARN_ON() to catch the
posibility of others appearing the future.

Suggested-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 367c89aca558..b16f44aec725 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -612,17 +612,12 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	 * power it up
 	 */
 
-	if (op != AS_COMMAND_UNLOCK)
-		lock_region(ptdev, as_nr, iova, size);
+	drm_WARN_ON(&ptdev->base,
+		    op != AS_COMMAND_FLUSH_MEM && op != AS_COMMAND_FLUSH_PT);
 
-	if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
-		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+	lock_region(ptdev, as_nr, iova, size);
 
-	/* Run the MMU operation */
-	write_cmd(ptdev, as_nr, op);
-
-	/* Wait for the flush to complete */
-	return wait_ready(ptdev, as_nr);
+	return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
 }
 
 static int mmu_hw_do_operation(struct panthor_vm *vm,
-- 
2.39.5

