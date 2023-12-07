Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E246808F6D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F6F10E962;
	Thu,  7 Dec 2023 18:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203CE10E20F;
 Thu,  7 Dec 2023 18:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeNqIi2EmzTO5yXwRQ0WcT89WIDsLHFTSvI53pRyEBtGbiOG/W6KAsogfhZOPhRLwWBEopkUv9CH4YxctooIwYSd3VxeCu0XcCdof0/BfYV3aqOsuj5CLaaZkjDZdy3bSJjrwLzPKCqXOFOUT1gRUlGPTe0QDwzej8y6/28PGWnoFsX4xxalS3MSxv3UHBXHVllQGq5ow5lkmzBz+VowtuUf+B6aeVewP8NhMswi0fw3kPUBKgYn0AOWojlFVoupKM6GjOh27L+fTynYIi+6NgkJzK91m1TZJ5qEwFT7RfZV5tzk24uYAwWvUWyu4SfUmQnWBHFJEL0SewXg5bqk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQVz5Sf7uBZmUEQ1+Za3derhxylOeBzYVSpFmrWOsVI=;
 b=Q2o2B5R0mhz0STijuqXjnQSoModBveQ2FOajBYkD9k2JU9HyxO5EcBk7NOoFqVtVT7jEI8aU8M8oHWS3V2VtFlouyY2lR5VOcEPr0CBDd+sWgsW0Yp2Umz4hEsnXxs7ubAhFAAMrQPZ6TsdK1e0TXXNyjT6V7hbBwwRY6mgNcyux8JyL1Te4ldBWEhdNdNWNbTJXnVnsXNnY31/+Q+rezDqCAINKJerFipzUmdCKuE1fVM8l3voZeiO3i2Lbbi4INVK1pCSeAwevb7auLPVDoxQ5jEGgSDeVfcE29pz1yNovgfPgP+HWcpXjd+ex1mAt4FRGVh7FFYOA3js/T0Layw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQVz5Sf7uBZmUEQ1+Za3derhxylOeBzYVSpFmrWOsVI=;
 b=BCwWKP37UqSHwcqNkU2FHwwbTq0YqOrjmMdpgDyNwNwR1AX7sCpJ4rVVKnsSLod7rQdamXrKEn2Xoz9JCV7gh1/AkvKcpCpg6izW9DAIneZz4TmQulF0F81VThSBXnYYDuUb9ifF4M8jTwxlqJQyi/npezSqu4A+TErhkb+y+mkMuzoG88QWcEcTUnWttTCWTBFgIAy8TdzFdND88/pTDak73pXE+UmfPeaagm1A4HB0i8NCo9hZ6EBMscADa487fx6zyPy37YNyGvFLo4wKKKFGbYQZqrTOROKfsq0TNOtdaz2P9XDS2VnGj0sC9JOEZjaOPcY29+zqXLELvLVgbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 18:03:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.038; Thu, 7 Dec 2023
 18:03:16 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>,
 Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>,
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
 Lyude Paul <lyude@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 nouveau@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v2 2/7] iommmu/of: Do not return struct iommu_ops from
 of_iommu_configure()
