Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5283E209E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF1E6E902;
	Fri,  6 Aug 2021 01:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11A26E8FB;
 Fri,  6 Aug 2021 01:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLRJ1p+X3tGAoOiBks8byPOm4VGujZMInfh3/xO9DrO+LdUqzkvpFd3oxLjKY8ZgHDGgQDBwOqfw4DmOUbfTAzj9rcL25VXQ/QtFpq0OzbeDr6JIO74I9Oa2DK4StPWA2wBZlsLJXQLbygw6BpXwrusPTb7HaA0yVjdRS8qGBY4CHlD3f3d+urK1jQIHx84qpPWeTgQFVRxTWoNhR1Ylql9gKAjSfL1QnBI8oZZmXdrv56g8EsnZlDcH2aQAqUhg6tk/yU5u2YNAETertnMwXPHI5/OW350cHlTC24fjZpjOPRLxY2cqT/VpFuNG9/6U/pnlwF7W0wgrgc7k9Rb1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqPidBnm0383dOKabplD6LonDnslbNgdek3OoV64VKY=;
 b=WaZzLuYkqoSg0+TGg0cGxwuTHCuBw5+MHFGMPz9Ha2sUQ4wzoFqInNl7Aefxzq7hfGPJTPsIs5c/WFbXClQHFdpTRxNeR/76gio5E/IETVoGOqUpTKIl/KEoTAuWyYkWCgjSkRTwHPcPODpy/V3nECSoWPwJWjo2v+91V1fPfnWPikflBpqhXpSQBtuGhhQavAsPu+IsP2zKEw5QulnmiXOVH5buNC2LHqA6MncmGRptijv9h3exlkjpa84WUHW3d4ESQ4VynviwT/7Dvc8+Dp2zaTlj79mnpwzVMlCtIGHDXmb+OTBQvPF8E20YOuC73JagySA+uJaljK9r+0X1bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqPidBnm0383dOKabplD6LonDnslbNgdek3OoV64VKY=;
 b=IbOtVoNQ+aI+iNRmE8B8wo7GfFiaGBRfR+8qrFYHyadHLB266woUv4JjiGFW4AvzVTMFBO4pF3wmBMbThQFFXzuuJz450FT9P7L6ZnqG6Z8OE+KiQ/t99m7BF0EPYxVQwM0OUOpQFO09t/UOZS7RWWFaHMJaFQ990rLnIKjbLZXJELiQIgjM7H7VdkMk6d8WG1i8gQJ91mtrAyZP2k6lu/thdVENPXTMxHgJuUdB+PYVq+r7SE7+rM0OSmP/LEhiIrnwXpWqWqU+O8wHnekWkqmf6O5oat5RdGVsW8SuGBHcQsYL+lvRcVT3dNXu+tKFqf1X98HYy+2lG7H8GUNoKw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5507.namprd12.prod.outlook.com (2603:10b6:208:1c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Fri, 6 Aug
 2021 01:19:12 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:11 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v4 00/14] Provide core infrastructure for managing open/release
