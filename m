Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B21808F61
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E3610E95A;
	Thu,  7 Dec 2023 18:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EBB10E92D;
 Thu,  7 Dec 2023 18:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBSorxlVFpp4iiqPmDIEqBJ4YiZYj/sfJzsKOiF5/VjjHzBjZd7x6bhjzMSOAkAS0GCq+y8vIdbw2D6Wv8eB14L9diXul6I3Grzu+zzigPaNhVRyE1HMjA1KyJZLmEpwFYlBny+qSwfVQMIP3e1lAgjvnOLYrcWtERnBc4Qe67hRFhlDtz6GHkr68IeFERkkwe8LlgKfqeErWEzqbQSH2oWKXxnpjsUNHvERYqlhUcvZEbc8lXdCzy4ML02LXlqiXoSIrjEcnpgN0vg23KIQOq4ogSj5if3zuaps5mOPVC3fPHgWhy4qlLE0yOIcX1e76assfd6Py4Re4c/4gA0Jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zCTfF4sVYNlXnYLelIPf8oD6pJL97HFVRMxWc0iXZU=;
 b=FcxFWy7wpRdudP7vWxV4dcBbs5RSSmWsaYC4e5n1PPShKYNkiXsP+IbK76c4tfWVOZc9IPjDu2cVlM4/3DPkGNMz4wIop0F1UEZBBoOOOE2TC+3uKv0tPK60cBp39JWpFl5n/tScQCAAPkLqjwVWOauossHoRkoBhZRYVyTspq2gc/5ncE/IhRY9po6LqM0ijry+/GnVzfHrb/GlB0J5IESQr+xxzUcZdfiqAYX3U+5TK/S8GygEzGPHFZmyPaVo8zUPrzdoRjzZcbxLAAupm8khLzdGtRlM8zVIhRwoEx6jD1xZZx7jxud6lYYlmXKDZ6ds4KoxWWkvLj3bZJpQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zCTfF4sVYNlXnYLelIPf8oD6pJL97HFVRMxWc0iXZU=;
 b=i+Zgt48l+bFtdScy7j1k6j0obuS0nnVPfVyjkK7FGmetuR1Nuc6JoAFSXIdSX+ViEyvwYdEOB3PmQtzj0uLp/b09ICYJ67k1UeaVZuzpY2NU4XthgyAzETu8xpzqf/mwrFkiD6SYPMasIP2hJQ576zKDe5aVcoSw37ZMW+no6+nr3bXNfIcx/2kedEuWQnAG8qKD6eb2jK0o3j7ztrBFJESz6w/+digKwvkshe5yTa5pcFj6EnswAJ4GykrqW+Zuc61CRqdsaZOhNejgjXuLj+ZYdJj/y802tobCP9E6pnVOmtz5QagcC2/nYKf8xVATjvFiWhB02G9oVY6JJOoe5w==
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
Subject: [PATCH v2 6/7] acpi: Do not return struct iommu_ops from
 acpi_iommu_configure_id()
