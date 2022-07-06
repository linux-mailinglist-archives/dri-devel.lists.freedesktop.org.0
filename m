Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9130567E69
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 08:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F71A10F982;
	Wed,  6 Jul 2022 06:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CABF10F9A0;
 Wed,  6 Jul 2022 06:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRAGCyGGHwo0rT7nXupMONaIYioE5uR8jaiHKKyfsmLXxfbizEiHu4Q+JhsTGeQ9l3mOyh+KoYcVI7Zo1Pm6i1e07J18+UeP31Fs1DpOUdCn5BQmqDmy4FY8j/jNePC2DbuuN4y3auc4DEqgYnqDAdO+1CuZrXk3s4RPa1CPx3KYlzzF35A38WPqHDSxIYhQf/TFxi+Ye4tA2uA2ycexwlrUf/e/Lv9gcehKsbhpd0PtyKYNEdzufCqsPLFLcgT2/7niEDdKA9gSCVpCGgVo4R8fWfnMS7LC1mTATb/P5NbVGBv8it1zr33HHoD/OktmXRzs5ICsauLR+Tea56kV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fg/czNGUYXaRGNcqo40iZSEEded7MYvJjsn8UlI/3Yk=;
 b=i1YE6xzbEWTyqE3gB1BcKMrDUP2JLmV30TetMrtkk9+w0b910J0ZlGqM8H2aaPEE68Seu2LD9pWZSqtgCOeY+/A/U85OeZ9uHq6heBXo608yQD/VhMzhc9PmIY2iH2Q0CPeStRsx/iWS52qh7DS4e1N18QY1iHj1/YdBFOXDoE8rwRB8iYzqu6sqDIduNb2j8SJGgPEgLPmxBrpfhXg8bgn1Pfzhl8wYPi9N3O2nzbcdu4GHobZnhxHrzn5lFa3YshUBvPA6tLn9EH5GEOdToxtilWz/pKggDP++FtQ5x/h3KLFEVO8f1yDo/uJJG/KvLnkIo49lT2BTVOJkCeuAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg/czNGUYXaRGNcqo40iZSEEded7MYvJjsn8UlI/3Yk=;
 b=Cg7WokfpJeCbWVU/KTRcl3KhoQGKhUWtIkoai10IEhKHWCzW9Bvl0VzCKlTW1miZN1pE3dtWxt1SH+9wFfV4PltALd+FJxcvyu11lIRmP7Ex7UOvq0uWMOvdsXfRwYMTBA/jgnwd15xyMvH4JILzPX6D6Do/S8DWTSENEY980K/l7KE9S9X5gCj6VEic3rH828ScpIL+6lrtWRaHHylCoNd7VJ4R4JbA5uZvSKzFMcHzKud5T95xz4JxTHpk5B/7RNI0ckbjXd0Eatsv8Zk8ohxlA8aiTQDMnJzA0PDjL3+rSb9gFW8rXRTIL+pfhkLyxsIKYrTpbhzNSPqPWjbiCg==
