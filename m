Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCAE808F65
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7859810E959;
	Thu,  7 Dec 2023 18:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F4910E92D;
 Thu,  7 Dec 2023 18:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhCAmkLhpisws44k1Xn5rlal2KyyEyCJLGu9H0BSprlx8BHATKW+Iifx2Dd1W4fvZjMN8CCT51cmXnkWKckZI6IyJIavlQ5JHUTrUIiKLJNpOkpJqUlrq4JN6kIslrHF1p8H0VU/f3qoIsXMFUUmw9ancpdYOSxCE2JIdmbWnFhXP8MFEf+1N/myPid4aUdIIRNdlabfLXIBOv2+XfOI0nflpzpqZQ+tzPaINjICsQV+r5XQ9k2pqGbYGtX8oMyao/yXr3SSVtSWtKINC6lGO5nZCuKNAKDI8Ydk4A8JcxeZ8fAUgDclcvBMnjjXGcaRgPCJl040jDmvU5i3rYwHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocTs/GhLIEbYt1WyMVwSj0c8ihsbvkFNjrjShyHQK80=;
 b=mCk49bNO1K42JFoAxrt1Dc/JVx6q07aPgGE6004kBgHNmP4ZkducWbPj5B0+i7o6z+uxawaR7d8e/992HyUSEX1Y6cI87kfUsC0Ju3M1iXEIS+dj0GehPKMBiyYz9xFywqPNwRJBF2Gfg9PA0DoSR7s7ses4WbMZIGLNDdQT9m3hiTUzBNljRbHHW4P51dCo2+vBy51oq5s3FgIyV9yhDiJ3oc4hNx1HExMWBowsoAeR6MngiOF/utcQQhc5zZziblqFVFH8jI+gY0cukOIWesR4IeHde5pBPi/6dk0Q0YlRgH1A2iV+QfzcawuJY+e67mzyZyObqd81Fb07gOSqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocTs/GhLIEbYt1WyMVwSj0c8ihsbvkFNjrjShyHQK80=;
 b=IT7oLNY6vt6u8JLdgkmQrVL9YcvNaLR4GizHdklJTTVZG/OALTjWkp6gp0aOeglKTPrTqf/LOshPLuKm44hlHtd6lJUUr/xiU1i1JKUnFCc+Z8tEbnFFZk0USsmCojr5z/cpQc/bt1KRwQt7muxhm02EfTr1bP9eF/yFNcM6SI5YIyMCiHLALnpMtbGsznQf2wdkravBp11W74H1PZNPhds47p/doZtkOaWv0Rn0p8iQZOkBp6h1yFUMYv00IUaOooMdFSAFUmLM1TuzFEbtedPC15t20Ue2cmD+v9GTdueo8NeMtxaIDTQ5gubf77CP8BSmlm3kd2Sz++i1MO2B0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 18:03:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.038; Thu, 7 Dec 2023
 18:03:17 +0000
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
Subject: [PATCH v2 1/7] iommu: Remove struct iommu_ops *iommu from
 arch_setup_dma_ops()
