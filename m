Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6954F197
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC3711A90B;
	Fri, 17 Jun 2022 07:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F1410EE4E;
 Thu, 16 Jun 2022 23:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSBRNgVTQ6teEeD5X3t+ScdJ2M0qQxGAIgRYpm30Ve8P2t8SQuI2kZcmy+IdlQYwzCDrDS9u8TP0rSyXmFo9YYCuGF1PdyZ6VCb09GNwdcwzKxqLoy8sIo4U8U5Ezqz2Lxe4cMkVXmXoixlfdCWx/vrq41fqvNN5ABzhoofX8q+j/eWERv+Yat70J7WqTIwglc6pN98W5qsdmmzH2exYCx9PYXgXV+KV0NDk+hib8Qj4/Ji4lKLdfY1MtsOmcRtjza/iVqLFSbFfKMi4BoiepkheluRY0Nlz3SpQqgSx1uWl0h1VcK5GCXzq2DIpGHXqpFhvW9jlv+ToHz90ZgIpgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJD2GcvDez4bY7HzxOLm7zuPebV+AZN96A/xnvVXxAE=;
 b=ixy+xwtoy3+Q1m9/4Sh7Lyl7e8ba+ZpklOQsk1Ve70JqW+4f4Az2jHPfeg7P09LCDMuHzzOgTxMdweI5IbWPnpQ9qJCqyiTTILUOs71RslMTx2+7/n3IYtF94BLYtoqXjvi/vqUa8DixJ1Lu/HnzL4ey24VIfesZMQYxZvClGpJ5A6B74tXPwTvOhOFc5kkxB7sRuVBDtu9KsC3O+YAZ8j+s9ALPBnRS3jjJ8xpzv+PAazMszJlptaxn20BRgjMbFSMV1n8pf+XKozEZKnZXuOPo9fzdHBQ0+zyRv+kDTDDb4KMFM0FCdju+PoEf49+3xIgszxRUYLvX0f1qTq0nhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJD2GcvDez4bY7HzxOLm7zuPebV+AZN96A/xnvVXxAE=;
 b=JBSnBoLaAtzwKsdpv4jUn5nB6FTlD8sOkOercQ++fVHSk98LhjKHXEdVeJ54CHXPn0vY0oPiHE4DV+jYMShxQnYM9xJWKQfL8B5oq8Fpe9fIJidxcqLlRWM1sLvF+tsQPInx8bqIEAfHBw6crciJs2z86eJeG370JnGnKSMXbn6s28x5qC/QUGfPOezEADe5LVeheXfcRx1dvfTQGUei1Hvl3BMR4GiY1LG6SsQgYDQZfDtqxFLhRj17vyQarmtRBJ9gXTf/9+5KsO+AFh/6lIJcfvJjmgCGU23tcR2pQla+HjEc6ncnjfcJj3wgBBf1qPDH8DIISmEO3HA2cdPRoA==
Received: from BN9PR03CA0914.namprd03.prod.outlook.com (2603:10b6:408:107::19)
 by PH7PR12MB5758.namprd12.prod.outlook.com (2603:10b6:510:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Thu, 16 Jun
 2022 23:53:20 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::d9) by BN9PR03CA0914.outlook.office365.com
 (2603:10b6:408:107::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Thu, 16 Jun 2022 23:53:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 23:53:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 16 Jun 2022 23:53:19 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 16:53:18 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 16 Jun 2022 16:53:16 -0700
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
Subject: [RFT][PATCH v1 2/6] vfio/ccw: Only pass in contiguous pages
Date: Thu, 16 Jun 2022 16:52:08 -0700
Message-ID: <20220616235212.15185-3-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616235212.15185-1-nicolinc@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf766924-e6f8-4cf4-81ef-08da4ff36426
X-MS-TrafficTypeDiagnostic: PH7PR12MB5758:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5758E31632442E1DF044DB25ABAC9@PH7PR12MB5758.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RtNHn+Ioh3AlLc7yFIFtuofWD07JNfxe6aV6P+jpaw+fzW1VvRKVQwr93cP+Qt0YYMNbTuLogOli4AvANfwaq/AvFHwUTqa4XOFOGWA5kqYUobDz4d58JaM4LyHgucmVD/kM7O0NoY7T6TmKLO2+XtI/pSnXwLac153dwZGfRj+JER462BRJd+Dgr5liXK4VNDBOkDdHGs0uVIXUvhCSHkYTX06Nmf5o1Qw/wn7IR7rNsImRRC/TLhZ3ipGI0nlFA5ivED8JpcSd6TZM+W2X88O0qojbWLAXdEwuHhF/x1LXJEGAZq+piDBqus3iS0W0Pt/A6fO8MNkCIznn1MRb5q2dc1Kyi+3v4uAUCRdwRLP59tApS/ro6dZlOu2OD9VsJGKHFPZh2EvhBmUec31rfh2zDSiM0w2ZQ7ycGZDhnlgil6BwbT/NsMuK9XhAItJJt/fvx7y2vWxkQ8VERG3LOqwhgb/bmMze+GhiNk1My+gCenX7ut3WHOl833n3au1LaFtMRaTQUUrxcTqKUUPyGGtXHmju88ukAUw5mrsORDwmPa4RcODw0Avrh5wT/Nme534999t+t40ek7lCQ6AphG9L1+77FF8qf55/xwrLcw1t5PeEqikTo3JEP4vIQz1lnalgnYhzVvEAUKD47DAxyP+apCBHp5yClzDwCmIbhT31lCaaZbRhLGAQe8ZXoxBWC6yOe425JZEcWobYI/Rz9xuLZ0cpZK9MaGzIhdxVlbn+69+xydeKqaUi621m8CbTZw04BTejTe1b1L6NrWyyA==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(6666004)(426003)(5660300002)(110136005)(336012)(508600001)(54906003)(36756003)(7696005)(316002)(83380400001)(47076005)(82310400005)(7406005)(7416002)(4326008)(70206006)(40460700003)(356005)(81166007)(8936002)(86362001)(2906002)(70586007)(26005)(2616005)(186003)(36860700001)(8676002)(1076003)(921005)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 23:53:20.0676 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf766924-e6f8-4cf4-81ef-08da4ff36426
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5758
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

This driver is the only caller of vfio_pin/unpin_pages that might pass
in a non-contiguous PFN list, but in many cases it has a contiguous PFN
list to process. So letting VFIO API handle a non-contiguous PFN list
is actually counterproductive.

Add a pair of simple loops to pass in contiguous PFNs only, to have an
efficient implementation in VFIO.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_cp.c | 68 +++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 0c2be9421ab7..4659c2e35877 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -90,6 +90,37 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
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
+		if (unpinned + npage < pa_nr && *first + npage == *last) {
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
@@ -101,34 +132,43 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
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
+		if (pinned + npage < pa->pa_nr && *first + npage == *last) {
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

