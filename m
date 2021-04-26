Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159CE36BA75
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 22:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3546E879;
	Mon, 26 Apr 2021 20:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAF66E878;
 Mon, 26 Apr 2021 20:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPscZ7EQvGneEggQ2HasOkMGjAA0vMPte632soH2cpRIcaVKs1xuKl8kuHOkLIboVRmvN0bLHchekXsHaJV8BLBdgSCWd5FhIqdqosW0Tp+pRKtxLDs18Rt4Vk9+fYcokledVHC4DxOc5CRZubelWIBxCUZK8qQyQ/EYkXnj/LF1/5oPIS8P4Dpixf5utQL3DTk38kcdrGbYJhuMDVNkumYzZstXT36nGnCcqg9/rFncNwB/5h69BlLqbW7LVG7MInISAM4hOva6P/GUxcJpQ9rXwVIOfZYeB/ksNmzh6tZrufjQiUp4goJqlJUHgpviAaI2VVS0e9cSkdex6qIqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFfUB8BG8cYSs1EqxrHJrhnYlnU3GiZG0sOZhyhDLqI=;
 b=F3xI0sh/gf3wF09ymw+5VVDj4WI0Cro24nNJCs8jSzF3PvyJR8wNgRXJCFcRujb0pT751hOA6UeiO6q5lGTLix9ds06OSyD3gtcMeh1DnIvcrd81tKZLqI2GGajhtMqWsloj3y+CHWrRhJCxwYzzterI3lTcTOasacX8kX1L34Fd/awF9msH6xJZsrgXf60qkfJFKZgs5S+z64DOsIvs69knFsnq/LGdTl5J31GIPjBl0Y1R9gkEQh7qVP13bc0z8cr+VSRAm0rbblovaY581N5jKAgdRV/hJSuNTBw/2LUaM/TUFWbh8LDI1k/TeOz/9dnIeFqikhRHUPzwoQrS1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFfUB8BG8cYSs1EqxrHJrhnYlnU3GiZG0sOZhyhDLqI=;
 b=m7t3fvkY+0/7V61ReSRHo1QgCI1RDytIJb0bgik7lLmBqZs3qIT+ChRUhE13LzKoOCxZe4+l5asdEHa/P/BxmqoMy1gQ0fqGVPudK8Lau4zd9fu0tAciy8mFPyAYziYRqtyY/By0O2b0f/IqZXZksAx4baMhlxPF+IK5YBMSRx1ggKfXuewe+x3xG1UDFLZmOlcuNJc1Ejx6u7087hFXmAWO4EotBQ4NGElnMUK/Eieq2pTw8Pilh1OG79PC8CoS8PLtOsUKRtRcevKo9nQtvFEkOk4Za7gGM+sQ5JIzPJevbXk9uVwbp4ZH+yh7wg7fiEWdhoeJfmHRPo0vhBJwtg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1659.namprd12.prod.outlook.com (2603:10b6:4:11::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 20:00:22 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 20:00:22 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 08/13] vfio/gvt: Convert to use vfio_register_group_dev()
