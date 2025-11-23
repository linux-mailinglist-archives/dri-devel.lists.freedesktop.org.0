Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA3C7E86A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD82010E1A9;
	Sun, 23 Nov 2025 22:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EVumxTcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7F010E1A9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:51:57 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42bb288c17bso2197187f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938316; x=1764543116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aczXTymWXQPIGDaXnf/nBr9xYQNzFFU48NeAsCHNOPA=;
 b=EVumxTcprHq/xNPjJDhEOPH9Pn6dBVDOm6fEwx+qJ24DJkUzigEGl++KLtaos40PTg
 5zHeNGHm6UD1effvkpv1E/QBrkWI1c8mkdsOfL2xXTwfmUUyrUaNBRgA2+RvP7bBXfua
 SrYy+hzpi/ZoaiEN8mCoWn2zFq+g+Fgm8tSzWJSXyQPxdMBymoTlirYLxiSYrDN7FG2N
 98DRl/A4v22C9yTlKpEEOrbuK7PDhZqCfLXnNdQieaC5JeXw+3SSFWaAcEg/y7rZal0f
 7nARn6e5RmJJKvylQx7Y1JX0b7pTHRxNU5e6WEa8jMQhDAZaX2tu8tk6R8jmnIAdgYQF
 s7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938316; x=1764543116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aczXTymWXQPIGDaXnf/nBr9xYQNzFFU48NeAsCHNOPA=;
 b=ZOB9pZU9f7UbZlUYyE13kyDJ1XzY0eBa4yWWLyrvz01qugbE9I90RJQOT+egMjX0Wa
 1nYXwOwV7hdrxJM5goyTGjluPhvvYclu3dQqHR6WHWRHaoJUsfqsXYaOG6xEdVpaZYgK
 zb13CKta231GkleEc7pbduOUFe763ez4yb5/esyBuqZkbkhH2v2DvSX6/amXeDdKxjVx
 /W+WUxMpuXUU7wjDeNkBWHTPgW8V2RBc27kAm4BQLvc2nkI1xsQPtr6FeRi7LihAtV3s
 w+zZPTDpA/NPMs1693j6a3skQQlOMAtcUQfUiTwQB5ItcLhza+4azmB9xmTbW01FJk00
 y3Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjfIhhlndoCCTliV/xLdHYgvCHMhcjJLMZ7ZRkflluI6WWsBI6v8OV65/HWyGn+NWMGpBqJVqRpJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQpn4xdab0hwf6l6NMxSKwCXNLfW6wQBU+KXe4MDhbYVRUfU4l
 Ivb1ot/3hf3oBcWazU27+rrloUwKqptz0vjJ9FIDzHREcP5cS2DvPjG8
X-Gm-Gg: ASbGncsPePf7VG9oVqwwN8B6/wwupdHDhNTbh8PGG5vu7OW/0MMsyx3G8LK1nVn2ZBn
 lFyRJty1rke7DoYK0ZWBJsOcq+QM+e/xG8c8K7eXdTIf9d9jh0v7uv5CO6TvUWl0T4qY4m4Aull
 3Q32eNutQ+IrAt9XLh7o7UsEYwIE+nBfqf7zmnreFas/XAWTiMrtybc6GS52VBYycNpqVrIMRUG
 suHpEVy9h1hf5ta8CvQNzUREn6T4rREtp8N+IxInjML6hLVkR80cMURRuxF62BZJe3MOevYZDT0
 R7rl73aYKiZyjCbH/nbx/OrOOaEST0vMVV597gew1MYCVsc0H+ipyClmeuK7Xyk8EsrFBpEf4nr
 PFN4iNMTIL8j3ZR+j7r6453/nieFRTxpsz/U5r5/VxB/RY7ioL0jq99H2XD2SKav+jXOpRekpac
 7tgUcLQRIecmBFHw==
X-Google-Smtp-Source: AGHT+IEhsmDeavDDsXXTdPeMYswvjoeFYMEcGIVgrZUZIxbXidFIxZRmwhVPCPHioGiavOVUtI6phA==
X-Received: by 2002:a05:6000:2893:b0:42b:55f3:6196 with SMTP id
 ffacd0b85a97d-42cc1ab89b3mr10647235f8f.4.1763938316187; 
 Sun, 23 Nov 2025 14:51:56 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:51:54 -0800 (PST)
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
Subject: [RFC v2 07/11] nvme-pci: implement dma_token backed requests
Date: Sun, 23 Nov 2025 22:51:27 +0000
Message-ID: <a86bbe2d8d105ed2c342749cd46ece2d1c537821.1763725388.git.asml.silence@gmail.com>
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

Enable BIO_DMA_TOKEN backed requests. It requires special handling to
set up the nvme request from the prepared in advance mapping, tear it
down and sync the buffers.

Suggested-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 126 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 63e03c3dc044..ac377416b088 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -797,6 +797,123 @@ static void nvme_free_descriptors(struct request *req)
 	}
 }
 