Date: Thu,  5 Aug 2021 22:18:56 -0300
Message-Id: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:208:32a::23) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0108.namprd03.prod.outlook.com (2603:10b6:208:32a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Fri, 6 Aug 2021 01:19:11 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVy-00Dt6o-Ta; Thu, 05 Aug 2021 22:19:10 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1448e702-eeb1-45f4-4fa6-08d958783298
X-MS-TrafficTypeDiagnostic: BL0PR12MB5507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55076D887435003F0CEB3133C2F39@BL0PR12MB5507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GUljISm8nEJkOpIWBp8LjTGVH2cRQOc+8yrFmA4t8Iw/eSV3Yc3fyzoE6yo7IequNodba84q3ijvtPE0FaJT8KOVeKQuHOufDjn0tF8KDGPSCba99stpyB0BCZcY03Qp2npTAQAHn/jyu0bFIrUa39xhjJ2q+FgdTeMh4qe3/9JDC2fnvsv92WxOsi7YNyRxt3VbgE2IT3MDuCa5GAB05zQUXevbiK1U7N5De5XxOG4RYrxdPxOQQR9YZ3meU5hp4Tponlh/3L+qDCsJS9Jhkp2eCZQ86MmSKQoU077WJtQuC9veimAYTShM7sJVESCaMFud2oARIiRJUgKYhsas5zUjv9BGmMlLM1LGJ8IYRnd3+NJt3CuVLNxlRTP1QRJd+hBAVC3vz21/5rwLrE/eKTWPKHBzJ671jwx5f8glQmVXU9l5kdrcDmE6Cc04Vm0WLVx/a6UjgMI3Xk6rvStR0lf/ObctJHH20+JzOrSUoTYEIJ9RKNBha2GjYW+iXXScAee6jk6zuF5Qvu3O9kqA9yN7i5KNM9Qv0FEGX1+vj3IRzwfVprOqxZQu9f3Gibh5xHQhnctDo0XEO6VillxE6dXeQIfvH6FG7cIemxXagOjSFo1zvU6P5UUEAFsW3ocRn4UnVs1HeBSNrSVQTEzxH/GLKWZBJQ1Yt7gvbyx7MCn/vl6HRZblRpKiHRsV2/4mkoMu1nV8VH/ssfIHQ7o/G8E20PVvNYytXiWowpx6zj0HuqaQOl6QdhUPRnxjoOq5grtJNvUSjnAZ1oDT/5ixAEgA95PQGGgOtXyoqoy810o1Vk5+PCfP97baJgZll2jOwB/Kh5o775LiQHRxpfODxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(4326008)(66556008)(110136005)(2616005)(66946007)(66476007)(316002)(186003)(426003)(9786002)(54906003)(8936002)(5660300002)(9746002)(26005)(6666004)(7406005)(86362001)(7416002)(2906002)(83380400001)(921005)(478600001)(36756003)(966005)(38100700002)(8676002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g47zS+BttMt8RYS5fLq+cQ+jQNIrqmhY+qZnV5njurLabjQSoCW75lupHwQC?=
 =?us-ascii?Q?whT02Z9EXjkCemd0+l4UB5RgdvBVuaBvGPOF+JS7G0FxWfgba7CAsdiYLEqK?=
 =?us-ascii?Q?FWxBMIpjUHI5XKDO7+eHYii+giJ/HQ3ioIckPwuHeEz60m1YWfo00t8i8H4u?=
 =?us-ascii?Q?COHp+QyYdX4tsTCCmRve+trQHFSTxWVOupF7ttzxLbfi6N88do8VGEUWLwrg?=
 =?us-ascii?Q?/voEUZaEts6IxBemkS9KLoOQlmVRPxl55U+BAYRac2kkArsWyUpj2eYKUywP?=
 =?us-ascii?Q?BeUmxc4qD7lrXDBqrnVJtQKXHUb4CfOeMtFh9HKlOEAAry5tHETGJ7XKgZLJ?=
 =?us-ascii?Q?YC435mTt/iCStO452RyoURM6pZbeKUvMRsnIC6yL9nxPGSCjZVXLs1cQ/9rf?=
 =?us-ascii?Q?Zjm6qsnGiZk1rnAy84WizadpTMOreNnPR4y7eJWb+CgMd1V3SSBTwIacWRkx?=
 =?us-ascii?Q?eNB2yKwBzAh0T7jrIUeljOwP3f5KvKpv+homw9K8rRulkVjaK/JMRuBoHMFm?=
 =?us-ascii?Q?MT7G3uwOcVoSoLgjasvL0Gf3IFeJk/EtdptPRhbJu8mK+YmQcRBRxv+joKFc?=
 =?us-ascii?Q?cdtcvgIwjmJfx3wnLKxiQ761ekcx1AeXmgym+Aow8X1NL2KWtoeppspJbwPk?=
 =?us-ascii?Q?ARtPbl+CAvWT091dfJB3Ud6Uy6nw2LlmwWnyhXSa9UVEiiU0b0xW0ZCU2UR8?=
 =?us-ascii?Q?cEqdK9JYU0bZ5K/CyQnxbLUbjEmA2RZQSyIY60hf13taz5N/GAOsXVVmOFHU?=
 =?us-ascii?Q?KrXO5KrKELS2WvEYBTsMZmbtaGmO8fbzFqgPSnTslkbhg8BrSjxOQ9ktufc7?=
 =?us-ascii?Q?ban79AIx2eJnWhnhOB6rEUedwt1mlzVu2UYzxmRUYaUxYVhlaIgjoSSCuCK+?=
 =?us-ascii?Q?MXvFZjVBViZD4xXCnpyAJbaW+EoQsxO8POyKZq/bMxSxMqLzm04HXdQR+YaD?=
 =?us-ascii?Q?m5Xc1qgBWYRUOLD3wfcRmbSJYGyJ2UIn4TeJD+xImFTvKKx7xW/gxx8WTZ5k?=
 =?us-ascii?Q?rJH2+mfbTD/92n2aj/pX0GvPAIlBwdZtXiQ04Cc/zRnHvibakmFiCPnjI3lr?=
 =?us-ascii?Q?aakt9vDe4SkkAAYKaY6luMiJNeJRCVpxHizWQIb7MIVj/GaFhJ4zNkVEIvjG?=
 =?us-ascii?Q?rg1ZaHsRXIyvLyLZuq4k96ZGrvx0o2Pt4frbd19um6+bZn3IYhDXSG49UAMW?=
 =?us-ascii?Q?zCFQFxImNzARM9Ii5v1KXUxzTHB88EGZiWhUVnFDtpzWi4H93e+63Qc9kJZ/?=
 =?us-ascii?Q?kX9KSoF62FufJMSAvNsnLZtZO0qSOlbTj338orHCUKj8c+IvpvH5NWjvT3NQ?=
 =?us-ascii?Q?wtclkZbST8z4RvaUh+FBGJ+9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1448e702-eeb1-45f4-4fa6-08d958783298
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:11.9022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hk8L4kYISShOz8KP4iK8uHp06uWqu+40afFMHoChUxTf81g/56xVwxYKFJkh49Mf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5507
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is in support of Max's series to split vfio-pci. For that to work the
reflck concept embedded in vfio-pci needs to be sharable across all of the
new VFIO PCI drivers which motivated re-examining how this is
implemented.

Another significant issue is how the VFIO PCI core includes code like:

   if (pci_dev_driver(pdev) != &vfio_pci_driver)

Which is not scalable if there are going to be multiple different driver
types.

This series takes the approach of moving the "reflck" mechanism into the
core code as a "device set". Each vfio_device driver can specify how
vfio_devices are grouped into the set using a key and the set comes along
with a set-global mutex. The core code manages creating per-device set
memory and associating it with each vfio_device.

In turn this allows the core code to provide an open/close_device()
operation that is called only for the first/last FD, and is called under
the global device set lock.

Review of all the drivers show that they are either already open coding
the first/last semantic or are buggy and missing it. All drivers are
migrated/fixed to the new open/close_device ops and the unused per-FD
open()/release() ops are deleted.

The special behavior of PCI around the bus/slot "reset group" is recast in
terms of the device set which conslidates the reflck, eliminates two
touches of pci_dev_driver(), and allows the reset mechanism to share
across all VFIO PCI drivers. PCI is changed to acquire devices directly
from the device set instead of trying to work backwards from the struct
pci_device.

Overall a few minor bugs are squashed and quite a bit of code is removed
through consolidation.

v4:
 - Fix use-after-free typo in mbochs error unwind
 - Allow mdevs to work when they don't have open/release ops, for
   bisect-ability
 - Redo the vfio_pci_try_bus_reset() patch, make it dev_set centric
 - Change VFIO_DEVICE_PCI_HOT_RESET to align with the new
   vfio_pci_try_bus_reset() design
v3: https://lore.kernel.org/r/0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com
 - Atomic conversion of mbochs_used_mbytes
 - Add missing vfio_uninit_group_dev in error unwind of mbochs
 - Reorganize vfio_assign_device_set()
 - Move the dev_set_list hunks to the introduction of the dev_set
 - Use if instead of ?: in fsl
 - Add a comment about the whole bus reset in vfio_pci_probe()
 - Rename vfio_pci_check_all_devices_bound() to
   vfio_pci_is_device_in_set()
 - Move logic from vfio_pci_try_bus_reset() into vfio_pci_find_reset_target()
v2: https://lore.kernel.org/r/0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com
 - Reorder fsl and mbochs vfio_uninit_group_dev
 - Fix missing error unwind in mbochs
 - Return 0 from mdev open_device if there is no op
 - Fix style for else {}
 - Spelling fix for singleton
 - Acquire cur_mem under lock
 - Always use error unwind flow for vfio_pci_check_all_devices_bound()
v1: https://lore.kernel.org/r/0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com

Jason Gunthorpe (12):
  vfio/samples: Remove module get/put
  vfio/mbochs: Fix missing error unwind of mbochs_used_mbytes
  vfio: Provide better generic support for open/release vfio_device_ops
  vfio/samples: Delete useless open/close
  vfio/fsl: Move to the device set infrastructure
  vfio/platform: Use open_device() instead of open coding a refcnt
    scheme
  vfio/pci: Change vfio_pci_try_bus_reset() to use the dev_set
  vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to use the device set
  vfio/mbochs: Fix close when multiple device FDs are open
  vfio/ap,ccw: Fix open/close when multiple device FDs are open
  vfio/gvt: Fix open/close when multiple device FDs are open
  vfio: Remove struct vfio_device_ops open/release

Max Gurtovoy (1):
  vfio: Introduce a vfio_uninit_group_dev() API call

Yishai Hadas (1):
  vfio/pci: Move to the device set infrastructure

 Documentation/driver-api/vfio.rst             |   4 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |   8 +-
 drivers/s390/cio/vfio_ccw_ops.c               |   8 +-
 drivers/s390/crypto/vfio_ap_ops.c             |   8 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             | 161 +-----
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c        |   6 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc_private.h     |   7 -
 drivers/vfio/mdev/vfio_mdev.c                 |  33 +-
 drivers/vfio/pci/vfio_pci.c                   | 539 +++++++-----------
 drivers/vfio/pci/vfio_pci_private.h           |   7 -
 drivers/vfio/platform/vfio_platform_common.c  | 102 ++--
 drivers/vfio/platform/vfio_platform_private.h |   1 -
 drivers/vfio/vfio.c                           | 142 ++++-
 include/linux/mdev.h                          |   9 +-
 include/linux/vfio.h                          |  26 +-
 samples/vfio-mdev/mbochs.c                    |  40 +-
 samples/vfio-mdev/mdpy.c                      |  40 +-
 samples/vfio-mdev/mtty.c                      |  40 +-
 18 files changed, 509 insertions(+), 672 deletions(-)


base-commit: 3fb1712d85962f81265b5018922a2da13cdf6033
-- 
2.32.0

