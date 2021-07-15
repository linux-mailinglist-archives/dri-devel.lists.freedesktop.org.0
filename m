Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD23C94F4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A419E6E4F9;
	Thu, 15 Jul 2021 00:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AD76E4EC;
 Thu, 15 Jul 2021 00:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMYgFfXEsJAkdfVlwczHXtNYmLVRVUKObyk7FVzuhuGJtJr6nIzlxWsX1n886oyPRCDbfkImGBVAciDCYzdV5UjX3I4JOlX2MbatSZJ2JwNTQ9tBHdmgPCeGEgQU7GHm4IEBlFZ1DeDO6bwJ2TAPPsg1856mBP6YNHav7nBpiTiRW40ba1hvGu1lDgpPHPu6nNWQwRLxnluphVU37HTvh4uyVwiglVWL6862SzxiG29Q/R1+8TURU6H7BKDuOv4b/Mv2ex8DcGfFI0KuvlvTxjZTy9oFw3VIVb/9mRSIcCWMQWpCz19j+atGQIIGXnoMYU4CIkGnQesrzaH64a0A3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y58XH6B5leRrAkCjhNRFq2+KjJytKzlisU2xTX3BnkE=;
 b=BXfK2rTqpBfruWUAsyxbU4y+Ai7Y8ZUhADCgE+3D0DWV3lWBwxSXjIDMp0kkA2KVaPYbxRhIURjFFFS3qiuRJzrO+SQOW/8NqcQHjhtC2WY3pPAtTD/B31Wf73liTMT6pfALLrm6jrZPsHRGZrZzZE64gDDvnzZz1MnCjEYKpHu4JaMWxnJZFkiFo7gvYoR7O6AXMb9UuXeoaHIrW1OVBoOuI852xyJj1XwDgxUt3b7lk6bYk44BkYxy1NOjua+i8HZVim+5TPcUDf3L1GLZIHEu8dt3UdK0H0us/SvcdfqHfAS7g5W5YviG+8qyf9Kn03QEPHwTo78UtOGHQqkYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y58XH6B5leRrAkCjhNRFq2+KjJytKzlisU2xTX3BnkE=;
 b=ZpCEBQAlbFFro3CypyAMDxJnVrJS8kdgQoRlqsI/CMsOapQPR9nJThNdZkJbsUddCEoOdPKuzIEvAgX3RWt7rwNTp4RQmpK+IpPHWMtH0YtTXfatqkSPs3Lwqai00GxKDSByzXJ6drveVO/2Z/41aDavL+GRsLgyXU6K0Lgs6RXv/NJRVrWyHAmHBVTB+2ghzv0X9bz0sLTk8xtdKt+7iEBWCdibOXI+lHxZEqd2Y4O1EU++mIgJaOgqWWkuM57M4yyuFfFuNj822GT1M6/1Km6YICS1vnF1LSwJxa5i0Bz1VRltRjeljH+b9aASj5SXnSKAzflriPE8mBiAu/+DhQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5334.namprd12.prod.outlook.com (2603:10b6:208:31d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 15 Jul
 2021 00:20:45 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:45 +0000
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
Subject: [PATCH 02/13] vfio: Introduce a vfio_uninit_group_dev() API call
Date: Wed, 14 Jul 2021 21:20:31 -0300
Message-Id: <2-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:610:b0::16) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:610:b0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002UxB-D3; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22e0e1ef-1338-4453-a23c-08d947266270
X-MS-TrafficTypeDiagnostic: BL1PR12MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5334978E371A07CD172BF64CC2129@BL1PR12MB5334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9DkRUMfSB1QSDw1iwlrvHNaBMWUX8GsXCgfAKBd0KFZjGgn4o01OD1y5MB3ruO8x3/+bUNOXrxGRGiL0iYTmLGP9cUIVLrgkJsEHn3DIbxzKoEelX0v8impL29vhg1n6w1PQ2bQJ5lyRW5HsGyQd3Pw32tpQDsk7V5u+mqE4+c10YHskIXpvIu87QpRKt8Gstd3Wgna3R3kU1b2+E94QMhwwriCAHLe6VfjTpTenJhbiIeAtLlixhK5n553yvJqBMkuuZZXeSx5uYEt+zLiYL1X+qpSSjBxPVbeYgqhkC5vE11Oi68nlcWm1NUOpmJnn3LBx+7Im2cPaOAc0C9MY6hmZMiChmEImCQ0c3E8uBElMtP6B7Fip10Hkq2o+Xq1y9R03U0OS98y6vUWWiQKSm6uuw3AYpEByUlygFkpUkwDIPKkGN044bmo/9ZG8rdMdPticFJLhcI++5ov19xVPhHV9ltWvIuH1XDWcGBcZrFvC8EBak9ceRQ4YHICVYod4V6q/4iZBcoYOzAJDFaWz0AFOoDBkYSbL9LIWTZdV3puQbsRCdPHuhqibACpvhPyRTfAaxy85+BYlInBaqHEJ8q27oLveg9A6RPU3LSWwHj0p8mW8oGOdfZ15SO66RFlrxAugYYR7c97mrP5uMXaCabaKWemY1JktEm3v8IoFwbxLg6w6mzWJiWBQTbBqFei3Q5e/h6ZWGPnXzrESlv6Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(107886003)(86362001)(66556008)(66476007)(54906003)(5660300002)(36756003)(2906002)(26005)(6666004)(4326008)(7416002)(9746002)(426003)(9786002)(186003)(66946007)(110136005)(2616005)(316002)(7406005)(30864003)(83380400001)(8936002)(38100700002)(921005)(8676002)(478600001)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9JuEFhVJoEQwN+i9GfSrmB9x1bjmTes4ESFW8chuF9eyi2N0LhtxrGPylEXz?=
 =?us-ascii?Q?h1DWVjImhpKmuapSjlU+W/65zlCu4VIS23Mi1ILNIu20DOeqOVhVcILUx9kv?=
 =?us-ascii?Q?0Mx+TezK4FAmotf4lKpRyF13yfnmocgleKLLjVE+qc7J7uzc8UdKPFatMkb0?=
 =?us-ascii?Q?QIMWyo5xXRsjOSI1CDafpL98eD++TfnxDm/9d6J61xIBPyXp+D0C4ik6Wy3Q?=
 =?us-ascii?Q?T4+NQhI/TUf60Kipb4+3Ub26+FfDnirUmwAN5SbiW36j+seoY5cFG+OI234p?=
 =?us-ascii?Q?NC308L1BCDy6UbrBQ+sePJCRawqQSakrLMp0BWjRB0HTrdISgL0ONaxsp7z0?=
 =?us-ascii?Q?eqIyOzHmzBBqFhGwqde/KqwkqyYVvchzss1bXL5pmduAWUGy1EKrTOlek/ZP?=
 =?us-ascii?Q?NVF5rq8VzvBNxUTLD5Z3+qJZi+Q79w6YsxJLCwgOw41oiAL1eHR8q16hBzeJ?=
 =?us-ascii?Q?F0TKFAC7wXWh4cUg6M5Zx6NmKxAB61iHzkqW8nK89gyjRIC3vZjOUDqf/fRL?=
 =?us-ascii?Q?w7WcOt88qT/yTX3W9MXwCtWFVF9svxmj4PvqV1OdLLMfpKk0N1Ihql8ZPlKI?=
 =?us-ascii?Q?/n0g63py1tpo42XN0hUNzo9HI2o3oMuN6lGvxTKIsj9+b8P0AKofurE6pff6?=
 =?us-ascii?Q?UETZeXBr4nJp47+3eszj01nRGqFhBZgQZ1dmKSHE43FCMmIBXU8ZRrkYr316?=
 =?us-ascii?Q?qXTrXm+FesTe8BSwAqaFDbJwRmYK30pI91PlC+dGicd51uy4HtymdpTdgzwH?=
 =?us-ascii?Q?sYi9phDKEvL7GAHAwg+eeQwFxl9D8zhftjTwpt/70MGmdpOCE3xHTjHmz45F?=
 =?us-ascii?Q?jPFD+vnwcgU61hEV+YaLmA/ogzWSx0+9CmtNzN8WjeAF9abNgu7riqQuRbj3?=
 =?us-ascii?Q?yj+BysqTRob0kzLjVuU7u8MKYqBPFOGM/x5tJgHT55sfayGA/kSr5FjJlMoM?=
 =?us-ascii?Q?0ZHB4Nh2XXAHlHAOevqCCvm0Hk/P4fbjvEkk6BDyO8CE9QUZyv58qHNJu4/a?=
 =?us-ascii?Q?31TtiHS1ik7L+FBNqgBppQ0A1YxfT5FDTmbIPvzprYLOJQnvhdBaH+KJSlT9?=
 =?us-ascii?Q?XWnFHu1vDIjzjmkyi5xfqUU2UaKXD95RLpJkAowGXa9buGitUo7WYLpqCMPc?=
 =?us-ascii?Q?ZbzY0B83MqLkzhMzKA5Az7Bk1+RGXT0F4gPU9875CXquRe8zMq/0jn7J2RGz?=
 =?us-ascii?Q?DrJokNiX+I0HxLDVbQt5gnIKo1zcDQQswDoGuHxOgaSUTUvS+L2sG9dPqL3d?=
 =?us-ascii?Q?5ooTSXIlSCPIZGqN20LgmDSYdzLjX9SgYe+zrQfPkYwZf4kJXI0GEKv8jlA+?=
 =?us-ascii?Q?Jxp9h+Y+8ixMOH47076Wi/Sy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e0e1ef-1338-4453-a23c-08d947266270
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:43.8470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLTwS4qFIwZiccw7ozzZc71ts8FCDo/PmoR6KGucvZextIEDsQcsHuA31UWGEiSb
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

