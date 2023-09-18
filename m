Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527D57A459E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E7710E233;
	Mon, 18 Sep 2023 09:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36EE10E233
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2046960CF7;
 Mon, 18 Sep 2023 09:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF777C433C8;
 Mon, 18 Sep 2023 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028422;
 bh=MrXAGxLM0yf+s4ztq/FX0QDPjaO6/6qXmGK6LW3YNu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O+Uv0MwKBeGgpna5V2xY8x+WVVUVnUqsAmVn0UPHtUZEJEj7zLHH1hxFrQtv5slec
 Yv1wGfGqnmyJDm/srOc17k/kgj2z8qKwYMeVr9SWVDbhz6CWCmV0JwwxxexpK3i1m2
 Ixv9g4Zg0FCaF+DzQ6yyXi0oYpHyGXEiysJMg0VM6+OIlvYh1OcCFYpcuAegHMT07x
 3D/JBa4wihKScUQWK6vfb1Is9pfLehuXF35sQhPAmxnsH59k9figSPnHarcPbz12cR
 VIDQ40EXi/catzNu1D2h4bWj4oV4ih8P2l1wVEu2XevNDl6RO1N3DYIPF8vg4Q7quI
 lPqV6s4J72d8w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/14] accel/habanalabs: always pass exported size to
 alloc_sgt_from_device_pages()
Date: Mon, 18 Sep 2023 12:13:18 +0300
Message-Id: <20230918091321.855943-11-ogabbay@kernel.org>
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

For Gaudi1 the exported dma-buf is always composed of a single page, and
therefore the exported size is equal to this page's size.
When calling alloc_sgt_from_device_pages(), we pass 0 as the exported
size and internally calculate it as "number of pages * page size".
This makes alloc_sgt_from_device_pages() less clear, because the
exported size parameter is not understood as a restriction on the pages'
size.
Modify to always pass the exported size explicitly.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 1b1b4256b011..c7e49cb383cf 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1561,8 +1561,7 @@ static struct sg_table *alloc_sgt_from_device_pages(struct hl_device *hdev, u64
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	/* remove export size restrictions in case not explicitly defined */
-	cur_size_to_export = exported_size ? exported_size : (npages * page_size);
+	cur_size_to_export = exported_size;
 
 	/* If the size of each page is larger than the dma max segment size,
 	 * then we can't combine pages and the number of entries in the SGL
@@ -1728,7 +1727,7 @@ static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 						&hl_dmabuf->device_address,
 						1,
 						hl_dmabuf->dmabuf->size,
-						0,
+						hl_dmabuf->dmabuf->size,
 						attachment->dev,
 						dir);
 
-- 
2.34.1

