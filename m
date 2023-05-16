Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C800704947
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A0710E32D;
	Tue, 16 May 2023 09:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B199610E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1D13626E2;
 Tue, 16 May 2023 09:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725D7C433D2;
 Tue, 16 May 2023 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229436;
 bh=cXssXXGrkb0oa3mOitMui8K4dCsNk80VYpdcoF3gJqw=;
 h=From:To:Cc:Subject:Date:From;
 b=r4PEhXEGhzD2iJQKJ9gKkY87OSszrsR/lTvdx3jVwJNrTQQt5Pf6oJL5Uiiztf8au
 eFuHD5h3pGwDwTD3PCHSD8uZiakF/912mj7KvwgcCgzaKFz876kLL4ixVkHyHtLAsc
 9axCPq3sph/qNHuQzq2t6vRUEAMF3kuKbI/OsuR1Mp8GKdM9/D9SHOBpQHcjjD1Evh
 //VhDdfsbMufzqliMltp7z0ZSQWaTJlh4+GTdZubyIEu/L3YVoLwpM/S2L/PaefgO7
 4D5RiYK8xLC4I8BCg6OaDHq4pCa3cYocZ7OqRKRJUDJNsHK7B6xDOwbJ172KCMLH7Z
 rDc83jin3lpJQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/12] accel/habanalabs: rename security functions related
 arguments
