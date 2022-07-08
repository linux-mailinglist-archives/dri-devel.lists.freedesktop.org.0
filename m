Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5956C1AB
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E6F10EEF5;
	Fri,  8 Jul 2022 22:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1323810EEE2;
 Fri,  8 Jul 2022 22:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCuy+G6A7B8W9prJ0TnNrf5wTHJZ4gx7BdsYtH8mllRumJVNVDkHRuB3Ezn0uYv8NFijsB6dVUNm8SHmpNwQHQZ1iLeB6lNRQ6LZWx3b6cz8LZxv3F/Wb1l5qQxQftcpufg+Pb7AtGCT16Q8pz54+1E7pMtuIpnx15GjUOE+Mwh1kGN1vq6FFkzFsVwNu4MNKx/VGhva34kPLCbRxmMqjW2EOcpIV6KdH9icNUxYQ0POXqba7XLv0gvLLc40DL+9I0RgeRq2eXTdEG6wEBG+HwePOH/uvxX5rVozUwK6Y/hqGB4mjp1RWZiundtEjqaMjfiI17B2LhlL6P9i2j4siA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0T0MeOm9gYLXJdm4J7+F9ldk7GTe67bOPL6x/8LKQU=;
 b=lhs+fGJk53bPBneIVgA2OkEXIogdmTmQIBOtSS96QR0ROLbKxIDkb2SB5LcpIucpKSrQBIbYVUXqlAmprPxMYGBX5HpFO20NjEi7qGZvvWOc87gZd+0HP4g6Wes3hysnsNPhTnz+10nyFgXF/aGtwklByPIzNavw55bwVWMngS7OlJR4AsaapBXYIXftKaEn4OK92bqYYS0EUyL/32BY0SxMYRNNNM4EJ+yDWvsMYOdk5kVLuUUNGK0iHZPfsSOfewMloMbvXT1R3osEjBRTi1PAvWMkKWGTjYfGiAoQZB394kVR2FiC00ErQEMZa86/2PLVoZBS2pA4H/X1VKUHTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0T0MeOm9gYLXJdm4J7+F9ldk7GTe67bOPL6x/8LKQU=;
 b=dnvB3Wfra/sHf25b30BoM/cb8OTyuvmVJpNcXr+TjX9gpdfoLkNq6ul/jWdmzaGM0LuWaSHgRqD+OFK3iSii3SCgIJeiP+yngVjfnArD5rTEVvMDYmAc5vYya8t/JzMUcoW4DJB+g7XYooEwZ0tYjmcGWMVNu9HXeSzAiBrDyjG+NV2OdHFxc19qVT3ThDIurBykPznxF1PdjhdlGOV7aNm0dYSbnntqi4BunPvnENlSna0zGhQ249pyp1yrWwf8qZT1oGMbT6lt7qD0UTmnD5QBoRj6ezYw8CfR/z3mZcvTrhXR/M7t6fYmCz3VmDuF0fjlv1Y65alBT+OGePY54Q==
