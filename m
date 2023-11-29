Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE417FCBCE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E3D10E5BF;
	Wed, 29 Nov 2023 00:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9B210E5BA;
 Wed, 29 Nov 2023 00:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0uKHsEw7FnPLF3K3PKwsbtwwn4etuSBQoRGDS3CR/Izzue9NwUx4R9McvgcWegRntehR5IP6EbEE5HJZRH6JiyFa6eNO6q5kW1pbADnGpNdUsFtOikiXdKC9czYccmE+jJGqNyB1WX5XN/qgUs2A+I5Qh11kMgQJF04V9XmsqjtyAGBgIBanKrHcI4JFsnLfCk3kEkG0WZbsy5XqIgVTKGKYR1+UEmh4/dQ7k6E/os2+Xb6ElrQQlwRT4KnXrEpqYWaJoNaZkN6wrBtMSgviQzvrYJEp5GJxeFzojXinL9JROVXRtGlNn8j6GPZyFD/EOtj18KirFOFqlRvBt1L8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm9IlOMLFqMO8mBkETbtcYbNkUSamBVW/1pmCRjbVrU=;
 b=DWdydFQDcgTv5wWh9VYMkHIaki0nI9y5dGVgeubnU25XyxdhhWinPFtlXvs9A9ixm8TDkYWHa8liqMIS7hwPYXk62l4IPQkUgInRI+smAGbinL21YmQ7Jeov2Z4iBmWed0Gb1snTAgW9p5Xq3to7/ZCcvxxGzQNw6888eAVj1FkZhCT3B4fd0C82LYLllUI4NQ2LlSKbQryMG62Zky4tIqzDuAfnYP8qrGLkRTy3fVdPr/DAnmUsUejuniiXPYZHpaZR3VFGtWHOo/e/Y7KNlv2V7QDVkwQi0SlwH54I9TldI6ZN1cB2wRTuoG2MZBHyxyvEDDSI2Ex07gkM75dMgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm9IlOMLFqMO8mBkETbtcYbNkUSamBVW/1pmCRjbVrU=;
 b=Pz7DsLNZ8jaGKY9w5wJcGx1xKd5Cz+EfbWvTT4vBRCOZsvrO6TeTBvOyY3Zyx4s04ggOVTdp5Vak8h47bkphH1TEUmH+X/JzN1W65tHBBpTjG+UPgoyC5ieLknDLtZIufvT2/TEy8PZnVZ0A9tWMkrW0y4OqofyW4YRuiy0fVydOEv4hrIQ87Y2HdxW0lymB6YeO0T4S3j1nokGVCSeSAT10BhaDnkyGiDW7YLfHqBapiRacElzvrgYgDaN/1Vet1AJgeOXzKha41sAZQ42r8Alolm209vXyb2OvIYOiI/d3gz8hb3dIrsnK3vNDCo8MUwcTAV6Y/zfjQFen2mg9aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA0PR12MB4575.namprd12.prod.outlook.com (2603:10b6:806:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 00:48:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 00:48:08 +0000
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
Subject: [PATCH 07/10] acpi: Do not return struct iommu_ops from
 acpi_iommu_configure_id()
Date: Tue, 28 Nov 2023 20:48:03 -0400
Message-ID: <7-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA0PR12MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3cdcb0-8c41-4123-7cd2-08dbf074da78
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQ/oIi8TJPmjZtfvky7xdhC2/jExbpChgU6sTLMLyf5bQ+f5hVLvPCTdw293CKX9ZHMRFfPgLLEVqfvPhLXbxJjLxlqc9mfWetr/h4JCpqgs0+MivYgTJ86YEMWoWepRJWlKgwvFZMUUd8uPmQ8LpDmdeKleGj9jO2Ql/OOUIvRBqTH1fJgxfEkStBUCwaZHjl8EBkBpJHUPZISt3ZKd+9XIvDU3ePA5SRauyg+3gKZmHSesIMr1sz79TmqoQkwJUIwoX0zsEIKF5KrYQiElZ8INT8wPG74EZ5fit6AuSqAgVUiBkASPK7bMWVXPpQPA972NG9o0+gmFLc4Zi6m78HOgiHeGm+X4o85RBt0m2o6iD6nq5dce4p1FtSBz6HGOcmAEqz3uQtUJv3O1ECwnOfdlcdIhv2ui287cNvIculigwtmlvi8ok9Bw/vykRgf7uH+tTA5HLq3w9IqrzToNUoarboaTxmdFC3nPWiIqxvSqAquIsj0Dtdq6qAUNEHUS3L5K5dglp6hjE+y6AqhHML7lGt/bDarJ7dpQDWwvkzRI+MUHqahMQe68RrMQ35PI+vFS7AL1JtNhmcAMn2Z9RLh+Zf0a8bn+3v4fuKN0gwidzWfQXE0qeFHWp1P5jlaE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(2616005)(8676002)(6506007)(6512007)(7366002)(8936002)(7406005)(110136005)(7416002)(4326008)(86362001)(5660300002)(478600001)(6486002)(316002)(66476007)(66946007)(54906003)(66556008)(38100700002)(83380400001)(2906002)(6666004)(921008)(41300700001)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UIMOVXjZiFjB0AIWkmVunPDmNCZi8g2JpAWfAkfiebC81CO+KT4j7oVqS9xn?=
 =?us-ascii?Q?ehEhdmTRF697zhxDoGoiyAqVFTI00QSYf5v0oPx6CxeCQgRPh5QrFw7HcJqY?=
 =?us-ascii?Q?LhLK9iih1dMpcAgQCmpjIMxIkN2wLNNytG58YmFtogf8g707jZFsMB4IycTG?=
 =?us-ascii?Q?DGUB/tacwb98FxfdcAClkQ9gYVcM0pWbGK+5Uab7lMVcL5TBDdYSRCxZjtyH?=
 =?us-ascii?Q?yKDjscKN0Be3eVkuQNaPYQ1JEaex5prBg4MuLKkZ6B6PVCaRIzjYiNOp4VRw?=
 =?us-ascii?Q?ZKRqGo8j12n0HGn0Uo+Cyd2txXpZ6fFTdQd5o1UeFRwlzOb/xJmPviJpggLs?=
 =?us-ascii?Q?Kr5mQxx/Dh1fsQ1S0hFs4JAdihDeH233wp3ppyqv8vdZXHzIDemD4yRjFrf2?=
 =?us-ascii?Q?KxUFyy+YUkQbTCKJqJdWnOccWhcBBMIFU62NUMuYXJaUbtPxL8YL6VbTW//O?=
 =?us-ascii?Q?P3uzbLJwKcMCoFQKXncyxF2X6rRaCHX58HyCiMGm8N9Qfrb1MmRCkp+rx8AW?=
 =?us-ascii?Q?v2+qYfOio4ephra3S/uGHRD9Td2fNU8c0NTEejUolNwYVPCsSQUb0XuXE4Bp?=
 =?us-ascii?Q?a87qMhnvvwsmVmh6Ip+AZO8qYBT+7NEmApeiQGA7n3zcPVZCnYOxkDzB/0lu?=
 =?us-ascii?Q?BJYhQmwjq9lpD/AEF63hbut/74MuMqYypab1sAJGWT2KXGaC7A+lHR0JrT4n?=
 =?us-ascii?Q?d0qWrxDMzncczehTvaC49RaZilSkqmxIIK9A6afKFNT1R9PMgs/dW1mDaeNj?=
 =?us-ascii?Q?UbS0+0ykq+UgTwCfwOk+BMgr4c3UZUHYoc95kL9WtbrU7uT3zfRonb/TcK2Z?=
 =?us-ascii?Q?jlaoSJSIS9miiZkDMeTMFY4T6gQhQq+wce0XerMAdL9frgf4e9jpkw87FREr?=
 =?us-ascii?Q?3AZDyf/F1fOV6J6vU0oGyCVXyYt9nekfJ4SwVbR1QTXGVCgQEzKKQjf6QTLZ?=
 =?us-ascii?Q?XqdhIld47V7oapvHX/lzh7f45N6egSP6YS9XVJeMpqhITqPKFq50EaUt/cPL?=
 =?us-ascii?Q?92YHVN861IhjfpVLgO8nOMEKEBeMI5xjAYqmRDH+JPdtdsXnyd4fwxhgXTMh?=
 =?us-ascii?Q?MLqOsyNTiRSYlEzsfmZ8fMOqszq5PNI62BF+QO7VEmSwrjj8PM21ei4H/2+S?=
 =?us-ascii?Q?P3nR7MjkzTxnOikh8tTeCCshTTD31WRQXtm0rHMZcr1yJdDOi2KO1pRjmBCs?=
 =?us-ascii?Q?3coKdUTs7DHWmHHlCqBBlONb03FRSSMXp9SXiRSB1Nm2qNmE/AglXcNJkd37?=
 =?us-ascii?Q?7GSnPdxqepN4IjcgYXqU3Zxqeg/uoTqCD1K8DKoO3pLZPiy+NH59TTwCAjdk?=
 =?us-ascii?Q?C1OZSAeOq2RHw79pWblsb2280c6ek4V6+nq40H+EFt6561NYtSVkFTnMWSMD?=
 =?us-ascii?Q?8KCT+cn5mFQO1DsDkAXrR2UkkKjUMNF0GtjL4aLPfDcVXdV3ITDIgnoIt6Ix?=
 =?us-ascii?Q?Mk4NM2llN29UkE5MDdEUKDSuTYqgtF7LPKZaF0dsAQk72HuUrLnP6Z8qaTPS?=
 =?us-ascii?Q?XT6QjkhYjU8o/tgV5AMc8kIIdRrJUZoeTd8Uq9Njyg9l7KgUrWqUWHf2kV/M?=
 =?us-ascii?Q?CuBq9wB3Q/4omXgTK05pzDDSRyIo+VLfGP6TqtZY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3cdcb0-8c41-4123-7cd2-08dbf074da78
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:07.6484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycF7p2nhNFwOx38q7XDzAfgW83E9drWUTsKuRY2KhN4tnEtUWbtf3z4zCttReeHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4575
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

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Tested-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/acpi/scan.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 444a0b3c72f2d8..340ba720c72129 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1562,8 +1562,7 @@ static inline const struct iommu_ops *acpi_iommu_fwspec_ops(struct device *dev)
 	return fwspec ? fwspec->ops : NULL;
 }
 
