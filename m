Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7493D0096
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E5F6E503;
	Tue, 20 Jul 2021 17:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFE26E4BA;
 Tue, 20 Jul 2021 17:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeMFacNfdA2ucd0+e1LAWCBUJnVd+O3Jxjs4K0svunHDh1otUQ6/HegL07z+4GTM6RDX08+FdOmFCO2UxxTSU/SOTjiBqWso4TeQ4m3oaaSVSgCMefy9M/UrsJbadmZPp0M6TcBSdzKlfp0dEz+yDhcF+obGBPYIHOAANw+V9wD6xYXcrHEvYA3ODUzmvzGcAsPVf5hG0VVhQFIZY3bZYZvNWCkDRfy0yJF7LdRFPBcy/BAKCHlmz+gXbFIDiBl7Ll/nFIHtEUPF2X3n1ovSYb6oL2bcFLZWNhy3XSWOmF5p8YdkYnDJxu2aFiR/ujGwYW+RWjCcIiDFPSzyoo/H8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AE8bje3xI5vscrN7ifPxIEPjenL15fcXNKHVbmaJqQU=;
 b=fTjd0MwMqOOJsh9MhfSELlXMIY+7sDsqWxh3qom/LuulgILpKmhPlZoWFyrxkk5pKqXyFd0fDzQbIhNhKQ967oP2hlb1M6PLkkktS7M0RVoAWtsT8ewcOY113EBlwk4VTOoDvvYS8dekiDHjdPfwJqjwBHmFBYsaF4OQDIQ/SZHwKlNOoTNXg0Q+mIrHqsz9Lh9TBAKQeapdjuDqyc20A3xxtezFLz+SXmNI0dfSnBswetWareEnT3tiUXoN7PXWOmTDLiAj0rKSqekhG6EksLGFYS9H/4Q6g/ljUH2ABhctURYkPJFW378XzbUE7Zo7eMt3s6IcSo5wpdfxuHGNPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AE8bje3xI5vscrN7ifPxIEPjenL15fcXNKHVbmaJqQU=;
 b=r7CLpnKa3xY7qSCqBe83Il0c1DzO9k7FGrpeg1zYnjbt/lR0spjxFeQKDRAaNhKQQpDyQ6S7eOv2uvnsfereS8HG5DPX2s/wOWfzZeeG7Nv02wySfC3w75b+0Lc3KeacA6CLBl7Z/OmapE+suLwyKOWy+D/iUsb18nAkpzmPPgwqStfSci1y0YnGFC+Q7+CcLP29Be2zIDD+mrNSPsBUnmca1sIKjXnaYlZPNcC1j2SsdXNvmR+ZXUH5LlhyvLLfC7ibuZMHqFOfBcEPnwfj/MhRpRyDZvxv55BHX7HR3DpKVVy8l2gOqZI6OzgWCyuXXkYO3I+Srihdm8qGfmazyA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:04 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:04 +0000
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
Subject: [PATCH v2 03/14] vfio: Introduce a vfio_uninit_group_dev() API call
Date: Tue, 20 Jul 2021 14:42:49 -0300
Message-Id: <3-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:208:fc::48) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR02CA0035.namprd02.prod.outlook.com (2603:10b6:208:fc::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 17:43:02 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051Eg-5M; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aab226e-440a-49a0-f159-08d94ba5d2de
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB528811000AC518CCECA1A50CC2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /tYlu2Fr3WNoQGdZxTd7yh38h9H6LOeheEV0n4s4RM6JIwidWnUf0pPvQAbyLyyP94E9qUnq5amU/MIddmpQRhNGCD7a4U7I8i619fi8WI4fQV0X4J/2atwy5fNDAPnuGkDwIC77K4Yt3WJNsHVXRnJ+RXdEk371R2m7k8vrjVfu+bA0VS34khqct1ZHgk1VTOXW/MhOXvBaZP8jT6JNzU0wWOH64IUHH6obJwuJlSqqqyKsVYgETwhUoMkSErDk9+txarOpIQySiC37WI0GmlWB0hBJLPtewlHpr/NKE/oPb5xpP3neIz4vOOf4r99xm4pjHRaLuvz5t9wYvBEdP7VOuwAxL/wQ0jF+1Y79mCa2ka7vvufOCAUTQglRvc63o7q9P5bYcsH4yv9HfrI7RHc7VF+gDaiXd+HswlPgOU5y303JOUFfukEG1Wb8r8vja1cvskuwt50SHHx/ILNW7gytCHzVW817/Q+L2mQL5Ed/+F0AzhgyROPKWbycP9m9ZX+o+gZuu5ngqjIDC5A7lMS/2vsysY8/Ee6O1FQLTEByhQYau/kv21pzd0KhkHa2/TGTjwTsXKCgYKDbTC+aH9oSuq73dIF80wiW1MVTNPRHcGCYs2bC0ZYXDjlt33MzM/tRdpyPhG80yAJCt2K3VChbUCShgi0oNepzmo+FzK/Hn4J/B3u6WXQkv9mZySSioYAVD1lHdyXjS+TYxH1nNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(30864003)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6XaWOktU5mm1U5nK2Zt8FFi7iRQuqBSLOYbAjZSwdGlakYE9DUeenZs4FFYV?=
 =?us-ascii?Q?gBTc/h+ktdPzyBOg3WrtYqqUNVY6WHLAh5wTOOp/OvFRzkA44gVlDpHqb/FM?=
 =?us-ascii?Q?uAOxc06KMSqoqy3WfVZC4JEeCs4T6ivZwnJi4oL5OVkH62ysCEWEMKlXZtqB?=
 =?us-ascii?Q?LB+LR0pyBNGuTdiix0aakGPwh92X6NwcQi/h0fPDO3ab7UCBoVVQ/ow6P9AO?=
 =?us-ascii?Q?MIqJbp+eu+x7eQXSAlyzvvfZ3rEhha1yg8CA8WnY+gnLXqtiTcutVwvNqT1S?=
 =?us-ascii?Q?7eg5UvNzdjz+uKi8aa7xqApGUnZF1g5qEljg+VqLiuMLOcI9D5+DvS0M8Jo+?=
 =?us-ascii?Q?4wz0+Zn9mzhCs7Kh+dvBjAyAw/zaj6Bw8/lNdYaZ/34P76GqVlXv18+kDENk?=
 =?us-ascii?Q?Il0JsW4sMDOF5QOU494u7onBWOQK+RJ1Y27Uyhi4tjt15TTrdbc15iq1NjmJ?=
 =?us-ascii?Q?F5d4n+BehSyl022ERuoA8w88m5b5IDV42bIENd/uW2//XPIo7QOLXndGifiu?=
 =?us-ascii?Q?ANdKT9f7YiDtPK+GSUXarvk34OwumNlA68ZzIsvlViucJ81/f30eOtWCkgYL?=
 =?us-ascii?Q?HYAWNDze2HSyc6eEFwHQN6yr1ukXtd69Sx5FqMsuc+uunwDR7MTqbQXoAVkS?=
 =?us-ascii?Q?vZICmJgpy1ljEzrCthW/i+u6x4LRWSfeOdVz5jFymccM5Mg8HAcfQkJhaTOK?=
 =?us-ascii?Q?7ejXPCoQbEkomUkJW4kOJLaQFYFX5BVBGNtR54T6ErvByUKtd1P9vRPCBSfR?=
 =?us-ascii?Q?4iU12X0K64+6RgotO9FDdCQX9zPj9airu6QVIyXnpK/DNZfEjFHjGRBAeJ8M?=
 =?us-ascii?Q?L44JdSUg3mWBNXZoFaeBDHjY9FXu1VLUvOr9zGjVurnyedzeKfYmZs9iAuRJ?=
 =?us-ascii?Q?az8GW8dGh33bRiYOfJ9vUNEJQjebOCwJPmeykkOpgEAdH8o35aZ58EJJVNRT?=
 =?us-ascii?Q?JYMeEkfV57X5lsY/HtzwxWB5NwigdpXZ+SiDYUO/BDreiuv+GSuEqbjvCDFx?=
 =?us-ascii?Q?Ef4HWjrooNjo6SyVW+iKS3x3GD0kSVD3W8NvLM9P/RRRMHKFAlJk1dvfKwJF?=
 =?us-ascii?Q?VvOSvPGdPHs2n9TE5nUze635qlfVhHKfT1cBnrRpEdhbpcpUxmdzsGNfsMbG?=
 =?us-ascii?Q?orwUoxMaw8cfK2RxIQwD7YsehzpKn42Ove9L8bF1S4F316MA9pLBOg8R9Thz?=
 =?us-ascii?Q?eD32O9mXMtRDQLRQ+1KxzbEQYS5EUvpLXbHzsakQTw0NbHRLT9QRevJXzTMF?=
 =?us-ascii?Q?uRKlqBQwAabTkBnRgdOgElLnRBdFLrGdufOPvYtg5MnFxFoB0jcA2wkZOjmr?=
 =?us-ascii?Q?bw1asEmdNoRcrc2mrcaeu6hv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aab226e-440a-49a0-f159-08d94ba5d2de
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:03.2135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OER6UE1s9paog5W/7YwJD3M8QR61HnPzOxa2izCKJuzkDFmXR9xgDg7EE72g/RgI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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
 drivers/vfio/fsl-mc/vfio_fsl_mc.c            |  7 ++---
 drivers/vfio/mdev/vfio_mdev.c                | 13 +++++++---
 drivers/vfio/pci/vfio_pci.c                  |  6 +++--
 drivers/vfio/platform/vfio_platform_common.c |  7 +++--
 drivers/vfio/vfio.c                          |  5 ++++
 include/linux/vfio.h                         |  1 +
 samples/vfio-mdev/mbochs.c                   |  2 ++
 samples/vfio-mdev/mdpy.c                     | 25 ++++++++++--------
 samples/vfio-mdev/mtty.c                     | 27 ++++++++++++--------
 10 files changed, 64 insertions(+), 33 deletions(-)

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
index 90cad109583b80..122997c61ba450 100644
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
@@ -675,7 +676,7 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
 	dprc_remove_devices(mc_dev, NULL, 0);
 	vfio_fsl_uninit_device(vdev);
 	vfio_fsl_mc_reflck_put(vdev->reflck);
-
+	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
 	vfio_iommu_group_put(mc_dev->dev.iommu_group, dev);
 
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
index 501845b08c0974..4ec4bc649351fc 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -560,6 +560,7 @@ static int mbochs_probe(struct mdev_device *mdev)
 err_bytes:
 	mbochs_used_mbytes -= mdev_state->type->mbytes;
 err_mem:
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
@@ -572,6 +573,7 @@ static void mbochs_remove(struct mdev_device *mdev)
 
 	vfio_unregister_group_dev(&mdev_state->vdev);
 	mbochs_used_mbytes -= mdev_state->type->mbytes;
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
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

