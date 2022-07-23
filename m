Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD20157EB4B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D334B92D0B;
	Sat, 23 Jul 2022 02:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8575192C98;
 Sat, 23 Jul 2022 02:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcOieI1QzXGXz4O/1a95MXVLp4jKPZ68zElm8DFghV5OJBcQ81m0/2R0T2g3bcelCHVfKW4lVrBZByZgMr1bpoBkTmFNqbF7K7x1X5DwQmOqvH2AYRlpzyoVu9pOn6dYexwwDPFBx3bB8fr/xZYCxPnCB5FAdGCXs5ieb+WZwCkUkHOR3zcX4XEM6tuurTUt6gl8Y09sEceOuGCUkAooi9qCII4JOJ0RKSqV5HTiamS9pkRAbIgWTm7pPH1wBRau7EGlk7izGMBF9HA/CKu8jyeLCrAIKmHPpV+4xQV97tp4tfPkbGpLkctMla6Nbc4VAY7uY6zMvglmeCbgMMRCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7EZc0LC2Jw4c0WihginmT32wjY/Gohmcnl1Pz6AneA=;
 b=mh7vbu9QRbAtlwEgX833IKTbWeIkBeP7lWuFqEdk8sD3pw1m1O77tPmN4QukDvUPD7Rtxc7P8NUUBoE1IWFnzWAL+vq83CCcS7KCC31VkWtNZALiUZV5lOnLPagbb9FiQGZqL7JpEj/QqO9ffkogPRdmsdfwkdfq1xmxWTNm00XcPk9ubCmwA7mJk6Qqi6xzRJeYOot2dSOGM9QoKnt9fo0jv1WypwyrHAFxh1R2GiITm/IujEBfY1VH8wHkPN3Xc+zguMQwBiIC2mKpyLQQKxvvgtql33bAXbIIl0a1zJtxIvJf9EngVOng9HcR7UmUCilB3UGtw2IRghlz0zLWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7EZc0LC2Jw4c0WihginmT32wjY/Gohmcnl1Pz6AneA=;
 b=J4fTnkSO/3smwe3R5J19jmKstRM9Zq48FMHGw33R6jeMFYsDdDHiZBXcL4hyhnHcZXuwTAzTwHnQtnLFVKhJzXkvHlphVZ8hMBwpekADd1YGfQ55DRTTcIWddO3BjNgJgr6cnUrJ2GxMyYe7A4PmW0qtVhUW3Iz7qxl2XXl4e5v6hhXvD6gPHkSA/k/3k19IkTBHmMdy5ShVfq+S6wDHJ/HP3DyPwfHdWCalUvaVX/lMkwxidq3332E60I2GWBFsVQgm8n3YNsQCjdCuHAZe2E3jdo/5HL2/Kcd1TG2ZmJvFfjNRIyG4FIOUT5sUSc04pEXC4brb73qVjXFDeGVvgw==
Received: from BN9PR03CA0936.namprd03.prod.outlook.com (2603:10b6:408:108::11)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Sat, 23 Jul
 2022 02:04:12 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::9a) by BN9PR03CA0936.outlook.office365.com
 (2603:10b6:408:108::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Sat, 23 Jul 2022 02:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:04:11 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:04:11 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:04:10 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:04:09 -0700
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
Subject: [PATCH v4 01/10] vfio: Make vfio_unpin_pages() return void
Date: Fri, 22 Jul 2022 19:02:47 -0700
Message-ID: <20220723020256.30081-2-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f94ad56-060f-43f9-040f-08da6c4fa321
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZwHL4DWlMUJv0RvZFTqUNaVwFX2iLGF6+p4TpQ775ZGzEEQuprJEADUU30tyYgkoNqZ3HoroWG4a3InL6xaMVLNqaFEpaZ91QWHVg9IXgKYdkxH0gkTJo4FND5kcf+RAzPjC0WkYh+bnTUF0SnzXDTucX/sPT1o2I8xPwDIv/cDBVStUl4NmF0VUrutmKdAAvrLub1jYhUDQdGNt8blk6o3szHjXRv0HubCuGLHBxxcuslsMMenimuky1wMxytO2CgW9kYy7MKHXTVMTWwKJ/e88VIUoe2FZ7lmKPkI0wMViIJ00hEarZLj0/4CHVEoeUuvk55UwaCwY++yZZiJPM37GsDw0wIo8vthJmGStRAJvDN6ECqFWPwfrnm/HHtIcngTrwbZd+YcVEKxdmtfjNIMUtKbCpc/ZP6T3Ex8ECxJeHhJJdUu4SOfxEb87YCM2DkyXUGLCL0wWeQDLHcawu+sj1yGYZ/+DpaCjbtKk0P2qH5WVtF5KIbgffzRpUKo96UnkgqUwvml2NYyWkVofmZ8P7qyfuYGookLTsfk1HomIXzwo9Xm0GpnjJ0+mLe3/fGA14kEfQ/jVjuRp+cIayRvOpMKDXDX7trkNaCIhSzAuWicFiJ4zJ0IQf9Xs7s2eF3Q7Ct0fE1S4WWKAaC1n6xOgznzCNbS9L/IIJz9mOBCDPiKQq49jiDrlYRp3XPb1ctEDfAWQZYRAqqLzba6SVtnaJ9BXWOGPa2DUY7vPQbUTcL3sA/4f4NZfb1+n/x9HmdZXj/RljqZ7+RZzJf2xPE/NzpHmPcmCzcRtOkeEcv0tmlJhackhRqNmhG7xq8M59yB9szbQx7M15KCGkqrRLqh5WQhOS56/sGwOhLAUuaTZDbsI3YorXcCX5it4oMC+bMRZ7tigX5WqmoDgbjdQA==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966006)(40470700004)(36840700001)(26005)(8936002)(8676002)(336012)(47076005)(5660300002)(2906002)(7416002)(7406005)(70586007)(54906003)(110136005)(1076003)(478600001)(6666004)(7696005)(82310400005)(36756003)(186003)(426003)(41300700001)(2616005)(81166007)(83380400001)(86362001)(356005)(316002)(40480700001)(36860700001)(70206006)(4326008)(40460700003)(82740400003)(921005)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:04:11.9069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f94ad56-060f-43f9-040f-08da6c4fa321
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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

