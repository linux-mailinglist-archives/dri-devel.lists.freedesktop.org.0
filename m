Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0097A4B12
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ED110E285;
	Mon, 18 Sep 2023 14:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9264D10E190
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:32:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1BC3AB80E9F;
 Mon, 18 Sep 2023 14:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A76C32788;
 Mon, 18 Sep 2023 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695047530;
 bh=ClWgUvldec1UbLGX8X9VNPwRuqMyICgQEez2cg1rCt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=snRL8w4bHqnC1czai84Fckh8urs0Fimie0t6JZQGs0FIDsqJuF/rylJjfAVxavL+B
 tLm+rk5qYtAdrLOQxS1/8zOR8eu0wEGlJWHxI7NY5+tzQ/5I42GwetZAa2fzDm3f9t
 uHsHfM68ms95h25rXHUGGDn49AOywJw0F4ArTbNxYYDV9TXpN+B67Q+OFHO84dvTpG
 3XImCX+tRAzdkQjC5gj6fLiKzdwiL2R1TqHawbn7zoF+IVYu1cou9mpR/7FcZudgX5
 uU9ctQHw/9fBys+GRxTikaG2yNM6N5j1gXLBh6vi/j4eqmc691k4pDjFFACEh+WxRB
 2xQKPN4cO7lIQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] accel/habanalabs: set hl_dmabuf_priv.device_address
 only when needed
Date: Mon, 18 Sep 2023 17:31:53 +0300
Message-Id: <20230918143158.903207-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918143158.903207-1-ogabbay@kernel.org>
References: <20230918143158.903207-1-ogabbay@kernel.org>
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

The device_address member of 'struct hl_dmabuf_priv' is used only when
virtual device memory is not supported and dma-buf is exported from
address.
Set the value of this field only when it is relevant, and add "phys" to
its name so it would be clearer that it can't be a device virtual
address.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 8 ++++----
 drivers/accel/habanalabs/common/memory.c     | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 7c2da8cfe844..43e682cdeb75 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1811,16 +1811,16 @@ struct hl_cs_counters_atomic {
  * @phys_pg_pack: pointer to physical page pack if the dma-buf was exported
  *                where virtual memory is supported.
  * @memhash_hnode: pointer to the memhash node. this object holds the export count.
- * @device_address: physical address of the device's memory. Relevant only
- *                  if phys_pg_pack is NULL (dma-buf was exported from address).
- *                  The total size can be taken from the dmabuf object.
+ * device_phys_addr: physical address of the device's memory. Relevant only
+ *                   if phys_pg_pack is NULL (dma-buf was exported from address).
+ *                   The total size can be taken from the dmabuf object.
  */
 struct hl_dmabuf_priv {
 	struct dma_buf			*dmabuf;
 	struct hl_ctx			*ctx;
 	struct hl_vm_phys_pg_pack	*phys_pg_pack;
 	struct hl_vm_hash_node		*memhash_hnode;
-	uint64_t			device_address;
+	u64				device_phys_addr;
 };
 
 #define HL_CS_OUTCOME_HISTORY_LEN 256
diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 5c1e98e73a47..dc5ff3e74c39 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1730,7 +1730,7 @@ static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 		npages = phys_pg_pack->npages;
 		page_size = phys_pg_pack->page_size;
 	} else {
-		pages = &hl_dmabuf->device_address;
+		pages = &hl_dmabuf->device_phys_addr;
 		npages = 1;
 		page_size = hl_dmabuf->dmabuf->size;
 	}
@@ -2063,9 +2063,9 @@ static int export_dmabuf_from_addr(struct hl_ctx *ctx, u64 addr, u64 size, u64 o
 		rc = validate_export_params_no_mmu(hdev, export_addr, size);
 		if (rc)
 			goto err_free_dmabuf_wrapper;
-	}
 
-	hl_dmabuf->device_address = export_addr;
+		hl_dmabuf->device_phys_addr = export_addr;
+	}
 
 	rc = export_dmabuf(ctx, hl_dmabuf, size, flags, dmabuf_fd);
 	if (rc)
-- 
2.34.1