Date: Mon, 26 Apr 2021 17:00:10 -0300
Message-Id: <8-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
In-Reply-To: <0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
References: 
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BLAPR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:32b::34) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BLAPR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:32b::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Mon, 26 Apr 2021 20:00:18 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lb7Oy-00DFZU-1m; Mon, 26 Apr 2021 17:00:16 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7298a0ce-64ea-457f-4503-08d908edeaa9
X-MS-TrafficTypeDiagnostic: DM5PR12MB1659:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1659C7AFC576F99CF6083EF6C2429@DM5PR12MB1659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WaYFvdvSy3rSl83Qu0hmoNj3U3Dr7afD79LfvF1s38TwjAVxM1hUQ5LQL/rQSPTtJ+uJ+UbdkjYIxLOt9EuytqeJz7Ubipx22et+ee18NL3kFQWXfBN/2sMjZxm764tt/f5mDOxjmWBhyreMcbOEWmrHIKqbyPjQCXVOArQT2HCAHyxbmdCDoL+wci6m/cr82vYr2J8QegdsrVCUjKzR+wXzpxV4uRA9H3pt/KM/ZnUF31iY3VKk/ecHbKHX/vY2aMqyZiwYkSc7Kc4xBgMI1fHhuz3K5dNYssgzQ9KYQKNmfWOmqpqrN3XY0jGwBWmMrN0io8yrF4HPJbyNVQE2209Ixut2Ur/C5P/amhfXdRsJ9CkR+lfjlXqeVMZndB+sUXHRmYsFjuXdnI0QlMDEDQB/yTeYXp3yuODyWwGJllL4ENmYZg2kUbIl2yjcsfRPAThgALf06SQorD33iwl/VWkDdf8oFUpqYFaQlzPBYZb0peI3H/EsB2dxQU2GCjcIg+TXoovYVYs5AgQjPxz9xZkzhjSucmkAi59H6HUERKVoLFntf1c0oHqkHwC2xTqG61nBcxHMLfS3u+RSi3twfJ/F77Q8lQGMCzzr4lhOO3leciueDsixywuMSjxSANe5a300WsEuE8B1SuUOrM3FZDnZc7YPX7YzZNwR6KMz+S4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(66946007)(36756003)(66556008)(66476007)(8676002)(2906002)(86362001)(6666004)(7416002)(2616005)(8936002)(478600001)(30864003)(426003)(83380400001)(5660300002)(4326008)(38100700002)(9786002)(107886003)(110136005)(9746002)(186003)(316002)(921005)(54906003)(26005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?al8cEkkLw+OL2PwHT2pXTvhnRru9bvzErWrtjaYIW3adZWT63x+FbQBhWPg9?=
 =?us-ascii?Q?RmL6Eks+ys3xRkReibiIQHr+wHRWvMEcPxIuT4GJPfsBL7d0EK1IJnRNWqlA?=
 =?us-ascii?Q?boECKVwgzqJ2q+b4i9e8FCkG+iXM073cUlH3M14anGl9Pdm+PDyT55fT9AYK?=
 =?us-ascii?Q?tFJrRp15S0QzjI5JcwYvHh2MNrgdEX11lvn20ZaWvR1D37iyMctUvme5hs2T?=
 =?us-ascii?Q?zRU+vEKiLr2cVJX95rknrKXXOoIwQKKmU0MN4c+VSeJI5Q7Pdo9u9De6BL3v?=
 =?us-ascii?Q?00RJYTeKbkL2g1iqG2CKQLMqwgJJx6c5qWnkXsLCcym4+DPvR7CuzN3l2EUg?=
 =?us-ascii?Q?/wj/dqXCsNlVX5uTsOilaTamizNK4KR2+NeVp3lxamvd9O+AfljNjmbZpJ9N?=
 =?us-ascii?Q?NjWrKqNZ550RUG4ZG9IoqvpBLJhu1JfjSWFour6xWEv/I1DGWafnOLuiqZnA?=
 =?us-ascii?Q?yiyVW95DBOZOXdmPG6nLtMqc66ywIolfl+saZ+GDhPzneOfPP9etQG+6vSNE?=
 =?us-ascii?Q?sdp523MpZQ07X0ZjKSlDRUyjOZ1z7rkqli68OcHLYUnoDuoB9Ix+AYsHPs3P?=
 =?us-ascii?Q?s5ZIThZBj8e1waiGTnLdffFVmcHDblxIpnyc4TjaefemqpNd+FuI5UewJWnV?=
 =?us-ascii?Q?iV/jzdJ6qunXRF0bJnA+mfqFZVTEJEwLnfbBZ7/FQeDMMpH7LhT0QIqSQNSK?=
 =?us-ascii?Q?yOEe/OJhSUW0U1TtNz2DabpZutM93U1U/rcM6g2VBWD6imr6GWrzDeI0XF3x?=
 =?us-ascii?Q?qhxyuL1q+U2kfxCcKeGDpxTvTiBmOa6PDfa5rUZOKKTvx//UgKrxibClwmHz?=
 =?us-ascii?Q?Z3QhuijODhmGoELeLt3BVXymXHMY6ZKEcXka42qmYlzkoRxhp6M64Ryi5zhd?=
 =?us-ascii?Q?h15GdqjqrcLZjiZ4VW/W5NXwUOgwz+qF3TOzQedINofYIgXyQrcBLvTPO1Ba?=
 =?us-ascii?Q?BvQrUWvI0JFoT+vO//nJhE1qzSTttvvwgYPdWrFNm2QnHekaLUh0u4Kq5LRx?=
 =?us-ascii?Q?JbVJOEki85xZBE8cuS83gmgJw4p+whr8cunVBdDX93/+d/pVZCsylDMZgEo0?=
 =?us-ascii?Q?s2T0lV4nksJxIAf1hZWybguLDPN6hQaOqMH8pthDKdp1rHnXw48vPuQCMPRe?=
 =?us-ascii?Q?qK2rTbXmTz6Y8eaOG+exWDorrcanT22kmVTqOX24T4nUnPYPhc6cX+AX0y8N?=
 =?us-ascii?Q?gd1LnwcMep04P13jkq8M3smjmnxEsg7bDG1yWQyDdsKeB3+c1TNSchMzylc5?=
 =?us-ascii?Q?FijhsN75uqIxuyXpLNi4Hcbk8CL4Gb776oVOrKTVtTNvM2LatDyTaVHlgAuV?=
 =?us-ascii?Q?5Jak4FzNTq2bXYpeUxLXVfZi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7298a0ce-64ea-457f-4503-08d908edeaa9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 20:00:18.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouXLH6qL4YnScKI8q4iJbidVEOtI/BSwDsd++80rKv9AnuuJQB4oy9oTC8AaWHUW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1659
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

While there is a confusing mess of pointers and structs in this driver,
the struct kvmgt_vdev (which in turn is 1:1 with a struct intel_vgpu) is
what holds the vfio_device. Replace all the drvdata's and weird
derivations of vgpu and vdev with container_of() or vdev->vgpu.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 208 +++++++++++++++++--------------
 1 file changed, 111 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 6bf176e8426e63..85ef300087e091 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -50,6 +50,7 @@
 #include "gvt.h"
 
 static const struct intel_gvt_ops *intel_gvt_ops;
+static const struct vfio_device_ops intel_vgpu_dev_ops;
 
 /* helper macros copied from vfio-pci */
 #define VFIO_PCI_OFFSET_SHIFT   40
@@ -109,8 +110,8 @@ struct gvt_dma {
 };
 
 struct kvmgt_vdev {
+	struct vfio_device vfio_device;
 	struct intel_vgpu *vgpu;
-	struct mdev_device *mdev;
 	struct vfio_region *region;
 	int num_regions;
 	struct eventfd_ctx *intx_trigger;
@@ -130,7 +131,6 @@ struct kvmgt_vdev {
 	struct kvm *kvm;
 	struct work_struct release_work;
 	atomic_t released;
-	struct vfio_device *vfio_device;
 	struct vfio_group *vfio_group;
 };
 
@@ -144,7 +144,7 @@ static inline bool handle_valid(unsigned long handle)
 	return !!(handle & ~0xff);
 }
 
-static int kvmgt_guest_init(struct mdev_device *mdev);
+static int kvmgt_guest_init(struct kvmgt_vdev *vdev);
 static void intel_vgpu_release_work(struct work_struct *work);
 static bool kvmgt_guest_exit(struct kvmgt_guest_info *info);
 
@@ -611,12 +611,7 @@ static int kvmgt_get_vfio_device(void *p_vgpu)
 	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 
-	vdev->vfio_device = vfio_device_get_from_dev(
-		mdev_dev(vdev->mdev));
-	if (!vdev->vfio_device) {
-		gvt_vgpu_err("failed to get vfio device\n");
-		return -ENODEV;
-	}
+	vfio_device_get(&vdev->vfio_device);
 	return 0;
 }
 
