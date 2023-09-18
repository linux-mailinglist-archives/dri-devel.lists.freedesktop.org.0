Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE507A45A1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80CF10E236;
	Mon, 18 Sep 2023 09:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB0E10E233
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2679660CF7;
 Mon, 18 Sep 2023 09:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E53C433C7;
 Mon, 18 Sep 2023 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028424;
 bh=81TY+X/zYD3utV7chAR+whOPap4/nbU57ppgHVQ9bsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H1u/iAMyRLCR0NaNS2Hlg+56JHMUGHejrEjkdvUNlbnuwqLmUI5tmcQhxlv6Gj2j1
 W4OaPJ7lB3q3gcYmoOtnv+qn6xz1AVBop1IAex6pGELvyYHGxkc3LxUfVzb+U985go
 ySGnT6YMM+bR+Maa0T38i1khnMCFrAnnXoiuFMn2WX2rrJri7HkkwXaIibNd+CB/4I
 WRFCpMEnJW/GQ94dODwiDC92BQyfuqVidOH33CsvNwSRKSY9+jKiIvAvwDzRKKSnFk
 3wr0g9cR5v3zPfobThDY7vM2a7iXnqtyW4rhq1VPiS6vF37vJ9he/95i6OQdOfRmdZ
 j/zpBKPPHStvg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/14] accel/habanalabs: use exported size from dma_buf and
 not from phys_pg_pack
Date: Mon, 18 Sep 2023 12:13:19 +0300
Message-Id: <20230918091321.855943-12-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918091321.855943-1-ogabbay@kernel.org>
References: <20230918091321.855943-1-ogabbay@kernel.org>
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

The 'exported_size' member in 'struct hl_vm_phys_pg_pack' is used to
keep the exported dma-buf size, to be later used when the buffer is
mapped.
However it is possible that the same phys_pg_pack will be exported more
than once, and independently of when the mapping takes place.
Remove this member from the phys_pg_pack structure, and simply use the
size in the dma-buf object as the exported size when mapping.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 2 --
 drivers/accel/habanalabs/common/memory.c     | 3 +--
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 6f2cbd3c2e95..4c5d55c9109d 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -2159,7 +2159,6 @@ struct hl_vm_hw_block_list_node {
  * @pages: the physical page array.
  * @npages: num physical pages in the pack.
  * @total_size: total size of all the pages in this list.
- * @exported_size: buffer exported size.
  * @node: used to attach to deletion list that is used when all the allocations are cleared
  *        at the teardown of the context.
  * @mapping_cnt: number of shared mappings.
@@ -2176,7 +2175,6 @@ struct hl_vm_phys_pg_pack {
 	u64			*pages;
 	u64			npages;
 	u64			total_size;
-	u64			exported_size;
 	struct list_head	node;
 	atomic_t		mapping_cnt;
 	u32			asid;
diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index c7e49cb383cf..27ab176c55c1 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1719,7 +1719,7 @@ static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 						phys_pg_pack->pages,
 						phys_pg_pack->npages,
 						phys_pg_pack->page_size,
-						phys_pg_pack->exported_size,
+						hl_dmabuf->dmabuf->size,
 						attachment->dev,
 						dir);
 	else
@@ -2044,7 +2044,6 @@ static int export_dmabuf_from_addr(struct hl_ctx *ctx, u64 addr, u64 size, u64 o
 		if (rc)
 			goto dec_memhash_export_cnt;
 
-		phys_pg_pack->exported_size = size;
 		hl_dmabuf->phys_pg_pack = phys_pg_pack;
 		hl_dmabuf->memhash_hnode = hnode;
 	} else {
-- 
2.34.1

