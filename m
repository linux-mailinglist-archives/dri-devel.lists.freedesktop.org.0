Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3431CF037
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C4B6E8C6;
	Tue, 12 May 2020 09:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029106E8C0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:09 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090108euoutp025f81d6b0df3fa735f6c32f98c0219c01~OPFhKpS2i0453404534euoutp023
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512090108euoutp025f81d6b0df3fa735f6c32f98c0219c01~OPFhKpS2i0453404534euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274068;
 bh=CVX0hiMXr2wjumHRzuMCI3rD0yXn5P1mGLiSnhpj7Nc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dTQ9zy4M5SFYxvWO6leTG4/IZ5zO8g8EO9JXnQ+wrdfWrRErhWKCTSzB538b6mE2y
 tMDBDLKUflEwzZzkoKOfutsH43mIo7Hd7QESWK73hKlVLwf+UdJQdah0RFVoRlHPML
 nGc+NFnKqACR9Pki0AlP3F3sIHL4Ubvx2iptlV3Q=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200512090108eucas1p22fc39f6d891980ab6599dbe89f996b43~OPFg2FCIZ2564425644eucas1p2C;
 Tue, 12 May 2020 09:01:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CD.12.60679.3D56ABE5; Tue, 12
 May 2020 10:01:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090107eucas1p13a38ce5ce4c15cd0033acaea7b26c9b0~OPFgjM79z1613916139eucas1p1S;
 Tue, 12 May 2020 09:01:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200512090107eusmtrp142855ef2916bc5564e1a45f18e163b05~OPFgijDhQ0183401834eusmtrp1J;
 Tue, 12 May 2020 09:01:07 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-6d-5eba65d38a59
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 5C.E2.07950.3D56ABE5; Tue, 12
 May 2020 10:01:07 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090107eusmtip1b2037aa85d846147c42bf55aa7eae1c6~OPFf5hCsF0782807828eusmtip1S;
 Tue, 12 May 2020 09:01:07 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/38] dma-mapping: add generic helpers for mapping
 sgtable objects
Date: Tue, 12 May 2020 11:00:21 +0200
Message-Id: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512085710.14688-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djPc7pXUnfFGXxrZ7ToPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgiuKySUnN
 ySxLLdK3S+DKaNy8g6nguGrF5edzmRoY78l1MXJySAiYSDQ96mTsYuTiEBJYwSjRu3MqE4Tz
 hVHi3rUNzBDOZ0aJHc39jDAtnf+vQrUsZ5RYNGErO0gCrGXmPycQm03AUKLrbRcbiC0i0Moo
 caKXB8RmFpjBJHH0dSmILSwQIbHo4QWwoSwCqhL7Ds5nBbF5BWwlmvp7oZbJS6zecIAZxOYU
 sJPofPiDHSK+jl1i53Z/CNtFovlcPwuELSzx6vgWqBoZidOTe1hADpUQaGaUeHhuLTuE08Mo
 cblpBtQGa4k7534BXcoBdJ2mxPpd+hBhR4ldx5+wg4QlBPgkbrwVhLifT2LStunMEGFeiY42
 IYhqNYlZx9fBrT144RJUiYfEgUtRkNCZyCjxe4HOBEb5WQirFjAyrmIUTy0tzk1PLTbKSy3X
 K07MLS7NS9dLzs/dxAhMO6f/Hf+yg3HXn6RDjAIcjEo8vAYGO+OEWBPLiitzDzFKcDArifC2
 ZAKFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYLQQ05pi
 1ySsm5x2QfVjkKD6PrGs+x4OSTW8T3fo97Veyj/Hwqr6/KS6W03visDHz88/Xq0o1vBIIL61
 SU7jnjPXfpl38cuzriXvPuf0sLTAPK03s+XD3tVlVn2KbT6PQ5vX1q12fllt9sqnOHXLvItd
 TWtyYy653tQT623id1mwXXafb36hEktxRqKhFnNRcSIA84/nVzcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4Xd3LqbviDD4s0rHoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgitKzKcov
 LUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLaNy8g6nguGrF
 5edzmRoY78l1MXJySAiYSHT+v8rYxcjFISSwlFHiy+qJjBAJGYmT0xpYIWxhiT/Xutggij4x
 SqxdcpMJJMEmYCjR9RYiISLQySgxrfsjO4jDLDCPSWLRw0NADgeHsECYxJbdHCANLAKqEvsO
 zgebyitgK9HU3wu1TV5i9YYDzCA2p4CdROfDH+wgthBQzcO+W6wTGPkWMDKsYhRJLS3OTc8t
 NtIrTswtLs1L10vOz93ECIyGbcd+btnB2PUu+BCjAAejEg9vh9HOOCHWxLLiytxDjBIczEoi
 vC2ZQCHelMTKqtSi/Pii0pzU4kOMpkBHTWSWEk3OB0ZqXkm8oamhuYWlobmxubGZhZI4b4fA
 wRghgfTEktTs1NSC1CKYPiYOTqkGRu/olx++8ud2FykYSVVznPJTMt95RLdK7sovhzUBNzID
 HhTFlpatllu3Z0uRxKG7fDzz5jNUvypSYP73+Sc7y1vVm9PuJS/RVdzBd6grodS+9Pw8zS77
 ae+VrO3uXFW+1ZJ4K0HHituMc2X4Fl6O596Mx7a0a2ruW7Yudr4LE88S3jVrpgW6KLEUZyQa
 ajEXFScCAIf2MGacAgAA
X-CMS-MailID: 20200512090107eucas1p13a38ce5ce4c15cd0033acaea7b26c9b0
X-Msg-Generator: CA
X-RootMTR: 20200512090107eucas1p13a38ce5ce4c15cd0033acaea7b26c9b0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090107eucas1p13a38ce5ce4c15cd0033acaea7b26c9b0
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <CGME20200512090107eucas1p13a38ce5ce4c15cd0033acaea7b26c9b0@eucas1p1.samsung.com>
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

To avoid such issues, lets introduce a common wrappers operating directly
on the struct sg_table objects, which take care of the proper use of
the nents and orig_nents entries.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 include/linux/dma-mapping.h | 79 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index b43116a..88f01cc 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -609,6 +609,85 @@ static inline void dma_sync_single_range_for_device(struct device *dev,
 	return dma_sync_single_for_device(dev, addr + offset, size, dir);
 }
 
+/**
+ * dma_map_sgtable - Map the given buffer for the DMA operations
+ * @dev:	The device to perform a DMA operation
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
+	if (n > 0) {
+		sgt->nents = n;
+		return 0;
+	}
+	return -EINVAL;
+}
+
+/**
+ * dma_unmap_sgtable - Unmap the given buffer for the DMA operations
+ * @dev:	The device to perform a DMA operation
+ * @sgt:	The sg_table object describing the buffer
+ * @dir:	DMA direction
+ * @attrs:	Optional DMA attributes for the map operation
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
+ * dma_sync_sgtable_for_cpu - Synchronize the given buffer for the CPU access
+ * @dev:	The device to perform a DMA operation
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
+ * dma_sync_sgtable_for_device - Synchronize the given buffer for the DMA
+ * @dev:	The device to perform a DMA operation
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