@@ -683,16 +678,14 @@ static void kvmgt_put_vfio_device(void *vgpu)
 {
 	struct kvmgt_vdev *vdev = kvmgt_vdev((struct intel_vgpu *)vgpu);
 
-	if (WARN_ON(!vdev->vfio_device))
-		return;
-
-	vfio_device_put(vdev->vfio_device);
+	vfio_device_put(&vdev->vfio_device);
 }
 
-static int intel_vgpu_create(struct mdev_device *mdev)
+static int intel_vgpu_probe(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = NULL;
 	struct intel_vgpu_type *type;
+	struct kvmgt_vdev *vdev;
 	struct device *pdev;
 	void *gvt;
 	int ret;
@@ -702,40 +695,40 @@ static int intel_vgpu_create(struct mdev_device *mdev)
 
 	type = intel_gvt_ops->gvt_find_vgpu_type(gvt,
 						 mdev_get_type_group_id(mdev));
-	if (!type) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (!type)
+		return -EINVAL;
 
 	vgpu = intel_gvt_ops->vgpu_create(gvt, type);
 	if (IS_ERR_OR_NULL(vgpu)) {
-		ret = vgpu == NULL ? -EFAULT : PTR_ERR(vgpu);
 		gvt_err("failed to create intel vgpu: %d\n", ret);
-		goto out;
+		return vgpu == NULL ? -EFAULT : PTR_ERR(vgpu);
 	}
 
-	INIT_WORK(&kvmgt_vdev(vgpu)->release_work, intel_vgpu_release_work);
+	vdev = kvmgt_vdev(vgpu);
+	INIT_WORK(&vdev->release_work, intel_vgpu_release_work);
+	vfio_init_group_dev(&vdev->vfio_device, &mdev->dev,
+			    &intel_vgpu_dev_ops);
 
-	kvmgt_vdev(vgpu)->mdev = mdev;
-	mdev_set_drvdata(mdev, vgpu);
+	ret = vfio_register_group_dev(&vdev->vfio_device);
+	if (ret) {
+		intel_gvt_ops->vgpu_destroy(vgpu);
+		return ret;
+	}
+	dev_set_drvdata(&mdev->dev, vdev);
 
 	gvt_dbg_core("intel_vgpu_create succeeded for mdev: %s\n",
 		     dev_name(mdev_dev(mdev)));
-	ret = 0;
-
-out:
-	return ret;
+	return 0;
 }
 
