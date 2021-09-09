Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A1405D7D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE576E90A;
	Thu,  9 Sep 2021 19:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019E96E902;
 Thu,  9 Sep 2021 19:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8BqW1fHg0cz2OqrOT9XBDc2pyClcwkhN1Ct+j3M/T+j2mka34dmAL99P1LNLFr2+OBqCMv/0nP1uRsj5HKp/owrRERF7yJ4nczYxpXYU2DF2anvX3FMSHLxpkApEm1gSfxqE8HI/gOtv4tX42uOeCcrhLWSRyKjGRdecLKwXYQwybTSIDhUGUKS9PfqB2Y7IiRCBT5daxrGBPPrrg4cD4rZRxWNJnE30x28NJaaFwvh0UOUnl5hHReQxmYAGJeSxIQLVTTsJMlW8k8oaVYY0/oLymqBo45c7Ql8Y6gY/F2OB5OHvV/EaGHRQcKfsxUzOBolCqLgqFa2JYTltYk4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=61FGa0xw+U2plczoR90WDq+aYLA3c11u+0emV8YJKzs=;
 b=nAtcbGxHAozh1oqnp8nCkCx+GAekdWIJhVtdzL0nUUNOO96joZcZYFYWqNrxRj7KzH9yzTbjLDsHHUKeMy4J/KXIS9HthtAPUPfXPt/M2a8RMONhgmjEbpxazuV/fY4nu7ontEk29kzu6/uTLcRZi4PqA83CJnpo06nEXRHCr3hrBidm1aQ/8tstRd+ontcy+NF+kEVMKQ+FirjEgm6EbjHNkSmBKT1GrUvYp3UAyT3DxJ5fbyAEAhZqpHMsOgRef8ELyDda8ARaknpxRwwDZnzt7u89jCW8JfeZ9W0Bd2cK1jVAdHibi0GBjJ4cdrWEhZpGYVziXLnqkZU+DKpleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61FGa0xw+U2plczoR90WDq+aYLA3c11u+0emV8YJKzs=;
 b=spXfcbRcWzlkY0AvTRuWzVVfx4MVTpY85Dcdyq4Oj6hrZdOQ0uAOD/7gMOT6ibeQeIfVE/79kkKU74hdN6CEV5jrMQQ7sAt/eA/B7JMuQJrAgMHCWlwnTJ5oR7T7A3OrKxjbtqW2C6xzu7Tip6PRDlvymTSRplH88ECYpCQY0A/ier1QCcIVW31cpwprVid2XEALu3HH7b51EKczAfDokJqUfIAkAvUmTB7tNKnluF7ZTqUgTtOfnHi38T1F++0NSGHbpAB0aAl07az87yBHQEuoYA4Y6uGlTyF4zMYIK+nBSMJVc3as2frQouXOfGzk4ewsUQI3CySfS0zzudIACA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 19:38:50 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 19:38:50 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 0/9] Move vfio_ccw to the new mdev API
