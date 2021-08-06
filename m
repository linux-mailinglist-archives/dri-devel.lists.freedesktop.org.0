Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA23E20CE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C514E6E939;
	Fri,  6 Aug 2021 01:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B816E8FB;
 Fri,  6 Aug 2021 01:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpIOlvVMFpjBMW0VVVbzd8T4jmvNOJmks41srkCctIdhTeOav0cHf3qvZ3w4+a6fWDb8tqI/AO9OcK1TOLDgRpoFpxhuxQb2KX7VqzvRAoM3ZflN+Ud7RwwYEk4ckKljeUruw8d5vtTfPorkOFQVrGNjljraTRY7TWcZuP2w7IHthnValV+g3j7ZtNiaJJhoX7TLCVDXGGeGQRqFgIxhe2KJAOnJyzRtfoQsbR7oi5C7S/2wZr6HCRoq5PhHFshb8Mr3ULPea1fatJNAmF15BRFHwgrhFne/VVRwGsSPVLy1M1YA3VL1xwW/eq0HqGSjRxUoFURDioaPlbPDCDa/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9VkjiCcaDZYPVjpiFHeihzof2FpYosLbGiYZw2RpHs=;
 b=PNfAR2w5Bs9OmZP0UdGhQjsg7BuzxILWJ5GtPLUUah19qXSyP7YY/RQp92ElR2WxFks3nw1YSDPzK6FgUsKtKcHbhIyhS62ksINaWY3+TTpa8sfuQW/JNp1sZKoKpO6g69id7q8QqxrrxbIq6y7G8ThxLSmzV2sS3bpfR6C3x8ps8Tqtz76UQdjRUUCCqDkL1mTDqUwEt+T97gQy2OZjp11IB5Im6WXoEvzT9VS2u0bHIFKoctgs29vImfi8GG6z+MXJB9+VgWKhKcDSoHGebAvpK2Qka0cCPH3i7oagPRQ9tKzkGgsxLjOTf020VX3Lp3baFH+Ig3uwSMdP1MuSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9VkjiCcaDZYPVjpiFHeihzof2FpYosLbGiYZw2RpHs=;
 b=JnVPCkhHOvTbGeZZRDXDZgXMBWv36BCbMZtbJ6WJpElbD8NRQ7jQcfW/ceQN/MDXVOTnd7giP09+Gxl2CAJDYaJVsOJcb3uhRMOXn9Xs/kbcBAjrOdETmhSnDGDXSPjYwFeubaXBdQws0YUrYQXSjYPaz1/O5JI657UZ8umSI/IO/iBlb1AoLFZBb2uK92P4p+qaGBkvRGLnLkZm0hBQu0wDG2KqVqgztUQqB7mJy8nte2IdYUijiiJ0BqQaXoadaifD4brrPMaGQTfHW8ZmMDBxJ9nMCCx4x1aVYAJ+cUiKHG9YlTnjd4x9IjwPH1HjvFuScG+WM+t5H0rY54Z1VA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:14 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:14 +0000
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
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v4 03/14] vfio: Introduce a vfio_uninit_group_dev() API call
Date: Thu,  5 Aug 2021 22:18:59 -0300
Message-Id: <3-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:208:32a::18) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0103.namprd03.prod.outlook.com (2603:10b6:208:32a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 01:19:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt6z-1d; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2389838c-b762-4258-b777-08d958783346
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52069C6309CC16F4B8E274A9C2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gy484B/gqEMdzdAyyhxe6hr7BCCoe4Tj9lsCZIZYJlks81DhpYHhUgnL0rSH4cfJ4a0e155Te5iyvzozoTKXrPLACfDPEw4H2cCfmUdQ33pT2YaMzqBJg3Wez6Y67qVhvXkXeN4iWqp/1uH7B8bS3rX6sNoE5HBEt39Afk0bQXLAShAtX7rQHaUkpsJIxXgmmr4D5l4Gzwe5N79zbfgJWCMGj3uh0cTzS3X7R/p+O3pnCQ5s3DGjofajy+fxG2soZAJ44DzfaaZrZzYdJpzIaqoDRHOSELpxruNbhUHRZy2DIq0P8S0Cq+4KeRLndraEd+wXUNt58aoKygrcj7TWA0wQ0Bvz0rqRnNJ+GGLynqKxgSBv7YYR66IREZG99qpmSgurjQWM2HZsQzQXKQyXTo249IUvOhv535xhCXMRdXyeNSS7ywjmURMr3GPa8S3iDkzqq+jnKksmhn8puM/8S+WeNcCaz1CuwTx1Uu05bO0/YMMXtBEC/zyHIZXp6Q9vdp0rEW89/YGEGooCE3sx2Dsgi+tS7TXYSAekz6r6BjP15ZEFKXOgeRJ7Q46JwSuamEl2bJnF4EnTcoOoWkJp6DLuLIjEkBrLmp6lvkpasvOb/3OD4YqWT1I/hQLtYi6BevAHQl7HjroUhZEWLcYKBtn4AedkVwbzBBfj/OStREQq5WY5YkNlploUEEMDtyVBox5nXEsStAq5T4wSeeRcIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(30864003)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OCBUMJcMW0tVmqH7ImiuZG8xDohQxipi9y5pFdnaIpVoJHTDJTra55M0MT8L?=
 =?us-ascii?Q?idvxC9QEqza0gOoBRy8qL3Wnyq8+RtaGQU109wV927vWpPGIAchtIkHSLuY+?=
 =?us-ascii?Q?xVeC93PrZXgpLyhvwdETeRXwYR7si1l/3K8b2ZzSvifoI0DQL7/P28dSchij?=
 =?us-ascii?Q?8g0P+QJDiZIFXXmJ3YIpZu4toc/BbOznJKxm56in6fRX/+ZIZWj+ZW46HTQh?=
 =?us-ascii?Q?fgoGoDw6lLRrLhjXxh81inMLTWeci+uFtOdUx1lEJR4nkFZuabJVeqf0nqYt?=
 =?us-ascii?Q?VSNMgPUGNax/S/Cze3HytPfJXIViTBD+xrSXTatM/0M5ZVpVjrOEQuQV/+n1?=
 =?us-ascii?Q?QarrYdLKy9i01A7OuEHn2VUv0yk7tcIA+6X8isJOAtXq8yPuH90CzpDlsLDJ?=
 =?us-ascii?Q?DqXwi+gkGfwlJUszd4tDl+Fnp0qEATssKD+Hk5O7BUXa9lfl5FHr2bQhPP2h?=
 =?us-ascii?Q?w01VSOp4pi7rV455H7cs31gM05W6mGqWoAwautwdfkW7pfq2H5AoBr7T7N3z?=
 =?us-ascii?Q?iCRjiITLUiS6hB5EzxCG4tyRJLMP1oBV/Zo0VV2WoB1yD4ZCrkuYmNIKDHGA?=
 =?us-ascii?Q?p+TZCXwpbpKTCm8S7IJTTEXdhsufbRNFUxuNF/rJYuQt4mSAjkC4rG4Cfy1f?=
 =?us-ascii?Q?JDAwKUKwq4ifn11T54uxUX8/iwOhyXgPjRF4gUxQ+wG84oyQou/G3ckxzrE1?=
 =?us-ascii?Q?FYJIxdxzZgG66ermZiBN0Pqe64A6VnxdcHGigqt0YhU+ktcdqybAguGEL4pa?=
 =?us-ascii?Q?CTUEuGL2vs4vgoKfZLlwd5OFAOsfBt13ytrCCLfWi8B+Rv3h5DyXyE9SjAwj?=
 =?us-ascii?Q?ja1/erv2rn6J3KIJWazppVrfDdT+jQFRcQpO3VWfi/CWcyPzvIHeobjgvnE/?=
 =?us-ascii?Q?V9IUS9IoDL0BEZPQzu2hhhFzub+F2F3dZQzCsqgKewiY1yTdZpe6E5qrk8mp?=
 =?us-ascii?Q?UOSXfVQmhdIdc+Lh96nPrce2+nGYKPDNgZqu2njSV4T0Y+PysKkj0mtt3I5o?=
 =?us-ascii?Q?8fe7ht16t7OoShUBok3BgHb38RTH19ZZ35rzGkTobMQ0pJXCvYCLE8Lypeiz?=
 =?us-ascii?Q?Ri7b4BfcckerNFbhnq793DrHxB0oy2HVtAD+3LD0dMv6emIdPbrfkv3GT+xu?=
 =?us-ascii?Q?bRfPrySLoGYhq4I+VGlEJkM2OUaX3YhaWZHEGHBv8sjmequcoNv2tmCEVvXI?=
 =?us-ascii?Q?+BJebnyjlQuo+yxYgf7StYZHxBgh4tNctX4o5QCa5ytHbu9gYf9ZooOTq9/1?=
 =?us-ascii?Q?QQ72Qjsrk+nnIcW8+/MEGKlKya5zCs/f/gJZmJg2IjjZrkMoKU9PBSePQm1z?=
 =?us-ascii?Q?behxiDB2sLhSimICIrNas6IW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2389838c-b762-4258-b777-08d958783346
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:13.0771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLQQnTb1Az8mzrv88R9gJMPuhkvUKyU3bGI+qb/PA9+UkqJdWrEnLFeT/DFZvlkx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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

From: Max Gurtovoy <mgurtovoy@nvidia.com>

This pairs with vfio_init_group_dev() and allows undoing any state that is
stored in the vfio_device unrelated to registration. Add appropriately
placed calls to all the drivers.

The following patch will use this to add pre-registration state for the
device set.

Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
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
index 3e885be7d076ad..0f1511849b7c3c 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -559,6 +559,7 @@ static int mbochs_probe(struct mdev_device *mdev)
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
 err_mem:
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
@@ -572,6 +573,7 @@ static void mbochs_remove(struct mdev_device *mdev)
 	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
 
 	vfio_unregister_group_dev(&mdev_state->vdev);
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
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