-static int intel_vgpu_remove(struct mdev_device *mdev)
+static void intel_vgpu_remove(struct mdev_device *mdev)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-
-	if (handle_valid(vgpu->handle))
-		return -EBUSY;
+	struct kvmgt_vdev *vdev = dev_get_drvdata(&mdev->dev);
+	struct intel_vgpu *vgpu = vdev->vgpu;
 
+	if (WARN_ON(handle_valid(vgpu->handle)))
+		return;
 	intel_gvt_ops->vgpu_destroy(vgpu);
-	return 0;
 }
 
 static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
@@ -788,10 +781,11 @@ static int intel_vgpu_group_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static int intel_vgpu_open(struct mdev_device *mdev)
+static int intel_vgpu_open(struct vfio_device *vfio_dev)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
+	struct kvmgt_vdev *vdev =
+		container_of(vfio_dev, struct kvmgt_vdev, vfio_device);
+	struct intel_vgpu *vgpu = vdev->vgpu;
 	unsigned long events;
 	int ret;
 	struct vfio_group *vfio_group;
@@ -800,7 +794,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 	vdev->group_notifier.notifier_call = intel_vgpu_group_notifier;
 
 	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY, &events,
+	ret = vfio_register_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY, &events,
 				&vdev->iommu_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
@@ -809,7 +803,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 	}
 
 	events = VFIO_GROUP_NOTIFY_SET_KVM;
-	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY, &events,
+	ret = vfio_register_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY, &events,
 				&vdev->group_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
@@ -817,7 +811,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 		goto undo_iommu;
 	}
 
-	vfio_group = vfio_group_get_external_user_from_dev(mdev_dev(mdev));
+	vfio_group = vfio_group_get_external_user_from_dev(vfio_dev->dev);
 	if (IS_ERR_OR_NULL(vfio_group)) {
 		ret = !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
 		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
@@ -833,11 +827,11 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 		goto undo_group;
 	}
 
-	ret = kvmgt_guest_init(mdev);
+	ret = kvmgt_guest_init(vdev);
 	if (ret)
 		goto undo_group;
 
-	intel_gvt_ops->vgpu_activate(vgpu);
+	intel_gvt_ops->vgpu_activate(vdev->vgpu);
 
 	atomic_set(&vdev->released, 0);
 	return ret;
@@ -847,11 +841,11 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 	vdev->vfio_group = NULL;
 
 undo_register:
-	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
+	vfio_unregister_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY,
 					&vdev->group_notifier);
 
 undo_iommu:
-	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
+	vfio_unregister_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY,
 					&vdev->iommu_notifier);
 out:
 	return ret;
