Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6E36BA65
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 22:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD35E89FC3;
	Mon, 26 Apr 2021 20:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AD889FC3;
 Mon, 26 Apr 2021 20:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUPSGBHOdYVqh2TD7jnMzDyt8x0nv6JmI9gJ4FoCQgEdmi/7cj643CWrh0urbJ/iphdRzuHv0WMpg2d4+utHyCpPxZ+qVHnVH6gppy3UABpLD25HTCpXXvEP3jaoDJcN9GsHdBlyhFQIIeOCwwN29MSz+4yCy+/ZIeWUrbsqdgoK+A6Za8I5oqeYJhfaBOXyVHy/hyXB+ZkvGICnGiiQzLgdWLXC30Rr+HwSpDboot3q2VugwvVnKEDVmNDEbRkZO1wDiOv53JtcP+nphKkZWBps9mHC9zY0Cy1nSsiVDX4RKEcSr0KyOEJFLbn6cbbpjsQEfdKd232+SQaq5LopBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olwDiL66vfekS16MVboSGcToyx/UXCU6SuGuTMItXbo=;
 b=kYXoTvZdalIx+8HqweIkySCb5FCd427KUDg497CuFQz/b8SIiqTDFcIMO2N7VW6oglqoXgFZCGNo8TBN4H/EYhaGR5y4+EqVzfN7RWMt01xey2L+hlHTlDLRdQ3wnfkJqC2yDlLLzxVzPPc5nA45qjm07+VKJhe3ENuBz3SNp8HD1HIbHgVONZQ3o9J0L8wJtkH0GYpGvywM5QIllBft10Y/F6H31XroOCvCfdpXowQsRjIg99KuqkSXw77n+I1MjZ516Y8wXLyyPDkSdlJZDMHhTs5xdWxQ0sQad92+emObwBflUDegGeWKTUX+UTMC/clwPNiSPUNINcHenYuilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olwDiL66vfekS16MVboSGcToyx/UXCU6SuGuTMItXbo=;
 b=E+FPbX2LhZjrnGXIPjkUembzk1m792iDQQu9vT3qd+fH6OJWr9FkphGr+iyRcYnKbJPUlQ38Lc1BL2/thnUobQlTP/hIkRJkgcDzNUI3cIiZTafOJAWYO48cPBFIsUD+7lEFnKNJ49+SOTtvBwVwr0qETQvKMPzjdkDXr8LI6gkem50cgA5LzOndVJezq8uQp+J+PVDguAqQMxL/6u10F050s2ueIH9qaAlNRnU8xH4F9xtVliLOP3eqrwbczRgM7w/cWqnvqYdTC/mnlG/FuZgvv7BewJYB66acINHaX1NpAA5YAFVIY/cl0MNm0Gi6Zl7cb0QCMp5OSWDQwHvDeA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3740.namprd12.prod.outlook.com (2603:10b6:5:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Mon, 26 Apr
 2021 20:00:17 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 20:00:17 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 00/13] Remove vfio_mdev.c, mdev_parent_ops and more
