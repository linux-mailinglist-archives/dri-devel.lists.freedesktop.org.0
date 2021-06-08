Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82C39EB16
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 02:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096A56EA7A;
	Tue,  8 Jun 2021 00:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5476EA79;
 Tue,  8 Jun 2021 00:55:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mq/kkIus3mEbqcU3RRjOpRsd8QMlnXa02ornTdlAZOijPA0hSyFzUfVp52YFzlbaC7ZKidZFZE5uUpu2w+3xPVu/SbeEZZcLKTcAOAcyqbT7Vv4DXY9nn+gtlMaIE5yoRE9EZJAz1SK0SzOVVIdKt3PzteatHiG3f3N7K9qgGT4QAamp28RKkZLERLuP8ZS6ZEQjw2U2bY6C0bJlCyDdM/EFpUZa1H88qtZ615FCFL9O4TcLRntDkRde1ZWcE9mMxB71RejOgvigCDMHzSE6MDQM0ZLNhcbPQ65WasRjFo4CwwDs5ToJGvSo6Pvsb4cUXonM+ZWUSjNm1brT0jAMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbNUseuZfVmjOEc5NUfvlTUktAPBtyinUwz8YfOVMPg=;
 b=KGGJdRNbdntqYj8BPKk07scmLjSVvsrBrAdZjGNjSwTtHME7yCXbKG8NKQmqGUTVdYU0HBRANqItNGigCEEelf6hA+CZfeV7W8wcPhCA21smswVeYsM8IIetoWnfzWEL0Mezo7VP0fonmxYqwo0x2LnfdCv3WI+b8tfRUhNHoy6w4W5RFz2JOciS1BRt61CmfaiqHtcuBd28pGOnHUL+B1i0zLiPXurDuH21/PVBFJLue+ex7LJIcyeAD/ArQsVaG1e5iRcxdml3MuEspVOj0T3TeP9O6tB05QhAMkGs+sQxw4Uyf9FV1NcYfnBNdcQmGwQzHtO2/1iB5DCfiDZpJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbNUseuZfVmjOEc5NUfvlTUktAPBtyinUwz8YfOVMPg=;
 b=YSdGL3kZVdxaUYYvcHBAI5MPDLdLCCi4hhlcKwuz1HPUo0P0S29I+Gwmle/NL0c/5xw9FcAv2EiRGNUHykAx/zajRogtRWiM8XIchfVn7MIDYoJ2WQ0j5CxWrxOdIusLddIRbm1SwEYmQ2BMri3z6k3IEtgW1zZhOkm3RVoHiHvLP4R54a9NRrqCbMtXs46FofyQKMSSYpypsvahXS4z0Di/jnNIMAODd9GOKWInvdpGw1dmo4E+r2ivq4HPa/vcz9YZwD1gVRC4Ik1UkHS0UkfMXKnmdMFoxV+zH9oVbZooC/NFyemOIMD98nA7NhXSRR6YEwznUn3Cqbgdwc6LeQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5095.namprd12.prod.outlook.com (2603:10b6:208:31b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 00:55:56 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%6]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 00:55:56 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 06/10] vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
