Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA41D14FF
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0DF6EA2C;
	Wed, 13 May 2020 13:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E91E6EA2A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:32:59 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133257euoutp01948dd68a200883551540a36a6a3f447b~OmcIiXgCZ2196321963euoutp01S
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:32:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200513133257euoutp01948dd68a200883551540a36a6a3f447b~OmcIiXgCZ2196321963euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376777;
 bh=SMTxZNZpTSAf+VjaRdwIa7Y+Y92ELOA8MjwAFVO+Mus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VKrLxF3KEiWmVZ1axlhSlzty0rd2nUqXsHuI7B7LU28r5TvCvsp+0bgDe4vtq9QOY
 WiKZcd124gvPVjK5otBDPFZ8OFs4Ng94v6RMIBwxoj8zDX9Eu+NKd2eBdrnLRwwAaZ
 2zo3AcPWxR1hl6t0/nrmIY5WXFjlcZ6Vzn2OE+7A=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200513133257eucas1p1ab88f1465f6ce76a0c7f470a63001ea2~OmcIUwDTB0876608766eucas1p1h;
 Wed, 13 May 2020 13:32:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FD.B5.61286.907FBBE5; Wed, 13
 May 2020 14:32:57 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200513133256eucas1p273110d0c8f67e52fc7385acef776efaa~OmcH5dMRP0359403594eucas1p2L;
 Wed, 13 May 2020 13:32:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133256eusmtrp11bf699394ab06f7b9d70d588c796f3dc~OmcH4xvA20994509945eusmtrp1W;
 Wed, 13 May 2020 13:32:56 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-28-5ebbf709f135
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B7.0A.08375.807FBBE5; Wed, 13
 May 2020 14:32:56 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133256eusmtip10a029b12870de4156e2e5b8913fad120~OmcHTRPCk2465024650eusmtip1_;
 Wed, 13 May 2020 13:32:56 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/38] dma-mapping: add generic helpers for mapping
 sgtable objects
Date: Wed, 13 May 2020 15:32:08 +0200
Message-Id: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513132114.6046-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRju29nZzqbT45R80UyYJGSpSf04MLPCfpz+RAVZCpkrD2ptajte
 +6Moai0NL5XDUsS8OzUvaUzFHNkUaZSaTPOaFZbZwltYoG0erX/P7X2f7/v4CExajbsRMbEJ
 jDpWoZQJxPyO1xsmX9GvrvAjwzPOVJ5pkEe1aJtxaqujAKNG1ywCqq6hn0eV98qp1dE5HtU6
 P4ZTI/onAqrx1ZSQ6vv5CT9pR+vKdIjuWS/n053rszg9c8/Io9sq0+gPm/MYXWSuQXTXeLqA
 vt9ej+iV1v3nxGHiwEhGGZPEqP2DIsTRedn1KL7JO+VBZjWejno8NUhEAHkMzMZapEFiQkrW
 IuhbsAhthpRcRTC4xeOMFQTlOj3anfg+t8znjBoEj+pKd4h1ouJ9Js+WEpABoFnSCGzYhcxC
 MJBnb8MYqeVB/2KiDTuTl6HMMLq9lU8egIovOsyGJWQgGAe0ONfmCQ3PXm7rIvI4LD/fwG1l
 QDYJ4anFaC0jrOQ0zLyhuLwzfDO2Czm8D4aKcvlcPhPBnKlRyJFcBCMZ2p37yGHS9FtgW4SR
 B6FZ78/Jp8BUqMe5/Q5gXnLizu8AhR3FGCdL4E62lEt7Q4mx6V9t39thjMM0tC+27bxiPoJ2
 8yDKR54l/8vKEapHrkwiq4pi2IBYJtmPVajYxNgov+txqlZk/T1Dm8blF2ht+JoBkQSS2Uuo
 ia5wKa5IYlNVBgQEJnORnG22SpJIReptRh13VZ2oZFgDcif4MlfJ0YqvV6RklCKBuckw8Yx6
 1+URIrd0hO9Jsp8oyDhx2P9jWkujV+g7cw3sveDhkdDL5FQ5uKvOB1eG6lLsSkM0d32TJmYV
 cWeSu8URh5zAyzF1hk3rnizOueW5EPRHqZ2XpGT/yCzqlVvknXaPLzo+ZNDspc35YGHVWOf0
 Z33bjfGpwKy4kNaSaQsVUqca8MnNlYcVyfhstCLAB1Ozir/3t71COQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42I5/e/4XV2O77vjDCb9MbLoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgitKzKcov
 LUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL6G1bxViwTq1i
 SvMy1gbGvfJdjJwcEgImEm8efmLpYuTiEBJYyijxasFTVoiEjMTJaQ1QtrDEn2tdbBBFnxgl
 3h14DpZgEzCU6HoLkRAR6GSUmNb9kR3EYRaYxySx6OEhdpAqYYEwiZ0ftoHZLAKqEouerWEG
 sXkFbCSOn5gBtUJeYvWGA2BxTgFbiU9bf4LFhYBq1rbOYZvAyLeAkWEVo0hqaXFuem6xoV5x
 Ym5xaV66XnJ+7iZGYDxsO/Zz8w7GSxuDDzEKcDAq8fBa3NodJ8SaWFZcmXuIUYKDWUmE1289
 UIg3JbGyKrUoP76oNCe1+BCjKdBRE5mlRJPzgbGaVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZI
 ID2xJDU7NbUgtQimj4mDU6qBMaSi692hcinJ34t2HWxjfe1+2VN/o1/Uu6n6q+MfJNzYYd+y
 f00hzz4Z6V1fjF4fPrAveW7xvIJpB6LWr0/nf+uv6ye37IqIcPXl83lKdwIYk5RO7boQpFHR
 sXx1oEHYzjvRWp+dGJ8EuNV/jedZ3idy947AAeGUS0fPXd6cFXHQk3/htv97piuxFGckGmox
 FxUnAgDvD09CnQIAAA==
