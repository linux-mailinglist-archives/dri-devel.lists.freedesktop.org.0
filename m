Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6098888FA96
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806B6112381;
	Thu, 28 Mar 2024 09:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZo4qpWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DC3112375
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616465; x=1743152465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PM0jrZSP5cK8l59vQzDJsm6cRvYMNU6P+jdCf8vOtyI=;
 b=gZo4qpWJ0csSlco7r+uVUHXnJ/RUhs2r49tP0MlRulBG+x+v1C3CzBEK
 PCSR0AsNojkomYOXu1BfKRQmG3PdLF9U7+9jLPDJvtAMfTM+FnQn56Qu2
 8wJY/p6Q7gzG5tVz7aHDB9hQq1+KnP5fw/ru9HAvbcOP3h06xUFctvKgd
 NAy0c2aH/nFjoUTuiqfnXKgwiAclv7mINdeEe+/ulSmU3LPakIzIFHX5f
 IVxUnEbzgGKgAcIMAaGlvtL28DvPlS9mv7Ir324Txpy3Eyt1JbWyPPy+f
 V8nxj/WywHLBJ5V8+1Hyum/sTE+Yv4m0p+T9Ue38xPt1Nl9OBPWwGmY8h Q==;
X-CSE-ConnectionGUID: woQIefbMSPi3XV/g+IFhbQ==
X-CSE-MsgGUID: RgZ1zzCcRtaNBO58KxiYGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7355703"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7355703"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21078244"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:04 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC 7/7] udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl
Date: Thu, 28 Mar 2024 01:33:00 -0700
Message-ID: <20240328083615.2662516-8-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
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

By implementing this request, the udmabuf driver would be able
to support creating a dmabuf from a PCI device's bar region. This
would facilitate P2P DMA operations between any two PCI devices
as long as they are compatible.

Based on the information (devid, bar) provided by the VMM, once
the PCI device known as the provider is identified, we create a
page pool associated with the requested bar region by calling
pci_p2pdma_add_resource(). We then populate the ubuf->pages[]
array with the pages from the pool that would eventually be
included in a sgt which would be shared with the importers.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 122 +++++++++++++++++++++++++++++++++++---
 1 file changed, 114 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 274defd3fa3e..7355451ed337 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -9,6 +9,7 @@
 #include <linux/memfd.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
+#include <linux/pci-p2pdma.h>
 #include <linux/shmem_fs.h>
 #include <linux/hugetlb.h>
 #include <linux/slab.h>
