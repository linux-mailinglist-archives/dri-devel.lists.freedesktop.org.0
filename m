Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C628611CC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 13:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659C510EBF9;
	Fri, 23 Feb 2024 12:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=analog.com header.i=@analog.com header.b="JQvsz7BZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2093 seconds by postgrey-1.36 at gabe;
 Fri, 23 Feb 2024 12:46:09 UTC
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548E810EBF9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 12:46:09 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N6VQ5w002016; Fri, 23 Feb 2024 07:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=DKIM; bh=5a7n4SpiB+g7Oy9l9NWszRo6H+kOBtRSNu5LOhckpu4=; b=
 JQvsz7BZSCUqO4dDq4WPCCugf6eGzBI/id9iNFQ+mAlzmOs+VFOi6qZpN+Vd2Peb
 qdFIn010YeYedRBtzxTb6AAao9F/uwCL9jWEEQl5bGwnvdPpkYd6tuWDhfJShEgl
 J5nj34ptAmr8kr6aKjeHmCcK22BDVN6wGQ4J4hkWIzemxHT6mEhjyeVeKGPdWI6v
 cBCq5qQEzzon2PbTA50QU9N+YNVtGP8YLnZV1ZEOXaPxIwnzPHMeYG4SZbju0Zaw
 uT4cPbFgp0udPFlmOk/865FUdZPesz5YJqXuEXUJIYWXBZJt3KrmbOjRN6x2viL0
 pxziUQfjltMfD6yDTXbVeg==
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3wep5mh41u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 07:11:14 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 41NCB9Kv033133
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 23 Feb 2024 07:11:09 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 23 Feb
 2024 07:11:08 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 23 Feb 2024 07:11:08 -0500
Received: from [127.0.0.1] ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41NCAb2W032246;
 Fri, 23 Feb 2024 07:10:59 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Fri, 23 Feb 2024 13:14:03 +0100
Subject: [PATCH v7 5/6] iio: buffer-dmaengine: Support new DMABUF based
 userspace API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240223-iio-dmabuf-v7-5-78cfaad117b9@analog.com>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
In-Reply-To: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
To: Vinod Koul <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Cameron <jic23@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Cercueil <paul@crapouillou.net>
CC: Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich
 <Michael.Hennerich@analog.com>,
 <linux-doc@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708690439; l=3326;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=7UZBjwkHqj39BUr5O4B3LRfoGCW+O2PrXk4l6mTzKJg=;
 b=TGljtzZdiBQ4fAVMB+H28H2JoT3ee7yAb4WCy4R8eP+0c3VA+7MIBvqV3xJS6L8eObBZ57MSn
 6okMo5snmjAAWTfYgHum/YtL5yZrMisP39fDmlqNWSQJxKiFNXtnkKC
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: mNOh_fBXvtKkLclg9ac4Dg_E7p-fs2WJ
X-Proofpoint-GUID: mNOh_fBXvtKkLclg9ac4Dg_E7p-fs2WJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230088
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

From: Paul Cercueil <paul@crapouillou.net>

Use the functions provided by the buffer-dma core to implement the
DMABUF userspace API in the buffer-dmaengine IIO buffer implementation.

Since we want to be able to transfer an arbitrary number of bytes and
not necesarily the full DMABUF, the associated scatterlist is converted
to an array of DMA addresses + lengths, which is then passed to
dmaengine_prep_slave_dma_array().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/iio/buffer/industrialio-buffer-dmaengine.c | 59 +++++++++++++++++++---
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
index a18c1da292af..3b7b649f0a89 100644
--- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
+++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
@@ -64,15 +64,55 @@ static int iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 	struct dmaengine_buffer *dmaengine_buffer =
 		iio_buffer_to_dmaengine_buffer(&queue->buffer);
 	struct dma_async_tx_descriptor *desc;
+	struct scatterlist *sgl;
+	struct dma_vec *vecs;
 	dma_cookie_t cookie;
+	size_t len_total;
+	size_t max_size;
+	unsigned int i;
+	int nents;
 
-	block->bytes_used = min(block->size, dmaengine_buffer->max_size);
-	block->bytes_used = round_down(block->bytes_used,
-			dmaengine_buffer->align);
+	if (queue->buffer.direction != IIO_BUFFER_DIRECTION_IN) {
+		/* We do not yet support output buffers. */
+		return -EINVAL;
+	}
 
-	desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
-		block->phys_addr, block->bytes_used, DMA_DEV_TO_MEM,
-		DMA_PREP_INTERRUPT);
+	if (block->sg_table) {
+		sgl = block->sg_table->sgl;
+		nents = sg_nents_for_len(sgl, block->bytes_used);
+		if (nents < 0)
+			return nents;
+
+		vecs = kmalloc_array(nents, sizeof(*vecs), GFP_ATOMIC);
+		if (!vecs)
+			return -ENOMEM;
+
+		len_total = block->bytes_used;
+
+		for (i = 0; i < nents; i++) {
+			vecs[i].addr = sg_dma_address(sgl);
+			vecs[i].len = min(sg_dma_len(sgl), len_total);
+			len_total -= vecs[i].len;
+
+			sgl = sg_next(sgl);
+		}
+
+		desc = dmaengine_prep_peripheral_dma_vec(dmaengine_buffer->chan,
+							 vecs, nents,
+							 DMA_DEV_TO_MEM,
+							 DMA_PREP_INTERRUPT, 0);
+		kfree(vecs);
+	} else {
+		max_size = min(block->size, dmaengine_buffer->max_size);
+		max_size = round_down(max_size, dmaengine_buffer->align);
+		block->bytes_used = max_size;
+
+		desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
+						   block->phys_addr,
+						   block->bytes_used,
+						   DMA_DEV_TO_MEM,
+						   DMA_PREP_INTERRUPT);
+	}
 	if (!desc)
 		return -ENOMEM;
 
@@ -120,6 +160,13 @@ static const struct iio_buffer_access_funcs iio_dmaengine_buffer_ops = {
 	.data_available = iio_dma_buffer_data_available,
 	.release = iio_dmaengine_buffer_release,
 
+	.enqueue_dmabuf = iio_dma_buffer_enqueue_dmabuf,
+	.attach_dmabuf = iio_dma_buffer_attach_dmabuf,
+	.detach_dmabuf = iio_dma_buffer_detach_dmabuf,
+
+	.lock_queue = iio_dma_buffer_lock_queue,
+	.unlock_queue = iio_dma_buffer_unlock_queue,
+
 	.modes = INDIO_BUFFER_HARDWARE,
 	.flags = INDIO_BUFFER_FLAG_FIXED_WATERMARK,
 };

-- 
2.43.2

