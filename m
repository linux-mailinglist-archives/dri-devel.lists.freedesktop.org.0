Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD91567E62
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 08:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD20A10F966;
	Wed,  6 Jul 2022 06:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9384610F95B;
 Wed,  6 Jul 2022 06:28:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZxAylzueXYiAwGpRZH21hJQdmKbtm2Tbbd1iIisFvM3n7Cdin5rQP7mvfLGEHVJETb9meE2GI1s8q6ZkrhgcITEddQvWiGwl1YYfxuAFZdYk+QNFJaiBXMix+MMFtmWaIQRS4vEAWUGU8isoqNEDdNcIdzBvOGxlk5+0b49ASBWlDxWUV29MftgUkWvTVwmbzSjzrGFcno7N/xV0Rkqr0IEKym0KJ6lhEe8TuKoekx2SX4vNd6TkilGuBSbEqmnle6ykQL8lEm1iMSm2H8QaWV0/FEYfME5UoA7bZf+zwfrlIO+/L/f4TJImkP1sE2eGe5ODMMKpXwEX2mBlx7TtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGzY5kDOuxoOgpgnwFQgvMH+nVw92r80SdTewifgses=;
 b=cIa26FoRcV6jQ0S5wTiY4t1cJecPzeLWvn02eeaVVIKMcmBHWYOletJggq0GjDTlt4LjEazqZhRz9ssXfxqFgznbfgQjxWQv8MbG29im4vU+EquANorgU7YMH8yCIFv6926YU2pMMZrch8PhqoIRLYSGeUwygsVZK6E1SAhsfHq9JLdr4FspQtwJ0qzTIy3opl3UJda8VgKk//MProQ7w6bzl1lBqIOhcfRJgwQ1JcE0Owh5YybTBBFfALnHfMumMdIC9mL5ySFJgPKjdyzZijvnaKFrHXbaIY99UqJTzPbYfvo29+Y8CI0+tQdz4//mt6NDKHVDGouKi7W4a9RsEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGzY5kDOuxoOgpgnwFQgvMH+nVw92r80SdTewifgses=;
 b=NdCB37UwKQyQCk8DbFHRVJuOZCQ1L5KvRFBM52/0bGNDuelkj2POcrbDT+a81+txWd8HEBeZTuil8v16YTl1w6C5xzfNkT2y+4UIN6hG2xHTtWsEQDEfhFnKQyJn7AvEUcT+r+gyJCFt0KOWEkcuLnYGrUBIVmGJnEsA1TKT9x4UPULRBO/Mks1+RPud7IpOwGIZ9UptBIXB6Iycgn0jo/iaS2Jp/dF/t0Q+LvWTb5vKOiEaeWFPsWj2AXybHo9hXVXMsAA2VwwDZnCNCfMQ7HHLqytIVTShQD2kxZaMdMkh0NEbpN9TP1YeyvoEl2VdPACc7YnBkPm/12p5o3XnVg==
Received: from DM6PR12CA0004.namprd12.prod.outlook.com (2603:10b6:5:1c0::17)
 by BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 06:28:18 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::4e) by DM6PR12CA0004.outlook.office365.com
 (2603:10b6:5:1c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 6 Jul 2022 06:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 06:28:18 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 6 Jul 2022 06:28:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 5 Jul 2022
 23:28:16 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 5 Jul 2022 23:28:15 -0700
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
Subject: [RFT][PATCH v2 3/9] vfio/ccw: Only pass in contiguous pages
Date: Tue, 5 Jul 2022 23:27:53 -0700
Message-ID: <20220706062759.24946-4-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220706062759.24946-1-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94d1939b-66a1-4f0f-ffc6-08da5f18b721
X-MS-TrafficTypeDiagnostic: BY5PR12MB4114:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbEkdFNI2JfjsA6yxocRCLCkrsuoLWtJNjDbZJR0ksPojirBt1G5kthH4tE5dU8IPq46sjERsCLkJg/52NuEtPRto7ixdKxLWcLCf+lJncYo/GbgOrhWlkJaAW9AQcJWMMHJlcYa4RYMPjozrf9DZjvqv101U5FVDNROiJn9sMUiIuYhHkLsBYbUMrXQpGZNbyAGPJYE+dD9xiLL+DtpYpu+W2lNtOd9vvlDJY8ThzimVtcyBsSoqIFJc+JFyz+pLhUX4kLEGB/0SoHFdcvPlEMeZ3+HHCSH9RUukoVeYyLrvg1+ouL5oyqC9c/6/ButhkqL2kGwl/BMoX9l8DXbRuczJMU/1bIFqN+dCu/MsjDWNIeRqeUxRLASYuXNfdCrT2lNnObSgTSIeF63Vp7e95RvvQiSfxPZuhQ90gyrG/W3mjUzU3eS/yCoIB6sdh3njBdsel0d0C+i/ZkFQEFGsQQJeAxDU6nsmzBUhgVL4XHRMXV7OZWCtoAndo/ti6KzqL9NJREwjXJKQtgC/N124pB9OLgDW7vClGyU58pHBwPpuI4MQJTBCY/ai04vhTnlpi38e/aoJcD2d+c988qUCoEHObNEIDYkVQds4qef6MfPSjUqM57VodDaa6I8rs842QGqNOOnE+H+oVbl7AJ2pyD+vngW5r5+HUX9QDNR74itUBqq/AI/Db5lkXzf72CNM7SDlXpFaSmwW6myl1EyHT5bgEPZLiE1Na3nMHlYzZMZGmyUyZ6eEOpfWu1GEZeeIC1gI+3EdqYbrLGIu7ppPX20ekSzSmg3FEXqJ87CcVV/1eKYCEtFr/ywB5yqrur8oFSPKaEZbpl2XegCrSSLYghoFi09R8sCyNMSRRk+Lcj7DmtSAV77IfY6CQHlpW+FgTAkotKqZjG5iY0CNwHTutq2jhiyAD/IuaPbrI6uRs4=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966006)(36840700001)(40470700004)(5660300002)(7416002)(7406005)(356005)(921005)(8936002)(82740400003)(36860700001)(82310400005)(81166007)(2906002)(54906003)(26005)(7696005)(110136005)(2616005)(316002)(83380400001)(41300700001)(6666004)(478600001)(70586007)(4326008)(70206006)(8676002)(47076005)(336012)(426003)(1076003)(186003)(40460700003)(40480700001)(36756003)(86362001)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:28:18.1409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d1939b-66a1-4f0f-ffc6-08da5f18b721
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114
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