Date: Thu,  9 Sep 2021 16:38:40 -0300
Message-Id: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:208:15e::32) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR17CA0019.namprd17.prod.outlook.com (2603:10b6:208:15e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 19:38:50 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLEj-Ds; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20cb2c46-4fbd-4b50-7611-08d973c972e7
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5554A7A26D1FC74CE6A56BC1C2D59@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 850+wuSfS2UXIkJIUSNqzjXK2P9A+ufLa641DT7kB6Cxc8+P5VvpYAcRw8nJql0/WEoGZcNryJvmtYd5CkRXdrkAAyr6xZrhxciAeKHEa+eZ3Ednv8WNFKz6H06r95dbl5hOhn4IzC8WsFuuAC45ivFuxEfnM1wSh8ufCNJPfL4NP5ZEk5OJnf5Joz/4b/3vCZ4tTUiWXJjnWbe1NbIqDqEbYMJQ9SZrlZ22XFVOSwjgCUYqXRf0U8sqCNHfdtoZBn8f11e3uv8RBHvG+wxSR2AHIUg4tFqr3Kli7dVxyBjt1jgrrIJQ8yZszvjowbfLE05F+bTruc5Sw6j8UmBe+HD4+0ASjXDBUDoSXS4eY7IQi7KYp5WhOFMJhDTQH/o1db2Ybt6uIe2P4KG09vifVi5U2X1a6c0RGq0HVnxuLyW8DJCvMs6PF3pAj6rM1RoELeHyGw6uuldMCprsZL1loeMITLXMEhzezYLy31Mtk1A9duDDS8+uuX4+rldfPEU9+WSqXMwjuOZ21GCNmCEVPCblvQ6fUIj985qu4AhHcL/G1ZoJ2edSYflBLUKMhrCX5LFS7Vd3H6KosKLPzaeUOIFv+GjNVINWlTVL9KfC5YVPQBnnKEtX8jd6NFzOtwf/gtpgoHq48UFIeu7uN944aNL7iF8mPhIYJIHCCayKs0qF8lAXxaW6k5I17ds2OnL1lXBS1+0uWvAkWc7TJZoTZl7KKED8nxoDjM/CVpNs/s6msLOg0lzEo5DP2HsZhT74xH+zJ0ZNF4ruxVWvvaX2WaFdEzUBitmYKlLVBFo2dE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(26005)(4326008)(2616005)(66556008)(921005)(66476007)(426003)(66946007)(9746002)(9786002)(5660300002)(186003)(83380400001)(86362001)(508600001)(966005)(8936002)(6666004)(110136005)(38100700002)(36756003)(316002)(8676002)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +ATKrtH5QnPezvMuX5Ag17WHriFhM5L5yNplajjbTj5g4hfPCEhXMJ7xlJscb+FFF++J9Lko3/zzn+GUDLR9089tt02uHABzkZRwZ98IRspMfLOYi7XGuMWi5GJXT82pVIXpUnnJ1I/zCrqbynAl3Ao4lkckxwLIuK9eqf3vLv61La1wZ4RwNQG2R8wNkAtQMHJIzcrlDnFwb/zzRG4p+82oJsC9aW1m1XN09j/wThg80SDWpTbE7DKotaksY1xxBAOQeOgh/AP7DkaJyOO6qkjt0VDco+dZCWcgbtqJLuxue+Ier62IRh0xMmbQXpya198vGrJtosTG0CsI2sjKZ6u8VNi/oA2BvXzccFtQdhwq0QEM95ecXlNXa/hDfpoL1qySIe3h4KKd+FaqLPLDH29TtzUEVqvykp2ZjnWDQBXHBjlHBPM5/3QNpAwN/kL20ki0h8FEbD1hBCXXYpomo1M2AeEmLm3Z73Qr3qTuFNPTRtK7/XRyd6x97yaon65/qvz0Lh+deJeHH5ydoKpIogzcQHQooNVBqB00TfN4D3evqxR+THnIZpMOARz0wBvPCv1dYiPPRSBJYRgqnN3ncY5CIVARmD0jr43N7FjdskaqnaPyhw4ZvbqerBk6rFNyDeKpY+deDZMmBhuPrfrYOYppXDVbhbeW0oFpui1EqIbw8HjVkp45Et6fMhBRBVi6afCdQba2OzT7em3Lle9Qq15RW4a9G36H0EkZjLxHI3fCtu0YMScfvbgSBjp58tVW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20cb2c46-4fbd-4b50-7611-08d973c972e7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:50.6025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOA29W+/c7PJr2uB7Yr7QJgIh+jCEnLKqOXSfmsMiRlXZ1DPGevmidmdrUpaw5Bm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5554
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

v2:
 - Clean up the lifecycle in ccw with 7 new patches
 - Rebase
v1: https://lore.kernel.org/all/7-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com

Jason Gunthorpe (9):
  vfio/ccw: Use functions for alloc/free of the vfio_ccw_private
  vfio/ccw: Pass vfio_ccw_private not mdev_device to various functions
  vfio/ccw: Convert to use vfio_register_group_dev()
  vfio/ccw: Make the FSM complete and synchronize it to the mdev
  vfio/mdev: Consolidate all the device_api sysfs into the core code
  vfio/mdev: Add mdev available instance checking to the core
  vfio/ccw: Remove private->mdev
  vfio: Export vfio_device_try_get()
  vfio/ccw: Move the lifecycle of the struct vfio_ccw_private to the
    mdev

 drivers/gpu/drm/i915/gvt/kvmgt.c      |   9 +-
 drivers/s390/cio/vfio_ccw_drv.c       | 282 +++++++++++---------------
 drivers/s390/cio/vfio_ccw_fsm.c       | 152 ++++++++++----
 drivers/s390/cio/vfio_ccw_ops.c       | 240 ++++++++++------------
 drivers/s390/cio/vfio_ccw_private.h   |  42 +++-
 drivers/s390/crypto/vfio_ap_ops.c     |  41 +---
 drivers/s390/crypto/vfio_ap_private.h |   2 -
 drivers/vfio/mdev/mdev_core.c         |  13 +-
 drivers/vfio/mdev/mdev_private.h      |   2 +
 drivers/vfio/mdev/mdev_sysfs.c        |  64 +++++-
 drivers/vfio/vfio.c                   |   3 +-
 include/linux/mdev.h                  |  13 +-
 include/linux/vfio.h                  |   1 +
 samples/vfio-mdev/mbochs.c            |   9 +-
 samples/vfio-mdev/mdpy.c              |  31 +--
 samples/vfio-mdev/mtty.c              |  10 +-
 16 files changed, 470 insertions(+), 444 deletions(-)

-- 
2.33.0

