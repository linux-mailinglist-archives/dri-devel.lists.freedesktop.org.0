Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD01567E5E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 08:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED1F10F93A;
	Wed,  6 Jul 2022 06:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3998010F93A;
 Wed,  6 Jul 2022 06:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/NaYOk3M/wyEvGJAdA2STUQSJEtMyWir5Uud9c70VI7ruhOtAIA/YVeOxQIZ5wbd0yjhGtKdbhN9UdN94VJuJVHFvAVhhJHS2T2dxfMSAr4doR2usviZB0kIcNWKaa2b+++QbvnypoZLTYqzHsjf2GmyecTPIEZOxIxFQy2F7sXowuYu9308VbOV75ZR5FRJU1TVseqlhxtAUZG2DOknBL4Yst3QBLHOFvxfXzQ3AeJVHPQwFiKo+64Af+YcCz+hdQOurvUmB56PQ6PHP45/VWvNG0sfbx3+gF0S0V6oJgM1RHucDSUy49Qh+lvlzevKyHmvkdYAUA3AKWIxYgHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIc8WOGbQqnWuegxZUpyT8c7k0yV0Mb/niYZFvLPTUY=;
 b=Q6Eb7BW4OyMnvp5WB44dUrRoOgggwvKtscWXnDk0M6DpE7wAj8TW6fT8iEdoZi9MlLcrwCKg6vjPG1iPLab5PzvQGBCbBRjHKFWTWSRuh6oAPO6Ouj3jghKkvlPXJc6p5mn/U0faBFEZNwjMHE0FJgg3kklfcIaaWQMvkJhbrDudaOvUlH9WI/cf/qbBV2+81FDCb/8ftSokF8ORDiOZKha5IRFgyVsX+WZ3w+uPKaFi9bewJW5szhbqXXJvx+P29+KznbvQ0T2UAVTXvOAuGepa4vLRP+ef/1uxfYs7tK7VaKFT5aX88p/rSk8NMnFlqct2ub817+w752D++2Fj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIc8WOGbQqnWuegxZUpyT8c7k0yV0Mb/niYZFvLPTUY=;
 b=g3tbaWsqGzRx/cpA0Zxed+T0UfgGObJvdKC1LCXZ6wMMSzQIVf4boW2zp7WF4yVdPwapeNKFCNS9ca+5D6q7xR/V7ckchJ/SfCOsh+Potn/vJxkNICv2L/ZbZfLS9MbcVrnwF+Th1l44Y0sZs5S7lnKp74j2FflP98Gag2jxXeQr7frFKVbpFxjpOPUFeUEEsJL94X4Cp7WEtzL91Zgys/hB1GXEhSmWU5YKyF+h/0HP1+KSvGD9qH91LXQMHdE+ZjOVTfYPONS5com2+3cS7nRHjyaREop+viQMR6lnRdex2OYUr40SvNb0Wqu6+Po2AqgRfycjp7SnQuEdQFMFWw==