From: Max Gurtovoy <mgurtovoy@nvidia.com>

This pairs with vfio_init_group_dev() and allows undoing any state that is
stored in the vfio_device unrelated to registration. Add appropriately
placed calls to all the drivers.

The following patch will use this to add pre-registration state for the
device set.

Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 Documentation/driver-api/vfio.rst            |  4 ++-
 drivers/vfio/fsl-mc/vfio_fsl_mc.c            |  6 +++--
 drivers/vfio/mdev/vfio_mdev.c                | 13 +++++++---
 drivers/vfio/pci/vfio_pci.c                  |  6 +++--
 drivers/vfio/platform/vfio_platform_common.c |  7 +++--
 drivers/vfio/vfio.c                          |  5 ++++
 include/linux/vfio.h                         |  1 +
 samples/vfio-mdev/mbochs.c                   |  2 ++
 samples/vfio-mdev/mdpy.c                     | 25 ++++++++++--------
 samples/vfio-mdev/mtty.c                     | 27 ++++++++++++--------
 10 files changed, 64 insertions(+), 32 deletions(-)

diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
index 606eed8823ceab..c663b6f978255b 100644
--- a/Documentation/driver-api/vfio.rst
+++ b/Documentation/driver-api/vfio.rst
@@ -255,11 +255,13 @@ vfio_unregister_group_dev() respectively::
 	void vfio_init_group_dev(struct vfio_device *device,
 				struct device *dev,
 				const struct vfio_device_ops *ops);
