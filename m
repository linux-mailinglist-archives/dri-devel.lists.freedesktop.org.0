Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155F3D9A50
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781B6E51C;
	Thu, 29 Jul 2021 00:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF626E372;
 Thu, 29 Jul 2021 00:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rq4gWNdHPMtKAECuN7dSDiftvEsrVJ2hhYLYKZDEZZ8VKK9AZGzl8glmEgoC7zxQkYCEID0vuzPHu0+U3RSZ7PfTx+w0I+EozfGpDm8wt8TG+uKNQ4TTJbnKCljiGG7jkPOOTJKGzjamwJmACDIY/S5RjH+BEa+/Esg7dl4vqHqGWRePPowc1d6LZ1TsFwVdGP5yngAJcU9xlhUnmlJCrX7Cesa4/8PsnHF79BXTDRfk+tOyl4J5moQxiqsed1MwR4z3dgkyINZhLHi6Ej8r1tVnyZ6sUu+MHYLhXNiDz1DkR7M7/13pzALBKCh7Nt7onvDH2RoA0YufjIVchA7InA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Paf/jTYWkw1MmiuskqweN6CvR3s/4SLmYIiKg28mD5c=;
 b=QR2rFL2S4obuk27PjnBiQCudp/K1EMiJWsPd2v3HyhflIuBpW5eaftAqvGfvxr8B+1NTxuMRwHeZFQ1pHBNbx6zPyhZTdegrmnN4D/MUnl9pcoQkAm9UgTzFWYAqKlMf0XPCdPSd3JsIzPbI7PjQy2e9yf5kfOY/D75zn0N7vW1hhkgYhQu2HRYLSYiljp4qFLoBrLJXOv2riEadxGDW5lOZlmNellJQhyhfM8OYR9fsyUAatnvL7XGgbAJu7FXuEg+SEyqx50WWGmBiMHrJmbzUFME4mGESDjgaAMZSbm/h4a4e1yIs9gvv05skAbqAEE5QM20bjIf3kqnDaZA1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Paf/jTYWkw1MmiuskqweN6CvR3s/4SLmYIiKg28mD5c=;
 b=J1q711OKIEeTzITjICo0PAOXw3m6QryfyoKLRP8CxLwC9930u4tLa+TROh7ykswtcKtQuopenNWrOK66ohSUnU/GfbJZJ8dVj5BEuoAoV8ipT4mJ6FDDHZj+KSk3n08V2IYCTx6qQvzcEwlyZp/l3qD9i/uedsSjlVBnJomMYHaSgoKc2XI7gQ9rzdqh27fSaBZbop2I4PkzXWWu7t7tEMxHpYN4U+Lrv3fNpuHkSxc+SKLC57BO1XcBI5H+6SZhcr4AAQSRUxQZtEbPcPPol+2yIvGid7jXQV2BjFoRHtu8fcvlq1xK1hjThlkAsKYWqNe9SAjPkmKcRx26dB3XoA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:25 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:25 +0000
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
Subject: [PATCH v3 00/14] Provide core infrastructure for managing open/release
Date: Wed, 28 Jul 2021 21:49:09 -0300
Message-Id: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::43) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YTBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 00:49:25 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEl-009pmd-MG; Wed, 28 Jul 2021 21:49:23 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad08860f-caa8-44b9-ea12-08d9522ab662
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5160FD9D7EB54DF5EDBCD2BEC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdFQuRbJMf95weNFF0w7rOMot7C3ZfPpST3foZJHKBi+4WALyn5ShBbmyaoe8gP0usnzh2gnYlQjZmvYUWPbIm3AUCGO9YZJwXnrVJM1+op08oUwkDVpX6YS/dVDu34hmGgBu47GXQbYsLp++P5ClTqen2do6lFHQ1jRcMBPjO6DAhEIJMf0xLsd4jAN3o1TM3YbbEiNvV1beVDq9/Wsgf8jXAvQwqwwA6T9jo+x2m7E7KQS9bzmL/qrU7VPGDSy56820zClOMHUk5AR47fzUQ+pwkNcjJRPmPQDrJwmN+RUMzKQMW4YX0G9K99vKC6lCAe0alTDrsHQs4GToQiw/Bq1GwYS3sLTtBZqkLsRQ1gSajmtosXgwPjLsMjNGENRR4GL1SdReCQk9a3GIBFJL+jeeO5fmpGJvbW0r+zrlik8ouxcKS4JaQwxt86HU1Lg58ccNYgnKzkvs4FZtD7bC7Rcudmb2yEUTgaz0UayUOBxfJqqnX/voT2u+wSCmuOPOeasr0okrD/XNuFaotDI3hrlpP8mICJCu++Q5GWsC5q6GCG4FOqFMsYm1Azx8YJwMZpZZEM6wfYFNZ/t0EyhsyPIXQEp/pHAcNu+dmcPqj51ABON703cE0aidGyWEKEfAugu027ruuSpFd1gWU024TFe7+B9ueoisTDnfzUy5aS0y4Ciw0/Q64wYzglQRXCUloZOJl+SjfhUNuQOD24gk8QETM/MUThD9A5PZwpRGwBOV80GzdTadh13bab/98oWDNfXStDbk/13+KYdKTOaebLvAjx5awy+K78DxV19aJYm/o1ouCML0bZkTArEFnyc/GLW2VDut59aCOckJ7U4sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(966005)(478600001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MC+EkU5vlU3+0ScxUnj5xro7wYoFH9vSusD1/HCVZu3ufpKmgDn2eBixSSAf?=
 =?us-ascii?Q?p0xWniyhAbnC0Mp2q+8eO4V2vFJ9iiTEsB87wW2cWBgsI9wZ+wuq0CpaZtgD?=
 =?us-ascii?Q?0MOA49y5h64+jbzpqlsplxis/Vwx10QPOpmm59B+Nvi+AlLcS4Z0V1kcM3a3?=
 =?us-ascii?Q?vk0R1vjFQ5wgo1ZvdgWMDv5dTGGWrWDgVrBIQhDlCZx83w9rNlNzqTNwK4s0?=
 =?us-ascii?Q?V6E+lLo+XywKglPZbR2yVuxGAa1VzDjVpGio7gDjJ2XziBbnIGO7Rk73g9Ce?=
 =?us-ascii?Q?4qJTX5tFYZzWigtJiMqJrdINbelrMl4WA6qsKx6q8OXsUEfPMH+GdHHe/WqT?=
 =?us-ascii?Q?L96t4UIViWLNW4FYXI3YOhiGXtv+X5qfxH3+beoe5N2SzRMJnJlZHBYZswZD?=
 =?us-ascii?Q?WkxzC4wh3A2q1xnTaaDMQx4T5sTZ5IGJyV4xIPSCO+/XB4iaB1upcQatvbwF?=
 =?us-ascii?Q?m2wVAEOfjCFYdMxiGKsty2Adg+HA8Rw2UMEHWlwUf5KeeKoyneUgiYoj9lST?=
 =?us-ascii?Q?iPj/z9duRwriXYLGdw3igDjXbaBIRqEBcoBmpyhJb+2biDuSe+hcKCwOtzyp?=
 =?us-ascii?Q?uNDHM/fLKV97CYEgNsj8nTAo+DHZnnRqkUBwyQ3bvvC8xk6yiUuqwF5pMa49?=
 =?us-ascii?Q?ie66Yz2tgof6zmMg7AsIL53EZRqDLgQ5Arx/zRTK3zYHgYoc1nqq0yMm6p+m?=
 =?us-ascii?Q?8LAyYXman3nlZBq2ela+KJCEAe8zyXwXYcvSaqSsZeyPKqH7w+mjtD80K7O3?=
 =?us-ascii?Q?5XUoa4D82mZ0dp6onKCTB4aO5c8OZSgzSlQQQS2b8fDDSlLsHibLDST4B+P4?=
 =?us-ascii?Q?PyYbWn1OYq8rGzPCumD1fjT+9w6XBTAI7WQat7WCgq5xb5x5dpT8p1B23ocF?=
 =?us-ascii?Q?wC0HdTP4MgCWLs3o9Kq3K2Df1KYUMOc/zWoQClR7AwS02ECdB7sh0Zuf8K+n?=
 =?us-ascii?Q?YQlDjbF+GJJ+wDgsAU+wZx5CgMuVD+qxv/NrpkYMWqOsL7o9sZ1lGky5QAtX?=
 =?us-ascii?Q?tihNb/og6ZSrDz9KWbuEc5OirqPGELYeDI3DxTXp6u4Wf7kJfr34BU7Z4Kgz?=
 =?us-ascii?Q?G7QRNJ8PgUPEOF+wVYOCj+o5dnWaJPUpR4eu6VKKOfleYC2mT8YNGuu2yjLu?=
 =?us-ascii?Q?NQJfXDxoRDyzUmj3zARy6KvNvv8/k2os9beVlR9D+jKjnGEJswfrVRb6KYVg?=
 =?us-ascii?Q?HkgQ8idiUuQRiXKFC/Ur5736p/wONoRsbtEf3n4/GcXQyzzv4pEtTsmD7W22?=
 =?us-ascii?Q?PhWdeMU0Sxx9sXAMTeCqr2uEuy6zTDTY7lsSN/uxEfahx3AVYoeb6lXgZVpT?=
 =?us-ascii?Q?WioKAjtVgh8I47urUy8GD347?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad08860f-caa8-44b9-ea12-08d9522ab662
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:25.4334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDiCXB0nJul1NzL8YVnc+1OK6W7ZBBDDtQkfPZMMti5orGGoPG8rP/JaG6Rn8QiP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
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

v3:
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
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             | 159 +-----
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c        |   6 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc_private.h     |   7 -
 drivers/vfio/mdev/vfio_mdev.c                 |  31 +-
 drivers/vfio/pci/vfio_pci.c                   | 487 +++++++-----------
 drivers/vfio/pci/vfio_pci_private.h           |   7 -
 drivers/vfio/platform/vfio_platform_common.c  |  86 ++--
 drivers/vfio/platform/vfio_platform_private.h |   1 -
 drivers/vfio/vfio.c                           | 144 +++++-
 include/linux/mdev.h                          |   9 +-
 include/linux/vfio.h                          |  26 +-
 samples/vfio-mdev/mbochs.c                    |  40 +-
 samples/vfio-mdev/mdpy.c                      |  40 +-
 samples/vfio-mdev/mtty.c                      |  40 +-
 18 files changed, 468 insertions(+), 643 deletions(-)

-- 
2.32.0