Date: Thu,  7 Dec 2023 14:03:09 -0400
Message-ID: <2-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0053.namprd16.prod.outlook.com
 (2603:10b6:208:234::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 8883fa97-f385-40db-464d-08dbf74ec90d
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bik1C0Co744Es0lTJv+3BijxVw1aiemPIwRJ/MZomitEPkJTAPRYu83qOJoVMJEqvEiw1ahh/2euwS0IXEwT3ygx87XF9q2rP5Sf9EZN+OR7+LhPu5bMY9jk+CjXSZMz/8Uo+lhCAH8sDMhrPTfiPbgT43WoJTdjKCqDMq+v3KmPEIFl+iFJDbKkOO6XhCxW+bWf6zIqMKB87f7lMTSiZI14S0v1fgoMr2opY2By8xzk6ZN+vzaOrYiHCgEq9uTKgKaxhcbjD+xAtOpvCsnzp+IeYhkF71it5odtKwTfDk3pb6Oc/a1Fgz9pjacGgXgRH36UvTSxh7r9QDAbHd9COiTVgXnXDMZBW+KbMpUVH9gyObuK5u2WId/GMiocgYT6Cu0ztLpHONKYkRP5h9QRm67Uz+RFxQjN0YDfTh9EUzOgf6MwJAwWoFv97z+Fyntg5wkAWAFxWAclFY+5KNUsUGmPp1JgIliqgITFsPKeqAJapdQDLn3bYehNwyuYrUMtySmZ9L906CJ3ooHJbqAc3ifQ+WdTdJSNs4aaDoBWx2IVFlP4ogNqiEqk5IWtIklloc2+DpOsxSxM0ASn/MtUYbtRf2zv+6qt3KqhLfGqXa6O845L7L0jgBH67BoKX/9n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(7366002)(7416002)(2906002)(7406005)(5660300002)(41300700001)(86362001)(8676002)(4326008)(8936002)(36756003)(316002)(66946007)(66556008)(66476007)(54906003)(110136005)(921008)(38100700002)(6486002)(478600001)(107886003)(83380400001)(6666004)(6506007)(26005)(6512007)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4/oDryAAnEa3DRqqrnr/3ElrzAHQHzbcHQuqMdEHlsXbpQEGYvd4lwM3mfE3?=
 =?us-ascii?Q?6gELYBLSEt8g7JUMWsndj29YAZOgYRfiQDI1uMNtEdqjAmkDrKpj95ke3H+7?=
 =?us-ascii?Q?s/VV2mjukdJOLXVM0AvSyL5B6j5zWvqWj2rQtQQ1UNg1zVLH2uIVYTXMlQVr?=
 =?us-ascii?Q?QBnrB2GR5A6YeOM3LhTG9hfuPb38NQ5FdczS6eCEq3U+Jm5oHTqSul8lwjAH?=
 =?us-ascii?Q?XsanTW02kvQFeG8f7W0wgEa+VZ5uL9Xa238yOFK2xteL8jEjTiYQ0ZenYMWJ?=
 =?us-ascii?Q?+RF//vsmeXr9Av9nxHZnjDZNDJ7OOEF95wbizIs6fjYAtAmXjB5kyxWuD1PB?=
 =?us-ascii?Q?nhP9iUrZJqQx71wzcpSpFBHPpCoQqN5YZVeN6AxWN8fCBXDDDD1SF9DKxQlk?=
 =?us-ascii?Q?tWImHntSTUmLSbhpOyujvILxIJCfrgJRgQp2NnIpGz6nlB9zOlt/LHg27iyy?=
 =?us-ascii?Q?pLo5iIqdMhFqDRPvFt9yr3eaEiJtdKAzd5SCcorZY+JHLps2E8rW7+okMOie?=
 =?us-ascii?Q?R5ac4iNogyGZnyVXcJ63B0fxh9JQWjXTnRpbygan7lbivGZhiDJB3JptkxJx?=
 =?us-ascii?Q?XO+B1CqUvbGWjdOwWhZWghVndMGGpXRdpt46gcUVG/j0iPKKwqGplM95rVHs?=
 =?us-ascii?Q?fMZ8s8RynZDxh+MaErEzd5PslbifsmpUXEZ8UsJJFvZHRpfeezLPMwUdQg7o?=
 =?us-ascii?Q?habaDgqX+m80Fd1YgIFafyWjMRocpclikI0bUX52fzX7S+JmX7sgvrfavnPG?=
 =?us-ascii?Q?Yknov54P8AS1tLFIyKWmOD+/8xMPeM1Ipet832BsYgc5oaWqm/9R8vrGZIDj?=
 =?us-ascii?Q?ERgnmqvRSR92pcXW+83nU7YDFZB7EmCMau3d9wq9bq4G4ABklPl39rLFtd8u?=
 =?us-ascii?Q?Odlk7ph2XDaV/R4W53QkSEXulaYgTQTMnfftkjhWu3kQPgGN6xWzSiCLB/3n?=
 =?us-ascii?Q?YGaS2lQ7Hqkhu6TPJwSZVThfkyTxrPZP88wjfO0956YeGKOv4ug9BAeZ22Hx?=
 =?us-ascii?Q?uj61NdlYf/FGypaVOMZTk5eLOva7DRj5S9Yy88y0KgY7ukvbey3VCaoEoTwO?=
 =?us-ascii?Q?TFRKXoqbkiR3vqXHXlwOpQWdhvibPbyYUIBvzQ97EwYbn0I/oGY6Jb7tem2W?=
 =?us-ascii?Q?TCcJpUf1SHsK+G7YBrk91d2RxF0ZNtFgXIpziQ9QcorfvBcI422mBifV9V0D?=
 =?us-ascii?Q?UHuGxjeuFcbr7hxWuDVFgvfYern67gSdFQZkNeze25EPnX8UZcUJlLNgtKsM?=
 =?us-ascii?Q?XXbK5QTP7nkCqOBQymoZ/YZbJ1EEncistcGOlgX8AoruhtdqEhz2CJKgmT2H?=
 =?us-ascii?Q?S2c5u5h7+Q4lhQ6ZzboXiuCqyMGMosneeirUJ+G2RABnhuJQeTHgk+1XLnXL?=
 =?us-ascii?Q?iSuSzkAPlJzH9+M4sDo5j5IeDtospxrtBqo3ZcOoCsa8/yatn8clSiwCcgZt?=
 =?us-ascii?Q?RI2+QSkfsB+B1OFKuXa2blsj1eQJl+c1QLNtICJO0foxHrdfyxcKGIES4nL3?=
 =?us-ascii?Q?SJYM03Uk0bnWjRBM8cythYIYIQt7PN6GqhEAc6oJ6wzpK5mkRHDBOb3hwk/Z?=
 =?us-ascii?Q?c1J5I64Px2/1t6A25kWf4LZYC0pKc1+uZSKv0qL+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8883fa97-f385-40db-464d-08dbf74ec90d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:03:15.6999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASGCIsyuj/Bow4dRSISfnn+CjYbuuPW25wC3ShehYaUWAiB3+4bfF85nzeUw23JS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7667
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
 Moritz Fischer <mdf@kernel.org>, Moritz Fischer <moritzf@google.com>,
 Thierry Reding <treding@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nothing needs this pointer. Return a normal error code with the usual
IOMMU semantic that ENODEV means 'there is no IOMMU driver'.

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
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
2.43.0

