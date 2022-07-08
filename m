Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F056C19C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC9610EED1;
	Fri,  8 Jul 2022 22:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2BE10EED3;
 Fri,  8 Jul 2022 22:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqU4PRZRgvlq35GIbDKwdX35qbuWjwpAB1Bzz0OFKRJOb4iZz7/gkCvwapsIcMLFiL7xuKkTUCRadrHQ5I8waWkYbTdiEd3QDBV8+85W4jsbvBnZhM70azSyLRHTboBfLMo3WZ0YMNVA9CXlJP6Gzk0TUvXeMIQ2uwKI5lcHX9CdUmKmD+zXRm4N7ajigaGqlh8iicEuG4VEOQNuaiwnSlQJJWuE4t58SYn93s+Y0WTnZSyZcXQzwL2drfCBTKOnkE1e17G2UkvJx0a7YjgAge1HdCDVK6PYMhGB0DOKixQhNCsTAVZJvXTvnct8Qfltn4JJth+NtxLxjWaYiFc9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OymqoGl9JVTjCBsUa8cL9aguT14rsPkOfq4pJ486iDQ=;
 b=iv9QDjO8UFz6P0CCfzY6tJn5M1O/SZlGrBs8lIegPsfU94oQTIG8sQorJmaG+XV31z5IYsfkwyCGM2KwPhi3HuNGxPE0xogwMJfOEOHjoZfw5ylPdGfICB0K7efxAwS+9tGql2iLBmqcBa+W2Z13U2NhFafUpxmToE4EpqbQZtnRQpHBnODUYQY65keXJ6E4bm63ehkjpLXjj4xb9pf5TaItScVS2WJAx9X2uLLL5CypZ8hOJvX0uJ+obWMTkvG2/wy6sjlj5oq96mh50/VHM8quwKKofzaEuUg2j5Q6ycZN+n1+4gAQt8SdtTFN7R3bcIRd4wxSeFErCsfHG22ahg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OymqoGl9JVTjCBsUa8cL9aguT14rsPkOfq4pJ486iDQ=;
 b=NVAZmhRnmXvaM3EEblXdqunQ4ZARS8lHqFwT0AIkkaI6BXfB19826sWlIe9ElpWdsRJ9UW8SazpTCebFilkjUCKfw0fSe05xxUiXaFlGRPl+n5k4EcDVyQj3lMBqNEe1LsnjU5c51J8UoPRVcJmCY8cdo/+lWEHhKly5vscnn4k+ZmlU54ZgKORlh+l+iUlaj4av05IzbpwUHpZuZUT1wqaWnuSBcnrneJ3vWgCcK1SgMdeXju2C5VqTUm+8MruKA0vzWASx5kzxhqYGbykHLct/lOpLReVCbYCP4XQnw7Yt+D9WhCoU4stc9FrqjNMMmGlZm8T/9nZGOgMmWQvP5Q==