Date: Mon,  7 Jun 2021 21:55:48 -0300
Message-Id: <6-v1-324b2038f212+1041f1-vfio3a_jgg@nvidia.com>
In-Reply-To: <0-v1-324b2038f212+1041f1-vfio3a_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR12CA0027.namprd12.prod.outlook.com
 (2603:10b6:208:a8::40) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR12CA0027.namprd12.prod.outlook.com (2603:10b6:208:a8::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 00:55:54 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lqQ24-003eKf-Jw; Mon, 07 Jun 2021 21:55:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7939e776-df59-4890-810c-08d92a182b52
X-MS-TrafficTypeDiagnostic: BL1PR12MB5095:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5095ABBC46E1109B4250BFA6C2379@BL1PR12MB5095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGR42DYmEGs4GTGIsT5gaXSTcx0PZ4WIhi9EqscIvIOG9iMGEAc4XAIdDZlKYfrrmOcp5LWxDiBtSbs9GpnCkDT5OSvn/bfT1afRjnzi6nK0dapHvvwGKH2GaeBtlHeN4QwW+k4R1RZQDh44wqPjIAxO6DsKEioTofF6NKaFyqH1SWWoAUevUqvxSXzQ5pRbJzV18MgMYar++wC0P1bIfb3HpEQ5nkVM2BnCA5HH8TqEReKTrkzU9KovoLOKmVaEE+b0mUVvjVu54uuzmsgV4mbQVc3VRSAUgf1igrYyeZ24YWj23uw+mnTK5DRg7xEhjifWvkJhF03lWC8cA0yYTHDUpn0gB4/0sX/goVbT1Gals5B05QN+x9pbYGEMXRIQHqqqJtNUfxP1eDtWnGbJla5REZLOFtCwHOI24w7NGT0DwSMBWqCO318ZNaf4mFQcXqyANy/4s5Q7Sl56nKWZapGT9JJFqmR5zeve6cSVCDB+HQMrsux+8F0krFiFKn7anZ+tosZ/7Z98XoZ81GSSC/AY+rV0npObPxGXte/ZUKEig6Xf+LikD0Bt7IQeoyMvF0kK38aYuV57sjey6g2D3ZEwBcV2ogWkNO6jwigQ0vTn9y8Hmy8H3t/x6aEx/sopxi/PoGOQkUtfV0Mb2Kobk1qdW1DGFKH9Z3O9C5nbTGs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(110136005)(2616005)(86362001)(9746002)(66556008)(2906002)(36756003)(186003)(921005)(9786002)(478600001)(426003)(66476007)(83380400001)(8936002)(8676002)(26005)(66946007)(5660300002)(316002)(38100700002)(6666004)(7416002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gRt1PpQQ2kRrvz4ElF3VaHbWNq5l5lWbNwUNH+dYXSGw3omgD1GGylZjvvZt?=
 =?us-ascii?Q?fXbYNrkvXpo8o6L2DsHyhJsZ0zdx/Umqkcn65DVzoeTjBX7hXgvkvDYeloIc?=
 =?us-ascii?Q?G+Gvj6BzH2KjWbwThFS60Kl/02qsoJLcD+OuxnIzlMWTkzPhkVYB073Xw2jt?=
 =?us-ascii?Q?NuMoYBL4AOfW7NyOW5O9MJCmYWtELujbN1r6SxwY7ooqhvCpd5E/p8rxoC1l?=
 =?us-ascii?Q?LyLav33rJ2HGdFpE9oHY/Mq17mDTs7euqlz4f84L7WSKtYypLu3tenVS1B03?=
 =?us-ascii?Q?U/Zu32HHbuAyhgNGRubv2j0kzFHdF8Ge72oZK9jp2qhzuhCaILV6SY/QX6DJ?=
 =?us-ascii?Q?Ut7RnKswp/S+rTxihXeuV/ZmbRuXPS3Lbb86aiqUPfy9lSA2oDFmqrvcn7Lv?=
 =?us-ascii?Q?A/+hArE86NjkYwEDokG/ZDrPbwE7usKhMxxrDsnr/jPc/L4pCH6mSkTyqPm4?=
 =?us-ascii?Q?yWfb2xHbbWbbrgu+W+L2Kpe/Y2H8wTsgAcFhAwcDxWlFcmSCXQLJ4PID3RIf?=
 =?us-ascii?Q?6ye9hPevdaZkf903sBRW7uuGQycgzE0qdEB7fVDqdrSz0sBZidNQClsrauCW?=
 =?us-ascii?Q?03fDCwBlwNIRRiHm7F2LejnNUl5Y6B1TLRfXZZq4hnP4InOTficakHt+wPPc?=
 =?us-ascii?Q?FQcpJZfAMhLKZrwnJxcHiU1vNkVOaR+fj45XaJCNntUvkxlU8Kna80TGKMId?=
 =?us-ascii?Q?gQ+ilIPwcjYY1kkE+QwdVI20ZuHV7kEIJFfb7aRbHcbGdY4Z1vD1gUoexUv0?=
 =?us-ascii?Q?HDFmRifMEc0fikF7AjCi7PQadZqjaDf52e9Dg1PPPpFiJu1GzwFPgA0eCEPd?=
 =?us-ascii?Q?s+oMLZuPHtwhAV7hH0WCobjQ850ERmtNlEw8ps95n4jDcCiHQmASn2mk6vXb?=
 =?us-ascii?Q?ckFBQNGwxTyr+GP1oWPFZ5axRzsKYJ/XLyzHX46tTBcPoXLyW6NTj84V0iwF?=
 =?us-ascii?Q?FUuQZtyyiLQ37aoI+3CwyQo7lxcWmj4hz0+v17HCQBLZxaHETgTjZi8juzJn?=
 =?us-ascii?Q?WD0r5sLJ5xrrn4obSRFD9VWMduzj8zV+grVlEAg3JX4Q72IYFR90rjOzB6lu?=
 =?us-ascii?Q?mGwBNEuEC1qLdVbCuG4+tAdNmlYrJrwtKR50kqhjBhLkHOMLYVQXcExC/t5G?=
 =?us-ascii?Q?kBH6NWYj3onGLV+xrwlou95ywW38OmNgktgUuW/41yDiNyHyb/KGHbYVJ2Yt?=
 =?us-ascii?Q?mcmmW2pjuzzBtVAOX63jkOKhA19nivVPdyYiTwMi6Ga4AJtIjccIXiofXLu/?=
 =?us-ascii?Q?UsDjbImRgRk9/HcjQME3LF0ceJ4OEGtq1m7w77ZOt//dGZfCqSCBN5Pvqhq5?=
 =?us-ascii?Q?htpCGHr5zTKYhbh64ZHxj8Ii?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7939e776-df59-4890-810c-08d92a182b52
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 00:55:54.6245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTbb6Ss7UtjIqAOXQuYZAEyb5q3lbmmh+5pl5NwgfgNdo9kUW0JtpVsFESagjd7o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5095
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

For some reason the vfio_mdev shim mdev_driver has its own module and
kconfig. As the next patch requires access to it from mdev.ko merge the
two modules together and remove VFIO_MDEV_DEVICE.

A later patch deletes this driver entirely.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 Documentation/s390/vfio-ap.rst   |  1 -
 arch/s390/Kconfig                |  2 +-
 drivers/gpu/drm/i915/Kconfig     |  2 +-
 drivers/vfio/mdev/Kconfig        |  7 -------
 drivers/vfio/mdev/Makefile       |  3 +--
 drivers/vfio/mdev/mdev_core.c    | 16 ++++++++++++++--
 drivers/vfio/mdev/mdev_private.h |  2 ++
 drivers/vfio/mdev/vfio_mdev.c    | 24 +-----------------------
 samples/Kconfig                  |  6 +++---
 9 files changed, 23 insertions(+), 40 deletions(-)

diff --git a/Documentation/s390/vfio-ap.rst b/Documentation/s390/vfio-ap.rst
index e15436599086b7..f57ae621f33e89 100644
--- a/Documentation/s390/vfio-ap.rst
+++ b/Documentation/s390/vfio-ap.rst
@@ -514,7 +514,6 @@ These are the steps:
    * S390_AP_IOMMU
    * VFIO
    * VFIO_MDEV
-   * VFIO_MDEV_DEVICE
    * KVM
 
    If using make menuconfig select the following to build the vfio_ap module::
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index b4c7c34069f81a..ea63fd22e1198a 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -768,7 +768,7 @@ config VFIO_CCW
 config VFIO_AP
 	def_tristate n
 	prompt "VFIO support for AP devices"
-	depends on S390_AP_IOMMU && VFIO_MDEV_DEVICE && KVM
+	depends on S390_AP_IOMMU && VFIO_MDEV && KVM
 	depends on ZCRYPT
 	help
 		This driver grants access to Adjunct Processor (AP) devices
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 69f57ca9c68d73..9ab1cecd69b2a0 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -126,7 +126,7 @@ config DRM_I915_GVT_KVMGT
 	tristate "Enable KVM/VFIO support for Intel GVT-g"
 	depends on DRM_I915_GVT
 	depends on KVM
-	depends on VFIO_MDEV && VFIO_MDEV_DEVICE
+	depends on VFIO_MDEV
 	default n
 	help
 	  Choose this option if you want to enable KVMGT support for
diff --git a/drivers/vfio/mdev/Kconfig b/drivers/vfio/mdev/Kconfig
index 5da27f2100f9bd..763c877a1318bc 100644
--- a/drivers/vfio/mdev/Kconfig
+++ b/drivers/vfio/mdev/Kconfig
@@ -9,10 +9,3 @@ config VFIO_MDEV
 	  See Documentation/driver-api/vfio-mediated-device.rst for more details.
 
 	  If you don't know what do here, say N.
-
-config VFIO_MDEV_DEVICE
-	tristate "VFIO driver for Mediated devices"
-	depends on VFIO && VFIO_MDEV
-	default n
-	help
-	  VFIO based driver for Mediated devices.
diff --git a/drivers/vfio/mdev/Makefile b/drivers/vfio/mdev/Makefile
index 101516fdf3753e..ff9ecd80212503 100644
--- a/drivers/vfio/mdev/Makefile
+++ b/drivers/vfio/mdev/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o
+mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o vfio_mdev.o
 
 obj-$(CONFIG_VFIO_MDEV) += mdev.o
-obj-$(CONFIG_VFIO_MDEV_DEVICE) += vfio_mdev.o
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 2a85d6fcb7ddd0..ff8c1a84516698 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -360,11 +360,24 @@ int mdev_device_remove(struct mdev_device *mdev)
 
 static int __init mdev_init(void)
 {
-	return mdev_bus_register();
+	int rc;
+
+	rc = mdev_bus_register();
+	if (rc)
+		return rc;
+	rc = mdev_register_driver(&vfio_mdev_driver);
+	if (rc)
+		goto err_bus;
+	return 0;
+err_bus:
+	mdev_bus_unregister();
+	return rc;
 }
 
 static void __exit mdev_exit(void)
 {
+	mdev_unregister_driver(&vfio_mdev_driver);
+
 	if (mdev_bus_compat_class)
 		class_compat_unregister(mdev_bus_compat_class);
 
@@ -378,4 +391,3 @@ MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_SOFTDEP("post: vfio_mdev");
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index 6999c89db7b162..afbad7b0a14a17 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -37,6 +37,8 @@ struct mdev_type {
 #define to_mdev_type(_kobj)		\
 	container_of(_kobj, struct mdev_type, kobj)
 
+extern struct mdev_driver vfio_mdev_driver;
+
 int  parent_create_sysfs_files(struct mdev_parent *parent);
 void parent_remove_sysfs_files(struct mdev_parent *parent);
 
diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index 922729071c5a8e..d5b4eede47c1a5 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -17,10 +17,6 @@
 
 #include "mdev_private.h"
 
-#define DRIVER_VERSION  "0.1"
-#define DRIVER_AUTHOR   "NVIDIA Corporation"
-#define DRIVER_DESC     "VFIO based driver for Mediated device"
-
 static int vfio_mdev_open(struct vfio_device *core_vdev)
 {
 	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
@@ -151,7 +147,7 @@ static void vfio_mdev_remove(struct mdev_device *mdev)
 	kfree(vdev);
 }
 
-static struct mdev_driver vfio_mdev_driver = {
+struct mdev_driver vfio_mdev_driver = {
 	.driver = {
 		.name = "vfio_mdev",
 		.owner = THIS_MODULE,
@@ -160,21 +156,3 @@ static struct mdev_driver vfio_mdev_driver = {
 	.probe	= vfio_mdev_probe,
 	.remove	= vfio_mdev_remove,
 };
-
-static int __init vfio_mdev_init(void)
-{
-	return mdev_register_driver(&vfio_mdev_driver);
-}
-
-static void __exit vfio_mdev_exit(void)
-{
-	mdev_unregister_driver(&vfio_mdev_driver);
-}
-
-module_init(vfio_mdev_init)
-module_exit(vfio_mdev_exit)
-
-MODULE_VERSION(DRIVER_VERSION);
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR(DRIVER_AUTHOR);
-MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/samples/Kconfig b/samples/Kconfig
index b5a1a7aa7e23ab..b0503ef058d334 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -154,14 +154,14 @@ config SAMPLE_UHID
 
 config SAMPLE_VFIO_MDEV_MTTY
 	tristate "Build VFIO mtty example mediated device sample code -- loadable modules only"
-	depends on VFIO_MDEV_DEVICE && m
+	depends on VFIO_MDEV && m
 	help
 	  Build a virtual tty sample driver for use as a VFIO
 	  mediated device
 
 config SAMPLE_VFIO_MDEV_MDPY
 	tristate "Build VFIO mdpy example mediated device sample code -- loadable modules only"
-	depends on VFIO_MDEV_DEVICE && m
+	depends on VFIO_MDEV && m
 	help
 	  Build a virtual display sample driver for use as a VFIO
 	  mediated device.  It is a simple framebuffer and supports
@@ -178,7 +178,7 @@ config SAMPLE_VFIO_MDEV_MDPY_FB
 
 config SAMPLE_VFIO_MDEV_MBOCHS
 	tristate "Build VFIO mdpy example mediated device sample code -- loadable modules only"
-	depends on VFIO_MDEV_DEVICE && m
+	depends on VFIO_MDEV && m
 	select DMA_SHARED_BUFFER
 	help
 	  Build a virtual display sample driver for use as a VFIO
-- 
2.31.1

