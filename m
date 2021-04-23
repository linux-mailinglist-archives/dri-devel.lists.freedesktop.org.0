Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D80369D01
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 01:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C4E6ECB4;
	Fri, 23 Apr 2021 23:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CBA6ECB6;
 Fri, 23 Apr 2021 23:03:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGhTtYdC1xPV5x0MhlthzhzC22Cd8TCHfmyp4bNeARDGpSulb4ZSX1fOB93SNYO/fuijd6spQNFG5uKW9lLtTk759Hu482hq4lLdcl9wu7/N+F8udhx+J0GOTF3yptrmQJG1ThFy7/9ilszCc1iTmkc+Au3vmU0e4Srng4MEuw4NCwyiSG97aHmUOdO13zNXZxW2CXbyJ6A2pQ+CgkPllm1JCkhkUw1Ba1+gyX9JZROPnOKyIpU9pS7AZKxkQxv8KY1okoM6CONVCDiavj0xiiB2Fg3MV2/0s6U8zWnI2zeFu+BSwOAV1ZVSE60V3S175/X4KypNoMuU2fxzCVU5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAl1RpTrWqN5LZrV77LcK5OTpSV7Yj94D2r3e03JiG0=;
 b=j+WQrdXVd7A0yL5sfB9RiNJNoJqm4F+NZ+JlDi1/6UriVYoL+aWSzoLXtpvBOmt8lU6eowflTFzgXmRZMdTtDE0YegfCh8zrc+ZnsOHFopEPoujzeW9/+EIz8yNpff05J/ihjlpvJT3N5NJpq3c/+c/4OCPjUd76bm1TDX3jZjmWWdraDSXol3IVoG/JOASqkPvx2i41Z8Mo1GHjkl5Jq0/iBWdt03CWA1dgA1E6wtV7z4EEG05S54tpPPP9ZwF6qQuLiiza/s11PfYaEQH7hAUMSZf1VBtHzw1mBzmnHSawuQ5JFKT0Dp1Kirp2pGhWRfkTvT1UmA1aZw9VvT+9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAl1RpTrWqN5LZrV77LcK5OTpSV7Yj94D2r3e03JiG0=;
 b=X5Jy1+ReBcns6rK1PQ/OAjh+5vEQsf90IdwgZ2tISBZdcgAQbFn3RE3KLXLszDAuVjQg6JqcPWMtSvmv6ZPNWLzrQPw4TCSWPQo1UZXz+gHlaX6qhk527athctokTIU3pEV7qpvA2z9ClGjolKh4OXIfwbF4uvyf66o2yCGK+mwN37oOYkf12Pv9pp/N5GXuxWLH7GaaWEGhResNWCsegIRSnU7Xgu8sB9RDLCqv0Vs6xMt+78DB4ej99nzuCssjgMgARXl9Z1fiFXPueL3FwIYDMMGPP/ZPXhrBrsgAB6JKiuHP0sXi4+NR8xXP1AkNGlnQqORYnC/U/VF3IqhBZg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3513.namprd12.prod.outlook.com (2603:10b6:5:18a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24; Fri, 23 Apr
 2021 23:03:15 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 23:03:15 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 01/12] vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
