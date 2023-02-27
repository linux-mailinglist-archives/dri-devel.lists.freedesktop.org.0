Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC946A4057
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52E210E1BF;
	Mon, 27 Feb 2023 11:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D419910E3B6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:13:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86178B80CA5;
 Mon, 27 Feb 2023 11:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B07DC433EF;
 Mon, 27 Feb 2023 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677496391;
 bh=0I5AnhYb/ob1dlnY+rf1XjX4GfCR1gP3WJNq7rzgZno=;
 h=From:To:Cc:Subject:Date:From;
 b=dC/NuyD5Qqiygv+Fa23Cl4h7jVV5IYXml4kggKcEpKkQ3TJm1bWjIJlhqacipMTMt
 exLrcHIP9hw9fdM1n/GuEPX04tW/nGOXLFglN7/DuD5bxY7sU8noGIUk2C8Aj6zlef
 RcucKZXEsY2WZkrmHx5w9tpHq7ubJht1Px1waoBeOB/vw6PRxT+Z1BqcURaHFhnKNx
 uJJLHz8+uaWB//2NFnfNmgZD1M0F8IN6ICJWcVtCFtoTT2D1a/UHEGjjvN6cJVekv3
 dDzly4tU7N2osPTPMomRpCL/GCkT86L2J3bACjwa1Wug+11G8QOmrpkhTw6cbVBU2I
 lWly2gknZljbg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] habanalabs: add helper function to get vm hash node
Date: Mon, 27 Feb 2023 13:13:01 +0200
Message-Id: <20230227111306.3985896-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

Add a helper function to search the vm hash for a node with a given
virtual address.
As opposed to the current code, this function explicitly returns NULL
when no node is found, instead of basing on the loop cursor object's
value.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 28 ++++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index be0cba3b61ab..88f5178d2df7 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1266,6 +1266,18 @@ static int map_device_va(struct hl_ctx *ctx, struct hl_mem_in *args, u64 *device
 	return rc;
 }
 
+/* Should be called while the context's mem_hash_lock is taken */
+static struct hl_vm_hash_node *get_vm_hash_node_locked(struct hl_ctx *ctx, u64 vaddr)
+{
+	struct hl_vm_hash_node *hnode;
+
+	hash_for_each_possible(ctx->mem_hash, hnode, node, vaddr)
+		if (vaddr == hnode->vaddr)
+			return hnode;
+
+	return NULL;
+}
+
 /**
  * unmap_device_va() - unmap the given device virtual address.
  * @ctx: pointer to the context structure.
@@ -1281,10 +1293,10 @@ static int unmap_device_va(struct hl_ctx *ctx, struct hl_mem_in *args,
 {
 	struct hl_vm_phys_pg_pack *phys_pg_pack = NULL;
 	u64 vaddr = args->unmap.device_virt_addr;
-	struct hl_vm_hash_node *hnode = NULL;
 	struct asic_fixed_properties *prop;
 	struct hl_device *hdev = ctx->hdev;
 	struct hl_userptr *userptr = NULL;
+	struct hl_vm_hash_node *hnode;
 	struct hl_va_range *va_range;
 	enum vm_type *vm_type;
 	bool is_userptr;
@@ -1294,15 +1306,10 @@ static int unmap_device_va(struct hl_ctx *ctx, struct hl_mem_in *args,
 
 	/* protect from double entrance */
 	mutex_lock(&ctx->mem_hash_lock);
-	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned long)vaddr)
-		if (vaddr == hnode->vaddr)
-			break;
-
+	hnode = get_vm_hash_node_locked(ctx, vaddr);
 	if (!hnode) {
 		mutex_unlock(&ctx->mem_hash_lock);
-		dev_err(hdev->dev,
-			"unmap failed, no mem hnode for vaddr 0x%llx\n",
-			vaddr);
+		dev_err(hdev->dev, "unmap failed, no mem hnode for vaddr 0x%llx\n", vaddr);
 		return -EINVAL;
 	}
 
@@ -1782,10 +1789,7 @@ static struct hl_vm_hash_node *memhash_node_export_get(struct hl_ctx *ctx, u64 a
 
 	/* get the memory handle */
 	mutex_lock(&ctx->mem_hash_lock);
-	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned long)addr)
-		if (addr == hnode->vaddr)
-			break;
-
+	hnode = get_vm_hash_node_locked(ctx, addr);
 	if (!hnode) {
 		mutex_unlock(&ctx->mem_hash_lock);
 		dev_dbg(hdev->dev, "map address %#llx not found\n", addr);
-- 
2.39.2