+	void vfio_uninit_group_dev(struct vfio_device *device);
 	int vfio_register_group_dev(struct vfio_device *device);
 	void vfio_unregister_group_dev(struct vfio_device *device);
 
 The driver should embed the vfio_device in its own structure and call
-vfio_init_group_dev() to pre-configure it before going to registration.
+vfio_init_group_dev() to pre-configure it before going to registration
+and call vfio_uninit_group_dev() after completing the un-registration.
 vfio_register_group_dev() indicates to the core to begin tracking the
 iommu_group of the specified dev and register the dev as owned by a VFIO bus
 driver. Once vfio_register_group_dev() returns it is possible for userspace to
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 90cad109583b80..3d2be06e1bc146 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -627,7 +627,7 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 
 	ret = vfio_fsl_mc_reflck_attach(vdev);
 	if (ret)
-		goto out_kfree;
+		goto out_uninit;
 
 	ret = vfio_fsl_mc_init_device(vdev);
 	if (ret)
@@ -657,7 +657,8 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vfio_fsl_uninit_device(vdev);
 out_reflck:
 	vfio_fsl_mc_reflck_put(vdev->reflck);
-out_kfree:
+out_uninit:
+	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
 out_group_put:
 	vfio_iommu_group_put(group, dev);
@@ -674,6 +675,7 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
 
 	dprc_remove_devices(mc_dev, NULL, 0);
 	vfio_fsl_uninit_device(vdev);
