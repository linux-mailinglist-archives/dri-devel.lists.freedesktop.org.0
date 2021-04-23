Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA9C369CFA
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 01:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41796ECAB;
	Fri, 23 Apr 2021 23:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA1B6ECAB;
 Fri, 23 Apr 2021 23:03:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOMhoy2gq8WtOCOyFJTlsuR7zOUkCCyNSmh8vAM02CvDHeU+Sjsx/h00cShTAlO3AUTwhtCnhRouzZwC7Dr77XsXY9/FsMVPRsEB0LQGgDaKUayjj44qsQlf3GGRhI3TP3irfVD07U3sKu00JCxVbmDdWLaVOoygDSVA23DFOFj2AAh9SAoOISx13FZI5/9bigz/ELFa4WhpYsow46y29I2zBxUm/FQRMuih2xEffE9yEPhB87wK3o3bTfhIBr4/d4Kelha1ernbg9v8xmb0RvnxEOfX1Pb66cvkyKOqqOrWd1zhWNfuBV4mvoBQ0tarAzPMIxHjBWovgzy5Yq03ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1q3awXFXc0HeSJQj9cfvSiNE3+Z4I+19S3I6rAVhBo=;
 b=kiXXQCWDs5kipyWD/RlfyAR6iLmGiGH0l9ggAdYC5Qiu20r9wGN9MICgVx6Ud7mFOMVSVqTZcqe/4w5s6SyPzQlnVRoWRdGz9NAo9wYJz5rICIlgyDTx1WBlzcaPr4fXfevBwahqIEkdVJumDtvaKTY6yCfZlRydHxzT0xVpjro1c7IpYdiIYCwiz/We2AVS11UhblaW9bHjKGGf1+G1faW24Z40Z9XD82mFm5NaR640awvFj1E7n2Fu/BYGL0yiy2/AsqS55i1OCp31jfCS4T79fzuR3LPBGj26/g+aVRjGpAN5xKpRcM6kUAI8TAzMIlbAiMgUikcso7H6avYleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1q3awXFXc0HeSJQj9cfvSiNE3+Z4I+19S3I6rAVhBo=;
 b=rryBE0YBsAknoi2eLHS2ty7caZwCYRGSUZ0JxiTERxbCoFliZp4mGzc0v1p1zMNtcOLZfc1FAN9L93khOgBGC3ckgFsT7blH1UacwSIPCBA8ZxYdh6G19tgtYu0Xp6zmPpaC5Qrug7chj6Q2imG05lMKARpbPMMzZMto92ANEM81fjgxU+PdH/umHqxHCLXw8UhkOG0ZTr4VUS6GSWO+tSyFaiL6NlWvB8AWU48M50WwbXboPfBkU3GQ5yDTi133GjCi+7KgAyrhslT11FA/AkU8nzzSQ+/2e8pDDELqCs/YBYDNCv11Iyg/rPa/ig7nNRbSRj1SD9nGGEBgqDrmdA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3513.namprd12.prod.outlook.com (2603:10b6:5:18a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24; Fri, 23 Apr
 2021 23:03:12 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 23:03:12 +0000
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
Subject: [PATCH 00/12] Remove vfio_mdev.c, mdev_parent_ops and more
Date: Fri, 23 Apr 2021 20:02:57 -0300
Message-Id: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:23a::34) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:23a::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Fri, 23 Apr 2021 23:03:11 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1la4pJ-00CHzN-Rw; Fri, 23 Apr 2021 20:03:09 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9968fa12-eaf0-461e-e4d2-08d906abf773
X-MS-TrafficTypeDiagnostic: DM6PR12MB3513:
X-Microsoft-Antispam-PRVS: <DM6PR12MB35130152B4EFCA1617CD329EC2459@DM6PR12MB3513.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctLpHlofG94OpLseATQrveyh5x4Mb6i6rrsuIhmjnHqO93zX4yo0J/hZX2UXank91gP3xsU2kE9HwlPt7ARHZTitI3tl8QVs6V+vE/OrFPDblr4sZSIaJ5UxL0PdyTaxhEm17g7jQq12qMENgJAIjy+kUlpsixX0z5MQ86TS46d471ZF5n6ix+XxrxHpEBY7geLvT5jOzZpLV16LcjoP4vDjURrL2HHQERNPzoCgRzN8mZ89aLSbX0gc2JJMFjsnjeDbStuo84agXfPgEaH5L4RC7LFJO1ixFap977ARGurMvUBGXBp2UFe96QUN3kPGYYMn1KvffKzKPLplycQwLTOrZV9xwKYdOLTe4xyxGo+HpI/vZjgol4wjQGqvFVg+h5kQtGl7cIgpFJijZ7DM487zkh9gm+t8JBB8fC+o0Q3NJB5ZCSb//ygXru1JQV6dn2YnfCPgtPL/0Wf7sxSdcR/2MviJhtc3PCaa44/YAJtjPmtxoMGDCvVgZBesyWbkNfAyXHi3WR20d5Nu0N/7YxY6KkrNL1Swz/EG/9UAVlJa2RjA4TTS+bXSFKo2NON9Fj5ugF3khD9proc6QsWWBdeBUh9zD++q2ha0P93Bfj75MhERlYC/kTBpyoGExR9+A4dOVz/BE1UkDRDqwp4lEBRK7goQwAfDXFJjWHiQWFPX9oalEuEFEAxOoFWe72w4IrzZlSMnU86/OTEGsPBuIzklgC5oLieJ8hMBjA3owYmZ2+W0TfM1agiXBRQYS33F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(36756003)(66556008)(26005)(66476007)(107886003)(426003)(8936002)(966005)(83380400001)(921005)(9786002)(5660300002)(186003)(86362001)(9746002)(54906003)(38100700002)(2616005)(316002)(8676002)(7416002)(2906002)(4326008)(110136005)(66946007)(6666004)(478600001)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VXgrX+fgiJs+QUN3+SYC+p8lyHPYCuPDQgQp2ASt/wUcgj9djMx4wgq4vCc1?=
 =?us-ascii?Q?xbsEVCMLaavezmsIgq6VGDX5TRVTJxhGgtem5NZoJtK8cC+EpXs45G906SX2?=
 =?us-ascii?Q?khxDNyMZXH+xoUbvOc0Tz0LKyDiRlz6ZMwXzx/GaFJ772bHFin23qV9D6mFv?=
 =?us-ascii?Q?qZICoGApfgHNW66M8q1QX+Eo/Pu2dwFXLzmFJTAWsX6KWxbctWe4VP9qcsMx?=
 =?us-ascii?Q?HVj0RqugI+2Vzej9RsU80xDmEnriDAvwnwfNQr+Z9Kg4UcoJZAfT0+w6UABb?=
 =?us-ascii?Q?WIXRviNsRkMa404T+zRG9g0uQXrq7sYgdkqMhdEweTo9aw92AN7HFy/P49w9?=
 =?us-ascii?Q?vSK3vcC1R6eoZjm55TaI04HwGmGMRCH3CQvJZxKDYc8n102f306NkZAvm4Ld?=
 =?us-ascii?Q?AnjA6wsgmz/YlYI3+JmmEcbR8ummutJ5f/UTubmi/jNa2OVGhGtmjrFxiAKv?=
 =?us-ascii?Q?x9xnBkEQ9InyJqh0lKGOq/Z+io3ZS63NcTjNVOgh2w8cdLIKuGTatjQwiCFz?=
 =?us-ascii?Q?qZIz26oR+9gUKA8dsx3xMic9BWaxXVMen49HLTMBBiWJJAKWbFMgCifA65RG?=
 =?us-ascii?Q?0lKa/tNv3v9UBpp5f2uTQFgbrj54Oi0gS/aKLUWfx0lGHOhArBFgNhgOrYrV?=
 =?us-ascii?Q?Er5BHL191CDFQnN6MUeNe6vU7S6gE2SrS9+MnjWxYL7jYZ9/OeF1Yel8RDVy?=
 =?us-ascii?Q?LXh2CjB4vKYS+pO7mAKZizIl0sSbiDCLXIQUW6yhYbqVLUFPvWpLFBGtdO7n?=
 =?us-ascii?Q?3WnlCDnNbeqTaPv894RuTq/8tLVqfqY2LrrR9v6LjV/kih6VRMjTWiF/l5pN?=
 =?us-ascii?Q?5wo0k0j9gJdb/GRtKrW/04cVE+G5jCF7eym0vu+UthLFhyzTZrla8gJ+jp3N?=
 =?us-ascii?Q?TAnUunkIjy2Ss6wMZFQeIlOCscz6XlHDJryGuhvVa4yDxL6IoMxUwNJZ7a4y?=
 =?us-ascii?Q?BDu2Lv/Ne9lm/N6QBJ4wNt2ClY0Wczhq8s6FP16vjbThaalYpTqQ54u59X7d?=
 =?us-ascii?Q?kPbmYNnS/CrbMLwnw633TmCcfzs3wtACfZnG1PezawJ27GV3Fa6Fb6y5b4vG?=
 =?us-ascii?Q?5H6EpWM3tdRZHkemrAT3dD9L1768UuD1jRVs79FObPnBLJiZlD6FvQp8iBrQ?=
 =?us-ascii?Q?SRcXwMuuc0aNnBkL5C/JAiwZhzGV2sI1ZPpUohJQrykwtKLSneZhasOWzvwY?=
 =?us-ascii?Q?jLS1WJn0IbNbp4bj4oarjx/PU4ikOtzN8vmLRdgTSQuYEkeVkmFYJ2tn1Hit?=
 =?us-ascii?Q?OSpCiAksf+8jvY1bfdgBqk/m18JRlAKiO3/G9lcoJxNip2aWLS26HOt3LRNl?=
 =?us-ascii?Q?uVifPPzNf+bx+asjJO+oNeoq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9968fa12-eaf0-461e-e4d2-08d906abf773
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 23:03:11.2646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joRzQB4TY1WpZVYmE6KMyo6Q6PIrdd94BtIriL6zAtcQjA/MZG2F0sHPnlrfBRz+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3513
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Tarun Gupta <targupta@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prologue
========