Received: from MW2PR2101CA0029.namprd21.prod.outlook.com (2603:10b6:302:1::42)
 by DM6PR12MB4943.namprd12.prod.outlook.com (2603:10b6:5:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 06:28:13 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::f2) by MW2PR2101CA0029.outlook.office365.com
 (2603:10b6:302:1::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.6 via Frontend
 Transport; Wed, 6 Jul 2022 06:28:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 06:28:13 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 6 Jul 2022 06:28:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 5 Jul 2022
 23:28:12 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 5 Jul 2022 23:28:10 -0700
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
Subject: [RFT][PATCH v2 1/9] vfio: Make vfio_unpin_pages() return void
Date: Tue, 5 Jul 2022 23:27:51 -0700
Message-ID: <20220706062759.24946-2-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220706062759.24946-1-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2015801d-ce42-4994-4881-08da5f18b42e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4943:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tHPA+mE6lo8oAm1gbSzDOKoXBE/pOmxchBHnM84a+lwDa52MZ3Jyg+G2yz/13SswzuT5mNC6djAWUO6JeFNXThqqXa0fZx5X20rJwP0cvjexaikn5WdSzH24jMUH3cS9Xb3XPHJqDP2bsvwoXmHJ0o/MRMsUBld/1kpMMx/sgS19m0tREXpB8WxBE7rf9T0uL8WL6LpTS9J7F3N5AJfcdAEG0N65GkzmQIwdGu6vpjUdLGbz6MiAmmzZgIXfFHPFHi8RR5CBU08cfAUQ7MOzOAgtttyfELIViU0AW2OkpiwAKxKWzPjIkQx4oJVJKdzoSw/44gYBFen014rk7Vn/0jHJCimwNvGE3ObzA00HOM6oXqi6KlouAfMTDcy1WE0zl1f+yKqWylqeEuSm9QdE8yczNAFpQ683KOq0wF0ZzHGB1A/18LOr6I1r6Zxv2J0D/luDLwCiIFHHiVOsOQU+/10/1c6VOpiYmbwmdjsLBm62pCzD6nQxk2TAZX/Uhaub76e8wWuRdzR5c3KLRUVxescGZqm4dN0pgs/NKedFSYO3ParGN5TKAPJrsQ2NOP1oc2qwqAV1eQsx7fTfcQmRfEXBjkYTTEb/9CFQ7owCp1d93WZG7i8bSH+Vk6f0hSPK+ZjoxhA4gpH/Ar3iVmXZDmF1HqqzEGWjZmZzx0Dz1lwSK8RsnJfUqhrll7Cvu3UJzdkBLgOwDFzblo8fFT+yGPtV56Fb8FFYqB/oXKIHsIPNWmZy9RNCn54ECq4n99Hk+9rnT0ihnmE4ICTgjTFY0PFeEvUQt44geTNdpCqy5GfYzvs1LugxlDzEXS7hm7zWyF1pYb51WDJYOigR3D8Zfl7EPlXKibnqxJdKmIHxy+rm259dJheUxcPm2s/XR418ALSSduYbq2RxkNvLnSUCaiP2nP6HsQ7xGsyLtyxiuak=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(36840700001)(46966006)(40470700004)(70206006)(478600001)(81166007)(7416002)(7406005)(5660300002)(8676002)(426003)(356005)(921005)(8936002)(110136005)(316002)(82740400003)(86362001)(47076005)(4326008)(40460700003)(70586007)(83380400001)(2616005)(186003)(336012)(1076003)(26005)(2906002)(82310400005)(54906003)(7696005)(36860700001)(6666004)(40480700001)(36756003)(41300700001)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:28:13.2038 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2015801d-ce42-4994-4881-08da5f18b42e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4943
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
while all other callers do not check return value at all. So simplify the
API to return void by embedding similar WARN_ON_ONCEs.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  5 +---
 drivers/vfio/vfio.c                           | 24 ++++++++-----------
 drivers/vfio/vfio.h                           |  2 +-
 drivers/vfio/vfio_iommu_type1.c               | 16 ++++++-------
 include/linux/vfio.h                          |  4 ++--
 6 files changed, 23 insertions(+), 30 deletions(-)

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
index 61e71c1154be..01f45ec70a3d 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1959,31 +1959,27 @@ EXPORT_SYMBOL(vfio_pin_pages);
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
+	if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))
+		return;
 
-	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
-		return -E2BIG;
+	if (WARN_ON_ONCE(npage > VFIO_PIN_PAGES_MAX_ENTRIES))
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
+	if (WARN_ON_ONCE(unlikely(!driver || !driver->ops->unpin_pages)))
+		return;
+
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
index c13b9290e357..08613edaf722 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -948,20 +948,19 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
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
+	if (WARN_ON_ONCE(!iommu || !user_pfn || npage <= 0))
+		return;
 
 	/* Supported for v2 version only */
-	if (!iommu->v2)
-		return -EACCES;
+	if (WARN_ON_ONCE(!iommu->v2))
+		return;
 
 	mutex_lock(&iommu->lock);
 
@@ -979,7 +978,8 @@ static int vfio_iommu_type1_unpin_pages(void *iommu_data,
 	}
 
 	mutex_unlock(&iommu->lock);
-	return i > 0 ? i : -EINVAL;
+
+	WARN_ON_ONCE(i != npage);
 }
 
 static long vfio_sync_unpin(struct vfio_dma *dma, struct vfio_domain *domain,
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 49580fa2073a..d0844ecdc961 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -149,8 +149,8 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 
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

