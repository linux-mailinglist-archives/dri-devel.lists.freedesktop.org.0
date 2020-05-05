Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6001C50C7
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4455789D77;
	Tue,  5 May 2020 08:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B743D89D02
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084625euoutp01d1683b724fca09cc8cb7e00606435f47~MFXqqhJfe0374903749euoutp01C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084625euoutp01d1683b724fca09cc8cb7e00606435f47~MFXqqhJfe0374903749euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668385;
 bh=hDXMGscph/JtiXtJfzELMo5REY6cGQYOcmjoYLrYu9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YcwUfZqYNaEb+qnytinC5ix1aNOoLi/9yRjbImDFJoDIAPvC6qJQlQ07EPB9IqgjK
 5P86Sk54Ce7rBpFB90seW50M9Z4xjlHCO74WBS6Jp+HYXTK9iBEKiRF9GwJlHPpsSB
 v5KBYjHLz5RQ+UZiARdGp0Zzgm/SydCf7wSe3eJM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200505084624eucas1p259ece9904ddb2ff19cde8d111e3a1357~MFXqJND-G1942419424eucas1p2B;
 Tue,  5 May 2020 08:46:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 06.32.60679.0E721BE5; Tue,  5
 May 2020 09:46:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200505084624eucas1p2a9a5c4d2aece2c1555a5480c19c2e050~MFXpz_Jfx2336923369eucas1p21;
 Tue,  5 May 2020 08:46:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084624eusmtrp1f7575e3c6e9734b2b0ad0a89f79fa220~MFXpx1HIA0942509425eusmtrp1y;
 Tue,  5 May 2020 08:46:24 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-25-5eb127e06c81
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 20.21.07950.0E721BE5; Tue,  5
 May 2020 09:46:24 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084623eusmtip1889e719913a78f767a219409dc8c3bf4~MFXpOhphi0686606866eusmtip1E;
 Tue,  5 May 2020 08:46:23 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/25] dma-mapping: add generic helpers for mapping
 sgtable objects
Date: Tue,  5 May 2020 10:45:50 +0200
Message-Id: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505083926.28503-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSbUhTcRTG+d+73V2nk9sU/GeaMagoUbMsLliSWXQ/REgQmZC58jat6WR3
 mgrl1BRbmi0jxUqG+JJOcy6dqclyqfOFlqmEkTWdVmhJolNMxWpes2+/55zn8BwOB0eF9VxP
 PC5BQcsTxFIRxucYun+99Rvb3RC1z2LaQeZbehGyobieS/42qFFyeOEnRlZruxBSYwwmbz/S
 8Uj78DhC6ifec8mh1scYWdf5iUd2zE5yj7pQkx2lCFVbWguo9kUNh2peHONS1jtmhHpenk59
 XJtAqcKRKkC1fVBi1N3GGkDN67eHO0fyD8fQ0rhkWh4QEs2P7dNOg8Rq75Sv7WpECaxQBXAc
 EkEw1xikAnxcSDwFMC/jNWCFHUD9aC2HFfMAdlunEBVwYicKslG2UQXgzOAXZHNktqUWc7gw
 IhCqZlTr7E5kA9iT7+JglGhFYEmW2JHtRkTAyneJjjKH2AkH9J95DhYQR6BVVYSxYT5Qq3uF
 OtiJCIErPcb1YEiYeDDb8H3DdBx2NU9usBucNjfyWPaC/YV5HHYgC8BxSx2PFXkADmUWA9YV
 DEcty5hjI5TYA+tbA9hyKJxruoWxR3KFIzNb2P1d4X1DEcqWBTA3R8i6d8ES87PN2I6BQZRl
 CtoKzOuHExJqADP0p+8Bn5L/WRoAaoAHncTES2hmfwJ93Z8RxzNJCRL/y7J4Pfj7Rv1rZvsL
 0Lp6yQQIHIhcBBHz9VFCrjiZSY03AYijIndB5ZIuSiiIEaem0XLZRXmSlGZMYBvOEXkIDpRN
 XRASErGCvkbTibT8XxfBnTyVIN0aZu+LnRjQDZvPbbUplir8yw/qvvUuP5mjHzz0u1ripu+Z
 7UyWS8JXKlaNHUUj2jGFJrOqzJZ7xnc0XBHhdTKyG2GO0U0vF8yPlFMyp5RoZLVBe8r5Zovw
 RFpOW+gsmWJdlbm0N19RS5Eb56XJAWFnf7RQbwy+hHev5ZBNxGFixYF7UTkj/gMYtX+JQgMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xu7oP1DfGGXw8x2bRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t0Tl7A7vFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNWB
 x+PJwXlMHmvmrWH02PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HNo2/LKkaP
 z5vkArij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DJOrX7FWLBStuLZ3olMDYz3JboYOTkkBEwkOvpbmbsYuTiEBJYySmy4d4wVIiEjcXJaA5Qt
 LPHnWhcbiC0k8IlR4ttBZRCbTcBQoustSJyLQ0Sgk1FiWvdHdhCHWeAAk8Srtu2MIFXCAmES
 D2ZfYQexWQRUJS5sugdm8wrYStzvms4GsUFeYvWGA8wgNqeAncTvE/uZIbbZShy99YRlAiPf
 AkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIERsu3Yzy07GLveBR9iFOBgVOLh3fB1fZwQ
 a2JZcWXuIUYJDmYlEd5lPzbECfGmJFZWpRblxxeV5qQWH2I0BTpqIrOUaHI+MHrzSuINTQ3N
 LSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwBpcLJ5+SCD8Yz9wezZX78+7K
 iXvrghiF/imF7PyiYmEr75P6dHVFk1jP37est+tOXr6Q+3G2vtDuTAsrO7f1jF/Fv53+scun
 9r1mJc9K30X5vkt/c+4OKIhfYaSpGLU4Q1Q2xqCn/80/LZFrigdvW+h99nr87E38nuTe7BfL
 ZkRnbJlm5npTiaU4I9FQi7moOBEAhIgjf6YCAAA=
