Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F914FE567
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AC810E6DA;
	Tue, 12 Apr 2022 15:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0133010E5CC;
 Tue, 12 Apr 2022 15:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZoLUjz8RxWHQlReSm6LGyEPqWbjljvB5hzatHppVrIcJsX+X7isKJS14PaKEkgDmbAUWTS4NH27bk2Rx44ryAH5BQNrG5GA1mR+yKd2AHLtYKvuv3Mmo8bt2hxMqm2KIsuiRfM4lwGjsi/Ol1Q3x9LPZd0pOX301N7Gd+/AH33Z2lMb0WpbgoOZKZB5VQu5YTmJL5vVSQZC+9/Lc4zu0hEy2KQC5u1E6m6Gp4FqG6Tku00JH5Oq5kNmMeguSky0idTRJ8Gxir9gE6wrHsij1vwSve5n4p4tGzqvZs1/P3U7iqKSj2yGU8Xtt0d7fTDXEoj/JJhyuMS4MMcunoDM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x64G88Wxylhs3RaiocP0IhUqU1D+Lnwukl7MqFV/rxk=;
 b=RgjBscbZol97Faq++zkPDs21CivxoS5ww+VrMIK7GwyH9vdEpdhpHtpoh1Yk+7Wy8VnIeQRym48IEMmf14m4pyH+RAMF43o7DLJI1LbM/P2UFGuEY8r1EgzW9GFvNBVqBDiR6Rdw+Ujvm8PXDoPJksROzwk0FGsP4NXSOHLCY3rxYbImzNN3YiXv+ftPa6YEwKphQKLenH744ARrG0sFQiDnfh3ZT0q9JhCKIMhnxi2MtDsugmEDxnReWFROR4fNCkppBMnrjMG5rhVp44xY332cnprPqoQo6ATEiNdbym2nkGh5ERbHSFN0j76tk5ccNZMOJVqWtzzJ2PPlEegTTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x64G88Wxylhs3RaiocP0IhUqU1D+Lnwukl7MqFV/rxk=;
 b=Ui66VGqPWcYemVNpRz/l48QUjj/em73edVCqvSvgZ+fPYBUsJQDqJMtUtvz1BT0enL/Wf0sxtWl4kUMp7l4hEhUB1eKwfWQYmwzeYTwVk5VIIBZzYaN1Nt+Hqf9+bFNMXuZsdLNzjA3yeyAttevqVnJHts/t+cU5mXp1ewlnWJ6kqnFpc9Ac5al5wSvv1/X+SgRakrrmzOUdXoVPaaUcOEk9u66KtG4QaqW/02GSkdW4aZ6cuADQpAAzwbXLBcq4N+kdro50Dg2r88SvEPsxfkmgeTh4QSlTy22urfN+5uEZ2b3Wu0IVH0wuahi3/f0E7tny2f1x2l3Cy5sgUR18MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:53:40 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 15:53:40 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 0/9] Make the rest of the VFIO driver interface use vfio_device
Date: Tue, 12 Apr 2022 12:53:27 -0300
Message-Id: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0035.prod.exchangelabs.com
 (2603:10b6:207:18::48) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 527b8319-a6ed-47d3-bb7b-08da1c9c9c22