Date: Fri, 23 Apr 2021 20:02:58 -0300
Message-Id: <1-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
In-Reply-To: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
References: 
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:208:23a::28) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR03CA0023.namprd03.prod.outlook.com (2603:10b6:208:23a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Fri, 23 Apr 2021 23:03:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1la4pJ-00CHzQ-Sr; Fri, 23 Apr 2021 20:03:09 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 987eeaea-ffa1-4b72-292c-08d906abf841
X-MS-TrafficTypeDiagnostic: DM6PR12MB3513:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB351364686C5B2D51BA14B331C2459@DM6PR12MB3513.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MfjuNpE2vY8jseRQZRK1FJHxMK4wrm+LQjHe2V8wd+/fuXS9xAoGO5T/IJU6atybzzokUyC0tONV0qYeIyBNsfxO069TKXs6U6L572HaoZsfbDcqMdwsVGIx8McMKVPzY2hldiTD15ATKKdT6cYphdzPK+SYAP/4PvWK+ryCXkGe4INt2IJVdM3VI186vwwNJKZXFVUTXIkx9ccObBdKyMbHNig7tluSYCLRotU/PkpQjnfGyv73ddnbkH2y/VyNVo95KjKN0eio/eFYDXiQZFsEgDk10jKxQPwvG8XMOy4D/ErP2gR9vaydVeDkXhCI2rBosLLMgW82JN83hLzXOFBcs7zLqTbjU4F1Ya+TUNW9ONhHvouEd8WxyUJX1c7HL7E1trTYa/yeDMpXhdWvIVBDJXbTuc5Msu8FBlJCXNXdtPp/IdYvarytX5WPlKs6DpE1gq8k4vKOxJdDBaCLx0m3iYor1MPi8d+l3m6DaTcp/n4+/dBsrsCHQrX/yzFY6CIQe1RZiZ4LjZYELK3JyLmj87cVWGG55xZIoDCbSy/tRTe8dKOjEe8WPd/pD1EJClRxk/mI5Ga6grfOEl0WSlm9p6F5xZ7bzhPBPQNB1fM5eU2QnZ95iP0z9+GCKIVL2LnAZlS29hY5CSyMH27VbjDE1RHi/vqcuqNV+7wG+FI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(36756003)(66556008)(26005)(66476007)(107886003)(426003)(8936002)(83380400001)(921005)(9786002)(5660300002)(186003)(86362001)(9746002)(54906003)(38100700002)(2616005)(316002)(8676002)(7416002)(2906002)(4326008)(110136005)(66946007)(6666004)(478600001)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hysLrLiltE4oQlNogxns20AtdqhTUwwSwB9iZ9lsQLS6vqc7OqYILVkLtv74?=
 =?us-ascii?Q?5QO0SYPjgA+TyTB+ZgUhQimGTN11vP48+wSSDWQo6OO9MJDV5bpirUFS+vHG?=
 =?us-ascii?Q?jOMkxBHQJHRGCyRQsxN8UlwuptYtir5A1RkJus5ph/AV5aP2q5UBlnw7FoS9?=
 =?us-ascii?Q?RUPf4VgKQjAKDsY0eScEPCef2TbzjphccsbbUbMr2RXg7bhJvw5qviKRLpE0?=
 =?us-ascii?Q?95tYJZk7AEUbUBsLnQSsmRdWeEoW3VSf+KAMx61zMcBaSKMuXhW+LVAo79a8?=
 =?us-ascii?Q?ms6k+cNNdH05SRxjmBVxhxIqvpztQzwoIvd8qkohrImWm4HDU55m+NKX0KCZ?=
 =?us-ascii?Q?dL+5zv7Prm3o2DqWKoN8ZQ3Idsq9IE2v0a6Q16/PSr7Mduj5lEUMvoxKHZGK?=
 =?us-ascii?Q?EfRHxnIK1X4y9szsLl95wehSJLs5hsKkjG3SNnAFrUiwjxeJNmyhrfBgQbsj?=
 =?us-ascii?Q?ylq5uivAR1I8O9BH4Nfc2qWAnrch1eWzH+gIMAlkrogxgk+3pQOlURjB8jfI?=
 =?us-ascii?Q?8mV7cjiOM+RgR2LwfnwPZ7b8KfIKiK0pSmoOSaXVMn+gOXkwyZ8ttOQdYRjz?=
 =?us-ascii?Q?xYGWF8EmmPkTzyVfZ91G0fspwFe7sz9TqVYuBQLC031EbSz1GamLqFKEzP+9?=
 =?us-ascii?Q?aNb6a8f/wCWepklqLrVwgleHx2+AGDuJ3BgM00rZSIa0w6ZAw/3otxEQkSid?=
 =?us-ascii?Q?nyYHy5g86mY9pgcM89VMKNNs/Ozq65f1t/Xj/dgCsuHSgkCN26hBtfElaXAf?=
 =?us-ascii?Q?z/IGOEupkm8yg27Xo87coD6PKtsMHeQDFhszTvp2mVdE8sKuq+78PhZINLuo?=
 =?us-ascii?Q?C8CsgctWNuzasa9EOmpEDPjl1z0O24jfPGrFbdpkdDkBBFicl5lROaXx6wDl?=
 =?us-ascii?Q?uJf4kx8YxowsaTTxcJONxYJgRzDdfpElTzwG1TGL0YfU1zi/VqRMXYdKuU7S?=
 =?us-ascii?Q?yvg7ZhbVgKIMKE3rkI5EQ9B4iuOrTYlr9lnfR4uyywrW4iSEFNHNxIOirtyt?=
 =?us-ascii?Q?peFPX677KQ69UiWt8gQGBANFjsIBkaKykSG5gyBsUEGPPhlJ1RFZAdItvVDy?=
 =?us-ascii?Q?xzfGWz4LVNTcTiW80A1cP9g0CXh1oRxZsCyXIYcPRqYxviLxdElPWMALIntQ?=
 =?us-ascii?Q?u4wroHfdAXaPhrvvRV9QZX5nwIRcUGQqCIbX85y3eq2qbMvPLQn91i9xz24Y?=
 =?us-ascii?Q?tfNzWvkwVqhcEUeikGu2fBqmOedhdB6yPEjiuQ51qoSfWRFwCQAtZRJgo3nC?=
 =?us-ascii?Q?T3+JLVs4LlEFaciB+u7FZawZ+IHvmJuFe8RB8wdfxHRnQa8PDHjbF6Ur3ZAC?=
 =?us-ascii?Q?GqCam8StzAFEwIpkiXSsXXvw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987eeaea-ffa1-4b72-292c-08d906abf841
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 23:03:12.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZ7ZPacrzbFmx0cmW9bQDKIoOQ79lfpw4AEgHSl1Afhy+SQ/tjEZEAOde2NaQWK+
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

For some reason the vfio_mdev shim mdev_driver has its own module and
kconfig. As the next patch requires access to it from mdev.ko merge the
two modules together and remove VFIO_MDEV_DEVICE.

A later patch deletes this driver entirely.

This also fixes a misuse of kconfig in the samples which prevented the
samples from being built in.

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
index c1ff874e6c2e63..dc7928e37fa409 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -773,7 +773,7 @@ config VFIO_CCW
 config VFIO_AP
 	def_tristate n
 	prompt "VFIO support for AP devices"
-	depends on S390_AP_IOMMU && VFIO_MDEV_DEVICE && KVM
+	depends on S390_AP_IOMMU && VFIO_MDEV && KVM
 	depends on ZCRYPT
 	help
 		This driver grants access to Adjunct Processor (AP) devices
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 483e9ff8ca1d23..388bc41aa1a75b 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -125,7 +125,7 @@ config DRM_I915_GVT_KVMGT
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
index a656cfe0346c33..5461b67582289f 100644
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
index e76cdfc50e257d..2a4876e2ce0d03 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -147,14 +147,14 @@ config SAMPLE_UHID
 
 config SAMPLE_VFIO_MDEV_MTTY
 	tristate "Build VFIO mtty example mediated device sample code -- loadable modules only"
-	depends on VFIO_MDEV_DEVICE && m
+	depends on VFIO_MDEV
 	help
 	  Build a virtual tty sample driver for use as a VFIO
 	  mediated device
 
 config SAMPLE_VFIO_MDEV_MDPY
 	tristate "Build VFIO mdpy example mediated device sample code -- loadable modules only"
-	depends on VFIO_MDEV_DEVICE && m
+	depends on VFIO_MDEV
 	help
 	  Build a virtual display sample driver for use as a VFIO
 	  mediated device.  It is a simple framebuffer and supports
@@ -171,7 +171,7 @@ config SAMPLE_VFIO_MDEV_MDPY_FB
 
 config SAMPLE_VFIO_MDEV_MBOCHS
 	tristate "Build VFIO mdpy example mediated device sample code -- loadable modules only"
-	depends on VFIO_MDEV_DEVICE && m
+	depends on VFIO_MDEV
 	select DMA_SHARED_BUFFER
 	help
 	  Build a virtual display sample driver for use as a VFIO
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
