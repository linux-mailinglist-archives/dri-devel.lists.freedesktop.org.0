Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E956C1AD
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487B510EEE2;
	Fri,  8 Jul 2022 22:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C8B10EEF6;
 Fri,  8 Jul 2022 22:44:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd7J7HLIbyWsBCBKFFTVtZSJAw6lDn1XPXnjw3n6qojEDzCkXFn27MxiJEoHkWjqPBgxLvFx8AkSx9BLKC1PAEgmgmEoOZR9FDifvMH7SZNr5rOeg/rTvZr6diDTcBtp4VxmOWNqhVXVNvQPztx6IWFFbzCgGcla3j/jimK83u+G3LebbTPQkx2mBtHLpJTAgd02IaT3iLJ9/p6F2MIEtqwS/M6nj2nu6ih71Oq9QnI5xXgjJV0ybYmzoV6WemnwdW+uxurMppOfNclUJzaVEAK9Juf/uwRLT20mHJJvuxjomTAucRlKDhNlhnfkaAuQ8wLaq8rztqhiBeZsLGkv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JF3Th0qGLAMXmpHwKmSt2uChBHNtbXphZ4uPUNsO0YM=;
 b=Fxv5xDD7TKnjirmqCCoEKu4CdkMwsC2mh+Z+19pJbIUZBKNpfi9IZXUleTS5oH6Imw83Fmr4B40TXebdegXK07enRlkHbv3UD1A8IsXIzyWTTJMw8G43RfEWlI6pWl3VyCBGGy+yvCt3iOnpGXl43Z2JhH8mrk57survVNEzexw69ORAdkKh4Ri28Gch3qIl8D9GXjlkBeI4vCLiBW+X/K77J8UcnOxvEST6XZYu8aU8d+Bxy+SspgzuUYZrbdndfrqMElQ2joh39OeC50JBgo5p1ju0TqSLnRKvuba0WNtXjC3ZbL3jMXxHkiT/zv2HpuCo8fkymvB+/inajytncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JF3Th0qGLAMXmpHwKmSt2uChBHNtbXphZ4uPUNsO0YM=;
 b=RN9zEj04XSWiZsyICZycvBGKlqZsvXYoQfUgT+yX+GjYrS3ytr3OEQfaknflv8O0zYhyRh/AdssSrq7pBleIQH9BLhroeitL+G0NEyljmklUtcpUBmsxV6yJ1nFREqOgSfBMfp7KG4/RtxDX3zFI511O6dGCczDPJvHFeaiLrWhxv7lzDVJKvXnJUgC4OCGJkGcwbWRxcyKHur3RhFo1d5GmnWcghERPOZHPEH+DpjS3+8/DvHxxvKkA6Rnit+KpSGUep6DdKLcpPkzf9oLw8has/IJSUUGRcmSt+X37t+grhYdltvef9HCOhjsiuFnEg9SI4CEGIGFYGlqCwxMnog==
