Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB554F194
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C03E11A90A;
	Fri, 17 Jun 2022 07:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA31710EECA;
 Thu, 16 Jun 2022 23:53:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drb+KumyF78nclYhdN/hgjb4izGbwDEKCZxwLCYOzGJjGRRB5Bnlo6sJd7sk23gLZWn135uyUnpxZtS1Z6HpOBTQCZH/JMM/myCbBcObyKlugb+dEAvoXjPhnbACigV/wjnIv3lSAR96rcqZK/nvcxi59Ql97ToPcucsxFwKfC+i7gR9UJLGU66peiz82RyQuQChqYT6WhhRHOjO59Rnl/4NjU3RHtmqHgK0LmmTn85lMVdkcVharX50oJCAnxBwFp2u68yNpQoUdpDC0dGs4B1spaAobRDbdgxoQe0Hc1kRiVcEKI8YPbnq/biLDIfQ0W9ZjCwq4xWSUK7nUth9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCL0SCLyyI//MdYFrymdGT7O78EMF3b0H9vrAMiYSFc=;
 b=L1ZlvlZOYM26OD8d60bX6XkkYty4EBz6IDDsm37h6N5zc++3HOW5FEIht8/ihM9xeKjBAz96Ciu6wD0kNBaWphomZFSfrYMFhIXeru0tReIBXWOPdMZASRDrpZv34NsrOl/CfXZNNdkbd7OzJa7W7Rf/0nVDmEN8Nv+FqyZXsN4bmj/PcpZ3rjJB/zQd6O9yfYwZRNQPCRhg+PV4xNlerN2s/sOMUhXtqxnPjfFtMxMla1zQB5725Ya7gklVPtzgQLKr3kJyi3y9DvvBLSF98rcu84Rc8MPoxZxHE1KPorYb7m3SJOB7pSQMvIdeAU1PpFCQThMgXmAx47uKfTsu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCL0SCLyyI//MdYFrymdGT7O78EMF3b0H9vrAMiYSFc=;
 b=ZEu2vTUHgANbFrBjegqbDn+MHbnGM7AV5bjN30NwaN/Hb8pynCHX6pTsdT/IkKoBmufBd0ep7D4mWcz/UL3OcauXt/wjpyQfEoJ6Tzc3SMvtbZx5pAnL8Ny7cetX6u9jeayDIq2jamkpIwb5uB2AOn2G23D/Qt9dtHW7CJeKBg2A5sv0LYtZCWKuhufjj3Bqxty+k9DvX8NcGcNsRjfbWwFGby9pXJ4nHRHFQIr0d1K6iCveyVpwR7IwMIl4pDhkrOEzcw3+auAANg55PaBoM2WF6E+JgwPW66t6IGAkpTdA3tNiKalq1Q7INvb20H8H0x7e7wUyCiLnpL6/wjCfDA==
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 23:53:29 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::13) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Thu, 16 Jun 2022 23:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 23:53:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 16 Jun 2022 23:53:27 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 16:53:26 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 16 Jun 2022 16:53:24 -0700
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
 <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Date: Thu, 16 Jun 2022 16:52:11 -0700
Message-ID: <20220616235212.15185-6-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616235212.15185-1-nicolinc@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83c013fa-080d-437d-5490-08da4ff3694c
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6266:EE_
X-Microsoft-Antispam-PRVS: <SJ1PR12MB6266515C572F67D9D4A02570ABAC9@SJ1PR12MB6266.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FUZG+gT+DdyRJL1oggseQiIwwcLHsrSAtr4B7ui+RpARMTYh2FKg9os6j5AZdLTJFO1gpUs4cpy76yrUPmN2aJ++OExfiD7K8HwyWxYnYJHkXEptqjem2EjrCbjxgIqMZr/fPXhZ0RaZVgLpmwipYXOgufg+29U6otU1XdM1WvMSMUDIDIdv7+x2+pKAwx87x5fKp/Gmg6xW+7LKBfpD4z0rpqNE0Q5ERj/sEgPD3R0b6uhtkfV/TOZWlnkv1g0tp8qHe1IDUTcXgjkUR98wzBV/RFv3qGpMRmPouqSMFsmUfTw9hD4FmpTaTD+TFUPgCYn/PwWmE+kTgBT53SbItIRwvuFwvLjdhTKh4hpTWz2EstVetkov4jW82+oCHNJjb9uxi5yejJEcHOx+j3VSWgue/uhRIAMq6147myCSQ5FEsNsJJ9Q3BDJunewbxGDh22Iz71vQFqDoKDrd/c9SAJhQ3t64CKTH6uxlZ4JGGwPpEo4cBZsvhQr437EeQoaWhlcRuDMdRKXFZx4tQpE8kyzV/mxDdhxbP+Xyk9gyrjGN1PaB2pfX0hjkWyg0RdO57nBXy695XIbm8Na2EM72rYRh0M8sMtr6D1LiXlsru9HLCuo5FcWHmZtGsWrwnlm/L775xFGKojIDOIj5hWDRLWu+eJmXWHpSvGKkMzUwXQEs3FOvcBmXTRts6NHJiUJtLZXJQpurMtcv9tuNL1hQsfJBRHQdSArEGtguM4d6gBFLkquG4OdyIfBfVLeHXSkvRt36/Sem7iZA+rBte6Ijyg==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(82310400005)(186003)(336012)(1076003)(47076005)(6666004)(426003)(2616005)(110136005)(54906003)(8676002)(4326008)(70206006)(70586007)(83380400001)(36756003)(316002)(7406005)(498600001)(86362001)(40460700003)(5660300002)(26005)(7696005)(7416002)(356005)(81166007)(36860700001)(921005)(2906002)(8936002)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 23:53:28.7353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c013fa-080d-437d-5490-08da4ff3694c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266
X-Mailman-Approved-At: Fri, 17 Jun 2022 07:12:24 +0000
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

The pinned PFN list returned from vfio_pin_pages() is simply converted
using page_to_pfn() without protection, so direct access via memcpy()
will crash on S390 if the PFN is an IO PFN. Instead, the pages should
be touched using kmap_local_page().

Add kmap_local_page() before doing memcpy on "from".

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_cp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index e2b01115b3ec..12cbe66721af 100644
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
@@ -235,7 +236,6 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 			   unsigned long n)
 {
 	struct pfn_array pa = {0};
-	u64 from;
 	int i, ret;
 	unsigned long l, m;
 
@@ -251,7 +251,9 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 
 	l = n;
 	for (i = 0; i < pa.pa_nr; i++) {
-		from = pa.pa_pfn[i] << PAGE_SHIFT;
+		struct page *page = pfn_to_page(pa.pa_pfn[i]);
+		void *from = kmap_local_page(page);
+
 		m = PAGE_SIZE;
 		if (i == 0) {
 			from += iova & (PAGE_SIZE - 1);
@@ -259,7 +261,8 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 		}
 
 		m = min(l, m);
-		memcpy(to + (n - l), (void *)from, m);
+		memcpy(to + (n - l), from, m);
+		kunmap_local(from);
 
 		l -= m;
 		if (l == 0)
-- 
2.17.1

