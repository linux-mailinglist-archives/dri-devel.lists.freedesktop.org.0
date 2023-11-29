Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8858D7FCBC1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1B10E5B9;
	Wed, 29 Nov 2023 00:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED3610E5B9;
 Wed, 29 Nov 2023 00:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xx/asRDST/v1jc2S+kAvAjjROSBfwXaiHvEahgnA48rco1JPm2Y3cw8ozfsBQG+MYFEjfxJboX7sV6H+I0M4Fr1YgO8LLnMqhdr2ZCFI5ckmMzkSfU7hhEaPOqZ+f1U17B5GTQRvJyCc060avX2keqD605HPcvWFkSM5WLMSLTumQJ3MA9LDoEMAtjd8BcbScTp4V8wvHRtNQf0XR6QgzoldtRwK8Zb8ODYQyX05Pw6WDf0pEzJ1hqyEfH8jntumKTkSIaY4lgiN7c8pfa9q7VSuDgpyIBDOfKdKgo+UjjHVpnsLPWfI+eHVUGEIUtN42Ajm8sIuvu9B1UQFgWjAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaNSYAFRz3Q1R3vAQtNkOR2EzhnKELGTHNx/ZP0hAKM=;
 b=EnqjHCI2FxZOeIYj25OTFecXDaX+yH86LVHjsTUX/oHxdTLhtJIS3ntDr5uckL30l7rMwTMHJua0V1ya3zHQico2zxg/DcvLT58kFCsmR9sNr76Ctw6HmU4571r+A8F6GWHt4R3d3hfCXi4PHv5aP6B4m39W/uzeZtXqyTPVoowhY7MLs0baY0KSylUhgSl0K6pvpxPjxNDRER4OepsV2Hw71jgppINiFhbpzDLza/1TRQ2vP050AYexNQZBRI5nlcMduSszjZwfeVDq1386cx3vUNjXqZrV+5Nxv0r8pfdrYGx8KuOS5deTKylv0pN2+99tfuwNq1e1Tgjn7ap+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaNSYAFRz3Q1R3vAQtNkOR2EzhnKELGTHNx/ZP0hAKM=;
 b=lT8dyh+O6Dzlqs8AiHME2pKkXOETZcFwGHX2rsq5/HHPiM+B9GdjVRfgZ6MJDyTwh9jMXaNS1XYDnbQS2XZQfUDkhLtyAA5P1Np48lgvNPx+peTE2Bw7vo+Qc3HZTtbyeliu2jgItKWCH3eazXB5OXEqpcKFoDpQf1Y8Q0xg+RgATo+matdP66rUZbKQ41nVYbHNgVUZsMR0fmbS3qwaTRBFXzshqeS3c3pFLAC4QbnUHe7CTcYNVm1h66rHon6J3HabKthS34NqNap4kvAS4MnUp71CX8DZ8JeUjJBa8Lhj8wqRItOafA6x6dscQ/oECJzgCbYChMku8HSEeraFmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA0PR12MB4575.namprd12.prod.outlook.com (2603:10b6:806:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 00:48:07 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 00:48:07 +0000
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
Subject: [PATCH 00/10] IOMMU related FW parsing cleanup
Date: Tue, 28 Nov 2023 20:47:56 -0400
Message-ID: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:806:d0::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA0PR12MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c6d7b9-d134-4d77-2b01-08dbf074da6e
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJmCHtOprH5vr3mEhMq9HHgfRhtkbb7AWwHecDgnQYoP7SJaLpkv3Uoz2FQ2DTCZC1ZUcDs8M8UzYJJGcjZJaH5QARZE7dS9icfpuvZG2Ey6UMhqjmc5h0KZqQtJZTr2wbrXwkrcv3vO/XPZ/DsNraBZ/Pz8RhImgRKdXpHx19sEY4p6ynixXiVViSluAlsnocHZOSK6yU4DMVzxyUz/9qWxg4CdqIjP4noGLMqdqHpFEuKfG2gIks6z1/Nm9g69X2uOU6lVouUur/wlIWQbQTxI9pWJBAA1FijxFj3QPPlJEtSeJqorosrCpIxnQ1eRUdXW/891anV06VI3idfy2ruFTP4p5yr0TR6aQ/jOuzHXWgoT9jtMcAPSoJPAbCv20dGNeTu2SwIBi6WVgSvlLYhrmlsbP3k64Fji6TpqBxVtq2Ms9eT/ZR4jfeYbXtekiZVGBc9Ey0cxeCG0HGf94ark0kKXXggFECa6pyx3+v+AejGJ70BjGRFVxaDiJBJYnC42KXrEUvXAqExFy60BCOBzyAPIA+w1DW1szlFrg2kpyIspNvW5QzZHW2UxuZcLJvkmOYqfdzqITDsq3EhltD3hN+W7zbMRV+FxB2uMo1cHpRWylFpx2qy9aidapWhrkfmLpIT15uCwgzHNsemHIhke9u9H7rfcz49CtLm2F/brO2g746bTgc3vhTQWbmj+0M4kkDt9NEjGJ71By0h/Ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(2616005)(8676002)(6506007)(6512007)(7366002)(8936002)(7406005)(110136005)(7416002)(4326008)(86362001)(5660300002)(478600001)(6486002)(66574015)(316002)(966005)(66476007)(66946007)(54906003)(66556008)(38100700002)(83380400001)(2906002)(6666004)(921008)(41300700001)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cZDsjQsY4hSrXRwViniLiGrHa5ruxVn/HNtm8tryMjQdYj1cKzOEoq9+ANBc?=
 =?us-ascii?Q?ZBUSqSnJZ2lgFA43qDzohQt9iYctQRtHyrWWHa9bewjvUlYeBixOZodpGReK?=
 =?us-ascii?Q?5fEIyXxX61tjYL9NuuI2gfp8Cie0Y91oeZoNT6qWz2FqI5y3XlCJt9r4rTfY?=
 =?us-ascii?Q?PI20xEOveiqxWaU2DazOz+mCtfKApcg4yCMCiExJOLRcwsqKmEndoLYosqFu?=
 =?us-ascii?Q?J6unUt1bXd1Rl3xM+zlMbeGcTlQl9NjO3lJ0Ubtv47p2Hvwmi3IqVPwTMsiM?=
 =?us-ascii?Q?O54AX21oBcVPuCsckqvscb8X6Ym6WHth2Eijhqadoew0k6ffvmGpk6jMZioW?=
 =?us-ascii?Q?dxHKvvh4bzzpgZrk2TPptyUrX6y4OCr5ptAv2cTsNsutQevn3naAImAAp1Mr?=
 =?us-ascii?Q?awAmGsOYwQ1T5aYpaJwlupY7+DbVc+Fv0v/EG5zHlgf/fZQwn42brwN//u2G?=
 =?us-ascii?Q?jAe3DCjBsnePfLDNjHCOhL1CkC7XjND6FijHA1/Cv58ltnr7DOezc7m5DLRp?=
 =?us-ascii?Q?nwGjkLMISgYAsqOp7BHak/M+goZUGttp5GcsWhnXj5pNCo+77IrbMrfFwiea?=
 =?us-ascii?Q?SZ7SvIe8u+3jDptUHKVCGo3DFPTnLanQp3/bn0w5345La9ONOE6acmx7mKP4?=
 =?us-ascii?Q?Dfus4Rx5VA0k7ZylKNyRYJw0VEHYzE8P2iu8Ysio0LzUkKwimHAXwcuf6Z5t?=
 =?us-ascii?Q?EYeg5/nOH/ow9YYAM6zNCcn/1s/knDKDpeo3bCfIAEwA62VIPn80f+27PCfi?=
 =?us-ascii?Q?LAShkSZnkeSpli8ux+raXFyrNZ1iqPeYlhZ2NFo1wqCGB0Q/Jqa9plCK27X+?=
 =?us-ascii?Q?GM1ifJwCmtR+qQ7B5Fb5FHaOqCl73UbMLyTDdbg2ATCnomh94E491DBIMSnX?=
 =?us-ascii?Q?E4eCOTt2Fod3DcEbH6agI9Qzu3TR3AJbqBx3QppCfbDhTNoSNfeL8jfUCR8o?=
 =?us-ascii?Q?rr2NwsrSKc+fYDUV2P0GUdt8yX61KTzGC/MhXwq58//XkxUNQEz07tH7iUXX?=
 =?us-ascii?Q?8wabeDyr+vQ539gWL3HRglwbn3Ik1pIpPuMA7lRAC6KaHHKJ9zxDU9No8/W/?=
 =?us-ascii?Q?9MONwpo2Ewo4wnPSEHGhZx0UF853NyiNshX+eYBRLnqE06eeufyzgG5Jv16t?=
 =?us-ascii?Q?Xfc0wnfn4jzB9RIBA2CIR3cmo7NG+Vm15ex443mOWJJ6RN2mahjTOeZlp6wn?=
 =?us-ascii?Q?g/jagKNj23oNRs8Qkjs3KW0eO7WJmRo8SXsZf/YEDHLEbcV219gkyT5lrrF+?=
 =?us-ascii?Q?M3+6DlYjuTpE9VDJwgOkLeErXDzOm9PixSnad2bYRcbORje7IA20W+23lZSD?=
 =?us-ascii?Q?Hc715XLZamYUFOcQodDPbMxt9SoVJOPnXr+7DeVyu8CWDrUbJhg+IuL/lQ+f?=
 =?us-ascii?Q?WxviplrhbIQRK2IBWFfzRjcXeMWAArUZVImnBKzUrxB86HfCuO1vph4+cO+R?=
 =?us-ascii?Q?187JBPereVQNVvcD/yGqmYbMGZ9WSbqOE4eleQhgg9qL2jm+0ziVJDkMvBbA?=
 =?us-ascii?Q?HOxbpw1o/gZEKJrgnmbTidD+3k965PE+Q/TIXpXjnDY5CaYP/lkH3YVnCod4?=
 =?us-ascii?Q?y6KBK8JUyga+14WNScqvPXJd10KFr/xFktNuHTXT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c6d7b9-d134-4d77-2b01-08dbf074da6e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:07.5940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEfzqlkw1HHG3xl9MBTd1WwWJ/OF6QmN42FXh4vatScpUwVs0i+4JtPms4lBDQX9
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

These are the patches from the from the prior series without the "fwspec
polishing":
 https://lore.kernel.org/r/0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com

Rebased onto Robin's patch:
 https://lore.kernel.org/all/16f433658661d7cadfea51e7c65da95826112a2b.1700071477.git.robin.murphy@arm.com/

Does a few things to prepare for the next:

- Clean up the call chains around dma_configure so the iommu_ops isn't being
  exposed.

- Add additional lockdep annotations now that we can.

- Replace the iommu_device_lock with iommu_probe_device_lock.

- Fix some missed places that need to call tegra_dev_iommu_get_stream_id()

Jason Gunthorpe (10):
  iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()
  iommmu/of: Do not return struct iommu_ops from of_iommu_configure()
  iommu/of: Use -ENODEV consistently in of_iommu_configure()
  iommu: Mark dev_iommu_get() with lockdep
  iommu: Mark dev_iommu_priv_set() with a lockdep
  iommu: Replace iommu_device_lock with iommu_probe_device_lock
  acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
  iommu/tegra: Use tegra_dev_iommu_get_stream_id() in the remaining
    places
  ACPI: IORT: Cast from ULL to phys_addr_t
  ACPI: IORT: Allow COMPILE_TEST of IORT

 arch/arc/mm/dma.c                             |  2 +-
 arch/arm/mm/dma-mapping-nommu.c               |  2 +-
 arch/arm/mm/dma-mapping.c                     | 10 +--
 arch/arm64/mm/dma-mapping.c                   |  4 +-
 arch/mips/mm/dma-noncoherent.c                |  2 +-
 arch/riscv/mm/dma-noncoherent.c               |  2 +-
 drivers/acpi/Kconfig                          |  2 -
 drivers/acpi/Makefile                         |  2 +-
 drivers/acpi/arm64/Kconfig                    |  1 +
 drivers/acpi/arm64/Makefile                   |  2 +-
 drivers/acpi/arm64/iort.c                     |  6 +-
 drivers/acpi/scan.c                           | 32 ++++++----
 drivers/dma/tegra186-gpc-dma.c                |  8 +--
 .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   |  7 +-
 drivers/hv/hv_common.c                        |  2 +-
 drivers/iommu/Kconfig                         |  1 +
 drivers/iommu/amd/iommu.c                     |  2 -
 drivers/iommu/apple-dart.c                    |  1 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  1 -
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  1 -
 drivers/iommu/intel/iommu.c                   |  2 -
 drivers/iommu/iommu.c                         | 41 +++++++-----
 drivers/iommu/of_iommu.c                      | 64 ++++++++-----------
 drivers/iommu/omap-iommu.c                    |  1 -
 drivers/memory/tegra/tegra186.c               | 12 ++--
 drivers/of/device.c                           | 24 ++++---
 include/linux/dma-map-ops.h                   |  4 +-
 include/linux/iommu.h                         |  5 +-
 include/linux/of_iommu.h                      | 13 ++--
 29 files changed, 124 insertions(+), 132 deletions(-)


base-commit: 173ff345925a394284250bfa6e47d231e62031c7
-- 
2.42.0

