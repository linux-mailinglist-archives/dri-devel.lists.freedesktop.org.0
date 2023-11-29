Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6B17FCC02
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4BF10E5D3;
	Wed, 29 Nov 2023 00:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D741410E5BA;
 Wed, 29 Nov 2023 00:48:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGmeeXWBmrYkXL8DKx/SCw2YKohrH7SEQG/COV2o/Y7GlP1z1ppSBWr8KRstGerkgtFQMS/U1IngFWK/4lNZaHpzyCvNaNjcuxZllt12CT473yNsSasXt/EYECLVC2ei+174kRdRGrPCoY/5B7nU46/llq9pZbAaHgFlJxrqnh1NhWOkBfpCYxnPs7tZbwW6+wS6uRt34mlUbAufcjO08TXMKypvJv2cn1h10EeaQWp918XK/itoGdz9mVQoVRunNPuw/5ygCJ/499ccJ1gSSguZs4l+M/91a5DNgWtfnUA/f6EuMoNIUkYdhfB2uSiZHcPeVCIuZ0rK0PSCukpi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hcrbjD8cADnJfNw4LlmVVHxWbaYwj8rWkX/H1ArtMU=;
 b=H9p/3Yu33qfinJ5Qb/pG+m+3hkiVZqYaAgE6XyuYpCi3MfO3kk+dgCeRaXAYg2EwXa3kKEuszFYueFIUcZBwTzHblXHOLNI0Ntpc4V7G0jJ5hPJbOzsL0nufa+Op+MExqJHo0JceB2xNMQ3Dvw2fsPO8djDyab1n5QHIUiJuL/4bAjPfwXUvl7MSzXzQ3qn2qqt+pLW8xXEJNXc9cUCcywVHLf2BV5hzMp9oDq5kcc7BkAyJAOHbnpCbEY1almvVKSZ0hjjs5nTejCxAntRtkuYG2gXAbQ4pVHPuvXjbjSJbmDcc9+inB0nHF7m1GCmhXlqSUnLsUFewBr49ZU2BqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hcrbjD8cADnJfNw4LlmVVHxWbaYwj8rWkX/H1ArtMU=;
 b=p4z0EQ61KuwHLBTJO0xbBUMiPCgFFAUIMRlLhqFES95dKusjjQGA08GrYqxS/TjElWwfefg3F73yxou5KUAwPG8EiFDPuWk7yfdOfCZuaqm9Se/cvyJ42CjqFv4ID4BAEE4aFBM/OdqrWPJrjyMVt1oE2g8+NDZRTzPa69XOt/P3+C64KpP4snr4FRAt3zTvJSQgOFwcB/L9BgtXSjMENgQoylv0wUylhxzQWlFxnSRIkVjjv1a3DYcIk/A03Px+ZPq4F2Pt2S05gROFlC0+mdSzzxTijpNwA+PqEuU7f8Tx5oOEcYIkO41laE7Oj5gghyIcC2fhyAEIKDMqb5aXTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 00:48:09 +0000
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
Subject: [PATCH 09/10] ACPI: IORT: Cast from ULL to phys_addr_t
Date: Tue, 28 Nov 2023 20:48:05 -0400
Message-ID: <9-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:806:d0::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: e971b518-71e1-485b-746d-08dbf074da8f
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AcpKF6Ahbc3YGc/Qj/MS759PWnEkGKy76gU01cUkGiSEROcmHrt8D+yTh6RTNv7EBTsGZYdRWdUl62hqSrv59VZMdJIs0OPpMq78ZaaOOaKxz5TnSVXihJxhtXveDBLiuVHctHOIv+nt5aT+FmvCHkTbQH12JCt0EUacb+5LLa2t6YFaKMXbaQs+lb1JFBf9CuhEYz8K/0Rhq5wRpLxKr3XGHXsYekZCuiWOep0FP3YaFu9tRs/Dz9gQ94+BzSN5uLSNoe4KVGIV9dGyl+RmsYR3iGqMLvmEKB5b26caGOr48M2VSUFO3Eui+aG0IjgksSkGsIe/oaMmZ9YogzY3yH8dWc5nH/1wqN0jGItVyAOhYW0HXqKBEYQM6UrNS6hWhw+pF50ekjZR5TwhRNbYhDVAkB42v/gE/CUeA7oBD6l4i2KE1uDBg85D+JF2LfbH0fOYBziKkGg8KN5OoK5PITeRLV1fvqNjyVWFw8KefYN9MItuAuWPSYz4PyIi7Y8GhU8hipDHCA8XoKPNcPIplXp7Wpu5OW+TlR0dsonOCFLRudTeKaRH9jFSVfcv7O+dnQHCcGlMKlq9Mw3M48Au4MQfIE8vmfDH9pSDL5da1q1dVBpn1nO6XWb8TukgozUVRfk46ZLokqWxhRAqJ+g1I+TBdF0JS1nqpteITYSPQwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(7416002)(7366002)(7406005)(41300700001)(4326008)(8936002)(8676002)(2906002)(110136005)(316002)(66556008)(66476007)(54906003)(66946007)(2616005)(921008)(6486002)(478600001)(36756003)(6512007)(6506007)(26005)(6666004)(83380400001)(86362001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/r2gq9P58jC76mYmkWHjFmnTf7K3l+MZoFLskFRrtRT5Qjh8r76okpIxLYUL?=
 =?us-ascii?Q?XxqNUM6WNGg43CEG0D2TMEZCLX/4NhyFt1W17Mji31UhRE9My+414elGPpZY?=
 =?us-ascii?Q?RsKeNltA54SM32JwJw1zMrz2wf1Qvcz/y8EcFb19o9/+u1oVNTKUiS1A6+qf?=
 =?us-ascii?Q?EFZdh4lDpeZzbdLLvXXynr2ZfHpMWry7mUaVsE4/ltGEcP1YbNruU8xccTZo?=
 =?us-ascii?Q?BCBUyvBkz8+hcKg2PloWVYuWPDnnPYE6zHdMJPdwAyPYlRIgzwbh2wvY2TK9?=
 =?us-ascii?Q?Qbj8JK5zPUFTEXe/7qjeP+hkz641rHK7MnPaRJFdyBhdp1mAGoHgHVfVNBvk?=
 =?us-ascii?Q?CDbKph1R2iqZzm2WTocKDh4+fEpEAaE6QKaJHaL9W400c+YQtlMlKkxo5BIg?=
 =?us-ascii?Q?KsttInH6e0VDTFEFqCbJhsnnyrJAopWdxGtrx9VdA51Aw4Bd2J3NDD5Y/lAe?=
 =?us-ascii?Q?GkzmIhbrtndDm8FcXsCEed1RkrP0ohIi0A6/LIjfyHNZG36oLhk2SYJcXDHF?=
 =?us-ascii?Q?y/tfZM2940ZrmSrQkUJqpC3f/azr8mCeLmsPcZOwQI/VCqPzRmOgHtAs+ULe?=
 =?us-ascii?Q?nmfhWq9/5Oq8EGRHYe8k3rNtwOUr9PlHQFHD00gjdzL/0EdY979urnHUntS1?=
 =?us-ascii?Q?a7nZVBscr7mqYdJqEz8FBu18CbReN9ETVi3mOLvsosEDb01hS35IgkoGPBQF?=
 =?us-ascii?Q?/euELNc3pCLZ1cI+MaqTY81aIVr+XVcE14Kew64bdISuuFWB5Wax/CHOh+Zi?=
 =?us-ascii?Q?x31UuhSvlI1V+/AwDlAiPbgK6q29IeJjsHR4X+rJVbmOMDghnAy+qJBscEXm?=
 =?us-ascii?Q?f3++jl7/7fJx0jfNc4LWlsOu8hw3fE8oFKlgJgf//acPs1byC7WMQLd62kjf?=
 =?us-ascii?Q?ciXlwbpYvpKo4ZkTJGfVNcd8F/jYweYJmjTM/jlMvTjtSbFImz4tuQe/jXJC?=
 =?us-ascii?Q?cCJcA+1ZKyFUXA9eDJb+9K7CknFmR/TQDXBmrgCFEoFO1OgViIrgmzitL6Ws?=
 =?us-ascii?Q?Yq75KL6NgexNhjyTXknMd3Rxc7IityDRFHgNf65TQ0GalnKu+BX4YLdROcTu?=
 =?us-ascii?Q?rq6924S0xBSLi1nmzM6bZ5qViOnRGJwV6fZx8B3YijGNMtmmLB6Y1PvuIsWc?=
 =?us-ascii?Q?RXWDTEs9hrocgl8Ueg1PA9ImQoUQiRRAOaGShKPPvC/wcuVLQ92iHF4O8DBH?=
 =?us-ascii?Q?tKJS4JpN+2EWvAoUUiJuqZlDWQCA6NgwnD1zwqqYQBQ9tj2iXFp80fiz1zHd?=
 =?us-ascii?Q?Imz4R6QQBouZvdIJz58MitTChxNjh+ZSmQWnvt8qMuqyDKr86zljz/U0Uyan?=
 =?us-ascii?Q?67zFAYmqHj2E1zaaYSUE8/uabOfSAO4nBuWFOec9bnEJzrldl9OonW6Frv+G?=
 =?us-ascii?Q?ojd/62rco9TF3yP1966CMYnh8JFWp5SZXpk9lK187u5SNh+VdJ6osVFQRNQ7?=
 =?us-ascii?Q?e0ZDCVVnnrNB1oYC3fhMRj0xncvKj36b6Z4vUZ4yF6aDzee4wDhj62RfNgn6?=
 =?us-ascii?Q?benbIAI0JguOjcI8PuaIKhHrXc3Vja8dT4CrgRPeqOKYAl/CgQpFerK5UCPO?=
 =?us-ascii?Q?EOqiAnzYBU+lxS9e2UV15BaAqmkZulPqoKuP1fVo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e971b518-71e1-485b-746d-08dbf074da8f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:07.7815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHyTYnTF9S021fymV4cIDXXPdCq1DUmxCZcjMGXqCVHcIgwBA5sGa3mxr3Udj0Bv
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

gcc on i386 (when compile testing) warns:

 drivers/acpi/arm64/iort.c:2014:18: warning: implicit conversion from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                           local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);

Because DMA_BIT_MASK returns a large ULL constant. Explicitly truncate it
to phys_addr_t.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/acpi/arm64/iort.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 6496ff5a6ba20d..bdaf9256870d92 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -2011,7 +2011,8 @@ phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
 
 		case ACPI_IORT_NODE_NAMED_COMPONENT:
 			ncomp = (struct acpi_iort_named_component *)node->node_data;
-			local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);
+			local_limit = (phys_addr_t)DMA_BIT_MASK(
+				ncomp->memory_address_limit);
 			limit = min_not_zero(limit, local_limit);
 			break;
 
@@ -2020,7 +2021,8 @@ phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
 				break;
 
 			rc = (struct acpi_iort_root_complex *)node->node_data;
-			local_limit = DMA_BIT_MASK(rc->memory_address_limit);
+			local_limit = (phys_addr_t)DMA_BIT_MASK(
+				rc->memory_address_limit);
 			limit = min_not_zero(limit, local_limit);
 			break;
 		}
-- 
2.42.0

