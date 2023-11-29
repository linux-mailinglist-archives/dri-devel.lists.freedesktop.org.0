Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42757FCBE3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5563010E5C7;
	Wed, 29 Nov 2023 00:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E6610E5C3;
 Wed, 29 Nov 2023 00:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIG7PlOd6k+UzQb91wOrX1KdVr+4gR3shoeU8yC2PfAhSuWLD0MaIpuL9COVxfl2tMfZTmwD+04en7mF8esFnFX7CGFULaSbZ0p3DhPJgOnijE33rqCZXQssC+M4Clt0Oh7Ukyy7dxmepPdY8Ge6FeB4QgyDur+da0nXnS70y+cD3hx+6MwNj8cL9gYR5EDCu8aDYvHz6r+60jt0lMW/apKRUBKDm71lHS5nf5SSeTU8aLuE47DP5iObiNA99Y2F7Gk4PpzuMFPBtd76I4YCh4UYW5pqj6JNA9+T9JTv8YrXFZaEObhivKZeSghimxZ7cTHgyj4WkZgcgsH7XcEImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJu64ORRwE4Y+RuVPsljaPFvdpsf2Xu3gqhXQezOCM4=;
 b=YPr0aUbyxBDaaHOgA0GHIUPYlZgdvc5Fla8mRys/ihZod+tslhi0b3/EFnxMSS8qheCMV8UrAk3VsrJMf7+x1OoK1rNa1Efzbx18Gm0QFmudOAThoZ17000gVRlLrcys3ZBa4u/ISmXWB/FZeGibcg3LgS/glX/NDQqR4+594cP6/P5vFJtTrTyMGT5dc6J7Rh+K5sBWyBnXmZ0da69/WCBaU51bZN3yg+vx8X+BkJmw1ThaSBxluXanB2dzO8mTSpooin1BFiMRHpcZd6rgnTpCYYrXUg/3ga4wabjrMXDXDWBE3DFj2VfsjhrHG/6glcRNsqiWjrfR4sxVsYmUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJu64ORRwE4Y+RuVPsljaPFvdpsf2Xu3gqhXQezOCM4=;
 b=L3b3Cb/t/7l6OeNflgmj6Mneiswu0rcTNysenCRexNF/xSEMaY7zznOaRthAQyk81JE3Ckvlo9nEbP52DktYYDq/XKA0TT1o7MlvF1Sa7MT1kGXMjdZQzb2SUGOuIGlVtHnN9jS7wZC5msc67g/Mi6MobtaYjq4t+q/MITP5W3zyezyz7+JEHO+5LkW8wov9Q+K3QlAXSrrAWbFLNyY/UXKgTm5hbsNm9k+WQfk8Ab/xDu8ax8NHaIJTeDTI56pfgIH8ulrnTWrMI1Mzn/LViDKzMSbI8MBhZr3+1Q0pimfa8Xvb+KNJqMePrjjhxdzEblnwE2MIURnpekajaZ+PIQ==
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
Subject: [PATCH 01/10] iommu: Remove struct iommu_ops *iommu from
 arch_setup_dma_ops()