@@ -27,6 +28,7 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is
 struct udmabuf {
 	pgoff_t pagecount;
 	struct page **pages;
+	struct pci_dev *pdev;
 	struct sg_table *sg;
 	struct miscdevice *device;
 	pgoff_t *offsets;
@@ -129,9 +131,28 @@ static void put_sg_table(struct device *dev, struct sg_table *sg,
 	kfree(sg);
 }
 
+static int check_p2p_support(struct dma_buf_attachment *attach)
+{
+	struct udmabuf *ubuf = attach->dmabuf->priv;
+	struct pci_dev *provider = ubuf->pdev;
+	struct device *client = attach->dev;
+	int ret = -1;
+
+	if (!provider)
+		return 0;
+
+	if (attach->peer2peer)
+		ret = pci_p2pdma_distance(provider, client, true);
+
+	return ret < 0 ? ret : 0;
+}
+
 static struct sg_table *map_udmabuf(struct dma_buf_attachment *at,
 				    enum dma_data_direction direction)
 {
+	if (check_p2p_support(at) < 0)
+		return ERR_PTR(-EOPNOTSUPP);
+
 	return get_sg_table(at->dev, at->dmabuf, direction);
 }
 
@@ -151,8 +172,15 @@ static void release_udmabuf(struct dma_buf *buf)
 	if (ubuf->sg)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
-	for (pg = 0; pg < ubuf->pagecount; pg++)
-		put_page(ubuf->pages[pg]);
+	for (pg = 0; pg < ubuf->pagecount; pg++) {
+		if (ubuf->pdev)
+			pci_free_p2pmem(ubuf->pdev,
+					page_to_virt(ubuf->pages[pg]),
+					PAGE_SIZE);
+		else
+			put_page(ubuf->pages[pg]);
+	}
+
 	kfree(ubuf->offsets);
 	kfree(ubuf->pages);
 	kfree(ubuf);
@@ -269,9 +297,74 @@ static int handle_shmem_pages(struct udmabuf *ubuf, struct file *memfd,
 	return 0;
 }
 
+static int handle_pcidev_pages(struct udmabuf *ubuf,
+			       struct udmabuf_create_list *head,
+			       struct udmabuf_create_item *list)
+{
+	struct pci_dev *pdev = NULL;
+	resource_size_t bar_size;
+	pgoff_t pgbuf = 0;
+	struct page *page;
+	int i, ret;
+	size_t size;
+	void *addr;
+
+	for (i = 0; i < head->count; i++) {
+		if (!ubuf->pdev) {
+			pdev = pci_get_domain_bus_and_slot(0,
+						PCI_BUS_NUM(list[i].devid),
+						list[i].devid & 0xff);
+			if (!pdev) {
+				ret = -ENODEV;
+				goto err;
+			}
+
+			ubuf->pdev = pdev;
+		}
+
+		bar_size = pci_resource_len(pdev, list[i].bar);
+		if (list[i].offset > bar_size ||
+		    list[i].offset + list[i].size > bar_size) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = pci_p2pdma_add_resource(pdev,
+					      list[i].bar,
+					      list[i].size,
+					      list[i].offset);
+		if (ret)
+			goto err;
+
+		addr = pci_alloc_p2pmem(pdev, list[i].size);
+		if (!addr) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		size = 0;
+		while (size < list[i].size) {
+			page = virt_to_page((unsigned long)addr + size);
+			ubuf->pages[pgbuf++] = page;
+
+			size += PAGE_SIZE;
+		}
+	}
+
+err:
+	while (pgbuf > 0 && ubuf->pages[--pgbuf])
+		pci_free_p2pmem(pdev,
+				page_to_virt(ubuf->pages[pgbuf]),
+				PAGE_SIZE);
+	if (pdev)
+		pci_dev_put(pdev);
+	return ret;
+}
+
 static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
-			   struct udmabuf_create_item *list)
+			   struct udmabuf_create_item *list,
+			   bool for_pcidev)
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct file *memfd = NULL;
@@ -312,6 +405,14 @@ static long udmabuf_create(struct miscdevice *device,
 		goto err;
 	}
 
+	if (for_pcidev) {
+		ret = handle_pcidev_pages(ubuf, head, list);
+		if (ret)
+			goto err;
+
+		goto create_dmabuf;
+	}
+
 	pgbuf = 0;
 	for (i = 0; i < head->count; i++) {
 		ret = -EBADFD;
@@ -344,6 +445,7 @@ static long udmabuf_create(struct miscdevice *device,
 		memfd = NULL;
 	}
 
+create_dmabuf:
 	exp_info.ops  = &udmabuf_ops;
 	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
 	exp_info.priv = ubuf;
@@ -362,7 +464,7 @@ static long udmabuf_create(struct miscdevice *device,
 	return dma_buf_fd(buf, flags);
 
 err:
-	while (pgbuf > 0)
+	while (pgbuf > 0 && !ubuf->pdev)
 		put_page(ubuf->pages[--pgbuf]);
 	if (memfd)
 		fput(memfd);
@@ -388,10 +490,11 @@ static long udmabuf_ioctl_create(struct file *filp, unsigned long arg)
 	list.offset = create.offset;
 	list.size   = create.size;
 
-	return udmabuf_create(filp->private_data, &head, &list);
+	return udmabuf_create(filp->private_data, &head, &list, false);
 }
 
-static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
+static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg,
+				      bool for_pcidev)
 {
 	struct udmabuf_create_list head;
 	struct udmabuf_create_item *list;
@@ -407,7 +510,7 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
 	if (IS_ERR(list))
 		return PTR_ERR(list);
 
-	ret = udmabuf_create(filp->private_data, &head, list);
+	ret = udmabuf_create(filp->private_data, &head, list, for_pcidev);
 	kfree(list);
 	return ret;
 }
@@ -422,7 +525,10 @@ static long udmabuf_ioctl(struct file *filp, unsigned int ioctl,
 		ret = udmabuf_ioctl_create(filp, arg);
 		break;
 	case UDMABUF_CREATE_LIST:
-		ret = udmabuf_ioctl_create_list(filp, arg);
+		ret = udmabuf_ioctl_create_list(filp, arg, false);
+		break;
+	case UDMABUF_CREATE_LIST_FOR_PCIDEV:
+		ret = udmabuf_ioctl_create_list(filp, arg, true);
 		break;
 	default:
 		ret = -ENOTTY;
-- 
2.43.0

