Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CAF60D36F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C390E10E252;
	Tue, 25 Oct 2022 18:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE0B10E2F6;
 Tue, 25 Oct 2022 18:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aX9BVfGzAZcierof75ZpFCiXnuZRPDrl/Qj+HLx66N+tu6BF97xrBRDlxGljXKaa1GyIAtx2ulu+eInJY2KMKjo8p6U+UCisIhN2W/hr0ieIOlfpk9HtbmzHhd75a0zLAIsOyyTZ/9IsQTmGwcjq9RCDJwI7ml8BHL7u5b1ha9KUJLUjTA1L5cVY1eBgu4+i0pMmBTBnFR4+JSW06GU50Y2Q2nMKl0b0Ugl014x1xSCFet7rdcTNHFeAPvIWYphXe0AHk2xbIzdMCUI/PMYreOutxARC/Ekc0Oxit7Zgye0VSLkTv/3BJmLoQ+pd2nzOYdR9GIxd7Ggq6of0myIltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRueVoYw/JF9kp/rE3fyoFfmETyjYegi/GZzU6nl4Wc=;
 b=EK8a/nsrF5muUOuFz+Qm8HIYXWY13sX+MwzKWr77hnWRbKFo2Uji+glKMq1hrN3psB/1mkXuzNkQ01kbpy4BINHg2ELukUPoSPgGPss1hDkhOc62oaxAgNvo4up5WlW/+jIAll+ZlmR0iALHxrSj+s3sM84P/tXclu+WtH0c7Y6mj8x3+/jLLyuW9DY1H8clsje4jHmb4L4Z+HE+5Q2Y3xFWtmD9T33EqTrEGuCg5UtkJFL4/UHjtlbJnBnPfFeKx5+GB3yGO+Dg9dmNs3GJhRqebtYl+7xXNAI0kCdrANSIm3i/swcxuC74R9VFAOytTm9+Sp47VRjPqSAqCWw3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRueVoYw/JF9kp/rE3fyoFfmETyjYegi/GZzU6nl4Wc=;
 b=Mk26ytwgqR5Bq63zX0p/qfGL18ZMDNFXuoRPr45I/i4KcrhqI4QV6dCl2cI78xoY/bxRGHpht0FUXxnZDg+cq/mt7EoPmNBVFT99PyTkRp1rSg06NtoBT7tWr/dFgC0ggUwqcExkY2LaKs1OoPgKvHai6Af/zMZ4/82wLdRlVUBCA/X3Uq+w8FgmHBG+Af0nfKvLrKdiQt9OsgZ1H3IIzsBcvWAC1EKNRCpYQzcMiROJ7Vlq2wGWfqF1GGsl34yKuBxBS1i1kLznNFCWPI3B5vWqyMc1zSbljpguznI1u3SDQYu/XYgFPzEoQLwtHDLsdx7vNzep7KDtDVG2VqBbVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 18:17:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:17:18 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Diana Craciun <diana.craciun@oss.nxp.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 iommu@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 00/10] Connect VFIO to IOMMUFD