Date: Tue, 28 Nov 2023 20:47:57 -0400
Message-ID: <1-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 346d4988-c6f4-49d1-7ac2-08dbf074da84
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5zCly7k9x5zjW2JZ1It316mrDvEIsgYTYXB5nHsfbXSGeG8EfW7hutnrTjRFkCsZMEZHk7UxBM9mQ5Rd+P6H99ah9xxy5owcwL0XCgup8J0pZSLBrGvgybgV3b+gfZgHQygfbZVUSV3MYC8bQ/wJZGQVb83A8DcOfwa7vtd0tDVGHNlZub4YMKlRz6V0TjE+S2jeLm5200nbObdvmQZSY8hHl7Q7Gt1upTqTe1mIe1XvzzJh8fo63CQ4MJISJcUmIynlHhvNmlycllYh4IB4XqyQWuAeZtB89n2W1Rw/JFJxV9f0o38YL/WZ6nmLIrkPnoU+zaPJTpdlJ4/ghEv4nyjQf7z45NoWv6uaSbsfB/IIrOFmX46+haHJAW5tKuG/Pw6ZN16d6Nr1bLtU7sBmw4ZxR+ZXMVjRLZ3SY9H0fo+8JA62JQmcs8osehO82EePgdH9L0uQUhmPwsb/Yz4kr0JGW7vtMMTzsEkAm0qtjyKUELeb3P/utCQG10fJkFeb/Hr0DhoIEkJV7iSDjSmv6TAxjOsIoF1DRVeC6LdFPtQgmwwuXPhdXLVBrCpfgJIgTS8hsEeaYS7QkdyvV08D9AH9/8d6o7GaiL40r0ttAc++aCrP368/w61iEyJS8Ot
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(7416002)(7366002)(7406005)(41300700001)(4326008)(8936002)(8676002)(2906002)(110136005)(66899024)(316002)(66556008)(66476007)(54906003)(66946007)(2616005)(921008)(6486002)(478600001)(36756003)(6512007)(6506007)(26005)(6666004)(83380400001)(86362001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sfTcjZv2Yv5pbDb1X4VaDF6Q+Qqi7MlyF0ZOKjVLRIiSYWMugDBCS74uCy8N?=
 =?us-ascii?Q?Qg9uzxtJh6d8tAHsKGAsvjpK2r5lWC3pVOIWJrVEyfQmBFWdhQpgCxTMUFF5?=
 =?us-ascii?Q?coYKoocEfGlc2wbLSEiTuxDrrgXskih9uhO3CO8Sb6jR3pmuWbZBVLPVzcmn?=
 =?us-ascii?Q?jB+eJUWqVyxO8czvTxsLFPS2yDzIPq6AxLBDqIqH0j6GWaEDRhDOlFaETgkn?=
 =?us-ascii?Q?TtfYMYpK8eyU8uwiwzdRuekBP9+UNHAEAnrw93olN3BaQqe9+t1/YhjWffA4?=
 =?us-ascii?Q?RwuzWWc7ulLwXzSL/7KqCjP9zWdUaDvKdRy21sZ3juAmRVB6xUMPZF75kk8J?=
 =?us-ascii?Q?i7nx7daiwhRV26OzEWk2shIxFB8PVpxYmCASaXqOr4I1afGK42FCnyOdbTXM?=
 =?us-ascii?Q?eS98jkHRPaMkIKe6NFgoSTN7D15DrM3izgzI+xaRYkCZ4e6qPxu8QVQdDHBk?=
 =?us-ascii?Q?5NYFvCLNo7UcAiPyRArVYs7emG4A3fkc00gVUhlwNgZCyElzg2TNM855LfgI?=
 =?us-ascii?Q?idm/WggDQvaCwbK4sOGnslj+rSMls0DNw6N/2YTroehJGEomhaFMlyByOtvH?=
 =?us-ascii?Q?9iSir/oBBruy7RC+TqBPjhlc2aIgS9ZX1nqDtD6IMnE1EnlLYiaBDSDhd7F0?=
 =?us-ascii?Q?LUBRqXl1527lz6FOBxrAgBglv3yczDzIkSLnZe62YeXvYkqFyA2HQEISQkN2?=
 =?us-ascii?Q?EZH4ns5OodRAhIufFU46ZpBEYJsX4suJgjqVAckXPN3ChkVNZjLMpxFfZW6I?=
 =?us-ascii?Q?ZQ/tCMlTCNUc90kMFt5XaHpxMRuM5mX2bE/IGZbrthBdc38PiWwF/wG0esSz?=
 =?us-ascii?Q?+8clon+BVdnvSHCDuG/fy4T/oprYW8nUAamCA/bVfCCNS6r6IepODC9u0Owa?=
 =?us-ascii?Q?BrtltyWQEifOoqIPs+lIi0BclpxIZ3gjI0pYa2i4MULB5BCdYSXnjo/rn6bG?=
 =?us-ascii?Q?M4I/NYk15JPVrwwP68SFkmUDXqbyHZjoa4wivMxJwJRw9fYKrtkvOY09OW9m?=
 =?us-ascii?Q?ArjEfcH+SYTCt+24dWE4k6Dom+0tMYYJ5LsFPRitsI90sYDZJQMT/NuTN9nf?=
 =?us-ascii?Q?5KHSBNLpzd+imEM23N2VJOOsJN6VAWP4s16FdOg2xM3jY5hSKoE1KJZM/Kpn?=
 =?us-ascii?Q?+cpEEJeZ0eP8KaX8LNiwWaMHpj1MEcBrgdS35LJ31mhW3qkLJunRTbrQmIl2?=
 =?us-ascii?Q?VOFDFjdmTfsVsbKGQrzWAQGOr29wk4oTmJMe8fZBalDBh0mYyTqDDmoplkXU?=
 =?us-ascii?Q?WsFlCJsc/R6vJPw9nzRrocNCQRjjPCw+uTIlFRbKU+MbZb6AFAhfiFU2dq2B?=
 =?us-ascii?Q?nwADVtao0VuW7ZxHEIz7OKDg7TgW6afdk7r4P7wR5k7IH+O3gIr6bkaQTDTj?=
 =?us-ascii?Q?Nahhk22pZ6RRVe3xqgI7Xl3AvHnLOnXS1O/CiN25Z6nsy0LE+OQGQ5ccsVSr?=
 =?us-ascii?Q?z+rOMV2Pyc2TWCSDBG7soa41+kXCr4Fxmlz2EHIu3D2A8Fqdusrjt8Fj/pCP?=
 =?us-ascii?Q?QTcVktuly7B+LIbI1jnIVyXI4pvkrh4BJOQVsiLeVzgZFeI89Hhds87jsYZ0?=
 =?us-ascii?Q?JmFhr7yhinpSA0gTWte9SEYdQulfgAKj1Xjxvj9x?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346d4988-c6f4-49d1-7ac2-08dbf074da84
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:07.8141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNQyiojQLEN4IZP2ttJjE7ciBXFBrOFJC1EBUTQVjTlIBsViZXHzTLck2tvYEV9m
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

This is not being used to pass ops, it is just a way to tell if an
iommu driver was probed. These days this can be detected directly via
device_iommu_mapped(). Call device_iommu_mapped() in the two places that
need to check it and remove the iommu parameter everywhere.

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Moritz Fischer <mdf@kernel.org>
Acked-by: Christoph Hellwig <hch@lst.de>
Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/arc/mm/dma.c               |  2 +-
 arch/arm/mm/dma-mapping-nommu.c |  2 +-
 arch/arm/mm/dma-mapping.c       | 10 +++++-----
 arch/arm64/mm/dma-mapping.c     |  4 ++--
 arch/mips/mm/dma-noncoherent.c  |  2 +-
 arch/riscv/mm/dma-noncoherent.c |  2 +-
 drivers/acpi/scan.c             |  3 +--
 drivers/hv/hv_common.c          |  2 +-
 drivers/of/device.c             |  2 +-
 include/linux/dma-map-ops.h     |  4 ++--
 10 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 2a7fbbb83b7056..197707bc765889 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -91,7 +91,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
  * Plug in direct dma map ops.
  */
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-			const struct iommu_ops *iommu, bool coherent)
+			bool coherent)
 {
 	/*
 	 * IOC hardware snoops all DMA traffic keeping the caches consistent
diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
index cfd9c933d2f09c..b94850b579952a 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -34,7 +34,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-			const struct iommu_ops *iommu, bool coherent)
+			bool coherent)
 {
 	if (IS_ENABLED(CONFIG_CPU_V7M)) {
 		/*
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 5409225b4abc06..6c359a3af8d9c7 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1713,7 +1713,7 @@ void arm_iommu_detach_device(struct device *dev)
 EXPORT_SYMBOL_GPL(arm_iommu_detach_device);
 
 static void arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
-				    const struct iommu_ops *iommu, bool coherent)
+				    bool coherent)
 {
 	struct dma_iommu_mapping *mapping;
 
@@ -1748,7 +1748,7 @@ static void arm_teardown_iommu_dma_ops(struct device *dev)
 #else
 
 static void arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
-				    const struct iommu_ops *iommu, bool coherent)
+				    bool coherent)
 {
 }
 
@@ -1757,7 +1757,7 @@ static void arm_teardown_iommu_dma_ops(struct device *dev) { }
 #endif	/* CONFIG_ARM_DMA_USE_IOMMU */
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-			const struct iommu_ops *iommu, bool coherent)
+			bool coherent)
 {
 	/*
 	 * Due to legacy code that sets the ->dma_coherent flag from a bus
@@ -1776,8 +1776,8 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	if (dev->dma_ops)
 		return;
 
-	if (iommu)
-		arm_setup_iommu_dma_ops(dev, dma_base, size, iommu, coherent);
+	if (device_iommu_mapped(dev))
+		arm_setup_iommu_dma_ops(dev, dma_base, size, coherent);
 
 	xen_setup_dma_ops(dev);
 	dev->archdata.dma_ops_setup = true;
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 3cb101e8cb29ba..61886e43e3a10f 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -47,7 +47,7 @@ void arch_teardown_dma_ops(struct device *dev)
 #endif
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-			const struct iommu_ops *iommu, bool coherent)
+			bool coherent)
 {
 	int cls = cache_line_size_of_cpu();
 
@@ -58,7 +58,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		   ARCH_DMA_MINALIGN, cls);
 
 	dev->dma_coherent = coherent;
-	if (iommu)
+	if (device_iommu_mapped(dev))
 		iommu_setup_dma_ops(dev, dma_base, dma_base + size - 1);
 
 	xen_setup_dma_ops(dev);
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 3c4fc97b9f394b..0f3cec663a12cd 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -138,7 +138,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-		const struct iommu_ops *iommu, bool coherent)
+		bool coherent)
 {
 	dev->dma_coherent = coherent;
 }
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index 4e4e469b8dd66c..843107f834b231 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -129,7 +129,7 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 }
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-		const struct iommu_ops *iommu, bool coherent)
+			bool coherent)
 {
 	WARN_TAINT(!coherent && riscv_cbom_block_size > ARCH_DMA_MINALIGN,
 		   TAINT_CPU_OUT_OF_SPEC,
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 02bb2cce423f47..444a0b3c72f2d8 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1641,8 +1641,7 @@ int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
 	if (PTR_ERR(iommu) == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
-	arch_setup_dma_ops(dev, 0, U64_MAX,
-				iommu, attr == DEV_DMA_COHERENT);
+	arch_setup_dma_ops(dev, 0, U64_MAX, attr == DEV_DMA_COHERENT);
 
 	return 0;
 }
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 4372f5d146ab22..0285a74363b3d1 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -488,7 +488,7 @@ void hv_setup_dma_ops(struct device *dev, bool coherent)
 	 * Hyper-V does not offer a vIOMMU in the guest
 	 * VM, so pass 0/NULL for the IOMMU settings
 	 */
-	arch_setup_dma_ops(dev, 0, 0, NULL, coherent);
+	arch_setup_dma_ops(dev, 0, 0, coherent);
 }
 EXPORT_SYMBOL_GPL(hv_setup_dma_ops);
 
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 1ca42ad9dd159d..65c71be71a8d45 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -193,7 +193,7 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 	dev_dbg(dev, "device is%sbehind an iommu\n",
 		iommu ? " " : " not ");
 
-	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
+	arch_setup_dma_ops(dev, dma_start, size, coherent);
 
 	if (!iommu)
 		of_dma_set_restricted_buffer(dev, np);
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index a52e508d1869f6..e9cc317e9d7de6 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -427,10 +427,10 @@ bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
 
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-		const struct iommu_ops *iommu, bool coherent);
+		bool coherent);
 #else
 static inline void arch_setup_dma_ops(struct device *dev, u64 dma_base,
-		u64 size, const struct iommu_ops *iommu, bool coherent)
+		u64 size, bool coherent)
 {
 }
 #endif /* CONFIG_ARCH_HAS_SETUP_DMA_OPS */
-- 
2.42.0

