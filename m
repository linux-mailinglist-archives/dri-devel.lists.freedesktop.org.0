Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B748369CFE
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 01:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A2C6ECB6;
	Fri, 23 Apr 2021 23:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BFF6ECB6;
 Fri, 23 Apr 2021 23:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAKg+OISxvtPigQVXMEUCrjqQ6h0hH+AW5n2NbXxmvrfp5o6P3b8td+H3hC03hjY6MkWdH7Za+aAYSA2KTchUSvA28Et4b/Wx7jEeI5k/frMosBmrBB9LnZnuuJrfbxCB+HBEV4tFdsdiACkVSIEWD9kx1k3uTsIjxLdEkAX0cbqk/QFelNDkIVh37e6SCfD4clgPTX7e1eSYEc2sl1iXgHPx4J7F3xtnIukqel3ZwU7TWJZ/uBLljwbcEYOWfyF/HeExH+WwUqPUUDgJaY1q5xKBwOf7G4BGVfqN41Vey8yGwnaSrUtwDRzIZYxVuobV0X+fh2a+lHfCiVwKS4ndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlOAWOPj6u/vLNzxzZou3yNuM8Ue5vgBY8bLbTFItKY=;
 b=SP64fznjzR3rA2jSlclvRBUf+sZjjxKVicBX8PrNu48YOjGpDy9RWlmEw4g4+G45Kx2pFZKybylTEi+lCaTpGCL1tvsI0WKqHqI+lzf2x8Ild10spu50pw07mZi2o6pdrFDhxfTmAq7Yttm41gz0E/fYg17nfbAa+2XX5s8cEmRzY9inQYgPNVwj0VctIX594UrIkDEjxXq4ZTk0OnrWT7uC7C7AFZr5DmAu/tNnLr+6qYtWsKKdWCjC7ZpPhVHKnPUGR+Ej1ERTTnnA3fPgBRNbA6jLS5Dn4PA/Jzvjgddj7p3zy38uGHEKiJ2cC+YkG17JEhfkMIXOnmZudUiLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlOAWOPj6u/vLNzxzZou3yNuM8Ue5vgBY8bLbTFItKY=;
 b=LoSC9pQPONz/SkwemLSkqDIjYZ66PIc8xNITa6yteGDimvz1NID2ucvlCRiYqUJACGo4uFSsADpakvBq8sszH1eWia1PPqlQT6gVJUpT8c89QsUv8ZkGe0gxIH4CjbCrVrKTMW9ySmbeQhu2SlhBbl34wotA8MkRLlZwYqdXOwnQWNE0KGu0TlDB1bvjj40ktwUYXo++Iws/UIe6P4Dj1/y7GLrNyg8Fh0QrtFiiWMbvRg6OkClxY9oLnAs5Nigrn5zEsNlVMwaNsRJKZ5BWMvnzNBgR+qtl3HJJNiQ8VDnzy6Ib3J90Wa4gZ0NrnCHURnba2CtZFzHKOsi6GEL/Kg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3513.namprd12.prod.outlook.com (2603:10b6:5:18a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24; Fri, 23 Apr
 2021 23:03:14 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 23:03:14 +0000
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
Subject: [PATCH 10/12] vfio/mdev: Remove mdev_parent_ops
Date: Fri, 23 Apr 2021 20:03:07 -0300
Message-Id: <10-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
In-Reply-To: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
References: 
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:208:238::32) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR22CA0027.namprd22.prod.outlook.com (2603:10b6:208:238::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Fri, 23 Apr 2021 23:03:11 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1la4pK-00CI03-CB; Fri, 23 Apr 2021 20:03:10 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9474e33c-06c6-46bd-727b-08d906abf7c9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3513:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB35131997D4D3032AB34F9BD8C2459@DM6PR12MB3513.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w0qPq+cdByAVM6lVuyMBpSfOyQvLrmaO9rQbbbSgQ0Qf2fkFmlQdR59niN0GRMYITn6102CkS29Bf2gkxd9RCNs42tTfr7u3tvOOHcKPuTCfhkuQ+H1vNWopl46QQ1ocZ7pHCRnqesgRFbvGsUzsmGov9tMdUp/xCHABmP58/kl9V6KTk+SOEagzMNLx+MN+GRrNCoCFaSqd4SGquo+brxI0IWaszfLTh8eHR4JdTV/F1uv+kAzff+mJyO9aTATXtRq/qII0WE4zE22b8Ar4sgXWHg4oZaNBCzy0pr+l033ulR/rIj5uAAPFm0LJeUWzY80l5WW7VyqH3kRiH1SrhFGT+TAme0sR++TOmo6v7rCS+PJpgytHwpM3Km3U2elo4rv8xV9f0GErXbyMJtZ7t80JNvWPPAXbpsSunYYkS2X9eHnilFV7P778U7y6lPfWlYexmh/fh6doTVC6Au2+JcqGalJECR+hM287uqeT6CnR4yuUTZqIavvCE/RnWYJ9X0CCu6HQTfo3pAZl1omv0IsOekEYh8R/0CnJzYJaVQNUGeUdStnH1pcukINASyfyYIvezUzPgnZt6aiz97e+sDO5arudaye/DTGiZf02G5kp1ktmUQ/Ok9H3vB62e+yn0tcc/ZHCmYsfa0bMgpzJSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(36756003)(66556008)(26005)(66476007)(107886003)(426003)(8936002)(83380400001)(921005)(9786002)(5660300002)(186003)(86362001)(9746002)(54906003)(38100700002)(2616005)(316002)(8676002)(7416002)(2906002)(4326008)(110136005)(66946007)(6666004)(30864003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?avqFcyHDisTFM1Fv5yp1ZARnFjyq2sigrjm3OhXSrOdBWj8h8GiwRifTqBmt?=
 =?us-ascii?Q?IzZPGXktUAKs959CnbDw5za+CEOFFziIdFve0Pw8NlA+yKgRrgDOTdubYIMv?=
 =?us-ascii?Q?OsvXjNOgieDjpdVOj0op+ghTupDv/Yp544X4IrxfbrG+LauvsMPNSZYFPKzx?=
 =?us-ascii?Q?24iUeq04CNp4tGDSh5x2R6aRMSD642mAdOXxRFn3IHAeNfSbW3/FUHb+I1E8?=
 =?us-ascii?Q?95xvt8IAE61zExsypX+0d85iqERiExu0Us8HZc4t0yIMxyaPpBpAS+Os8Fux?=
 =?us-ascii?Q?dIXzUU3HMg9JoAUf/iHlKe6csqrKbMZJIZbKDIvlNXnWcg6vxwcAoCT1I/6Z?=
 =?us-ascii?Q?RGYAlAD2/ykfdD8ls15GoGR2iiiGQAp2OdM3mi0CFaJ44P3oo7he0MlSvkl/?=
 =?us-ascii?Q?OUBkN68toLQ87IZ+BZDpUa/vRettWPhh0SPIpL2zl7FtTOdSPxvKH0DIbKr1?=
 =?us-ascii?Q?w0qkoTnTBKqer3ccAwtlbuftxCTBMXapYwoyPPnaXhmY9ZGQz1FHeyrPsq+s?=
 =?us-ascii?Q?gKwx9e7XedOZzfU6Z9DcTyMrh+lPtB+8uZn/1x8NudEnhBXyxXROzYVtMw6y?=
 =?us-ascii?Q?J8wADFfIyLQSYnshRaGdzQIpmInC8MYItE+hgnDGK82lh1Q8fbnhi19ZrjsR?=
 =?us-ascii?Q?cjkMViMACMVDfOxSdhF8lghI5OleWxLvr7uNpds14jRBOkfcsYPNc/ggtrM4?=
 =?us-ascii?Q?2UUvcU9/r6IOWdx2XVGVyxiwgfPg2U5EtWn40Y5akICw1SPpFPURm5zfp9X/?=
 =?us-ascii?Q?xXS3LPkMguSI2T7Ayl00N3qSf6syys+yigHuMqhrDjaXR3ix59VeNMILHoGc?=
 =?us-ascii?Q?hb0pCiGjsyeE9MmcDMVlSzH6qcXZH3wfXkgKZU38fhGJlT4leQT/4KxhtVXC?=
 =?us-ascii?Q?s9iDi2hvwJARkkFKJ2Vck3amNnuNo4dfJVF216ObdhC0WnxbQEL+E2vbzdwz?=
 =?us-ascii?Q?ypjJMP+xHJ1A6OMhCLKlHYcl5RZjKwL3PBzgJQpYnOmNYaqAOO99xRm6U3+R?=
 =?us-ascii?Q?kW8xtV1bZkVWvRv6+RsBThAKdLs1XhQ2+Uu5Jx10uAObtij3gdcO03A0LSE9?=
 =?us-ascii?Q?sNthirUaBWB6yEQAGTFsMsJmnB5UhcQ4K+2eusEbxGPZiwYh28YyIp1UAX5K?=
 =?us-ascii?Q?ZByQN1BeqFzYYUxWwAGSZO1zTmK8SgHu3N5/SxnG1k1Ses0mvtxmy4U9JEoz?=
 =?us-ascii?Q?NriPqvh67lpJjzfadCeZ7uUmmquA4QRCljYxdV1lhW+sH7uklQoy5N7u9swC?=
 =?us-ascii?Q?GHSKT4+4Ja8Vmhjv7+gnADfqjkZqXEy71igqoHHVYsgXGLJHPTahutdQ+rQ3?=
 =?us-ascii?Q?pqnIbpHW2KS1Kzg5qpozPo2C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9474e33c-06c6-46bd-727b-08d906abf7c9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 23:03:11.9292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwkrBLFfn36t0OUXwEhL3BxtLWtvDRRzoIL/p8ajleKtLNXDD3/AjagqjF9Rrb3G
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

The last useful member in this struct is the supported_type_groups, move
it to the mdev_driver and delete mdev_parent_ops.

Replace it with mdev_driver as an argument to mdev_register_device()

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       | 36 +++++++------------
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  8 ++---
 drivers/s390/cio/vfio_ccw_ops.c               |  7 +---
 drivers/s390/crypto/vfio_ap_ops.c             |  9 ++---
 drivers/vfio/mdev/mdev_core.c                 | 13 +++----
 drivers/vfio/mdev/mdev_driver.c               |  2 +-
 drivers/vfio/mdev/mdev_private.h              |  2 +-
 drivers/vfio/mdev/mdev_sysfs.c                |  6 ++--
 include/linux/mdev.h                          | 24 +++----------
 samples/vfio-mdev/mbochs.c                    |  9 ++---
 samples/vfio-mdev/mdpy.c                      |  9 ++---
 samples/vfio-mdev/mtty.c                      |  9 ++---
 12 files changed, 38 insertions(+), 96 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 5f866b17c93e69..b7cf357243d269 100644
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
 
@@ -119,35 +120,24 @@ to register and unregister itself with the core driver:
 
     extern void mdev_unregister_driver(struct mdev_driver *drv);
 
-The mediated bus driver is responsible for adding mediated devices to the VFIO
-group when devices are bound to the driver and removing mediated devices from
-the VFIO when devices are unbound from the driver.
+The mediated bus driver's probe function should create a vfio_device on top of
+the mdev_device and connect it to an appropriate implementation of vfio_device_ops.
 
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
+This will provide the 'mdev_supported_types/XX/create' files which can then be used
+to trigger the creation of a mdev_device. The created mdev_device will be attached
+to the specified driver.
 
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
index f95d01b57fb168..7e918241de10cc 100644
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
index 0012a9ee7cb0a4..12091e32afa396 100644
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
