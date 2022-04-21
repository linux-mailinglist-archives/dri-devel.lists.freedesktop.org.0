Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08A50A563
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7257910E0AC;
	Thu, 21 Apr 2022 16:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55CD10E0AC;
 Thu, 21 Apr 2022 16:28:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsnB6B4d8oGR1zQuHEFPvXo7fpf501q+NiCQakSJR0QixPpHVTOV4sZu3k7U5IUkOMs4jX1NnRuvJcMxZc/APHdvejGSy86/3rzYly+EhWlMmwR5qZ3ywsOr6ZTtwzvHGCmcVeHfPYbsvy+qEd7SVSqYSHvxxSc056cTD84xFXqZVSYAXZlgWYflmkzj4dHuFYGTG1p0xJaXd8e4oVZbgTYwsba1heue9h2Sr0Ys7rPA1LXlS3NlKeYy1cGAbrbzoPmnrwm2W3+KwMpjlb3Iir4R/DxzzjlshoVvl8dt6KCUo4ZZFlis46FguA54KWVQHg43EtO8sGdDQ2w1gaC/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bispNZajcvmsByoqo566tfpFZgr9cqQv06V/wVpCJbQ=;
 b=CBJRU/nl5M0eqTAilPbukdZo+r3PJo6H7r5r8D3jKFtEy2qZqlw+suADtBgkI4pE29V3M5J+0JpnPfQ/EP5pFIqZuqxjTjVZJ6wa9e8KRxRs85bzmoTPuoDxmt0VjBcB5YAsdXKScvHggsiGiLj8GnxVkCCaEMX69wKAAUWuDaXPQ6m0BOTbFAS3nEGNNztIaI/P7qFRp3VHSn5jae1u6OyXODaS8qAIAy904KFkqMhtghpHncsmd1ENgxTinVCbHpD0GQbgovi0FdfJazA7ZVSRQ2pVnT845vuMFthbh232t8Bbya+1NZSY+mVJY5wV3lR1PIY7zJM2qvxAiv0E3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bispNZajcvmsByoqo566tfpFZgr9cqQv06V/wVpCJbQ=;
 b=CrQMgXl/YQT+kaotBKUq1quS8ztT2lc/I/Y8ImDdXzAL6fWt7HV6eRmDltaFMrTWQyq2ufPYCIc8QcIwSUI0obvngJAKTmuf6e0mfNIwJnYIHVC2xB3wZbbs+0WhJMWDp70GSuj5YS39R4PYd2G8WZ/tKXQAYM+T4SdibyNcRDCUfHP3EKXABlpsxQun+hzTrK4SOdGlOCSNr/EHxlVNYR0Lfgpd/NIqGD7sap2wM/VnMwNiwBqlqYW9t9Z0Q+TdKjMkbQXqg1jvwbx0e2Ghnh8qE0aRWeeoGT6gQ97urrap+cbLtq68y5CVi7SsN92mQg6HnOT+il5sEWXI6GbQpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB2907.namprd12.prod.outlook.com (2603:10b6:5:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 16:28:39 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:28:39 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 0/7] Make the rest of the VFIO driver interface use
 vfio_device
