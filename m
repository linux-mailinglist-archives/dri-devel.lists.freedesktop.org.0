Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D9355C61
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 21:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C636E8A4;
	Tue,  6 Apr 2021 19:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEDB6E8A2;
 Tue,  6 Apr 2021 19:40:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsJ+7OkDUhjgj4zWy3Euz8+sSyikrBHHbe+WVYst+FHYL+4/Zdm3Aqe7bDbYlgPrpv4Xi5GwVkZuLTxtI81GRgzC1DHOSi9MPe4iddyrL4V4Cxt+Dpo1/wxpy3ALsJPaUQQCqM/Xj4prsS6Sfr2bdqW9kQthyAPSfym1r0JSMZmmE3DVABz6az3EbXsSilPmr/5LumNHVDQzuOoQh8Rl6zvCSRcaUg0pPVITes9g2amGI5WdD6FPA37LRbDZpMsVgZ7gPMw0VK3u+oZWrlySSHAc6yCwHYwdBZJ691iTChQH0OvSbT4MFO49oej0wwT8p4/p/aOP+2RDNZXtP1ke7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5QJOx/zrVYe49XoE9tKWpVTR7qDZ8I9IAiVsr/SsDw=;
 b=fLxSD83i9XH20DAejEPqjXw9bzQD4yPGavPYjrimfhWdsEpQezVclPBmPX+w/odr7xd0/JJiKMkDvPJtQuzhVmtf+DijexWEEO6NL7qAhw9FfwMDDvfBqewek5iWfYaXIoA9+oNbX+9BCtxNOFcgiipk07RsB4uSQO4sunXJjKD27P1HTn7kA5DJgWUuT13g0YBHDo8YuOCmS1LR9dBfp6S3K3RqoKuCTNJW212EUDA25DcYrD61MGQro8JboFO0djF95Du89X3C2V5QOXuCVwKlKVICt3oXRFnfg7CcWvjp1hlR1Zm7nozrdcAUtJjHPMaHcLLcv03tPDRjcjPn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5QJOx/zrVYe49XoE9tKWpVTR7qDZ8I9IAiVsr/SsDw=;
 b=QBPxdhjld7XNQEyNvUKAIIoYgOXNctI5jQm3sSpAx9RdmuAmvO3U6oSnv3Snerbqga8aiz6iw7O0bDthX7UlkxJMupHG/P2zMCO6GS6deKotmTNiCaS0k3ki8/AvLJuJDZD1y2kIB9mjLM3quw7h9kFfhWbEJmtjDiNGrTozXMSc2W44gei+05bJ8NT/I19vc/ImjwHnw0KkODdH8r4s2cFwQLMhZQWV8IBtmQhvdC/tnBU8pPxHVeQsUZtzQbz70ozbufpRN1SHqlZje98x2amCCxC3BYJQK7McoQkCbM8Tr3EYpLzMqv1egd1mvm3H39QQgmM3ef6di6XnUICPfg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2859.namprd12.prod.outlook.com (2603:10b6:5:15d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 19:40:43 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 19:40:43 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
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
Subject: [PATCH v2 00/18] Make vfio_mdev type safe
Date: Tue,  6 Apr 2021 16:40:23 -0300
Message-Id: <0-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL1PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::25) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL1PR13CA0140.namprd13.prod.outlook.com (2603:10b6:208:2bb::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.9 via Frontend
 Transport; Tue, 6 Apr 2021 19:40:42 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lTrZ3-001mWo-Qr; Tue, 06 Apr 2021 16:40:41 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bec7c2a0-e204-451c-e1fb-08d8f933dd8b
X-MS-TrafficTypeDiagnostic: DM6PR12MB2859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2859F6715AA9EF832DBF7099C2769@DM6PR12MB2859.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +J8XcL0jLBVBZcI7QoBk6WfISVOpBInknxAWm4K2zSbekhMqrvF6HBrzhmBp1WizhtqZq+RlHMRp7tcRNqhWl3I1wSITQK58LUiJVxqOgTfVAc371BhICGiHFUZyMzShyFVmaxX5UzH+EdDjtDH4jbmRZfDI8KDJZtrc74ZVuIhU+aeIB/fm8jbgHzk6Mt1Xa9caKl3UtHZYkPO6LycMHCZJoxQsxb4T73fJIfdLx6gdTl/7AgTjMBmwCUv+iJSB293W7yIi+u1udy1os8Y/8r4pokyh9K+ti0r6+GgEWKZrIkn7KGD4pX5w6RxtR9d6KEzLlvTNdk+LHFYg1e85xQ3xssp8mOiKRnb3f4NtNaFaCVx2svj54SMKTO+t0z0qM6hoNKp29a2gG3uwFKfPZXQp37EfSG0OnOVZcJ6PQGmc1w3N7H5KONAR2Biplf3TAc0uVgwLch7XbbL587Tiss879odAt3+XqS0Phtl6UIT51llK0NboNEHQqo+FflkSa7/qPazjFGvn0BycQfWNwOn0jZUia/+KfL4maa9ToGa8Y9vVXrpd42J0VIAdj3h+feJqBVdxyEDhIvvfGBr8Gdo+fb4xQvsfuh8pK+rhm7kXDAx3hEZv5nojF8A84cmJOjeoIGQJmC1zoOaF6b6+Yu5JTmPS/8W0ZFbOnA3mZcnip03tMZ9emA12MmQnQ/qZEKm2uwyZ6HkwXD/gQahXRtCLSDaceFrvypcZ6U54nzzs4xwgHRYaCRtpQ9G5kXwh6tNMdBBpqfuII7/Un/l+Mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(54906003)(86362001)(2616005)(26005)(8936002)(38100700001)(66476007)(426003)(7416002)(66946007)(5660300002)(316002)(36756003)(66556008)(2906002)(7406005)(6666004)(107886003)(83380400001)(186003)(921005)(478600001)(966005)(110136005)(4326008)(8676002)(9746002)(9786002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XoyGl2ea3PznBZNPO3Y92GRSphjz8+E3Uo0qRGpiHGE+K5p3AieRH/PxvIYn?=
 =?us-ascii?Q?DoMD1EXwonLSsBnXLOrFJk4IxwNVRMoPmHefijo+LcuFr4yFZWK4arLxyi/L?=
 =?us-ascii?Q?gJYUh7iMBy14SObA3U0hVp1gVKi4ZJvXoeOkTeGZGQ01wUeqN5OIcwbEPFY8?=
 =?us-ascii?Q?UnEU1uD4FIjRUkZbVlLG0XfqJIMN6sohFukKUr0YZnxFsDDJWZ9Z+nmfYsOs?=
 =?us-ascii?Q?zvApWbbtFfaOUcn6peeQtCVdJyllTz3yhqWOl9btWo7ERFhvycOq+Xb8v5GZ?=
 =?us-ascii?Q?S04PimH45b2U+APtrZMHneCmGCta/5jTtjRemjuk6DCxOHHyOf1+MhfOUk6A?=
 =?us-ascii?Q?YokX5gcFRvjStQPHciuKAi5r9ZIVWB01LiZaKC8IwoyZ3iBDShQuX4I9eiZn?=
 =?us-ascii?Q?cLdO2qDPSNFPTFdD7E0dojiVM1qrf21CmPv00EXkt5YVl1vsBjK9hxe1kHnP?=
 =?us-ascii?Q?xc5WqDUuhCKTLCWjWBYxK1edNQkc1mufi841ThJsxYdPEUowQ1Hp6oLitvI6?=
 =?us-ascii?Q?w6TWLiz1TLSR5zfCS5QQ7gOMuXY0+4EpXaA81DUMOMCkJMFRlpwhC3QJx9bJ?=
 =?us-ascii?Q?tSM1zHevDBmYKHSsWng91kgP326MskoylJ14pxseTHOqVmWegDDs4dbxK5Jk?=
 =?us-ascii?Q?3m+T755yLEWU9PKH2RKLSNwo703kOSLxHo1cCEtWVmf86n50eOs5NDvSE2nq?=
 =?us-ascii?Q?EWXydDCv5h0T0mqbRZCcvni/om4lWuJA4hyxc5nWiHfxnJ+Qz60z5Rz7Exu7?=
 =?us-ascii?Q?scTIkOKpSE+MNotgVNWkZZdlopvRYWa3v0q7DNsSU6hpRpdY3Jb9DRXh8pGk?=
 =?us-ascii?Q?NPR4z9j1+QgxDaiFw3WOit52J++cjrcG7/pDmgt8ItruQsAAb0ZSGFP75+Ur?=
 =?us-ascii?Q?jAY9pfbQQaEGX14WvJGxf3tjxJUSxjNsDtZOuO6vDWtjii6MXttZHW4UbPUd?=
 =?us-ascii?Q?o6g7hrfqs81io8k9Deas33E4icucG2QOC9X0PzrU6HBhI7efQghywa5c2D43?=
 =?us-ascii?Q?3iYddPop8BHn2I0KFsziRWUdddQhHSWj6IbhZgWVBPUGPbEKECXXT/4pANQv?=
 =?us-ascii?Q?m/N/IplCE5JwQNKV2EqBkxTzv5ghVR3CuWYUouiwo7c2qEl5YypDVvlDONie?=
 =?us-ascii?Q?ude0wNagWyr41jyNdrUw5xoL70a6kK4gvjkIag2hvgaS2H4y0BkSLXNb6tXB?=
 =?us-ascii?Q?6BaW9XCkSUWM6vRiqjtWU73LDvQlws2733VQTjk41LNBo/V8UBQ5ABKZIA79?=
 =?us-ascii?Q?5HO1GtEED5DdgByKQ+ZtFS6MLKPbtsrhz3gOfZDNpaXM5aXmkiEedaqmJSgF?=
 =?us-ascii?Q?XNxXQ0czhedQNpzY7VNDGG5v0uONVLuzvedCd/U9iFCzOQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec7c2a0-e204-451c-e1fb-08d8f933dd8b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 19:40:43.1773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjbYr5x6r4o68CxcCnAs7KaI1Hm1Q4qFG7A+i9fvl4MLOBGnGLeO38GECsrOR0bs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2859
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
 Cornelia Huck <cohuck@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Christoph Hellwig <hch@lst.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Dong Jia Shi <bjsdjshi@linux.vnet.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Tarun Gupta <targupta@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

v2:
 - Use a mdev_type local in mdev_create_sysfs_files
 - Rename the goto unwind labels in mdev_device_free()
 - Reorder patches, annotate reviewed-by's thanks all
v1: https://lore.kernel.org/r/0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com

Jason Gunthorpe (18):
  vfio/mdev: Fix missing static's on MDEV_TYPE_ATTR's
  vfio/mdev: Do not allow a mdev_type to have a NULL parent pointer
  vfio/mdev: Add missing typesafety around mdev_device
  vfio/mdev: Simplify driver registration
  vfio/mdev: Use struct mdev_type in struct mdev_device
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
 drivers/vfio/mdev/mdev_core.c                 | 174 +++++++-----------
 drivers/vfio/mdev/mdev_driver.c               |  19 +-
 drivers/vfio/mdev/mdev_private.h              |  40 ++--
 drivers/vfio/mdev/mdev_sysfs.c                |  59 +++---
 drivers/vfio/mdev/vfio_mdev.c                 |  29 +--
 drivers/vfio/vfio_iommu_type1.c               |  25 +--
 include/linux/mdev.h                          |  80 +++++---
 samples/vfio-mdev/mbochs.c                    |  55 +++---
 samples/vfio-mdev/mdpy.c                      |  56 +++---
 samples/vfio-mdev/mtty.c                      |  66 ++-----
 17 files changed, 313 insertions(+), 383 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