Received: from BN9PR03CA0879.namprd03.prod.outlook.com (2603:10b6:408:13c::14)
 by DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 22:44:32 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::61) by BN9PR03CA0879.outlook.office365.com
 (2603:10b6:408:13c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:32 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:31 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:31 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:29 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <kwankhede@nvidia.com>, <corbet@lwn.net>, <hca@linux.ibm.com>,
 <gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
 <svens@linux.ibm.com>, <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <farman@linux.ibm.com>,
 <mjrosato@linux.ibm.com>, <pasic@linux.ibm.com>, <vneethv@linux.ibm.com>,
 <oberpar@linux.ibm.com>, <freude@linux.ibm.com>, <akrowiak@linux.ibm.com>,
 <jjherne@linux.ibm.com>, <alex.williamson@redhat.com>, <cohuck@redhat.com>,
 <jgg@nvidia.com>, <kevin.tian@intel.com>, <hch@infradead.org>
Subject: [PATCH v3 00/10] Update vfio_pin/unpin_pages API
Date: Fri, 8 Jul 2022 15:44:18 -0700
Message-ID: <20220708224427.1245-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91442b58-3a07-4d03-f97d-08da61336cea
X-MS-TrafficTypeDiagnostic: DM4PR12MB5373:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IKbGErheMe2PGrzLCJHsPwR7uaz1miYsHiHboQ6W2aVx1sepWn88IKQ9NeGk?=
 =?us-ascii?Q?xjI4XnTXDJaK/395q/T73mfgGK2RvbX19KAZEnAKQVLe9qebzAhcxE68SHxK?=
 =?us-ascii?Q?iaoOUb7oT0mn86plzB+fRawZFBWqGfdVLo3gSa9xACEbL1kUqSKUyZwCGNdC?=
 =?us-ascii?Q?WOhN2aqGhsGtntJG6OMoI9tYqFwEXJ1a3Fprryvi8tEHclt2n8bIPJ/M6xnJ?=
 =?us-ascii?Q?mUwcD8m86CvYJnp6Ms5mxIr8ELJeAtluduMt3d4g7Kwaa2WHziXFKi8sakrj?=
 =?us-ascii?Q?MZQoxkNIKlmfH3tnLZcMWHIZUbwGMXb8DRGina0ZUz0SeT/0tyzm2d+PaNm0?=
 =?us-ascii?Q?mpgSolUlnRrKhy0DaWicksIgBZswJ2Z18V3aIHK/nBoV1uIObtGFVpyIDSgm?=
 =?us-ascii?Q?zTAqfRlqQYFOBswBDiBUfappFU2SSMimoJjGGTLc+FWHhahOCnzY4glp9F3c?=
 =?us-ascii?Q?ztFkLV/TC3pp+D4M1xEswr54wYoEalIZuF/1j2qBPKyuVdAzKoFhVJ00h5zs?=
 =?us-ascii?Q?4MP2sLpoZN3dEJ+QVF19GTnUbbmqmtE8Gw2N55HddmBKaDwRNyRgA7nmZRAA?=
 =?us-ascii?Q?n7HM0aI2u5PWRNdhOae28DEFdQ15rgN2f6JtnZIkVmXCvk6g6GqKXNltLT1S?=
 =?us-ascii?Q?qWG3iK64FiGAo/m1gloQ6q2NdEgzVfAiWFFggWkDcVH0MNxGe4wCghdNlXXQ?=
 =?us-ascii?Q?xbbvG0RoYkco35jESQnrhxdUuGhzmgVmp/llYtBd/w8ZF0CpE/hdxUu/r0pK?=
 =?us-ascii?Q?VTGI2nh9o0ZmY7BR6M/NpBE51yq/xvci6Ot4H4iziqJ5okOR68TdYVEJk0Zl?=
 =?us-ascii?Q?R4o3g1DhQgvVQwE1uk8FqQBhyXUlWqLVyy4IAAflAxM5IC8TTT2l7SBt9aml?=
 =?us-ascii?Q?tOCQOCDOR1xNmUxv8GNMDYNGj9qNmektUf26UyLo7J7/l8JRWuz3+zJF2pnq?=
 =?us-ascii?Q?I+B3o4Vdms8bWUnTXgbZhi5bkULGEXF+GAjCgUN78/F3xST8PqWe4JPfURyD?=
 =?us-ascii?Q?uOqD80rSdQgYTxQFfCNsleK1uA=3D=3D?=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(40470700004)(36840700001)(46966006)(6666004)(2906002)(82740400003)(8676002)(41300700001)(86362001)(921005)(186003)(83380400001)(2616005)(81166007)(316002)(36860700001)(5660300002)(356005)(40460700003)(4326008)(7416002)(36756003)(426003)(70206006)(15650500001)(8936002)(336012)(7406005)(82310400005)(110136005)(26005)(478600001)(966005)(40480700001)(54906003)(47076005)(7696005)(1076003)(70586007)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:32.3036 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91442b58-3a07-4d03-f97d-08da61336cea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5373
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a preparatory series for IOMMUFD v2 patches. It prepares for
replacing vfio_iommu_type1 implementations of vfio_pin/unpin_pages()
with IOMMUFD version.

There's a gap between these two versions: the vfio_iommu_type1 version
inputs a non-contiguous PFN list and outputs another PFN list for the
pinned physical page list, while the IOMMUFD version only supports a
contiguous address input by accepting the starting IO virtual address
of a set of pages to pin and by outputting to a physical page list.

The nature of existing callers mostly aligns with the IOMMUFD version,
except s390's vfio_ccw_cp code where some additional change is needed
along with this series. Overall, updating to "iova" and "phys_page"
does improve the caller side to some extent.

Also fix a misuse of physical address and virtual address in the s390's
crypto code. And update the input naming at the adjacent vfio_dma_rw().

This is on github:
https://github.com/nicolinc/iommufd/commits/vfio_pin_pages

Terrence has tested this series on i915; Eric has tested on s390.

Thanks!

Changelog
v3:
 * Added a patch to replace roundup with DIV_ROUND_UP in i915 gvt
 * Dropped the "driver->ops->unpin_pages" and NULL checks in PATCH-1
 * Changed to use WARN_ON and separate into lines in PATCH-1
 * Replaced "guest" words with "user" and fix typo in PATCH-5
 * Updated commit log of PATCH-1, PATCH-6, and PATCH-10
 * Added Reviewed/Acked-by from Christoph, Jason, Kirti, Kevin and Eric
 * Added Tested-by from Terrence (i915) and Eric (s390)
v2: https://lore.kernel.org/kvm/20220706062759.24946-1-nicolinc@nvidia.com/
 * Added a patch to make vfio_unpin_pages return void
 * Added two patches to remove PFN list from two s390 callers
 * Renamed "phys_page" parameter to "pages" for vfio_pin_pages
 * Updated commit log of kmap_local_page() patch
 * Added Harald's "Reviewed-by" to pa_ind patch
 * Rebased on top of Alex's extern removal path
v1: https://lore.kernel.org/kvm/20220616235212.15185-1-nicolinc@nvidia.com/

Nicolin Chen (10):
  vfio: Make vfio_unpin_pages() return void
  drm/i915/gvt: Replace roundup with DIV_ROUND_UP
  vfio/ap: Pass in physical address of ind to ap_aqic()
  vfio/ccw: Only pass in contiguous pages
  vfio: Pass in starting IOVA to vfio_pin/unpin_pages API
  vfio/ap: Change saved_pfn to saved_iova
  vfio/ccw: Change pa_pfn list to pa_iova list
  vfio: Rename user_iova of vfio_dma_rw()
  vfio/ccw: Add kmap_local_page() for memcpy
  vfio: Replace phys_pfn with pages for vfio_pin_pages()

 .../driver-api/vfio-mediated-device.rst       |   6 +-
 arch/s390/include/asm/ap.h                    |   6 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  49 ++---
 drivers/s390/cio/vfio_ccw_cp.c                | 195 +++++++++++-------
 drivers/s390/crypto/ap_queue.c                |   2 +-
 drivers/s390/crypto/vfio_ap_ops.c             |  54 +++--
 drivers/s390/crypto/vfio_ap_private.h         |   4 +-
 drivers/vfio/vfio.c                           |  54 ++---
 drivers/vfio/vfio.h                           |   8 +-
 drivers/vfio/vfio_iommu_type1.c               |  45 ++--
 include/linux/vfio.h                          |   9 +-
 11 files changed, 215 insertions(+), 217 deletions(-)

-- 
2.17.1