Received: from MW4PR04CA0056.namprd04.prod.outlook.com (2603:10b6:303:6a::31)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 06:28:28 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::94) by MW4PR04CA0056.outlook.office365.com
 (2603:10b6:303:6a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 06:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 06:28:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 6 Jul 2022 06:28:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 5 Jul 2022
 23:28:27 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 5 Jul 2022 23:28:25 -0700
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
Subject: [RFT][PATCH v2 7/9] vfio: Rename user_iova of vfio_dma_rw()
Date: Tue, 5 Jul 2022 23:27:57 -0700
Message-ID: <20220706062759.24946-8-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220706062759.24946-1-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a11b0835-a98f-46d9-5cf0-08da5f18bd1c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4424:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kRLEl4Pl12VvwbEBvVsFSCZBrGKXX2dBRKCe4U+UwN2ZkfqrxorxgxDMqVA0z3LhCtwSii8SIFHtteBkLJLz4l+0gO59hI1WgoFZBPkBVRR5G0eg48iKxPR0LvjJMSwYWCpDl0rYe9AyVp5pvJWzYtv25r0GgbzxPRmJU03afjTUgfIyedOzXBLHgPEa2WOuiH87u0g6fGv44WWJ9GQZq6EOqSllrzwvu6q3OJ/MLQDlDkrMjyNxWH5X/vUucnZeaJFfLQCZuK2pC41KhgqkSskx26fcKBpAQxRYH/rvO9lLn6OYbZ1UsMWtFrJvOBGL/THlmGed13JDroGNiWCcKV+CmuRMlOKdABR/ofB28fPffxiRVH6zW5BYY661dd8tRXjaUxUc7hw+Gk0HDwXgdbhq6kvKH7FWGCbn6ZT0O5cm99Qxpfy0MZKsoWE8LZtq93kgL1QosVD1v/sQute7cdXoRFWV/N/SCSG7ZqQcp+WpnCXZtjckmIagmu9eyJu6YUsHse5L6WgL5ycLgBHBOW/Ky9MDbv3BEX+nm+VE7MY6vQ5znW/0t67pPj2+GoQyXgzNFZcib8jbQgFfcy67DEc3L3emH0U2NkDjwRrst8EzjGif9VsAtKyqVSkivC8Y4vV9niuueeSC5AB3UMF8a+YgTOjk6GphiYdeiTHPhhFdMmhqcJVOIoa5g83Dx11HMIdRZysVsL6HthwNjG6n8ezSjyA3VymGJTGXn6O0QdKOZSUWGZgEytmpWk8HiJfMdYRseAnO8l55fOmmIKdPKSUBiv3HiqsV2tkZRMcbEYMoxOGZa7YvLglCL5RFWCb0H0SM4KeGlMqChyXngbEPLZRun7rkkEvkIirTR6cyI5Od92ynm8r2Yqyc/meHNl5yOtYhFFhKq6LSIJvr4vXpTE7CJJpuVAGxvyKp34l85yc=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(40470700004)(46966006)(36840700001)(8936002)(7416002)(81166007)(7406005)(426003)(5660300002)(54906003)(70206006)(70586007)(4326008)(41300700001)(921005)(86362001)(82310400005)(6666004)(316002)(356005)(110136005)(36860700001)(186003)(47076005)(26005)(36756003)(7696005)(2616005)(40460700003)(2906002)(40480700001)(8676002)(336012)(1076003)(82740400003)(83380400001)(478600001)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:28:28.1859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11b0835-a98f-46d9-5cf0-08da5f18bd1c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
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

Following the updated vfio_pin/unpin_pages(), use the simpler "iova".

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/vfio/vfio.c  | 6 +++---
 include/linux/vfio.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 813b517c973e..b95ec2d78966 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1991,13 +1991,13 @@ EXPORT_SYMBOL(vfio_unpin_pages);
  * not a real device DMA, it is not necessary to pin the user space memory.
  *
  * @device [in]		: VFIO device
- * @user_iova [in]	: base IOVA of a user space buffer
+ * @iova [in]		: base IOVA of a user space buffer
  * @data [in]		: pointer to kernel buffer
  * @len [in]		: kernel buffer length
  * @write		: indicate read or write
  * Return error code on failure or 0 on success.
  */
-int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
+int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova, void *data,
 		size_t len, bool write)
 {
 	struct vfio_container *container;
@@ -2013,7 +2013,7 @@ int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
 
 	if (likely(driver && driver->ops->dma_rw))
 		ret = driver->ops->dma_rw(container->iommu_data,
-					  user_iova, data, len, write);
+					  iova, data, len, write);
 	else
 		ret = -ENOTTY;
 	return ret;
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index c3e441c0bf4b..9108de34a79b 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -150,7 +150,7 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 		   int npage, int prot, unsigned long *phys_pfn);
 void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage);
-int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
+int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova,
 		void *data, size_t len, bool write);
 
 /* each type has independent events */
-- 
2.17.1

