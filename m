Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019E57EB53
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286E792DF1;
	Sat, 23 Jul 2022 02:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD68192D24;
 Sat, 23 Jul 2022 02:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxTA3lDEEmv51Rv7jogs8CbSgqV8eYQc97Zmm4GExfbxHBQ0yEtFVz2sSX4+/7AEtWU2BEsTvByYakmgvmEYvVxOIXVkObnIOWnSSENK91WzJLTxbnE0HGCvrteSRRDosf7OVDFS84UzPs2xRUUTS/khvsc/jyDmqk2F+XxRROkioQ0A1jgDOMU5tpPw5zYeYNtEe1CdMYN47/8jDjrmX8w694UrZFGkLyEbW0EZ1BxP73TlZGz2A3EIxETln5MnxJYF6+WW+fLZIMQYMvdJhquK5Sw3GeQxWGZHePLDd2unTYSUx5LFnPkuULiCR/jvobFOrVaIFGAH2WXRdmsTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSbr0ptHu8jicIoCQSf/c9ikdG/DcMNO02c6EI8L3Yw=;
 b=TRJSvNh6/3fJIrHq/jDU5Dq8KBzYfcN9Uu6U89swsjRlUaHdC7Knwtc9uhZvprSNlj298GoR3o1jxak4GRpXQwVFk4NsIFORZFCFh7mb8Xh1fR04HzJB03nNkoDb72QZpEESefHvfECJZTEDQr7pZA/pZPfOvn1DfbyVxhrVuVV+23R6V79qzoHrFS2uryOqvPsdZxj0AUMbSf/QK5KVUS9T/TnqgEr5Nou+eGutzYL+8Qg4BZvL3NecPMu3FCtbJ5C1R/+6e6JIRbGxH9dElC2E2+cV0LZN+2W0Vtt7ytj5ste/Xkd7CvFV6pL3nZ4Pz6ATFhy6uu1m3jb1uERPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSbr0ptHu8jicIoCQSf/c9ikdG/DcMNO02c6EI8L3Yw=;
 b=G98MiUGfKNMQ0WSHxPJe5pLuNhK3uT02OIL26zqyPPs0MVxpzusOe187pT4fc2J1LwEp0zUJtF2ScQqGcjm084Epa18Z8QAF0uokk4sSfDYG7TzSmoxC+RaA9finftuu0nPx28Pj0CTm+T3bBW/JdzO+fZe3wMVQNWsy+fTPaUH4u4Vf68GyTobw1vxHTTOI5TsGl8lzAb8iZ1KEmXlNYpuKUfQKttuYvoIPSgRFpaAM1H98It7FO3yrxxTpwmfMJ/piaMCB6+evc+mBb1uZ1zVYmZUoyNOr4AYik62IKCxuCdAo9fQghXxgc3nwhLih+VOKVkwLqlvSJqFQHJ870A==
Received: from DS7PR03CA0157.namprd03.prod.outlook.com (2603:10b6:5:3b2::12)
 by MW2PR12MB2409.namprd12.prod.outlook.com (2603:10b6:907:9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Sat, 23 Jul
 2022 02:04:17 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::e5) by DS7PR03CA0157.outlook.office365.com
 (2603:10b6:5:3b2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Sat, 23 Jul 2022 02:04:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:04:17 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:04:16 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:04:15 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:04:14 -0700
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
Subject: [PATCH v4 04/10] vfio/ccw: Only pass in contiguous pages
Date: Fri, 22 Jul 2022 19:02:50 -0700
Message-ID: <20220723020256.30081-5-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6b1109a-5add-4a94-dccb-08da6c4fa61d
X-MS-TrafficTypeDiagnostic: MW2PR12MB2409:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8tunMkP7s1o8GRv32MIO4hq5Rdijc2CsTBwKpeftbgHr0lPwbvURij2Eqp7uL1qZ/ff0T+B+6MEskHfNZgzKVZrrD03jgdF10ldzE39gL2DBnfEc5MN3pqSrLBgPUoujQ3VaOoOafAS+3k4NClqr7MsLejhGoixC25T3qy8rOn4+27sA75fKOPSZwaBBSW7HeSDDDLrcz5sjZLp8yvMsZcqF4OnBQvpf5N7iatc37I86Ef7954BYC8s7RmFmhOvpuBLb6qQ5mVoH2ZjRWrHyR5/qlGK+wtwu/OEAA4SKnVYqQ6SAdpl1uWsiO1nuIQHcq8ymKULpXNAg95GW0SCWZbNuvfNncM3DOEjfEsdi6zV7vtNweKGsYx6Dq5OA2KxQb7Q8hm0KicemOP1h1QW+6SFonvfRIfFv9hq5WklCyC321AxgcyeHuRP5//NZqFNvGDtFAlEycfGD6bsNNCiUUwc2dTy7S53yYCpfJt0PjuzMQkqmfn+QJ4Wao6asRx7kcYmc2ye2Fvs8R+GdWooVN+EIhMRgH7ceh6s9tmr7Lkz+idZeLXhunvFLVQARTjAHbNkCgckX0Rwuft2nc4iW+vOSE8nFT4BS3hIFyMwf1wF+uwBMjNRD5j9vgM2QBTfzhu1gRZ4+7SOoZNOIHDztVTlbzI3yVYIDbiHbkAHcVvbYwiZvUtkq9Z+QkYoFdUg60BhBwRiL6pNaZjSc8ugubbXFVWVmPsjSqf16t3d0a+J7lIsQqP/sHaQzQowgjddsOtjtxkuMTXjVaMcmHjudwuFAbe6i/PmoWASotK+/tP7BFJ8SNbgRwXak7SPqtpzBSFtvK6X9C9MsMYR9lSW6AS2eX3PPuajororHJ6/LjXG/eaHahzCn478ItHxdfcpWlSYvjCNWCOEQPeAvQRH6cw==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(396003)(40470700004)(36840700001)(46966006)(86362001)(41300700001)(110136005)(921005)(356005)(82310400005)(36756003)(2616005)(81166007)(83380400001)(1076003)(186003)(5660300002)(426003)(47076005)(336012)(6666004)(7406005)(8676002)(2906002)(26005)(316002)(8936002)(70586007)(40480700001)(478600001)(54906003)(7416002)(4326008)(82740400003)(36860700001)(40460700003)(70206006)(7696005)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:04:17.0287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b1109a-5add-4a94-dccb-08da6c4fa61d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2409
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

This driver is the only caller of vfio_pin/unpin_pages that might pass
in a non-contiguous PFN list, but in many cases it has a contiguous PFN
list to process. So letting VFIO API handle a non-contiguous PFN list
is actually counterproductive.

Add a pair of simple loops to pass in contiguous PFNs only, to have an
efficient implementation in VFIO.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_cp.c | 70 +++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 14 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 0c2be9421ab7..3b94863ad24e 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -90,6 +90,38 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
 	return 0;
 }
 
