Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B2A7A45A7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221FA10E23E;
	Mon, 18 Sep 2023 09:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C0810E237
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB9D960F80;
 Mon, 18 Sep 2023 09:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D405C433C9;
 Mon, 18 Sep 2023 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028427;
 bh=I/0HpoqHM0BJ4a7JhF8jIdMYbLNVn3owEdWgsmxxvlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OJRm9sXt0nfeRIFPJNODErjaUMLqsMyBEEJtfSLa46nhxEiuJtXL0KSZ7S29jOEWX
 MF1Qk0FV7jX25U3+Lc3kWLYxnrZ92KglOupmSuI8l0YYKzWDi0LnBdLgdDQglxrzXt
 mKPKlKWWpBmyC3ACVqevUudK+gT2Cvmt38JblFx2MctfUdpJFrhQyQv+jSkgLcVzU2
 1zPwWJhTwaA6Cvsz95aQsoLfUEceZpjxuyr7blq2kHZlasc3iDka4YxYZ7HXcHbaxe
 0FeVl6HACKxUO8z/zGp6kXHh447waVaCgVtoggzUxVQ0v1iuPyGPExReb9oZRMXw1K
 Q0NlikoevpFEQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/14] accel/habanalabs: tiny refactor of hl_map_dmabuf()
Date: Mon, 18 Sep 2023 12:13:21 +0300
Message-Id: <20230918091321.855943-14-ogabbay@kernel.org>
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

alloc_sgt_from_device_pages() includes relatively many parameters, and
in a subsequent change another offset parameter is going to be added.
Using structure fields directly when calling this function, and in
hl_map_dmabuf() it is done twice, makes it a little bit difficult to
understand the meaning of the parameters.
To make it clearer, assign the required values into local variables with
explicit names, and use the variables when calling the function.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 37 +++++++++++-------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index b4a9ff692ebc..d0edbe4b4210 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1699,38 +1699,35 @@ static int hl_dmabuf_attach(struct dma_buf *dmabuf,
 static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 					enum dma_data_direction dir)
 {
+	u64 *pages, npages, page_size, exported_size;
 	struct dma_buf *dma_buf = attachment->dmabuf;
 	struct hl_vm_phys_pg_pack *phys_pg_pack;
 	struct hl_dmabuf_priv *hl_dmabuf;
 	struct hl_device *hdev;
 	struct sg_table *sgt;
 
-	hl_dmabuf = dma_buf->priv;
-	hdev = hl_dmabuf->ctx->hdev;
-	phys_pg_pack = hl_dmabuf->phys_pg_pack;
-
 	if (!attachment->peer2peer) {
 		dev_dbg(hdev->dev, "Failed to map dmabuf because p2p is disabled\n");
 		return ERR_PTR(-EPERM);
 	}
 
-	if (phys_pg_pack)
-		sgt = alloc_sgt_from_device_pages(hdev,
-						phys_pg_pack->pages,
-						phys_pg_pack->npages,
-						phys_pg_pack->page_size,
-						hl_dmabuf->dmabuf->size,
-						attachment->dev,
-						dir);
-	else
-		sgt = alloc_sgt_from_device_pages(hdev,
-						&hl_dmabuf->device_address,
-						1,
-						hl_dmabuf->dmabuf->size,
-						hl_dmabuf->dmabuf->size,
-						attachment->dev,
-						dir);
+	hl_dmabuf = dma_buf->priv;
+	hdev = hl_dmabuf->ctx->hdev;
+	exported_size = hl_dmabuf->dmabuf->size;
+	phys_pg_pack = hl_dmabuf->phys_pg_pack;
+
+	if (phys_pg_pack) {
+		pages = phys_pg_pack->pages;
+		npages = phys_pg_pack->npages;
+		page_size = phys_pg_pack->page_size;
+	} else {
+		pages = &hl_dmabuf->device_address;
+		npages = 1;
+		page_size = hl_dmabuf->dmabuf->size;
+	}
 
+	sgt = alloc_sgt_from_device_pages(hdev, pages, npages, page_size, exported_size,
+						attachment->dev, dir);
 	if (IS_ERR(sgt))
 		dev_err(hdev->dev, "failed (%ld) to initialize sgt for dmabuf\n", PTR_ERR(sgt));
 
-- 
2.34.1