X-MS-TrafficTypeDiagnostic: DM6PR12MB4172:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4172F5046F68D7B55C9CCE27C2ED9@DM6PR12MB4172.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FUnN+CUNlFNy9JywqBVHJ2r29VSSmWV/BdsAQaN3PlsvkBzB2AVS+74eIaPPe3dFHqrWaIu5HIEjMneDCi1y432hxiWPQNvPv+cAXEyQwmGawT9WJvU31A5ugLECWIwoNk7blRb7+Is9/DTdSvi2mGavc7Hfy67W5wvqo4oNs7zmpEjDHO9CoCp6huyY8tPFgG+QXZeWh8ON7eBcEGLVORs9e9ZkqIVC9TkHh098KerdWSqxH4ryaUUxNhe4l00Isj0+y8YeX4Qpin3pMgO1AjzUMU172s/OHzeHSPgCFnPo/oDrTP7jfwgrsyIt4eYPOJ32bG14Jusa0N14FZqCDybbxGG8qQ5YFyfsrIlLVKb98LYonJOGioCpMHwXUAvUodoR/FLkG+giQlVtojq/3cbFl7vcEJpk3wRzV1/j7dOJtp8U24LrBFKHrQg4hwc0Vck41+voUWDHxN6R8y+7g3whDek/KywEn2fZR7ifqwBvPfXKSZ/cuIY9wgfgRs6zph3YIuSNhiLm9tJz8ECboS/DIGwVxr2yBmgiTZlCS6Xn3zXyXQa+GBl7osniMEJjSdPC4yvPxa5Yom0FGHdSwca/xp7Kz8Ouuh5feRwGHA6aUCwBmPj3kFljGCQkD7aIn5XmGeAdBIKSckzSkzzLQNv2W81pjsvNdE71cN/WbUqVszKYHQ1i2tYzVE2NBeQQiOdl4F7bjBf6WPgJv8YYt7GNHRBzpafRJpqRdNOGyk6Exi90OmD0Llfmx0BX2IQzGuvkQe1qAr4eQ+lJdzjqrvG8JbXF/g5yOXHfEhQXoDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6506007)(6666004)(66946007)(66476007)(4326008)(66556008)(26005)(186003)(966005)(36756003)(83380400001)(8676002)(316002)(54906003)(86362001)(8936002)(6512007)(2616005)(921005)(110136005)(7416002)(5660300002)(38100700002)(2906002)(7406005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cvp1jIPCQ8jbm81MYgEG/TzJvHIWf3s43nmBXwa3oaaEjRugysyvyY+ag0PR?=
 =?us-ascii?Q?6zGM9WeiyNHETWdlssvpy5gyazvJB13guXlomupIr8g5DVS2HaXervDnGV3N?=
 =?us-ascii?Q?THKBoJpwp6yRzCWoVAY5IGhnhHx5DOwlNc0rx4M01qVwn3/L8Pu5DW4xS0a8?=
 =?us-ascii?Q?iDskllH6akfn4p0ewhV8FLRUZeuGgOmo7nVF/OYRAPZHNFHj5htA7XwT+OJt?=
 =?us-ascii?Q?IsKFGO6YFCGRrtaJ+KyZFZjoJbYvSxUhjMpVhfFrvxyXQb/bS+xkTCoX6I1K?=
 =?us-ascii?Q?3OmcCUZxqYyePs2J6Zao2UcW1HgW0sQIg6SgDeR80lmyOMTBSzqwT3Oen3u6?=
 =?us-ascii?Q?KKNE+LrvWntOEdYdxgiIvWXADT1US3p+OvCzBjVHYB+jO1li2xRfCyldJWt/?=
 =?us-ascii?Q?bQkk4mI6ANzCiqIEtoOFa4nX33ReBpdPW/TFfaEbHXjZxodnQQh+D0/PlfIB?=
 =?us-ascii?Q?vHcwos+QSSnwUA2H6kdwXo5aHoNN/yt6ceObwyrmYPN1lOP6OednPDntdvDJ?=
 =?us-ascii?Q?P8+FUpEUneIviaGYu3MO2LoEcyvpcXccrxfYN/si2E/UScWyszFS66dA4mu1?=
 =?us-ascii?Q?bxQso3WBs8xGiJV8VXMlFE0yEUtynk4ALYAwmvN5fbOHNAmDC3MpTFlyVz81?=
 =?us-ascii?Q?mWinFCWLTM8h/vNKnSnU3xL4dnOqEWVJzrdhLqsRu2a0m38sZvARiP4JpAkn?=
 =?us-ascii?Q?SvYD8NUauSQsADD6d+ye9tVNtFmfQThM3I+MHmPFsTpTQvqVWF2eMilRDMHU?=
 =?us-ascii?Q?RG2xRWB94tuJbqjACse5LF9NHHpHOP/a88fyLKjQUleE0MfHSWJ7DJ6rFj28?=
 =?us-ascii?Q?2XmzOo8dQBOTPfIhLQvpoQghbl0Gg1YrNo81r7XroOg+fwh9qLDUdJ5csslU?=
 =?us-ascii?Q?gDAgCshZKXvZLu0Lb2u4G5lNatF5Orx3dnoc0LWAMoCt4SewswYUKuFcyj/m?=
 =?us-ascii?Q?pLQJell3fruiAfYtkXvTAcnSHe8cHdcp8Vw5TUHykNO7IXmyrYop3SitrKGa?=
 =?us-ascii?Q?21+r+0whLJ8BNTaJ4GfQfjud7irBwBj7viEK+9QUOFmB1z0WG3ni2HagPKpZ?=
 =?us-ascii?Q?vhSpdeGSGBUXOPxinXq36G7z3oq2xdpmu2CVJjvO6CWN6gmVFI+DxYFfP6a8?=
 =?us-ascii?Q?guOMVOb/8xh6aDL9XBaHm4vw1y/hpm4q7Yth0PCt/alXt/lCrKGasnTasbxs?=
 =?us-ascii?Q?WOHmREdG7PHqbc31yb/dil8GQiB4ViE/yjcO/JrXXdq93MrGkEmfGoVzzuFQ?=
 =?us-ascii?Q?Z0Nzfu/yPM+BwOr1hphNVC+K1IQrautYI57yYOUrkM6EguSOlPVMN8+R6PU/?=
 =?us-ascii?Q?oi38Pqqlnswt40CUUDckjQFMh/5DIrDnB88vSo9cYi/Un9GLyzdWRCAIG/No?=
 =?us-ascii?Q?hHZ6BC8xWRUVTGnqjvAW8BCxaEzi0j9Lw7HmZ09nssZ6Z/ghwyUChpgX7BaP?=
 =?us-ascii?Q?o0t7U6s9SgTE27es+/gcios9sP6BpRoVDup/47z/DolBlK0iwf5xz0/AebQv?=
 =?us-ascii?Q?q9I/Cu43tUsvnUmp2gs2PZygpnWH5KLDGDD+6MrX6+316SIm7Sk/KZT++sYF?=
 =?us-ascii?Q?CRfOroSmhfyPi41msYW4l2OBRFp5CQ2x/s/ThjmGZguoCYygnZ/CjrbN38Fn?=
 =?us-ascii?Q?iYDZMY9i1x5nqOu4Ly7rG1zbpec4fbaTVWLFCZRzi/HjfeBEnCoZlcfraTNo?=
 =?us-ascii?Q?0OqAqO0YknIEkcDZ7ORQSPR+fCepLGHLBPelRpKbP5fAOa2GLml0a9k7r6cB?=
 =?us-ascii?Q?b8w+9BMq0g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527b8319-a6ed-47d3-bb7b-08da1c9c9c22
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:38.7594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuKel238Gp52jJKR5AGKeOQNPD/hn0/uTW6Nn1pCY//obY2rqLGo80zGJepM6BRS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
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

There is a conflict with Christoph's gvt rework here:

 https://lore.kernel.org/all/20220411141403.86980-1-hch@lst.de/

I've organized this so it is independent of Christoph's series, by adding
the temporary mdev_legacy_get_vfio_device(), however it is easy for me to
rebase. We can decide what to do as we see what becomes mergable. My
preference would be to see Christoph's series merged into the drm&vfio
trees and we do both series this cycle.

I have a followup series that needs this.

This is also part of the iommufd work - moving the driver facing interface
to vfio_device provides a much cleaner path to integrate with iommufd.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Jason Gunthorpe (9):
  vfio: Make vfio_(un)register_notifier accept a vfio_device
  vfio/ccw: Remove mdev from struct channel_program
  vfio/mdev: Pass in a struct vfio_device * to vfio_pin/unpin_pages()
  drm/i915/gvt: Change from vfio_group_(un)pin_pages to
    vfio_(un)pin_pages
  vfio: Pass in a struct vfio_device * to vfio_dma_rw()
  drm/i915/gvt: Add missing module_put() in error unwind
  drm/i915/gvt: Delete kvmgt_vdev::vfio_group
  vfio: Remove dead code
  vfio: Remove calls to vfio_group_add_container_user()

 .../driver-api/vfio-mediated-device.rst       |   4 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  48 ++-
 drivers/s390/cio/vfio_ccw_cp.c                |  44 +--
 drivers/s390/cio/vfio_ccw_cp.h                |   4 +-
 drivers/s390/cio/vfio_ccw_fsm.c               |   3 +-
 drivers/s390/cio/vfio_ccw_ops.c               |   7 +-
 drivers/s390/crypto/vfio_ap_ops.c             |  22 +-
 drivers/vfio/mdev/vfio_mdev.c                 |  12 +
 drivers/vfio/vfio.c                           | 283 ++----------------
 include/linux/mdev.h                          |   1 +
 include/linux/vfio.h                          |  21 +-
 11 files changed, 115 insertions(+), 334 deletions(-)


base-commit: ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
-- 
2.35.1

