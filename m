Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D595369D05
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 01:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6F56ECB9;
	Fri, 23 Apr 2021 23:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92DE6ECBE;
 Fri, 23 Apr 2021 23:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0stiEn3idLtMcH73OyP3HXtiOqWlrBCHqAVQeerrrCvFvs+tAqtStRIhBKs3qNZ2QwuxPs1YnIMZB5tXfCw8EL5FMlRBQR/t4krv+TAPAfOr1rz6sS4BfuJ1xuKf+iNb9rxOWt1Z3LNjRUpVnktG/G8+x9K2DEK5tQGK/SGRWxgNtBj7dqHUJCGl21KX/S/xqwXzb22pQbVCphTkBzjl/ROEFcg3WnCk01q6jYZAqat2LI+n+ZmgZUOHlNVZkvLmHy0FmOVTqwmuR5/g68E/nvafjErjpl8Q0sye64WJBuTexgiDnWS7qkzj/p3TjK4+ExjWMzNznmZw5FUe+Ncsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3HuWK/Gxyl374DecBXdfCYB+d5bVP2WxrOfkNKvQLg=;
 b=XzKAWSeYRjfFwVLM2JbBwntizcnsBg/OvyGIsWl839kOAHTxZDCRtz8GrqxFn2zK8KW/tJ3+6SGPYx9sO7mPq/UkfLn1ldCu2iybZ7PqK+qj7KjCwwu28Jm7lyeRYmhGA7Bi3pmBIOkgnt/IQ9rWMo95MwVGqEZhWrq31U+JFeJTY8gvXT3zsALQWSk0HuXXk7DEuombx0JPsStRBXusIKMkPZx9wR2wNNwxOSTRGa6UseFOw4cYHG4ITtc+SwNQXp4/0f0sY0oQ4PMlBQqwlMi/SIirtk/Yozkx8RHgKSABXd0rK5lTuP0oGzPpavR7DShbZjjrZAS1wUD6u+sihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3HuWK/Gxyl374DecBXdfCYB+d5bVP2WxrOfkNKvQLg=;
 b=f8gIQmlImt8vnEuqNbXkLNeO7FdUggjMIYshDtG6+6sP0bVQK/nuwbpsddObAcktWO1RIDVSsdY9pRvO11zIssElo6csFCgLkWjAnjd0QYzRwVohpGFmWXVDc3wjmydoY+cHbN4EAqUGMJpnV8QZy41k8q00Fb5DJzCojvpgYvNk6YnULsm7WHm9OcM9zCITXMV5wI34ciqDKYro2AVw6ar3s1vSYxt4mWeuIWj+NE6izuHJUwrJ5wX705u8X4EGvqqlkYyy1Mc3NLG8DqgPazw/p/lfBNUKc42xyo2+li21oP5T6/1u62I0kctgFBjhS5qHy4JmWrx9h3v2vaDByw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB0203.namprd12.prod.outlook.com (2603:10b6:4:56::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Fri, 23 Apr
 2021 23:03:16 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 23:03:16 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 08/12] vfio/gvt: Convert to use vfio_register_group_dev()
