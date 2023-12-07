Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31213808F75
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EE810E950;
	Thu,  7 Dec 2023 18:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6E510E20F;
 Thu,  7 Dec 2023 18:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGhq2dr4HkZTioEHK6JRRysaSdmW7o7g+RWXbApo4mue8FC2+hsNuiOCHDdvOCO4doyNFbmbO6wr2uCMoxQ9yjmgod5eeUV9GRrTUqsB5iSilbXUEL32wLRzFAuMuuK95C9deSwHWWynltmgjUrgd8qKzUiW0EQybhdHLmXfGmTzzuf5wmF7oq8mV5+4TtaRfBnOFZL3iaj0fMy1Ir9gTSnEksoNkwaSc/YQJZW6lSRLq6CGBwTBMOzBbFGrIBSLq7vXXyZs+bejr+b5C5kZKvk5zmmr1a1jpg2+bwH5cYopovstPuF/M1YKpobaNEleSsB+WhpqjwOTDY85r7R01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtbACD0KyEnnKp4nvelyRe6WqB57167ZgHeXi882HwQ=;
 b=AwMZBm2O3lteoUktinnjfizcC69dGRUi1KQ6CY5dvw+COa1hyIZupXM+2uCg64WLUYTx9mbCphNBqBRFPtyrVXbJtgRXc1+SE9nGB6CziKZxFSfv75gb3+AFJknK5yNafigIq+M8COHWbLxUUJLjayCPFpB1kB6eGok6pX+EG6jz90A2Hv+X5qtAsVs0Og9IhAvz4qBapG03J3d1NNuFrBabawPrVB/56MgPEgJA3hFnGFULqFT63wcmaFyyraMBu63ysD5CcjPw3BwnAp2bBSerUwRTrUDv0llsLPIF9KekTx0JGAH9/XYPOzybpJadCyhYyJrbyaOkyAaA6D/3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtbACD0KyEnnKp4nvelyRe6WqB57167ZgHeXi882HwQ=;
 b=hV8r7sogOqrRFpg46x1a3xp18hqjpxOntAQCEf3c6LhB9vrrXefnQo02W8lKUL9renamcru5qEIOaaZYsXcBU9hBhTIMyZ816pxXeATcxRyY/0GGEReZFynq7ar5G0GH9t/X5s2fkCIrMPRfVJsLKxM9P8+AHlAPMYNqy1fdA3dZcfAY0WHB+cKKIT20nDFu6/7N9FSyEDFOq0i33SLoVcUFHcQb5ZFapUP7ZjQpCp0NLkDxJhxZhacfv5n+9WbHheUHym6r6ZyInTpkzIESyqw/tZwB4W+5cLwiKzqlT4SuGRTUIYNIHWua99HhjeJn3r7Rl5wqNpdYcqk1LUB0cg==
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
Subject: [PATCH v2 0/7] IOMMU related FW parsing cleanup
Date: Thu,  7 Dec 2023 14:03:07 -0400
Message-ID: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 285be75a-f859-4f0e-3cfe-08dbf74ec9e6
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3X5VVxjDwhiUlBSrgzeHhdzMHSXQifgBKRat8fV83G36N2R40qY1ZBmkT3DmI1lMOPyesxmDxRAzZ945RSCoSEk3lY43tE2pG4Ikmuemu9JCrsqK9ItwjD+wZbSCrqQmX9H/F/uR/zcI/S1M2LdM+xP0OxzlesH1GF7cSJEdluaYsdDLV//bMkiHM46WH2bno3GOwywNFexcpUciBwRN2CWb9bvBla5WsKCZql2+31uPNlbHiQIkbCofrHuS73nsCv4nLfR85DQhoBTmBiiOSAg5eHiZxlDask7Hw+KsG6My+r8+VU9zZayMKwxmICSVCVh59kB961/O/CMi78yxlpnJay79pia/Jpr6ulKfWSZbx7XNXOlRn3qwlT91xjanpVMVH2fhXTuplE8UDQxe6JJ8sBvCMJ8bkHnX1o46d2RrIEigh8vTwndn+xe26XgFRc7Lcu4PNwm1X5RHZ5uuD5opynraz33q9R2qf/WOGLiZo0vunUhka0EVzfCSCEPhr/EWp1r05H46mhpR9zQsX9PrnEQ1uW5SaS0thpna/8NBbaPuHVapnwgujYRhW/Ybta6l+mfZecKw6BU+FKgI7ynABVvjCOqvoNbyBXnZHSmY2HbavQRDr5Pxd1xL3foPTw627xM6UmURWh89sGX0Dw0ymFeziwtc95vm5R49h6s5ur3bO97A8LhlHBaNeyqX4XR+2RpkLSY4RP8N5o+/XQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(7366002)(7416002)(2906002)(7406005)(5660300002)(41300700001)(86362001)(8676002)(4326008)(8936002)(36756003)(316002)(66946007)(66556008)(66476007)(54906003)(110136005)(921008)(38100700002)(6486002)(966005)(478600001)(107886003)(66574015)(83380400001)(6666004)(6506007)(26005)(6512007)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?okcoPJ0XqOI1ipzg/sb0cxp8/YZrP+8ayzxab131skY2FgmnVBl8yi2qqhip?=
 =?us-ascii?Q?MomIx5z7qAMNZdwKNAmfWLp7Mpf5pf8w3SUCGWrqi1g2GhZA4sHffi1V+Nk6?=
 =?us-ascii?Q?StogYPt+MHw+/gls/N8i7eaXSFSMsf0zCqK+7B/WwQQhkoWjadxZgneWT79r?=
 =?us-ascii?Q?2G2FWnNhYbUcfaoryH4aQI5do0kf7ewuNRkkvLt/WMP1p5iGP5pHj1mArts+?=
 =?us-ascii?Q?s6mQdK14u6E/EjjdzMVFtl0hAzz/SGcESL6o8uD2nkeUnmjkfYluKy4cWVS2?=
 =?us-ascii?Q?P8NlndnfIMUIB/Mm9t71b+uFNXxidf7H90dt83DbltIfmqhWIw969A2mEdgy?=
 =?us-ascii?Q?mEiDS8RcextioEaNbyfkKsxDfzASuCPEusMPoFPA29eQke67rLiALUDdKUeH?=
 =?us-ascii?Q?SMm8/kDm/0tQs19NV6Sopj5eC6w8DQZCzJK4w4kosw+hqjMMwBZ2N5VFjgsD?=
 =?us-ascii?Q?UAMF+GPmQVYDNVDg6WpQDiWXQbojYHeiWDcZnC/RS/2AQJnldm7lp6EPSYz2?=
 =?us-ascii?Q?YPFCNO7AoinbRWMB8KmRZHi7tvNGJeDGxnehfHqVehMBXAvadg2ZkisD1t+A?=
 =?us-ascii?Q?iwvLH2t5Pn6NCgkEs4z7mhJL0PGJSmXiaukPShOpwSQmNgoyOCccxriarD1h?=
 =?us-ascii?Q?xFMXr3+nICfaNjdLxoDQqO4/+Xvj0UuAfL8i+6UnOmap3FAAnfMFHSPkFqbr?=
 =?us-ascii?Q?evjj8XSvsKYJFQc96bohYnyKBwpDg2IIQSRqEAYSyfhTS8z+giTyH++sBdq9?=
 =?us-ascii?Q?AqsApMhalfJp739h2Z1T0IRJ3B0oKMpahg7P6aQ2rAofJbtUlRNjVcvDCB9I?=
 =?us-ascii?Q?qqyvspBKVgcO46QoCKDcC6y5kOA3eCxz/Wb09SshdRBl+a22d7qG299pvI4F?=
 =?us-ascii?Q?+ACLQ2fhgEDBGz5+VOCBl6Yv8oH5XX5jcAZ3gqAnprgAL3dJkboO7VVwr5k+?=
 =?us-ascii?Q?hizpH84qH5riooWSJMTF+1m/77hVK7OCa7G5lieBGnu1FRhNbIgQ0MYZwoE6?=
 =?us-ascii?Q?vcEaiLgsmx3fccF+n15Ik/U1ZlKWIqpc4dDTqH5VgrjKPyjCgCOA6Hwd4vdl?=
 =?us-ascii?Q?VV59OZ+9Z0Sjhk/VGO0doMPipIgjmBt+oBBUNfQTkPtY8kGd3cLuSobFU7G1?=
 =?us-ascii?Q?C5dx9Z28614eSkDrduu7I4nJWjVHtUcp4tFR/tDDguUGQNEYPSH/4jYiQ8Zw?=
 =?us-ascii?Q?T6ofNgMIzIvawsszq4ANIVyR5YFE005P1CTbi1syzeJDMRUy5D9M4aAp5ZQX?=
 =?us-ascii?Q?j6dU6L4D85O+qFCLTJK/3LGJH4uqPv6T9MsbqlyOhmxV3kj3qrXYNQxx0/SC?=
 =?us-ascii?Q?eLPXKHvmT133/oDFOxhRC6vXuNoPqqgaJgfE3938ngDvIOJoTx5fzcOvHwDo?=
 =?us-ascii?Q?mxbvwnluRhnqsGw5/jmofNEU0YCYPl9+Dx7W4zfOXWus2sWmmmPutxA9YhSw?=
 =?us-ascii?Q?zVptHaDMQv/Mcmdxd8c5IUooz7pHJMRnrJKqIpUn0oMtpL5gN0ZbKnkzqYmR?=
 =?us-ascii?Q?wSeCy15SXIndHimQYH/aGdCjCX5jP0gu2+KyTBQiTqfVH8YbOKAJBrWGJWdt?=
 =?us-ascii?Q?7IFeq3jCPiZ2rIokx51sR/k/AFTcWOePDR7xvxGv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285be75a-f859-4f0e-3cfe-08dbf74ec9e6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:03:17.1151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KydOSEXXbTDZ0HhJjoCqDQZzi+V5aqI07sOgi9Sj45BYVzLt2wKWz7VKySZ8wMMN
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

