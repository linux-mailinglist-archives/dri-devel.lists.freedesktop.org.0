Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACED36BA70
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 22:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C6F6E876;
	Mon, 26 Apr 2021 20:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DB76E0D9;
 Mon, 26 Apr 2021 20:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+ukxqcu7nU3LVgjmkbi9PlwFDALK6x8agUkHlWzXp3BPBb/P5eDHaczlx5AAlmDJ/rHg16o7SBIRxCNIoDI6TS3ZUlWw53luJ5RgrWoCMynClnSjHOFYrbO1Mt4/nQ1sL2mVky9uuticmRS5Ps6xPSUyZVrAea/fmCuth6nwMjw54Ar4nuxfShR63QVw+LqhBym8Dp88jqX9efr+uACnBhfs8dGIXQNita13d61WMycpXaA66m42OMjefIcfLmDRtUaoSjLluLUAxah0xi0GHdMNOuBAhcWCRHvKJ7Ja91sgEhsjQbQm9WcwrNfjm/nuJB1D6tn1mjfJjVmiR4SPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtA9wwpcl5JsAiPwSoFC0d2L/Z2niX9OyeZRyPl5MMU=;
 b=UXVf/ig2+rDcP+p4A57xmHmD0MEP5LsS5jgo23eXhTDO0x9tSLXNptvx8J0vEK6MRLESLItnnMOH52oZhQMFmvNQmvpsXD0a/3NNRjnoaGI6KtOufKQySoMNYmTlLoRoe+yEOon9PAXOdK77Uo1ZSyR6bM0OUlMZtBqIKgzzxT2dkIJ0yTgDhKTAnDAVDhMH8+/q0qv4XkYZkM0hAikXFszXdXMqjDmEd7mqAlAusLw+ko+qWUeKdlu7IVn91D2sSEtrAryDHvNvKkUTWa2J1eqmXSOsuqGuXs2uBsS8QStbU1594cJVb9Zgo6T0p7JNcCPZYIP/UjkRYmIerhF80A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtA9wwpcl5JsAiPwSoFC0d2L/Z2niX9OyeZRyPl5MMU=;
 b=jlQhxHbmtQRvFq52UaPfBa3oLZvvqrlyB1viVjI2goU8Xg9ZuA/p2e9nxVCtr9jMsdRZid7kZghwwZ8c3ZtU3s8lhOaqZ8VGdhPTvsLhcvUMtWfblcgkuyMU0oWeydvY831KkR/Wop3g6s2mj3n18oES6u3D2BqyRqWJ4xml87lqdJAVFAbcrOmaneb4FhnQi9R5n6XEuU3YXA5LVi1Un499PPKcq2E94VVy2tuJxch3S3ed9v4Bw/VOONJo+10fltW0KlFRcBmMevQVE6h8g+l+ic22Cep7O+SapU6sSs2EBXQ+htC7/7uIoFm9fS8n9yGtxHEKrnqnJa4SlsOuOA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3740.namprd12.prod.outlook.com (2603:10b6:5:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Mon, 26 Apr
 2021 20:00:17 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 20:00:17 +0000
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
Subject: [PATCH v2 01/13] vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
Date: Mon, 26 Apr 2021 17:00:03 -0300
Message-Id: <1-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
In-Reply-To: <0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
References: 
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:208:23a::22) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR03CA0017.namprd03.prod.outlook.com (2603:10b6:208:23a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Mon, 26 Apr 2021 20:00:16 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lb7Ox-00DFZ1-Nc; Mon, 26 Apr 2021 17:00:15 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b17b8c4c-bd39-4092-1806-08d908ede983
X-MS-TrafficTypeDiagnostic: DM6PR12MB3740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB374005A85DC3EFECE94B3DD4C2429@DM6PR12MB3740.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGsk/G6BFzdQ/d66UubgFTPbSA0Ofp8xyI+upAcv+BiKwlKrCuztEE1H9Cuq7z+8Ad2Wo1hY9KWTPXwnqzSLklCTJdZxEeyTJfg6vxHjFbB6K/1YrS3rMceKN7RX/NV9N3V1XGuU4k2/30UgBMgrppKyxkwhXfb5f58uC2x8bR4K3YYCDiweTryig/aYPRK+I3cE+4+O4y/EOqpGYXa+RoEDnv/b1REJgExaxiiE2EJHNVAbCpLXEbghnNlPRp/W43btTP35vRp8QmvOx9qtMY50efDA8+3JnrIX8/G07qFEgUx3zQmKf39g8+BAEsJl95mg0JMrYgkWpqPN+H4VNoluS23caBSNMiEvcgxLhjCN7HjOVZgZq8+yfcF44pDmPdPMWOzwbUdAEtT1xc/owIiGlDpGrLLJ337O5UmYdZ/V/GpGWNoBfMG4uSzAOWVAKqwKIpQg9ZvTOVDnlBm5JopKuouOaAtrQjHiaZnlELul3REQQmTJyzElKDZBwYOV1uJR4KN75bouCYiSICJjBmM6BpG3LvKUtIzxmYINAkYezV5Z2OUvaLRAnd5V34HDnEOrNwD1IcorMCdvAhapQjxJktfne5sAqYcgOoGz8pN3ee0lcJgKzb1TOMR/4DYPo6an3BCRNZBiDD+BAAOWag6yfDWDgNCYIJs9ymgBz2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(66476007)(66556008)(9746002)(54906003)(426003)(110136005)(107886003)(186003)(26005)(921005)(6666004)(36756003)(316002)(2906002)(2616005)(478600001)(9786002)(8936002)(83380400001)(38100700002)(86362001)(8676002)(5660300002)(7416002)(4326008)(66946007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4668C+mMB/GSGBx2Op/LyjMn0yWxu6ae6SEfv+tyX++o6c6pp5IZZVyh1Yay?=
 =?us-ascii?Q?ThMSstglxJW+eKHKPiN2mOZWZHNAj/xETqCjDHt2FxdOZ8nfoeKTZgUHoi1V?=
 =?us-ascii?Q?SJZKBJ+qpsBjr1yquUNLds6Kt/lYaD5hlYGDITtJj60kv4wcJ5EMcIxVPUVE?=
 =?us-ascii?Q?rXothW/PNIEvtzwmIMK872wKTyRrVPcX/C+0dX5f6vpDK2tnrN4W7wJssTx9?=
 =?us-ascii?Q?WgRZqdr44ozqAOQAQWuDWdkgkJcKrnA76O4vkUI+s276rm5CYzTt/kfcNtHn?=
 =?us-ascii?Q?vpezTdQhJA6sJ0UMd2YdpT96Q6/rVt8eYxV3RG8J7Mlzu4XGtYIuu3LHQwPK?=
 =?us-ascii?Q?EiyEUbF5y1UbZzqxVQpKmBZVBFUIY+iH0SDAoZuXf6B+YXTz35i/ulMmmMA0?=
 =?us-ascii?Q?0MCtV5ooTvI/MJDFBFfptPB+8cpieLCcWR2bIM19mnuhPuNdmVbiiknYa5dg?=
 =?us-ascii?Q?tcb/dKunBXQs6j+T4b8q9yzAhTXRrz4vGfUHDPJh8Hh1+860a+ILIqx+2fjx?=
 =?us-ascii?Q?HoMhtMVBYc/99qmRIAOZyzJxCe5ZGz6hIuSDbi1kDymzEoNkgC677L6Xlv46?=
 =?us-ascii?Q?4GRvBcCGAAeoOidZNBz6mL2CrPt1eJE4BhxPGucmYyPA1NG/b6WD2qoMjSuE?=
 =?us-ascii?Q?SVmk9bCMOuv1E/H9yOeeuIgYek1ZMdnN936bdK8wqCsT/rPnChi0vCkljY40?=
 =?us-ascii?Q?wJ+2s3iMZPW82yYux6oKF3Ai+iIhEwaBmUvwGWim+Fy6FLAGZP4DYe6og7sp?=
 =?us-ascii?Q?OgxEh03/dpYqImDTSJzHnXRGgKcZZRN4mzp0cUbVaJ868KZM7bDci83H1hge?=
 =?us-ascii?Q?S9nBJgnt5ePsd2j1ERoTRnNIDCkwi63/pab3Rcg/mVZjhTSeoAGrigpBOfkq?=
 =?us-ascii?Q?vvwSi8t/vpk9uv/3vglf8wysL2kWV/uHlrGLxtbyuXlY1nQS9rAUPvCRvYmS?=
 =?us-ascii?Q?WDu0RPLaFInzdWqvB1fj+1yT7tQNXQHZLGlWSdbUvKau1YQB5/ENtSjg4sXo?=
 =?us-ascii?Q?IFdSFyulfgQXAH3Kt2aXCNDnOp+LTCkMRf8TQuLpADn1XY0Q2/jHJRW0Jjnk?=
 =?us-ascii?Q?cFoZWvMa0J8e1VQ+bScDf5Hp0KwDCowPL9ylzPMJ3fnoH4NFG2PfrokKOo3A?=
 =?us-ascii?Q?wNY9RFQBq8E7G253N/aufIHiKHhk/OH/xoR5PYeSUih3wdo81b6jhgk6D+Wi?=
 =?us-ascii?Q?zkVy0n8I5GiAazJ5qymkiQcaUthRVvbiTWGYpR4m0xD6FESXYofqEuACIeYe?=
 =?us-ascii?Q?NEMk4SuV0ZLi9r/yE9QyHvKumCoTOTgzXso36xnx6kbJWqxfNHsvRcUrGUc6?=
 =?us-ascii?Q?5SkJQEIsaQ9VqtO2E0wPZJow?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17b8c4c-bd39-4092-1806-08d908ede983
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 20:00:17.1567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yVSitDYXtdMgF8tlUDHEN2jM1cKvm0Y606CkejsWT49Zi2ZHdOvYsLqtVih7d/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3740
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
index e76cdfc50e257d..5708abcc55c4df 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -147,14 +147,14 @@ config SAMPLE_UHID
 
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
@@ -171,7 +171,7 @@ config SAMPLE_VFIO_MDEV_MDPY_FB
 
 config SAMPLE_VFIO_MDEV_MBOCHS
 	tristate "Build VFIO mdpy example mediated device sample code -- loadable modules only"
-	depends on VFIO_MDEV_DEVICE && m
+	depends on VFIO_MDEV && m
 	select DMA_SHARED_BUFFER
 	help
 	  Build a virtual display sample driver for use as a VFIO
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