+	vfio_uninit_group_dev(&vdev->vdev);
 	vfio_fsl_mc_reflck_put(vdev->reflck);
 
 	kfree(vdev);
diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index 39ef7489fe4719..a5c77ccb24f70a 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -120,12 +120,16 @@ static int vfio_mdev_probe(struct mdev_device *mdev)
 
 	vfio_init_group_dev(vdev, &mdev->dev, &vfio_mdev_dev_ops);
 	ret = vfio_register_group_dev(vdev);
-	if (ret) {
-		kfree(vdev);
-		return ret;
-	}
+	if (ret)
+		goto out_uninit;
+
 	dev_set_drvdata(&mdev->dev, vdev);
 	return 0;
+
+out_uninit:
+	vfio_uninit_group_dev(vdev);
+	kfree(vdev);
+	return ret;
 }
 
 static void vfio_mdev_remove(struct mdev_device *mdev)
@@ -133,6 +137,7 @@ static void vfio_mdev_remove(struct mdev_device *mdev)
 	struct vfio_device *vdev = dev_get_drvdata(&mdev->dev);
 
 	vfio_unregister_group_dev(vdev);
+	vfio_uninit_group_dev(vdev);
 	kfree(vdev);
 }
 
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 318864d5283782..fab3715d60d4ba 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -2022,7 +2022,7 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	ret = vfio_pci_reflck_attach(vdev);
 	if (ret)
-		goto out_free;
+		goto out_uninit;
 	ret = vfio_pci_vf_init(vdev);
 	if (ret)
 		goto out_reflck;
@@ -2059,7 +2059,8 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	vfio_pci_vf_uninit(vdev);
 out_reflck:
 	vfio_pci_reflck_put(vdev->reflck);
-out_free:
+out_uninit:
+	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev->pm_save);
 	kfree(vdev);
 out_group_put:
@@ -2077,6 +2078,7 @@ static void vfio_pci_remove(struct pci_dev *pdev)
 
 	vfio_pci_vf_uninit(vdev);
 	vfio_pci_reflck_put(vdev->reflck);
+	vfio_uninit_group_dev(&vdev->vdev);
 	vfio_pci_vga_uninit(vdev);
 
 	vfio_iommu_group_put(pdev->dev.iommu_group, &pdev->dev);
diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index 703164df7637db..bdde8605178cd2 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -667,7 +667,7 @@ int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 		ret = vfio_platform_of_probe(vdev, dev);
 
 	if (ret)
-		return ret;
+		goto out_uninit;
 
 	vdev->device = dev;
 
@@ -675,7 +675,7 @@ int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 	if (ret && vdev->reset_required) {
 		dev_err(dev, "No reset function found for device %s\n",
 			vdev->name);
-		return ret;
+		goto out_uninit;
 	}
 
 	group = vfio_iommu_group_get(dev);
@@ -698,6 +698,8 @@ int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 	vfio_iommu_group_put(group, dev);
 put_reset:
 	vfio_platform_put_reset(vdev);
+out_uninit:
+	vfio_uninit_group_dev(&vdev->vdev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vfio_platform_probe_common);
@@ -708,6 +710,7 @@ void vfio_platform_remove_common(struct vfio_platform_device *vdev)
 
 	pm_runtime_disable(vdev->device);
 	vfio_platform_put_reset(vdev);
+	vfio_uninit_group_dev(&vdev->vdev);
 	vfio_iommu_group_put(vdev->vdev.dev->iommu_group, vdev->vdev.dev);
 }
 EXPORT_SYMBOL_GPL(vfio_platform_remove_common);
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 02cc51ce6891a9..cc375df0fd5dda 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -749,6 +749,11 @@ void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(vfio_init_group_dev);
 
+void vfio_uninit_group_dev(struct vfio_device *device)
+{
+}
+EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
+
 int vfio_register_group_dev(struct vfio_device *device)
 {
 	struct vfio_device *existing_device;
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index a2c5b30e1763ba..b0875cf8e496bb 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -61,6 +61,7 @@ extern void vfio_iommu_group_put(struct iommu_group *group, struct device *dev);
 
 void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
 			 const struct vfio_device_ops *ops);
