Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F407FCBFC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3A010E5D5;
	Wed, 29 Nov 2023 00:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D7510E5C4;
 Wed, 29 Nov 2023 00:48:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsytXaBqcEx16zVcZnHPS4Zhvb3AayZWzyi2+09E6frV+OcPxU9xAkBgHeKWlPBNlHSKF+6qeeXwGXajaxh5dF5HdPRIArraLFXKBnKHi2kAIYQl4hVla+FnNUTyyFPMfmnvLyhgFtMI9pwez1voLritO8OlbucheIMwzl4sXzs0t8ENrQt8qz9Msk4dcECOBtNvi4etwJFSSYxdm1zK4BHCyv0l6EyK2uW535JXxSA9lM2s7g+bFS+wwkse92aHhzyeCvJ/7S8uEs28friDpZ5WuZRNOanbSMgyQ04Nju7CLiByTYVOXPuF/aTJuJyodNHatChD+MybJwnEseSz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH8tDjGmvUkY/WqUCt3YsgaaKAlismXB1uYZuT5uIZQ=;
 b=aEaQLIYQ2xK9z6jAOTblk8bi1M8gOnGaU/GHXAkOSxJsXPfSGLcdvItsfwFt8etKjfH7MN/bKs8dz9+UWW0/sdVqCa++xL4ljdyMBWPwsV6840mjcwY7XzV/Jp3zAT8cigaH4Hh5eGINIc+IPqUbGQgR43cCFWZcub6lkVb/n6+3RA307EasrmBQgmili56p+QMbT9lqLasVa5iM1bfSbxpJPN0IAgjXTLreELTypiKoZBF4/4q9zBFxr15eBHvjvCn4zeYuDWtahW8dg1r9IgBWudAP8Fyt9I869mXeDdS/mheEXqZLCUuIhcwxl+8Tp3sK4yw/6dJFTMtEyxVJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH8tDjGmvUkY/WqUCt3YsgaaKAlismXB1uYZuT5uIZQ=;
 b=F31DiXX8J2qqzbKKHFZHTZErloXdqCL6uue8F7G5+yT8jtRmOnJifMosEmXqSaTXG+cpFRrZoFYsAYmFbFndE3IaaYHYQZNtyAzle/zfgkur0Uqpp71TbKW23IaDr7k5tTLW4CZj+Y0NTO7rBXJa0HeP2LijDD0RgQocjGQ7iCYs0sWXIsFpLosNohSDMYu5PwpOQbeuwFgSnw/L/68P8UXBUWbcHueJj0T8JbQm1+pbZATg+xUQS4dzwLqUcwwIiV+MgTcHUn1Z/IPt3S0oUolsuomALC5UNMbS6o5d4sNDMZfi3+5ERkhm4rrFRJTygpJ3ZoJMQ/RnBQrXSW39eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 00:48:12 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 00:48:12 +0000
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
Subject: [PATCH 10/10] ACPI: IORT: Allow COMPILE_TEST of IORT
Date: Tue, 28 Nov 2023 20:48:06 -0400
Message-ID: <10-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::27) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a43a15-015e-42b5-e00b-08dbf074db78
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sfyePDuXbQpivM4GgUNxLSUDKfV946alWGd0hI2n+rpIrNB+3/j/3zBB93NCwPRqllydZ6s3EPhIOQAvu0il6gt747jv9zfRwNe2F6K+sLefTwlKl8eK0qDxUSi//Sx8NGdpqCdvrmCGKsFfZ9efYgDRrgyoQt+oxZKyJonSmMRpVnEZNqMmXruMUwpCd6VldvUMMTEe6q7xzxfaUW3RckcyqZdwCfHHI0PJu1uWfj+HCeXGTqrrUdINYSwBOHN65U+6QKlBpjzfLMLq77srcAL1yk3uZQvWftAiSf/vv97MCAmCOYxGl+caSwdf3DIxj0ErSwETifhy8vxBCS+E69fnqY/WIDJwcxpER4tszS3ayGTovyO6WGAwSSmwkHyGY4Qa0JjupUxt4uu5s6xsCkT7vY17EGzO2pYF5Evj//VPyEJFmByrpwREJLe3MPR8sd7wc1A80FhfKj5MVncE8XH/3u0U9DWFNunYb/dZAurN09u3c2NkunRKYARRqGvuEE0JaeZngIcix5hD9VRq+ffOx0gi/55JhJuJzBOVw5wDkAODAgy6tOc0RqBuADuG+6Dj7UAUqrXGN7IgvI3K1u8uVB96D1KrD3AUbUajURs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(7416002)(7366002)(7406005)(41300700001)(4326008)(8936002)(8676002)(2906002)(110136005)(316002)(66556008)(66476007)(54906003)(66946007)(2616005)(921008)(6486002)(478600001)(36756003)(6512007)(6506007)(26005)(6666004)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UNYheQyrasSXpcpCfTUQaMtUs0mW6dFUk1bWLYTCnkPpP1S0bWCCjqumkRKd?=
 =?us-ascii?Q?iC9+AHjWdZzDQqy+3MdwLX1LbDScSZmNXnFjltT2pXbrXzFEUz8FB8kcBIqc?=
 =?us-ascii?Q?TgbL9HQoW321eihXHodmuwOVY1gNvKFn27NBBKsYVeWCxprj8LHmN/NKKvfV?=
 =?us-ascii?Q?8OA53XejEyvQqQBPt99HAn61ZhT2Ajv7Uie+kJ32eMKGwn/5icwu2rdyxlOG?=
 =?us-ascii?Q?Z53TCr85bJcAPLv0kNbxBnacotlcfTPEPeXMzGUsoE5t/Jhtxf8PumC2UH1a?=
 =?us-ascii?Q?YAZ24tgv/MPvTxxgPb3hBbQ35Iz1iYLSk9TbIljShLqvZmwZy+JnEAAlXE68?=
 =?us-ascii?Q?t1w66msf4GkGBxaAhPdy/K2GNhaOmwZgeO9/NUrSF1wk3tx89Y41XvzAefaa?=
 =?us-ascii?Q?1iUGKV0kopWp9iTgZqFOYEZr27XwpzpNOy9xBtt8uq+2T3cV81FHNbTtwMEn?=
 =?us-ascii?Q?93odYwqOUyUUvOe39IVnAcleYcZz75cZZ+vN6gJWFaZ+RHbQ5tzGhrunEVXT?=
 =?us-ascii?Q?zRXYGXO0TYkFCfYpnnc5QB7bSH8zZ3PKeafPIxIaDWMMQv0DMLY+PL9OMwpm?=
 =?us-ascii?Q?RJWr0Jg18rry/TgTyUOAQhik+iGqA2IcicKNXojGrGgjfZLzrr+f+D6VV1o9?=
 =?us-ascii?Q?JvZE75QLj1PTXtwTSqOGhePFl7HXcSODJfULwweKq5fbkHQ6q+hntYEx/4Fc?=
 =?us-ascii?Q?zb0MiJ9w1zL9bMsm/QUtbh7Jv20N7S+5sp1p4n05848HDISWHjS+9iL2s3mY?=
 =?us-ascii?Q?lCQiDX70k2nN8USM1TKsOHiO3jGpLSXwLHKYBSJF8mz6h07McxuWndpRWhId?=
 =?us-ascii?Q?vUm5E5ySn1DnJxQxtM+s30JRXCpBPVzv/FLNGuUM0WJTC7oTAGk+hTbwzMKS?=
 =?us-ascii?Q?dJFM9QBBerNjYCa3T7Q1RAdWLargJAlGrNHUQjkYWkr8xV4Qt8c/42cL9k4Y?=
 =?us-ascii?Q?9DxVo/ao5etyYU4VkFT+f6u94cmmF1hK3ISdCL89zLoaH0QmZSrfzMsYF2sG?=
 =?us-ascii?Q?UcFAom7F+hEFd8iJAgGnh9pUjI+wua2EyBfbwP7jliGi48T6YFFqJiRntTNW?=
 =?us-ascii?Q?E8QDLJP5M06AevL93EkCZa7IUWlgQz/es+y5dpZFylpeQ4LculrKC8pphqh1?=
 =?us-ascii?Q?qnJOrgOSa0gDdbAIVr64jhofH/WC5+tvKoEOGr4JBj4JinnZACzdlhw1LiiJ?=
 =?us-ascii?Q?yNegq1Ti9KTKIRKeGgYxkmPyV/R40SRvVCXzUJQzOu2lNUjBlxLICqa5d4A1?=
 =?us-ascii?Q?iDCOqXxqx5zrUCF+4osncWumF0P9VXkaXV2koAeToihb6kFOTERI2ZMJJERb?=
 =?us-ascii?Q?A/oF0KOLZuno2bY/p+83/VeZ8YAMiJs9ZboiQ3TYY+UrOYuNWordO1zzjIIl?=
 =?us-ascii?Q?2eyWVBVZMphne4ZXmCiGa6bvsddyz98GdODAIWVJZTNyRxkahU0o/Q5wM1pB?=
 =?us-ascii?Q?3c+2/ZDDQG5LFpYrSgOeiRL+kRrFiyha970ppgNxtpqBXx9Om762Zj78V9Gt?=
 =?us-ascii?Q?fqH5E/+xs0jicG4KXoYL4c0ydiV6l7kEqmz1EV8WUNWCvcVtP7yk4D+e68Vx?=
 =?us-ascii?Q?dbaMzRUnf1NpxR5sCW/ExxZ2KOkfWs9gUS4QWlV+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a43a15-015e-42b5-e00b-08dbf074db78
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:09.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aglFzULK+XmqsoZKcrZ9ubmCg+LHORgBHdMuQg4VAhNMC/DOMeDwcNrzcZcKmdom
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

