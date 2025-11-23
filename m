Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E03C7E863
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D163810E1AC;
	Sun, 23 Nov 2025 22:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="htsYD8Nf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486FE10E1A8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:51:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42bb288c1bfso2140154f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938314; x=1764543114; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6XYP6M4yTt1qmMNVTJGvjFxmCyRCFcZp21DmV1BJvo=;
 b=htsYD8NfBf0wP3kpB5axWgai6QaL+qPf+bDnY7NF2HnS0DrT5x3Uj+wSfwv3FbqPNF
 sJdCMetrzI5ieMUAZ0ITZ/1rCD2qTSQzdSHC98XBCOOdwhi217SdIAoElTRP5yTpYtRx
 NUOm31AAVrIAloNY1OJOk+F80PUr4qVnt3W6Q9elgpg48ZX/5GhlzxSW+LDXKwxUWpsp
 J3u0ZjRObISYKqQhnInXYbQoUwa9mEk303ypv0qhVYFhftkzZ567+VUWIGGPySPH1HiA
 RhrPpQwy0zJAxSfA0MyL4UwwQ0t9zK8VdhnAPni4ljm+pXtzUQ1c+Db2PNOSULJFjo6u
 90uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938314; x=1764543114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o6XYP6M4yTt1qmMNVTJGvjFxmCyRCFcZp21DmV1BJvo=;
 b=IwqGb3C29M3F76lJlFMx9b8OjjaR5OfBOSMjJDWk367FUw/Nt87Ynp1PfWDCTrASt3
 ywGE+qQdGBvwMghPgaTvZqrD19gK2go+iaIUtxQxPpxOCUqWOhhoTOS+qyxHMPp3dlGR
 Lwymryq0/iVWi3qPnhtq84NeESkXX+987Q72+SDy7AVy3AUwx+/qPLc6oJqidzJkB4/q
 y/3v52IhhKusV50x9r2B1Ih5vCzojj5gaIbR+dI8xTWmiDmJZ11EzNoZmucHpMZkxq53
 FU+sQ8C4xZSrhrMpHterRpM2gXUknmWkmlHkJqmG5SkP0nSeBI0I2yI0MWouOoTfZ+lM
 8GDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa+OhvFHpNxYEhN6LCabOYGSrGBdzt/xY2GqNDOW+yOAdhNfk8Ytm4MsnfIzpH3S+16uoZr3tSQBQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQr8ajt5Tyunb62iYlhJJdxNf/DxlHJDYjFa8xyX5gNdFR7flk
 ZrdTdt9RZnQOSMuun4siJ7fg8Vu7bntWgNuyoFeh5BBLFSB75rzyH0j/
X-Gm-Gg: ASbGnctB53cUn3UhqsmPSX5KEhdgP3IDhrVji45L0NYAaz3K0z/98zwv9HaEJBNW6Sd
 pnwfCCJl64u1JiKeZM3d37G1TT91/nXW2qngFaPEMlPOTtWoobRoDEdveN4Yf2hl7OaU1qftAtR
 AAR6Jk/grCbWmBv/e22eEQrEfaQxyGJfoVdNQE+o2RbfiwSdYst8vRmOMfsYMA6qK0qbSoVGEfk
 KoKkgxg2UqwtP2tCf6nvX1MSThz6yqKVl3/IP+NbDu6bl1wT/ZkZ/AggSi9wMjZ5s1ltYEeY/hj
 yqUAukb4Npf7pPXpNWdlm/EhcyNEaHDxkNHzqaqXrokvm7HPoLaeeevU0Uy0DFjOJXVDmeNP6k1
 CspsLh35a+g4EyMMmYgzgV1ZdRu5MFbl+OP7n+9IOP7x57H0pFdfQOFVq1ONOWO+Usclj6S/EgN
 0S6FQERXGmE52DXMKCEQhf7kM+
X-Google-Smtp-Source: AGHT+IGE0ZjscP742EdyKh9uzu23uLZ3l6gi0agALTuRuYrf+rNDfvZsYNVo2p4Uu5MAT2Id6+WoIQ==
X-Received: by 2002:a05:6000:1447:b0:3ec:dd12:54d3 with SMTP id
 ffacd0b85a97d-42cc1d0c37dmr9157966f8f.35.1763938313681; 
 Sun, 23 Nov 2025 14:51:53 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:51:52 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [RFC v2 06/11] nvme-pci: add support for dmabuf reggistration
Date: Sun, 23 Nov 2025 22:51:26 +0000
Message-ID: <9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763725387.git.asml.silence@gmail.com>
References: <cover.1763725387.git.asml.silence@gmail.com>
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