Date: Thu,  7 Dec 2023 14:03:08 -0400
Message-ID: <1-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0043.namprd16.prod.outlook.com
 (2603:10b6:208:234::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 7532026a-c5a4-4feb-7ebc-08dbf74ec946
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OL4oxLu2HmdIFWI3PgTpbOCCuJGfoKH5jF4H2wvkdlB5IvcgCN0eCe/uaY5wt9ZHFxXNk3zvcfiTQj7l2oOhcK2TP2EeMN+/pLNxRLoASj0SvHGELOBq/Nr9tskzoGuKuCyQvm+kNdRUChnSlbVcGNEPjM5WLqeuuywoF1NSqLwx6i4s/DvojSM6R7OQ3hQns5AlvzuIMtcFSEf0C0OkDR/3R1lxnNM0EN8D3f6kvUXKzEPxt1woKqDRt2dEVOyvYk5NMUbBc2wn9w0xxpvD4AeLVShnxSJ4iw3C2ySkrTWtXwNyAsku7dNvprdRn4WLOR4krROV+NzwPssWYuGfk45CHlSye7bf+rV4039ey7ZvQJo95HmwsXakMYAWgwOOmTjqy47GFDW1BUwc/gdhvc5+qEKACAqcY55e2atDGf3pEryJABO70hPzOIXS+DTO11gENLq3Yyxedeihpvzw0ecvmUBctc+9rGm4S92iLRsTyK9/8LwYANY/M46UWJ1nJcHWkuvHK36+4tfW/8ghJ230hBMAIkewn4QPTQScp4YGIotyc/kXDMHly9blydP3sANPKFB6Krh1IryBrKpS4bjfClumpjogBWmzn9KbvUZ5h5gzHNa9APL/FDCrw2XB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(7366002)(7416002)(2906002)(7406005)(5660300002)(41300700001)(86362001)(8676002)(4326008)(8936002)(36756003)(316002)(66946007)(66556008)(66476007)(54906003)(110136005)(921008)(38100700002)(6486002)(478600001)(66899024)(107886003)(83380400001)(6666004)(6506007)(26005)(6512007)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TXDSH4i/OYjpMMf8kW5NZVtGJ4U5KbOsa5yPoehYWv4pCLUB21hiBBvVsfi8?=
 =?us-ascii?Q?AUs2t79/f6WxWrctdDDfVDD+eLJMEO2/L4ciy79njgEUaAZ8aJAnI1qnX7wo?=
 =?us-ascii?Q?6dGQ1nRWwVbbYaH574eCQQqubesdToLqlDB1dMvGWS9pLa94Xl2RE2HqqK+a?=
 =?us-ascii?Q?kmKd/h5O+WYLoocGGw1X1k2TNEzaNDQw/S4vUD2AQbwd06sVr9uuXh6F9q1/?=
 =?us-ascii?Q?vUhTktv4O9o+RQYi6nnWpyei9PZtDWWhZV51r/+Luh+nDEaZCB7r44bT+48m?=
 =?us-ascii?Q?d1sdEfZkuXa6vRTAikZUdn6jovOIympL5VeiTfaOtggCm7oYx1oZ/NYk8E3V?=
 =?us-ascii?Q?lpSs/O0892fD3wqB8Jkxk3bu6J+g00qG2I92Rn+XUmjOPUP7cO49UEFIX2xr?=
 =?us-ascii?Q?v+vtenkIpRBxwCxEAupS+bmSQoAF+G5b3q2uFdRaeIR01YSX3zHdp6gH3ugy?=
 =?us-ascii?Q?y94EHEwdulcMJoxWBREHSzRVitxWRzavHT9wmDTBVwP5SeSwzuZzwZIZPQR8?=
 =?us-ascii?Q?PNQuy6YMTiaYXrfcJfd9mNpTvS9rMKTaPRBa4k4uFS4dTW0lyJik6WaDLvLv?=
 =?us-ascii?Q?BB4xOBkfjqXfm2JOzdYI6DlUIxFe/bFOfMVHv5QogXysbF3f5K2DLLLV0EPB?=
 =?us-ascii?Q?8IWjMQp3TIyZdhDk8DTdKrzSxaw9k5UBsHHOnliL6j/vR183RZUuaipcsNGX?=
 =?us-ascii?Q?I5MzbeD3eayFqMoMiSmj23orV/93hHX55rtovD3T4UT3O6+cn9iBRaajQjfU?=
 =?us-ascii?Q?drd65oCwHtbEXQLFJDOEDq5WYb20Wwx1UC4gNp7qHZwicpQ5f/KGwQpEJ/O8?=
 =?us-ascii?Q?OQ9J7xarwNuNYmEc5/JxqhLnFXeIs6eDu1aXbhktWfWtCKN6vUlYaCxJlff8?=
 =?us-ascii?Q?SZ5VbDeLRrB/mo4GtYxmQH+oknvkCjam4OpaT3Sr00pY0x6iQAP4a9oD1+fI?=
 =?us-ascii?Q?2kjfowlztq1pcIseLhpj7uG0dXj45szQzSjSwzYJ1Jii6RbbKl4pSU5rASNN?=
 =?us-ascii?Q?bXVbywWI/rY7HPsWFHuf0Rg2U2XtAf7p2kQ/c3uxnkGlrn6SG6tU2WExV6yd?=
 =?us-ascii?Q?UXBmKwL8uy1qEOfbStlAM/2OBK5LQriHy2Le/RyZxlc76di2tn+IOt0GUZ4s?=
 =?us-ascii?Q?MQRg99Wa3zGYDAJFt8d3z2HD+KP7TOJMciRe9MMxWeDyjY14c+ngl+bEqU7G?=
 =?us-ascii?Q?DruteYoJel4LmNJfzG7mmUc7MLLNIwr2JjbB+ZQTH6EmJ25xSoZVJcvJ8rPc?=
 =?us-ascii?Q?GQP+MN+s7F7Vmn7h28ZWo/K/Acv04pKjHF/gvDFpqvxe90vtv5yy9cZJfVLU?=
 =?us-ascii?Q?t18HH7ou7sjtlDBABBiU/XCvvF15m0hfTihR470QqqgWjfeRptVzHZipoW/e?=
 =?us-ascii?Q?v9OSDg4nnsolxZ0gpJKqb6rfIX2B5fkEsoK3zuDXWxxt2HsT2Guof8LXFfRl?=
 =?us-ascii?Q?uwbultUnDG828ediF1IJRhZBeoxJLCim+isdtPpY+LKil9piV38etX8igtFB?=
 =?us-ascii?Q?HHEeE6Qv0UAZzwVpTafMwhUaRci/iR/AiwqaniQW3YHDKTu+VBwIrtwRckw1?=
 =?us-ascii?Q?bVob1+0wC1NOmGrjYLtybaPX8UnWp2qkn0+Z2Y8t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7532026a-c5a4-4feb-7ebc-08dbf74ec946
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:03:16.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LsOURoOM2mfHOCuCiGoM+bpJRfQaVsUSG/U/puCLWsq2tHvMFfJenu2qtyJ//ky
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
2.43.0

