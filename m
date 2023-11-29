Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F47FCC05
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3310F10E5D7;
	Wed, 29 Nov 2023 00:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252C010E5CB;
 Wed, 29 Nov 2023 00:48:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUXspeAmwG+GJkiEsJtR8ik04zF9P4r3WhBiaRkVhkayJNIm0OBUIml4lXq9tYi5kVn9aU94N7/AEyB9U454Vqs0/WvLW0W0gIC5VOnHXmA6v9me5Vyib0We7rHsG4GdSb20sAJ0pjFAQyfsEXsizOBl69H4gRFF8tWP2xiuDppfJ/9XR3TmeEsx868qJha6p6Gfi/tz5Di9eGRFd5NsxUPUXadBfRCFnWU8NgswlV7wARHAE7VmLawjiIDNKWJFjTO5hB4e0Yr8wNeZCZ4gMPhuM4Gcosi/P9Zr+aEFtR4MBtgv1EJPVpFbTo7SP9B0nmmH0m3qYa6Y5IxmxkNrCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCeta3mOG07bQ10PQqHSM5z55NsNDTAU0bAZxyDPqNQ=;
 b=QAqce+h+L5Qio/2VfIPj3BgcDJ8/oPCDlWbFeGoTBaLRl/LAnADCgzdE+T0KQW16mrKypilHyMpEMwUAbnQQEr/abrbn1/ZoSorBryYcUp/K9CbvB5gX6qtWGvR05GSc29VNMd23SVCc4teSd9eY7B38s0+YC5mhdYTEnaKZWG1klU7oaeOHH301bE9lPl5hAJsrUp/Pf6+xggI3tj1SJZCDbyVp/N4KbTj9Mc9ELbc7TUM+VWJOG9Cutb2ykI7YGlTL6Tmo4mUwr4HrWAhUsaB5Z9uxqcxEdzNR5UCnZCifhBfNu23lChks21QZxgT+RJbV+3B5CPFNELg8fIvQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCeta3mOG07bQ10PQqHSM5z55NsNDTAU0bAZxyDPqNQ=;
 b=GQjkS6R29YN1fRDpTZvZa01JcHOkFKU1t6i9CAa4PiIPvMcUCTOvk4M7dhnPqOJ9VbSzS4erRA3shKDiMmVkSxIknnF3z/KpY5RyvwmZJ4+cQOfKeq3sbw2Gfz8/BnpMJN/BWLvJV9ULu8bhhwtseTyYlHBCmmQVTa3dkZK3OwC3/sHHS14ExNaxN6yK+l1gh67ZZniHJNZFxRx8nEjiJdfSDaDPUcK+v6PSicumrGrUZxOx0DXOVdZzK36vJWG274jVKnV9AKw5cKsqnEDnlmffrgoiFbQQR7rO2o/CevZfAK7GcdxQi8rnxlYNQMkZ8Wn94pmlGEN3flLPvfCb9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 00:48:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 00:48:14 +0000
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
Subject: [PATCH 03/10] iommu/of: Use -ENODEV consistently in
 of_iommu_configure()