This is series #3 in part of a larger work that arose from the minor
remark that the mdev_parent_ops indirection shim is useless and
complicates things.

It applies on top of Alex's current tree and requires the prior two
series.

This series achieves the removal of vfio_mdev.c. The future patches are all
focused on leveraging the changes made in the prior series to simplify the
API and device operation.

A preview of the future series's is here:
  https://github.com/jgunthorpe/linux/pull/3/commits

========

The mdev bus's core part for managing the lifecycle of devices is mostly
as one would expect for a driver core bus subsystem.

However instead of having a normal 'struct device_driver' and binding the
actual mdev drivers through the standard driver core mechanisms it open
codes this with the struct mdev_parent_ops and provides a single driver
that shims between the VFIO core and the actual device driver.

Make every one of the mdev drivers implement an actual struct mdev_driver
and directly call vfio_register_group_dev() in the probe() function for
the mdev.

Squash what is left of the mdev_parent_ops into the mdev_driver and remap
create(), remove() and mdev_attr_groups to their driver core
equivalents. Arrange to bind the created mdev_device to the mdev_driver
that is provided by the end driver.

The actual execution flow doesn't change much, eg what was
parent_ops->create is now device_driver->probe and it is called at almost
the exact same time - except under the normal control of the driver core.

This allows deleting the entire mdev_drvdata, and tidying some of the
sysfs. Many places in the drivers start using container_of()