X-CMS-MailID: 20200513133256eucas1p273110d0c8f67e52fc7385acef776efaa
X-Msg-Generator: CA
X-RootMTR: 20200513133256eucas1p273110d0c8f67e52fc7385acef776efaa
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133256eucas1p273110d0c8f67e52fc7385acef776efaa
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <CGME20200513133256eucas1p273110d0c8f67e52fc7385acef776efaa@eucas1p2.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct sg_table is a common structure used for describing a memory
buffer. It consists of a scatterlist with memory pages and DMA addresses
(sgl entry), as well as the number of scatterlist entries: CPU pages
(orig_nents entry) and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg
function.

To avoid such issues, let's introduce a common wrappers operating directly
on the struct sg_table objects, which take care of the proper use of
the nents and orig_nents entries.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com> 
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 include/linux/dma-mapping.h | 78 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index b43116a..b50fe36 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -609,6 +609,84 @@ static inline void dma_sync_single_range_for_device(struct device *dev,
 	return dma_sync_single_for_device(dev, addr + offset, size, dir);
 }
 
+/**
+ * dma_map_sgtable - Map the given buffer for DMA
+ * @dev:	The device for which to perform the DMA operation
+ * @sgt:	The sg_table object describing the buffer
+ * @dir:	DMA direction
+ * @attrs:	Optional DMA attributes for the map operation
+ *
+ * Maps a buffer described by a scatterlist stored in the given sg_table
+ * object for the @dir DMA operation by the @dev device. After success
+ * the ownership for the buffer is transferred to the DMA domain. One has
+ * to call dma_sync_sgtable_for_cpu() or dma_unmap_sgtable() to move the
+ * ownership of the buffer back to the CPU domain before touching the
+ * buffer by the CPU.
+ * Returns 0 on success or -EINVAL on error during mapping the buffer.
+ */
+static inline int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
+		enum dma_data_direction dir, unsigned long attrs)
+{
+	int n = dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
+
+	if (n <= 0)
+		return -EINVAL;
+	sgt->nents = n;
+	return 0;
+}
+
+/**
+ * dma_unmap_sgtable - Unmap the given buffer for DMA
+ * @dev:	The device for which to perform the DMA operation
+ * @sgt:	The sg_table object describing the buffer
+ * @dir:	DMA direction
+ * @attrs:	Optional DMA attributes for the unmap operation
+ *
+ * Unmaps a buffer described by a scatterlist stored in the given sg_table
+ * object for the @dir DMA operation by the @dev device. After this function
+ * the ownership of the buffer is transferred back to the CPU domain.
+ */
+static inline void dma_unmap_sgtable(struct device *dev, struct sg_table *sgt,
+		enum dma_data_direction dir, unsigned long attrs)
+{
+	dma_unmap_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
+}
+
+/**
+ * dma_sync_sgtable_for_cpu - Synchronize the given buffer for CPU access
+ * @dev:	The device for which to perform the DMA operation
+ * @sgt:	The sg_table object describing the buffer
+ * @dir:	DMA direction
+ *
+ * Performs the needed cache synchronization and moves the ownership of the
+ * buffer back to the CPU domain, so it is safe to perform any access to it
+ * by the CPU. Before doing any further DMA operations, one has to transfer
+ * the ownership of the buffer back to the DMA domain by calling the
+ * dma_sync_sgtable_for_device().
+ */
+static inline void dma_sync_sgtable_for_cpu(struct device *dev,
+		struct sg_table *sgt, enum dma_data_direction dir)
+{
+	dma_sync_sg_for_cpu(dev, sgt->sgl, sgt->orig_nents, dir);
+}
+
+/**
+ * dma_sync_sgtable_for_device - Synchronize the given buffer for DMA
+ * @dev:	The device for which to perform the DMA operation
+ * @sgt:	The sg_table object describing the buffer
+ * @dir:	DMA direction
+ *
+ * Performs the needed cache synchronization and moves the ownership of the
+ * buffer back to the DMA domain, so it is safe to perform the DMA operation.
+ * Once finished, one has to call dma_sync_sgtable_for_cpu() or
+ * dma_unmap_sgtable().
+ */
+static inline void dma_sync_sgtable_for_device(struct device *dev,
+		struct sg_table *sgt, enum dma_data_direction dir)
+{
+	dma_sync_sg_for_device(dev, sgt->sgl, sgt->orig_nents, dir);
+}
+
 #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
 #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
 #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
