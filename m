Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EE41F3D4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980496EE9D;
	Fri,  1 Oct 2021 17:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9766EE93;
 Fri,  1 Oct 2021 17:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSPDmywVuYJZr3FNiP7FVDp/gJJtIuYLCPQxxPs4wh/GA/TIlytPzORKo/rgZ/89Xii9tg1xq0WEEnbgxBlCNz2mA5fOA6wcTgIX7FiHHmBpwdwyeKHXYfGvkkueptL2cQnHjKavpeCq5lL0zuLlyg05E4nbYGdBUy+0wE+chSrcDlMX/ewh85FAjPuT06y4FuMtnm6e1cmDuv2kcyMwuAcw5/8Rxd75/s62/S9peY1xYiEmdzKRtu1ykxab9G/I+6cFOZheBc9R3PnC6tWnx/V8ga8zDgfigjidNkRumLI5NcJ8B1LQgCNS1GMKAU7cH/fN9VlTBU47s/dBAbxg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkS9M/++Xop7frTxsR2JxiOoUcqYsdqH9YI7swRWdqQ=;
 b=E0V61+7Q2cMR+BXPAz8TpDa8Cy+5j7+ucqmCfH3c5hlK6/UqIJa+4BRlFN/iz089kPYMKl+mcp29exwXNaYXtt4p8MJD6LWJwREzl3YDQdp/Xf9TU1NPZ4apAApk51YY/jxFpPWRgflZzodwVb2a0nHPKki1exyBU0ZGlrid8jHUbeMjYXysXNZ5L5ud5U8gm549VoFCA9duKrbmtGbw7tubv5wc0S6pW835o2mXHmXXl+VxyiRiBRUZWGEZMRx/9KCVwpjiHSOzyHAiTJAM69SOukdqaqmaViV68CrmfUHWcwIkm5PeUorPCnFUoaSaqltIbjA83xla7/NKo2p2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkS9M/++Xop7frTxsR2JxiOoUcqYsdqH9YI7swRWdqQ=;
 b=sHrr20nhK4zD+KOX0PTiemXHqY/tDR/SHxhOek9p4nZUFGA9CLi/JQvmPumTz46yoL+7UBpY4fKlozxvGHb3ceGVfhtflj6PkA0KABP+jZ9CXSOAQPCyQes3NVq1IO6kOv8KsGBdxuJ3Ec9YbicxP8orfz3qcYiOoWv1zVSuSzQ245acDbWfBA10n/LRwMa3geh3cJpA7OPVpMWNFo3GehZJwz75vJANVFZ+vxsJIMvBW3dSEf8FVhxjK7BqtQRmcIDypkNE5oImnxM+o7DWpfp3f4lyWPEwxareCClZ2gnddthT0HJirYdURPIDPNz2IU5SfVc6NIKHG4QshMhT5Q==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 17:52:53 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 17:52:53 +0000
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
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 00/10] Move vfio_ccw to the new mdev API
Date: Fri,  1 Oct 2021 14:52:41 -0300
Message-Id: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0412.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::27) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0412.namprd13.prod.outlook.com (2603:10b6:208:2c2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiJ-00988w-Vb; Fri, 01 Oct 2021 14:52:51 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abe9ef51-7ac8-45f5-5e94-08d985044a8c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB512600B27324961DB45A73ECC2AB9@BL1PR12MB5126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gGhD6tjleUCuKuUJK2ssHsnXtYbIzhW7w2bSKyVMIBvdmfFecUMqYozl4TDr9yg2sO228HsVuYYQjnLShFQPaQ/gDQkqLqdBNYFMOIRv8ziep2Zz3RWL/Zf7QbOZbAXzT20lC2Fmx+JMWbSNU4APtahxDZCvqWj4JhABB0wup/RqQC+5O5v9tiKgI5k0QvvRz5WIOynrNxwStMhq8QeQ9yGrHS4VuI4b9s7/RlQ+IJ580LidZ9osv22+Wa+GVR9fs9sEnjfCMZhTcy1uZMgx1IcIpx2yT4cgptLOhzyR3LjLIvtH1GQ1ATrKcWXbc0v7xB+dmxodBTHLR4aZtryMDXYAQ8oy9AiUDldxVrmq4lXNzMcboTdh56pqwi7nFz+sfw9F5uYdgL0CizBUxsIEJ1EpJvSxf6r0Jv0lf2wrSWgImdWdpluFO1TMOI1YKTTWXHvLapcCS6rQxX+nyQ9f46L7rvUyjz1AR1NBrxjOmFh4vNujIZa2tZ3DJVWrsLZN17UwbXGvpzO5TDhnQsD+30wOghr8zsQBn6dPaX0+jGakloox56kkcqLJBneZIAAH9xNAROPBYPgf3QnLdS4yvmkKdCHd4UuzPqTuuOZD4fecwiCiN70deg+ZFqKYr/p/A+GybuRN10gsmBOvcBXZaeHaAiH8pryqEwyZemGTuHpORXZE4/9WSoi74S39Fx1kQ//QmDorEHIZRSLVjEOQFDyKAAWUlrMSbWsL8pP4iVfkZeXXLo/5/6UMFhVWwloQIwwbQNQuBnFbSen77pc8cFnUW0ZgV+CMmFxDGTASm1ljfb9nLgdiwC8u+Xywjyb27H8lxQFPw5/FqhOELAEp/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(921005)(2616005)(26005)(83380400001)(6666004)(966005)(186003)(426003)(9746002)(2906002)(86362001)(9786002)(38100700002)(4326008)(36756003)(8676002)(66556008)(66946007)(110136005)(54906003)(316002)(7416002)(5660300002)(8936002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v8XIDuMd3+7v7AHKg7shkWINe3L9MInQKw0Aj5HKzKVH7MeQncl1ZoGBl0gQ?=
 =?us-ascii?Q?EFsT+iruYq1Ooa+LOQwwdhxgv6Woan6liRbgKGDa7DKw66etflzaItPWHVvz?=
 =?us-ascii?Q?Ym6IsamCEwq6FXGulHUDVWEwPw0h0cxOsK4TqVWd4YMLvEaAu0b9Tpc0fLYd?=
 =?us-ascii?Q?9vXPtURDz8WUNy+JXZspjCVchp6TXVBh0kO8pAC3QgtoGzhEUXJqwDn+s2pd?=
 =?us-ascii?Q?gOS0d3kffC3J1TsFFH5GyVlzDgIkJMCAj0ESjx1Ru5LwbwiHouZXkK864tIG?=
 =?us-ascii?Q?rBcxu2K0h8BBbe23V4eOL3fgnvXJOFkJ3qjU03KxKTpP1+Y7QOer/3L7wEBv?=
 =?us-ascii?Q?SDSd+IuRrwM4Ao93zUesQDdFuuvba6fR+1QBVbcPgozcyL37VGZtwT6OGlL0?=
 =?us-ascii?Q?a9gpUTAcWho97NoZ6DMBVt91bAXM9orSqBlBPkFRSB1E8aMXiWCi5y5ECNYP?=
 =?us-ascii?Q?CZ3swQgiwkzsneSn/V3uF0gUGDzr5uS6YtN81/X+cKbgRaApCSCw+wGpxaPN?=
 =?us-ascii?Q?UYgZPmzeUcHzhefCKA1o+jbUcTqS3xf31o0RKY3d2JsG/drXvmJwRdRvZVg9?=
 =?us-ascii?Q?mVxiX9UltAGF1dZMgrjbrCxSOZt9NPUqfp8LnP32dXRY1JRVSEn1RAwakoDJ?=
 =?us-ascii?Q?hD7w1UGlQHlOe/lRswZAB3JkHRB3CHWMTh1t7mXsVZa/3/nyzmZDuM9fn1En?=
 =?us-ascii?Q?Mw/AB7KL67LEaHFA/EsSa//UnH6k+UaCPYV9+V1LvnJqHvl3Dux1Ejn/Z9CU?=
 =?us-ascii?Q?L30oU6Twli77XNiq7EQsxYqxdAtOfv9YYaOd9DUmrmVbqev3tiRzlc53X0BC?=
 =?us-ascii?Q?a49R4ReN+1Z093KGqy+loBmgBlGTe+7baX8TKtabLRshVmUorvulPpsHLdQV?=
 =?us-ascii?Q?RmW2RxiZpXJvdSWrnRU+Iw0HKtDi2J4Z2niK0qFXS999fNONBeOWzFMjS2Hm?=
 =?us-ascii?Q?y+Lp5SRQTdxR1Rx8bwV4iQrOr2uBud7jMS7xBe+Q1lwLCTeTlqyyJRvI2tOH?=
 =?us-ascii?Q?MqQqXkYePLREmDesKTSHOQCNSUhOS24JqAagzOLxCF9z5nsXDYgNY7FXFg9n?=
 =?us-ascii?Q?8zzseXw7NMVHL4FErHMkA1lwcIsmNrKtGT8PhXoxj5Q6XXFoKDUtZ9ZcCtcw?=
 =?us-ascii?Q?/53sHjO5PCu71eOzSOCBXSLS9S33dHmy6e1ZNvLm7tqP3pJeQVBTYcVKHtDR?=
 =?us-ascii?Q?c1d3SN3wdXU1eAV196fnjWo4DuPYUhn5v6s7/wf9HzuNw3gxbGLOawF6Wyn9?=
 =?us-ascii?Q?ycj2rSZH/W4sECSGxw0q4+pclo8aAEh7qAqK4VVz4V9pHG6jn/rf0YLnuij1?=
 =?us-ascii?Q?qrhvwGyGGj8BpGeN/ucHOVGG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe9ef51-7ac8-45f5-5e94-08d985044a8c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:52.8892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF87A3ctNLysHMh0Ekv87sNRl7Farx5f76wQFDfT/M4/5JR0ZzV9C3eb8psPbZhd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5126
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

This addresses Cornelia's remark on the earlier patch that ccw has a
confusing lifecycle. While it doesn't seem like the original attempt was
functionally wrong, the result can be made better with a lot of further
work.

Reorganize the driver so that the mdev owns the private memory and
controls the lifecycle, not the css_driver. The memory associated with the
css_driver lifecycle is only the mdev_parent/mdev_type registration.

Along the way we change when the sch is quiescent or not to be linked to
the open/close_device lifetime of the vfio_device, which is sort of what
it was tring to do already, just not completely.

The troublesome racey lifecycle of the css_driver callbacks is made clear
with simple vfio_device refcounting so a callback is only delivered into a
registered vfio_device and has obvious correctness.

Move the only per-css_driver state, the "available instance" counter, into
the core code and share that logic with many of the other drivers. The
value is kept in the mdev_type memory.

This is on github: https://github.com/jgunthorpe/linux/commits/vfio_ccw

v3:
 - Rebase to Christoph's group work & rc3; use
   vfio_register_emulated_iommu_dev()
 - Remove GFP_DMA
 - Order mdev_unregister_driver() symmetrically with init
 - Rework what is considered a BROKEN event in fsm_close()
 - NOP both CCW_EVENT_OPEN/CLOSE
 - Documentation updates
 - Remane goto label to err_init vfio_ccw_mdev_probe()
 - Fix NULL pointer deref in mdev_device_create()
v2: https://lore.kernel.org/r/0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com
 - Clean up the lifecycle in ccw with 7 new patches
 - Rebase
v1: https://lore.kernel.org/all/7-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com

Jason Gunthorpe (10):
  vfio/ccw: Remove unneeded GFP_DMA
  vfio/ccw: Use functions for alloc/free of the vfio_ccw_private
  vfio/ccw: Pass vfio_ccw_private not mdev_device to various functions
  vfio/ccw: Convert to use vfio_register_emulated_iommu_dev()
  vfio/ccw: Make the FSM complete and synchronize it to the mdev
  vfio/mdev: Consolidate all the device_api sysfs into the core code
  vfio/mdev: Add mdev available instance checking to the core
  vfio/ccw: Remove private->mdev
  vfio: Export vfio_device_try_get()
  vfio/ccw: Move the lifecycle of the struct vfio_ccw_private to the
    mdev

 .../driver-api/vfio-mediated-device.rst       |   8 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |   9 +-
 drivers/s390/cio/vfio_ccw_drv.c               | 282 ++++++++----------
 drivers/s390/cio/vfio_ccw_fsm.c               | 158 +++++++---
 drivers/s390/cio/vfio_ccw_ops.c               | 240 +++++++--------
 drivers/s390/cio/vfio_ccw_private.h           |  42 ++-
 drivers/s390/crypto/vfio_ap_ops.c             |  41 +--
 drivers/s390/crypto/vfio_ap_private.h         |   2 -
 drivers/vfio/mdev/mdev_core.c                 |  13 +-
 drivers/vfio/mdev/mdev_private.h              |   2 +
 drivers/vfio/mdev/mdev_sysfs.c                |  64 +++-
 drivers/vfio/vfio.c                           |   3 +-
 include/linux/mdev.h                          |  13 +-
 include/linux/vfio.h                          |   1 +
 samples/vfio-mdev/mbochs.c                    |   9 +-
 samples/vfio-mdev/mdpy.c                      |  31 +-
 samples/vfio-mdev/mtty.c                      |  10 +-
 17 files changed, 482 insertions(+), 446 deletions(-)


base-commit: d9a0cd510c3383b61db6f70a84e0c3487f836a63
-- 
2.33.0

