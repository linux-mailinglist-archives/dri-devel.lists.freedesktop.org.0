Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDB567E5D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 08:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D609710F939;
	Wed,  6 Jul 2022 06:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9259E10F920;
 Wed,  6 Jul 2022 06:28:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIEMVpS8xIs/HMa1MWPuemaHfzeBUJZKv61Q7XZwFqoOh/E7vu2rxlPmYvGSmOhGnJutui5MpzAanxfW8o54w8T3FRbvGJBcHj+Me1lYtSgQsciBw+apxadvhFwRbU7q6Jejw5uF+Pq/CQxIaV8xP/Fp4IcqqYgmUVOe3F0OM4+qDyny+WBQ4SWXn8wbyVqw2k+7hRhIdlYtUN48t7FlkzT9nlz3hHgGRaNxo5B3pG1KX25w1QuOvuVlOp4jKcRcVrAzZMpMDsvHUug2etnm/+NrI8Ttn3MET0rZlSdC62c8yHdlgS5VqBaYfYWxhd2ZYRtyLom2EO/Y4j33jaRpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOhxWwfEe2gdOEbpD2pjMTaRdE59L5rfSB/zx9TzAy0=;
 b=Qqxi/6cJ34FVoFu+ebq3WnvxNM2zAjP8YzYO7iYs4QlCkWdHAylqZmebt/ZlLaxKaF+7HKWzWDoyFTDGo/56DRrjhiU/bBg24kk/JlilshDoUZiTGBxP/YVlQDqWHjvA9IZksd7vM29JAtXMBk1TbklR3OXouf9tWXL+DuOxXkTVL9h86vhavPJehENB9t+IRgDrWLLNdUtLzZ1XqEqynfumqq3L4HsScSS+UjcZi1rcOYCh64h33QkHK6d1GUx7hwvCcSNlb7cd0q7S5/cve6YB4wtapE7gzGnQSVYg9FlZNJorPSiV/muIb8Rzr525ZVI/cHND4tOcDix2zPVrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOhxWwfEe2gdOEbpD2pjMTaRdE59L5rfSB/zx9TzAy0=;
 b=Q546eqOWyVy8yIZiBdXAHdsXg8S1Er8IKfnhED/oH4GtbWwJxcrV1kR+Sr4oH1iBjrOte7bPjanQez5RGR2JrGpA2d8yeEXGQao8y7hbVw8BDbpD5qpO5W2ufGBTTgtD2SgpAgkHi4xuB7g0SZ1bi14S8Y0Gp3uqtVuWtvOeocRLhwX8Tu0dq0/N0lkWr46LU1lX+aOY7F2Cn7WekITEQF+YES4zh/OJDG998igm7uEEC+XFR1qZoP2ppGxNa/Iqs453WQmDXvHghraFW2jpSSGSI5/YohMFwldSev0ZkGaMvncuK/wXTZxIkpZlhmeLr3Z93BeOom/CpiHfZUOGHQ==