+/*
+ * pfn_array_unpin() - Unpin user pages in memory
+ * @pa: pfn_array on which to perform the operation
+ * @vdev: the vfio device to perform the operation
+ * @pa_nr: number of user pages to unpin
+ *
+ * Only unpin if any pages were pinned to begin with, i.e. pa_nr > 0,
+ * otherwise only clear pa->pa_nr
+ */
+static void pfn_array_unpin(struct pfn_array *pa,
+			    struct vfio_device *vdev, int pa_nr)
+{
+	int unpinned = 0, npage = 1;
+
+	while (unpinned < pa_nr) {
+		unsigned long *first = &pa->pa_iova_pfn[unpinned];
+		unsigned long *last = &first[npage];
+
+		if (unpinned + npage < pa_nr &&
+		    *first + npage == *last) {
+			npage++;
+			continue;
+		}
+
+		vfio_unpin_pages(vdev, first, npage);
+		unpinned += npage;
+		npage = 1;
+	}
+
+	pa->pa_nr = 0;
+}
+
 /*
  * pfn_array_pin() - Pin user pages in memory
  * @pa: pfn_array on which to perform the operation
@@ -101,34 +133,44 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
  */
 static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
 {
+	int pinned = 0, npage = 1;
 	int ret = 0;
 
-	ret = vfio_pin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr,
-			     IOMMU_READ | IOMMU_WRITE, pa->pa_pfn);
+	while (pinned < pa->pa_nr) {
+		unsigned long *first = &pa->pa_iova_pfn[pinned];
+		unsigned long *last = &first[npage];
 
-	if (ret < 0) {
-		goto err_out;
-	} else if (ret > 0 && ret != pa->pa_nr) {
-		vfio_unpin_pages(vdev, pa->pa_iova_pfn, ret);
-		ret = -EINVAL;
-		goto err_out;
+		if (pinned + npage < pa->pa_nr &&
+		    *first + npage == *last) {
+			npage++;
+			continue;
+		}
+
+		ret = vfio_pin_pages(vdev, first, npage,
+				     IOMMU_READ | IOMMU_WRITE,
+				     &pa->pa_pfn[pinned]);
+		if (ret < 0) {
+			goto err_out;
+		} else if (ret > 0 && ret != npage) {
+			pinned += ret;
+			ret = -EINVAL;
+			goto err_out;
+		}
+		pinned += npage;
+		npage = 1;
 	}
 
 	return ret;
 
 err_out:
-	pa->pa_nr = 0;
-
+	pfn_array_unpin(pa, vdev, pinned);
 	return ret;
 }
 
 /* Unpin the pages before releasing the memory. */
 static void pfn_array_unpin_free(struct pfn_array *pa, struct vfio_device *vdev)
 {
-	/* Only unpin if any pages were pinned to begin with */
-	if (pa->pa_nr)
-		vfio_unpin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr);
-	pa->pa_nr = 0;
+	pfn_array_unpin(pa, vdev, pa->pa_nr);
 	kfree(pa->pa_iova_pfn);
 }
 
-- 
2.17.1