Date: Tue, 25 Oct 2022 15:17:06 -0300
Message-Id: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0030.namprd11.prod.outlook.com
 (2603:10b6:208:23b::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5b7dfb-0a62-4447-6db6-08dab6b52687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2iYfj3Gn22pWwQI5ESHMi3GZD4bY3yRA3lbFZAcSsxkEyb5sQYjiqyUxefgOsLls0sG0ybtYBVodCgxXwxwRoOGgpBGWV8vrWcgcSRT0rQIUd1lhdVLXbFVBkQVcWpaD1xfrAoMbG+JjydefDWUOdCKZkMXDUziBR/iw4rwyyzd3QuMWM3TxuR1GXcmB+0tqF0PN55U25B6LK3e8R6jZmrTLnyw5jaDp3TJWzorwRNIHvTau2aUcyQNW/OwpyJHiLl1znSvu5WB8AAUlrnSPm3069VGxQOSSLknALU5NvLkduGbKkA0L+zopdYY1nXZRzQZCh9CAWgyh9/KN6axXiewfsJyf0SiIC+Ak5uNAdPoKL54QE/5BKAjBnUwGhQjAEiZO5Ga26WyTdciZ9UeIxLbLje+xLtrHjwL25bn6YNEFUkF4uAT7mwp8yu3ruHSNVLZ1wPO3cSoVHL3Nne4Ge2QcajkFMIHkd8KOEECTzyOASsy69gGqhEmUACnW5jbb99mti6OdCrYbBDVF3iWxTu621VOU5Zaa6DD6DF6rWJuJ4Bu5GkIQlgVnaEuAID+vNdg7/NRRLNWTwt6+dl7+NYAzLjQL4sjDCXRly+Xo4ZEmorVYmoooboAeDWIvwKTMbIBAqm7KmZ/dhuv2GTYdSHLsAhBz6SQpl2WKo4x+d1DvUqpq5uS8EJoMfrFDWVulsnkT2myD4YoZ74IM9+rdp8xMiEkoqst+Mtm7nuhWiPZbvQIUrdEjE+gRuxEVUjMZrXLsJKZFDKMjmlGI603YquSKmkckA2zTplMYmEUyMqH2oBWFOA3WX4JJBRPW0ZkjAs2PPDNFpgq6Z4G1MIg7yeRUgtFaOBWhTwPGOpjwuEnutFVwhDiq5IM2OmbuFjnY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199015)(110136005)(8936002)(54906003)(41300700001)(6666004)(6506007)(921005)(86362001)(38100700002)(5660300002)(7406005)(7416002)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(2906002)(478600001)(36756003)(2616005)(6486002)(966005)(83380400001)(186003)(26005)(6512007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TxNao0mixEGN0ITE+MGILZp4RElXTmOLZG5Z8OEoKkAToQKsuDPlwBoPH00M?=
 =?us-ascii?Q?auCazROVLIdF9c9WwOX+PwLEsvwCtownKLV1DGh1pKpD3zZZOuII288bjjeB?=
 =?us-ascii?Q?jRbZJ2iGsnrHGA9F/h7c9PsuCYA+wmVtlhWPksB2yZEMUQsKY5+N55SvM1Nd?=
 =?us-ascii?Q?8F0y9OIgnhKikci+sbdbfKk6ckQsrEl39zUGbLYk03R/M74Y2nQ3DCdZja13?=
 =?us-ascii?Q?YpcT8v2YxpVfe8qwnZMyND80ZXDVgPuSjXbytX/zJhUVHLG4E50+yPrO+5tm?=
 =?us-ascii?Q?mK8O2R1+o4ZQv+2PLz99dAYyLF2pYQRog5ScZUlMOww9+uEaXSsZtUztGddS?=
 =?us-ascii?Q?qoznHlQo7wF9uhJcq26xD1THi7ISAxKq7LZ0hcH+AJuAKvOJM7TllfkZdhRu?=
 =?us-ascii?Q?AKMGuljSGAb9sQnL9dRlFuiNNiA30/eG3SiPXvt8XeoTkNYkpMl9O7ir22JZ?=
 =?us-ascii?Q?+Y/3vFri3d7gzhA9/to6U304SMmWxBJAAlOA8fjxcymc+iI8H6CjSQv13K/e?=
 =?us-ascii?Q?m17jSG1XM8oUUmzRg8maHgaBbMNtHeaKmg23tuwWqqWEiwdVXE4CbhQEhnCW?=
 =?us-ascii?Q?6qigWkOqA94ObZejzj7OSyvlPk3/VZW8MJ5sNIB90C3/wJAs5+XG13viOrL9?=
 =?us-ascii?Q?2/IOFq3Sb36p8CfET/xPK81QkXax31wweKYnqhddiW7vKicGBYaMw2n7Mczv?=
 =?us-ascii?Q?pQ9yV2kgi9Nxo5Hwkq3JAer1XSmT9NmXNy0saK1h4HFhFh8od0iGTWoPsVdp?=
 =?us-ascii?Q?+F9eBeoPr7DEvhC4iJp2cLku1mS17pS3Gi1ka6tSLrACy48M5bypXtFom3L9?=
 =?us-ascii?Q?EOoIevbEhOLWoHWHFttE30iDG4c5CoUuCG4Eslj0zl9ayYfUxmvhndhHzcUh?=
 =?us-ascii?Q?fWG3YyfshhMzcJy9tmrnicd7aRH3ZE68G05/XuLvfWm6/p2/lGJZYRPpx/ho?=
 =?us-ascii?Q?Dt7fKssySzhmHxLk4qsUPiAWYtWWvwspahYUnH2JBkvBpsG8G2UszmPSC2My?=
 =?us-ascii?Q?zAUiP7yC8yEW6JgNNaTptKDj+W666HLMoAXe5yz+M3rucuR9scO/ns7pWhgC?=
 =?us-ascii?Q?NL9cZXk1zmtwvWRqupNCjVyIVRVGafxeYoTBDD9aqLiN7ihd6GWofnrMl4rJ?=
 =?us-ascii?Q?rlsfViobZs3N0Hzmr86PT8ZwhO1gNesWMemAWHMXYuySpmyFa1tmchFmqmaZ?=
 =?us-ascii?Q?7FPP+RHhS228HkkXzUHTLl9e7Fjd2HJvrrnFYmnE7SD2sunTC3mExq6b3Bcf?=
 =?us-ascii?Q?HEB6xG0zYORSXEq6ryKs3jrP1aD2cl400GWrgUn5f2RBdkTQvRNRTtmOWlbI?=
 =?us-ascii?Q?ugnX7VMOeuq3j1hZ9x5b04L4bvD04H0xqVIF1QRhalHP4jXW3CfpGgu7j4VR?=
 =?us-ascii?Q?r+of9wyg2tzWJ/6+AzJDkU1zbTQUwXejRLQbG7HkZPrAs2LSXKDJcI1W+wnu?=
 =?us-ascii?Q?jznpR4NF6ZMMAd16VLhpnaRL4silxfCZQBAkc+W9poglO9iWrfjMBGEmvCBF?=
 =?us-ascii?Q?51v/GqgaPvjvSrF5Rf3UfrvrD/iuy0pifvacTJ0+Z5u1jBPdZUrYGIVxOWG7?=
 =?us-ascii?Q?DIzDQt78EE0C61uV6Ec=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5b7dfb-0a62-4447-6db6-08dab6b52687
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:17:17.9029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaOjz49/fHxQltK8xvbvBIQFNj+c+MXx1oMJTMKGGXwQ33sewd08zzyWNPk5XUYm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201
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
Cc: Yi Liu <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series provides an alternative container layer for VFIO implemented
using iommufd. This is optional, if CONFIG_IOMMUFD is not set then it will
not be compiled in.

At this point iommufd can be injected by passing in a iommfd FD to
VFIO_GROUP_SET_CONTAINER which will use the VFIO compat layer in iommufd
to obtain the compat IOAS and then connect up all the VFIO drivers as
appropriate.

This is temporary stopping point, a following series will provide a way to
directly open a VFIO device FD and directly connect it to IOMMUFD using
native ioctls that can expose the IOMMUFD features like hwpt, future
vPASID and dynamic attachment.

This series, in compat mode, has passed all the qemu tests we have
available, including the test suites for the Intel GVT mdev. Aside from
the temporary limitation with P2P memory this is belived to be fully
compatible with VFIO.

This is on github: https://github.com/jgunthorpe/linux/commits/vfio_iommufd

It requires the iommufd series:

https://lore.kernel.org/r/0-v3-402a7d6459de+24b-iommufd_jgg@nvidia.com

Jason Gunthorpe (10):
  vfio: Move vfio_device driver open/close code to a function
  vfio: Move vfio_device_assign_container() into
    vfio_device_first_open()
  vfio: Rename vfio_device_assign/unassign_container()
  vfio: Move storage of allow_unsafe_interrupts to vfio_main.c
  vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
    vfio_file_enforced_coherent()
  vfio-iommufd: Allow iommufd to be used in place of a container fd
  vfio-iommufd: Support iommufd for physical VFIO devices
  vfio-iommufd: Support iommufd for emulated VFIO devices
  vfio: Make vfio_container optionally compiled
  iommufd: Allow iommufd to supply /dev/vfio/vfio

 drivers/gpu/drm/i915/gvt/kvmgt.c              |   3 +
 drivers/iommu/iommufd/Kconfig                 |  12 +
 drivers/iommu/iommufd/main.c                  |  35 +-
 drivers/s390/cio/vfio_ccw_ops.c               |   3 +
 drivers/s390/crypto/vfio_ap_ops.c             |   3 +
 drivers/vfio/Kconfig                          |  38 ++-
 drivers/vfio/Makefile                         |   5 +-
 drivers/vfio/container.c                      | 136 ++------
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |   3 +
 drivers/vfio/iommufd.c                        | 161 +++++++++
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |   6 +
 drivers/vfio/pci/mlx5/main.c                  |   3 +
 drivers/vfio/pci/vfio_pci.c                   |   3 +
 drivers/vfio/platform/vfio_amba.c             |   3 +
 drivers/vfio/platform/vfio_platform.c         |   3 +
 drivers/vfio/vfio.h                           | 100 +++++-
 drivers/vfio/vfio_iommu_type1.c               |   5 +-
 drivers/vfio/vfio_main.c                      | 318 ++++++++++++++----
 include/linux/vfio.h                          |  39 +++
 19 files changed, 681 insertions(+), 198 deletions(-)
 create mode 100644 drivers/vfio/iommufd.c


base-commit: 3bec937e94942a6aee8854be1c1f5cc2b92d15e2
-- 
2.38.0