Received: from BN8PR12CA0010.namprd12.prod.outlook.com (2603:10b6:408:60::23)
 by BYAPR12MB3494.namprd12.prod.outlook.com (2603:10b6:a03:ad::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Fri, 8 Jul
 2022 22:44:48 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60::4) by BN8PR12CA0010.outlook.office365.com
 (2603:10b6:408:60::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:47 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:47 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:46 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:45 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <kwankhede@nvidia.com>, <corbet@lwn.net>, <hca@linux.ibm.com>,
 <gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
 <svens@linux.ibm.com>, <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <farman@linux.ibm.com>,
 <mjrosato@linux.ibm.com>, <pasic@linux.ibm.com>, <vneethv@linux.ibm.com>,
 <oberpar@linux.ibm.com>, <freude@linux.ibm.com>, <akrowiak@linux.ibm.com>,
 <jjherne@linux.ibm.com>, <alex.williamson@redhat.com>, <cohuck@redhat.com>,
 <jgg@nvidia.com>, <kevin.tian@intel.com>, <hch@infradead.org>
Subject: [PATCH v3 08/10] vfio: Rename user_iova of vfio_dma_rw()
Date: Fri, 8 Jul 2022 15:44:26 -0700
Message-ID: <20220708224427.1245-9-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708224427.1245-1-nicolinc@nvidia.com>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 810f5391-87c3-457b-cc2b-08da6133761f
X-MS-TrafficTypeDiagnostic: BYAPR12MB3494:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y0esiijq3kvgLspO4RJPSy5WBAAgo+HojU0jQxbfhN3GpBzPgeuhXm4brPlZ5UZMFUD6L4SDz3iBupAP2opPkv/Ge9deGjq95WNyMa83J6EyI+ArKZwdf2XCFszXCfrVzDN4cB8/j/12Xr7FORyG1Vmlwta0lOt4nvEhjBBcOCSeCQw1tXMFARR50km4slQLY2fPmCbWbBpbCCLISfHuN8a8tuWBoqZHSkAEfOaLxtEUUG1RWGgtBx6e1lEZ0gZbKE1339R2m1o2cbUi6XYi4ZpXJft/r8kf9YYNxKgxfaxCPrVfVqni556xm+KFVxxiIeHuezAfr0VSS9Huh9eDqq+kLOAUFurFw93H43SS6umCg200MRJTUK7B2B2auSYhjOlbvP9+QRhaUqp9dEnGksOGf+KxQ7eVpDTtgxDJI24dPGs3YhdWRHazUgYjooVIk6c/EpuvSF4c+iEO5gdTf9ddtK4bjDzodlP6OPdfAV5zYMzD04Q9Ad5F8qVdpyT5Xtuw3NQquQniZJoDJWB5eTg+JQyK28qZ81CYSE9XgzJNcO08JWAHJekk29B3MX/FYsRXHCfSjILSPhrfjfvym4cXb1w75Zk07HmCahI2IpVx4DoP4fDs7LxIvEUvrGuUwN+aiHy81pixkJ8FAnDjG2nosa8Y/BQPMoDvM0Sx3UWSp1hWxfzc9aKQG2gGel1MoDHkGQ5SycYICpNiK07BuooP3RrPCM3YMQFVSSXjaQO/j1meo1plOW3Z/3aVxqUhOEd73S5P9PXebgx62aLmJBiVTH3DRageOn7VErP+X1PUTHt+GxgkZUZx8Cr01n61cDRoVKs/bZIi1Jce3f9FH6MK8Gw8dxPkARfP4DsGabO6VBKA1WD9GC4zDO3J8gBz9B0LO3+5zC0QANPE2JW94XmDsko1rQf5U2ILT2uB1aY=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(36840700001)(40470700004)(46966006)(7406005)(356005)(7696005)(40460700003)(478600001)(70586007)(86362001)(81166007)(7416002)(41300700001)(6666004)(26005)(36860700001)(921005)(8936002)(82740400003)(5660300002)(82310400005)(2906002)(186003)(47076005)(1076003)(40480700001)(2616005)(83380400001)(54906003)(316002)(70206006)(36756003)(336012)(4326008)(426003)(110136005)(8676002)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:47.7805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 810f5391-87c3-457b-cc2b-08da6133761f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3494
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the updated vfio_pin/unpin_pages(), use the simpler "iova".

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/vfio/vfio.c  | 6 +++---
 include/linux/vfio.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index ee4d45c2f210..153e5a7bce6a 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1993,13 +1993,13 @@ EXPORT_SYMBOL(vfio_unpin_pages);
  * not a real device DMA, it is not necessary to pin the user space memory.
  *
  * @device [in]		: VFIO device
- * @user_iova [in]	: base IOVA of a user space buffer
+ * @iova [in]		: base IOVA of a user space buffer
  * @data [in]		: pointer to kernel buffer
  * @len [in]		: kernel buffer length
  * @write		: indicate read or write
  * Return error code on failure or 0 on success.
  */
-int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
+int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova, void *data,
 		size_t len, bool write)
 {
 	struct vfio_container *container;
@@ -2015,7 +2015,7 @@ int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
 
 	if (likely(driver && driver->ops->dma_rw))
 		ret = driver->ops->dma_rw(container->iommu_data,
-					  user_iova, data, len, write);
+					  iova, data, len, write);
 	else
 		ret = -ENOTTY;
 	return ret;
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 2cefb63751f9..1d4febc4f711 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -160,7 +160,7 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 		   int npage, int prot, unsigned long *phys_pfn);
 void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage);
-int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
+int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova,
 		void *data, size_t len, bool write);
 
 /* each type has independent events */
-- 
2.17.1

