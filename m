Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E958036BA76
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 22:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13646E87E;
	Mon, 26 Apr 2021 20:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE656E878;
 Mon, 26 Apr 2021 20:00:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMybCx5we8S17H7319DXEq4UIzIUXocXbExGpGKA4uzieqyigejvZygg3ns3MWlNpih19jsOQ3JLHzITBqBSI7bci2ZdkkHbiWF08uGRFh3cr3Tc5WQHuiqX+aIs2ksUfjf2JH9YLGS3/0p7oC2CKBx6KmkemEkJQFsL8QGB1JcullUea2n3WWMED8K/ukn+Nxeb8v1l/Ch5WaH4Kas0Z/c6hPkhdvD/mt2DwGERAKs686WcCkUQIvHPLjeGsbd9gbjFyUEvMdOzcEqG6u0DnJhQQt0HPxJvr1pbMSnEvfQek51tu8KG5RVBryYdB15O/pPFuJM8uAKSWA2h3RPCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ui6Og269Se97lo2DPmiHQraGWQEXfL4ylWpFw8Muxxo=;
 b=T000Lu37NXRVD9yIhe0ZvJjUVPqF2dduLBCnxUIreiwl7i/PYRVURBu7P5Ncf22c+oTDR3xu/AdcSohHlgFOmQWkW2WWOThOBhkQM4YUByFXa3T8INOPT7Y5lYqFy8sZW21/dkrgA5bAyqJimjsjSGHrUqOXqfkT5Ol1/GNUmI77DXIX4Sy7rUYLfRZFi9IkTDNNGcWb7SIXeUkDTGTc1ES7NujGcbK6X1z7mypTYmD4D8l3JTS9SWgT2Qqt46ULOs9/LUFCJkd+PfAHMhkQS9qtxtnN2a6ip7JOr5pFMMBVP/ju6yXEPJZtSEHrIZFiX1Ek6CVd+b04IoTP22usYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ui6Og269Se97lo2DPmiHQraGWQEXfL4ylWpFw8Muxxo=;
 b=P/9I6qOeRADbJm8Vp0d5kwv0/bJC1UQbYhO9d1G3ZKFMc0OJaKM7TkDbsmdG+9UoUuiX7FBZPz2ma/GaEo9YxuuZ8gRBGRj/tSYyrmT/giMl2kKf/LNamNMsHb7HJBcrOTz0F8GmgVID1FNyosYmQAQvIksWzWeXPYX7I7JV2Obp5D1JwhuiJso9MSBrzLtrbtxjV1yChFucfDGDCiG+Uf3a8k6eHUW4aPmRVFO/gsKAYayeihEo1xwwUuLFfQaswRvgFBSzwShmhC3Qo6/CL/3YCEZ0OEfhbJgfSQqTW5W4fiy1VVUZy2IzZXdMTM1FveBas2qldlUyQrf/q/eAWg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3740.namprd12.prod.outlook.com (2603:10b6:5:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Mon, 26 Apr
 2021 20:00:20 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 20:00:20 +0000
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
Subject: [PATCH v2 11/13] vfio/mdev: Remove mdev_parent_ops
Date: Mon, 26 Apr 2021 17:00:13 -0300
Message-Id: <11-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
In-Reply-To: <0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
References: 
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR14CA0006.namprd14.prod.outlook.com
 (2603:10b6:208:23e::11) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR14CA0006.namprd14.prod.outlook.com (2603:10b6:208:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Mon, 26 Apr 2021 20:00:17 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lb7Oy-00DFZg-57; Mon, 26 Apr 2021 17:00:16 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3bee208-d0ab-4ed3-6853-08d908ede9e2
X-MS-TrafficTypeDiagnostic: DM6PR12MB3740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3740F1553522E5AF1DC97BDAC2429@DM6PR12MB3740.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: It1cvD3pCDsaNIdFWnPBC6ZhgP2ek2Z1J/+6a5TKu0KAO6lYPR8Aesvgk6jgaFaSx1bwJFZACyPgHPFLVzfmeXBRRvLzTLJhNrL4dT/2mgPYyBYchwj64I3XB2zH8lJtp/1a6o2OFhKj84kLfQg6bwj0HAJqFyntBa5Ww/achyyBC1FXqfp9gPVZhf4pAtQ/j4MQAlLF4hQJdlTgvpVHCnXMhB3C54RUAKvtRRa8Edyfcy+Sp3rJGMk27uoV17JiVpYZhW1C4Hj5Ao2Leui634X2vBe+ywaHlOcaHGpRlkmXGywMEwSM+/Hz8mOXxJXziADvvu6r9ap5SquVVi/C6u+j5qO2bnf8l6W1nbZ2WQ7CqHd6ig0ufmTYmCdsCicVIKSsUMN/R/T1o3ai6whJt3vhji9tr21nIbyAGlk5OFfEGokjzCtYIfWhkblKVuWM8tpsaYJXJymAVjNJ9QBBXnLAqIU7yPv9uO8vBQbOv7EOAcB/n3WEUZLfwQ4iXVC+ZBWWPZP/LxDLlta6LZSgISChhtPZgBcTcJmZvTh88DHNc+I8IsJtsLtUbejAw/OUZiBXo9+NyOxC4K2BGQX6MwU2kShK+hDsPprydJMNFQxIieVJI9m//01Zh09fSHuiR1Dl6dgXsQR+qVgdvGIxVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(66476007)(66556008)(9746002)(54906003)(426003)(110136005)(107886003)(186003)(26005)(921005)(6666004)(36756003)(316002)(2906002)(30864003)(2616005)(478600001)(9786002)(8936002)(83380400001)(38100700002)(86362001)(8676002)(5660300002)(7416002)(4326008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2DqjvMu8/qPGzI0qBDgqIjq8Zaq2DGe8iCgppJexVso/o6cuh5717D3L9uUZ?=
 =?us-ascii?Q?pGdHO/NurSFS5RBU9FDCcgb08Op8AF744WtI9Inxz2Zue9ggAr2Ouieisqkw?=
 =?us-ascii?Q?sWPXFCAhM3D+ZTR3lWyvyHn++IGzo3EnpG4uxKJL6hPDRMFQff3/jjwuYnFn?=
 =?us-ascii?Q?QegATa6fPlYqq4YpmMLo86Jj8ft31MKO94ed2RmFzUZWhQHHysFrNG71tXLC?=
 =?us-ascii?Q?E/T4XEzsl6Q1XFJT3N2kPCgZAmZ+fBNZbU/YntP7sbuXBxJmyA14BN6kgcgp?=
 =?us-ascii?Q?X/zsrTWzUMEW8WLcnHvMAdeo0ary9iLFeGJGaieHhwkW3VVyFrr666iBgr4+?=
 =?us-ascii?Q?LYS9m1zZIxkc7mXQVrTfAUgYRikogguOOpT/eG2B+KNMHSj/vN9I9hinOi8J?=
 =?us-ascii?Q?1STf2ytZkR8jBlExLqkGSQhnNgOQPSPck02vgcKd2JvQ5xqz47HPZrfw+7ZU?=
 =?us-ascii?Q?AzXNn09p2dlhzX/rCGf93HNxKwFTKKFmkqnT1t5tngwjxZULnQffxbCTccn8?=
 =?us-ascii?Q?vFP6HyANXA+Hq7ihCTmXGaOHA2gdWqkDh86cNVHAwWvIH+y/ihTweI7JYUre?=
 =?us-ascii?Q?YPEi1nl524NHs5KwVSdTlTEG9UCkQhmPy0pRJO/X5X9ROODcJkORkT757Wy6?=
 =?us-ascii?Q?BjCRxZNeFKEz7O+G37dlfdjZab6zfYtneaRGfp4YNNd0CVYo/bzpVEAftBNe?=
 =?us-ascii?Q?qDvPuEQ7qVl2sMLiC6Eil3AyjZxoL2F8QfyUwa97B7GdUa3nwn3KmxuCJ/ey?=
 =?us-ascii?Q?tXQuxKe/bo+Ip0Fj3S7rf6wxL5ckjr415RDvZBcyPWt6JToHCGQ6dQhB1Zat?=
 =?us-ascii?Q?S/aijUSb0vbCbn7+gIIYVK0sb2ZVqKj6jCR91bRskpjAoZsMYn2XpGD/KFx2?=
 =?us-ascii?Q?zK2oJLVOAM2QV2BrvRcJqXCoZSrOPChsxnxe7EyOergXTR4mPlS+ICrYujTJ?=
 =?us-ascii?Q?abU178R8Mc18CWBjiyN8ndE4/WRbjXoYJyRWTscUV2e6W7Taaz0iR/89biLp?=
 =?us-ascii?Q?mKF9ItkotSpM4Ytcj9Fiu/dCr8X1d7VT0051/TAcerU3dOqTZkfqHBRd55rW?=
 =?us-ascii?Q?m+pCiZp7AualSePMdNd2q2aUWHICZtLM2uDBwPmnZBF2/PuG2oNp6N4zqkzX?=
 =?us-ascii?Q?HcWBNmPpOo6vOwKdp8LzvWVpDpM7qhT774brmh2Z4j5gRq6lOnynth3GUVPE?=
 =?us-ascii?Q?OtrZq6v2j4pcVU8Z3+c6upqi0woSUdrjZjvdBh2cS5dlIxTTzPYNu3z2q3in?=
 =?us-ascii?Q?DtdP0hPgcGFGruf2z1oOY21feHzk6hzX9bCzvP40l6Ll9ZXswSXKeHu+np0v?=
 =?us-ascii?Q?eWlu8rZJcf6N2FomVA5rBTdq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bee208-d0ab-4ed3-6853-08d908ede9e2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 20:00:17.8043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCPotONK0O933CuaZtVgUf2gRXGjnuZrqhFKVO9POkXHZXSLoTqjHYaJPf04EE6c
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

The last useful member in this struct is the supported_type_groups, move
it to the mdev_driver and delete mdev_parent_ops.

Replace it with mdev_driver as an argument to mdev_register_device()

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       | 37 +++++++------------
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  8 +---
 drivers/s390/cio/vfio_ccw_ops.c               |  7 +---
 drivers/s390/crypto/vfio_ap_ops.c             |  9 +----
 drivers/vfio/mdev/mdev_core.c                 | 13 +++----
 drivers/vfio/mdev/mdev_driver.c               |  2 +-
 drivers/vfio/mdev/mdev_private.h              |  2 +-
 drivers/vfio/mdev/mdev_sysfs.c                |  6 +--
 include/linux/mdev.h                          | 24 ++----------
 samples/vfio-mdev/mbochs.c                    |  9 +----
 samples/vfio-mdev/mdpy.c                      |  9 +----
 samples/vfio-mdev/mtty.c                      |  9 +----
 12 files changed, 39 insertions(+), 96 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 5f866b17c93e69..a073d0bb06e7fd 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -93,7 +93,7 @@ interfaces:
 Registration Interface for a Mediated Bus Driver
 ------------------------------------------------
 
-The registration interface for a mediated bus driver provides the following
+The registration interface for a mediated device driver provides the following
 structure to represent a mediated device's driver::
 
      /*
@@ -105,6 +105,7 @@ structure to represent a mediated device's driver::
      struct mdev_driver {
 	     int  (*probe)  (struct mdev_device *dev);
 	     void (*remove) (struct mdev_device *dev);
+	     struct attribute_group **supported_type_groups;
 	     struct device_driver    driver;
      };
 
@@ -119,35 +120,25 @@ to register and unregister itself with the core driver:
 
     extern void mdev_unregister_driver(struct mdev_driver *drv);
 
-The mediated bus driver is responsible for adding mediated devices to the VFIO
-group when devices are bound to the driver and removing mediated devices from
-the VFIO when devices are unbound from the driver.
+The mediated bus driver's probe function should create a vfio_device on top of
+the mdev_device and connect it to an appropriate implementation of
+vfio_device_ops.
 
-
-Physical Device Driver Interface
---------------------------------
-
-The physical device driver interface provides the mdev_parent_ops[3] structure
-to define the APIs to manage work in the mediated core driver that is related
-to the physical device.
-
-The structures in the mdev_parent_ops structure are as follows:
-
-* dev_attr_groups: attributes of the parent device
-* mdev_attr_groups: attributes of the mediated device
-* supported_config: attributes to define supported configurations
-
-A driver should use the mdev_parent_ops structure in the function call to
-register itself with the mdev core driver::
+When a driver wants to add the GUID creation sysfs to an existing device it has
+probe'd to then it should call:
 
 	extern int  mdev_register_device(struct device *dev,
-	                                 const struct mdev_parent_ops *ops);
+	                                 struct mdev_driver *mdev_driver);
+
+This will provide the 'mdev_supported_types/XX/create' files which can then be
+used to trigger the creation of a mdev_device. The created mdev_device will be
+attached to the specified driver.
 
-However, the mdev_parent_ops structure is not required in the function call
-that a driver should use to unregister itself with the mdev core driver::
+When the driver needs to remove itself it calls:
 
 	extern void mdev_unregister_device(struct device *dev);
 
+Which will unbind and destroy all the created mdevs and remove the sysfs files.
 
 Mediated Device Management Interface Through sysfs
 ==================================================
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 85ef300087e091..02089efd15bb92 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1669,10 +1669,6 @@ static struct mdev_driver intel_vgpu_mdev_driver = {
 	.remove	= intel_vgpu_remove,
 };
 
-static struct mdev_parent_ops intel_vgpu_ops = {
-	.device_driver		= &intel_vgpu_mdev_driver,
-};
-
 static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
 {
 	struct attribute_group **kvm_vgpu_type_groups;
@@ -1680,9 +1676,9 @@ static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
 	intel_gvt_ops = ops;
 	if (!intel_gvt_ops->get_gvt_attrs(&kvm_vgpu_type_groups))
 		return -EFAULT;
-	intel_vgpu_ops.supported_type_groups = kvm_vgpu_type_groups;
+	intel_vgpu_mdev_driver.supported_type_groups = kvm_vgpu_type_groups;
 
-	return mdev_register_device(dev, &intel_vgpu_ops);
+	return mdev_register_device(dev, &intel_vgpu_mdev_driver);
 }
 
 static void kvmgt_host_exit(struct device *dev)
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 0fcf46031d3821..161697529dcc41 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -655,17 +655,12 @@ struct mdev_driver vfio_ccw_mdev_driver = {
 	},
 	.probe = vfio_ccw_mdev_probe,
 	.remove = vfio_ccw_mdev_remove,
-};
-
-static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
-	.owner			= THIS_MODULE,
-	.device_driver		= &vfio_ccw_mdev_driver,
 	.supported_type_groups  = mdev_type_groups,
 };
 
 int vfio_ccw_mdev_reg(struct subchannel *sch)
 {
-	return mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
+	return mdev_register_device(&sch->dev, &vfio_ccw_mdev_driver);
 }
 
 void vfio_ccw_mdev_unreg(struct subchannel *sch)
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 79872c857dd522..92789257c87639 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1339,12 +1339,7 @@ static struct mdev_driver vfio_ap_matrix_driver = {
 	},
 	.probe = vfio_ap_mdev_probe,
 	.remove = vfio_ap_mdev_remove,
-};
-
-static const struct mdev_parent_ops vfio_ap_matrix_ops = {
-	.owner			= THIS_MODULE,
-	.device_driver		= &vfio_ap_matrix_driver,
-	.supported_type_groups	= vfio_ap_mdev_type_groups,
+	.supported_type_groups = vfio_ap_mdev_type_groups,
 };
 
 int vfio_ap_mdev_register(void)
@@ -1357,7 +1352,7 @@ int vfio_ap_mdev_register(void)
 	if (ret)
 		return ret;
 
-	ret = mdev_register_device(&matrix_dev->device, &vfio_ap_matrix_ops);
+	ret = mdev_register_device(&matrix_dev->device, &vfio_ap_matrix_driver);
 	if (ret)
 		goto err_driver;
 	return 0;
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index d507047e6ecf4a..cd1ab9fe299445 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -109,12 +109,12 @@ static int mdev_device_remove_cb(struct device *dev, void *data)
 /*
  * mdev_register_device : Register a device
  * @dev: device structure representing parent device.
- * @ops: Parent device operation structure to be registered.
+ * @mdev_driver: Device driver to bind to the newly created mdev
  *
  * Add device to list of registered parent devices.
  * Returns a negative value on error, otherwise 0.
  */
-int mdev_register_device(struct device *dev, const struct mdev_parent_ops *ops)
+int mdev_register_device(struct device *dev, struct mdev_driver *mdev_driver)
 {
 	int ret;
 	struct mdev_parent *parent;
@@ -122,9 +122,7 @@ int mdev_register_device(struct device *dev, const struct mdev_parent_ops *ops)
 	char *envp[] = { env_string, NULL };
 
 	/* check for mandatory ops */
-	if (!ops || !ops->supported_type_groups)
-		return -EINVAL;
-	if (!ops->device_driver)
+	if (!mdev_driver->supported_type_groups)
 		return -EINVAL;
 
 	dev = get_device(dev);
@@ -151,7 +149,7 @@ int mdev_register_device(struct device *dev, const struct mdev_parent_ops *ops)
 	init_rwsem(&parent->unreg_sem);
 
 	parent->dev = dev;
-	parent->ops = ops;
+	parent->mdev_driver = mdev_driver;
 
 	if (!mdev_bus_compat_class) {
 		mdev_bus_compat_class = class_compat_register("mdev_bus");
@@ -257,7 +255,7 @@ static int mdev_bind_driver(struct mdev_device *mdev)
 	while (1) {
 		device_lock(&mdev->dev);
 		if (mdev->dev.driver ==
-		    &mdev->type->parent->ops->device_driver->driver) {
+		    &mdev->type->parent->mdev_driver->driver) {
 			ret = 0;
 			goto out_unlock;
 		}
@@ -304,7 +302,6 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 	mdev->dev.parent  = parent->dev;
 	mdev->dev.bus = &mdev_bus_type;
 	mdev->dev.release = mdev_device_release;
-	mdev->dev.groups = parent->ops->mdev_attr_groups;
 	mdev->type = type;
 	/* Pairs with the put in mdev_device_release() */
 	kobject_get(&type->kobj);
diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
index 07ada55efd6228..d743a9f51f4c90 100644
--- a/drivers/vfio/mdev/mdev_driver.c
+++ b/drivers/vfio/mdev/mdev_driver.c
@@ -75,7 +75,7 @@ static int mdev_match(struct device *dev, struct device_driver *drv)
 {
 	struct mdev_device *mdev = to_mdev_device(dev);
 
-	return drv == &mdev->type->parent->ops->device_driver->driver;
+	return drv == &mdev->type->parent->mdev_driver->driver;
 }
 
 struct bus_type mdev_bus_type = {
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index a656cfe0346c33..839567d059a07d 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -15,7 +15,7 @@ void mdev_bus_unregister(void);
 
 struct mdev_parent {
 	struct device *dev;
-	const struct mdev_parent_ops *ops;
+	const struct mdev_driver *mdev_driver;
 	struct kref ref;
 	struct list_head next;
 	struct kset *mdev_types_kset;
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index 66eef08833a4ef..5a3873d1a275ae 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -97,7 +97,7 @@ static struct mdev_type *add_mdev_supported_type(struct mdev_parent *parent,
 {
 	struct mdev_type *type;
 	struct attribute_group *group =
-		parent->ops->supported_type_groups[type_group_id];
+		parent->mdev_driver->supported_type_groups[type_group_id];
 	int ret;
 
 	if (!group->name) {
@@ -154,7 +154,7 @@ static struct mdev_type *add_mdev_supported_type(struct mdev_parent *parent,
 static void remove_mdev_supported_type(struct mdev_type *type)
 {
 	struct attribute_group *group =
-		type->parent->ops->supported_type_groups[type->type_group_id];
+		type->parent->mdev_driver->supported_type_groups[type->type_group_id];
 
 	sysfs_remove_files(&type->kobj,
 			   (const struct attribute **)group->attrs);
@@ -168,7 +168,7 @@ static int add_mdev_supported_type_groups(struct mdev_parent *parent)
 {
 	int i;
 
-	for (i = 0; parent->ops->supported_type_groups[i]; i++) {
+	for (i = 0; parent->mdev_driver->supported_type_groups[i]; i++) {
 		struct mdev_type *type;
 
 		type = add_mdev_supported_type(parent, i);
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index fd9fe1dcf0e230..af807c77c1e0f5 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -51,25 +51,6 @@ unsigned int mdev_get_type_group_id(struct mdev_device *mdev);
 unsigned int mtype_get_type_group_id(struct mdev_type *mtype);
 struct device *mtype_get_parent_dev(struct mdev_type *mtype);
 
-/**
- * struct mdev_parent_ops - Structure to be registered for each parent device to
- * register the device to mdev module.
- *
- * @owner:		The module owner.
- * @device_driver:	Which device driver to probe() on newly created devices
- * @mdev_attr_groups:	Attributes of the mediated device.
- * @supported_type_groups: Attributes to define supported types. It is mandatory
- *			to provide supported types.
- * Parent device that support mediated device should be registered with mdev
- * module with mdev_parent_ops structure.
- **/
-struct mdev_parent_ops {
-	struct module   *owner;
-	struct mdev_driver *device_driver;
-	const struct attribute_group **mdev_attr_groups;
-	struct attribute_group **supported_type_groups;
-};
-
 /* interface for exporting mdev supported type attributes */
 struct mdev_type_attribute {
 	struct attribute attr;
@@ -94,12 +75,15 @@ struct mdev_type_attribute mdev_type_attr_##_name =		\
  * struct mdev_driver - Mediated device driver
  * @probe: called when new device created
  * @remove: called when device removed
+ * @supported_type_groups: Attributes to define supported types. It is mandatory
+ *			to provide supported types.
  * @driver: device driver structure
  *
  **/
 struct mdev_driver {
 	int (*probe)(struct mdev_device *dev);
 	void (*remove)(struct mdev_device *dev);
+	struct attribute_group **supported_type_groups;
 	struct device_driver driver;
 };
 
@@ -118,7 +102,7 @@ static inline const guid_t *mdev_uuid(struct mdev_device *mdev)
 
 extern struct bus_type mdev_bus_type;
 
-int mdev_register_device(struct device *dev, const struct mdev_parent_ops *ops);
+int mdev_register_device(struct device *dev, struct mdev_driver *mdev_driver);
 void mdev_unregister_device(struct device *dev);
 
 int mdev_register_driver(struct mdev_driver *drv);
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index e18821a8a6beb8..c76ceec584b41b 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1418,12 +1418,7 @@ static struct mdev_driver mbochs_driver = {
 	},
 	.probe = mbochs_probe,
 	.remove	= mbochs_remove,
-};
-
-static const struct mdev_parent_ops mdev_fops = {
-	.owner			= THIS_MODULE,
-	.device_driver		= &mbochs_driver,
-	.supported_type_groups	= mdev_type_groups,
+	.supported_type_groups = mdev_type_groups,
 };
 
 static const struct file_operations vd_fops = {
@@ -1466,7 +1461,7 @@ static int __init mbochs_dev_init(void)
 	if (ret)
 		goto err_class;
 
-	ret = mdev_register_device(&mbochs_dev, &mdev_fops);
+	ret = mdev_register_device(&mbochs_dev, &mbochs_driver);
 	if (ret)
 		goto err_device;
 
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 82638de333330d..c22b2c808d132d 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -735,12 +735,7 @@ static struct mdev_driver mdpy_driver = {
 	},
 	.probe = mdpy_probe,
 	.remove	= mdpy_remove,
-};
-
-static const struct mdev_parent_ops mdev_fops = {
-	.owner			= THIS_MODULE,
-	.device_driver          = &mdpy_driver,
-	.supported_type_groups	= mdev_type_groups,
+	.supported_type_groups = mdev_type_groups,
 };
 
 static const struct file_operations vd_fops = {
@@ -783,7 +778,7 @@ static int __init mdpy_dev_init(void)
 	if (ret)
 		goto err_class;
 
-	ret = mdev_register_device(&mdpy_dev, &mdev_fops);
+	ret = mdev_register_device(&mdpy_dev, &mdpy_driver);
 	if (ret)
 		goto err_device;
 
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 31eec76bc553ce..87f5ba12a230e3 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1308,12 +1308,7 @@ static struct mdev_driver mtty_driver = {
 	},
 	.probe = mtty_probe,
 	.remove	= mtty_remove,
-};
-
-static const struct mdev_parent_ops mdev_fops = {
-	.owner                  = THIS_MODULE,
-	.device_driver		= &mtty_driver,
-	.supported_type_groups  = mdev_type_groups,
+	.supported_type_groups = mdev_type_groups,
 };
 
 static void mtty_device_release(struct device *dev)
@@ -1364,7 +1359,7 @@ static int __init mtty_dev_init(void)
 	if (ret)
 		goto err_class;
 
-	ret = mdev_register_device(&mtty_dev.dev, &mdev_fops);
+	ret = mdev_register_device(&mtty_dev.dev, &mtty_driver);
 	if (ret)
 		goto err_device;
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
