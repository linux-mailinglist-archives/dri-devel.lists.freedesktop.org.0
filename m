Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D947FCC0A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2114B10E5CD;
	Wed, 29 Nov 2023 00:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFD410E5BE;
 Wed, 29 Nov 2023 00:48:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITJDgSFTkAI9hcHtFHza18oL0hFkfGkYLrsMK/+/S7N8lraCPdVaNRsJd+mrhNyxeFMdEBcZqO+SD5epwhnivdaasrh4YnCtg+vAmdq/qYbwZ+5nEpJFgSWk0AQJV+eA+I179KTd9RYCYHw8Ni1bLFQmmr8zNZkqarwgUnSCxxKX+fT1l1J7xXyV7wyJ8sUYBqq9pLf4E+qG0kVFrmMoiDXBHUfWAQiiyZTA9KQswLe/SCYJ9r3WiQtbag3yqmXIRk4QLDJEwflQS21NeFdDevwuYWZ4S6TV9T9VlKhebt3yRD1ief0xjvK9QYZh/WLEb3li6+dVawKT9JxZRAfWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEH2NAQP0Rp8Qva78ZZohlMQPFWgOfDuspF0jY5yoiU=;
 b=XrKPb0Yv3bmGFn3rbUEuVkyQEPIlEO+plJqDmvEfULrKfkuTQ6W+a/MUo3wgq1DRibKX+hvj7fxfbmR7CKVnlpDiq2QV8mpNEShAFII9W9rdBsMHt3ftpPYMrIibfmBahqqTCImnGZRJ3bp1716ZlIhY7UCJ+V4e6f/jqOfK7ryVCt5FyWDyfjpmu1hGePR33vVGNtLhlJomNWd4/A2Y5j9eYMPcD08Ty1sFwld2RoLR8P8KXORt1o2tMpZf68fX+URvuV/3IfsZuzaGr+Ko4XljD7PD7wneOADBSwLBmQNQs9rWgu3TLKTnrAp1MU7+ZcF3iWNEgVNJYt+vA2i/1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEH2NAQP0Rp8Qva78ZZohlMQPFWgOfDuspF0jY5yoiU=;
 b=ZJQi99M4THw4F1RGtkOAbNPg1H096/9FUqGzcT4PukVWc6kfs0ntEZdozG7FbkXgA/v3oT0nfUH4c10CF0NBYmANt4rAunCWyPtnGPKMhmyDDlHezk4bG/C570NiI1s0jSMFCleb5rb0ci4fY+rGUbl4g7g+iXmAVnRGebfanITk3uzf92kOsWB3bYGSs77WxBXsz0SIMuvV1TnW7m8G1+X3Jr8Cxu8B8DVNrKW06EphF9BIRXGsDnXkEsFfR7LzJ41VfZHG8/+6WHIrD8hfMWrtKMIAkv4yzb/Wn+LYlfgA3KVCESaV/XQYtJftVFHuHNL3LOBBv6848U5L/rJ9/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 00:48:13 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 00:48:13 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>,
 Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Hanjun Guo <guohanjun@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
 Jon Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Karol Herbst <kherbst@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, nouveau@lists.freedesktop.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH 02/10] iommmu/of: Do not return struct iommu_ops from
 of_iommu_configure()
