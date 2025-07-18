Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DCB0A386
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 13:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873C310E983;
	Fri, 18 Jul 2025 11:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HzB+vcMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B4810E981;
 Fri, 18 Jul 2025 11:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjxXOFUNbMOwQMxoc5OlE5RyEE8/tejFnju81bEg9XDgLrwD4WTruxcJFdcQZwzyKG8i4ViHzKhXI2fMMdDvbDwuVWPH/Cnhd++X+1ipPTJkZ/vx5KBJS6tYKUwN6nZoqflw2K5rTduwrzxdhTfH5IFrg+uDhmruhxyQeC5mglVzRmC7RZyPVobRodYVOVg9pdYhlREMTKo3NXL+EZ9JJcRVnj/gQu2UVw+1qyFh9CD0ib9RENPs8YF6V2dQ67VEgZWWCm6oKg3KFn9dUZtjZ7zX6AzQZ6jTbJV429OZbVTxFKFWRMsbb6aBEjtM3fuS9YLauHmvBug32qi828viXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=av8Aqxmk0pEQWQt6lpo+65OnSS1BZfQyJA2wl0eSI1U=;
 b=wpOs4dNGMiBPn3QEKaXTpkqSsOFW+lRw4fHkNybdO83Cxs5cmIFypusf4+7jOQZ3CHJB68Y1y7qYEja2x2dvYUEMASKfKky4hFcK9eFEaZBBTH7qnpRNeKjCZufUw3jzdamzjGRAca97fCkRWjM3TEFy5lNCgGMUDyHUD7iDZi1Rrx/O36f/MggOrzhXyw49jndRVwRHEx9lhb2aXrj+Qfvx2AaR94LfLu4dYjctuKrkYMu/sv4OkMu3Zc48P3p5ZjeZXKQglGG70Waba9xl1twN8eki9vzfXnEOM+Pyr0MNV8hLWOhazNRfM+T8pMZBJSVXvHE0jpjLwroNN7D4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=av8Aqxmk0pEQWQt6lpo+65OnSS1BZfQyJA2wl0eSI1U=;
 b=HzB+vcMWjsy7otIBFIMzQKzhrJjWV4sZzUtzxisHvB+ID7PB/Ve9jazPm0856EHPIwKKJjwtBRx1mYt/TKwLAlghoeNpJZFZvprr9a3H1T9no4k8+i3DQuQ5hbjkekJ3UgvR7y4/lmviNzlaM75y6m/OBAEbWhiyx2+tAgRQmpYvvNivm0rY5gnbt7B2zijRpAROFpXdxLbQ+qzbhs0yHHGkr5AqSLgaSy3lEDPvrAk/p9rTQQBmHvgkeJsOKfBHHRnVOjor03J3tRlU9l2egtT1SmnEwCek/iV+RLBKbOyILrQBkI0wLPYa3GWmBn60JDg5RfZ+oBFGFcUmE/cu+A==