Date: Tue, 28 Nov 2023 20:47:59 -0400
Message-ID: <3-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:805:de::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b77a9e-c96e-4697-a320-08dbf074dbac
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2K4XLcrDu1cIZH421yJ6fSIiXhL8IYHMHSDmOD6Ou+vzPqeHu3ams1b2+aB6CoVXDxMYikC1fAsGCwvqWBdkgy958sSXSwH7yaWpsmLm4i7eeQvuiG3D5mZgcXUnvlAv91StzWSXK+k3OL6OwxOaw7OQuk6FgQAxcYjkNIbyWaLg8vhVS3hu7h/XfZl52iFR857de0MGDAUS4SgBvYX8h803gL6NyXv+xpH1ce6PjMWTZt4J4Uj4itlurfkV+EZhy+26wQHCCqOx7nKMjVEk6y585sPZ8PJsgDrpPDQwws3MwWyzWyO8Ewo6fqtcjbJG4s1g6gARxOThDzgcZEx8LZ0nVNIbmhtPOHm/27RjNGZs6t7XuKwmmrzROAX+b+W+6eWZt7fCGhSfHI2rKfuru0EXfAuuGkn0DX3CoCgplhgDfOlNfcq0oUKyaSwg3EUpLX9EoP0T9+q2E/GSrSFxOOxB93BuKqmne7cvQypHhjoMN6hJa5stbPSgPUZfSRqUsHlPxXmLcVACeE2gitvrPs2MO+aRPVsL+1DUGXMudLYrqIyM7cBcpU6wP4tAVHnJpu5h7B4BYuJ9PSBMFX9mDU4Yw3Y8R4D757lrYMy0aseFGY0d0UFIPGDvA+0hMgNi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(7416002)(7366002)(7406005)(41300700001)(4326008)(8936002)(8676002)(2906002)(110136005)(316002)(66556008)(66476007)(54906003)(66946007)(2616005)(921008)(6486002)(478600001)(36756003)(6512007)(6506007)(26005)(6666004)(83380400001)(86362001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Ytcw9UcmnZEbrlIm4iU4QqjBGc6/n1yRMw9/PXlSOd4cQb6/UODaE7nFetB?=
 =?us-ascii?Q?L6Dl74KQ5gpmj15zLFfHU4ZpTuhe6qbFpFXKb2VmH67u114Pkbl5eLf48JNx?=
 =?us-ascii?Q?pvXmclXeSA0HLswBbY6pOlhOt68R9wf8BRB5w8EEczIdAAvYBszppluyxFG0?=
 =?us-ascii?Q?aK/XkxcgxjH+7Qyu4VxO+Z987glV88w0pG0vBX3wTV9+suUGMOVE3PABdt3y?=
 =?us-ascii?Q?8wD/1hin+2IsR0H8oSBZp8J9kVlVELzDEzxUKdJaYtM5AAo2HpHtopCXse/x?=
 =?us-ascii?Q?uVEJegaKde6UzE7WIVgQOjY9nCVdA4PptNtGqk3Us7jsvhetauublsqQ8++w?=
 =?us-ascii?Q?4iBCg4grUIxWLaOAjDyTI221rRkXhWVsl5BZ7XGiZhSnl+ux4fKCwNtDtsCF?=
 =?us-ascii?Q?TTGI4H6voKvsmQbycgusQvxdMIdfwE70yOH5aETLQT/cKOKrLxMtG7I4l9jl?=
 =?us-ascii?Q?K8g8Zc8fsOyYYSyD5qUUR4+DcE4t+JDdieuLzylg0qL4NWXife5mmBfYadv5?=
 =?us-ascii?Q?ZRXxK2dyVGqLvs7B3R26yNXykG+q0Mg/hOFdBvY0kmI9zub4dTcCkQJXCqWu?=
 =?us-ascii?Q?54nuSZdLSuyj8SNBF8TmlrEM4JXfjvjh7PbwxL/Ydctu5LUkG66ZQvfkfFG+?=
 =?us-ascii?Q?yd8jEa8HLOpPQe/F9MjR07u4azzOBdfCJoQIugiNWTphF1beeGFCPbv7iG99?=
 =?us-ascii?Q?MAEvG4XoG0OamlTnW+nDtqac0Y8inIN2IEgc8SdMIm22dLqIMzTZOlYOVMKv?=
 =?us-ascii?Q?CtSu6NYsCBIlpxtqnKORjE8q6lS5Ufp3Cxt3ayDu+BXb4jx+QHyel3kW96+y?=
 =?us-ascii?Q?iVTJep3/uQS6rw7XcCGpB70OZPouJd//OiTVPhUHA390p2YkUwx6w8+yIAeK?=
 =?us-ascii?Q?LIkZp5S2/B9GHLyQfk4KyL53Zd/5v7uBU5/Mia1+QqJHjueb6BeAQ1rIekht?=
 =?us-ascii?Q?r97MfADEub04Ut6cobxJn3qv8cP23lKDn918F7i/TOLJGjtqi+6c+mNc1P8G?=
 =?us-ascii?Q?T0GmGClaB3W000pHlG1vLVPykIe/law3WiDkyEIkRiC1wIWlnU+ulDXWSHsi?=
 =?us-ascii?Q?TerI0gYgfnYofbAeRCvkRQwz6RXICOG0C4Iw44MOGx37iSSQOmbjAJf5qJtE?=
 =?us-ascii?Q?dYtBq6vI1odqXxvPwsQLhjFh/pmflgwo7beydKRZV1ml1f61NaL6EzdgQ7ki?=
 =?us-ascii?Q?m5J27MtTrK/TTBT4vuJ+lYn/XjI4nQB/NkRbtMxZHFWFtNWxwNR02/UcFN20?=
 =?us-ascii?Q?DOH95NkZS1wtmiv/fg1syRK8y24XBk4kzi/mxpbnUynlfCw/ZGhnnglDoUwt?=
 =?us-ascii?Q?c0DRwW308Er6korkdMbqknXmLOZikQB+yRop32E9Qk1+k5CLq+c1eeZDi4uA?=
 =?us-ascii?Q?QRm2uYslN4UWJ/JB/aPsIaDrzEuRZBYKufUcy2DrkJpF8KXnnucI9LmgM0IP?=
 =?us-ascii?Q?lfNM9VDBRnZ5xbi7e1Y265c4jN2WdcMT8rOr1W/bpVV7vNSpOKRCbh75uyug?=
 =?us-ascii?Q?vCghwNV2jUIOxoWEchuUo7XBzfGgz2yY2/YBGVbM60E7TLyuEMJXBtXik8JO?=
 =?us-ascii?Q?mmxU0DHy3OXtw8BfpAfmIr9AiJIzQmHrI/bv2yIX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b77a9e-c96e-4697-a320-08dbf074dbac
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:09.6808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnid2sxxBR52CEopIx4pyN38qx5HD22qIJhJWeAfEBE+iI/VzfaFjjKe3u3ej7nK
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

Instead of returning 1 and trying to handle positive error codes just
stick to the convention of returning -ENODEV. Remove references to ops
from of_iommu_configure(), a NULL ops will already generate an error code.

There is no reason to check dev->bus, if err=0 at this point then the
called configure functions thought there was an iommu and we should try to
probe it. Remove it.

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Tested-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/of_iommu.c | 49 ++++++++++++----------------------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index c6510d7e7b241b..164317bfb8a81f 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -17,8 +17,6 @@
 #include <linux/slab.h>
 #include <linux/fsl/mc.h>
 
-#define NO_IOMMU	1
-
 static int of_iommu_xlate(struct device *dev,
 			  struct of_phandle_args *iommu_spec)
 {
@@ -29,7 +27,7 @@ static int of_iommu_xlate(struct device *dev,
 	ops = iommu_ops_from_fwnode(fwnode);
 	if ((ops && !ops->of_xlate) ||
 	    !of_device_is_available(iommu_spec->np))
-		return NO_IOMMU;
+		return -ENODEV;
 
 	ret = iommu_fwspec_init(dev, &iommu_spec->np->fwnode, ops);
 	if (ret)
@@ -61,7 +59,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 			 "iommu-map-mask", &iommu_spec.np,
 			 iommu_spec.args);
 	if (err)
-		return err == -ENODEV ? NO_IOMMU : err;
+		return err;
 
 	err = of_iommu_xlate(dev, &iommu_spec);
 	of_node_put(iommu_spec.np);
@@ -72,7 +70,7 @@ static int of_iommu_configure_dev(struct device_node *master_np,
 				  struct device *dev)
 {
 	struct of_phandle_args iommu_spec;
-	int err = NO_IOMMU, idx = 0;
+	int err = -ENODEV, idx = 0;
 
 	while (!of_parse_phandle_with_args(master_np, "iommus",
 					   "#iommu-cells",
@@ -117,9 +115,8 @@ static int of_iommu_configure_device(struct device_node *master_np,
 int of_iommu_configure(struct device *dev, struct device_node *master_np,
 		       const u32 *id)
 {
-	const struct iommu_ops *ops = NULL;
 	struct iommu_fwspec *fwspec;
-	int err = NO_IOMMU;
+	int err;
 
 	if (!master_np)
 		return -ENODEV;
@@ -153,37 +150,21 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
 	} else {
 		err = of_iommu_configure_device(master_np, dev, id);
 	}
-
-	/*
-	 * Two success conditions can be represented by non-negative err here:
-	 * >0 : there is no IOMMU, or one was unavailable for non-fatal reasons
-	 *  0 : we found an IOMMU, and dev->fwspec is initialised appropriately
-	 * <0 : any actual error
-	 */
-	if (!err) {
-		/* The fwspec pointer changed, read it again */
-		fwspec = dev_iommu_fwspec_get(dev);
-		ops    = fwspec->ops;
-	}
 	mutex_unlock(&iommu_probe_device_lock);
 
-	/*
-	 * If we have reason to believe the IOMMU driver missed the initial
-	 * probe for dev, replay it to get things in order.
-	 */
-	if (!err && dev->bus)
-		err = iommu_probe_device(dev);
-
-	/* Ignore all other errors apart from EPROBE_DEFER */
-	if (err < 0) {
-		if (err == -EPROBE_DEFER)
-			return err;
-		dev_dbg(dev, "Adding to IOMMU failed: %pe\n", ERR_PTR(err));
+	if (err == -ENODEV || err == -EPROBE_DEFER)
 		return err;
-	}
-	if (!ops)
-		return -ENODEV;
+	if (err)
+		goto err_log;
+
+	err = iommu_probe_device(dev);
+	if (err)
+		goto err_log;
 	return 0;
+
+err_log:
+	dev_dbg(dev, "Adding to IOMMU failed: %pe\n", ERR_PTR(err));
+	return err;
 }
 
 static enum iommu_resv_type __maybe_unused
-- 
2.42.0

