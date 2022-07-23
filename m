Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3026B57EB33
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E67392B8B;
	Sat, 23 Jul 2022 02:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90DC92BFA;
 Sat, 23 Jul 2022 02:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApVh7QEBHlzBCB8EbI1C6Vyt3rjWR2Do2yKUiSrk70znaiGsA0AFYe/liEUgC6567EbOgMevtP0V/4cEP91gygoABZv6hioDeV01+r5Azxebk6H1hTbDQloJwMpJlBkj8+Jt1cBGyTzegdRAAAEvfyBKsGpLmcb6svzlvnNZsl/G+7I6oX/38guhwvh469D7/h8n7pfAhuc+bftoljnPlACX9Ply5bHXC7Xn/FUnXxVioUEpOMZeDC1QsICd0sT7zcM3r/jUZY/truvDk9kMOII/P/oKIJm3kucbkhfM1KZLOqgG+nisqpJnqBnqPrDk724t5hwFyv6kAbJ+C7mwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s08fmeYHQwQWbI+c32fc+t+tmkidMlt1+FTUev3rHY=;
 b=JY6yHixQ7mQJeufXR5l7iRP6DcXnJph9D6aiY3jiCsuQAKSdyd7+3ebc0AITsZmLffWH7/VKdXTaUErmLNNYnewz2tq8noXFLv6hbrRhgFiFMUxdHvBvLMK2rIlbZfQ2lUgE81amOttJHWX5GDjFD6GugxeJdRBdqv/APc3nQ07Z2CU71MlqDoEuDOuKOSPNTM0mGUiM2DpFZL2yAPhSRxNA1yHRrX51jOtlcxZnP8DQPCEE12lLxFhsihMhkVW5wPO8dpjDQ4m4h4NYNqqvLvAFvQ1qNGy5u2dGnZHtkOIOWV/+ALUPmffKeMFxeGnMcZqT2cKUOytdoYR6twWONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s08fmeYHQwQWbI+c32fc+t+tmkidMlt1+FTUev3rHY=;
 b=bDjlerR8eaLv+otwwsac7Sl4IXkbx7A7qat5JtR1RZyBKQcOtKefP2N3+9Z5Rc3Sahhuy4Kxt72pec7cQ3VeYZPdFRWxVgoUtbSp1Nzsg9HS4jAdEDmmAoLysf+rsVXct1CrJ4PFY+9egeJUqAxsGDbGcoMwpplzhrhtlqsIrAyakEvhQZYdozXWBsQo3SiFTJrBGRyW49JCds9jv2LugaymaAF+bGspbzvjbP0EnIpfHNeiV8Gtja9j5M5hpihValklTp9iF0XPd1amIkgwdnoZtrtNg0rTM95Bx3NzZU+yWxqbzEkAxLPFeoBWks4EnXYOQ7cVU4inkWh5kZDcVQ==
