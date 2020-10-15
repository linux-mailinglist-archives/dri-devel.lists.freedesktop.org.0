Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF4728FAE4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 23:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484BE6E1EE;
	Thu, 15 Oct 2020 21:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4386E1EE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 21:48:46 +0000 (UTC)
IronPort-SDR: +KglNOgxoutbfzKNfcRVExOCVXBeShmtpBmbv+v8xHk7wmOVF7AbMbCoebiFD9F+rzfL8nG6TE
 Zqpiv1OXWIQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="251149374"
X-IronPort-AV: E=Sophos;i="5.77,380,1596524400"; d="scan'208";a="251149374"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 14:48:45 -0700
IronPort-SDR: y0ranw1JxLnitQsTce/ua/Bu76A+mbHQLxiNVUHgdVvNZURtU1glBqOq+aykYZR3kjhT+BMEQ1
 Lzt7i7TL+lyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,380,1596524400"; d="scan'208";a="330954089"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga002.jf.intel.com with ESMTP; 15 Oct 2020 14:48:45 -0700
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 5/5] dma-buf: Clarify that dma-buf sg lists are page aligned
Date: Thu, 15 Oct 2020 15:03:00 -0700
Message-Id: <1602799380-138355-1-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma-buf API have been used under the assumption that the sg lists
returned from dma_buf_map_attachment() are fully page aligned. Lots of
stuff can break otherwise all over the place. Clarify this in the
documentation and add a check when DMA API debug is enabled.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
Reviewed-by: Christian Koenig <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-buf.c | 21 +++++++++++++++++++++
 include/linux/dma-buf.h   |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 844967f..7309c83 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -851,6 +851,9 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
  * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
  * on error. May return -EINTR if it is interrupted by a signal.
  *
+ * On success, the DMA addresses and lengths in the returned scatterlist are
+ * PAGE_SIZE aligned.
+ *
  * A mapping must be unmapped by using dma_buf_unmap_attachment(). Note that
  * the underlying backing storage is pinned for as long as a mapping exists,
  * therefore users/importers should not hold onto a mapping for undue amounts of
@@ -904,6 +907,24 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		attach->dir = direction;
 	}
 
+#ifdef CONFIG_DMA_API_DEBUG
+	{
+		struct scatterlist *sg;
+		u64 addr;
+		int len;
+		int i;
+
+		for_each_sgtable_dma_sg(sg_table, sg, i) {
+			addr = sg_dma_address(sg);
+			len = sg_dma_len(sg);
+			if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(len)) {
+				pr_debug("%s: addr %llx or len %x is not page aligned!\n",
+					 __func__, addr, len);
+			}
+		}
+	}
+#endif /* CONFIG_DMA_API_DEBUG */
+
 	return sg_table;
 }
 EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index a2ca294e..4a5fa70 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -145,7 +145,8 @@ struct dma_buf_ops {
 	 *
 	 * A &sg_table scatter list of or the backing storage of the DMA buffer,
 	 * already mapped into the device address space of the &device attached
-	 * with the provided &dma_buf_attachment.
+	 * with the provided &dma_buf_attachment. The addresses and lengths in
+	 * the scatter list are PAGE_SIZE aligned.
 	 *
 	 * On failure, returns a negative error value wrapped into a pointer.
 	 * May also return -EINTR when a signal was received while being
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
