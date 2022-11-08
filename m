Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCC862056E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C7E10E3C5;
	Tue,  8 Nov 2022 00:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D53710E393;
 Tue,  8 Nov 2022 00:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzlERZhkFCRKUx8j1CaN4eGx3Gb5BIsjkN+ci3Y4xjEUa/AyjphsuBk2TCL43XcSLT/baLkbjeYRtJ7xz9HyOEWYKM526j9L92vRUZRV504jgi1/QoARO4e/Wu9R9QUtOvMRQTn+GYpt3/bB5t4+0ersf0XxC2xAB8n1m+M36Ql4QGD5ML2vNsI4M20OHOkCnuEiTQf+tQ+bXbLTZqfoc8iTmdudAyM9MAc42uYbhMyaqMYo5m6Mksrb0NqCZlbu8DFEywxQQkWzQZc/P4z/Ij61ASfJWfbsekQc+1QPBFvKjqlQl5HNnrUT683FD6keElgJ6o7S+JS6UcBdDFUjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc/mcJi81T0NTSlzGDTCfrrO9U9KCdenBf7EHfJc0u4=;
 b=GzTKCToi+B7/iZImq/M0UpByyLygwsxYOg9T5a08Am/4LOMepGceGHkZmL79G+ZB4Q6nGfRudK+1tf0VtGONYKSFdCm1xOCv7xh8Ex7kB5koa/rPd5ITaymOIZBY8DhOVp8wKN/kunx5xrsfzb13tlr7nyHxCTIkIqbW6AL8bjR972uK6NFGKRpgjxBFpQzQ1uEXTspr0GatckBBE9xYkhhzKLOZduAtWe4EN9fBokrY4fWIbeuxL79CsjJnfiNCEPG9W36Ij7Bn14oH4c8V3Mr3vuEUhoTrMzF816DRGT3ewrUPFfx5oIViBY/rdXWbLczMpHAHeuomRKRrmAvn2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc/mcJi81T0NTSlzGDTCfrrO9U9KCdenBf7EHfJc0u4=;
 b=upL2fGOFDXLipM3Y+NeWzrFCVdpWfKQ0yk2ma3/evdC0qbsOEFAaLRIoJ0cufVh37I2DmS23T7+a/FJmo8M0cV4lNCXtWwZP2FrOfZl4GI80V+vP6ersYW2BAJpXScJACBkJflfThHB5kugPBF6IYNiwbcR8rJWqzv0jhYCggN14fY7/K8NmZdCxFMHlbNS8VPxmlIOrpHGyc12U7H9W2XJJoJZ7rIPsVJV/e979IWvUQ7N5sR2jYQA2hyllO+/E/qhdGJqo73NbKtaEhHj8OM+1HDVSBKUko1qHsj6HO0+Ux/qJLKsu5EUEEI/I0mSt0W9Zy9TcJ8KromcuYugYSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6257.namprd12.prod.outlook.com (2603:10b6:208:3e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 00:53:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:53:03 +0000
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
Subject: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Date: Mon,  7 Nov 2022 20:52:44 -0400
Message-Id: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0029.namprd15.prod.outlook.com
 (2603:10b6:207:17::42) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: bd649576-927a-46ff-80d8-08dac12393ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBlaZchspaWiu7AVXyV6XqpyJcV3F3apaWd09qME3YkDSz0SVBhf30q645I2mfC99miTZpA9AlBl0xcASdQy89K+b7BqZKDapp0TDLN6ziWtDY1hD5x7y8R2L0/BKys2vD0b42038Hz8WNwJ/aYOaYsth70FkI1K3vVZ11jA/iooEQoCTiBWULBBgzMVUMCJAFNNPrAw36Ji8fDH+cB2asi4ZMLKJfPnFIp8yHTAWl4IML5XJzHns+A6g09dtPkb0dwjZTWoOEVPhOl8IA+qNfE7DYBKR/oHh5pxqGxVDNgt3z2GrS98Dl4s3p4t6KY4De+BUOp6jfB+tlv1USWXGJ1vbldqJAs8iPL1UMYr5bxuPC/Wcd904uQbNu79HiwqKqgXpvPsBFDPb68wui4c4AZKk5EL46tiwIZlHNiIFcXQn1Qj59Fl0S5E+FfjXvxJkeemkuZyXPowjmAOqQ1BU99it71yUzwUjdplmfA9BKxrmLH9dpaN+9ckSVNt8SpGaxOSjuUy6h6GjGvMBuD+K4wLB1HPCu1ktAlDEvBZ5zHzDs2I5L/07SLAellUcnfYqSsVru3si0gYrGfv9hJzWEv/nsuRHZBXTXSdwwlg+tjwP/LyV9YpeJV2nGY+foH5fh19W2A+4GJX2DaZUKQE3/3mmlOYRMHf7l3tAKh1JRgKgBhw3FxsSUwpY0rB/7iDBDt9hTFQDO7zsuY7RiWRAZVF+rqQuz8va0G3/HOo0uWff0QcGa+t2gZlqK/R1yLfZyCAQt6PjTNQmYdX6AD80XIWeJe4tmvh51Dt/Af/N2dWs1DcK5H0gUjLzYfcEImql4upjJkEgZGurEl5yphe0Npj7p57HrQrxZKotZ3g9N12LOo+0wXlcoifpmWEunB6mQctBAO+hPnjoEPwiV4tUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(8936002)(36756003)(7416002)(5660300002)(41300700001)(7406005)(86362001)(6486002)(966005)(83380400001)(8676002)(6666004)(6506007)(26005)(2616005)(478600001)(38100700002)(6512007)(186003)(4326008)(921005)(66556008)(66946007)(66476007)(54906003)(316002)(110136005)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FZ4aYfCwj8Ij9crJt8cbCK9qePL8kMht4DvarFwQD8PUZ7+vz8e0BvRrCmXM?=
 =?us-ascii?Q?0evtichNv9GRrBPo/LGyB1IqX00ph7rBZsOEw/8mHA9C950e31PwtdMITL4Y?=
 =?us-ascii?Q?odoO1UIWN6R0T26Kpc5ewYFUYEVBYAB4xr/e/49v9XjQfICpPWkdXmoz5Lja?=
 =?us-ascii?Q?SF9gIdlRBYuGR9rAxy+R6a2t9QrcXm9w/4OrNLWdMRA2dgOIY5lUwuewVfrn?=
 =?us-ascii?Q?QwZRf2hsqBWoaUZrhHY5U6EepDQEWlHyEKsweVPKYpwDD8arej7KDPKIVN+H?=
 =?us-ascii?Q?gI6bInyrzyLh5Pjjimo151auqR+YsVY1d/4r4lDJLaR6upLAhICgELXKAUxV?=
 =?us-ascii?Q?OYhUMfSnvh4w1Zx6VmmoqAZh4FOqiKIBGLlO0WkFqtN+vzINYPzit4KTbntv?=
 =?us-ascii?Q?J/vWAJZMPf623SGgaOTQO3HbPcPp188v0eqNbOYHNU/OqquF06BHaeHmFjGb?=
 =?us-ascii?Q?Ggl8i7sz6DmR9JhaWS02s0GYc6d2mP8ad9P3VvhOU0qaWE3040lI3RuKwETR?=
 =?us-ascii?Q?M9sswCvfmaRCbpZzoQEfHuUYHiq/HNWYZ2UTPLMU9Gmf0KoShAqjRbIQR35l?=
 =?us-ascii?Q?irR6MYWPwNlgUgsqG26rTOjp2g5GSdzF89/7JSwfgqUQZ46lOsSL3MDUXuvE?=
 =?us-ascii?Q?9Bra1bp/sWeNtplTXlAg1UfdLQHrBDJhGPdEdHtNXskzGJBSDKCwXsnRxoIM?=
 =?us-ascii?Q?tM1prcEI9iRG0tZrSBtlU8AgCPs2Eurkk1HpXbuMjfm+ld+rN5hCQFLbZHFk?=
 =?us-ascii?Q?GCk6IdcYhRjb/cXspKP3e8TvX1oWM7PCBRv/r1oousjJrcBa/z3vUb6WgzFO?=
 =?us-ascii?Q?bvq083P9LxQG8KBkI5iC2r7n0xI6JPhSq65wv/xwm2UTmtAVaPxl+VlJ2zHi?=
 =?us-ascii?Q?JSniH7xF5zvpI0wuSp1cuL7dPRpY3hqmYzX4DGVkSEAu//owh4cfstfZKzTq?=
 =?us-ascii?Q?5qtpnEL+snYPOolxfqheX+gRdJpyPrZfZY3FiZIcwWCHX0imAQQdRZ5gaiZG?=
 =?us-ascii?Q?G19gPJlIjjeyYe8Q0ne3CSozaeB4lNpqCcXyQHo2Ixb6gdn0b522Q9LUPk7V?=
 =?us-ascii?Q?icHRFo9/Z+GtLfTlOQA4R2UaUSaCADHwuBSkeMM3QqbBEMpAZECDGB0AkFTG?=
 =?us-ascii?Q?FPc768VeF2+lGxk2cOXYUeDWDNTZ7yLdclWwfZiFMJjEac01PzSLb5RpRoC2?=
 =?us-ascii?Q?MNTTioRpqWvvbwv1a/ehV4W+8CxnFpNO2Cfg6KIkLf2bcemYSFO8hTTDVYO5?=
 =?us-ascii?Q?iwhKlNUejS55wfapj1Jz+W9HPvNzKfYP+0Qu6lYlfucbEvmk4kGqG2CsT0ne?=
 =?us-ascii?Q?FkcKUDbUVMc70GQixx9jUHqpUQuNcUhswkTwxNzpUYkXibUH3it7ZvjP6i1P?=
 =?us-ascii?Q?Frh8bRINGj15H9JJbK+CVCHggKwk0o925WTQ9PlMCn0S1IQgCE0YsMcY1nw5?=
 =?us-ascii?Q?AId3+9Doch5qqW5TaW6NoVcHsuZ4HTZBfyKPnvd3MBlDdS2a5KaV70ERus+b?=
 =?us-ascii?Q?87P2o70al+F6rW3wkjZCvMgM4Wt3qOrnIYNxcSeC9oBN7nyxkeo73C0IxbYz?=
 =?us-ascii?Q?W+HrPfwXqgPlgZ5EfKI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd649576-927a-46ff-80d8-08dac12393ed
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:57.7740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPtqqnIJUacuLRZtx2txvc+l0e+wmJdXD2iLAuZQO9HWP7lbw1z8KksvrNosY1DR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6257
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
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

https://lore.kernel.org/r/0-v4-0de2f6c78ed0+9d1-iommufd_jgg@nvidia.com

v2:
 - Rebase to v6.1-rc3, v4 iommufd series
 - Fixup comments and commit messages from list remarks
 - Fix leaking of the iommufd for mdevs
 - New patch to fix vfio modaliases when vfio container is disabled
 - Add a dmesg once when the iommufd provided /dev/vfio/vfio is opened
   to signal that iommufd is providing this
v1: https://lore.kernel.org/r/0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com

Jason Gunthorpe (11):
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
  vfio: Move container related MODULE_ALIAS statements into container.c
  vfio: Make vfio_container optionally compiled
  iommufd: Allow iommufd to supply /dev/vfio/vfio

 drivers/gpu/drm/i915/gvt/kvmgt.c              |   3 +
 drivers/iommu/iommufd/Kconfig                 |  12 +
 drivers/iommu/iommufd/main.c                  |  36 ++
 drivers/s390/cio/vfio_ccw_ops.c               |   3 +
 drivers/s390/crypto/vfio_ap_ops.c             |   3 +
 drivers/vfio/Kconfig                          |  36 +-
 drivers/vfio/Makefile                         |   5 +-
 drivers/vfio/container.c                      | 141 ++------
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |   3 +
 drivers/vfio/iommufd.c                        | 157 ++++++++
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |   6 +
 drivers/vfio/pci/mlx5/main.c                  |   3 +
 drivers/vfio/pci/vfio_pci.c                   |   3 +
 drivers/vfio/platform/vfio_amba.c             |   3 +
 drivers/vfio/platform/vfio_platform.c         |   3 +
 drivers/vfio/vfio.h                           | 100 +++++-
 drivers/vfio/vfio_iommu_type1.c               |   5 +-
 drivers/vfio/vfio_main.c                      | 338 ++++++++++++++----
 include/linux/vfio.h                          |  39 ++
 19 files changed, 700 insertions(+), 199 deletions(-)
 create mode 100644 drivers/vfio/iommufd.c


base-commit: ca3067007d4f2aa7f3a5375bd256839e08a09453
-- 
2.38.1

