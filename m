Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF06F6939E5
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB9410E46B;
	Sun, 12 Feb 2023 20:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F9210E468
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA05BB80D3A;
 Sun, 12 Feb 2023 20:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA71C433EF;
 Sun, 12 Feb 2023 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234713;
 bh=nisZ8gALnJ/CI6sEMwu1usOhPUGChVJOgsq1Mie1EDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XQbpTO2s0C6elHX0P91eyjFH6DC1Sfu01HnKFg3soM+aOLhVXJpvqyJZ7KIoSetXR
 MXULL8yKyFRLyqp8RXc/ct85unPoqYEEM+oMmv+oYSNM1dmBMujFmaPT6rjZEdJogm
 ivcYKk5QaUmI+jH4ZoN8MnlwXOFcsAxPSwq/tQZED5lbPLeZGdaWJEV/1pRjLMvj5f
 DPrfHicBiNFVeVvuKOskuo32pJku33Wrht7OEaua5yVtPR+OJYgCfzM7T8V0rr7JrN
 GuJt3JuL9V9yKFF4rC8ZS269WNyY5WFMBnyFEJUztdhRzv2mH8hK7qzNjNaurRjcVB
 yN+NzmfKIvWyw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/27] habanalabs: use memhash_node_export_put() in
 hl_release_dmabuf()
Date: Sun, 12 Feb 2023 22:44:33 +0200
Message-Id: <20230212204454.2938561-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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

The same mutex lock/unlock and counter decrementing in
hl_release_dmabuf() is already done in the memhash_node_export_put()
helper function.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 89 ++++++++++++------------
 1 file changed, 43 insertions(+), 46 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index e6474d38afc4..7b3809853dd5 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1779,6 +1779,47 @@ static void hl_unmap_dmabuf(struct dma_buf_attachment *attachment,
 	kfree(sgt);
 }
 
+static struct hl_vm_hash_node *memhash_node_export_get(struct hl_ctx *ctx, u64 addr)
+{
+	struct hl_device *hdev = ctx->hdev;
+	struct hl_vm_hash_node *hnode;
+
+	/* get the memory handle */
+	mutex_lock(&ctx->mem_hash_lock);
+	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned long)addr)
+		if (addr == hnode->vaddr)
+			break;
+
+	if (!hnode) {
+		mutex_unlock(&ctx->mem_hash_lock);
+		dev_dbg(hdev->dev, "map address %#llx not found\n", addr);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (upper_32_bits(hnode->handle)) {
+		mutex_unlock(&ctx->mem_hash_lock);
+		dev_dbg(hdev->dev, "invalid handle %#llx for map address %#llx\n",
+				hnode->handle, addr);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/*
+	 * node found, increase export count so this memory cannot be unmapped
+	 * and the hash node cannot be deleted.
+	 */
+	hnode->export_cnt++;
+	mutex_unlock(&ctx->mem_hash_lock);
+
+	return hnode;
+}
+
+static void memhash_node_export_put(struct hl_ctx *ctx, struct hl_vm_hash_node *hnode)
+{
+	mutex_lock(&ctx->mem_hash_lock);
+	hnode->export_cnt--;
+	mutex_unlock(&ctx->mem_hash_lock);
+}
+
 static void hl_release_dmabuf(struct dma_buf *dmabuf)
 {
 	struct hl_dmabuf_priv *hl_dmabuf = dmabuf->priv;
@@ -1789,11 +1830,8 @@ static void hl_release_dmabuf(struct dma_buf *dmabuf)
 
 	ctx = hl_dmabuf->ctx;
 
-	if (hl_dmabuf->memhash_hnode) {
-		mutex_lock(&ctx->mem_hash_lock);
-		hl_dmabuf->memhash_hnode->export_cnt--;
-		mutex_unlock(&ctx->mem_hash_lock);
-	}
+	if (hl_dmabuf->memhash_hnode)
+		memhash_node_export_put(ctx, hl_dmabuf->memhash_hnode);
 
 	hl_ctx_put(ctx);
 	kfree(hl_dmabuf);
@@ -1933,47 +1971,6 @@ static int validate_export_params(struct hl_device *hdev, u64 device_addr, u64 s
 	return 0;
 }
 
-static struct hl_vm_hash_node *memhash_node_export_get(struct hl_ctx *ctx, u64 addr)
-{
-	struct hl_device *hdev = ctx->hdev;
-	struct hl_vm_hash_node *hnode;
-
-	/* get the memory handle */
-	mutex_lock(&ctx->mem_hash_lock);
-	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned long)addr)
-		if (addr == hnode->vaddr)
-			break;
-
-	if (!hnode) {
-		mutex_unlock(&ctx->mem_hash_lock);
-		dev_dbg(hdev->dev, "map address %#llx not found\n", addr);
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (upper_32_bits(hnode->handle)) {
-		mutex_unlock(&ctx->mem_hash_lock);
-		dev_dbg(hdev->dev, "invalid handle %#llx for map address %#llx\n",
-				hnode->handle, addr);
-		return ERR_PTR(-EINVAL);
-	}
-
-	/*
-	 * node found, increase export count so this memory cannot be unmapped
-	 * and the hash node cannot be deleted.
-	 */
-	hnode->export_cnt++;
-	mutex_unlock(&ctx->mem_hash_lock);
-
-	return hnode;
-}
-
-static void memhash_node_export_put(struct hl_ctx *ctx, struct hl_vm_hash_node *hnode)
-{
-	mutex_lock(&ctx->mem_hash_lock);
-	hnode->export_cnt--;
-	mutex_unlock(&ctx->mem_hash_lock);
-}
-
 static struct hl_vm_phys_pg_pack *get_phys_pg_pack_from_hash_node(struct hl_device *hdev,
 							struct hl_vm_hash_node *hnode)
 {
-- 
2.25.1

