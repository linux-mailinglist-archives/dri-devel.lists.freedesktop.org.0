Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D739EB15
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 02:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C266EA77;
	Tue,  8 Jun 2021 00:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D876EA77;
 Tue,  8 Jun 2021 00:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0e5JNjr+yT3bp8mdP4lr1L8hM+W04NdAQ9icIuMj+mPJ5UCM8E/KaMauSJEsLWkLYaTR2BiBY+S8XsMs3T5UL7JFvLaHcgphoBJhcK5Nhge1YT8S0d1qoUiINIBgCnOBwhCmlCSXFt/8VOL+qAtXbLSPJYkNaJuU042/cOaMggTGrTu3Jaml+ukY6ChiQ1Au+vGfwNvhsfQCRG+UiamjnRx/cr48E9xiO4wkq7kKQ2588A4wljAeO5UB+pIUw2ToXpUqm/i/rlXVFO8P7kIM46rwT0F6723/GHqRxvdh2aB7RxTK9evJm/l6ioxgXp2nV+mM8JzWNVQhywH9xcJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duNN67L46F832Jd5Aj4sQJ3gtlUf4M0pjEpT7Rugl6k=;
 b=SRkxFLrAzktirQrj0lD5MZViA283wmtRhXbIJyb5aFvkMHiRIO338K48EYfiO+vtO3zU77Uf3cDFtSakq1jNtbRN/cgSAY6etRmk/ZoySFbheVRduyH/rnqkGv9WNnm63BJuqGcFiwCAA0RubsUzhrYvInPkyzdY5msWG5Tx6q7Emv6K5pHJQgTMIBroO3vO7rAPiJDJvkbuKeSSLUUvHrzgR4TqyUuwpZRhzKWsOVwtWzFgVqa2GoHCAGufuDYV84E0hFLGGH3vXat03SzdBkhEX4tXZNb1ZXjaP/34nNuT5gqdt0YqqKv+um3gaMNXqEHbPqdzzx/4CQQ69w5L0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duNN67L46F832Jd5Aj4sQJ3gtlUf4M0pjEpT7Rugl6k=;
 b=UQvOlkFTVDIQ3ldN7ZE5m/zkeNupg+2yl2RjM9c5cX8Xh/TDRL+BY0OQnuQGPrydsTnu5mjTo9nIE6/oJAP3npuWCkSXaspNZ78z3+zN6lNyp9n7k2STzN5XOPVb5O0KnOxr3dPzCjEmC15svEzsoYBKon//6nkUvoqDjIycpLmDBpfNB0iiObnI0bP671dCjLF0Ei9RzAmE/ci7M9mFJKQTCp78AJTNaMw95WCn49JfsIy2F70LGvEGe4sZvMgu1KAjvBSLBek2Z/QA9JSACt1ODOOz7qqfEMzQ/V09RpVuIkD1P5fAW2AdXAjFsmZEUsCIq9GiBGJkUX2v+bHa3g==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5539.namprd12.prod.outlook.com (2603:10b6:208:1c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 00:55:54 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%6]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 00:55:54 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 00/10] Allow mdev drivers to directly create the vfio_device