These are the patches from the from the prior series without the "fwspec
polishing":
 https://lore.kernel.org/r/0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com

Does a few things to prepare for the next:

- Clean up the call chains around dma_configure so the iommu_ops isn't being
  exposed.

- Add additional lockdep annotations now that we can.

- Fix some missed places that need to call tegra_dev_iommu_get_stream_id()

Based on Joerg's for-next with Robin's bus changes.

Robin's dma_base/size cleanup squashes the first patch, but we can't do
the ops removal in the other parts without it, so let's keep it
unsquashed.

v2:
 - Remove comments and bracket around tegra_dev_iommu_get_stream_id()
   in gp10b.c
 - Remove WARN_ON() in tegra186_mc_client_sid_override(), just return 0
 - Push the locking change to a later series
 - Drop the COMPILE_TEST improvement, not important enough to argue.
v1: https://lore.kernel.org/r/0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com

Jason Gunthorpe (7):
  iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()
  iommmu/of: Do not return struct iommu_ops from of_iommu_configure()
  iommu/of: Use -ENODEV consistently in of_iommu_configure()
  iommu: Mark dev_iommu_get() with lockdep
  iommu: Mark dev_iommu_priv_set() with a lockdep
  acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
  iommu/tegra: Use tegra_dev_iommu_get_stream_id() in the remaining
    places

 arch/arc/mm/dma.c                             |  2 +-
 arch/arm/mm/dma-mapping-nommu.c               |  2 +-
 arch/arm/mm/dma-mapping.c                     | 10 +--
 arch/arm64/mm/dma-mapping.c                   |  4 +-
 arch/mips/mm/dma-noncoherent.c                |  2 +-
 arch/riscv/mm/dma-noncoherent.c               |  2 +-
 drivers/acpi/scan.c                           | 32 ++++++----
 drivers/dma/tegra186-gpc-dma.c                |  8 +--
 .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   |  9 +--
 drivers/hv/hv_common.c                        |  2 +-
 drivers/iommu/amd/iommu.c                     |  2 -
 drivers/iommu/apple-dart.c                    |  1 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  1 -
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  1 -
 drivers/iommu/intel/iommu.c                   |  2 -
 drivers/iommu/iommu.c                         | 11 ++++
 drivers/iommu/of_iommu.c                      | 64 ++++++++-----------
 drivers/iommu/omap-iommu.c                    |  1 -
 drivers/memory/tegra/tegra186.c               | 14 ++--
 drivers/of/device.c                           | 24 ++++---
 include/linux/dma-map-ops.h                   |  4 +-
 include/linux/iommu.h                         |  5 +-
 include/linux/of_iommu.h                      | 13 ++--
 23 files changed, 105 insertions(+), 111 deletions(-)


base-commit: 173ff345925a394284250bfa6e47d231e62031c7
-- 
2.43.0