Date: Tue, 28 Nov 2023 20:47:58 -0400
Message-ID: <2-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:805:de::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: f92f5945-2a58-42a8-3f7e-08dbf074dba1
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TNU9Nc56M2GNSx5gMKa29y+BfTLeDaly8sgITbBvzSpGEBDJe5eq8lzPCfHyXxcq6NJDqe65T9ORTGJk2YqZ6yftHOEUxf1VfnpIY+zlcqQQrfh21WZoYQUN8WnsaMyxT8fZ78CoxlZSQfTGf4rhnJbpOwLqhfXYWL3v+r/uY/+iuCzPFDNUh425G9VbCmy2exEdVmSvwIK6u1206aJohk8j5CB3hAPrvdzaT2enZiSAUfhFKyZhGLTSwil9YNPN4vZSzHqjP6PJs+sCFRxsUD6qaaC1okRY8GhsUXgjR20J6vAPf7MwQXcpVWZVc78JJLazleeq2UYakWciUkfE2QwCZ6mKxsp+IL2OE+zW66FZTQoZ34g6tMeDIUo1Xn8fv8idQajNfI/MDlMmUHAw96Tp7LKAGZBInxkEuBm/IfXtJQZXgwnlHOZjN9FxAN8qyw2wwJyBZZG0DICuJI+RppHGp6MvJZkrpReY2Fg+xqu8QO9T29oD9dr/RTdYje9GOVldRy1WP68nJKvo5JSiSOokusrVGegR+DxFUR8Vvn3G4S5ImwPGAKjNCxACqYeSkat7mVS49GsNfce0gBAkkCg9NvWXj42KzEQFddiVekIzqxF5ZHQoLnBO6deFXa5Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(7416002)(7366002)(7406005)(41300700001)(4326008)(8936002)(8676002)(2906002)(110136005)(316002)(66556008)(66476007)(54906003)(66946007)(2616005)(921008)(6486002)(478600001)(36756003)(6512007)(6506007)(26005)(6666004)(83380400001)(86362001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QoXaJEos8zrhw+/KQMgsmJKOnnICyEY91C1GucNa0r6H1Jhsg3+YfO7wgaIS?=
 =?us-ascii?Q?u1H9/I516jNBl9qtJ/SrhfUh+kVf1HVn3FI8yrIwqdMSZLjFAkKZI5Xzub21?=
 =?us-ascii?Q?E/DEFZlyq99Me+LFQtD23UHwnMxFEYQMD2FyJLey7esF8XYYazr98KIwBpsM?=
 =?us-ascii?Q?rHFO8pAVXiWmJKANNvkPoUUITODp1tZXej9unuEFZs7WlZUZI0wHan1hZZB+?=
 =?us-ascii?Q?Y1VyTua1K+FmiMygWhlvvWqeDC2k3KjvJEqBjsZmUDgI2QNB1Qdx7veUChTO?=
 =?us-ascii?Q?Yh4RxwYdFxvVyouB3I5YO29D4/R06OhH/SQkpq1FI2FiRorXlBQNcG/+Di8h?=
 =?us-ascii?Q?IxDfBNjpUyGr8OZOXx6oiEq04OzNP4juNWiXDVy70Ii0Tytxza5fX/oOfDdk?=
 =?us-ascii?Q?GG/GXtEfFJpEkkdoxZJZvcN5ZKlsTxtG0rrSnUP0P9x3WYKdlNPXosbTqKz9?=
 =?us-ascii?Q?zrZ6rhC+nkvYiys7Zygb+NRMTe6u9cl8iCd8ZlXjcHMfa4w/kCihj6eyOkNT?=
 =?us-ascii?Q?YWwF0I5+9nl12sOAxhm/Hzyo31jGYhY4H+VPKZuLfXmP1yOBiUh2XTe5rfOI?=
 =?us-ascii?Q?WNsmbTml7kEMJdGVH9v16QoPGmOp2k8+MiDtPH2qvctYQtKOElsu5W9N0jCd?=
 =?us-ascii?Q?BeocZNEV6P6RTXjLRRVLVQPP14qDZ8uJVXep7bv3iyuFawG4Bs5rxHootK61?=
 =?us-ascii?Q?nNC2qE17yXVVk/AewIGGWS2YvsaLMvjU9o9tmuNBL8SBWQ29ui1jeJCWc0Tg?=
 =?us-ascii?Q?DAmYVA3fLX+NgqyRftlo+3dC24h0H/Sp/uG+TYjwqnn3LgkFQRzkT+Jrn3zJ?=
 =?us-ascii?Q?5oYk3OldORi/+X4f8lOpSe7DR/Jn7Yp/dAaXisMMRpTTrLuGOwCCx7Fti7pg?=
 =?us-ascii?Q?oludFMPYGKDsHanqCkqD6nRiYTzrM3000vLzhw8gWG183Yalt2r0aotUhG9W?=
 =?us-ascii?Q?RbA8qDckrrDNSmuSbS/vphIWS2DsQAJBPygAg2nQuvE8kGbAbn8ZI4rr/53T?=
 =?us-ascii?Q?KcJjne9zBIcee+H1spt3G4KIGjRdfEjQ0E33giSfuTgKXsEfm+MTnnq+To15?=
 =?us-ascii?Q?7aCvp7qtYS0xdunvcGCPWaYQH5bWhKVvRA3UW3OUKabwDplgG9Nk3hJF+xPQ?=
 =?us-ascii?Q?y7HBAA8ac8hfGGXeh7Unx+AggXMLX8cpbIKLRyKT3sfgmAewealgZRqscn7l?=
 =?us-ascii?Q?F2A1ez9aKJTe5OAOhgucMFhL8UmxaipZmnVyiFRilyx/jkQhRvGXWIJgNPnn?=
 =?us-ascii?Q?3SbeiKKZZA+XXKOe8c1lqa6cOM3sfm19y6/hqTHLccHIWPMPJuv+rPY3d3ol?=
 =?us-ascii?Q?qgTJBKw2yc1OJeXVohsHyAyEA1ynB+ivdNV0YrDebzcjO0lPLsF+G8RbNoxx?=
 =?us-ascii?Q?yacQZIK0pZY3whlVXlwlYHIXxq472Gm6Je3iWKUz+daILd+F25QtUN5z2gQo?=
 =?us-ascii?Q?mMFJwSMCENEbGg/CgC7aUQrr5Z+95mhbIN05hvPqlv0/R05XdNS2/jUr3KR0?=
 =?us-ascii?Q?6M+51JhRB2569kQtSqwz/cvYL+ikokBgC6YBwWQMcrQ5NoElSVcFyyNGPk26?=
 =?us-ascii?Q?uAHlJEU7MUZEwkNYS1MQcpyxbA2iGbFDoiSi4uaZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f92f5945-2a58-42a8-3f7e-08dbf074dba1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:09.6197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyh/uRIgbBig3OtDbjljalNXcPjxXk2zIhbwrInbAOFSs91usD860fVYGvBVSsdo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Hector Martin <marcan@marcan.st>, Jerry Snitselaar <jsnitsel@redhat.com>,
 patches@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
 Moritz Fischer <mdf@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nothing needs this pointer. Return a normal error code with the usual
IOMMU semantic that ENODEV means 'there is no IOMMU driver'.

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/of_iommu.c | 31 +++++++++++++++++++------------
 drivers/of/device.c      | 22 +++++++++++++++-------
 include/linux/of_iommu.h | 13 ++++++-------
 3 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5ecca53847d325..c6510d7e7b241b 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -107,16 +107,22 @@ static int of_iommu_configure_device(struct device_node *master_np,
 		      of_iommu_configure_dev(master_np, dev);
 }
 
-const struct iommu_ops *of_iommu_configure(struct device *dev,
-					   struct device_node *master_np,
-					   const u32 *id)
+/*
+ * Returns:
+ *  0 on success, an iommu was configured
+ *  -ENODEV if the device does not have any IOMMU
+ *  -EPROBEDEFER if probing should be tried again
+ *  -errno fatal errors
+ */
+int of_iommu_configure(struct device *dev, struct device_node *master_np,
+		       const u32 *id)
 {
 	const struct iommu_ops *ops = NULL;
 	struct iommu_fwspec *fwspec;
 	int err = NO_IOMMU;
 
 	if (!master_np)
-		return NULL;
+		return -ENODEV;
 
 	/* Serialise to make dev->iommu stable under our potential fwspec */
 	mutex_lock(&iommu_probe_device_lock);
@@ -124,7 +130,7 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 	if (fwspec) {
 		if (fwspec->ops) {
 			mutex_unlock(&iommu_probe_device_lock);
-			return fwspec->ops;
+			return 0;
 		}
 		/* In the deferred case, start again from scratch */
 		iommu_fwspec_free(dev);
@@ -169,14 +175,15 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 		err = iommu_probe_device(dev);
 
 	/* Ignore all other errors apart from EPROBE_DEFER */
-	if (err == -EPROBE_DEFER) {
-		ops = ERR_PTR(err);
-	} else if (err < 0) {
-		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
-		ops = NULL;
+	if (err < 0) {
+		if (err == -EPROBE_DEFER)
+			return err;
+		dev_dbg(dev, "Adding to IOMMU failed: %pe\n", ERR_PTR(err));
+		return err;
 	}
-
-	return ops;
+	if (!ops)
+		return -ENODEV;
+	return 0;
 }
 
 static enum iommu_resv_type __maybe_unused
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 65c71be71a8d45..873d933e8e6d1d 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -93,12 +93,12 @@ of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
 int of_dma_configure_id(struct device *dev, struct device_node *np,
 			bool force_dma, const u32 *id)
 {
-	const struct iommu_ops *iommu;
 	const struct bus_dma_region *map = NULL;
 	struct device_node *bus_np;
 	u64 dma_start = 0;
 	u64 mask, end, size = 0;
 	bool coherent;
+	int iommu_ret;
 	int ret;
 
 	if (np == dev->of_node)
@@ -181,21 +181,29 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 	dev_dbg(dev, "device is%sdma coherent\n",
 		coherent ? " " : " not ");
 
-	iommu = of_iommu_configure(dev, np, id);
-	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
+	iommu_ret = of_iommu_configure(dev, np, id);
+	if (iommu_ret == -EPROBE_DEFER) {
 		/* Don't touch range map if it wasn't set from a valid dma-ranges */
 		if (!ret)
 			dev->dma_range_map = NULL;
 		kfree(map);
 		return -EPROBE_DEFER;
-	}
+	} else if (iommu_ret == -ENODEV) {
+		dev_dbg(dev, "device is not behind an iommu\n");
+	} else if (iommu_ret) {
+		dev_err(dev, "iommu configuration for device failed with %pe\n",
+			ERR_PTR(iommu_ret));
 
-	dev_dbg(dev, "device is%sbehind an iommu\n",
-		iommu ? " " : " not ");
+		/*
+		 * Historically this routine doesn't fail driver probing
+		 * due to errors in of_iommu_configure()
+		 */
+	} else
+		dev_dbg(dev, "device is behind an iommu\n");
 
 	arch_setup_dma_ops(dev, dma_start, size, coherent);
 
-	if (!iommu)
+	if (iommu_ret)
 		of_dma_set_restricted_buffer(dev, np);
 
 	return 0;
diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
index 9a5e6b410dd2fb..e61cbbe12dac6f 100644
--- a/include/linux/of_iommu.h
+++ b/include/linux/of_iommu.h
@@ -8,20 +8,19 @@ struct iommu_ops;
 
 #ifdef CONFIG_OF_IOMMU
 
-extern const struct iommu_ops *of_iommu_configure(struct device *dev,
-					struct device_node *master_np,
-					const u32 *id);
+extern int of_iommu_configure(struct device *dev, struct device_node *master_np,
+			      const u32 *id);
 
 extern void of_iommu_get_resv_regions(struct device *dev,
 				      struct list_head *list);
 
 #else
 
-static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
-					 struct device_node *master_np,
-					 const u32 *id)
+static inline int of_iommu_configure(struct device *dev,
+				     struct device_node *master_np,
+				     const u32 *id)
 {
-	return NULL;
+	return -ENODEV;
 }
 
 static inline void of_iommu_get_resv_regions(struct device *dev,
-- 
2.42.0