Date: Mon,  7 Jun 2021 21:55:42 -0300
Message-Id: <0-v1-324b2038f212+1041f1-vfio3a_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:160::20) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR13CA0007.namprd13.prod.outlook.com (2603:10b6:208:160::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9 via Frontend
 Transport; Tue, 8 Jun 2021 00:55:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lqQ24-003eKH-Ct; Mon, 07 Jun 2021 21:55:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68473b8a-5510-4aa0-0902-08d92a182aa3
X-MS-TrafficTypeDiagnostic: BL0PR12MB5539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5539AE9A3EE0D16C2AF279CEC2379@BL0PR12MB5539.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TfddbJFLBcNZj6JPF09TzVXu/lk/5DnyklCgNt8lL/LjTcQIzqCXaRg4sLAen5SNvuhXmzj+LF0nVwhjc9sFjtfv+cfk55puhZTYux6524iorj1h+OQNoxop9104AVqy4Nl8T6cFXZEHEyFnaguSzpxtUReGQOa+QRzVoOfwLVYLWPHqfyMbHZc6LX/Joo7yyPIv0wW1LP9lm5FkrJqxNyuNp0Vxp1y9q3IMtdaUmB0Ou/9s7LQo97ECatYZH7kGpwy900AJV/SstzxxmsqaBmIusqgviyhAg+9RTSb0epPpSHcRqOrVy+PbuXiey0MdoHecNc8SHB7kIaJE1ucJuOd8iickZyt3IdL6Qi9+6uAjIlBwqvsL8zCwaxeaiMXE+y8Hddb9NtjpxEXIbn3XmllHbR0tfbZ0wHkhb0bAZWzy/463Tof63x8UDhOKUf15XZ64sZrOAP11j0wkVUHziGRLYYXxqxJQLnFY8IpBW0KuMIsPCteu5RcCpfXl/h5nTxSc5rVBFpVJiyE5LFLgp9osomQ3M/X/uS8SNyDoDxv8nghY2Go/zEW+zWmHaJ2lunI5s/I22HzhZFIxij63VnRyBdp6LLWMVjM21c68OZR6vjQAYTAOzv94Xa4tx2MnZjGoGorn7WZOtiIJDMy2WnsgnObWtS4JJU7U/tOX1HyzHUSrAu54+PKyl31kFMVK0mWQM7I5Qs4uJhdHCdtVMA0IAVAvJ0SWkg+WQ0Zq+Ov8B7AceVUW9fC+5FFPOSpKtbo/yL+KRIo2HL/BtJuR3AcYIRPWUImllOYGE0Jxr9OJXmdW8M5lCRtvTNlGB6TloMtmSheTER075aUH8Wg9PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(9786002)(7416002)(186003)(26005)(921005)(966005)(36756003)(316002)(110136005)(8936002)(478600001)(4326008)(9746002)(2906002)(6666004)(86362001)(83380400001)(66946007)(426003)(38100700002)(2616005)(5660300002)(8676002)(66476007)(66556008)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FKWY5NQmErw/HmXiK2xVZteL/lmKcmNQKz+4yU3ItKF2LizRdIrO5iBIRI7D?=
 =?us-ascii?Q?oOYCdzn8IeJu8pLAF25JUL0r68vpSlojpXSxALzOCxajxEtyTCEys65exTia?=
 =?us-ascii?Q?0QA8jd075P9CbOHhkG4c2WfL+A71e47lxiqWKDaPjNZA/Kh0WQmWHoCkz7t/?=
 =?us-ascii?Q?Q1lYcfSoxpsOdDkKpEsDHtg4tJjBJCJEHDRTHRXeXI2Og2Otc/Xo7oaeu48z?=
 =?us-ascii?Q?5j3tv1xXQ1lirmIQ9eHbtCZetjfX2ILs4XpaDmzaW0cp2kvvoaoUF0UGfdkA?=
 =?us-ascii?Q?J4L39ppr7ojccLHzx4n90gVs3w+oHcL8cz1oMuolDE7Ee+77QosS+XbzfoWr?=
 =?us-ascii?Q?Ln+2LvnP2b1t5qEeqUkeqPnZpCx0Oqxcldefaj3idqhalUQop1zlOpV75wBi?=
 =?us-ascii?Q?/SYqwZNZKVsLiz+/CVaNYkthB3qwDd+E/4xOr2SZO/Ryi9X5K1O+FuOfT12e?=
 =?us-ascii?Q?VXpxyBbudGlsTJau2wLAbAJT211mHOs9lQHSer97wLbnVePBYQpyDIUabssj?=
 =?us-ascii?Q?UlRQHolQwv3i1dM/dK6qUVSyNCrtf5EcuEQYB4kiX+QBR8o120dObcRxi79V?=
 =?us-ascii?Q?K04jZtvHEqpjcQKTu+kupDaxAjuwRavG7AamiXlYMfsFDrLt0qsSTjJBSWmk?=
 =?us-ascii?Q?9plwxC3TfYrv+kGKhiT6H/Y/yTZ0bQ8vCUYFyZIGjka/X7emX6Osds64zCfw?=
 =?us-ascii?Q?xjAuWM1Ukgu2+FXMdOrAleByta1wKi2MIjCpWrj3HBqpV8VHKlzSDvbITLtc?=
 =?us-ascii?Q?LkRJD2Imo9Xg1LvZjquYo8unAZ0PCr+WGkH96dALQL+8yTWSISCUXYq92ErP?=
 =?us-ascii?Q?euFgv3Ucw2b9HWhem0fEFY5ufmorJx7k7rB+/ixCf8hX83iUWUHYTECQ9qDH?=
 =?us-ascii?Q?jYZiwP/aHA9aXvx11DnvqzA9OfvlOeyXTTEUwpxsfh7Ly8Fzb0eEz2Or6otj?=
 =?us-ascii?Q?MNrBojSmMpPF4MW/b4ZrQNPk1kDmVnRP10DpCzN0Ton+QIGC3gZvRGGEwwc5?=
 =?us-ascii?Q?GUz8ctebdukl7wjXADBvj41J6Kxy5+4F49XBKGPuKo1MG1okbuAvQhXUPZAI?=
 =?us-ascii?Q?AGz2L3UOASfU4x9pzjDCSNx/ZB8Th1C+nQOpcb+Ad8cnaszFzfalvYSALpmS?=
 =?us-ascii?Q?qIQHj0YqoBRl0E8WNPfNUhZZ3t4CUQ+uKdtLtA5WB7GJjjSaXfYiWbr0up5o?=
 =?us-ascii?Q?tmsowqtFBgDtEZf+l2tIVSsVXMg1TAU8X+ThryNZBgnJDEBArWnvDWRuc5/k?=
 =?us-ascii?Q?Z9CmfolOUfwHUMVSNtLoG2u62WA3wSBI1usbBsrPf0RHBkvjKEiVskIjNV0t?=
 =?us-ascii?Q?ViDGzfw/qZvmWCwbEis9PM2p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68473b8a-5510-4aa0-0902-08d92a182aa3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 00:55:53.5343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMSPhFNfpSLXbq7HQA0KRjSvTNbR4KdJB+hTX860UwhBtdUOvLs90D7GLEZZZmIh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5539
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
Cc: Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a "v3" of the previous posted full conversion:
  https://lore.kernel.org/r/0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com

Without the trailing patches that are running into complications:
 - The CCW conversion has some complicated remarks
 - AP is waiting for some locking stuff to get worked out
 - No feedback on GT
 - The license change topic for removing vfio_mdev.c

Getting the baseline functionality merged will allow Intel's IDXD mdev
driver to advance. It has already been RFC posted in the new format:

https://lore.kernel.org/kvm/162164243591.261970.3439987543338120797.stgit@djiang5-desk3.ch.intel.com/

This series includes base infrastructure and the sample conversions. The
remaining four issues can be sorted out one by one.

The major change in v3 is to enhance the driver core support for binding
based on the request from Christoph Hellwig and Dan Williams. Based on
some light analysis this looks broadly useful:

https://lore.kernel.org/kvm/20210428233856.GY1370958@nvidia.com/

====

The mdev bus's core part for managing the lifecycle of devices is mostly
as one would expect for a driver core bus subsystem.

However instead of having a normal 'struct device_driver' and binding the
actual mdev drivers through the standard driver core mechanisms it open
codes this with the struct mdev_parent_ops and provides a single driver
that shims between the VFIO core's struct vfio_device and the actual
device driver.

Instead, allow mdev drivers implement an actual struct mdev_driver and
directly call vfio_register_group_dev() in the probe() function for the
mdev. Arrange to bind the created mdev_device to the mdev_driver that is
provided by the end driver.

The actual execution flow doesn't change much, eg what was
parent_ops->create is now device_driver->probe and it is called at almost
the exact same time - except under the normal control of the driver core.

Ultimately converting all the drivers unlocks a fair number of additional
VFIO simplifications and cleanups.

v3:
 - Use device_driver_attach() from the driver core
 - 5 new patches to make device_driver_attach() exported and usable for this
 - Remove trailing patches for now
v2: https://lore.kernel.org/r/0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com
 - Keep && m in samples kconfig
 - Restore accidently squashed removeal of vfio_mdev.c
 - Remove indirections to call bus_register()/bus_unregister()
 - Reflow long doc lines
v1: https://lore.kernel.org/r/0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com

Jason Gunthorpe (10):
  driver core: Do not continue searching for drivers if deferred probe
    is used
  driver core: Pull required checks into driver_probe_device()
  driver core: Flow the return code from ->probe() through to sysfs bind
  driver core: Don't return EPROBE_DEFER to userspace during sysfs bind
  driver core: Export device_driver_attach()
  vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
  vfio/mdev: Allow the mdev_parent_ops to specify the device driver to
    bind
  vfio/mtty: Convert to use vfio_register_group_dev()
  vfio/mdpy: Convert to use vfio_register_group_dev()
  vfio/mbochs: Convert to use vfio_register_group_dev()

 Documentation/s390/vfio-ap.rst   |   1 -
 arch/s390/Kconfig                |   2 +-
 drivers/base/base.h              |   1 -
 drivers/base/bus.c               |   6 +-
 drivers/base/dd.c                | 116 ++++++++++++-------
 drivers/gpu/drm/i915/Kconfig     |   2 +-
 drivers/vfio/mdev/Kconfig        |   7 --
 drivers/vfio/mdev/Makefile       |   3 +-
 drivers/vfio/mdev/mdev_core.c    |  46 ++++++--
 drivers/vfio/mdev/mdev_driver.c  |  10 ++
 drivers/vfio/mdev/mdev_private.h |   2 +
 drivers/vfio/mdev/vfio_mdev.c    |  24 +---
 include/linux/device.h           |   2 +
 include/linux/mdev.h             |   2 +
 samples/Kconfig                  |   6 +-
 samples/vfio-mdev/mbochs.c       | 163 +++++++++++++++------------
 samples/vfio-mdev/mdpy.c         | 159 ++++++++++++++------------
 samples/vfio-mdev/mtty.c         | 185 ++++++++++++++-----------------
 18 files changed, 397 insertions(+), 340 deletions(-)

-- 
2.31.1