Received: from DM6PR18CA0009.namprd18.prod.outlook.com (2603:10b6:5:15b::22)
 by BN7PR12MB2753.namprd12.prod.outlook.com (2603:10b6:408:31::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Sat, 23 Jul
 2022 02:04:10 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::c9) by DM6PR18CA0009.outlook.office365.com
 (2603:10b6:5:15b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Sat, 23 Jul 2022 02:04:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:04:10 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:04:09 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:04:09 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:04:07 -0700
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
Subject: [PATCH v4 00/10] cover-letter: Update vfio_pin/unpin_pages API
Date: Fri, 22 Jul 2022 19:02:46 -0700
Message-ID: <20220723020256.30081-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ecbe653-d99d-401b-af45-08da6c4fa204
X-MS-TrafficTypeDiagnostic: BN7PR12MB2753:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2XQqjoG0WpwzlDo8NO2pK/UQvqINTG1EiQ2hVjGxKdBbQXLsO4RuAEW2R3Gn?=
 =?us-ascii?Q?4k/PY5slBI+rxpkrHYGu5we8SopqjRqTLDH1DZyAOEHL0wUzKRY5Y4zPTc6F?=
 =?us-ascii?Q?zFNptyFdXdCp4UxVjW7g8TkYBzo/eKgCtw+baXZ9aG+9tuI3EVWnhlsC9KjE?=
 =?us-ascii?Q?kN8k4tH62MqGuzbnter8aGqY1CXXBvLmDPVy0NqmVuG6wlAE6VtXZ1cKh4Rd?=
 =?us-ascii?Q?c5f3kfRBMRjc6x6LwcZspdLstVv2+XQ/ZG797Xf/AJtFrQNnuIurbHDORAXC?=
 =?us-ascii?Q?FFGBIayls6GMyWHPX5IWMLscIbu0o38UYkbE8v3FDbwv6dsZhyr2ItbUkk03?=
 =?us-ascii?Q?wOzWwjhqzIISh7k+BmYMEBqkty6O8HGz98Oq3MBQlZ2na9YDrVy8caD5iR0q?=
 =?us-ascii?Q?neZcT7NWU1SqhnGVUddXRdX74fWTU1DlsT/sW3PDh3DMHlILB9WKgVKo3DvF?=
 =?us-ascii?Q?C3Z0M1xMbTAZ6FMVEv0E3f8uQLkBXztSL2qRrBa8M+r6CJNaYiq7tRcdRB2T?=
 =?us-ascii?Q?0gTVEaYCms6LolgXXjW1I5uAXndX9HTgQOj3Pc6GxtPNJybDPinRk2t7re0J?=
 =?us-ascii?Q?emnxCyNOLUIfvY2MdFrlZJomXJoEiIu0Gjq5Z4jXAvhmMWeRVXxGI7gKWCNq?=
 =?us-ascii?Q?LpCwQmzi9k3FUHaERlW7HOsgkGdoUWMbZHu41hGS4HLFKXDtFHoOF5KDRFlo?=
 =?us-ascii?Q?wnUqr+6IWxweprdiJE0465Z9nguUh+miT9V9g2s/omNPIbqCfxJFlP/vysen?=
 =?us-ascii?Q?pica1H+6A+uZSONeX5YxR1UrviTgddA5aAzaYZr7Gfd7pA6WOxRTsCGhMdwN?=
 =?us-ascii?Q?m4DTz+9wbtI5IMtCFAWFIcBTxbY5z3zSG6ZItxoXWuExyFNGz5LhGmbBBPVa?=
 =?us-ascii?Q?WQvXmvow5wDOG8MEUDIMFX6DHRmWn5mwtvtSCJiHYO7D6q1/DelAkTEDsnCV?=
 =?us-ascii?Q?EAOHo3gFlfyo9WHCIXnqt1ZRNpBsknm3a2MOy5gtKW35XQfxrHW7HA3NYmWd?=
 =?us-ascii?Q?dyNZ2ZNdM+w6zpQDiD22dWoctg=3D=3D?=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(36840700001)(40470700004)(70586007)(81166007)(40480700001)(82740400003)(921005)(356005)(36860700001)(47076005)(186003)(336012)(7416002)(426003)(83380400001)(8676002)(4326008)(54906003)(36756003)(110136005)(70206006)(316002)(7696005)(966005)(26005)(2906002)(41300700001)(15650500001)(40460700003)(86362001)(6666004)(82310400005)(1076003)(8936002)(478600001)(5660300002)(2616005)(7406005)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:04:10.1528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecbe653-d99d-401b-af45-08da6c4fa204
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2753
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
https://github.com/nicolinc/iommufd/commits/vfio_pin_pages-v4

Terrence has tested this series on i915; Eric has tested on s390.

Thanks!

Changelog
v4:
 * Dropped double-shifting at two gvt_unpin_guest_page calls, fixing
   a bug that's discovered by Alex
 * Added Reviewed-by from Anthony Krowiak
 * Rebased on top of linux-vfio's next
v3: https://lore.kernel.org/kvm/20220708224427.1245-1-nicolinc@nvidia.com/
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
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  45 ++--
 drivers/s390/cio/vfio_ccw_cp.c                | 195 +++++++++++-------
 drivers/s390/crypto/ap_queue.c                |   2 +-
 drivers/s390/crypto/vfio_ap_ops.c             |  54 +++--
 drivers/s390/crypto/vfio_ap_private.h         |   4 +-
 drivers/vfio/vfio.c                           |  54 ++---
 drivers/vfio/vfio.h                           |   8 +-
 drivers/vfio/vfio_iommu_type1.c               |  45 ++--
 include/linux/vfio.h                          |   9 +-
 11 files changed, 213 insertions(+), 215 deletions(-)

-- 
2.17.1