There's only one caller that checks its return value with a WARN_ON_ONCE,
while all other callers don't check the return value at all. Above that,
an undo function should not fail. So, simplify the API to return void by
embedding similar WARN_ONs.

Also for users to pinpoint which condition fails, separate WARN_ON lines,
yet remove the "driver->ops->unpin_pages" check, since it's unreasonable
for callers to unpin on something totally random that wasn't even pinned.
And remove NULL pointer checks for they would trigger oops vs. warnings.
Note that npage is already validated in the vfio core, thus drop the same
check in the type1 code.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  5 +----
 drivers/vfio/vfio.c                           | 21 +++++++------------
 drivers/vfio/vfio.h                           |  2 +-
 drivers/vfio/vfio_iommu_type1.c               | 15 ++++++-------
 include/linux/vfio.h                          |  4 ++--
 6 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 1c57815619fd..b0fdf76b339a 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -265,7 +265,7 @@ driver::
 	int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 				  int npage, int prot, unsigned long *phys_pfn);
 
-	int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
+	void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 				    int npage);
 
 These functions call back into the back-end IOMMU module by using the pin_pages
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index ecd5bb37b63a..4d32a2748958 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -231,18 +231,15 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
 {
-	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
 	int total_pages;
 	int npage;
-	int ret;
 
 	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
 
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_gfn = gfn + npage;
 
-		ret = vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
-		drm_WARN_ON(&i915->drm, ret != 1);
+		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
 	}
 }
 
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index b3ce8073cfb1..92b10aafae28 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1983,31 +1983,24 @@ EXPORT_SYMBOL(vfio_pin_pages);
  *		   PFNs should not be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
  * @npage [in]   : count of elements in user_pfn array.  This count should not
  *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
- * Return error or number of pages unpinned.
  */
-int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
-		     int npage)
+void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
+		      int npage)
 {
 	struct vfio_container *container;
 	struct vfio_iommu_driver *driver;
-	int ret;
 
-	if (!user_pfn || !npage || !vfio_assert_device_open(device))
-		return -EINVAL;
+	if (WARN_ON(npage <= 0 || npage > VFIO_PIN_PAGES_MAX_ENTRIES))
+		return;
 
-	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
-		return -E2BIG;
+	if (WARN_ON(!vfio_assert_device_open(device)))
+		return;
 
 	/* group->container cannot change while a vfio device is open */
 	container = device->group->container;
 	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->unpin_pages))
-		ret = driver->ops->unpin_pages(container->iommu_data, user_pfn,
-					       npage);
-	else
-		ret = -ENOTTY;
 
-	return ret;
+	driver->ops->unpin_pages(container->iommu_data, user_pfn, npage);
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 4a7db1f3c33e..6a8424b407c7 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -53,7 +53,7 @@ struct vfio_iommu_driver_ops {
 				     unsigned long *user_pfn,
 				     int npage, int prot,
 				     unsigned long *phys_pfn);
-	int		(*unpin_pages)(void *iommu_data,
+	void		(*unpin_pages)(void *iommu_data,
 				       unsigned long *user_pfn, int npage);
 	void		(*register_device)(void *iommu_data,
 					   struct vfio_device *vdev);
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 026a1d2553a2..e49fbe9968ef 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -949,20 +949,16 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	return ret;
 }
 
-static int vfio_iommu_type1_unpin_pages(void *iommu_data,
-					unsigned long *user_pfn,
-					int npage)
+static void vfio_iommu_type1_unpin_pages(void *iommu_data,
+					 unsigned long *user_pfn, int npage)
 {
 	struct vfio_iommu *iommu = iommu_data;
 	bool do_accounting;
 	int i;
 
-	if (!iommu || !user_pfn || npage <= 0)
-		return -EINVAL;
-
 	/* Supported for v2 version only */
-	if (!iommu->v2)
-		return -EACCES;
+	if (WARN_ON(!iommu->v2))
+		return;
 
 	mutex_lock(&iommu->lock);
 
@@ -980,7 +976,8 @@ static int vfio_iommu_type1_unpin_pages(void *iommu_data,
 	}
 
 	mutex_unlock(&iommu->lock);
-	return i > 0 ? i : -EINVAL;
+
+	WARN_ON(i != npage);
 }
 
 static long vfio_sync_unpin(struct vfio_dma *dma, struct vfio_domain *domain,
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 19cefbaa3d06..9f7d74c24925 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -163,8 +163,8 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 
 int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 		   int npage, int prot, unsigned long *phys_pfn);
-int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
-		     int npage);
+void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
+		      int npage);
 int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
 		void *data, size_t len, bool write);
 
-- 
2.17.1