Received: from BN8PR03CA0002.namprd03.prod.outlook.com (2603:10b6:408:94::15)
 by IA1PR12MB6018.namprd12.prod.outlook.com (2603:10b6:208:3d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 22:44:34 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::c8) by BN8PR03CA0002.outlook.office365.com
 (2603:10b6:408:94::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:33 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:33 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:32 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:31 -0700
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
Subject: [PATCH v3 01/10] vfio: Make vfio_unpin_pages() return void
Date: Fri, 8 Jul 2022 15:44:19 -0700
Message-ID: <20220708224427.1245-2-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708224427.1245-1-nicolinc@nvidia.com>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d534f9-b87e-4c68-9954-08da61336dde
X-MS-TrafficTypeDiagnostic: IA1PR12MB6018:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0W/v2Zg3MpO07J6IlV3z+EYhJCC4DDCGxq+kXVsn6lLCEllwCBEIp2KRGUxcJNEjwYkmh3tJZyAwYELOJmVw4AhbKVabulopamn51CX9NLZmKc5XbzmQOtgs02Qq5JDZQF0A3QmB1ZWLMJi7Hy409r0Mijb9PluACuh5RFgLRNxXHHr4f18BRjvCUkwzCWbbJ6iQgKTBjGugPj+MJyK0aJbUbTeOO/7/xbx8jQ5mywT3yAdjwuW0rgC6Hu3p8zEk9uWai3ami9qsLhWOeU5wQB+Ip8PVIpgCIawiC3W+xsqMtxfD/WzlpE0RhcQdgVcKRGdJmrSX+dgmrzWdHDR+580G9pI6zA8Xy1qQ2EyXb0VztKvY+81wUXT3AT/YF8ZYQ2CkWL0PC+V05vWrk+75kpKWjb7ihK0nlTto4ei3g59Ho4N7y8GrF9HbU5Oq1lycoA131+YOKZyt0uoW3dZrTn+5KaQdEFeMC3ytGMZ/vV+oXm412dLyo3cWbJPGcp2CLCcs8IZ4ia4/HhgsgLKOTHzQ0WHhGmYwi9H+LqhjcvgjYliv3ds+WsxsOWZfMSNB6PsXWM5Sn6/AlU1PqXtfKjl3lOgdEc4C2JBvvz8sbSiNjFHnxjQGl3Pv+D6Kkxq9ynhJw22KUDWblhm8W3CJ744nE6OeYkkXoT0+mKPwVTUfE6OnyJTKToxh/nsvlXLi7UjP5hiiK7hBZErOEAiHhHrPdw0j7scAS/hl5or2EC3U3ESsmJfQOaC1y8keFvv/hqI6hd/cO252yGEAa6iNcbW7vtM05rL+VTfL+aeV+eSMOHV8aHRmw8ib7vgzJxN7xT+cOz2NmTKOW9RDmJB09ZQkbP6bU/piWrCOqS8hk1EAFRTElBhVscjzIidwCzxzuhyTfygNehnRs8wyVQigdZuK9qZV8+6dZycwfLjek98=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(36840700001)(46966006)(40470700004)(110136005)(47076005)(40480700001)(70586007)(336012)(54906003)(83380400001)(426003)(5660300002)(40460700003)(82310400005)(8936002)(478600001)(26005)(7696005)(7416002)(36860700001)(7406005)(6666004)(41300700001)(86362001)(81166007)(186003)(36756003)(8676002)(356005)(4326008)(1076003)(316002)(2906002)(921005)(2616005)(70206006)(82740400003)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:33.9315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d534f9-b87e-4c68-9954-08da61336dde
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6018
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
index d7a512676853..4307421dcaa0 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -263,7 +263,7 @@ driver::
 	int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 				  int npage, int prot, unsigned long *phys_pfn);
 
-	int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
+	void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 				    int npage);
 
 These functions call back into the back-end IOMMU module by using the pin_pages
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index e2f6c56ab342..8c67c9aba82d 100644
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
index 100a3d84380c..ad90adbfddc8 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1964,31 +1964,24 @@ EXPORT_SYMBOL(vfio_pin_pages);
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
index a67130221151..bef4edf58138 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -53,7 +53,7 @@ struct vfio_iommu_driver_ops {
 				     unsigned long *user_pfn,
 				     int npage, int prot,
 				     unsigned long *phys_pfn);
-	int		(*unpin_pages)(void *iommu_data,
+	void		(*unpin_pages)(void *iommu_data,
 				       unsigned long *user_pfn, int npage);
 	int		(*register_notifier)(void *iommu_data,
 					     unsigned long *events,
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index db24062fb343..cfeea4efd625 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -948,20 +948,16 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
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
 
@@ -979,7 +975,8 @@ static int vfio_iommu_type1_unpin_pages(void *iommu_data,
 	}
 
 	mutex_unlock(&iommu->lock);
-	return i > 0 ? i : -EINVAL;
+
+	WARN_ON(i != npage);
 }
 
 static long vfio_sync_unpin(struct vfio_dma *dma, struct vfio_domain *domain,
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 4d26e149db81..5348ef353029 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -159,8 +159,8 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 
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

