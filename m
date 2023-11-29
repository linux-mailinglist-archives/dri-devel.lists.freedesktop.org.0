Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14D7FCC00
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB9510E5C6;
	Wed, 29 Nov 2023 00:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB9D10E5BF;
 Wed, 29 Nov 2023 00:48:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epFQZzGvPg20YK61GY/0NW1+KQ+3x4jg5XKP2mEQpMkCxpbyKutrvaeeT0U3nfr975MCPuVDIfxMgBTKl1ZmtTqifkU5drUFNFTljzLATJgakhwyE9HMBH7LWLLsoOcXmIz9OJLh+kQbHbbBSptWPxX8g3b/u2Z/5/k7urxV1Ov2cl2Ie7U6IVGwZRh1AJtR1Oq5ocPHvIjR355/2/skKDOBZm09ltiv0w9X752dIrfkc3jxzenFm0tWerOaNVkliExtqLeZWB66SQrMh2CTK7AYlYzAHsDeGqKsOJvLVUHWhHDn37YMaHQKVKH0V/VGT2UtO82n+7nUYv3Bq2f4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPakWZHYvHors5WFXL2bapVjFF3wl8GrN0XWXN4rPVI=;
 b=aALj6puZVU5xzPw6otZHvyUs9JNxdMLzTcHc3FSaEmUCKi5yHZLKrp6aG8EfKMev9XftiSye5FnXZU2PTkalIZtP6ig6EOsuhFFe/70DwMdJTo6jijYuhDC3AKAWQq4jviN64Uz+wMg96L7L/pgjashsDgV1nKj9dhZ1a56J0C1PcdHSsiRaXo6BJlb2MYGtlsJdS9kimNf2Stb3gaZcQasFztIDbNNodRgrK9lit4w6+pze3Ob1NdXG6y3zP9e60QlmzgEG10LGX4ithFdq4qIr8VoPa3c2SEh/jE/Ep1DbQNqV8ukEDOgtpzaJFtZGxoOE1HskXy06ZcuPmePamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPakWZHYvHors5WFXL2bapVjFF3wl8GrN0XWXN4rPVI=;
 b=Ag0rU854tJH60xOPDaD/u5zg9CfPodJc4i5mTPa5gBLmnYjeJlhMPF+mTTtgrQAG23NbPDE9oAXIqsU40xoQx9HOcGQGsNO7M2l2MJgP/E+LdEiI0tbStUdOrL82AJPtfA717QBwbIe6TlnCvqt6F5L0p0TazbQko9kZ3MOZ3RsCV1mfBVejksBgYtUPIqfr2nqIzUbA6rrIxyEI2gaMkRfycVLg3X6eDPjkUfQ/lrM3p5abYb06S0daViUsWjRumaAPFB0xzSMNS00ZgXqmW2z0f27dRFq4wF7xroYgSg10/Uwb3YKpWH9Fi+L05kyZyzbOPMuzSMiNoCIx/4HZmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 00:48:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 00:48:10 +0000
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
Subject: [PATCH 05/10] iommu: Mark dev_iommu_priv_set() with a lockdep
Date: Tue, 28 Nov 2023 20:48:01 -0400
Message-ID: <5-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: e88e5898-d817-4847-c6f3-08dbf074da91
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rgANoarTBWKnyjqZqIYXEl2mPTVN+nMaMwCAU1TyUvtAj1jv6+jBXL1mJK1VcTwp5KhZsUCdmaBY+Tzo7S64zoTwsOKhRs9qwfiS5LDCTL522D/7IFCgy2SYIqC+2SfCzmXDltCHaikpWh/9EHiMQY7wZ8D4EjIcWraeyxIVPiSjJWLjj1JKjjyAsFoKiZ9imoR35JzlNujG1eZfhc5c2N13iuNyBUiGugNkw9KWKcMEZMx1LTM83FUVWe6NgUFMXEkQzfeEKGs4uBujftG+kki3i+N7LObsANvyZe91c8q0CDt4ebS6bRmNFC29JznHovWHfhdR78RNypvGcx3wWiHgbMsA0/Umz5zi1R/hl50XgNFFdossmRmz47OU48KdW+HXWaKK0xbl7IJ13SJIspNzkLHMNI3+V01XLnkC6T70lPWT4lfrCDpdJOGUVHyhR7KCfchXHGQA4XNVMIaHl5IkGoX4x1nvEvuXdtAAF/3pAKewIvk/8zp8GCCjQFyei9ms966aOqn5oEwpsIR2dTvmX/z2QKJKfWBjOla/Mw0bhPu/AOugxKTR37AFP4yunhb7JOvMdmme9VDJIHh39fgmzH32oAiDvFNZtds/Vc3RD2KSOWldv7XbqiuyI2yS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(7416002)(7366002)(7406005)(41300700001)(4326008)(8936002)(8676002)(2906002)(110136005)(316002)(66556008)(66476007)(54906003)(66946007)(2616005)(921008)(6486002)(478600001)(36756003)(6512007)(6506007)(26005)(6666004)(83380400001)(86362001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OPVIl6+Au+z4F37cddz/VvvSeyIpE8y1PwNznFfquIdqbCyBGLElTq9XlzXp?=
 =?us-ascii?Q?hqQiLa5jZz8as0mKlle0zqRdAtiMZD/7GK571yeTzwLmaPToVECPC6tBbIXI?=
 =?us-ascii?Q?OJPOZYJcIHxjx089BswJUoUgI9/kkRgX1SDCg0ca1b1ElxYajE1WGQjYvt0U?=
 =?us-ascii?Q?kRQRS/5eJZvhE66Wi4akv+DryqYPp9vWghx/YbuAC1G5DJSWJmdh93lFqfxR?=
 =?us-ascii?Q?jMH+xU4NQ70cm+WytpS5+3M5+Rh1KQZOwQ3tCbtlAA0PrdPTBDYX+8sWzPGU?=
 =?us-ascii?Q?nygIvA2UK3Ny1fRjgaCyJ2lGSZ2SvxHUDMZEKnMX33zXIA90y/GcVJjFt76X?=
 =?us-ascii?Q?VkjZqRBZCL53b0z3xGu3CFtqA1v1s4r7hoQJXPS6+39c2Hj4hMdAD1j7vj7a?=
 =?us-ascii?Q?MTBuYfHBjBiZpN1j0V3XUTaQthyH35n167qFkHjShYFO+vyz/K1g4KclAEUK?=
 =?us-ascii?Q?OCVJQGsbkLGI1NhXvDXRgQg7buM9c7bsK/5K2qT1jdOE7nKnavuAuOTJJAw+?=
 =?us-ascii?Q?QAJ22nifjE2McOKRdajBQA16GBn57eEfEKz9plV4TloPSZFhc8f1ZeTHdae0?=
 =?us-ascii?Q?fU2IAMPY9sbWV8MBb6HdFj/cBBYWNzIrBmPOMByD8fO0fyrj7kvR1N25oxp9?=
 =?us-ascii?Q?+/id6MDYvgEkdOXOCWIBUFdi1iL2i2BtMHidNC8H7h+H7QPSlV9APNlvqRvx?=
 =?us-ascii?Q?PyjPZaKVPIFfpuumj2RA4FBpc6ON5fllQsV0pBW/2lF+CIGDn4Zi9nHOr/zw?=
 =?us-ascii?Q?qSUB7xw+yT2q2tioBruXQGkPGhs95g0OkPgxsIom0C9g0PIUP9Xa2TcQrNIL?=
 =?us-ascii?Q?ZRFODl0d0KyoBJ3UgB5bKWhk3ZYnvYUMw+UX39AmKi6BXYipq/ltVsliZ8+J?=
 =?us-ascii?Q?fkX0UFXRgWQTYPZUUwFY9jW6wxS1+hbg0lIposKnhBsr8g+HYvJayUxpRP73?=
 =?us-ascii?Q?7hxIApajsx/5FbEpcd7dFpOm96TwNvjqVTlz2ijwO1B3jZa98zMmVLAwPHOc?=
 =?us-ascii?Q?D9j8VGxpuwXobuGSdContI0WsSD0ieK1C/pBDU/a+q/wMYN2ZQhqNZXC3ZGA?=
 =?us-ascii?Q?FEKfVOOuOkZPO7Tq+nGD/V9OSrv29j6Dlmhx/2RhcHmmvLNIn+2O7Ea+T3Kq?=
 =?us-ascii?Q?hmjS52EZkVPi5XJA4ogriXcke49GD0/Qf2l2yobXtX1D5xSfKdESO7ZK/Mln?=
 =?us-ascii?Q?g/ER1BT2XYTfZDmlC2FYx4SmJeYwioONjUbTK7lE7zbhxf7RAA4vgKC3++Ka?=
 =?us-ascii?Q?vVeLh9y4AjP/EjH3Bcy0QONJrMqGxYsnUzlrMTpuCSXhlDe2MoarJr0QHzft?=
 =?us-ascii?Q?ZTSnLEIDLu36TShF8CGp+3yoUp0h7DhauVoPECAWDX35FrHJTT75EHWej/Yu?=
 =?us-ascii?Q?s+WxfhiIcQZYKe1b032ivpPp5HDiX0bqWKwMYgUVeyUlHJN6zXiyUlWV5zYg?=
 =?us-ascii?Q?M06Pvu0NghhAVediQUr6UZSbhri7GJn8/i7GhiU9yssG1TAuQlyjNp764fcr?=
 =?us-ascii?Q?TLWeyXrNTSlpK+H8uV5Aqfi6+MbNcp8bb/GV4SYZ178WTtJuxf7AeoSrSldE?=
 =?us-ascii?Q?sf3D2L8Qr1Y1VRBQQz2YGF6jnYrMjGq1aD0XtrjT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e88e5898-d817-4847-c6f3-08dbf074da91
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:07.8059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCLxYnh0Nz04x6MvAHftLs2Aq4/fyuwGZWn/kVmvb8d2fHv5lLYPqJ8YE50aJedN
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

A perfect driver would only call dev_iommu_priv_set() from its probe
callback. We've made it functionally correct to call it from the of_xlate
by adding a lock around that call.

lockdep assert that iommu_probe_device_lock is held to discourage misuse.

Exclude PPC kernels with CONFIG_FSL_PAMU turned on because FSL_PAMU uses a
global static for its priv and abuses priv for its domain.

Remove the pointless stores of NULL, all these are on paths where the core
code will free dev->iommu after the op returns.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Tested-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/amd/iommu.c                   | 2 --
 drivers/iommu/apple-dart.c                  | 1 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 -
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 1 -
 drivers/iommu/intel/iommu.c                 | 2 --
 drivers/iommu/iommu.c                       | 9 +++++++++
 drivers/iommu/omap-iommu.c                  | 1 -
 include/linux/iommu.h                       | 5 +----
 8 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 9f706436082833..be58644a6fa518 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -551,8 +551,6 @@ static void amd_iommu_uninit_device(struct device *dev)
 	if (dev_data->domain)
 		detach_device(dev);
 
-	dev_iommu_priv_set(dev, NULL);
-
 	/*
 	 * We keep dev_data around for unplugged devices and reuse it when the
 	 * device is re-plugged - not doing so would introduce a ton of races.
diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 7438e9c82ba982..25135440b5dd54 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -743,7 +743,6 @@ static void apple_dart_release_device(struct device *dev)
 {
 	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
 
-	dev_iommu_priv_set(dev, NULL);
 	kfree(cfg);
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index fc4317c25b6d53..1855d3892b15f8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2695,7 +2695,6 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 
 err_free_master:
 	kfree(master);
-	dev_iommu_priv_set(dev, NULL);
 	return ERR_PTR(ret);
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4d09c004789274..adc7937fd8a3a3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1420,7 +1420,6 @@ static void arm_smmu_release_device(struct device *dev)
 
 	arm_smmu_rpm_put(cfg->smmu);
 
-	dev_iommu_priv_set(dev, NULL);
 	kfree(cfg);
 }
 
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 897159dba47de4..511589341074f0 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4461,7 +4461,6 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 		ret = intel_pasid_alloc_table(dev);
 		if (ret) {
 			dev_err(dev, "PASID table allocation failed\n");
-			dev_iommu_priv_set(dev, NULL);
 			kfree(info);
 			return ERR_PTR(ret);
 		}
@@ -4479,7 +4478,6 @@ static void intel_iommu_release_device(struct device *dev)
 	dmar_remove_one_dev_info(dev);
 	intel_pasid_free_table(dev);
 	intel_iommu_debugfs_remove_dev(info);
-	dev_iommu_priv_set(dev, NULL);
 	kfree(info);
 	set_dma_ops(dev, NULL);
 }
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4323b6276e977f..08f29a1dfcd5f8 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -387,6 +387,15 @@ static u32 dev_iommu_get_max_pasids(struct device *dev)
 	return min_t(u32, max_pasids, dev->iommu->iommu_dev->max_pasids);
 }
 
+void dev_iommu_priv_set(struct device *dev, void *priv)
+{
+	/* FSL_PAMU does something weird */
+	if (!IS_ENABLED(CONFIG_FSL_PAMU))
+		lockdep_assert_held(&iommu_probe_device_lock);
+	dev->iommu->priv = priv;
+}
+EXPORT_SYMBOL_GPL(dev_iommu_priv_set);
+
 /*
  * Init the dev->iommu and dev->iommu_group in the struct device and get the
  * driver probed
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index c66b070841dd41..c9528065a59afa 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1719,7 +1719,6 @@ static void omap_iommu_release_device(struct device *dev)
 	if (!dev->of_node || !arch_data)
 		return;
 
-	dev_iommu_priv_set(dev, NULL);
 	kfree(arch_data);
 
 }
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index c7394b39599c84..c24933a1d0d643 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -840,10 +840,7 @@ static inline void *dev_iommu_priv_get(struct device *dev)
 		return NULL;
 }
 
-static inline void dev_iommu_priv_set(struct device *dev, void *priv)
-{
-	dev->iommu->priv = priv;
-}
+void dev_iommu_priv_set(struct device *dev, void *priv);
 
 extern struct mutex iommu_probe_device_lock;
 int iommu_probe_device(struct device *dev);
-- 
2.42.0

