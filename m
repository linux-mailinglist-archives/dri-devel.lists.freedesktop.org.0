Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6F356C1AE
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6CE10EEFE;
	Fri,  8 Jul 2022 22:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2168210EEE2;
 Fri,  8 Jul 2022 22:44:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csTiI/kob2W2akVPjrLGT43O0Nbas2B7VdmJOrkDmhRiDxh8Cad1oEQdyQ3AMyZ1W7ug0Pt4M/JjbwnlLVRikLW5o5KcO324ALRVpYCslHaxqejz9jIu3QgjxbMtRmJ1qaCJxLWEHT1/u/K0Z2RY4bKCJ1vzFmHPX8yyVVoYrlI/8fQ4zTYSqb09mWylMfPTgZMfNqtq7dYBlnpcSCQ5ZP+m5H1kIzVzkqKpjhQPLMXJCGCt4AeJgpvFK/qz7W0/GqtI/1ypIB3Md2i/5Q07JrcZEHIE0c+B+l+xTiznP0sgk0v1K/RdrPcTJ/xnxSqDwgmzw0HDiDZ7ElDAzy6fsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGLzRxlahipGqkxQeGiJRlLebLZDQeu5tc4Mr/URf1o=;
 b=M8HyUukYVRBcGv66X8GGt/nEEmZ5GRiRey6+bzUchufxVYzUPaCZFlZZh86cp285nRgJe/dP4UnH1z6WQu5NOA3FdtqlXSURthhYjMybgi4r7nw7ckYJNm0rS3FJkNWMo9qNO5DQVHRAGxbVtKGEwIBmyClGKX5NfMjnfSjf5PAox1P2h0bT2CLMHTuBsro5xWuLKty4N3vuricViD2Zk68KsONFFj8faCMfRbOQ8NddYPguIHsCeHNfw1VSJApEXka8liA7ttgG0m0OIlMnsLBa4X3ZddpTy1SXmPsloQQ/gU7TxsCoG1NrJx4SF+pjDmEw38ulKZssPe3xD6vcQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGLzRxlahipGqkxQeGiJRlLebLZDQeu5tc4Mr/URf1o=;
 b=BJj+ITN5GaCOYUi6nyHkKlUHLG8eBxenZw5/uj9BKBcgYT9oD8iyJNCpRd6SDKkRhzJ+KbAcAuShgM7bNog2pi4CbXxnpWM+IchtjBWMMVoLK8XJXl+a8Kymjoud3AsPrOz5FXp82+Uc9DJY9GLUrtBJXTsJMg0qLLerp/7FqlpAszK1u5ZaZQvCsa3su6hHF8XulP3WZzxduge8Oa0UHbyhv10LiumoeCQkq332nnCSLnhgwt8JuQ+MKRonenkr3sgWv1cBnmJbFKWNFuISJXberdgPffhhIwt6jIrbyypX1n5qjWosusIMU2Mob7B2YmzbtMgHpRWN01MnXG37Bw==
Received: from BN9PR03CA0257.namprd03.prod.outlook.com (2603:10b6:408:ff::22)
 by DS7PR12MB6359.namprd12.prod.outlook.com (2603:10b6:8:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Fri, 8 Jul
 2022 22:44:50 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::37) by BN9PR03CA0257.outlook.office365.com
 (2603:10b6:408:ff::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:49 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:49 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:48 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:46 -0700
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
Subject: [PATCH v3 09/10] vfio/ccw: Add kmap_local_page() for memcpy
Date: Fri, 8 Jul 2022 15:44:27 -0700
Message-ID: <20220708224427.1245-10-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708224427.1245-1-nicolinc@nvidia.com>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0925e06-7428-4b4a-ea5f-08da61337721
X-MS-TrafficTypeDiagnostic: DS7PR12MB6359:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nCm/XS6T6XrODZ0mmgX7SQjqhuXwSlmTO076CZ36z8XfTm07i5W6/eMrd0Qa0NQTOB7nipwL9INmEvaBfYrdJycDkatWt2Tf1iqNycsRW1YtUVdgssDqX8pF3nlOpmDzE/exthJl/+JBZsBXK1qWs2k1jSG4BZEyUlGsY1rcAmO6kXsM5pdq69bSUdLkjakR22km9u/N+GPtkkKNFCZAhkm+/nlg8+HhVYVvqf/wKJNXF0o3mM3oIQ4cpKf/X11mnoJM9zcgJKHCWjiQnn8UXgexYZzWRayrLQRAGEXaY8EPGzVMD/H4aGo/0lIZWVVQRucvXkmBTkR0QTOXwAOhsbXT66xHXx6ije3fLurcIrDqfQUFElE6MWlrClWA+7sUEjVVJZJg+XJllLCd4zc+lQ0wdMO7ne2z0Q1saSk5R5UDh9RcJaL5luaN/EJluXvvIw/96TbdaWlSRh+3EugGgUYIvrQkAesmh9jtbUwwlWBJAJ8l5k+l55Ry/qIP/WExk+zkOHTck6Z5eP6FBIoLekNKCAX3cCf1EB6r19JbdUJ2DYpDIE4BF5NQg0y+s5EwJvLIeqGEcZ0JDrZhrSIOSu9pNGSfCqxMFCMMtKe9ugIk/nl62DJPoiCroNngOQAk2efPkBJfOqoPUgS9o2iW30OhgkXnBepMQ+5o9hz0pfHtV2cD8Xsn53a7Gl2ixFx5pZfKR1LV1oBGYcQE193p2OhFqQw84Zh6mQdWiuQMFbyk/KUij8jmWlBZ+9GrsivqiPG/aIv7/sHMt3yxyFOby1WiFNQaywYNgEuWXBDwVqF6YjOUf0jubqA35Czo26QUplIU4fr3a/x5TFRPNPYU15JvL0BiAB2Nh3q23f8Z3YvNqyzM32aF4thvu8X9zIFz7hrI+zzO/DNsi5ywffHBYSUsicqsrPqCKBeAMN7RVnw=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(40470700004)(110136005)(26005)(5660300002)(7406005)(7416002)(6666004)(316002)(41300700001)(81166007)(70206006)(54906003)(70586007)(356005)(86362001)(8676002)(478600001)(8936002)(4326008)(7696005)(40460700003)(82740400003)(83380400001)(186003)(40480700001)(36860700001)(82310400005)(36756003)(426003)(47076005)(336012)(2616005)(1076003)(2906002)(921005)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:49.4565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0925e06-7428-4b4a-ea5f-08da61337721
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6359
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