This cleanly splits the mdev sysfs GUID lifecycle management stuff from
the vfio_device implementation part, the only VFIO special part of mdev
that remains is the mdev specific iommu intervention.

Thanks,
Jason

Jason Gunthorpe (12):
  vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
  vfio/mdev: Allow the mdev_parent_ops to specify the device driver to
    bind
  vfio/mtty: Convert to use vfio_register_group_dev()
  vfio/mdpy: Convert to use vfio_register_group_dev()
  vfio/mbochs: Convert to use vfio_register_group_dev()
  vfio/ap_ops: Convert to use vfio_register_group_dev()
  vfio/ccw: Convert to use vfio_register_group_dev()
  vfio/gvt: Convert to use vfio_register_group_dev()
  vfio/mdev: Remove mdev_parent_ops dev_attr_groups
  vfio/mdev: Remove mdev_parent_ops
  vfio/mdev: Use the driver core to create the 'remove' file
  vfio/mdev: Remove mdev drvdata

 .../driver-api/vfio-mediated-device.rst       |  55 ++---
 Documentation/s390/vfio-ap.rst                |   1 -
 arch/s390/Kconfig                             |   2 +-
 drivers/gpu/drm/i915/Kconfig                  |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 210 +++++++++--------
 drivers/s390/cio/vfio_ccw_drv.c               |  21 +-
 drivers/s390/cio/vfio_ccw_ops.c               | 136 ++++++-----
 drivers/s390/cio/vfio_ccw_private.h           |   5 +
 drivers/s390/crypto/vfio_ap_ops.c             | 138 ++++++-----
 drivers/s390/crypto/vfio_ap_private.h         |   2 +
 drivers/vfio/mdev/Kconfig                     |   7 -
 drivers/vfio/mdev/Makefile                    |   1 -
 drivers/vfio/mdev/mdev_core.c                 |  65 ++++--
 drivers/vfio/mdev/mdev_driver.c               |  10 +-
 drivers/vfio/mdev/mdev_private.h              |   4 +-
 drivers/vfio/mdev/mdev_sysfs.c                |  37 ++-
 drivers/vfio/mdev/vfio_mdev.c                 | 180 ---------------
 drivers/vfio/vfio.c                           |   6 +-
 include/linux/mdev.h                          |  86 +------
 include/linux/vfio.h                          |   4 +
 samples/Kconfig                               |   6 +-
 samples/vfio-mdev/mbochs.c                    | 166 +++++++------
 samples/vfio-mdev/mdpy.c                      | 162 +++++++------
 samples/vfio-mdev/mtty.c                      | 218 +++++++-----------
 24 files changed, 649 insertions(+), 875 deletions(-)
 delete mode 100644 drivers/vfio/mdev/vfio_mdev.c

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