Received: from DM6PR02CA0075.namprd02.prod.outlook.com (2603:10b6:5:1f4::16)
 by BN8PR12MB3316.namprd12.prod.outlook.com (2603:10b6:408:42::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 06:28:11 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::f6) by DM6PR02CA0075.outlook.office365.com
 (2603:10b6:5:1f4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 6 Jul 2022 06:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 06:28:10 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 6 Jul 2022 06:28:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 5 Jul 2022
 23:28:09 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 5 Jul 2022 23:28:07 -0700
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
Subject: [RFT][PATCH v2 0/9] Update vfio_pin/unpin_pages API
Date: Tue, 5 Jul 2022 23:27:50 -0700
Message-ID: <20220706062759.24946-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74ce2c6b-09e8-4a7d-9ace-08da5f18b2df
X-MS-TrafficTypeDiagnostic: BN8PR12MB3316:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mZO7gOG3nLhi6C3Lkq2mRtsIT6vPO4kNZjUjtXE3dXYJCazLgguN0hB6uJZN?=
 =?us-ascii?Q?sKGPh0+BtAH20pJVmfkQBtX4fJxrbfFmqtF5sCJw5CEYgLsjYJoCM5EBixSq?=
 =?us-ascii?Q?PFG+sJ6dk532QQvRIlJkVha/eKkhe+h3sRJXRM8jlSrRq9eON6IybihpljQd?=
 =?us-ascii?Q?2mKNZv+ai9YSYiQrrwahGvZhLroXGnbYGwIaL62fEKtTe1o/lzUuteL5mD2h?=
 =?us-ascii?Q?y0UQ34PUSDvofyhLADT3+295vfFKxojHYYE8yOlCK0tWq9ccdoABj7wwxQlD?=
 =?us-ascii?Q?PXH2Lr/eNdgUfCo/vZhKWXARf5CzESmscqSEKjT6ohNFGAjtem12FtdTU7ce?=
 =?us-ascii?Q?2jPDt+VAfEHYCB8Y+TLIGGtb3bsmwmgp+aaFOF3TCgQpO0FxXwN09JKGn6T1?=
 =?us-ascii?Q?CpZY18HiUzyfcwdR1Y6+k88ENWvy+QhWLKRaDrd+wkLuLwcWJNJ+CFMjYaBa?=
 =?us-ascii?Q?IiJCpAHw84cf4mK9o1sDZV7jgwqWA3FyuFZlsi5FO0MfuxlYcCeiPHdYwA28?=
 =?us-ascii?Q?d13JfZEjk5ilHZQHOtJOOqStC8mUsvSej2FMtEaI4MRYYXhOXZ7Bo+qD7Miy?=
 =?us-ascii?Q?R1jZosoLgJ2lEWjT4bbN6HUjy9I6T6KpHNEcJsKbaeXN0T9rrfhjONy3tTg2?=
 =?us-ascii?Q?K9MS1+IRpp3oqnJt2cy9g3sP+6ScmzkjP0AEsSrm1NvGmlx0Kqv2AKh6vbDn?=
 =?us-ascii?Q?nzp9C64Qj/4x7ITN1ycR3gScymA/XxUOmVhXoyxGSODrMWIAF76Viajcf3Hj?=
 =?us-ascii?Q?oszLMKRQgF7p8NC6LZITO30mFctNleNyr4//WmDAMQJ13YzI27TGMxJWwzO0?=
 =?us-ascii?Q?8SE1k2oldplyOAGKYbxK/KdTPyils5D7MxgsvNGYYpDEagDAP0V8tE+vLBU8?=
 =?us-ascii?Q?PYW9sN19a3btQonIG7jZw5PGcWIwLQmuFGPTNG9tvBbnjUDHHceM94XhUvAu?=
 =?us-ascii?Q?AO8EpXF79gZIPK2L8sIY9HhOQnUHHh+JdeFHpgfgKkuE0xmdc9ckxH4qgF1r?=
 =?us-ascii?Q?3NE9svdPGmY+1mYrZwNjXnd6k78KfbdnGEaX/Vni+E0ohAE=3D?=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(40470700004)(5660300002)(6666004)(82740400003)(356005)(921005)(41300700001)(81166007)(4326008)(8676002)(70206006)(70586007)(36860700001)(15650500001)(82310400005)(186003)(7696005)(478600001)(316002)(2906002)(966005)(8936002)(1076003)(2616005)(86362001)(40480700001)(7416002)(40460700003)(7406005)(26005)(83380400001)(47076005)(36756003)(110136005)(426003)(336012)(54906003)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:28:10.9949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ce2c6b-09e8-4a7d-9ace-08da5f18b2df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3316
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

Request for testing: I only did build for s390 and i915 code, so it'd
be nice to have people who have environment to run sanity accordingly.

Thanks!

Changelog
v2:
 * Added a patch to make vfio_unpin_pages return void
 * Added two patches to remove PFN list from two s390 callers
 * Renamed "phys_page" parameter to "pages" for vfio_pin_pages
 * Updated commit log of kmap_local_page() patch
 * Added Harald's "Reviewed-by" to pa_ind patch
 * Rebased on top of Alex's extern removal path
v1: https://lore.kernel.org/kvm/20220616235212.15185-1-nicolinc@nvidia.com/

Nicolin Chen (9):
  vfio: Make vfio_unpin_pages() return void
  vfio/ap: Pass in physical address of ind to ap_aqic()
  vfio/ccw: Only pass in contiguous pages
  vfio: Pass in starting IOVA to vfio_pin/unpin_pages API
  vfio/ap: Remove redundant pfn
  vfio/ccw: Change pa_pfn list to pa_iova list
  vfio: Rename user_iova of vfio_dma_rw()
  vfio/ccw: Add kmap_local_page() for memcpy
  vfio: Replace phys_pfn with pages for vfio_pin_pages()

 .../driver-api/vfio-mediated-device.rst       |   6 +-
 arch/s390/include/asm/ap.h                    |   6 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  46 ++---
 drivers/s390/cio/vfio_ccw_cp.c                | 195 +++++++++++-------
 drivers/s390/crypto/ap_queue.c                |   2 +-
 drivers/s390/crypto/vfio_ap_ops.c             |  54 +++--
 drivers/s390/crypto/vfio_ap_private.h         |   4 +-
 drivers/vfio/vfio.c                           |  55 +++--
 drivers/vfio/vfio.h                           |   8 +-
 drivers/vfio/vfio_iommu_type1.c               |  46 +++--
 include/linux/vfio.h                          |   9 +-
 11 files changed, 218 insertions(+), 213 deletions(-)

-- 
2.17.1