+void vfio_uninit_group_dev(struct vfio_device *device);
 int vfio_register_group_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
 extern struct vfio_device *vfio_device_get_from_dev(struct device *dev);
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index e81b875b4d87b4..cf264d0bf11053 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -558,6 +558,7 @@ static int mbochs_probe(struct mdev_device *mdev)
 	return 0;
 
 err_mem:
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
 	return ret;
@@ -571,6 +572,7 @@ static void mbochs_remove(struct mdev_device *mdev)
 	vfio_unregister_group_dev(&mdev_state->vdev);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state);
 }
 
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index a7d4ed28d66411..57334034cde6dd 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -235,17 +235,16 @@ static int mdpy_probe(struct mdev_device *mdev)
 
 	mdev_state->vconfig = kzalloc(MDPY_CONFIG_SPACE_SIZE, GFP_KERNEL);
 	if (mdev_state->vconfig == NULL) {
-		kfree(mdev_state);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_state;
 	}
 
 	fbsize = roundup_pow_of_two(type->width * type->height * type->bytepp);
 
 	mdev_state->memblk = vmalloc_user(fbsize);
 	if (!mdev_state->memblk) {
-		kfree(mdev_state->vconfig);
-		kfree(mdev_state);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_vconfig;
 	}
 	dev_info(dev, "%s: %s (%dx%d)\n", __func__, type->name, type->width,
 		 type->height);
@@ -260,13 +259,18 @@ static int mdpy_probe(struct mdev_device *mdev)
 	mdpy_count++;
 
 	ret = vfio_register_group_dev(&mdev_state->vdev);
-	if (ret) {
-		kfree(mdev_state->vconfig);
-		kfree(mdev_state);
-		return ret;
-	}
+	if (ret)
+		goto err_mem;
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
+err_mem:
+	vfree(mdev_state->memblk);
+err_vconfig:
+	kfree(mdev_state->vconfig);
+err_state:
+	vfio_uninit_group_dev(&mdev_state->vdev);
+	kfree(mdev_state);
+	return ret;
 }
 
 static void mdpy_remove(struct mdev_device *mdev)
@@ -278,6 +282,7 @@ static void mdpy_remove(struct mdev_device *mdev)
 	vfio_unregister_group_dev(&mdev_state->vdev);
 	vfree(mdev_state->memblk);
 	kfree(mdev_state->vconfig);
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state);
 
 	mdpy_count--;
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 8b26fecc4afedd..37cc9067e1601d 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -718,8 +718,8 @@ static int mtty_probe(struct mdev_device *mdev)
 
 	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
 	if (mdev_state == NULL) {
-		atomic_add(nr_ports, &mdev_avail_ports);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_nr_ports;
 	}
 
 	vfio_init_group_dev(&mdev_state->vdev, &mdev->dev, &mtty_dev_ops);
@@ -732,9 +732,8 @@ static int mtty_probe(struct mdev_device *mdev)
 	mdev_state->vconfig = kzalloc(MTTY_CONFIG_SPACE_SIZE, GFP_KERNEL);
 
 	if (mdev_state->vconfig == NULL) {
-		kfree(mdev_state);
-		atomic_add(nr_ports, &mdev_avail_ports);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_state;
 	}
 
 	mutex_init(&mdev_state->ops_lock);
@@ -743,14 +742,19 @@ static int mtty_probe(struct mdev_device *mdev)
 	mtty_create_config_space(mdev_state);
 
 	ret = vfio_register_group_dev(&mdev_state->vdev);
-	if (ret) {
-		kfree(mdev_state);
-		atomic_add(nr_ports, &mdev_avail_ports);
-		return ret;
-	}
-
+	if (ret)
+		goto err_vconfig;
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
+
+err_vconfig:
+	kfree(mdev_state->vconfig);
+err_state:
+	vfio_uninit_group_dev(&mdev_state->vdev);
+	kfree(mdev_state);
+err_nr_ports:
+	atomic_add(nr_ports, &mdev_avail_ports);
+	return ret;
 }
 
 static void mtty_remove(struct mdev_device *mdev)
@@ -761,6 +765,7 @@ static void mtty_remove(struct mdev_device *mdev)
 	vfio_unregister_group_dev(&mdev_state->vdev);
 
 	kfree(mdev_state->vconfig);
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state);
 	atomic_add(nr_ports, &mdev_avail_ports);
 }
-- 
2.32.0

