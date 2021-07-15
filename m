Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9533C9501
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2CC6E512;
	Thu, 15 Jul 2021 00:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507686E4F4;
 Thu, 15 Jul 2021 00:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAx1kDeUCkBCTCF0BLdE4vmFpyJDr3o7r3dlxSnK14IT5IVInvaDFg/gFKVJWuY8C3D0m69sLf+KcPfKAC1lVVOWCEBAL7/wxb1fS8kgy+nfnv822F8hnPcdoaxu5lcG78GMbIQT0MR6YlYQFk0VSda/DFRG2wtBWBZn8I4FuOqFG5dr5f7zchlnwNXI/H7BSf6JN1mnNDC1m0iY6nkeAbgbWxZK6bvXa0TV9IEqtc9jirG07nu+e4Ii0jySzvy/7ruVHa2/VcVf/UQ/6qATVjfldl1Vx1n4mmKYkWSH7515ChfpJD7/mVeDLvEIzcrdPddUeAty90H8pLPlkRnA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASU8SluLHbYDckjCGRJ39CJ/NgVB29D9fWMR/Wyj/F0=;
 b=cm0uY907JWK0o617ejnxJRU5ETkV32sqpcwiyKmQ0fcqhwimnkPnr1VhgtA7YHDGiZwCPhVpFrMh9YHbi7q3bkJyiPiocDpP35pI/rUi5E5eUKaKE4LkvYMmYnB8BXWWP2+mVkL2mX358aqZF0O3qk94SB2L2/ZR4PsdybNsjrh89CqVqHLVGjoWHgO/0VSdt45KaBpybx8vcBqOcH8cTVeMtb0Ev0IIDwq6guT1kf094kkbjqmFh0oIyovRQzdPoyLUutavL27XrmKWM+JPjUvuenQG9V1GYiOCUmq3WlVr3+I3XadTYQy+Vq3vQ4/PVQoyWr1PAeR4s6+4f0OzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASU8SluLHbYDckjCGRJ39CJ/NgVB29D9fWMR/Wyj/F0=;
 b=Ahr8UeHQzzX8leToJw5T3cNpuyPQ0fD6Otixy3SoZXEZw4BjLS1qF5agKwy7Ok3SUE/K2sauYmIlClpKf9/jEdUlaFsykQUlCPoczxiC+CdVY6v7F4O1hwJRpIQvIXeGOk3/CFzHPYTe8Yzb49kxjxU5dC3xioKKWzdfy6cNKDY16ZJ6WpzXfNVUlQ4fMhWWeP7e0U2gJ9gS+NBO1Jv+Znlw3NEgNC0yVYf89KLMfzKmSjpi/yz9bO2JNNXPDX+hcSkfHrqQOZ0zqh2O0umClqpjv2LvXayBRM88+9mqS4NSWaSsREZUNq0kdV/vrJRUuZ+8lqIQUWLgU2nlL+0vMw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5334.namprd12.prod.outlook.com (2603:10b6:208:31d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 15 Jul
 2021 00:20:44 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:43 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 00/13] Provide core infrastructure for managing open/release