Date: Tue, 16 May 2023 12:30:19 +0300
Message-Id: <20230516093030.1220526-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Make the argument names specify the registers array represent
registers that should be unsecured so the user can access them.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/security.c | 57 +++++++++++-----------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/accel/habanalabs/common/security.c b/drivers/accel/habanalabs/common/security.c
index dc23ff57c91a..fe913965dbad 100644
--- a/drivers/accel/habanalabs/common/security.c
+++ b/drivers/accel/habanalabs/common/security.c
@@ -284,14 +284,14 @@ void hl_secure_block(struct hl_device *hdev,
  * @instance_offset: offset between instances
  * @pb_blocks: blocks array
  * @blocks_array_size: blocks array size
- * @regs_array: register array
- * @regs_array_size: register array size
+ * @user_regs_array: unsecured register array
+ * @user_regs_array_size: unsecured register array size
  * @mask: enabled instances mask: 1- enabled, 0- disabled
  */
 int hl_init_pb_with_mask(struct hl_device *hdev, u32 num_dcores,
 		u32 dcore_offset, u32 num_instances, u32 instance_offset,
 		const u32 pb_blocks[], u32 blocks_array_size,
-		const u32 *regs_array, u32 regs_array_size, u64 mask)
+		const u32 *user_regs_array, u32 user_regs_array_size, u64 mask)
 {
 	int i, j;
 	struct hl_block_glbl_sec *glbl_sec;
@@ -303,8 +303,8 @@ int hl_init_pb_with_mask(struct hl_device *hdev, u32 num_dcores,
 		return -ENOMEM;
 
 	hl_secure_block(hdev, glbl_sec, blocks_array_size);
-	hl_unsecure_registers(hdev, regs_array, regs_array_size, 0, pb_blocks,
-			glbl_sec, blocks_array_size);
+	hl_unsecure_registers(hdev, user_regs_array, user_regs_array_size, 0,
+			pb_blocks, glbl_sec, blocks_array_size);
 
 	/* Fill all blocks with the same configuration */
 	for (i = 0 ; i < num_dcores ; i++) {
@@ -336,19 +336,19 @@ int hl_init_pb_with_mask(struct hl_device *hdev, u32 num_dcores,
  * @instance_offset: offset between instances
  * @pb_blocks: blocks array
  * @blocks_array_size: blocks array size
- * @regs_array: register array
- * @regs_array_size: register array size
+ * @user_regs_array: unsecured register array
+ * @user_regs_array_size: unsecured register array size
  *
  */
 int hl_init_pb(struct hl_device *hdev, u32 num_dcores, u32 dcore_offset,
 		u32 num_instances, u32 instance_offset,
 		const u32 pb_blocks[], u32 blocks_array_size,
-		const u32 *regs_array, u32 regs_array_size)
+		const u32 *user_regs_array, u32 user_regs_array_size)
 {
 	return hl_init_pb_with_mask(hdev, num_dcores, dcore_offset,
 			num_instances, instance_offset, pb_blocks,
-			blocks_array_size, regs_array, regs_array_size,
-			ULLONG_MAX);
+			blocks_array_size, user_regs_array,
+			user_regs_array_size, ULLONG_MAX);
 }
 
 /**
@@ -364,15 +364,15 @@ int hl_init_pb(struct hl_device *hdev, u32 num_dcores, u32 dcore_offset,
  * @instance_offset: offset between instances
  * @pb_blocks: blocks array
  * @blocks_array_size: blocks array size
- * @regs_range_array: register range array
- * @regs_range_array_size: register range array size
+ * @user_regs_range_array: unsecured register range array
+ * @user_regs_range_array_size: unsecured register range array size
  * @mask: enabled instances mask: 1- enabled, 0- disabled
  */
 int hl_init_pb_ranges_with_mask(struct hl_device *hdev, u32 num_dcores,
 		u32 dcore_offset, u32 num_instances, u32 instance_offset,
 		const u32 pb_blocks[], u32 blocks_array_size,
-		const struct range *regs_range_array, u32 regs_range_array_size,
-		u64 mask)
+		const struct range *user_regs_range_array,
+		u32 user_regs_range_array_size, u64 mask)
 {
 	int i, j, rc = 0;
 	struct hl_block_glbl_sec *glbl_sec;
@@ -384,8 +384,8 @@ int hl_init_pb_ranges_with_mask(struct hl_device *hdev, u32 num_dcores,
 		return -ENOMEM;
 
 	hl_secure_block(hdev, glbl_sec, blocks_array_size);
-	rc = hl_unsecure_registers_range(hdev, regs_range_array,
-			regs_range_array_size, 0, pb_blocks, glbl_sec,
+	rc = hl_unsecure_registers_range(hdev, user_regs_range_array,
+			user_regs_range_array_size, 0, pb_blocks, glbl_sec,
 			blocks_array_size);
 	if (rc)
 		goto free_glbl_sec;
@@ -422,19 +422,20 @@ int hl_init_pb_ranges_with_mask(struct hl_device *hdev, u32 num_dcores,
  * @instance_offset: offset between instances
  * @pb_blocks: blocks array
  * @blocks_array_size: blocks array size
- * @regs_range_array: register range array
- * @regs_range_array_size: register range array size
+ * @user_regs_range_array: unsecured register range array
+ * @user_regs_range_array_size: unsecured register range array size
  *
  */
 int hl_init_pb_ranges(struct hl_device *hdev, u32 num_dcores,
 		u32 dcore_offset, u32 num_instances, u32 instance_offset,
 		const u32 pb_blocks[], u32 blocks_array_size,
-		const struct range *regs_range_array, u32 regs_range_array_size)
+		const struct range *user_regs_range_array,
+		u32 user_regs_range_array_size)
 {
 	return hl_init_pb_ranges_with_mask(hdev, num_dcores, dcore_offset,
 			num_instances, instance_offset, pb_blocks,
-			blocks_array_size, regs_range_array,
-			regs_range_array_size, ULLONG_MAX);
+			blocks_array_size, user_regs_range_array,
+			user_regs_range_array_size, ULLONG_MAX);
 }
 
 /**
@@ -447,14 +448,14 @@ int hl_init_pb_ranges(struct hl_device *hdev, u32 num_dcores,
  * @instance_offset: offset between instances
  * @pb_blocks: blocks array
  * @blocks_array_size: blocks array size
- * @regs_array: register array
- * @regs_array_size: register array size
+ * @user_regs_array: unsecured register array
+ * @user_regs_array_size: unsecured register array size
  *
  */
 int hl_init_pb_single_dcore(struct hl_device *hdev, u32 dcore_offset,
 		u32 num_instances, u32 instance_offset,
 		const u32 pb_blocks[], u32 blocks_array_size,
-		const u32 *regs_array, u32 regs_array_size)
+		const u32 *user_regs_array, u32 user_regs_array_size)
 {
 	int i, rc = 0;
 	struct hl_block_glbl_sec *glbl_sec;
@@ -466,8 +467,8 @@ int hl_init_pb_single_dcore(struct hl_device *hdev, u32 dcore_offset,
 		return -ENOMEM;
 
 	hl_secure_block(hdev, glbl_sec, blocks_array_size);
-	rc = hl_unsecure_registers(hdev, regs_array, regs_array_size, 0,
-			pb_blocks, glbl_sec, blocks_array_size);
+	rc = hl_unsecure_registers(hdev, user_regs_array, user_regs_array_size,
+			0, pb_blocks, glbl_sec, blocks_array_size);
 	if (rc)
 		goto free_glbl_sec;
 
@@ -495,8 +496,8 @@ int hl_init_pb_single_dcore(struct hl_device *hdev, u32 dcore_offset,
  * @instance_offset: offset between instances
  * @pb_blocks: blocks array
  * @blocks_array_size: blocks array size
- * @user_regs_range_array: register range array
- * @user_regs_range_array_size: register range array size
+ * @user_regs_range_array: unsecured register range array
+ * @user_regs_range_array_size: unsecured register range array size
  *
  */
 int hl_init_pb_ranges_single_dcore(struct hl_device *hdev, u32 dcore_offset,
-- 
2.40.1