@@ -884,12 +878,12 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 
 	intel_gvt_ops->vgpu_release(vgpu);
 
-	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_IOMMU_NOTIFY,
+	ret = vfio_unregister_notifier(vdev->vfio_device.dev, VFIO_IOMMU_NOTIFY,
 					&vdev->iommu_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
 
-	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_GROUP_NOTIFY,
+	ret = vfio_unregister_notifier(vdev->vfio_device.dev, VFIO_GROUP_NOTIFY,
 					&vdev->group_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for group failed: %d\n", ret);
@@ -907,11 +901,12 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	vgpu->handle = 0;
 }
 
-static void intel_vgpu_release(struct mdev_device *mdev)
+static void intel_vgpu_release(struct vfio_device *vfio_dev)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct kvmgt_vdev *vdev =
+		container_of(vfio_dev, struct kvmgt_vdev, vfio_device);
 
-	__intel_vgpu_release(vgpu);
+	__intel_vgpu_release(vdev->vgpu);
 }
 
 static void intel_vgpu_release_work(struct work_struct *work)
@@ -997,11 +992,10 @@ static int intel_vgpu_aperture_rw(struct intel_vgpu *vgpu, u64 off,
 	return 0;
 }
 
-static ssize_t intel_vgpu_rw(struct mdev_device *mdev, char *buf,
+static ssize_t intel_vgpu_rw(struct kvmgt_vdev *vdev, char *buf,
 			size_t count, loff_t *ppos, bool is_write)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
+	struct intel_vgpu *vgpu = vdev->vgpu;
 	unsigned int index = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
 	u64 pos = *ppos & VFIO_PCI_OFFSET_MASK;
 	int ret = -EINVAL;
@@ -1047,9 +1041,9 @@ static ssize_t intel_vgpu_rw(struct mdev_device *mdev, char *buf,
 	return ret == 0 ? count : ret;
 }
 
-static bool gtt_entry(struct mdev_device *mdev, loff_t *ppos)
+static bool gtt_entry(struct kvmgt_vdev *vdev, loff_t *ppos)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct intel_vgpu *vgpu = vdev->vgpu;
 	unsigned int index = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
 	struct intel_gvt *gvt = vgpu->gvt;
 	int offset;
@@ -1066,9 +1060,11 @@ static bool gtt_entry(struct mdev_device *mdev, loff_t *ppos)
 			true : false;
 }
 
