Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837D3466E2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398256EC68;
	Tue, 23 Mar 2021 17:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59F16EC64;
 Tue, 23 Mar 2021 17:55:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gd9YSYbi24A8ZJ77mfUT+K2WxEEKXA2xOEcCdIppqUHaZhKvXsYFZ1Qj7LMc8wPmuKUtctYrWXePoMMVtk2O6TcIMGc7mfsA/lRyxl9/uFjNwUepWddqCn4QyovHK/E2BvZXlosnRiRmMehJdCbAW25fdrOpu/RB6aOuD+0STHQJ1ZSs+xeR2ByGtn27Szcmefx7JE/KAczFE8ErQZoFjv9tfY8foZR6I80RWT2lCgx5lzyEhemT2I+GEAhW62dzK3poQjMzucR/M+FJBEpFnDCddJd6sorYtcdtmM6YDqW/zwkED+YTRvWnSDS81nyk0Q4XggnrTSRgA7o00V3Igw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cB46sAu2SciDQDzTmKXSxgAAyCiQmySsGT1aw/yhJo=;
 b=bhC1Gcn9HakhvHSYqPOwKWJK3BZOlsQ9W9L6ICK3HriuP43NCeY/lm6tvo8PXPseZfETKz4SgicoiVmsf2s0Qtmn+a4RRWycSpNE7kf7BVo5q3Zc0dfdh6z4dUbr606wunnEoYW4SecNlgaGsjbiDBo5K/RzogjInC9syilmMCcaGVt4wBODQsYj3/nlvtG0jSM1mdUjAcWgxKlozRAF5lD3QEHJHrQ5Z6U3qSZd6EeW5980aML4yVTQAbWhCKTvOIMsufjzeogTbYiVtFoyOceU2ZApluppnqK8QQmshwn+/jxhO3E8eUck/KnfIvoquFmG1y3exnvDkOUtdCBi7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cB46sAu2SciDQDzTmKXSxgAAyCiQmySsGT1aw/yhJo=;
 b=YRnHheeU+Zm/So/cOl/qJMoHkYB/QGBhNNSmS4DGGNSn1/M6z5RS9YMwzEEW+CHwHJzgD1uEd4XFDiPuF6P00JsWYwxvZ4RNC50gmeWkocr4bFzXPEKZTxbepdDCJm6XRpwPqMZsdtVjOXzzVbD8bMh6VET7WFcbyLLBxju9dXgZjwUU5yPDqNUTI9laKOCwqNBPI3JWnyyn5T3ZLce1ZWmSs/7kPy/yPR/51/EAoEdmgzYOS/uERBkTUyibI4TO3eTMfZeHr608TyPerm4jYALTiXyrhgSRN5GRsfGWolIj4wQDgDgsi9P0JbCP5OZblSk9XlkTSD4OgJlf+Upyrw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4943.namprd12.prod.outlook.com (2603:10b6:5:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 17:55:44 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:55:44 +0000
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
Subject: [PATCH 00/18] Make vfio_mdev type safe
Date: Tue, 23 Mar 2021 14:55:17 -0300
Message-Id: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: BL0PR0102CA0030.prod.exchangelabs.com
 (2603:10b6:207:18::43) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 BL0PR0102CA0030.prod.exchangelabs.com (2603:10b6:207:18::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 17:55:41 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOlFf-001cgN-4b; Tue, 23 Mar 2021 14:55:35 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c95c21d7-1be6-4a9b-d7dc-08d8ee24dfc5
X-MS-TrafficTypeDiagnostic: DM6PR12MB4943:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB494349D76CDE94E9A4C36164C2649@DM6PR12MB4943.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95OIdF3tDilJGswE5bYcVx4FnZGlswa+LJA+7F8vKcmP0uc8WrIaZd8mWfw21F8M4cjIT8gmsBzPMuw92tUB8WoHJ1GGF0OToGjc8CvZBzcn8Bk66Y4lhVx9otrlnUVrGi1B1iCENACIB8FS715B/EcIvGwzfhXEUOTsEYYdjnhvkGzzfmT7Tv35Wb1PWlG9R26n/CeQ5KudMiwPsEadaX08+CCtQDO6NseVxQl1SxD4l3saiDlth0Gf4hh3PoNzIo58pr+H7zSp2+CRpbbmXVg18Otx1kQpyokUbXgEb2CR4r404WaGWqIaeMNSNPCiJKgrPtJIAs/7JeLS9ntxi6fhOBWxQ4IQZa2wpUKXV6/wlij7L33UPjft6eoBoWVIYXGhuhNhcd5I4RUSXWtzgLlLm5/k4L7tWF7dXY7ZXh/4OAArDZd+8ufN0jyk7HkJVqjhmMbTk+FLou2Twrxt0KmMR7MWP437wxktr57VYxzmzEzd6uehxgjhVIAAWXLhOaqrQ8d0TO3naCLoNqD9ugqZQk9uMami7FAEx2MaffkLE0PudWq7yJZh0ib7BwSeRMkPCYawVq1eKAi92ImCjfVf9PjetJldoyerOLVM0sjarkeiQeME3wg0saECio7u1DFWYUmsCY0yL5Xa7GjvNvUE5SjNBnGN9PMJ+j0I5Ex03jSaS8vB9CixvK1j8a6q1EMBVnAd++Yw0ugpDO8N35J3AZt+edYNsHw5/Dbu8HEn6UZwgtqMsN+As8L4GXgYasJKjNVL3eKceHrGhiONnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(66476007)(186003)(107886003)(6666004)(8936002)(110136005)(36756003)(426003)(86362001)(54906003)(83380400001)(2616005)(38100700001)(921005)(7406005)(7416002)(66946007)(5660300002)(478600001)(9746002)(66556008)(8676002)(4326008)(2906002)(26005)(316002)(966005)(9786002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Barf92TEnVhxUlFj8VkY0tehCEbocCtWIFasMdTagPC7fvi402RbcB4sYMLr?=
 =?us-ascii?Q?R3+b8DtagKJl29/bMI21ribFTLoN1s2ecg3kDWgt2i0EQT0nuwgBFMx7559S?=
 =?us-ascii?Q?+ghMISTOgsNuXXgQzUDFlGyq4zYHAfbweyOKoxmpTdtKAGCRsq6rmxuZCqcc?=
 =?us-ascii?Q?5wgmfPcfbRpmMc8NylZEuh1szk6a9p3Lu+fOUFuPES11rQMJEMZLdM3AL09q?=
 =?us-ascii?Q?ePUeqvrrT5lu8+3jpEWn8A3NLaAyGeEGcORKHbnhkDaqRMDZZH4QbHX38G6a?=
 =?us-ascii?Q?E+FL/djDUzf622shvv5KZqxPaisckmN1p+CSo4o0OHUwPK9UPcWRub/ZYMDc?=
 =?us-ascii?Q?5XiKYFMhy7SER+Spmc2avc+U7yUR644OoyWoi1Pz3xk32GXda9S32QHNwZPz?=
 =?us-ascii?Q?xDLoGvdTTeD9dXQ/fc2tJk2I0+hDg6iEVQTkuxdAiWBX8oBOB6lXJAXyKtFy?=
 =?us-ascii?Q?kVUg1ltWCNaqp+3hG2fd8oHTfOegdpAw3PV6WIrB2Tv0jXePlJCEzJETlTqn?=
 =?us-ascii?Q?QE/7r+496M+0LVFVu+LC9v9qEBJUPMNWCAV6+iuBe3okSEaNgx9FcCPt92DX?=
 =?us-ascii?Q?TIMBxT57ORkvGMucFpqFosl3xjT35o/R7uDWyO5cGsxnZkYQSa0DvEMa4NvO?=
 =?us-ascii?Q?xz7jz45/7nCw8dapJpAkLFnnJ1BZsxOKzHfjO5uyXj1+8Z8e41Qmow2Y2bK8?=
 =?us-ascii?Q?56ketiGmbUwdIRH767p3jm1+qr/CCiRYrBnjMXzOlWbWLzscxNDHfIwb8dAO?=
 =?us-ascii?Q?MKlSp7j+Ao0K/UtAqVsUL1PuodYN4GHGh9xKBAu2J2pTdAWBOM9E+yaUBDkb?=
 =?us-ascii?Q?SDkpRWdFUJ5Coy8ho53AZClIYuLHm7XrD0hx3ria3QM01KYxyPsTETAXrF6c?=
 =?us-ascii?Q?WMg2HLRIPqn2sd0SK1hFECgZ6RAk/yZJNQp55AQUUzIaeP1zDZmOWyyMY2cG?=
 =?us-ascii?Q?ZoTw499iCpuhfhCLSHhmeAl8FWxOnWK/hB+2Zu1ba41oRfZfOnQC637YWVyU?=
 =?us-ascii?Q?9Jp1ZityVXX7lRVXuCKvfHXlA18/woeAQmdd0oUCQQMh301NAkAkRuIdDi9w?=
 =?us-ascii?Q?JHakswqDKXzjQrytUygItZqg7SuKqwCILIf6AVVt2C50hni80+F26tb8TigW?=
 =?us-ascii?Q?+3SDjPn3ZjV8xosvoJXfCi4sW0A21UvQIYpE1wpXgVjDDrq+mR9VvX2tIlrP?=
 =?us-ascii?Q?2Xkq4yy1qVMTIsMa5fcVH6BvCp3ecbEB+bKFfRi02Ca46AF7QksuaqHiGpt4?=
 =?us-ascii?Q?iCUsaML8wifuXuA/CcJ93ORYhVk7NlU0TpqQ5448iaIwISZGe/Ois+OwxXd8?=
 =?us-ascii?Q?m6au5WkdUragXfrGPZjR+0Yi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95c21d7-1be6-4a9b-d7dc-08d8ee24dfc5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:55:41.5272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BipZJ1FNj4iKcf3aXT3x7UX9hZKdcNuxcW3+zKsbXYAtWbwyZReWnwwQhaFdLl/M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4943
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Jike Song <jike.song@intel.com>,
 Neo Jia <cjia@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Dong Jia Shi <bjsdjshi@linux.vnet.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Tarun Gupta <targupta@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prologue
========

This is series #2 in part of a larger work that arose from the minor
remark that the mdev_parent_ops indirection shim is useless and
complicates things.

It follows the "Embed struct vfio_device in all sub-structures" already
sent, and must be applied on top of it.

A preview of the future series's is here:
  https://github.com/jgunthorpe/linux/pull/3/commits

========
This series:

vfio_mdev has a number of different objects: mdev_parent, mdev_type and
mdev_device.

Unfortunately the types of these have been erased in various places
throughout the API, and this makes it very hard to understand this code or
maintain it by the time it reaches all of the drivers.

This series puts in all the types and aligns some of the design with the
driver core standard for a driver core bus driver:

 - Replace 'struct device *' with 'struct mdev_device *
 - Replace 'struct device *' with 'struct mdev_type *' and
   mtype_get_parent_dev()
 - Replace 'struct kobject *' with 'struct mdev_type *'

Now that types are clear it is easy to spot a few places that have
duplicated information.

More significantly we can now understand how to directly fix the
obfuscated 'kobj->name' matching by realizing the the kobj is a mdev_type,
which is linked to the supported_types_list provided by the driver, and
thus the core code can directly return the array indexes all the drivers
actually want.

Jason

Jason Gunthorpe (18):
  vfio/mdev: Fix missing static's on MDEV_TYPE_ATTR's
  vfio/mdev: Add missing typesafety around mdev_device
  vfio/mdev: Simplify driver registration
  vfio/mdev: Use struct mdev_type in struct mdev_device
  vfio/mdev: Do not allow a mdev_type to have a NULL parent pointer
  vfio/mdev: Expose mdev_get/put_parent to mdev_private.h
  vfio/mdev: Add missing reference counting to mdev_type
  vfio/mdev: Reorganize mdev_device_create()
  vfio/mdev: Add missing error handling to dev_set_name()
  vfio/mdev: Remove duplicate storage of parent in mdev_device
  vfio/mdev: Add mdev/mtype_get_type_group_id()
  vfio/mtty: Use mdev_get_type_group_id()
  vfio/mdpy: Use mdev_get_type_group_id()
  vfio/mbochs: Use mdev_get_type_group_id()
  vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV
  vfio/gvt: Use mdev_get_type_group_id()
  vfio/mdev: Remove kobj from mdev_parent_ops->create()
  vfio/mdev: Correct the function signatures for the
    mdev_type_attributes

 .../driver-api/vfio-mediated-device.rst       |   9 +-
 drivers/gpu/drm/i915/Kconfig                  |   1 +
 drivers/gpu/drm/i915/gvt/gvt.c                |  41 ++---
 drivers/gpu/drm/i915/gvt/gvt.h                |   4 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |   7 +-
 drivers/s390/cio/vfio_ccw_ops.c               |  17 +-
 drivers/s390/crypto/vfio_ap_ops.c             |  14 +-
 drivers/vfio/mdev/mdev_core.c                 | 160 ++++++------------
 drivers/vfio/mdev/mdev_driver.c               |  19 +--
 drivers/vfio/mdev/mdev_private.h              |  40 ++---
 drivers/vfio/mdev/mdev_sysfs.c                |  59 ++++---
 drivers/vfio/mdev/vfio_mdev.c                 |  29 ++--
 drivers/vfio/vfio_iommu_type1.c               |  25 +--
 include/linux/mdev.h                          |  80 ++++++---
 samples/vfio-mdev/mbochs.c                    |  55 +++---
 samples/vfio-mdev/mdpy.c                      |  56 +++---
 samples/vfio-mdev/mtty.c                      |  66 ++------
 17 files changed, 306 insertions(+), 376 deletions(-)

-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
