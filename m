Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EEE567E6D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 08:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887DC10F998;
	Wed,  6 Jul 2022 06:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79D510F98C;
 Wed,  6 Jul 2022 06:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z23eb1JslBqFeWb9iCeFKMNj62OUGyMVBjh1bvq1RXLKfaY3Cj5cCIRrypX/1msM5uO+CJogS2w3tOdlgcS9BOquhl4b9xEindA2iuOyV1Q3mqcMteRPMPAj0UAJZRK5DzC6JW+7vxrCNhoRkkKdEd19jtTWFniE0UF2FlYt0XxQQpDMPcSFLq+/kx2J6enGUOQJjsh8nUfG+3heYsUbvL6QXoIPygPlQVa1ExlXHqakSsO21n3IxqQi+x57/swyEohcAz/YjO+DJYQrF0aDLki+ipigjN043CJ1DsXVv14gk9IwiJRth+3+uZI9jfwWpbzSdZYkiB60kGJkdgiIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1NcSO/+32Awp5D+9PDT6tENVBaLW4gKwEHATrIa0cg=;
 b=AmUdR67KUVrNE8ovS6ZuEbfqGZzkd2kuDxNk4fIAsgO8A9uKKfI889xrfnJ3zpeinmm6wziV7R9PoVx0VBhm9Kav4oZ1qLvBfD+khS0kIV4zrgwLH3pxmjY1vCG7EsUtA29w0EY3wahB4QfWbNmnpHoyhkCiZNX4v8W7iFYtqGMT2cMBn0FG7Uw2I7MsEx8kiVckPbbkBNLl//4kfANjUAyrANr8enxjuf3e4ew7c+6cuKhoIMqBtQ4sVEkrgaglpZlbxrGolMqPEA9T8neD8DUgzR1hsyU6fqCJIdbnI8DcxiMMw1Z537zso/j2lrMkDt6npxhkeGKf++UyOpYPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1NcSO/+32Awp5D+9PDT6tENVBaLW4gKwEHATrIa0cg=;
 b=nN5HiKQinXLRn4gfmRGNclfpQc2qX4SVL7X3zX9IG9v/VXFpii5ZL6N/r1hA2dIkz6t9TFxYwx3w+QTnIlvleEV6ezdNXW+g4h3k/rH94zi3fASxR2RWy3636ohqs9/tMI1qAhplQwnh0X0EtqW0XaLd2tn4liIIhijQQDLAhrQ1w1ntUCQVSoNZvnL5x4aB4x4DmhddoWGfKiYEGXX5HYnvKK3qbPoSKi+UgmdChHn2K4wXUFeeRTt67pZG5+wfvbEtYFqhsldPcSvoIT5mkFPgJEjTic1l2uPZcM7gX7eewZw1M7zoy2kQYAyvjCo3Cyq8xnNpC2F196cXodyR2g==
Received: from DS7PR03CA0188.namprd03.prod.outlook.com (2603:10b6:5:3b6::13)
 by BL0PR12MB2516.namprd12.prod.outlook.com (2603:10b6:207:4e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 06:28:39 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::e0) by DS7PR03CA0188.outlook.office365.com
 (2603:10b6:5:3b6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Wed, 6 Jul 2022 06:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 06:28:38 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 6 Jul 2022 06:28:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 5 Jul 2022
 23:28:29 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 5 Jul 2022 23:28:27 -0700
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
Subject: [RFT][PATCH v2 8/9] vfio/ccw: Add kmap_local_page() for memcpy
Date: Tue, 5 Jul 2022 23:27:58 -0700
Message-ID: <20220706062759.24946-9-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220706062759.24946-1-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ff7379f-c94a-46fe-dd21-08da5f18c362
X-MS-TrafficTypeDiagnostic: BL0PR12MB2516:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U5BS7yFagCing3e9lOG2jzWGyeqoWbQLEk7xBTfdlrobfaGtxl1NJttsGLGp?=
 =?us-ascii?Q?af1VBwAjM3ZFa9m2isdnKA6q353I+TdLGYw4MRO4V/BX7xWd14m7e1xf7fAR?=
 =?us-ascii?Q?7KmsviFSjjfg4n740mkD8WuxqGoHTp1C2b2giHWyhbkPi5plHCBFL2ORQKQn?=
 =?us-ascii?Q?3hnokUih7oj6hGwlqCBMaElIQGus3OxXpL78jtHYb/Wrv5EhTDRUYCfa5h5l?=
 =?us-ascii?Q?P/p8Rx13aJ1rwDXbZ7pMmt0xfmYm8aETANDK+JuMMLWCmy0lgm6ase6LRsMD?=
 =?us-ascii?Q?MBY9WgVuCGDYfkPf96q7j+MCMkkN9VxcxnTncFPEqaoK+QeTFIDpNp9Z4vV5?=
 =?us-ascii?Q?8BWvGTaRH5GpXGlm78pBVONt1IwEyhatIZbQx4VLLSQIRKvDJDYinRhpwSma?=
 =?us-ascii?Q?TvfFT+N5tFcIkZiVP2o28fWguauHm0/wuQNhr75nYMQ4A144H4NZen9xWYlJ?=
 =?us-ascii?Q?soXkXIOdWd58Vu5BYXaUJ+wnIKzJ6EKoe9rQOY+RSiN/d7XLxQAnOkhzhBHa?=
 =?us-ascii?Q?ySu1/vHV51IdJq2jyk8gfN9cpGdWZFXgayeppQ2OAsjfRo0J2aWvw1cGeWBK?=
 =?us-ascii?Q?wsPZuOTuxUt6pjQ2GxwV5bacJ1+9R3c5b2Pa5n17Zvj/Zobs0QdBjkDUwSPh?=
 =?us-ascii?Q?emFj/J+zkG7XeZchcPLfK5f+7d8WddRLL7CCRbxPKksrUluCH1y0gLR7NGDE?=
 =?us-ascii?Q?Di3n5rj0r1DUcQ7gdpDtyAQyBfjLEnUJd7NFCOKKLpRkJz8H3GWF9S/Ohwd/?=
 =?us-ascii?Q?A/2yeiqFFM62Zx66E/cjIlSZI+Jubrliamlfahuf+0MA46CErJoNct3tRGSy?=
 =?us-ascii?Q?VvNwOayZYcbkOhCC/AXnTHCNSn/DxZ6jl5ZdSmkDDGWA7L3bW9RRkN39wJzM?=
 =?us-ascii?Q?LZUBi6acdA/yDLTXzbhHkA38wJguty1KHmEpIKXHJLK3KgNw2xyZwLjGBylo?=
 =?us-ascii?Q?MVTwrHmhf1POZYKmIK3wsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(396003)(40470700004)(36840700001)(46966006)(81166007)(40480700001)(356005)(921005)(82740400003)(36860700001)(2616005)(186003)(1076003)(47076005)(426003)(336012)(2906002)(8936002)(5660300002)(36756003)(7416002)(7406005)(316002)(70586007)(70206006)(54906003)(8676002)(478600001)(4326008)(82310400005)(7696005)(41300700001)(26005)(6666004)(40460700003)(110136005)(86362001)(83380400001)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:28:38.7142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff7379f-c94a-46fe-dd21-08da5f18c362
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2516
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