-static ssize_t intel_vgpu_read(struct mdev_device *mdev, char __user *buf,
+static ssize_t intel_vgpu_read(struct vfio_device *vfio_dev, char __user *buf,
 			size_t count, loff_t *ppos)
 {
+	struct kvmgt_vdev *vdev =
+		container_of(vfio_dev, struct kvmgt_vdev, vfio_device);
 	unsigned int done = 0;
 	int ret;
 
@@ -1077,10 +1073,10 @@ static ssize_t intel_vgpu_read(struct mdev_device *mdev, char __user *buf,
 
 		/* Only support GGTT entry 8 bytes read */
 		if (count >= 8 && !(*ppos % 8) &&
-			gtt_entry(mdev, ppos)) {
+			gtt_entry(vdev, ppos)) {
 			u64 val;
 
-			ret = intel_vgpu_rw(mdev, (char *)&val, sizeof(val),
+			ret = intel_vgpu_rw(vdev, (char *)&val, sizeof(val),
 					ppos, false);
 			if (ret <= 0)
 				goto read_err;
@@ -1092,7 +1088,7 @@ static ssize_t intel_vgpu_read(struct mdev_device *mdev, char __user *buf,
 		} else if (count >= 4 && !(*ppos % 4)) {
 			u32 val;
 
-			ret = intel_vgpu_rw(mdev, (char *)&val, sizeof(val),
+			ret = intel_vgpu_rw(vdev, (char *)&val, sizeof(val),
 					ppos, false);
 			if (ret <= 0)
 				goto read_err;
@@ -1104,7 +1100,7 @@ static ssize_t intel_vgpu_read(struct mdev_device *mdev, char __user *buf,
 		} else if (count >= 2 && !(*ppos % 2)) {
 			u16 val;
 
-			ret = intel_vgpu_rw(mdev, (char *)&val, sizeof(val),
+			ret = intel_vgpu_rw(vdev, (char *)&val, sizeof(val),
 					ppos, false);
 			if (ret <= 0)
 				goto read_err;
@@ -1116,7 +1112,7 @@ static ssize_t intel_vgpu_read(struct mdev_device *mdev, char __user *buf,
 		} else {
 			u8 val;
 
-			ret = intel_vgpu_rw(mdev, &val, sizeof(val), ppos,
+			ret = intel_vgpu_rw(vdev, &val, sizeof(val), ppos,
 					false);
 			if (ret <= 0)
 				goto read_err;
@@ -1139,10 +1135,12 @@ static ssize_t intel_vgpu_read(struct mdev_device *mdev, char __user *buf,
 	return -EFAULT;
 }
 
-static ssize_t intel_vgpu_write(struct mdev_device *mdev,
+static ssize_t intel_vgpu_write(struct vfio_device *vfio_dev,
 				const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct kvmgt_vdev *vdev =
+		container_of(vfio_dev, struct kvmgt_vdev, vfio_device);
 	unsigned int done = 0;
 	int ret;
 
@@ -1151,13 +1149,13 @@ static ssize_t intel_vgpu_write(struct mdev_device *mdev,
 
 		/* Only support GGTT entry 8 bytes write */
 		if (count >= 8 && !(*ppos % 8) &&
-			gtt_entry(mdev, ppos)) {
+			gtt_entry(vdev, ppos)) {
 			u64 val;
 
 			if (copy_from_user(&val, buf, sizeof(val)))
 				goto write_err;
 
-			ret = intel_vgpu_rw(mdev, (char *)&val, sizeof(val),
+			ret = intel_vgpu_rw(vdev, (char *)&val, sizeof(val),
 					ppos, true);
 			if (ret <= 0)
 				goto write_err;
@@ -1169,7 +1167,7 @@ static ssize_t intel_vgpu_write(struct mdev_device *mdev,
 			if (copy_from_user(&val, buf, sizeof(val)))
 				goto write_err;
 
-			ret = intel_vgpu_rw(mdev, (char *)&val, sizeof(val),
+			ret = intel_vgpu_rw(vdev, (char *)&val, sizeof(val),
 					ppos, true);
 			if (ret <= 0)
 				goto write_err;
@@ -1181,7 +1179,7 @@ static ssize_t intel_vgpu_write(struct mdev_device *mdev,
 			if (copy_from_user(&val, buf, sizeof(val)))
 				goto write_err;
 
-			ret = intel_vgpu_rw(mdev, (char *)&val,
+			ret = intel_vgpu_rw(vdev, (char *)&val,
 					sizeof(val), ppos, true);
 			if (ret <= 0)
 				goto write_err;
@@ -1193,7 +1191,7 @@ static ssize_t intel_vgpu_write(struct mdev_device *mdev,
 			if (copy_from_user(&val, buf, sizeof(val)))
 				goto write_err;
 
-			ret = intel_vgpu_rw(mdev, &val, sizeof(val),
+			ret = intel_vgpu_rw(vdev, &val, sizeof(val),
 					ppos, true);
 			if (ret <= 0)
 				goto write_err;
@@ -1212,13 +1210,16 @@ static ssize_t intel_vgpu_write(struct mdev_device *mdev,
 	return -EFAULT;
 }
 
-static int intel_vgpu_mmap(struct mdev_device *mdev, struct vm_area_struct *vma)
+static int intel_vgpu_mmap(struct vfio_device *vfio_dev,
+			   struct vm_area_struct *vma)
 {
+	struct kvmgt_vdev *vdev =
+		container_of(vfio_dev, struct kvmgt_vdev, vfio_device);
 	unsigned int index;
 	u64 virtaddr;
 	unsigned long req_size, pgoff, req_start;
 	pgprot_t pg_prot;
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct intel_vgpu *vgpu = vdev->vgpu;
 
 	index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
 	if (index >= VFIO_PCI_ROM_REGION_INDEX)
@@ -1341,11 +1342,12 @@ static int intel_vgpu_set_irqs(struct intel_vgpu *vgpu, u32 flags,
 	return func(vgpu, index, start, count, flags, data);
 }
 
-static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
+static long intel_vgpu_ioctl(struct vfio_device *vfio_dev, unsigned int cmd,
 			     unsigned long arg)
 {
-	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
-	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
+	struct kvmgt_vdev *vdev =
+		container_of(vfio_dev, struct kvmgt_vdev, vfio_device);
+	struct intel_vgpu *vgpu = vdev->vgpu;
 	unsigned long minsz;
 
 	gvt_dbg_core("vgpu%d ioctl, cmd: %d\n", vgpu->id, cmd);
@@ -1624,14 +1626,10 @@ static ssize_t
 vgpu_id_show(struct device *dev, struct device_attribute *attr,
 	     char *buf)
 {
-	struct mdev_device *mdev = mdev_from_dev(dev);
+	struct kvmgt_vdev *vdev = dev_get_drvdata(dev);
+	struct intel_vgpu *vgpu = vdev->vgpu;
 
-	if (mdev) {
-		struct intel_vgpu *vgpu = (struct intel_vgpu *)
-			mdev_get_drvdata(mdev);
-		return sprintf(buf, "%d\n", vgpu->id);
-	}
-	return sprintf(buf, "\n");
+	return sprintf(buf, "%d\n", vgpu->id);
 }
 
 static DEVICE_ATTR_RO(vgpu_id);
@@ -1651,18 +1649,28 @@ static const struct attribute_group *intel_vgpu_groups[] = {
 	NULL,
 };
 
-static struct mdev_parent_ops intel_vgpu_ops = {
-	.mdev_attr_groups       = intel_vgpu_groups,
-	.create			= intel_vgpu_create,
-	.remove			= intel_vgpu_remove,
+static const struct vfio_device_ops intel_vgpu_dev_ops = {
+	.open = intel_vgpu_open,
+	.release = intel_vgpu_release,
+	.read = intel_vgpu_read,
+	.write = intel_vgpu_write,
+	.mmap = intel_vgpu_mmap,
+	.ioctl = intel_vgpu_ioctl,
+};
 
-	.open			= intel_vgpu_open,
-	.release		= intel_vgpu_release,
+static struct mdev_driver intel_vgpu_mdev_driver = {
+	.driver = {
+		.name = "intel_vgpu_mdev",
+		.owner = THIS_MODULE,
+		.mod_name = KBUILD_MODNAME,
+		.dev_groups = intel_vgpu_groups,
+	},
+	.probe = intel_vgpu_probe,
+	.remove	= intel_vgpu_remove,
+};
 
-	.read			= intel_vgpu_read,
-	.write			= intel_vgpu_write,
-	.mmap			= intel_vgpu_mmap,
-	.ioctl			= intel_vgpu_ioctl,
+static struct mdev_parent_ops intel_vgpu_ops = {
+	.device_driver		= &intel_vgpu_mdev_driver,
 };
 
 static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
@@ -1806,18 +1814,12 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
 	return ret;
 }
 
-static int kvmgt_guest_init(struct mdev_device *mdev)
+static int kvmgt_guest_init(struct kvmgt_vdev *vdev)
 {
 	struct kvmgt_guest_info *info;
-	struct intel_vgpu *vgpu;
-	struct kvmgt_vdev *vdev;
+	struct intel_vgpu *vgpu = vdev->vgpu;
 	struct kvm *kvm;
 
-	vgpu = mdev_get_drvdata(mdev);
-	if (handle_valid(vgpu->handle))
-		return -EEXIST;
-
-	vdev = kvmgt_vdev(vgpu);
 	kvm = vdev->kvm;
 	if (!kvm || kvm->mm != current->mm) {
 		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
@@ -2125,13 +2127,25 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 
 static int __init kvmgt_init(void)
 {
-	if (intel_gvt_register_hypervisor(&kvmgt_mpt) < 0)
-		return -ENODEV;
+	int ret;
+
+	ret = mdev_register_driver(&intel_vgpu_mdev_driver);
+	if (ret)
+		return ret;
+
+	if (intel_gvt_register_hypervisor(&kvmgt_mpt) < 0) {
+		ret = -ENODEV;
+		goto err_driver;
+	}
 	return 0;
+err_driver:
+	mdev_unregister_driver(&intel_vgpu_mdev_driver);
+	return ret;
 }
 
 static void __exit kvmgt_exit(void)
 {
+	mdev_unregister_driver(&intel_vgpu_mdev_driver);
 	intel_gvt_unregister_hypervisor();
 }
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