-static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
-						       const u32 *id_in)
+static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
 {
 	int err;
 	const struct iommu_ops *ops;
@@ -1577,7 +1576,7 @@ static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
 	ops = acpi_iommu_fwspec_ops(dev);
 	if (ops) {
 		mutex_unlock(&iommu_probe_device_lock);
-		return ops;
+		return 0;
 	}
 
 	err = iort_iommu_configure_id(dev, id_in);
@@ -1594,12 +1593,14 @@ static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
 
 	/* Ignore all other errors apart from EPROBE_DEFER */
 	if (err == -EPROBE_DEFER) {
-		return ERR_PTR(err);
+		return err;
 	} else if (err) {
 		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
-		return NULL;
+		return -ENODEV;
 	}
-	return acpi_iommu_fwspec_ops(dev);
+	if (!acpi_iommu_fwspec_ops(dev))
+		return -ENODEV;
+	return 0;
 }
 
 #else /* !CONFIG_IOMMU_API */
@@ -1611,10 +1612,9 @@ int acpi_iommu_fwspec_init(struct device *dev, u32 id,
 	return -ENODEV;
 }
 
-static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
-						       const u32 *id_in)
+static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
 {
-	return NULL;
+	return -ENODEV;
 }
 
 #endif /* !CONFIG_IOMMU_API */
@@ -1628,7 +1628,7 @@ static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
 int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
 			  const u32 *input_id)
 {
-	const struct iommu_ops *iommu;
+	int ret;
 
 	if (attr == DEV_DMA_NOT_SUPPORTED) {
 		set_dma_ops(dev, &dma_dummy_ops);
@@ -1637,10 +1637,15 @@ int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
 
 	acpi_arch_dma_setup(dev);
 
-	iommu = acpi_iommu_configure_id(dev, input_id);
-	if (PTR_ERR(iommu) == -EPROBE_DEFER)
+	ret = acpi_iommu_configure_id(dev, input_id);
+	if (ret == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
+	/*
+	 * Historically this routine doesn't fail driver probing due to errors
+	 * in acpi_iommu_configure_id()
+	 */
+
 	arch_setup_dma_ops(dev, 0, U64_MAX, attr == DEV_DMA_COHERENT);
 
 	return 0;
-- 
2.42.0