Date: Fri, 23 Apr 2021 20:03:05 -0300
Message-Id: <8-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
In-Reply-To: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
References: 
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:208:23b::10) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR11CA0005.namprd11.prod.outlook.com (2603:10b6:208:23b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 23:03:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1la4pK-00CHzv-9i; Fri, 23 Apr 2021 20:03:10 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e25d1ca3-7227-48a9-40ce-08d906abf922
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0203:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0203BB0FBD51B2A0F02BB943C2459@DM5PR1201MB0203.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBE7CRxIGLbQCWnVtQsnUQcpcfun2VWQTtRl/DT9800S/E17/IrV8aRnu3sfSIAc9o8NWlh5S4vQJYRaHztkl8ZErz4IJQUaZO+mSe7TmmxLAM4DwWAAc2yyl1AUcIZCK9XnG+DTqIVXL77a8u0JZ3gavKrYqcf1Qmeft0poL/yHryXYUFhWK2NKLVPuh8ajbERJbPEzTZlmXi+Hy2ojfQTV9TNhHpvU4LIU+yBXfpm+dmr3mjeFTOO9VRA2zNa4iwa+Qs7hlNMoLppnJw1sRs4tSGG/osSasajQOt0+Z94R0Nc4Ieskgje302Y9IoVpVXyVjQHEWgdZlpW1z6A5hOi8NYvEoYUA/klHUWd7GKfn5vftks5mjorh69Xckh7M5PME+/jRvSyrCs/MbFyZfrwzidR8PLFqhxbjskoKsZvSHLJE0oV5QKH1T9YqW51PtXE5ohAV0Mu+OnE3VXjRkfSjEnf6Yv7ux9SzbHGOdRkkKxZTaWv7KHJQ1qWwMc0qpzMbGeVzlM2dFOs+GzGgacZtKG63KVO9qiCpF4dAJ4kkHrlPn3y5BxBhvOKQLiee8xc15xBWBB8m3m3baow/uZ8o1F7nfTpsTcXzj8yXFroUAHRErXNwmm/DwcylMKnwuBVbR7SbQqsHikfIs0nTQtpUeHb3/fPERM3EyAEMvXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(6666004)(86362001)(2906002)(30864003)(66556008)(2616005)(426003)(66476007)(921005)(107886003)(66946007)(110136005)(38100700002)(36756003)(26005)(186003)(83380400001)(8676002)(54906003)(9786002)(316002)(4326008)(8936002)(9746002)(5660300002)(7416002)(478600001)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F4kOIGsAIEVk3GB2FW3HgW80NyWZfG+a0hR6riG6fHTD195YQrhHvPQhNmoS?=
 =?us-ascii?Q?IFRpEDUmIshN3bg4ceoRcBVuHNU7UvE45TlKa5PP4NvuRAxLqQbWVGVjKh48?=
 =?us-ascii?Q?Z8hISvEDcKkICL8MTaL8y1dM/ytJokKx/NxIQ1XSUHWmazK4+7iKYotdOL+a?=
 =?us-ascii?Q?Vd2gWa3qDwvoUNWUGKM1KN+IQADMZwgNBSi/JriwKDVRSdjfFl5JVIgH8IhH?=
 =?us-ascii?Q?nw1aPBjh9OWez8jJdQ9r+muGiijYwPuJMrQByTVXuYDWqFAj+8HGycsuCKjn?=
 =?us-ascii?Q?ip/YIiYJuWQz4V87+CK4TCt3lMRryjaV2Z25Qsd9aePwfbbxNZ0ir5gbSmjx?=
 =?us-ascii?Q?1SfiWCT9M/OvMk9UWk94h9mxYevaXeCFzQswEUoHwMnHnQRhdPNz7ha4ntcI?=
 =?us-ascii?Q?5c/sWo8t684q6SX8AlZgNCjQLBdylxCgNpz21UfyxOwyiVPut/RK7SmoFOxk?=
 =?us-ascii?Q?65Khk1DGwrqV5rAkFy3OWmI5e8i9kpipJOsrMpwKr8aeJKjppGvHxBd21Ikg?=
 =?us-ascii?Q?jqe6v6COC8tDqCbJ4+Byw0eKuqIvzRQOQq/Zajjkl3hzgq78OrsdMxvs0g6T?=
 =?us-ascii?Q?R0fWcxPx2OD9DY73aRLyLTzRU8OGuyrzKfBGhbjCZfvoHPqC9Z6Jr02LvrYl?=
 =?us-ascii?Q?sdR4o3w1ro4LedbZ17DLY+dq4VmL5EP09aVgWmbUi8WA16/Cv/cRYHdona2X?=
 =?us-ascii?Q?yIhzBG78A15l7ewRNXjtBWFNDYZldvZ6aSV/Ha/iGkAPOfiw63XqMny3jNPD?=
 =?us-ascii?Q?nHsu+5brULU8LBZRh6BVIH/gcONRWItS9YUtvJAhNbqBc/LtD8XFL2yhDSC7?=
 =?us-ascii?Q?GDvi0Rn+S4daFE9XhEEhgKrRYfCZkQ6SJQ1wdVwowvJu7ZB/KDaD1qmZamgn?=
 =?us-ascii?Q?a7w3anr/PHMUsAjTiLW03nMwIJsc1xiGdHiiOTIqRolOA1vNj4AVYZv9YJ1T?=
 =?us-ascii?Q?QQUqNqmhP0uO4p5Wa0rfmoVsmwwp6lQDUkvorictO1zjJPZ5owT/SytCoRhg?=
 =?us-ascii?Q?/wrKKLf2VxiSJW1B7xfRrSleXQGvl0WsCUDZpnLfB9kQ1ya7cpSWpLG4FBPT?=
 =?us-ascii?Q?RsiMCd3UY+mEv2k3z5OutcSfCrUrfquzbDWMTePpcT9Q2cWagI9GL7ffpzv/?=
 =?us-ascii?Q?Oeby9km/R0L6NTrNIjVZBn4G0r0h07bPegS6AxlW+XYuevn2veLHitelxfK9?=
 =?us-ascii?Q?cGcpVQi0QVqIYWJUxvvs2t6ep6KUamoGNX+AolAhPpWfro1AZVOqknJNblit?=
 =?us-ascii?Q?PctPDFv+QjDXiI5aV5kplBVssBfPe1ySKnELO61YEAYrMJeJwmFMhxy85xMV?=
 =?us-ascii?Q?bCDJ9tZdplTHkwEZWrGrZw4f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25d1ca3-7227-48a9-40ce-08d906abf922
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 23:03:14.2119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1a0aRXoXY0ytFbXCRDu0wfDN6NZnIwDSaRpjFs65DYXwxsMml/HyaU7iXXdSLf2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0203
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
 .../driver-api/vfio-mediated-device.rst       |  19 --
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 208 ++++++++++--------
 drivers/vfio/mdev/Makefile                    |   2 +-
 drivers/vfio/mdev/mdev_core.c                 |  47 +---
 drivers/vfio/mdev/mdev_driver.c               |  11 +-
 drivers/vfio/mdev/mdev_private.h              |   2 -
 drivers/vfio/mdev/vfio_mdev.c                 | 158 -------------
 drivers/vfio/vfio.c                           |   6 +-
 include/linux/mdev.h                          |  52 -----
 include/linux/vfio.h                          |   4 +
 10 files changed, 126 insertions(+), 383 deletions(-)
 delete mode 100644 drivers/vfio/mdev/vfio_mdev.c

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 1779b85f014e2f..5f866b17c93e69 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -137,25 +137,6 @@ The structures in the mdev_parent_ops structure are as follows:
 * mdev_attr_groups: attributes of the mediated device
 * supported_config: attributes to define supported configurations
 
-The functions in the mdev_parent_ops structure are as follows:
-
-* create: allocate basic resources in a driver for a mediated device
-* remove: free resources in a driver when a mediated device is destroyed
-
-(Note that mdev-core provides no implicit serialization of create/remove
-callbacks per mdev parent device, per mdev type, or any other categorization.
-Vendor drivers are expected to be fully asynchronous in this respect or
-provide their own internal resource protection.)
-
-The callbacks in the mdev_parent_ops structure are as follows:
-
-* open: open callback of mediated device
-* close: close callback of mediated device
-* ioctl: ioctl callback of mediated device
-* read : read emulation callback
-* write: write emulation callback
-* mmap: mmap emulation callback
-
 A driver should use the mdev_parent_ops structure in the function call to
 register itself with the mdev core driver::
 
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
 
diff --git a/drivers/vfio/mdev/Makefile b/drivers/vfio/mdev/Makefile
index ff9ecd80212503..7c236ba1b90eb1 100644
--- a/drivers/vfio/mdev/Makefile
+++ b/drivers/vfio/mdev/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o vfio_mdev.o
+mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o
 
 obj-$(CONFIG_VFIO_MDEV) += mdev.o
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 51b8a9fcf866ad..f95d01b57fb168 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -89,17 +89,10 @@ void mdev_release_parent(struct kref *kref)
 static void mdev_device_remove_common(struct mdev_device *mdev)
 {
 	struct mdev_parent *parent = mdev->type->parent;
-	int ret;
 
 	mdev_remove_sysfs_files(mdev);
 	device_del(&mdev->dev);
 	lockdep_assert_held(&parent->unreg_sem);
-	if (parent->ops->remove) {
-		ret = parent->ops->remove(mdev);
-		if (ret)
-			dev_err(&mdev->dev, "Remove failed: err=%d\n", ret);
-	}
-
 	/* Balances with device_initialize() */
 	put_device(&mdev->dev);
 }
@@ -131,17 +124,13 @@ int mdev_register_device(struct device *dev, const struct mdev_parent_ops *ops)
 	/* check for mandatory ops */
 	if (!ops || !ops->supported_type_groups)
 		return -EINVAL;
-	if (!ops->device_driver && (!ops->create || !ops->remove))
+	if (!ops->device_driver)
 		return -EINVAL;
 
 	dev = get_device(dev);
 	if (!dev)
 		return -EINVAL;
 
-	/* Not mandatory, but its absence could be a problem */
-	if (!ops->request)
-		dev_info(dev, "Driver cannot be asked to release device\n");
-
 	mutex_lock(&parent_list_lock);
 
 	/* Check for duplicate */
@@ -263,15 +252,12 @@ static void mdev_device_release(struct device *dev)
  */
 static int mdev_bind_driver(struct mdev_device *mdev)
 {
-	struct mdev_driver *drv = mdev->type->parent->ops->device_driver;
 	int ret;
 
-	if (!drv)
-		drv = &vfio_mdev_driver;
-
 	while (1) {
 		device_lock(&mdev->dev);
-		if (mdev->dev.driver == &drv->driver) {
+		if (mdev->dev.driver ==
+		    &mdev->type->parent->ops->device_driver->driver) {
 			ret = 0;
 			goto out_unlock;
 		}
@@ -337,15 +323,9 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 		goto out_put_device;
 	}
 
-	if (parent->ops->create) {
-		ret = parent->ops->create(mdev);
-		if (ret)
-			goto out_unlock;
-	}
-
 	ret = device_add(&mdev->dev);
 	if (ret)
-		goto out_remove;
+		goto out_unlock;
 
 	ret = mdev_bind_driver(mdev);
 	if (ret)
@@ -363,9 +343,6 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 
 out_del:
 	device_del(&mdev->dev);
-out_remove:
-	if (parent->ops->remove)
-		parent->ops->remove(mdev);
 out_unlock:
 	up_read(&parent->unreg_sem);
 out_put_device:
@@ -408,27 +385,13 @@ int mdev_device_remove(struct mdev_device *mdev)
 
 static int __init mdev_init(void)
 {
-	int rc;
-
-	rc = mdev_bus_register();
-	if (rc)
-		return rc;
-	rc = mdev_register_driver(&vfio_mdev_driver);
-	if (rc)
-		goto err_bus;
-	return 0;
-err_bus:
-	mdev_bus_unregister();
-	return rc;
+	return  mdev_bus_register();
 }
 
 static void __exit mdev_exit(void)
 {
-	mdev_unregister_driver(&vfio_mdev_driver);
-
 	if (mdev_bus_compat_class)
 		class_compat_unregister(mdev_bus_compat_class);
-
 	mdev_bus_unregister();
 }
 
diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
index 6e96c023d7823d..0012a9ee7cb0a4 100644
--- a/drivers/vfio/mdev/mdev_driver.c
+++ b/drivers/vfio/mdev/mdev_driver.c
@@ -74,15 +74,8 @@ static int mdev_remove(struct device *dev)
 static int mdev_match(struct device *dev, struct device_driver *drv)
 {
 	struct mdev_device *mdev = to_mdev_device(dev);
-	struct mdev_driver *target = mdev->type->parent->ops->device_driver;
-
-	/*
-	 * The ops specify the device driver to connect, fall back to the old
-	 * shim driver if the driver hasn't been converted.
-	 */
-	if (!target)
-		target = &vfio_mdev_driver;
-	return drv == &target->driver;
+
+	return drv == &mdev->type->parent->ops->device_driver->driver;
 }
 
 struct bus_type mdev_bus_type = {
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index 5461b67582289f..a656cfe0346c33 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -37,8 +37,6 @@ struct mdev_type {
 #define to_mdev_type(_kobj)		\
 	container_of(_kobj, struct mdev_type, kobj)
 
-extern struct mdev_driver vfio_mdev_driver;
-
 int  parent_create_sysfs_files(struct mdev_parent *parent);
 void parent_remove_sysfs_files(struct mdev_parent *parent);
 
diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
deleted file mode 100644
index d5b4eede47c1a5..00000000000000
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ /dev/null
@@ -1,158 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * VFIO based driver for Mediated device
- *
- * Copyright (c) 2016, NVIDIA CORPORATION. All rights reserved.
- *     Author: Neo Jia <cjia@nvidia.com>
- *             Kirti Wankhede <kwankhede@nvidia.com>
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/vfio.h>
-#include <linux/mdev.h>
-
-#include "mdev_private.h"
-
-static int vfio_mdev_open(struct vfio_device *core_vdev)
-{
-	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
-	struct mdev_parent *parent = mdev->type->parent;
-
-	int ret;
-
-	if (unlikely(!parent->ops->open))
-		return -EINVAL;
-
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
-	ret = parent->ops->open(mdev);
-	if (ret)
-		module_put(THIS_MODULE);
-
-	return ret;
-}
-
-static void vfio_mdev_release(struct vfio_device *core_vdev)
-{
-	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
-	struct mdev_parent *parent = mdev->type->parent;
-
-	if (likely(parent->ops->release))
-		parent->ops->release(mdev);
-
-	module_put(THIS_MODULE);
-}
-
-static long vfio_mdev_unlocked_ioctl(struct vfio_device *core_vdev,
-				     unsigned int cmd, unsigned long arg)
-{
-	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
-	struct mdev_parent *parent = mdev->type->parent;
-
-	if (unlikely(!parent->ops->ioctl))
-		return -EINVAL;
-
-	return parent->ops->ioctl(mdev, cmd, arg);
-}
-
-static ssize_t vfio_mdev_read(struct vfio_device *core_vdev, char __user *buf,
-			      size_t count, loff_t *ppos)
-{
-	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
-	struct mdev_parent *parent = mdev->type->parent;
-
-	if (unlikely(!parent->ops->read))
-		return -EINVAL;
-
-	return parent->ops->read(mdev, buf, count, ppos);
-}
-
-static ssize_t vfio_mdev_write(struct vfio_device *core_vdev,
-			       const char __user *buf, size_t count,
-			       loff_t *ppos)
-{
-	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
-	struct mdev_parent *parent = mdev->type->parent;
-
-	if (unlikely(!parent->ops->write))
-		return -EINVAL;
-
-	return parent->ops->write(mdev, buf, count, ppos);
-}
-
-static int vfio_mdev_mmap(struct vfio_device *core_vdev,
-			  struct vm_area_struct *vma)
-{
-	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
-	struct mdev_parent *parent = mdev->type->parent;
-
-	if (unlikely(!parent->ops->mmap))
-		return -EINVAL;
-
-	return parent->ops->mmap(mdev, vma);
-}
-
-static void vfio_mdev_request(struct vfio_device *core_vdev, unsigned int count)
-{
-	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
-	struct mdev_parent *parent = mdev->type->parent;
-
-	if (parent->ops->request)
-		parent->ops->request(mdev, count);
-	else if (count == 0)
-		dev_notice(mdev_dev(mdev),
-			   "No mdev vendor driver request callback support, blocked until released by user\n");
-}
-
-static const struct vfio_device_ops vfio_mdev_dev_ops = {
-	.name		= "vfio-mdev",
-	.open		= vfio_mdev_open,
-	.release	= vfio_mdev_release,
-	.ioctl		= vfio_mdev_unlocked_ioctl,
-	.read		= vfio_mdev_read,
-	.write		= vfio_mdev_write,
-	.mmap		= vfio_mdev_mmap,
-	.request	= vfio_mdev_request,
-};
-
-static int vfio_mdev_probe(struct mdev_device *mdev)
-{
-	struct vfio_device *vdev;
-	int ret;
-
-	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
-	if (!vdev)
-		return -ENOMEM;
-
-	vfio_init_group_dev(vdev, &mdev->dev, &vfio_mdev_dev_ops);
-	ret = vfio_register_group_dev(vdev);
-	if (ret) {
-		kfree(vdev);
-		return ret;
-	}
-	dev_set_drvdata(&mdev->dev, vdev);
-	return 0;
-}
-
-static void vfio_mdev_remove(struct mdev_device *mdev)
-{
-	struct vfio_device *vdev = dev_get_drvdata(&mdev->dev);
-
-	vfio_unregister_group_dev(vdev);
-	kfree(vdev);
-}
-
-struct mdev_driver vfio_mdev_driver = {
-	.driver = {
-		.name = "vfio_mdev",
-		.owner = THIS_MODULE,
-		.mod_name = KBUILD_MODNAME,
-	},
-	.probe	= vfio_mdev_probe,
-	.remove	= vfio_mdev_remove,
-};
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 5e631c359ef23c..59bbdf6634f934 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -747,7 +747,7 @@ void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
 	device->dev = dev;
 	device->ops = ops;
 }
-EXPORT_SYMBOL_GPL(vfio_init_group_dev);
+EXPORT_SYMBOL(vfio_init_group_dev);
 
 int vfio_register_group_dev(struct vfio_device *device)
 {
@@ -796,7 +796,7 @@ int vfio_register_group_dev(struct vfio_device *device)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(vfio_register_group_dev);
+EXPORT_SYMBOL(vfio_register_group_dev);
 
 /**
  * Get a reference to the vfio_device for a device.  Even if the
@@ -927,7 +927,7 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 	/* Matches the get in vfio_register_group_dev() */
 	vfio_group_put(group);
 }
-EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
+EXPORT_SYMBOL(vfio_unregister_group_dev);
 
 /**
  * VFIO base fd, /dev/vfio/vfio
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 49cc4f65120d57..ea48c401e4fa63 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -61,45 +61,6 @@ struct device *mtype_get_parent_dev(struct mdev_type *mtype);
  * @mdev_attr_groups:	Attributes of the mediated device.
  * @supported_type_groups: Attributes to define supported types. It is mandatory
  *			to provide supported types.
- * @create:		Called to allocate basic resources in parent device's
- *			driver for a particular mediated device. It is
- *			mandatory to provide create ops.
- *			@mdev: mdev_device structure on of mediated device
- *			      that is being created
- *			Returns integer: success (0) or error (< 0)
- * @remove:		Called to free resources in parent device's driver for
- *			a mediated device. It is mandatory to provide 'remove'
- *			ops.
- *			@mdev: mdev_device device structure which is being
- *			       destroyed
- *			Returns integer: success (0) or error (< 0)
- * @open:		Open mediated device.
- *			@mdev: mediated device.
- *			Returns integer: success (0) or error (< 0)
- * @release:		release mediated device
- *			@mdev: mediated device.
- * @read:		Read emulation callback
- *			@mdev: mediated device structure
- *			@buf: read buffer
- *			@count: number of bytes to read
- *			@ppos: address.
- *			Retuns number on bytes read on success or error.
- * @write:		Write emulation callback
- *			@mdev: mediated device structure
- *			@buf: write buffer
- *			@count: number of bytes to be written
- *			@ppos: address.
- *			Retuns number on bytes written on success or error.
- * @ioctl:		IOCTL callback
- *			@mdev: mediated device structure
- *			@cmd: ioctl command
- *			@arg: arguments to ioctl
- * @mmap:		mmap callback
- *			@mdev: mediated device structure
- *			@vma: vma structure
- * @request:		request callback to release device
- *			@mdev: mediated device structure
- *			@count: request sequence number
  * Parent device that support mediated device should be registered with mdev
  * module with mdev_parent_ops structure.
  **/
@@ -109,19 +70,6 @@ struct mdev_parent_ops {
 	const struct attribute_group **dev_attr_groups;
 	const struct attribute_group **mdev_attr_groups;
 	struct attribute_group **supported_type_groups;
-
-	int     (*create)(struct mdev_device *mdev);
-	int     (*remove)(struct mdev_device *mdev);
-	int     (*open)(struct mdev_device *mdev);
-	void    (*release)(struct mdev_device *mdev);
-	ssize_t (*read)(struct mdev_device *mdev, char __user *buf,
-			size_t count, loff_t *ppos);
-	ssize_t (*write)(struct mdev_device *mdev, const char __user *buf,
-			 size_t count, loff_t *ppos);
-	long	(*ioctl)(struct mdev_device *mdev, unsigned int cmd,
-			 unsigned long arg);
-	int	(*mmap)(struct mdev_device *mdev, struct vm_area_struct *vma);
-	void	(*request)(struct mdev_device *mdev, unsigned int count);
 };
 
 /* interface for exporting mdev supported type attributes */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index a2c5b30e1763ba..c5e08be4c56395 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -64,6 +64,10 @@ void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
 int vfio_register_group_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
 extern struct vfio_device *vfio_device_get_from_dev(struct device *dev);
+static inline void vfio_device_get(struct vfio_device *device)
+{
+	refcount_inc(&device->refcount);
+}
 extern void vfio_device_put(struct vfio_device *device);
 
 /* events for the backend driver notify callback */
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
