Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B87FCBF9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E086810E5CF;
	Wed, 29 Nov 2023 00:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE7E10E5C4;
 Wed, 29 Nov 2023 00:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiERAMtfGYidxTEi3emztX1Eva7sU78naAuhRlqBGr7gyrxinQZ3ykLxtfY1TxY+joeJoUsc5OlVoR6eXXlRKez7q+QtlzG3Ian4Fq/CkyUFMqj3Ms2XcPS3VN7Mx4x2rX4yxQB2FP1V6IffIhE5gKO2Jfj8nD1kEZ11zr7bE89jTlLDIKiekPISFWZrGpFcU8L2LIYJ3k7IqZXWKK5qzv8ohJVMlauYSuGOB/GLVWzBVN8Ys6IWNiljvafnmmrEpUOuVKBXRa3kEqw79XbCSRWlM152u/aV0gKvsPbU/gLilPZnmw7JT8HN9wSPh4NuPoCmRWu+AGRTs9n4CrmGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g166tHUSGkVeRbErICgjygiK2MG0vGzd/+gwhQ9Syts=;
 b=h2mOg83omH15RV9qcy7Z+BBBz0UUE064swz85q/yDjvksjnrBwPrFZ1gMb8Y9W+883i4eBHOv/0DYihllxp3HoheA7t8XQLwxPle+0F33n81l7uy2WCHPYw+0GK9XzGQFT0YJFPW3aVxMUl7K5hpCpsQRNg7X9wz9Sk707BbBVzmkJhio/yxE8v+/mig56APTXZvPrZI2O8jdS+Klg26+4KdLN/QAzxeDveWI5KlKjpVQRSZrF5shI1PWWnmWs+dNgP61UCWkpyxMPMk8lJphteYYyr6dEJbu/BIM7Bm5vMQHCndKxjTX7bzf5aGYRJFBOGb3eoqhsBkMylvlAV5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g166tHUSGkVeRbErICgjygiK2MG0vGzd/+gwhQ9Syts=;
 b=N/iXvLmFZxWQUHXhCy4HhUrCnxD79WDWhk2TG7Xzh+yYC7ZT+JI2aW+aGdz0SzSFLPC7f9h5vRgbjATBzBBrUYaRhdjNiaXsfRPZFFktgO3vIJ0QLDRyDE3AN+hxL4KFIQB+kQeOQu3juL9YA+GxBoyKtLYY4g6gDXHDQIiPYsJ1ZSbK/WMO3AlaJrKZX6/u28C2Xpb0xz+wnjTgZzTsSL/zV/JsprH+L+xSbHtreH981ScrJMjy4wZkKk2DpMnhTNDbOiWY923bIg3T0FODdkGh+m0/kDLDxhNZMbQe8PbdUwOFgF3CY/lT4JX/DUY8ysC654UzDzuVChbIXfNZvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 00:48:11 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 00:48:11 +0000
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
Subject: [PATCH 06/10] iommu: Replace iommu_device_lock with
 iommu_probe_device_lock