Received: from SA9PR13CA0046.namprd13.prod.outlook.com (2603:10b6:806:22::21)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Fri, 18 Jul
 2025 11:52:13 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:22:cafe::fd) by SA9PR13CA0046.outlook.office365.com
 (2603:10b6:806:22::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.12 via Frontend Transport; Fri,
 18 Jul 2025 11:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 11:52:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Jul
 2025 04:51:54 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 18 Jul
 2025 04:51:54 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 18
 Jul 2025 04:51:48 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>
CC: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple
 <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik
 <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>, Daisuke Matsuda
 <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>, <linux-mm@kvack.org>,
 <linux-rdma@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Yonatan
 Maman" <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v2 2/5] nouveau/dmem: HMM P2P DMA for private dev pages
Date: Fri, 18 Jul 2025 14:51:09 +0300
Message-ID: <20250718115112.3881129-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718115112.3881129-1-ymaman@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 87185bc8-c921-4ccf-f5b6-08ddc5f188e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EdeWmPCW6mtm/NmXF6l8WpR4ewiTc7ynjvgBBkrdLJVQ5w/S3Sy52MxtvE5W?=
 =?us-ascii?Q?y+4400FGd5lwRW5LjxMXL+wdIV27yDgHfyTzDdI66B/iL8zOiAyQsHa0Avkk?=
 =?us-ascii?Q?Yo8MvXXCiyQywI9aHCTcaJzbiw4jpnExclUhaZYpi3mypP+JLJ1P9yd2+RDt?=
 =?us-ascii?Q?2OzEshUeCOvgRCd7MQcxthuDh6IM4U/T3LidNd86UsVXoWc0pw3vkM0JBKpZ?=
 =?us-ascii?Q?RkPgGQuP60up3b6VVGFlf9jcOCruce8RmnV5lVrz8kobRUYkRfDjcw6QezWD?=
 =?us-ascii?Q?81bNhxGh6kUTW3AXdjCYK/F8qber+abidTA6vcq4UgWpmVKEIL3Vv7HBX5EO?=
 =?us-ascii?Q?6/0eWD2CILE8cvJPZu3a+VlRhDF4V7wN5zxK8W/rdF1fRsSSKd+Wxc+vQwxO?=
 =?us-ascii?Q?4t7wyYJRngLAiPUwkx9CKKH6VKMTn2SzTneIUU+ir6QOWKt+UfIoffSDZ5A2?=
 =?us-ascii?Q?wOci6ueeQOAyZfttHn0FIwbmJt2qmHsLvVIDWiCzTjQ8qjV7WgPbicL6jO0P?=
 =?us-ascii?Q?SFaKDjW+ANPh5bcDDN+VieMEWqF5o9B38p3Uyn6YnFGxU9FvAPQNpQxNSCmR?=
 =?us-ascii?Q?rvdJPidCIafrz3o5APawAai+l/DaBCgmtOaXyJn4jC6Z7jjGONN3Z/HpTy08?=
 =?us-ascii?Q?f5uPI9Lylw55oM1DNpQkcn3YOmQ8oAkAtiA5fox1rLox85j8VgnGUHAZf/80?=
 =?us-ascii?Q?cr93VZmxa1WGPX+xmZJM+DajfNVHh6fdopnOrZG9PK9ZfHEganIll2uk9F7t?=
 =?us-ascii?Q?lEH4RcaamDlw3UNNWdhCAYR1NkjSfh9yHKphaFCGCwCmFHmDndCBADENYuv4?=
 =?us-ascii?Q?iKkNPByFaUVBa/Lt1bpo7ZkfBYFLnSLIQrNnJaEZh/SLdOWEEZ9pUQdNUybV?=
 =?us-ascii?Q?NmqAh82n8h/iq0d4eqalMQ4uoVEDxx89A/sy75Z6tCfxodY41CNmjUc/obGN?=
 =?us-ascii?Q?RmpBuR7JsXth0o6D55Jf0O5WjeK6EcamHTGq6hk3XfqVCDXtFILj0mSlul7h?=
 =?us-ascii?Q?4dzsgGGNKfBmIVzgar+w4/h9KlboWb5W1dhGHsYLZSjKXRqlSHaxwIoDlgKa?=
 =?us-ascii?Q?nIeNGEAjpKCgqJTZCa2vMwzo5bEZleEoWApmiJbLNH/lRtHpmCnJBhx6j4Ri?=
 =?us-ascii?Q?QgWm0e7fcttzcacJ8XuTQ6hNEJWjarrhE7/o+pR/I+fq6K4gULFEBkhi5JZE?=
 =?us-ascii?Q?h767Z28jh0GMp/ytMoEmKMywHifOjRpVciRHD3kF9GK0/xCcwXmEtWUGcTQ+?=
 =?us-ascii?Q?eFpCZB+5GJ2fB3r3N4w4CSRnBRrFbxwMih0ay75YbOqYCf2Tz38ElaNM8U2Y?=
 =?us-ascii?Q?8qIoiMLJahm7uIfckyr5pDzTkORRqmRWCpItqfPgndaFbhXdCv52cHVYwK67?=
 =?us-ascii?Q?8OBiSv1UAxxfGgNrzUb1BMUsaf/ljEP7DaJtydmsz5PhTL4PIT3uViPFOvRJ?=
 =?us-ascii?Q?zRap7xtQs4WhlRxauGl1kt1F7BAElzJK8qhtcuYhwlBuzUw67OWSRW/xBeUc?=
 =?us-ascii?Q?alI/db1NBYFaKFceqsQu1ooJzYhNXs+nynMO?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:52:12.9731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87185bc8-c921-4ccf-f5b6-08ddc5f188e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067
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

From: Yonatan Maman <Ymaman@Nvidia.com>

Enabling Peer-to-Peer DMA (P2P DMA) access in GPU-centric applications
is crucial for minimizing data transfer overhead (e.g., for RDMA use-
case).

This change aims to enable that capability for Nouveau over HMM device
private pages. P2P DMA for private device pages allows the GPU to
directly exchange data with other devices (e.g., NICs) without needing
to traverse system RAM.

To fully support Peer-to-Peer for device private pages, the following
changes are made:

 - Introduce struct nouveau_dmem_hmm_p2p within struct nouveau_dmem
   to manage BAR1 PCI P2P memory. p2p_start_addr holds the virtual
   address allocated with pci_alloc_p2pmem(), and p2p_size represents
   the allocated size of the PCI P2P memory.

 - nouveau_dmem_init - Ensure BAR1 accessibility and assign struct
   pages (PCI_P2P_PAGE) for all BAR1 pages. Introduce
   nouveau_alloc_bar1_pci_p2p_mem in nouveau_dmem to expose BAR1 for
   use as P2P memory via pci_p2pdma_add_resource and implement static
   allocation and assignment of struct pages using pci_alloc_p2pmem.
   This function will be called from nouveau_dmem_init, and failure
   triggers a warning message instead of driver failure.

 - nouveau_dmem_fini - Ensure BAR1 PCI P2P memory is properly
   destroyed during driver cleanup. Introduce
   nouveau_destroy_bar1_pci_p2p_mem to handle freeing of PCI P2P
   memory associated with Nouveau BAR1. Modify nouveau_dmem_fini to
   call nouveau_destroy_bar1_pci_p2p_mem.

 - Implement Nouveau `p2p_page` callback function - Implement BAR1
   mapping for the chunk using `io_mem_reserve` if no mapping exists.
   Retrieve the pre-allocated P2P virtual address and size from
   `hmm_p2p`. Calculate the page offset within BAR1 and return the
   corresponding P2P page.

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Reviewed-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 110 +++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index ca4932a150e3..acac1449d8cb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -40,6 +40,9 @@
 #include <linux/hmm.h>
 #include <linux/memremap.h>
 #include <linux/migrate.h>
+#include <linux/pci-p2pdma.h>
+#include <nvkm/core/pci.h>
+
 
 /*
  * FIXME: this is ugly right now we are using TTM to allocate vram and we pin
@@ -77,9 +80,15 @@ struct nouveau_dmem_migrate {
 	struct nouveau_channel *chan;
 };
 
+struct nouveau_dmem_hmm_p2p {
+	size_t p2p_size;
+	void *p2p_start_addr;
+};
+
 struct nouveau_dmem {
 	struct nouveau_drm *drm;
 	struct nouveau_dmem_migrate migrate;
+	struct nouveau_dmem_hmm_p2p hmm_p2p;
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
@@ -159,6 +168,60 @@ static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
 	return 0;
 }
 
+static int nouveau_dmem_bar1_mapping(struct nouveau_bo *nvbo,
+				     unsigned long long *bus_addr)
+{
+	int ret;
+	struct ttm_resource *mem = nvbo->bo.resource;
+
+	if (mem->bus.offset) {
+		*bus_addr = mem->bus.offset;
+		return 0;
+	}
+
+	if (PFN_UP(nvbo->bo.base.size) > PFN_UP(nvbo->bo.resource->size))
+		return -EINVAL;
+
+	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
+	if (ret)
+		return ret;
+
+	ret = nvbo->bo.bdev->funcs->io_mem_reserve(nvbo->bo.bdev, mem);
+	*bus_addr = mem->bus.offset;
+
+	ttm_bo_unreserve(&nvbo->bo);
+	return ret;
+}
+
+static int nouveau_dmem_get_dma_pfn(struct page *private_page,
+				    unsigned long *dma_pfn)
+{
+	int ret;
+	unsigned long long offset_in_chunk;
+	unsigned long long chunk_bus_addr;
+	unsigned long long bar1_base_addr;
+	struct nouveau_drm *drm = page_to_drm(private_page);
+	struct nouveau_bo *nvbo = nouveau_page_to_chunk(private_page)->bo;
+	struct nvkm_device *nv_device = nvxx_device(drm);
+	size_t p2p_size = drm->dmem->hmm_p2p.p2p_size;
+
+	bar1_base_addr = nv_device->func->resource_addr(nv_device, 1);
+	offset_in_chunk =
+		(page_to_pfn(private_page) << PAGE_SHIFT) -
+		nouveau_page_to_chunk(private_page)->pagemap.range.start;
+
+	ret = nouveau_dmem_bar1_mapping(nvbo, &chunk_bus_addr);
+	if (ret)
+		return ret;
+
+	*dma_pfn = chunk_bus_addr + offset_in_chunk;
+	if (!p2p_size || *dma_pfn > bar1_base_addr + p2p_size ||
+	    *dma_pfn < bar1_base_addr)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 {
 	struct nouveau_drm *drm = page_to_drm(vmf->page);
@@ -222,6 +285,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.page_free		= nouveau_dmem_page_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.get_dma_pfn_for_device = nouveau_dmem_get_dma_pfn,
 };
 
 static int
@@ -407,14 +471,31 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	kvfree(dma_addrs);
 }
 
+static void nouveau_destroy_bar1_pci_p2p_mem(struct nouveau_drm *drm,
+					     struct pci_dev *pdev,
+					     void *p2p_start_addr,
+					     size_t p2p_size)
+{
+	if (p2p_size)
+		pci_free_p2pmem(pdev, p2p_start_addr, p2p_size);
+
+	NV_INFO(drm, "PCI P2P memory freed(%p)\n", p2p_start_addr);
+}
+
 void
 nouveau_dmem_fini(struct nouveau_drm *drm)
 {
 	struct nouveau_dmem_chunk *chunk, *tmp;
+	struct nvkm_device *nv_device = nvxx_device(drm);
 
 	if (drm->dmem == NULL)
 		return;
 
+	nouveau_destroy_bar1_pci_p2p_mem(drm,
+					 nv_device->func->pci(nv_device)->pdev,
+					 drm->dmem->hmm_p2p.p2p_start_addr,
+					 drm->dmem->hmm_p2p.p2p_size);
+
 	mutex_lock(&drm->dmem->mutex);
 
 	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
@@ -579,10 +660,28 @@ nouveau_dmem_migrate_init(struct nouveau_drm *drm)
 	return -ENODEV;
 }
 
+static int nouveau_alloc_bar1_pci_p2p_mem(struct nouveau_drm *drm,
+					  struct pci_dev *pdev, size_t size,
+					  void **pp2p_start_addr)
+{
+	int ret;
+
+	ret = pci_p2pdma_add_resource(pdev, 1, size, 0);
+	if (ret)
+		return ret;
+
+	*pp2p_start_addr = pci_alloc_p2pmem(pdev, size);
+
+	NV_INFO(drm, "PCI P2P memory allocated(%p)\n", *pp2p_start_addr);
+	return 0;
+}
+
 void
 nouveau_dmem_init(struct nouveau_drm *drm)
 {
 	int ret;
+	struct nvkm_device *nv_device = nvxx_device(drm);
+	size_t bar1_size;
 
 	/* This only make sense on PASCAL or newer */
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_PASCAL)
@@ -603,6 +702,17 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 		kfree(drm->dmem);
 		drm->dmem = NULL;
 	}
+
+	/* Expose BAR1 for HMM P2P Memory */
+	bar1_size = nv_device->func->resource_size(nv_device, 1);
+	ret = nouveau_alloc_bar1_pci_p2p_mem(drm,
+					     nv_device->func->pci(nv_device)->pdev,
+					     bar1_size,
+					     &drm->dmem->hmm_p2p.p2p_start_addr);
+	drm->dmem->hmm_p2p.p2p_size = (ret) ? 0 : bar1_size;
+	if (ret)
+		NV_WARN(drm,
+			"PCI P2P memory allocation failed, HMM P2P won't be supported\n");
 }
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
-- 
2.34.1