Implement dma-token related callbacks for nvme block devices.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 95 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index e5ca8301bb8b..63e03c3dc044 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -27,6 +27,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/sed-opal.h>
+#include <linux/blk-mq-dma-token.h>
 
 #include "trace.h"
 #include "nvme.h"
@@ -482,6 +483,92 @@ static void nvme_release_descriptor_pools(struct nvme_dev *dev)
 	}
 }
 
+static void nvme_dmabuf_move_notify(struct dma_buf_attachment *attach)
+{
+	blk_mq_dma_map_move_notify(attach->importer_priv);
+}
+
+const struct dma_buf_attach_ops nvme_dmabuf_importer_ops = {
+	.move_notify = nvme_dmabuf_move_notify,
+	.allow_peer2peer = true,
+};
+
+static int nvme_init_dma_token(struct request_queue *q,
+				struct blk_mq_dma_token *token)
+{
+	struct dma_buf_attachment *attach;
+	struct nvme_ns *ns = q->queuedata;
+	struct nvme_dev *dev = to_nvme_dev(ns->ctrl);
+	struct dma_buf *dmabuf = token->dmabuf;
+
+	if (dmabuf->size % NVME_CTRL_PAGE_SIZE)
+		return -EINVAL;
+
+	attach = dma_buf_dynamic_attach(dmabuf, dev->dev,
+					&nvme_dmabuf_importer_ops, token);
+	if (IS_ERR(attach))
+		return PTR_ERR(attach);
+
+	token->private = attach;
+	return 0;
+}
+
+static void nvme_clean_dma_token(struct request_queue *q,
+				 struct blk_mq_dma_token *token)
+{
+	struct dma_buf_attachment *attach = token->private;
+
+	dma_buf_detach(token->dmabuf, attach);
+}
+
+static int nvme_dma_map(struct request_queue *q, struct blk_mq_dma_map *map)
+{
+	struct blk_mq_dma_token *token = map->token;
+	struct dma_buf_attachment *attach = token->private;
+	unsigned nr_entries;
+	unsigned long tmp, i = 0;
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+	dma_addr_t *dma_list;
+
+	nr_entries = token->dmabuf->size / NVME_CTRL_PAGE_SIZE;
+	dma_list = kmalloc_array(nr_entries, sizeof(dma_list[0]), GFP_KERNEL);
+	if (!dma_list)
+		return -ENOMEM;
+
+	sgt = dma_buf_map_attachment(attach, token->dir);
+	if (IS_ERR(sgt)) {
+		kfree(dma_list);
+		return PTR_ERR(sgt);
+	}
+	map->sgt = sgt;
+
+	for_each_sgtable_dma_sg(sgt, sg, tmp) {
+		dma_addr_t dma = sg_dma_address(sg);
+		unsigned long sg_len = sg_dma_len(sg);
+
+		while (sg_len) {
+			dma_list[i++] = dma;
+			dma += NVME_CTRL_PAGE_SIZE;
+			sg_len -= NVME_CTRL_PAGE_SIZE;
+		}
+	}
+
+	map->private = dma_list;
+	return 0;
+}
+
+static void nvme_dma_unmap(struct request_queue *q, struct blk_mq_dma_map *map)
+{
+	struct blk_mq_dma_token *token = map->token;
+	struct dma_buf_attachment *attach = token->private;
+	dma_addr_t *dma_list = map->private;
+
+	dma_buf_unmap_attachment_unlocked(attach, map->sgt, token->dir);
+	map->sgt = NULL;
+	kfree(dma_list);
+}
+
 static int nvme_init_hctx_common(struct blk_mq_hw_ctx *hctx, void *data,
 		unsigned qid)
 {
@@ -1067,6 +1154,9 @@ static blk_status_t nvme_map_data(struct request *req)
 	struct blk_dma_iter iter;
 	blk_status_t ret;
 
+	if (req->bio && bio_flagged(req->bio, BIO_DMA_TOKEN))
+		return BLK_STS_RESOURCE;
+
 	/*
 	 * Try to skip the DMA iterator for single segment requests, as that
 	 * significantly improves performances for small I/O sizes.
@@ -2093,6 +2183,11 @@ static const struct blk_mq_ops nvme_mq_ops = {
 	.map_queues	= nvme_pci_map_queues,
 	.timeout	= nvme_timeout,
 	.poll		= nvme_poll,
+
+	.dma_map	= nvme_dma_map,
+	.dma_unmap 	= nvme_dma_unmap,
+	.init_dma_token =  nvme_init_dma_token,
+	.clean_dma_token = nvme_clean_dma_token,
 };
 
 static void nvme_dev_remove_admin(struct nvme_dev *dev)
-- 
2.52.0