The arm-smmu driver can COMPILE_TEST on x86, so expand this to also
enable the IORT code so it can be COMPILE_TEST'd too.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/acpi/Kconfig        | 2 --
 drivers/acpi/Makefile       | 2 +-
 drivers/acpi/arm64/Kconfig  | 1 +
 drivers/acpi/arm64/Makefile | 2 +-
 drivers/iommu/Kconfig       | 1 +
 5 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index f819e760ff195a..3b7f77b227d13a 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -541,9 +541,7 @@ config ACPI_PFRUT
 	  To compile the drivers as modules, choose M here:
 	  the modules will be called pfr_update and pfr_telemetry.
 
-if ARM64
 source "drivers/acpi/arm64/Kconfig"
-endif
 
 config ACPI_PPTT
 	bool
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index eaa09bf52f1760..4e77ae37b80726 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -127,7 +127,7 @@ obj-y				+= pmic/
 video-objs			+= acpi_video.o video_detect.o
 obj-y				+= dptf/
 
-obj-$(CONFIG_ARM64)		+= arm64/
+obj-y				+= arm64/
 
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
 
diff --git a/drivers/acpi/arm64/Kconfig b/drivers/acpi/arm64/Kconfig
index b3ed6212244c1e..537d49d8ace69e 100644
--- a/drivers/acpi/arm64/Kconfig
+++ b/drivers/acpi/arm64/Kconfig
@@ -11,6 +11,7 @@ config ACPI_GTDT
 
 config ACPI_AGDI
 	bool "Arm Generic Diagnostic Dump and Reset Device Interface"
+	depends on ARM64
 	depends on ARM_SDE_INTERFACE
 	help
 	  Arm Generic Diagnostic Dump and Reset Device Interface (AGDI) is
diff --git a/drivers/acpi/arm64/Makefile b/drivers/acpi/arm64/Makefile
index 143debc1ba4a9d..71d0e635599390 100644
--- a/drivers/acpi/arm64/Makefile
+++ b/drivers/acpi/arm64/Makefile
@@ -4,4 +4,4 @@ obj-$(CONFIG_ACPI_IORT) 	+= iort.o
 obj-$(CONFIG_ACPI_GTDT) 	+= gtdt.o
 obj-$(CONFIG_ACPI_APMT) 	+= apmt.o
 obj-$(CONFIG_ARM_AMBA)		+= amba.o
-obj-y				+= dma.o init.o
+obj-$(CONFIG_ARM64)		+= dma.o init.o
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 7673bb82945b6c..309378e76a9bc9 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -318,6 +318,7 @@ config ARM_SMMU
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU if ARM
+	select ACPI_IORT if ACPI
 	help
 	  Support for implementations of the ARM System MMU architecture
 	  versions 1 and 2.
-- 
2.42.0