Date: Thu,  7 Dec 2023 14:03:13 -0400
Message-ID: <6-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f60b06-8b83-4788-5937-08dbf74ec920
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6pjzyakgO6WZSkr+3aQ01y5dJ/yHRr0D72iug9y5Z3l6xhxccxNqDXerZanhpWhQEGZwHpVRp6mEMe5G7tHFpWUMr10zhou1uJ4b9c+0zf9WOxHIrX5qqnywMTHbqu2lCQgCXAqyKvJu5vXtzlFFaLxtJgR1C6GzdfyRNSKbpwdg8iKFGpxPTnz5PrQsZS+RaHuOcVSN+WtHq/wBEY5CgljFHUqgmwDU3P9inQvlyFlqfgzrTJkKSHWB/8tsTcZNw0Jy8dBD9NQNf0RnikeODKXzuKeRYXdmFSh73QOjufZTpiuYPNhl7MrRsZJ1M9iYbQnUKVDml0K+wlBMd9//ZqPKYH7zGKbFv9pFkioOOsE8k03a6s/11xyVJ0nBcCZu3sLrZZROoz4zYop1J5hPQ5XRXtaavxI40O882l36OTRQZCFJ0B8fwJppG2GXwGtqprQk8HJmDBlBiXu5z0Lr0fB2K+VfAmtJVZxxEqh4eUEu/b2IzAlz2qcGeHpOk7q9zL22weJSP0Y7ezEeQ67A0m0NknY+9IOkrOnA0QrEMlPHRvw+ClqB5DB6ybpfCjWC8VEm5MWx6PqWkKxiYvsKiaMZrX4ykIxqYBdBuuG1hzyhv9YwC7Pi4288JnIKmr4+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(7366002)(7416002)(2906002)(7406005)(5660300002)(41300700001)(86362001)(8676002)(4326008)(8936002)(36756003)(316002)(66946007)(66556008)(66476007)(54906003)(110136005)(921008)(38100700002)(6486002)(478600001)(107886003)(83380400001)(6666004)(6506007)(26005)(6512007)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eLqj4kaGAHzd5LAMIZQ/hZPM88A2h5zXgC28I+ZkNCbo7s5gQh8jQRwbU2tP?=
 =?us-ascii?Q?fe+ksUKz/TreBKAHf05cc8MmomeW11snYIdlPhYwxJg1bwrOciZeXZ5FP+mj?=
 =?us-ascii?Q?Wc8U76jXZ3+QckW6oda7CrxZ/WKIcjwrlHrpoq2+xCOsH0kKhWKv3grAjHM7?=
 =?us-ascii?Q?Kvv/vglQHm9HUbnt0UPJk3vt0sz8SlMGyBdNOdP3IyMwGv0PlYSCOV+jOvzu?=
 =?us-ascii?Q?OfNkdyrS9kiT07T1AJjIvMyXKwapp4vTz7A1RqkBF/pQFvFWQTMBtG0tJ+9A?=
 =?us-ascii?Q?NJt8r2RBxV+KIzgHuKhT83k/sbKcJmq4z8W71vmQAgffOdgYrXxbk1IutQn8?=
 =?us-ascii?Q?/ROrhtL+7mhUEvHcZmbGukfIC0ME+Mnya+ljHWGWxu0p+DABx1MIdSgXvZwI?=
 =?us-ascii?Q?Y+h4pTKjuY5tyJ5Vkp0xBhaYulqEsYoxNlrkLbXIZ5kaBND13q997mxYNFPu?=
 =?us-ascii?Q?QKAbHztOa6XMTsUXzmOs7P21Fg+Uokgoa61lGjwDWPK9IAP5sfpW2SKz0Ll+?=
 =?us-ascii?Q?80zl1FcQjoPDk02nTZ+DzBkvJFcwnJWhTFK5Jl61+iaYA7Ymwc/fiAdxNgeH?=
 =?us-ascii?Q?AhIIY2fO6W5KeduOPY4Z3paKcXKVIqRSMVnlFlDtMN47TRhuRohj9E3ma5jS?=
 =?us-ascii?Q?Mvc4VVwbAAOvqvpYgk27JtvZi8XqU0sldstMJeFMrt9KvBlD0Tas5luyQZy/?=
 =?us-ascii?Q?2OiSqNa4FqDrYsOjKNT1FY8Ou3xec5sf1A6+53Z3H19s/IS78hg49PHe+T+L?=
 =?us-ascii?Q?a2yACaKlh44G0ROlsYCCd0lcTxNHABGBMv1Euxvk+DBwpRoYwz4FpgkMujqf?=
 =?us-ascii?Q?2A1pu0XSW5yuEgnMHkU5UrlE6cgyAyvc2yikvqqFJrsHRhFxCKHCtKsdPP9k?=
 =?us-ascii?Q?hEemR2MOydu1f+huddRYF5JZMf6ZjG2XKeXfquimERvxRYyT4/PsQkz7bmgp?=
 =?us-ascii?Q?h4A3U5jeTEJ+SJ1tWB0h95SfEp8j9s8iswe8QwlY6cVUa1q+2y9ZVxqTH55T?=
 =?us-ascii?Q?GVMpW3/AHTYdlV4ChXn0K95xAvjC19L+EkbimJBj8QFrFXjzstFY6sKv2wEL?=
 =?us-ascii?Q?2I2rdk7QimDbu68JJ7hkGLfwRJ4ePl+JTjt+h+meQHSaDdWPL9/0XR9lkXG6?=
 =?us-ascii?Q?M6zuoqVh58DhY/vFHQhI8B2RMYa+ht6gLI+UeWDRw04JRpOLXorkVNI6clwW?=
 =?us-ascii?Q?RdHGSGHzDhVgY0+JDjnfAO7+MeBki8LeznhCGmI6Dk2xxSalPwuMf21gCQ+2?=
 =?us-ascii?Q?BSNl4NsD+z1o3Unai20O3FQhlbvNQRfqmCpk+OtXIQaGXTyHewjx+94wwq1m?=
 =?us-ascii?Q?IMp45nKQIf6B8qK3QLDQA+GjDCj6aSAaxeZVwCcE06L28h6PLaIl5AnrNB0G?=
 =?us-ascii?Q?38gkWGJHXcA4dLquVaJTlwHSJT/QgGmvJVLOYEgiTfWfH1rR+IoA5MHzxZur?=
 =?us-ascii?Q?CYSyfZ+M2zFaUF665EJpUQFUS0wjwtETJdWKOJ9DdSAHrRRg/rBv4UI03H4/?=
 =?us-ascii?Q?hyJZKq1Z+/O3QbBM9MIBX1da4BwBi+gHhapwewtizo3FvvW7FX+N2/cILDIu?=
 =?us-ascii?Q?Q8RLJAzjQxyEfzNMfW2GnHP3mv0GLZZgHGUnHSLr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f60b06-8b83-4788-5937-08dbf74ec920
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:03:15.8580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KreLPiS/tPu0PoY6hT4BaJs/2pHwl0AEbI48HLrDnJmtcTYizNJqe6V1LMlgUydH
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

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Moritz Fischer <moritzf@google.com>
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
2.43.0

