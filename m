Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830E57EB63
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDC492C98;
	Sat, 23 Jul 2022 02:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECD392C98;
 Sat, 23 Jul 2022 02:04:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWjAbtgYTIHdiJfk8RNCr/hKeiCiwE/4T3zeZm1+qrknNRmJl2o/WRqxvH+wHJjIwGS/V94RdJcVeA6zuQ0c6HzKFlwuHrftC76pTBlLFh8RKNAfETkQ5Inm4wXqGZBTF04g+BM4RVEtYqtTUj5FGf3SmhL74ygTPdE1slDNitq2T2+T4l6R3zOwgorwSdMtPkuPT2CU6iKJDCuwhkZ1NNM7guFI6jNa+grhchvkYg6hhwSwbK5+RchQWcdmoTaUcJOobtI66hySHenUtFWQVquTUBIxLTy/E2GYHYOARKDktOKh2c/nzu7N1bkgqw3QgsMBW/HqjkfFx/1uvcGamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGLzRxlahipGqkxQeGiJRlLebLZDQeu5tc4Mr/URf1o=;
 b=QOMrhx/2OpsjOsgkyIoxbUo3GcC+2HkA+Hbbsmzk3AnC/OrVny22WemAT3ZRUNmrMgm14FEUgouYHWkZ4fpWP8OsUJsdaL1/yGGrMiw7/8eGmryLjHBqk6ZF3EV8Hvpe5AVSrba4pwccb+5/08JLHEBVZabHTBb+UAz7gOmLwBoCtQ8qnseyeCy0V+vRTVf4bXcDsCPya/OGh/JxMIEIidNfscfOlO4TsIwBSEqTEX27D6fn7OBd/R5fajyTdc0fykDDEjBeKuLjuRcxVHUFI/MlRw0PkepaPq1XlXpsqwHUOXga4Ii+ZWloSXC3tLs53/EposYAo2B8aWPKbH6G2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGLzRxlahipGqkxQeGiJRlLebLZDQeu5tc4Mr/URf1o=;
 b=hUKprwyS2ShX4UW6A5yWb8MLOpVl2ulqb5b+XMps8LpZNeMzho8uXHIkvL9E1Vo1aeOFd1Wote9xiqrDkmJzSNqz0DRuksDh79EbuqAM3/WTydK6r7A2RucCDEkOwbqzIZNEE5DSfw1a123MiFP+NSswD3txpnytvN/qngwwaQr04Jfx+9PE34W+nCJABe2FHQWKF/F2q3+1PndTAnjjTLpnH1orD5i8841NBhjDURR7Z24JpLX6ikGpNGPYXHPM8+fX6sDO5G294LvQf1dhWOS5gQERd8MhujUBwEYrQQ5KGKkA7yGYng/o3Y0HIV3Tssf2Q1tmqo016qmo+T6VeQ==