Date: Thu, 21 Apr 2022 13:28:31 -0300
Message-Id: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:91::16) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bff6123-0065-4e6b-0824-08da23b3fdb5
X-MS-TrafficTypeDiagnostic: DM6PR12MB2907:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB29070454C3455FE6212117CCC2F49@DM6PR12MB2907.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dYTjnMjgkExXnHSjEPTV3Im4hVr9gyNDAZ/tFOyCOEhV4LAqCikpOLW3TCqXd8t8JRNCyXWUiRnryTqndhgTzonKroYZsK1bcYQsUVtNqmnxmFPSxuu7wcFVAkkHeKh895KNq4MwaaoeWDWjdcv4gL/Xx6BLhcaiQKgeYtSVsKj0TYPXxZx7wE/OXS1fn2WbD9t+PykfX9hk6dCf1g39+FmX4Mtzl6MdQ9sRsGPY9V7YF2eWQGqLrOp0nAwKooCCs7pkJ9OxhSocXTGwr7JkfeGeuFXyM3Ey7tv8Ns/tcVvk1MkOdusNZslY6ToYqJ9nB3e99PqlhC68pKXmlAFpPvAvQ8YUdiI9vn26DZMj+/tRbjkuDqRdXsgFSY6hngdO+pp0/7zq10g7H+7EQCsNBdwv5CjTPdAPDpjSYJGyyNzdtN4EyhagtA2sl4aKZLFHj+VPisf5aP7AhUQ1O+GFbNdZraJgNhUw/eflaS/tjkDdNUqMPxykRyImPrCl1a4rpP6HNoJVTfcrZbdRQF1OjtefsYGwj2Ls9jqgLiYdhmJFeSBK7iLjVEjuLv36SRCAoCFGi7MrCOsBnqiv9BBshXtyM87usUFE8Taz+XwTUgitr8eI2EoOgs6O1/MQ1K79xztMKAv2EfVV5ShltxrnSqTcTiXuMY4uAkOO++9xORz2KNvJzjZlQgn0vJrbKVoRReOoo16BimOQsd+Je1Fudkt5LYFDrQ6RemTYcg6IeSn2CZVhBNA06MKgJlhKiPjG6eN1ew50rKnLLBkruMxx/4TH2MKSkcMe8EbrhO20uNNhyI/kRVy565QFTRHJRlyH4d00730lzcRPltE9fs7vAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(966005)(316002)(5660300002)(38100700002)(6512007)(54906003)(36756003)(66946007)(86362001)(186003)(921005)(110136005)(508600001)(8936002)(6666004)(2616005)(83380400001)(8676002)(7416002)(7406005)(66556008)(4326008)(26005)(2906002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qNZz/kjSP4bw36JHvbi3wYP2OLmAAHnJ40za/mJcSH7jwxo6LN2BkhtWFCWT?=
 =?us-ascii?Q?EynjhsIh0eG+vDXiLyHRBQCQLja8uP9YePkgNXyKJj8/OAKV5qzg7g2NS/57?=
 =?us-ascii?Q?sMSMz8V2tcK6Dk87xdgTrWmhGClO5K6BjpHpxdnAiWwoWt0XKlJDItvbJG+G?=
 =?us-ascii?Q?s3bfaGhcOpVVdLlGkTfWcOeZg/EA5PMWEBSCLbyROh4iKCsIOjFpv9fin5Zd?=
 =?us-ascii?Q?jCVQ/YD77iIwpK6Dc9Eot15C9ZHPGXAMgHUUh4c4f5z9uie301R7mz+p1eVi?=
 =?us-ascii?Q?ik22x+glznwlpBJW/zXzFFEY88gu2YbkRclA2otjR3rkk3xx46rdRtqUrftH?=
 =?us-ascii?Q?sv79Sb8w02ElizkD+OKakJifOrLoxkbPkSQftVqlY43v4GaOYCzV0NjALDa6?=
 =?us-ascii?Q?bPQ4yJJQB27pd6BoXtP50HJK2g3HrokyaeR0F006VJviQxOSL7iu4QZVvOfV?=
 =?us-ascii?Q?SOZVNnGN0cpOZeagHFjvqIfJSlnhGGlUargby9RMBNOGFqzArFvVxiD+PlfW?=
 =?us-ascii?Q?8ZQ0sqbnxUGjK1/ySNo3uaOHKKmieTQH2Aaqg8Z+aiO2GHZH6pha01h4RdPK?=
 =?us-ascii?Q?r6BjFXgKE8z9bKfLFg68RU1szQFckdLtK9eecNIphITSiyqgdTr4Me/jJHpa?=
 =?us-ascii?Q?9VWXykWkxBY3M4XRedWK9ZYjXtePOrGaCj4YndPQY5saXKnHvJyRTYq29QTi?=
 =?us-ascii?Q?3xftdLyVqqfNdgxJdQrfXFQozlPwn8DjQvIs60FxjNObV7VAxfuBv/NjMb4Y?=
 =?us-ascii?Q?/ujqG7cVoO0ahTjXRcHRQ3SAJHoTqS1w3A4LGVT6baNaa8MVKjxHwISifbnz?=
 =?us-ascii?Q?A8Wn/C10nwlyJUecmjYBu7SHwbMHrRITVYOiMObXntg0/Z6I7ude26SZjgCB?=
 =?us-ascii?Q?i27e97AqKAWVIlJZieKbFoykYOPmtjuJd7AXNFXxEufLWT5VZ6ZUe9ZMJRkW?=
 =?us-ascii?Q?d9lsmF2sZFGv3bl6sQ+IWVhTfeDH9dkk6Qon4vTK+1W0GfgRBXu//XOhswhK?=
 =?us-ascii?Q?ob1K9u3bul3tOwVrQOLDcA9bgeNEBYOvkLYTLgdaR10Z0Ag1jJ2mAVN0k0O7?=
 =?us-ascii?Q?HvzSXBhOzDsirElHeQE1k9LtHUuGoguEcYL5Rl7un28TNDzAjBpHHTJz9a7d?=
 =?us-ascii?Q?KEoBDwOAJCqbCHYUoz5ImVY7KnXxkvsYioSd3rIYSa4ikHajB08Xt6vvPmTz?=
 =?us-ascii?Q?xeBHfoHllspKq02gj0LfyKNt9dMHCaPi4QgyGeEjw+IorGi7t6SJeYcyYtXf?=
 =?us-ascii?Q?UkLyfiCQFbZn+xWrpAP12FE0NsZtmhen2dZZowITjk8KKHZi3U7ZG+b7qVEu?=
 =?us-ascii?Q?P8khZtNl1b8tefJ/KatCf4bKcX+n7Ta57BuX/crZQQqBthn5sbZ2iytLSuCV?=
 =?us-ascii?Q?vTGoyVrz9Z+CsgLmMP5MS08JK+PM5j9Pv1h4+67SP8CpRA71lMnI3FZO8pG9?=
 =?us-ascii?Q?7G3ghCqWSbsc0naDC+Q1yrOLqI6vQ46RXQRwIlG0J84itJpkya6M2AIC4w5d?=
 =?us-ascii?Q?pVwDjy0aILsVbBp86DFJdN5axO2t091rMspBkgb4x7FqRIyn8IhLRD19dZa1?=
 =?us-ascii?Q?+O6Gm3OgeevE1jPkJfJp2ZkA1Tla7uVU5N+mgBy02+hSyuE+pNq2CmD3h/LJ?=
 =?us-ascii?Q?6u9bQBnhbP0M43CdC7tdVVuHYCoSiqJDb+BEAjN9gk5gf9krTXHIpJoaLZ0c?=
 =?us-ascii?Q?LI30rmP1B5rkfH5F4+IGav5jXyWt/s4wlutC8hotkHxWj+uORUSsmJLbF+zG?=
 =?us-ascii?Q?heeQ2zx4Lg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bff6123-0065-4e6b-0824-08da23b3fdb5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:28:39.0057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdvVziAQDw5intFUPO94W7LC3wFuOLkdahCD+SKZBzR/SWc8jNvlnmXjuzYtyuNB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2907
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prior series have transformed other parts of VFIO from working on struct
device or struct vfio_group into working directly on struct
vfio_device. Based on that work we now have vfio_device's readily
available in all the drivers.

Update the rest of the driver facing API to use vfio_device as an input.

The following are switched from struct device to struct vfio_device:
  vfio_register_notifier()
  vfio_unregister_notifier()
  vfio_pin_pages()
  vfio_unpin_pages()
  vfio_dma_rw()

The following group APIs are obsoleted and removed by just using struct
vfio_device with the above:
  vfio_group_pin_pages()
  vfio_group_unpin_pages()
  vfio_group_iommu_domain()
  vfio_group_get_external_user_from_dev()

To retain the performance of the new device APIs relative to their group
versions optimize how vfio_group_add_container_user() is used to avoid
calling it when the driver must already guarantee the device is open and
the container_users incrd.

The remaining exported VFIO group interfaces are only used by kvm, and are
addressed by a parallel series.

This series is based on Christoph's gvt rework here:

 https://lore.kernel.org/all/5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com/

and so will need the PR merged first.

I have a followup series that needs this.

This is also part of the iommufd work - moving the driver facing interface
to vfio_device provides a much cleaner path to integrate with iommufd.

v2:
 - Based on Christoph's series so mdev_legacy_get_vfio_device() is removed
 - Reflow indenting
 - Use vfio_assert_device_open() and WARN_ON_ONCE instead of open coding
   the assertion
v1: https://lore.kernel.org/r/0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com

Cc: Christoph Hellwig <hch@lst.de>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: kvm@vger.kernel.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Liu, Yi L" <yi.l.liu@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Jason Gunthorpe (7):
  vfio: Make vfio_(un)register_notifier accept a vfio_device
  vfio/ccw: Remove mdev from struct channel_program
  vfio/mdev: Pass in a struct vfio_device * to vfio_pin/unpin_pages()
  vfio/mdev: Pass in a struct vfio_device * to vfio_dma_rw()
  drm/i915/gvt: Change from vfio_group_(un)pin_pages to
    vfio_(un)pin_pages
  vfio: Remove dead code
  vfio: Remove calls to vfio_group_add_container_user()

 .../driver-api/vfio-mediated-device.rst       |   4 +-
 drivers/gpu/drm/i915/gvt/gvt.h                |   5 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  51 ++--
 drivers/s390/cio/vfio_ccw_cp.c                |  47 +--
 drivers/s390/cio/vfio_ccw_cp.h                |   4 +-
 drivers/s390/cio/vfio_ccw_fsm.c               |   3 +-
 drivers/s390/cio/vfio_ccw_ops.c               |   7 +-
 drivers/s390/crypto/vfio_ap_ops.c             |  23 +-
 drivers/vfio/vfio.c                           | 288 ++----------------
 include/linux/vfio.h                          |  21 +-
 10 files changed, 102 insertions(+), 351 deletions(-)


base-commit: 3515cc4aa9440795ab20b87ade2e2727267d469d
-- 
2.36.0