Date: Tue, 28 Nov 2023 20:48:02 -0400
Message-ID: <6-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0194.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 8536a7a9-4d35-47de-3bfe-08dbf074db6a
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PxS2FBkvXWMjSWU1n2OdknlwkOgcJ7RywKreiC8AoA2LZtZBfPaBb5dp9VlPetsbepLqNtKiBxvcJ66fh5n6DdyHQBMH4LuYs2LhWE/IGP069pqR5CyENlcYk0mK6OBvMWDYio+y1rBDjOTDP/aZLT5OKqA7aEXbsltjdyCdDkIu8H6LC3zz7keZWyFQvsPDd+25kNg3QVB6joZtmWRERyJ8Rfcldm0+8eoJ3aeNa3d29PXBGS2dBRybXWXcm+BascuXafiykoezcReA3BuXHPP/1OItgsmPpU3UloJExGi7sQbFQql588g8VK/GiOwA+5fdXiF4oR2dOZeytz9M4vDgmqp5/0iKUHMOrN/4+O+dxTuX1gCSAQscpAoabbIG+aAprz0qVSW4jGwhsLdEqeX09I2Ny/1Wy5hLE3yGTrboEwcoVlffdmG9brgDePdfr/Gq60sd2CDpz6+W9+EHvONC1DdrsB5Tfzg78w7+BhLlNoJYHYwt5F6c04NbX2Mgv/yEGU+BRE+FxNqq8kmuqWY3ob7+3lVnmqihoMwwDIwggWJd8EfutjV5LLtaMYKUmbmfbBJO6NW03TTcDiGKMlyX2xGSuWN7F/4LkNEEN+ADERFHa9eJNR/jJuxpguay
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(7416002)(7366002)(7406005)(41300700001)(4326008)(8936002)(8676002)(2906002)(110136005)(316002)(66556008)(66476007)(54906003)(66946007)(2616005)(921008)(6486002)(478600001)(36756003)(6512007)(6506007)(26005)(6666004)(83380400001)(86362001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IFlViVJx6CBLEjamz78Y886lbVHMNJCKbrz+kHHPpM7mbMyJNPnPN5+9TeRd?=
 =?us-ascii?Q?V1FLiH9QbgXDAERDtyRD+q0psUz12S5gxWcVytHIfrDJLg/d4ohepHVHdci2?=
 =?us-ascii?Q?6bfM7jf6BvFmisj8Kfn6pdHGN3R1T84bKNT2R9hTxOYZcwjOM6NXTstGgE+i?=
 =?us-ascii?Q?apkuiBvQTHg4aUl7lqOs0KteTIbVe88ATpIeaxDUxWq4TrOKJjSDthqc1Ez4?=
 =?us-ascii?Q?jzHEFbMvE8GmbUcBTW84Z4bxxybXO1oMbup/zCj+Kh+7o3PKLqIHQyXNr+RX?=
 =?us-ascii?Q?0onbE4E8Kw6PE/s/QwscFQVK2NJUfmIpdwLsfRTehXPbB5iAHjoxGSwnddoy?=
 =?us-ascii?Q?5HwMxYmp2FAi9uV68y59ZJNLWXQR6+DlOoxmUAM1BvMKoHyZ3Ft7wxEZAa1g?=
 =?us-ascii?Q?f6EHF2DzUh3c+KP4dvLGG81Jb2f3SS1SzXU0fcgKMowQc6QzQeilpii7bHIk?=
 =?us-ascii?Q?AMr0jwFlRJD7CbLf7fBI1BUXXUs1oFIpHeBi6O/eeeW1J2GfaFI6TUHn/Cvt?=
 =?us-ascii?Q?w9dCeKYUTY9UbjmjSq0dqJpDPNLtuWThJqm2F2THiA3UmmcbUJGeEtaxItdf?=
 =?us-ascii?Q?tPcgg+OQBAonmDBbipSmk1bTdBlfPEhbfTd+4hEEm8sI+fi+QfvbZcyO9/l6?=
 =?us-ascii?Q?UFNfUAoHHaKgGbZbklPtjKgORk/lugLB4Texzo9tePQZnrVBDV6wBpEISyfo?=
 =?us-ascii?Q?mdWN0u5RC3Fj9FnTxNciCT0fg5qh21nMLnE6JVPkhFmRzk1B7XS1j2e5NAlZ?=
 =?us-ascii?Q?L9SbJrJf9QscgJCa1LWfXbs16R5DVz0A7TySHwg21XrJMSI9VUwTjdoo9ZJS?=
 =?us-ascii?Q?/AJ1JnX6twk3/yD2ntFEeSarFtMB4oRbk3kz5XO5GlzeKtDN4Aydp0Aa+0Yj?=
 =?us-ascii?Q?PUHTezy1RIPy53j5tFCwFQU1c/8+4uO49CP7SLoe5VhtMIa3L9ASa5x0UX6P?=
 =?us-ascii?Q?iHviAHkOZozdGc3CYm9cAiIELX1FSGFamXragpJD6D38ErBorW7crA6HkEEi?=
 =?us-ascii?Q?8iWsjGZpqYZmtUGJG9idtLLPielsmnWy/HpJkp1wH7kyfJWBAqwW6JA6i6jD?=
 =?us-ascii?Q?HemSSwqgDzWZwIOOQL433feffgk6Pw/Vd811dYKHbldShfigvC58RSqP+10i?=
 =?us-ascii?Q?zw2Af7R6DT57nOLR7V/Wjcymf78Jm4G7yoL1KOo+V/Sf8roTtx34yYUMb4aK?=
 =?us-ascii?Q?rXNad30Q5TfvJugGXuprGQVaOe9FQt9o2BXRxIF1Y0N8xHAz6PtV+qgw6NXJ?=
 =?us-ascii?Q?TDtN5dGVRBPT/A1nb2kwjugcmEChVDA7Du0+iOT1XuV9VvI/uIeSKPdk3gIL?=
 =?us-ascii?Q?JxB5n9aF/RAaRuVujPK0ePgt+ojR40PoffD58io6Fo23nrDRZqh12hS3nEdp?=
 =?us-ascii?Q?CCqWESohmcd+jNN3jLLMNBlV5VUSspAfEH5GIgPu48/jtFxn7HyEMj9z3OoX?=
 =?us-ascii?Q?8IzCj1I5KFlL/otuYmFK3Kt63HjGbgYUGytF4Nem5Y7M2EZaaSLAinZFx1HU?=
 =?us-ascii?Q?OaGCnoR/FLFRl/EAPWFiYJKY1MG9uV+3/Cw5+lg3I68hIgkyXdZZAllzzigw?=
 =?us-ascii?Q?Fj1uhZ0IUCVjKDDAFd9eYAJ/vmqWvwz7JBWCK1rO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8536a7a9-4d35-47de-3bfe-08dbf074db6a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:09.2376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vU8nM8hRTqWQk/nZDor+27mpHqRBzU3fNn/Vj2pJuFDohMSLaOPZEvzrbRjxh0aO
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

The iommu_device_lock protects the iommu_device_list which is only read by
iommu_ops_from_fwnode().

This is now always called under the iommu_probe_device_lock, so we don't
need to double lock the linked list. Use the iommu_probe_device_lock on
the write side too.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 08f29a1dfcd5f8..9557c2ec08d915 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -146,7 +146,6 @@ struct iommu_group_attribute iommu_group_attr_##_name =		\
 	container_of(_kobj, struct iommu_group, kobj)
 
 static LIST_HEAD(iommu_device_list);
-static DEFINE_SPINLOCK(iommu_device_lock);
 
 static const struct bus_type * const iommu_buses[] = {
 	&platform_bus_type,
@@ -262,9 +261,9 @@ int iommu_device_register(struct iommu_device *iommu,
 	if (hwdev)
 		iommu->fwnode = dev_fwnode(hwdev);
 
-	spin_lock(&iommu_device_lock);
+	mutex_lock(&iommu_probe_device_lock);
 	list_add_tail(&iommu->list, &iommu_device_list);
-	spin_unlock(&iommu_device_lock);
+	mutex_unlock(&iommu_probe_device_lock);
 
 	for (int i = 0; i < ARRAY_SIZE(iommu_buses) && !err; i++)
 		err = bus_iommu_probe(iommu_buses[i]);
@@ -279,9 +278,9 @@ void iommu_device_unregister(struct iommu_device *iommu)
 	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++)
 		bus_for_each_dev(iommu_buses[i], NULL, iommu, remove_iommu_group);
 
-	spin_lock(&iommu_device_lock);
+	mutex_lock(&iommu_probe_device_lock);
 	list_del(&iommu->list);
-	spin_unlock(&iommu_device_lock);
+	mutex_unlock(&iommu_probe_device_lock);
 
 	/* Pairs with the alloc in generic_single_device_group() */
 	iommu_group_put(iommu->singleton_group);
@@ -316,9 +315,9 @@ int iommu_device_register_bus(struct iommu_device *iommu,
 	if (err)
 		return err;
 
-	spin_lock(&iommu_device_lock);
+	mutex_lock(&iommu_probe_device_lock);
 	list_add_tail(&iommu->list, &iommu_device_list);
-	spin_unlock(&iommu_device_lock);
+	mutex_unlock(&iommu_probe_device_lock);
 
 	err = bus_iommu_probe(bus);
 	if (err) {
@@ -2033,9 +2032,9 @@ bool iommu_present(const struct bus_type *bus)
 
 	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++) {
 		if (iommu_buses[i] == bus) {
-			spin_lock(&iommu_device_lock);
+			mutex_lock(&iommu_probe_device_lock);
 			ret = !list_empty(&iommu_device_list);
-			spin_unlock(&iommu_device_lock);
+			mutex_unlock(&iommu_probe_device_lock);
 		}
 	}
 	return ret;
@@ -2980,17 +2979,14 @@ EXPORT_SYMBOL_GPL(iommu_default_passthrough);
 
 const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
 {
-	const struct iommu_ops *ops = NULL;
 	struct iommu_device *iommu;
 
-	spin_lock(&iommu_device_lock);
+	lockdep_assert_held(&iommu_probe_device_lock);
+
 	list_for_each_entry(iommu, &iommu_device_list, list)
-		if (iommu->fwnode == fwnode) {
-			ops = iommu->ops;
-			break;
-		}
-	spin_unlock(&iommu_device_lock);
-	return ops;
+		if (iommu->fwnode == fwnode)
+			return iommu->ops;
+	return NULL;
 }
 
 int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
-- 
2.42.0

