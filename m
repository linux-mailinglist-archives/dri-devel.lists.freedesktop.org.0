Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119CACC3A6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 11:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E26910E1FC;
	Tue,  3 Jun 2025 09:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta20.hihonor.com (mta20.honor.com [81.70.206.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB5410E274
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 09:53:56 +0000 (UTC)
Received: from w012.hihonor.com (unknown [10.68.27.189])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bBQw571wWzYlP63;
 Tue,  3 Jun 2025 17:51:33 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Jun
 2025 17:53:50 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Jun
 2025 17:53:50 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <kraxel@redhat.com>, <vivek.kasireddy@intel.com>, <viro@zeniv.linux.org.uk>,
 <brauner@kernel.org>, <hughd@google.com>, <akpm@linux-foundation.org>,
 <amir73il@gmail.com>
CC: <benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>, <jack@suse.cz>,
 <baolin.wang@linux.alibaba.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <bintian.wang@honor.com>, <yipengxiang@honor.com>,
 <liulu.liu@honor.com>, <feng.han@honor.com>, wangtao <tao.wangtao@honor.com>
Subject: [PATCH v4 3/4] udmabuf: Implement udmabuf direct I/O
Date: Tue, 3 Jun 2025 17:52:44 +0800
Message-ID: <20250603095245.17478-4-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250603095245.17478-1-tao.wangtao@honor.com>
References: <20250603095245.17478-1-tao.wangtao@honor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.144.18.117]
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a010.hihonor.com
 (10.68.16.52)
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

Construct bio_vec from folios, then call the other file's
r/w callbacks for IO operations.
Test data shows direct I/O copy_file_range improves performance by
over 50% vs direct I/O mmap&read (2557 vs 1534).

Test data:
|    32x32MB Read 1024MB  |Creat-ms|Close-ms|  I/O-ms|I/O-MB/s| I/O%
|-------------------------|--------|--------|--------|--------|-----
| 1)Beg udmabuf buffer R/W|    580 |    323 |   1238 |    867 | 100%
| 2)     dmabuf buffer R/W|     48 |      5 |   1149 |    934 | 107%
| 3) udma+memfd buffer R/W|    597 |    340 |   2157 |    497 |  57%
| 4) udma+memfd direct R/W|    573 |    340 |    700 |   1534 | 176%
| 5) u+mfd buffer sendfile|    577 |    340 |   1204 |    891 | 102%
| 6) u+mfd direct sendfile|    567 |    339 |   2272 |    472 |  54%
| 7)   u+mfd buffer splice|    570 |    337 |   1114 |    964 | 111%
| 8)   u+mfd direct splice|    564 |    335 |    793 |   1355 | 156%
| 9)  udmabuf buffer c_f_r|    577 |    323 |   1059 |   1014 | 116%
|10)  udmabuf direct c_f_r|    582 |    325 |    420 |   2557 | 294%
|11)End udmabuf buffer R/W|    586 |    323 |   1188 |    903 | 104%

Signed-off-by: wangtao <tao.wangtao@honor.com>
---
 drivers/dma-buf/udmabuf.c | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index e74e36a8ecda..511567b15340 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -15,6 +15,8 @@
 #include <linux/udmabuf.h>
 #include <linux/vmalloc.h>
 #include <linux/iosys-map.h>
+#include <linux/bvec.h>
+#include <linux/uio.h>
 
 static int list_limit = 1024;
 module_param(list_limit, int, 0644);
@@ -284,6 +286,55 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
 	return 0;
 }
 
+static ssize_t udmabuf_rw_file(struct dma_buf *dmabuf, loff_t my_pos,
+			struct file *other, loff_t pos,
+			size_t count, bool is_write)
+{
+	struct udmabuf *ubuf = dmabuf->priv;
+	loff_t my_end = my_pos + count, bv_beg, bv_end = 0;
+	size_t i, bv_off, bv_len, bv_idx = 0;
+	struct bio_vec *bvec;
+	struct kiocb kiocb;
+	struct iov_iter iter;
+	unsigned int direction = is_write ? ITER_SOURCE : ITER_DEST;
+	ssize_t ret = 0;
+	struct folio *folio;
+
+	bvec = kvcalloc(ubuf->nr_pinned, sizeof(*bvec), GFP_KERNEL);
+	if (!bvec)
+		return -ENOMEM;
+
+	init_sync_kiocb(&kiocb, other);
+	kiocb.ki_pos = pos;
+
+	for (i = 0; i < ubuf->nr_pinned; i++) {
+		folio = ubuf->pinned_folios[i];
+		bv_beg = bv_end;
+		if (bv_beg >= my_end)
+			break;
+		bv_end += folio_size(folio);
+		if (bv_end <= my_pos)
+			continue;
+
+		bv_len = min(bv_end, my_end) - max(my_pos, bv_beg);
+		bv_off = my_pos > bv_beg ? my_pos - bv_beg : 0;
+		bvec_set_page(&bvec[bv_idx], &folio->page, bv_len, bv_off);
+		++bv_idx;
+	}
+
+	if (bv_idx > 0) {
+		/* start R/W. */
+		iov_iter_bvec(&iter, direction, bvec, bv_idx, count);
+		if (is_write)
+			ret = other->f_op->write_iter(&kiocb, &iter);
+		else
+			ret = other->f_op->read_iter(&kiocb, &iter);
+	}
+	kvfree(bvec);
+
+	return ret;
+}
+
 static const struct dma_buf_ops udmabuf_ops = {
 	.cache_sgt_mapping = true,
 	.map_dma_buf	   = map_udmabuf,
@@ -294,6 +345,7 @@ static const struct dma_buf_ops udmabuf_ops = {
 	.vunmap		   = vunmap_udmabuf,
 	.begin_cpu_access  = begin_cpu_udmabuf,
 	.end_cpu_access    = end_cpu_udmabuf,
+	.rw_file = udmabuf_rw_file,
 };
 
 #define SEALS_WANTED (F_SEAL_SHRINK)
@@ -455,6 +507,8 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = PTR_ERR(dmabuf);
 		goto err;
 	}
+	/* Support direct I/O */
+	dmabuf->file->f_mode |= FMODE_CAN_ODIRECT;
 	/*
 	 * Ownership of ubuf is held by the dmabuf from here.
 	 * If the following dma_buf_fd() fails, dma_buf_put() cleans up both the
-- 
2.17.1

