Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C22808F71
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6247310E953;
	Thu,  7 Dec 2023 18:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4D610E94C;
 Thu,  7 Dec 2023 18:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U91GqJ+XlRLAUqZSsoqfM6zO7h5WNmslDySXM2uxkbf6Y0Vuj3Uv4GhzN2OcPd6sSHJ4WR3jxYpl2AApHsmpQ9S3kDehB4okHXXEJcDQfSiKtC7gZJ26yZwO1VkPPLvkP7GPZyA62rgYSM4KH8Y+7W/dFnTx+7ovo/Lu0wiPkjb7kAAoBdj5KilrEMMLYYe/l/FX6aBCNsN3i1wZH1rbnUf64uWX2nHkyYml3JaHse3+z8w9yV5sCqDdkH3OlIqCcBkJG3T27XahVf0/8FeJWJjNe769QYNEEr4lTazed3AylqKPgsccKRWzfOQQvybLjazu4TCY25DYxz28Jj+Glg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPnu0s6EHoasXHG3G2uyD2OsRploKXFt6sJ2tSaWqZA=;
 b=L7xQOHisxEkKCjhjNuvnaRCAwt9PEeM8pxfeNHwhsXOZo5ZnXkh3GzqWeh/SCy9X4aus5N+J9acEcTaSKHu03nDLNvZTmG4qPBKlxODbTu9dCYCHxYAAGvx6Dyojp/KpjXpNkdRiognLMT6/V4WdEo/Xu4Vs7Nkk7MlYkH4Zd/5SfZkgBre9HRgr38n6fD2j0dDakkHbXIK3TUIrZNZihlOvEzMsLEJTdeaBH7Zd6pQNTxTmnI+b3UJkPJY6KAW5AyCme+gHaiNoJgn4QW+W4qbL6NBxgL4L/SoDZIveNYfh/iAVS4stPmmdwWzLPTJDd8GD3wyTSLlA4wTsxMtpew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPnu0s6EHoasXHG3G2uyD2OsRploKXFt6sJ2tSaWqZA=;
 b=K3vZusnOS7OqG+ACHUlMC1JE1HAdks7KFASHFiA6uM2XN1w/3ebBn300P/i3SBDXXmYbl2FRwIFSgrQTUlHK3eLaRU58vpgxANrfNu8Au8kmvlcQRYhNKJWGu0f9xKY/8Al76SCkeUS43uhG2ThPxgNwfnvGqPVAroTWJJdj4h0Shsdy6vh0S0tm9S1uw5xFJoEjrwDXZTRUT5MuCXiizAS1Ok3RlSZqoJk/tU+jc32wRZnKGhk0fUm+cdbJYgqp/kNdeTivruaiWJOPhQkzkeN8Gub+7819hK30Gr/z/QTdyVPgBEqQDTgNPdRs/mGoQkiP34Ec5Ryzr1mIkAwZ7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 18:03:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.038; Thu, 7 Dec 2023
 18:03:18 +0000
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
Subject: [PATCH v2 5/7] iommu: Mark dev_iommu_priv_set() with a lockdep
Date: Thu,  7 Dec 2023 14:03:12 -0400
Message-ID: <5-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E12.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: cd431882-78d4-495b-0431-08dbf74ec9ad
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7n1SvipzavvDG5XswVnXJY3ekiDKcx6quxHJz1IaAVfkgXglEmltvBzf1DDtQpyriRlOijerEvyJg9TyuI9rk/DfNrAkT3FZwpNeBUBisLpiL8PaaJTucmEYr9D/TzhxkoBK6pfs3dFmyegWYziv+Pm0FnApPZHp8GSVvg6P7lFFcCTA+nOjH/lS55tZnCM+y39wKJ0OD6bB75iyBoq9EtVsCfKXhLvAg8yqLksyBkQUlqKAdGIdx64+5ycQaIfVQFTd2S2A3xbDPE0Zr3SIKRGTcvUcAI/tnXFIb0VQONkF68EqI4raOQFf49xtwT3sutMgBZjdzkfaPLdwfPUeOow7vE2mACUckqFi/LiE0MWBOMYb/rkE/0dj8jaz2jqiUlsv+rKPDGUXjFak40QRmEVUeOUYDr3QAiutVpHkgxGsc6IGlIyWwG+xfK/uGNNaMEuU+q2Aq5cm2cLohf/c0GpwHeGxfuzSrko1WS1z4XQbnItOZSdVJSzg5IqVL1fj2Pktpb4IWSSP/9u44fCrcLWPNW2elnNrWYPhD0aUVpwlAykCpsszVwfKmc5Dh95ADB8XxNmeb4cqqa6o2FxksTYHDHFy/Skm1kN74tuAlCgXvEtb04Ay8okoaT4hYz4L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(7366002)(7416002)(2906002)(7406005)(5660300002)(41300700001)(86362001)(8676002)(4326008)(8936002)(36756003)(316002)(66946007)(66556008)(66476007)(54906003)(110136005)(921008)(38100700002)(6486002)(478600001)(107886003)(83380400001)(6666004)(6506007)(26005)(6512007)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h5fCYn1C5HAWUCy7obfNUqaoTCEkFVMeQnEDAZuubngm8Fg1s/MljXxumArz?=
 =?us-ascii?Q?4yL9slqk7Dg93lt8zvNYQErl0CLfneGPn1UXTSMlPzV1LDpdI4AiUeiCTvBj?=
 =?us-ascii?Q?EoEHl5OCW4tifzIWGyJKFhypqbRYnqyys51gWgQUG5ueGj20U69rnZ+A+b+m?=
 =?us-ascii?Q?A8bz0/ElTN2bOocGKPby47stzMHrY7H3TTnU5Mr3X0Br3Vf2v+DOS75Gbxpc?=
 =?us-ascii?Q?rx6eS6Y4+F/ZQt8s5qd06MTRuwh18nT0wVW+5kC58ieaLbf9+UWEZM9QXRtl?=
 =?us-ascii?Q?B512PUp3lXZcMMt552PckTZb7FP4iVdE5+94Hcy/p+NHy9fQjinC1O3feDUR?=
 =?us-ascii?Q?TXQJwcOxp9tdOOQCp/rEvMjkKXmCD00bOapwpqUZ8sW8DVEvdM3edLOISaD6?=
 =?us-ascii?Q?viYAeDVcW4ySsFoBlMQHNXO4uRloumQjdYi3rColBe+s9W0gE9IpCoXMeZV/?=
 =?us-ascii?Q?F0EPYm15pfdnyRxdqHfIpn3O4YeD1qDsN79mtDbhlOimlpwqAA26zkI/SNej?=
 =?us-ascii?Q?IoMgO1fuhR26xK/0opRCldBilb39HmiaqwKhzJUAl1bVRRnZLV+klLU7fSMM?=
 =?us-ascii?Q?5bztRanlfxdlzdgWkEP1ADJ7wHFi1I33Xt5Ubaf/eZsGgDuP0uvkTlA/68/u?=
 =?us-ascii?Q?vcb4kcFJwQ+cXLm2XCGCMNm4ETNMlqRw28qv2w0ZYKGuYHaUUzoHupIaEsui?=
 =?us-ascii?Q?Ev6PXPAy4bVUNAQNx+e7cPcsY2dzTJ+qK9qv/LgHax8nWhcLLdvC9dyscaZH?=
 =?us-ascii?Q?SCmrC3Rxl0N3YVVDCP92KuUJIk87d+AdGEvtf1/REER5GYJA1U7N/Eu79o1A?=
 =?us-ascii?Q?sFELNZCG1deNS7HcK4sC1n1Bo4zuijVgLhAFPteaArN4aH7rGzksQmJd35Tz?=
 =?us-ascii?Q?QR9TDImIHVvHRAzcLDaOsaDZeDL+Vos6JRwsIH31kDijYg/6uusUik7irVWG?=
 =?us-ascii?Q?A10TOKLszAj3riV+fbuTdcll1GwHG+LfLg0gANTDo18Rb4p7LxVk2MpddV/Z?=
 =?us-ascii?Q?G69/yR2bezRBgqfh1Rp2apXAcbyx0zcJjQi/IRfk7XRC14FFPhRYcZh9X1Cb?=
 =?us-ascii?Q?nlioyFuxzZe8woGVLtGyC8mM7a9mD1FQYsddsLFHyWLEIsfVAct7svZeszmj?=
 =?us-ascii?Q?B1jMQCURLSsR0a7Kx4X42xWpcR8vTGMu/SEi2pFWjOw3+ZX7vp9ZW/nStdI+?=
 =?us-ascii?Q?o6M3LiV9fK2MTMELvYCJGdvXbQxCoXVb5Bkku87Q7dpnufC1nxxyqybzqrXP?=
 =?us-ascii?Q?1O+UyH8VX04XvG1HPFCkldNHoz416e7HIsykl/qsmT4y35CHotG2cQyJR6xG?=
 =?us-ascii?Q?IMQO6m1Icogezlib5AeTEXN87F4ZCozNdR7Hdpky5Dh1qF1GiEsrKnM64zbq?=
 =?us-ascii?Q?h5klMARHgGLGP9v7C1vP2AarQ5UZCThUgInmZY8kqC4243nuhIgtDlZKh6bX?=
 =?us-ascii?Q?uVFnjbJFTx1PjgoBwSq1AAoUriakRqCxdwWV/2CRXBbzB6G2DNuuttT/n+wD?=
 =?us-ascii?Q?QcYnktgudSnBGF3ZyffQntAnIZ+okCIP4V20M9Lgakiqb1oMSwqZxojXySp+?=
 =?us-ascii?Q?h8Vbn6XU0rleIjQIULW4XYaCUym7zw1jFzCbjHaB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd431882-78d4-495b-0431-08dbf74ec9ad
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:03:16.7701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SA6avtUo/6SaD/jVHgNNjpu7H6BOIllVm8dCXMxyGnlCyF8dY7mvZk6UiUSm7Nvu
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
2.43.0