Received: from DS7PR06CA0043.namprd06.prod.outlook.com (2603:10b6:8:54::25) by
 CY4PR1201MB0264.namprd12.prod.outlook.com (2603:10b6:910:1e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Sat, 23 Jul
 2022 02:04:33 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::aa) by DS7PR06CA0043.outlook.office365.com
 (2603:10b6:8:54::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Sat, 23 Jul 2022 02:04:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:04:32 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:04:25 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:04:24 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:04:23 -0700
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
Subject: [PATCH v4 09/10] vfio/ccw: Add kmap_local_page() for memcpy
Date: Fri, 22 Jul 2022 19:02:55 -0700
Message-ID: <20220723020256.30081-10-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1f3ab0d-40a5-47c6-b5cf-08da6c4fafa1
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0264:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ezRfR+lYn+Jz1aJFJzDLwZ6D0vcmn/Jrhvn9hPFBAJai7lDOUEG/G8caofJfIWqIdA6XxkcMSDlZuh+zT5JJzUaTICvZfCOdKGwQjJ8NV2VIlVCSAUx9Uku08JOA0jcAgjErFL+byn4JG4mDLr2EwcszCOkJaPCeRCh0mZQq2g/x2ZFpYrywR9huFNlTekIeQamZ5zjiqfCnXPRTqFpBvOMRK5EEL1lnqn10UU/73aGO7BzFWgkJDTRhrADnMDVhqvYxN+mgsBcS1qTYX/RpRbwHB166ZzGLP+qolRjUKXXWSYkUGMsakPFHUt2mfCMnHdkjUK6oyUVwK5uKLWHytNK4WBZuCUH1ZmKh3dqJ4yCSDwvgLKDi2sBctCXtRIMbhikgQkxE7Vqoy/HARKUeL6DH8lwlX9OIyWgLpMTtlFH9Pj8EF+/vSx1OBwejYKPxSAIMCvU3l/OGFzk+cw69i8SdfbnHJIDBja/+8i8uQiteQ7kCb1LYN10XKLYNsftsEmCCjqOYStNaK74y207OU+ZOqaGvu4RPZv566+FJr5KkgyZJoVm/AMOWGxjtFy2lCr6c1bs2ZMDUpo3M4nJdaUQdmGsIFt5GiqJB469pDh6/8JRiZCPR7sJrVKqIsYWwTf+lYf/3exoHIvvVZTTsFIgHsIoNYU1r5vWhtFDR54EX44kdVCi3fBwWAODllQuTAVa37MChfQGKBuwClx3jMbklGSnhyAPWZhhvOHvrkwfIDYSaYhkkWHDo1Uc5ZE+6QogzK7r8nu7/LSd0IdgLY/+GQZo3vJ3LvWIneudDda/NU43qIavGemdF+IG8lTpepcfeCnhYoo74KC0Oz1aOGSMxwDtHluksBDB0tGV6HV4jrdtzZ2Y2Igtyg0oOL2n/6dOHhk72DzILPvANnU6/w==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(2906002)(8676002)(6666004)(7416002)(478600001)(41300700001)(110136005)(26005)(356005)(70586007)(82740400003)(7406005)(7696005)(921005)(82310400005)(81166007)(86362001)(4326008)(47076005)(426003)(186003)(36756003)(83380400001)(336012)(54906003)(40460700003)(2616005)(316002)(5660300002)(36860700001)(70206006)(1076003)(8936002)(40480700001)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:04:32.3361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f3ab0d-40a5-47c6-b5cf-08da6c4fafa1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0264
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

A PFN is not secure enough to promise that the memory is not IO. And
direct access via memcpy() that only handles CPU memory will crash on
S390 if the PFN is an IO PFN, as we have to use the memcpy_to/fromio()
that uses the special S390 IO access instructions. On the other hand,
a "struct page *" is always a CPU coherent thing that fits memcpy().

Also, casting a PFN to "void *" for memcpy() is not a proper practice,
kmap_local_page() is the correct API to call here, though S390 doesn't
use highmem, which means kmap_local_page() is a NOP.

There's a following patch changing the vfio_pin_pages() API to return
a list of "struct page *" instead of PFNs. It will block any IO memory
from ever getting into this call path, for such a security purpose. In
this patch, add kmap_local_page() to prepare for that.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: Eric Farman <farman@linux.ibm.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_cp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 3854c3d573f5..cd4ec4f6d6ff 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -11,6 +11,7 @@
 #include <linux/ratelimit.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/highmem.h>
 #include <linux/iommu.h>
 #include <linux/vfio.h>
 #include <asm/idals.h>
@@ -230,7 +231,6 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 			   unsigned long n)
 {
 	struct page_array pa = {0};
-	u64 from;
 	int i, ret;
 	unsigned long l, m;
 
@@ -246,7 +246,9 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 
 	l = n;
 	for (i = 0; i < pa.pa_nr; i++) {
-		from = pa.pa_pfn[i] << PAGE_SHIFT;
+		struct page *page = pfn_to_page(pa.pa_pfn[i]);
+		void *from = kmap_local_page(page);
+
 		m = PAGE_SIZE;
 		if (i == 0) {
 			from += iova & (PAGE_SIZE - 1);
@@ -254,7 +256,8 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 		}
 
 		m = min(l, m);
-		memcpy(to + (n - l), (void *)from, m);
+		memcpy(to + (n - l), from, m);
+		kunmap_local(from);
 
 		l -= m;
 		if (l == 0)
-- 
2.17.1