Date: Mon, 26 Apr 2021 17:00:02 -0300
Message-Id: <0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR20CA0052.namprd20.prod.outlook.com
 (2603:10b6:208:235::21) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR20CA0052.namprd20.prod.outlook.com (2603:10b6:208:235::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Mon, 26 Apr 2021 20:00:16 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lb7Ox-00DFYy-MJ; Mon, 26 Apr 2021 17:00:15 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e20688d0-e5cf-4c4e-8438-08d908ede987
X-MS-TrafficTypeDiagnostic: DM6PR12MB3740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3740A304BFC7E0F85CD45347C2429@DM6PR12MB3740.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8BtlUhugUCgKqMJolQ6Snv6XAQRUwcEltMTpSr7aTcjG2JxvRnLdH9qgDoJEcBWcyoxfExU68vcKJpfhavrMrQ3Hh/NC2N92BIMlZpJ2sLI/4IJqeYOw5spdZlJ4FyLypqfNraF+xZWK1bjqKwtGjPpEVjh2eD3h9HgmT9DX9skOEmdG8QOOVpQfezdqEH4NfBA0p3sNjXAfBXGqoTAZx61HTtubstFiDedXfPMRVofY8vMo12TdnNsnokU26kCcB7FgAR3mcjOQiNyKN1zYJ6QhrC4fcyZ9bdlLqD35OMeihhuesjV4AUCiiEQCVPGbjWY+Zsfk/sYNMH2Q84zZilqifGcTjl38Z4qa5eRepHcE/bSFS1VGd9FT+soDFWLJt5qLlIoFeM7HnVIZrpHx4jDYq4X8eg3k9/DbiKf51TB+RupW3LDP3TDPUfN2OBMokNW60AI54/+i54rNl0VhcQ8TdEJD6rrinfJ7gZ1vBABccm9EHkqYVgf2WutvaKePyTw2n9JKowcyqBcYdGj/3KDKvNF4Sb+4jAlyu1m7oNNl5j9QBz8TyRKXG1nS5bxNPzAZMfst1gwZEz9MqBx5S1cb7VVPMBDXBqxYK6NkAMpdTD3b4DmqkKbBShnLRyMuJ6/eNFictAgTqcpf3bPhspNtf2b5waaOLnMqTQekCa1TY7s2ZZCZAeJp8zpbdtsL5oEjK+viM4phHLsHZ4MwpABQqy8OWHyx8dxqD0ivQAhIABvDJJ8ULRouZw7OgqlH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(66476007)(66556008)(966005)(9746002)(54906003)(426003)(110136005)(107886003)(186003)(26005)(921005)(6666004)(36756003)(316002)(2906002)(2616005)(478600001)(9786002)(8936002)(83380400001)(38100700002)(86362001)(8676002)(5660300002)(7416002)(4326008)(66946007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZKFr44UUWfx1zrXbOHAbVR38gF6pTBagwkJEvKvsBSY3eldD4WAurqvL5oTn?=
 =?us-ascii?Q?4XjydPH+QeANwD8TfXzIyPHYO9GXWtthRarCGumdw+DRa5HsS+lQXA81QHG3?=
 =?us-ascii?Q?A+kClSlP75oilJi8o0yAMnBPzQtwEybAiKu2SlPhvru73r1mWMuqQxOGczct?=
 =?us-ascii?Q?6338CVOoZDfyaxc+BXnUOcpVzTrERUlUeSvkiTCvSJUthOds4MfQq45OhCmI?=
 =?us-ascii?Q?F75LTU55BTNa94fJTMYQFiVkXAy8mzPXDuOVr/L83h6ZqgG3pVakR8YBhpqU?=
 =?us-ascii?Q?HXqJYhlA+LSbN/N1wIHcSbKBIUv5dCzZf11XdptQnVveZOM8xG5RYmu0K/Jx?=
 =?us-ascii?Q?DJaKk5T1oWEWtad273930FySjPc6hvTN/eui5gqeGWTzm0hAWLcMtaKOXpAB?=
 =?us-ascii?Q?2aiZw4ed2sv+p1BoHlvtze86WsumArXJRNxJkJ8YU5W64i9WJXgFKiLRtHo2?=
 =?us-ascii?Q?A0zi68A9+PwggnQXcy0MNQznjkfZxWZegPfTkfpUG73yO8LwBzXN2Yz0Lxo4?=
 =?us-ascii?Q?8hyKwAwcLa3Q2hc+xzPxdpiEVXyveH4X1lEDaFEdx8lTAES1BpL3j1VSAEiN?=
 =?us-ascii?Q?5u/5elhY4tXIgJJ2kR2tloHt69ik88gXxoeoBq+N4dGdjbniWSK6aLI0P4Zo?=
 =?us-ascii?Q?uiC1AXjSaHy+4ODLwcm1SzK2zbBPYwEr/Kr7UXsj56ufOwXFG6jTBvmUFVNI?=
 =?us-ascii?Q?CJEAZV3DqZCZbwX5SNaDPS1CeBWjg24koL7Z1wSft+5XGGSOjlCb+KXESL96?=
 =?us-ascii?Q?Bkp0E0cxndVkxUYsBX0N7WOoasRRYiqPHtGuAxgdK8o7vwHnWMZ1CKP8ZcB1?=
 =?us-ascii?Q?M7Y51H8j2DkIsKuXTSqUUPvP9ioEZyCdkoCbdWhDEPkXnEdaGDOsOnpyRVbR?=
 =?us-ascii?Q?MC2iDjixyyzKoqgdGA77VUjhiIrHaDj9QV80PnK1ervIH0T7NE/aGWeYjL2X?=
 =?us-ascii?Q?9ketyz7omQEQej+UOY6X2WNqB/ORLntBSqsyKNZ6YQRpKA2hw9zsckTeu4P3?=
 =?us-ascii?Q?jow0pcNfbBqCKpZifbh+CKrFf2KpZUO6aLRy1J4C7trWUH/mu8uS5Z3kGJ77?=
 =?us-ascii?Q?T/0EK5hsFMGhxLTik9tHvPvBgadcMKV2LYLQbqV4F/aoqAIiu8rGYnuTIsJw?=
 =?us-ascii?Q?6S20beASToGpKsdyG/hiX3jvvDWcT/M1MFa8MYC9ZgF0Sm6yY8JnOFE0rq6W?=
 =?us-ascii?Q?+vMxrEDNhoAGpBQVEpZGcHECAh3e9gc+46WAAH1zkJ/hDjsDdv15JR5Ha2WV?=
 =?us-ascii?Q?RNwHrMvHTbLw5sVWphQl16MXajMX9hWwOLyH3I4daLgmW/7LPqkCPStjvFLk?=
 =?us-ascii?Q?k1QbuqxDa+U6ymlXqXVhDuoO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20688d0-e5cf-4c4e-8438-08d908ede987
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 20:00:17.0848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGoPkPY5oZXdWuJY/24/CeMjO6D9Mvs/G9bYCjRjhQTDtII0l8G6IR/oZkPfCwM7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3740
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Tarun Gupta <targupta@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mdev bus's core part for managing the lifecycle of devices is mostly
as one would expect for a driver core bus subsystem.

However instead of having a normal 'struct device_driver' and binding the
actual mdev drivers through the standard driver core mechanisms it open
codes this with the struct mdev_parent_ops and provides a single driver
that shims between the VFIO core and the actual device driver.

Make every one of the mdev drivers implement an actual struct mdev_driver
and directly call vfio_register_group_dev() in the probe() function for
the mdev.

Squash what is left of the mdev_parent_ops into the mdev_driver and remap
create(), remove() and mdev_attr_groups to their driver core
equivalents. Arrange to bind the created mdev_device to the mdev_driver
that is provided by the end driver.

The actual execution flow doesn't change much, eg what was
parent_ops->create is now device_driver->probe and it is called at almost
the exact same time - except under the normal control of the driver core.

This allows deleting the entire mdev_drvdata, and tidying some of the
sysfs. Many places in the drivers start using container_of()

This cleanly splits the mdev sysfs GUID lifecycle management stuff from
the vfio_device implementation part, the only VFIO special part of mdev
that remains is the mdev specific iommu intervention.

v2:
 - Keep && m in samples kconfig
 - Restore accidently squashed removeal of vfio_mdev.c
 - Remove indirections to call bus_register()/bus_unregister()
 - Reflow long doc lines
v1: https://lore.kernel.org/r/0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com

Jason

Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: "Raj, Ashok" <ashok.raj@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Tarun Gupta <targupta@nvidia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>


Jason Gunthorpe (13):
  vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
  vfio/mdev: Allow the mdev_parent_ops to specify the device driver to
    bind
  vfio/mtty: Convert to use vfio_register_group_dev()
  vfio/mdpy: Convert to use vfio_register_group_dev()
  vfio/mbochs: Convert to use vfio_register_group_dev()
  vfio/ap_ops: Convert to use vfio_register_group_dev()
  vfio/ccw: Convert to use vfio_register_group_dev()
  vfio/gvt: Convert to use vfio_register_group_dev()
  vfio/mdev: Remove vfio_mdev.c
  vfio/mdev: Remove mdev_parent_ops dev_attr_groups
  vfio/mdev: Remove mdev_parent_ops
  vfio/mdev: Use the driver core to create the 'remove' file
  vfio/mdev: Remove mdev drvdata

 .../driver-api/vfio-mediated-device.rst       |  56 ++---
 Documentation/s390/vfio-ap.rst                |   1 -
 arch/s390/Kconfig                             |   2 +-
 drivers/gpu/drm/i915/Kconfig                  |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 210 +++++++++--------
 drivers/s390/cio/vfio_ccw_drv.c               |  21 +-
 drivers/s390/cio/vfio_ccw_ops.c               | 136 ++++++-----
 drivers/s390/cio/vfio_ccw_private.h           |   5 +
 drivers/s390/crypto/vfio_ap_ops.c             | 138 ++++++-----
 drivers/s390/crypto/vfio_ap_private.h         |   2 +
 drivers/vfio/mdev/Kconfig                     |   7 -
 drivers/vfio/mdev/Makefile                    |   1 -
 drivers/vfio/mdev/mdev_core.c                 |  67 ++++--
 drivers/vfio/mdev/mdev_driver.c               |  20 +-
 drivers/vfio/mdev/mdev_private.h              |   4 +-
 drivers/vfio/mdev/mdev_sysfs.c                |  37 ++-
 drivers/vfio/mdev/vfio_mdev.c                 | 180 ---------------
 drivers/vfio/vfio.c                           |   6 +-
 include/linux/mdev.h                          |  86 +------
 include/linux/vfio.h                          |   4 +
 samples/Kconfig                               |   6 +-
 samples/vfio-mdev/mbochs.c                    | 166 +++++++------
 samples/vfio-mdev/mdpy.c                      | 162 +++++++------
 samples/vfio-mdev/mtty.c                      | 218 +++++++-----------
 24 files changed, 651 insertions(+), 886 deletions(-)
 delete mode 100644 drivers/vfio/mdev/vfio_mdev.c

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
