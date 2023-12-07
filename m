Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E8808F69
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4E010E95C;
	Thu,  7 Dec 2023 18:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ED610E212;
 Thu,  7 Dec 2023 18:03:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k97PE6L7W31jbdIIW9/HHhdyiJqyPTZ9F20OpxK6qVs76XCQBPefh7PxqIrGUNqTPO1qpkJDVRJvmuLeFqO2qIh6A+apny5vU//MQvHGwZhNvv1fO+zLu/6KgcK9RHIk8EqQPBBK2q4RhL7rBBvlVMMdzrKatpghOn7ct5RFsBaN+qtGzCMPsgNAIMUX38WaLyNKqpKcbCQ3hsONJ/R0J/TRJg8CZSCIeT6cE5+yqxOZGN4ZlLTMY+P8+3MMZaQjBq7C09/4bErOd/fP1ePKqEAeSwqFCdBjdcyUzJNWYegnpvnAwtiF8PF1ZfO5PwauQPESMmAusMHZgXQYba8A9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCySiyLqu+POjzCRPPQ62KNbjHdDqkqQMHZRHgOJQAc=;
 b=kPrdo8qTZALH13gWcK+gEcoJBMjVULwNJSqfSEVW3W1Pt0tYeyxzWg6NgiHe1lEDx8R/3AQM8ei4pHHJPnp+J7LXnw1aJJeF4DnHUUoyflwt6hYYILtKaZ2QCdA6rBz7mrJmTBhlO/2Glc0DA0CwDsRrrtZyLlN1prCCltlffnrLFl3GUeFet+bH8hoJIe3/S+OiajTKtSOmzlhOzpCyNiuJyPBYfVxfdBOlTfZZQbSt+mumgbTrl+ewkWieMumkqjVUKz/WBWjRRflsl9kFPkJfhN//YUlqU4AORqBvH9Gd03KG9q+fJahujWSmYmKBbYWjjn1asaDhMRPWTUeSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCySiyLqu+POjzCRPPQ62KNbjHdDqkqQMHZRHgOJQAc=;
 b=XI1JJzf7CkyvI8tkNg+U2WAcFLswXnptmYBqMCOXc6Lsut0SBqKsbvRmpMx8jcCoTNF/dQRF3yJteGpJzy3IHhUICFM3s6bNpVqPs1fJH0/RhVHurbU3Jw9SobAcsxj3hPMQu4yYXO0RMYPNU8l0heyK1nsCn550xufjL+gIwFfP2QZ+1uG1+mEtsIov3RLDXz0uNRFF7518XJFTGWP8yn8y3Q1fjEakZ77mUzYA7kQTefNediXefyccQMIbtR4QNl4gs1r2i+MD1OwfFXF5UJnqX9NCMVo9zrfMRbLNiQ3fwh0x3fkye2f7qfWnavycnWSWpny4Wji4uMpTUE26aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 18:03:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.038; Thu, 7 Dec 2023
 18:03:15 +0000
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
Subject: [PATCH v2 4/7] iommu: Mark dev_iommu_get() with lockdep
Date: Thu,  7 Dec 2023 14:03:11 -0400
Message-ID: <4-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:208:32d::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: be10007d-4d75-49f9-acbf-08dbf74ec8b2
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zB31Xwo8xTT0IQlVyTOSpFALZWtirXQ08TLtuYRAyAfguODKpTMPMXmEJIUrQN+GUgDPjOW9+lNQxkA6Ot4RKRHDsJC6QUSL2MWP4dJ8cDeDd0OLbD3JRqAT+6M1l9sNo1CAGQfZpF4w72RUQOfTH/tv6S9Vn/oRoGEWSmrSprshW2Marad3SeWtnSYi+h8YOikSBhtRQvRzNlLikYFIx/OCejp5KpzR6grVpfCM5vTg9vzOozeinAe0RRBqLnFWFVyYh4Plw4rc5YpkJGfP46v3zyFuEfq2HIaZw7PYI7XmJu8jlSwCMjD+ifXx6kmrHA0C/z/0SYYVav1pPKuCnwTWfBpHwMumU8xytQBFu0jwbfJzBlq551Uo9rWtADBst1Bo7M65FcXNUgDMJqGhJII0acO/bC1N9Et3z06GLmFmQYoN42m8DptBRt9wPkWLpvWAGxnGD+Y+eFcs/WCJWNf0H3BMuq0Y0P8dO84tjeI0iZE4+WTy9fiv8hOhDx8+szm6O80fwzStUPbPLOHk4BrKmR3Y+sjowrROy3eJzTgHjQGAQBGxMwQduZex1PTnUdf0YlA/W9Ts9F1SgEDbuicPXxLI6o2GIdPEZmtA+0Ge+1YDdKNweg1RRWnzKkhF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(7366002)(4744005)(7416002)(2906002)(7406005)(5660300002)(41300700001)(86362001)(8676002)(4326008)(8936002)(36756003)(316002)(66946007)(66556008)(66476007)(54906003)(110136005)(921008)(38100700002)(6486002)(478600001)(107886003)(83380400001)(6666004)(6506007)(26005)(6512007)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JsweJX/iMV05pHS/7MjTfWzoD9ABMJm4jHOkQ35cG1twZE9zgPr4TMrF3kP8?=
 =?us-ascii?Q?jFH+XLWot7UHyWuDFVdIUtCjNZwoSfn/RtoNMdi+AFuumEagqtutyqE0esSY?=
 =?us-ascii?Q?zx5atAG1QyGon9waDDbURLWjRNTojBXlCTxGzKUVoqUsfumFEBjnJyNaifH1?=
 =?us-ascii?Q?9g+r/oe5UY57YOeB4Zq/ydCLs/QCd6lVAcjPbBIN43E2w/2Wu8lAfw66mQx6?=
 =?us-ascii?Q?OZ84DzUBwka6UV7h/90kP+w/6un4Jht8xDabTNn5927qmK2rpe/mOPHhaKm/?=
 =?us-ascii?Q?t+6BGn5O//sIatKLD1VXNHTPxiHXQ1O2g97VTcVgWib0O2rfdKd94PL7e4vA?=
 =?us-ascii?Q?IwH5Ww8eEHHY7/E0Cr0sGio1Omz9ldjfoJ6WSgx12ywIx9Ci8Ef7WXBtj+f4?=
 =?us-ascii?Q?SGsWK3IzmmJlB8arAcF5YUOSvBCbn2MYm0OzyCn1c6CXz63ydxWqP+1AdgGi?=
 =?us-ascii?Q?JTfrQZzJmuYXDDR94Kse7jA6Ab8fUKIVj7bZGL+cTSrGYjkRkdIF/WOwfG2Q?=
 =?us-ascii?Q?p3SJ+Qzrc62R4bIEz+//OR59NGtl2zQAsW+YxNTxc94Nq652Fn6NoxvnZ8Ju?=
 =?us-ascii?Q?OJlIHARK5DkLgYm2DHWd1Mzr9fnInTeuR+zmfu83J+rOq70so+ggLHpGs93k?=
 =?us-ascii?Q?CDwab1CEFqWhyr6/wCLHdSAuT9KmlE8P+3DhmEdG2lTSonK/fQFO0PCTh/jO?=
 =?us-ascii?Q?Uvqr8afupgiKOwPwOCjvULppha/hStSzo10Yl07K+hAV83nOLh6dYo/AOyuj?=
 =?us-ascii?Q?/bfDP0SVJTi6Zxy+ZkIpsnEmHmcIczHBrIPqmhHvd0I5NyQDkhxR+C3V6iTk?=
 =?us-ascii?Q?OpgyvXJuQVxSAgJAdOo2VMyK6IFgkKVVIRk2uPzEQY7f3yPanPm1JYxALIQ+?=
 =?us-ascii?Q?Yat7qC9RssiYv9YxeuHhIQ5G9r6ILUWTzSsPpPVVL416dNobiXFgOys9tKt1?=
 =?us-ascii?Q?05x9TTcJSdm7q0jV3gAaASp34L8epWYMaeh43nV59U0oLIh1PIzGMz7iZYdY?=
 =?us-ascii?Q?3ty1QoNGAPWhFyKGzl/ARltEWETc71Domsh4g28VJwxZu5KzF8dctkxOSbEs?=
 =?us-ascii?Q?6Q1XCSNSNIQDgihW6W6pcTqyjOEYlrS0Kp/SI3maDrsahCUIkBj1B4ageDB/?=
 =?us-ascii?Q?TF6TG0Y6NfNLyX/Y5Uo4SJaQi7T67v3lg7lSciO1xBN1mwL3nOot2zFp5eHx?=
 =?us-ascii?Q?IQHFfT0CxByYSoP51EdKaFlZ68amUzp5g0LmBV2ey2J8ctQep1JPNiJhE0bV?=
 =?us-ascii?Q?ISw0YuuQ+0L1g2J3bGuBZ4Wu56W+VrZudch4A3Z9KaHVBO0vOHNppQlJHciQ?=
 =?us-ascii?Q?O4igXDLIUvtLf3nOTlgC5gVZmui5pwDKKXeW435igiRZw3RUS4lVmb8LLkDE?=
 =?us-ascii?Q?iKEMOylHEXQhI3UM25Ad+JF9pLyDPUvuJwvxBk0UKKGztAcCILRFUz9ZvTan?=
 =?us-ascii?Q?o30Ub9SJxavO2AoM9krrGtubAr1KUQeQo58XzWnznjybI2iqSbk2ejmgWxbq?=
 =?us-ascii?Q?aG49q+C1r75RgszV91kKbYtRrH7+L5ffAwUyrx+mKZNOqpn3tV1oe+nAFEXd?=
 =?us-ascii?Q?hOwbRgQoyUG2YTZEZOevfUUnDjC0BmavzhR75pa7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be10007d-4d75-49f9-acbf-08dbf74ec8b2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:03:15.2068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lieThUuRh1+FpPXFTEYv1mJDv/P5EhQSZ7+KvAdBY/o4zzTiaZQDkRcEBvV9kvWn
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

Allocation of dev->iommu must be done under the
iommu_probe_device_lock. Mark this with lockdep to discourage future
mistakes.

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Tested-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Moritz Fischer <moritzf@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0d25468d53a68a..4323b6276e977f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -334,6 +334,8 @@ static struct dev_iommu *dev_iommu_get(struct device *dev)
 {
 	struct dev_iommu *param = dev->iommu;
 
+	lockdep_assert_held(&iommu_probe_device_lock);
+
 	if (param)
 		return param;
 
-- 
2.43.0