X-CMS-MailID: 20200505084624eucas1p2a9a5c4d2aece2c1555a5480c19c2e050
X-Msg-Generator: CA
X-RootMTR: 20200505084624eucas1p2a9a5c4d2aece2c1555a5480c19c2e050
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084624eucas1p2a9a5c4d2aece2c1555a5480c19c2e050
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <CGME20200505084624eucas1p2a9a5c4d2aece2c1555a5480c19c2e050@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct sg_table is a common structure used for describing a memory
buffer. It consists of a scatterlist with memory pages and DMA addresses
(sgl entry), as well as the number of scatterlist entries: CPU pages
(orig_nents entry) and DMA pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, call dma-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg
function.

To avoid such issues, lets introduce a common wrappers operating directly
on the struct sg_table objects, which take care of the proper use of
the nents and orig_nents entries.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 include/linux/dma-mapping.h | 32 ++++++++++++++++++++++++++++++++
 include/linux/iommu.h       |  6 ++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index b43116a..8364c20d 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -609,6 +609,36 @@ static inline void dma_sync_single_range_for_device(struct device *dev,
 	return dma_sync_single_for_device(dev, addr + offset, size, dir);
 }
 
+static inline int dma_map_sgtable_attrs(struct device *dev,
+	struct sg_table *sgt, enum dma_data_direction dir, unsigned long attrs)
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
+static inline void dma_unmap_sgtable_attrs(struct device *dev,
+	struct sg_table *sgt, enum dma_data_direction dir, unsigned long attrs)
+{
+	dma_unmap_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
+}
+
+static inline void dma_sync_sgtable_for_cpu(struct device *dev,
+	struct sg_table *sgt, enum dma_data_direction dir)
+{
+	dma_sync_sg_for_cpu(dev, sgt->sgl, sgt->orig_nents, dir);
+}
+
+static inline void dma_sync_sgtable_for_device(struct device *dev,
+	struct sg_table *sgt, enum dma_data_direction dir)
+{
+	dma_sync_sg_for_device(dev, sgt->sgl, sgt->orig_nents, dir);
+}
+
 #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
 #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
 #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
@@ -617,6 +647,8 @@ static inline void dma_sync_single_range_for_device(struct device *dev,
 #define dma_unmap_page(d, a, s, r) dma_unmap_page_attrs(d, a, s, r, 0)
 #define dma_get_sgtable(d, t, v, h, s) dma_get_sgtable_attrs(d, t, v, h, s, 0)
 #define dma_mmap_coherent(d, v, c, h, s) dma_mmap_attrs(d, v, c, h, s, 0)
+#define dma_map_sgtable(d, s, r) dma_map_sgtable_attrs(d, s, r, 0)
+#define dma_unmap_sgtable(d, s, r) dma_unmap_sgtable_attrs(d, s, r, 0)
 
 extern int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7ef8b0b..5106b65 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -466,6 +466,12 @@ extern size_t iommu_map_sg_atomic(struct iommu_domain *domain,
 extern void iommu_set_fault_handler(struct iommu_domain *domain,
 			iommu_fault_handler_t handler, void *token);
 
+static inline size_t iommu_map_sgtable(struct iommu_domain *domain,
+			unsigned long iova, struct sg_table *sgt, int prot)
+{
+	return iommu_map_sg(domain, iova, sgt->sgl, sgt->orig_nents, prot);
+}
+
 extern void iommu_get_resv_regions(struct device *dev, struct list_head *list);
 extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
 extern void generic_iommu_put_resv_regions(struct device *dev,
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