+static void nvme_sync_dma(struct nvme_dev *nvme_dev, struct request *req,
+			  enum dma_data_direction dir)
+{
+	struct blk_mq_dma_map *map = req->dma_map;
+	int length = blk_rq_payload_bytes(req);
+	bool for_cpu = dir == DMA_FROM_DEVICE;
+	struct device *dev = nvme_dev->dev;
+	dma_addr_t *dma_list = map->private;
+	struct bio *bio = req->bio;
+	int offset, map_idx;
+
+	offset = bio->bi_iter.bi_bvec_done;
+	map_idx = offset / NVME_CTRL_PAGE_SIZE;
+	length += offset & (NVME_CTRL_PAGE_SIZE - 1);
+
+	while (length > 0) {
+		u64 dma_addr = dma_list[map_idx++];
+
+		if (for_cpu)
+			__dma_sync_single_for_cpu(dev, dma_addr,
+						  NVME_CTRL_PAGE_SIZE, dir);
+		else
+			__dma_sync_single_for_device(dev, dma_addr,
+						     NVME_CTRL_PAGE_SIZE, dir);
+		length -= NVME_CTRL_PAGE_SIZE;
+	}
+}
+
+static void nvme_unmap_premapped_data(struct nvme_dev *dev,
+				      struct request *req)
+{
+	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
+
+	if (rq_data_dir(req) == READ)
+		nvme_sync_dma(dev, req, DMA_FROM_DEVICE);
+	if (!(iod->flags & IOD_SINGLE_SEGMENT))
+		nvme_free_descriptors(req);
+}
+
+static blk_status_t nvme_dma_premapped(struct request *req,
+				       struct nvme_queue *nvmeq)
+{
+	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
+	int length = blk_rq_payload_bytes(req);
+	struct blk_mq_dma_map *map = req->dma_map;
+	u64 dma_addr, prp1_dma, prp2_dma;
+	struct bio *bio = req->bio;
+	dma_addr_t *dma_list;
+	dma_addr_t prp_dma;
+	__le64 *prp_list;
+	int i, map_idx;
+	int offset;
+
+	dma_list = map->private;
+
+	if (rq_data_dir(req) == WRITE)
+		nvme_sync_dma(nvmeq->dev, req, DMA_TO_DEVICE);
+
+	offset = bio->bi_iter.bi_bvec_done;
+	map_idx = offset / NVME_CTRL_PAGE_SIZE;
+	offset &= (NVME_CTRL_PAGE_SIZE - 1);
+
+	prp1_dma = dma_list[map_idx++] + offset;
+
+	length -= (NVME_CTRL_PAGE_SIZE - offset);
+	if (length <= 0) {
+		prp2_dma = 0;
+		goto done;
+	}
+
+	if (length <= NVME_CTRL_PAGE_SIZE) {
+		prp2_dma = dma_list[map_idx];
+		goto done;
+	}
+
+	if (DIV_ROUND_UP(length, NVME_CTRL_PAGE_SIZE) <=
+	    NVME_SMALL_POOL_SIZE / sizeof(__le64))
+		iod->flags |= IOD_SMALL_DESCRIPTOR;
+
+	prp_list = dma_pool_alloc(nvme_dma_pool(nvmeq, iod), GFP_ATOMIC,
+			&prp_dma);
+	if (!prp_list)
+		return BLK_STS_RESOURCE;
+
+	iod->descriptors[iod->nr_descriptors++] = prp_list;
+	prp2_dma = prp_dma;
+	i = 0;
+	for (;;) {
+		if (i == NVME_CTRL_PAGE_SIZE >> 3) {
+			__le64 *old_prp_list = prp_list;
+
+			prp_list = dma_pool_alloc(nvmeq->descriptor_pools.large,
+					GFP_ATOMIC, &prp_dma);
+			if (!prp_list)
+				goto free_prps;
+			iod->descriptors[iod->nr_descriptors++] = prp_list;
+			prp_list[0] = old_prp_list[i - 1];
+			old_prp_list[i - 1] = cpu_to_le64(prp_dma);
+			i = 1;
+		}
+
+		dma_addr = dma_list[map_idx++];
+		prp_list[i++] = cpu_to_le64(dma_addr);
+
+		length -= NVME_CTRL_PAGE_SIZE;
+		if (length <= 0)
+			break;
+	}
+done:
+	iod->cmd.common.dptr.prp1 = cpu_to_le64(prp1_dma);
+	iod->cmd.common.dptr.prp2 = cpu_to_le64(prp2_dma);
+	return BLK_STS_OK;
+free_prps:
+	nvme_free_descriptors(req);
+	return BLK_STS_RESOURCE;
+}
+
 static void nvme_free_prps(struct request *req, unsigned int attrs)
 {
 	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
@@ -875,6 +992,11 @@ static void nvme_unmap_data(struct request *req)
 	struct device *dma_dev = nvmeq->dev->dev;
 	unsigned int attrs = 0;
 
+	if (req->bio && bio_flagged(req->bio, BIO_DMA_TOKEN)) {
+		nvme_unmap_premapped_data(nvmeq->dev, req);
+		return;
+	}
+
 	if (iod->flags & IOD_SINGLE_SEGMENT) {
 		static_assert(offsetof(union nvme_data_ptr, prp1) ==
 				offsetof(union nvme_data_ptr, sgl.addr));
@@ -1154,8 +1276,8 @@ static blk_status_t nvme_map_data(struct request *req)
 	struct blk_dma_iter iter;
 	blk_status_t ret;
 
-	if (req->bio && bio_flagged(req->bio, BIO_DMA_TOKEN))
-		return BLK_STS_RESOURCE;
+	if (req->dma_map)
+		return nvme_dma_premapped(req, nvmeq);
 
 	/*
 	 * Try to skip the DMA iterator for single segment requests, as that
-- 
2.52.0