Date: Wed, 14 Jul 2021 21:20:29 -0300
Message-Id: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0063.namprd04.prod.outlook.com
 (2603:10b6:610:74::8) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR04CA0063.namprd04.prod.outlook.com (2603:10b6:610:74::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Thu, 15 Jul 2021 00:20:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002Ux4-9v; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 480d3ae4-daf0-47b6-c7b3-08d94726624c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5334EB99BAB36A329179CDF7C2129@BL1PR12MB5334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3Q39ngHddQrZcuV04pWkGj3HPLwqSCkwCpr7eFpHBUWhni964UdhvhCRav5gR6QO4RLeR2EWw7TtXi2vsXeConLhOh7bPouraF8tkzl5Kp0pwgZjnMQEPbWtHuAM7cgoPQjYNaI0Tqxn3pRKrDdRrV0bP3KoKvmdIVJ6e4YAO3PlDMMrIZf0UHNRzWWS5RJEx9e0PCRz9blCOpQCBiJFAq55Kkv4DdEeqSFtb+ew6JQb+TfA24471vgqaq5hYZG6Ko1yFm6q9mA0h6wAyZw8iqHQgAJRP7twTbU2hRGZWdSXr0YW5HhKDczyWNNpETRm7aeuC+wTQyrSVRDCs4q+gzx5euxB58MJKFZKnM7K92cUO2a53//UQfQ23j4SrbotkZcN75CP4M/KJM64CSCejbFH/ou5iwrk43IGvXc65U+wbPCAN9+Z7fuNpcRKtOQPTyi+yAJrrMinaTR4ivuam7i9aPK5jSVSFugGISbQdY1QMxcjl3LoWucPv7xFwAuzXU+ruQGEq2LrQG+7pgXPskMhskYUsKEmkGrcuPnJAzACSHIMrzRr8YFJEdYtZbGGSaQlbn30ktzD2+KJKhR5T1WttsLBKFYz7Xv5EW0+lli+1sm/++rWDl27J58hz6Ws62PFkqVNpqVKDx6trlsczgophlqKeoI4NUsasb9l28ggUkbFEoStrdhUu40m0VmOiqgkCoR24uIFH3W9K+RwNOsr3SllUBPA0JFek+zz3bc/yATCI0xW7ICPWFLKJQEwCyEiA2YhgbDanpaIbGjV6cYRz4uJYoqFg/mH7RntSo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(107886003)(86362001)(66556008)(66476007)(54906003)(5660300002)(36756003)(2906002)(26005)(6666004)(4326008)(7416002)(9746002)(426003)(9786002)(186003)(66946007)(110136005)(2616005)(316002)(7406005)(966005)(83380400001)(8936002)(38100700002)(921005)(8676002)(478600001)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qIt0p8B7FSNTZywUJ16dasQDmq6FNeNYYeSWKDXIfuLhgkjIqJ0xCgbGNJGe?=
 =?us-ascii?Q?Jsjmgvtoq/47J2xmSMzExFF6HjSnVoWWCe3g3fqIDQfIjV2CWQs3A3fZhAQ9?=
 =?us-ascii?Q?G03hDgCX0yDovgfl0ajRGrBX0dRgdPnRMp/lZXMwqbqLyHqEyyxhQpPreFIz?=
 =?us-ascii?Q?48zhuUS69ha8Or90R+97GjyI1jciBXAq/5U0tqct0eRdKwG3838PzaPm2hcq?=
 =?us-ascii?Q?ws+8AhoR+M6CWSD6xwUEMJ7HgL+h0+PKwNNscuB0TZT80iEBDiqKi1m3DsvV?=
 =?us-ascii?Q?x5ptgKh19HBTVVl/ybWEumOyLHw6458Bu+oUEqV/WxNpjW0HVIA12n6jV1xs?=
 =?us-ascii?Q?f2ieNAYSwgKqayMyBJ69wHcMwzFUfqvwpkoIeR4uykzKyOjDNx/YBzEO2ej9?=
 =?us-ascii?Q?QsH8qLD6rocJoTU7Z22i1WX/yj/FyyiK3ruDwABnVHjOy051C2VRWrrpS4he?=
 =?us-ascii?Q?rV06vbNvpsk9/zSYMnnHebu03jL3cseFGy63EusFbixdpjZFFbl72nm585f/?=
 =?us-ascii?Q?INsuHwcUdRWuxU3TcHhla0hC4umLWnMNm21fNnR7oVU5IB8FrMwcrcRPHpvv?=
 =?us-ascii?Q?HNtoIcUEROdIC2/Kv+Kqij2lq1D9YvQX6qU7lHDN/+Mo4iMlMWBWXgPFwRvD?=
 =?us-ascii?Q?iN+cEloEV2gORWnq/wovRwEL4Zz0+4S2jwD2XRzTuafoMc3a2n+OEO0yZLal?=
 =?us-ascii?Q?X5pLOs//yk1TTXFjGpiatCJJt02Y/VfKbD098CVNoQahfW/c5RQ9x7O9reaH?=
 =?us-ascii?Q?S/tWpqsPybJeRAoOcnQgX4zQYemn3w7wOYsTAfQzXzWaHs7tS4qzXElfjQai?=
 =?us-ascii?Q?Gf2kHBJldnT+AehmN/3E4eEOI/Ex2qvCeOhKKQ7AdSKzHM9VQA5SV1RVYltU?=
 =?us-ascii?Q?tmWaVw7cP/vs+8v+fkC8U+U+mO4qYBrCR4Th440Vd3TONhpg7bzxb7/dkofX?=
 =?us-ascii?Q?UD/RsaAJte8uMAxrigHtlyYaz4tber8Fra0MOUdyNvOTusN54U0psUUvNNPK?=
 =?us-ascii?Q?76fcmXbRz9mt75lEuwSwS8nUPPY6CcznQDuM7lRa3ecpC0MjO8eZjNaGVAA+?=
 =?us-ascii?Q?xA+NCWftGCKYuwROLduXxzF1x3ZUHG8uozJhfUEg5X7v6DwzkDayT/7Q0SDV?=
 =?us-ascii?Q?NvbUUHCrVZzwooBBiarfH6/dhpiZGDfNzWiLWlxq1N9Gn4hdq6J2Xq5GMwyr?=
 =?us-ascii?Q?k9jkE700Jprlx7YC83/cID1vQb7BJxxqrhritrZdNNzMu7cM72QSd7y6RccL?=
 =?us-ascii?Q?7q6I03juOug4Z+5l/CQ0DY/ucSRtp8QCmF1ItqqBBhvpWuUs2/NS1R6b2qdm?=
 =?us-ascii?Q?C8YaU80DkyIhp67LmngtJEkJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480d3ae4-daf0-47b6-c7b3-08d94726624c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:43.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hhsGIeiPMkDPUnbmkx6mMIxpdyR8rlBxfIHwmmce4YMDDOpH8RuSt7u6mE+UH1E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5334
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
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prologue:

This is the first series of three to send the "mlx5_vfio_pci" driver that has
been discussed on the list for a while now.
 - Reorganize reflck to support splitting vfio_pci
 - Split vfio_pci into vfio_pci/vfio_pci_core and provide infrastructure
   for non-generic VFIO PCI drivers
 - The new driver mlx5_vfio_pci that is a full implementation of
   suspend/resume functionality for mlx5 devices.

A preview of all the patches can be seen here:

https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci

===============

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

Jason Gunthorpe (11):
  vfio/samples: Remove module get/put
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
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             | 158 ++----
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c        |   6 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc_private.h     |   7 -
 drivers/vfio/mdev/vfio_mdev.c                 |  29 +-
 drivers/vfio/pci/vfio_pci.c                   | 459 ++++++------------
 drivers/vfio/pci/vfio_pci_private.h           |   7 -
 drivers/vfio/platform/vfio_platform_common.c  |  86 ++--
 drivers/vfio/platform/vfio_platform_private.h |   1 -
 drivers/vfio/vfio.c                           | 149 +++++-
 include/linux/mdev.h                          |   9 +-
 include/linux/vfio.h                          |  26 +-
 samples/vfio-mdev/mbochs.c                    |  16 +-
 samples/vfio-mdev/mdpy.c                      |  40 +-
 samples/vfio-mdev/mtty.c                      |  40 +-
 18 files changed, 439 insertions(+), 622 deletions(-)

-- 
2.32.0

