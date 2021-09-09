Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46140405D92
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2686E917;
	Thu,  9 Sep 2021 19:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2346E90F;
 Thu,  9 Sep 2021 19:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLeGwE9GtlwOBlK406oiGIJaHckbMKmYLdSqL/ZDFaOslTtizTemYRq38dPUGXTjx/RebsSHeyWb4KiwB7t/nfrwfzDQfrlYnrgGtLjZaN5PS4u2GEAFx0FRCOKDn9Y7cQ745p5ZZ5YSFz6Ul6Wgpwm7Uxhs26Pq6ykquXMZ2EgKxNtkH9w037GHbOPTBGorjDgqtdu1ZfTCcHkxns6ly8XiVn5gsqBDozdBBHrsSOdVJir40QrKN31vq9jGjbCx30XSfa0kfiVxodRskvsuzs3nNstygcIicGWOGhxDrDOpbPZLCtdNJH9q1xAq0XDP8QrgL5N4AE2QnLHLvg9HLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=R84WJaW/KAq/cpRdkgMXBI+GGVfkzaF7/nuR8H6jWxc=;
 b=axuPY1Ms6/pdxphyL6luFRVeTH3ltvq16yYgmUGfD0F8XKBG0sUk4xDtCKPu9NQuZIHxGlNJJwjFBBeiXucLpW3bBuHsm4l8eBGLeEPA4lEk7pzxGwRTS4cmdyAsmdcuOuNGvRf03ZeAr550X4Vtd8vaD0R6D2QavnPsjFFEl980HURP65/0aNg9oi9xWsZH6UtUOWMBrvXgnCgd40BGQeljybuamJmdiKqYi7VmQixzaLM2aqO190xpmoK3QkMwg9TTC2kISTN3H2Jy21lIp/VMFM+HEgQgbzLCB4f/l/VDlcJMzJ9Xxx+WeBa3aMs1l4C8d+bFzFcyDEevclWa3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R84WJaW/KAq/cpRdkgMXBI+GGVfkzaF7/nuR8H6jWxc=;
 b=pGO9pYbltptwlDc1KbrrMektgZlnh1C0fWOvNVCu2RDzmbnGRt9NrT/77q33/HKAeRokAMqqlAc2WY4Qw2SGaMqKkhU/WMek20QEGm/+XXpjw4OWyAOBjMSs7BjqdBZyDup0LNR3N66X4lwhpmYF9Q8R5Y3izn9nXXmS+N0Oo+t3x2jMxBW1hlCeFomL4GPk54t1eDlJ9t88luI+q2uxaz/o8BLg0D/bOqYTetvaHNnCrcRYzr3JQHOdtq6IsHhbXvz6CuBFal4frSS5QgPo3qmoet4ASS/BF7PSaKG9Cwt61JGFfW/lYSD3/5OjiPGGsguKwJt7tIDKoh7IVaWnNQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5507.namprd12.prod.outlook.com (2603:10b6:208:1c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 19:38:53 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 19:38:53 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 3/9] vfio/ccw: Convert to use vfio_register_group_dev()
Date: Thu,  9 Sep 2021 16:38:43 -0300
Message-Id: <3-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0003.namprd17.prod.outlook.com
 (2603:10b6:208:15e::16) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR17CA0003.namprd17.prod.outlook.com (2603:10b6:208:15e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 19:38:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLEv-H2; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44696f37-1424-4133-d9b1-08d973c97422
X-MS-TrafficTypeDiagnostic: BL0PR12MB5507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55076BDAB398E01664EE2B76C2D59@BL0PR12MB5507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NZnACsnv/9SqklFqOm7pWnKBtX01TsIls1Lmqz5T8j/QEbOi/wu/+QCKRGdiNmNL7IBMqanFBEOR278Pa54zIGjj3uPWx6DpLbDA0czBMT5WoF0Nx1n0rh1Trc/py1/reiIRzJAM4SYlvUNxQHwh+QuUF7J8oqwyXjbojxsZ0cpEV4oMJi1Meq8kT7XcGwhTiCFZEVIQbZW62JPOf6OrisM5n9rRPIrgAdtKZEzZpQNsoYUKRo8jjPMt9xXk/koRNPqeaULOiaAfPEmY8ZttA+Axx2Oqd4wvJwKV58aiFnWCbQi6TmR27x/OwyOBylzqsHF5RNhs5FdPD6nFLQBxzfuRIU4oLOHHgrcwSaXapei/ZnT2NW3dbRME7vGT+tQrs188uGr+AGkZW1Xh5of4GFuUpTbRkMaRmZjzRwRDbkw7pBtpvDLFVzL6qRtoVE6zfsYrQTELRURGMP+c02cxtD8eJaqMJWJr81xdaGNc/bSIZHq0mO6V0P6bayHtVC0FzFL0kCmlViKgowf/dSOXrsGL52pB3uOv84G3Da+uQaO5/1bZOXgs7xoodrli4XiLli6b/eztIWpGfANkQt39DmOzNiVskp0AbftwPj3R7pudHNTALrSg0DRSm+P8ssYbzG+b3WMKL28Pk/TqdyXQDjLkOpEScj7ccNFLLoi9ccv0dVacNdzlcRlxvjzr914qVFMFGJHYNpCTWCmG7d7qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(8676002)(66476007)(478600001)(4326008)(66946007)(66556008)(30864003)(8936002)(921005)(5660300002)(186003)(26005)(86362001)(83380400001)(7416002)(2906002)(36756003)(426003)(2616005)(9746002)(9786002)(110136005)(6666004)(38100700002)(316002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GlJgKw6w6JWxx3N7HmUNQyrxNPUxSLH8yhUrhIoByIN3rXgUfhgl9pEJPk61ijNbO3RzSu+fih64jtP4I9pCqdWWhOLmM4JkrvUowB02qpJmyzbXboIoKB89NCoDWKhs5XT5+0MQqW7iVZsQtSS0+MG2SF/m7t2Ddqqs2Xa27X5BB5DyF1A22AGz6180xQPIwtUTK1T0/Gp6daHV/tUgLglgfSuMhjkidckkLZ9A0v6PAF2SYJwDIAu/XYTuzrzflGAkBruQtTgwrqo7NBRkZOo2Mzl0VUx9kimwTu8OX49OYFuhZlMgA0aE8TyiN2z5wZDnprz9gmL9uy6mxPzOpyaMa/EH2x0hhJjuwry/dTdcDaeSVNej5gr+LMb2SL9EKUUYqkbSr/4BEiuZ/QHGt7LqFCpyh2zsoLdVTgkRnfMed20Lm8DYA0jn0V/ykQOIRv+bQaavYPR97xPPMNOziRN5iiYIiifHJHXDQAlF7ktb6JnsbQC8wLeFmspqRu/R/xIeBvsm1IwnFPLLzPH9omT269CTq2iXRMTpk07dSL2AbEoIpp8SGRKGdlYwIeZJ4IprfHQEovQe+jdtMcsjc3qa0fETEdguXsvNHDl2gKHkSQXkGx8EmGCtD9tAC5uDWBZwyn8egggpScjPSYoNTDbFu+kYyobCwMkHvRBlIZz2bXuK9miG+Kuu6QtHZGQpnuqD/CWGHgpIsvEhBHFM3V4zqMU7UMiB1sIpjqNjJW0j86m0UGk5o50v8iTXNYOM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44696f37-1424-4133-d9b1-08d973c97422
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:52.7102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1UYxlCTBRwp8LdcgXG3GDtD5x3RX/6hfgnnGrGFxjugzdFN0dklCsr2+hU4XqE2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5507
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

This is a more complicated conversion because vfio_ccw is sharing the
vfio_device between both the mdev_device, its vfio_device and the
css_driver.

The mdev is a singleton, and the reason for this sharing is so the extra
css_driver function callbacks to be delivered to the vfio_device
implementation.

This keeps things as they are, with the css_driver allocating the
singleton, not the mdev_driver. Following patches work to clean this
further.

Embed the vfio_device in the vfio_ccw_private and instantiate it as a
vfio_device when the mdev probes. The drvdata of both the css_device and
the mdev_device point at the private, and container_of is used to get it
back from the vfio_device.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     |  21 ++++--
 drivers/s390/cio/vfio_ccw_ops.c     | 107 +++++++++++++++++-----------
 drivers/s390/cio/vfio_ccw_private.h |   5 ++
 3 files changed, 85 insertions(+), 48 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 1e8d3151e5480e..396e815f81f8a4 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -469,7 +469,7 @@ static int __init vfio_ccw_sch_init(void)
 	vfio_ccw_work_q = create_singlethread_workqueue("vfio-ccw");
 	if (!vfio_ccw_work_q) {
 		ret = -ENOMEM;
-		goto out_err;
+		goto out_regions;
 	}
 
 	vfio_ccw_io_region = kmem_cache_create_usercopy("vfio_ccw_io_region",
@@ -478,7 +478,7 @@ static int __init vfio_ccw_sch_init(void)
 					sizeof(struct ccw_io_region), NULL);
 	if (!vfio_ccw_io_region) {
 		ret = -ENOMEM;
-		goto out_err;
+		goto out_regions;
 	}
 
 	vfio_ccw_cmd_region = kmem_cache_create_usercopy("vfio_ccw_cmd_region",
@@ -487,7 +487,7 @@ static int __init vfio_ccw_sch_init(void)
 					sizeof(struct ccw_cmd_region), NULL);
 	if (!vfio_ccw_cmd_region) {
 		ret = -ENOMEM;
-		goto out_err;
+		goto out_regions;
 	}
 
 	vfio_ccw_schib_region = kmem_cache_create_usercopy("vfio_ccw_schib_region",
@@ -497,7 +497,7 @@ static int __init vfio_ccw_sch_init(void)
 
 	if (!vfio_ccw_schib_region) {
 		ret = -ENOMEM;
-		goto out_err;
+		goto out_regions;
 	}
 
 	vfio_ccw_crw_region = kmem_cache_create_usercopy("vfio_ccw_crw_region",
@@ -507,19 +507,25 @@ static int __init vfio_ccw_sch_init(void)
 
 	if (!vfio_ccw_crw_region) {
 		ret = -ENOMEM;
-		goto out_err;
+		goto out_regions;
 	}
 
+	ret = mdev_register_driver(&vfio_ccw_mdev_driver);
+	if (ret)
+		goto out_regions;
+
 	isc_register(VFIO_CCW_ISC);
 	ret = css_driver_register(&vfio_ccw_sch_driver);
 	if (ret) {
 		isc_unregister(VFIO_CCW_ISC);
-		goto out_err;
+		goto out_driver;
 	}
 
 	return ret;
 
-out_err:
+out_driver:
+	mdev_unregister_driver(&vfio_ccw_mdev_driver);
+out_regions:
 	vfio_ccw_destroy_regions();
 	destroy_workqueue(vfio_ccw_work_q);
 	vfio_ccw_debug_exit();
@@ -528,6 +534,7 @@ static int __init vfio_ccw_sch_init(void)
 
 static void __exit vfio_ccw_sch_exit(void)
 {
+	mdev_unregister_driver(&vfio_ccw_mdev_driver);
 	css_driver_unregister(&vfio_ccw_sch_driver);
 	isc_unregister(VFIO_CCW_ISC);
 	vfio_ccw_destroy_regions();
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 1edbea9de0ec42..3a66e4fb18244c 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -17,6 +17,8 @@
 
 #include "vfio_ccw_private.h"
 
+static const struct vfio_device_ops vfio_ccw_dev_ops;
+
 static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
 {
 	struct subchannel *sch;
@@ -111,10 +113,10 @@ static struct attribute_group *mdev_type_groups[] = {
 	NULL,
 };
 
-static int vfio_ccw_mdev_create(struct mdev_device *mdev)
+static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 {
-	struct vfio_ccw_private *private =
-		dev_get_drvdata(mdev_parent_dev(mdev));
+	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
+	int ret;
 
 	if (private->state == VFIO_CCW_STATE_NOT_OPER)
 		return -ENODEV;
@@ -122,6 +124,10 @@ static int vfio_ccw_mdev_create(struct mdev_device *mdev)
 	if (atomic_dec_if_positive(&private->avail) < 0)
 		return -EPERM;
 
+	memset(&private->vdev, 0, sizeof(private->vdev));
+	vfio_init_group_dev(&private->vdev, &mdev->dev,
+			    &vfio_ccw_dev_ops);
+
 	private->mdev = mdev;
 	private->state = VFIO_CCW_STATE_IDLE;
 
@@ -130,19 +136,31 @@ static int vfio_ccw_mdev_create(struct mdev_device *mdev)
 			   private->sch->schid.ssid,
 			   private->sch->schid.sch_no);
 
+	ret = vfio_register_group_dev(&private->vdev);
+	if (ret)
+		goto err_atomic;
+	dev_set_drvdata(&mdev->dev, private);
 	return 0;
+
+err_atomic:
+	vfio_uninit_group_dev(&private->vdev);
+	atomic_inc(&private->avail);
+	private->mdev = NULL;
+	private->state = VFIO_CCW_STATE_IDLE;
+	return ret;
 }
 
-static int vfio_ccw_mdev_remove(struct mdev_device *mdev)
+static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 {
-	struct vfio_ccw_private *private =
-		dev_get_drvdata(mdev_parent_dev(mdev));
+	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
 
 	VFIO_CCW_MSG_EVENT(2, "mdev %pUl, sch %x.%x.%04x: remove\n",
 			   mdev_uuid(mdev), private->sch->schid.cssid,
 			   private->sch->schid.ssid,
 			   private->sch->schid.sch_no);
 
+	vfio_unregister_group_dev(&private->vdev);
+
 	if ((private->state != VFIO_CCW_STATE_NOT_OPER) &&
 	    (private->state != VFIO_CCW_STATE_STANDBY)) {
 		if (!vfio_ccw_sch_quiesce(private->sch))
@@ -150,23 +168,22 @@ static int vfio_ccw_mdev_remove(struct mdev_device *mdev)
 		/* The state will be NOT_OPER on error. */
 	}
 
+	vfio_uninit_group_dev(&private->vdev);
 	cp_free(&private->cp);
 	private->mdev = NULL;
 	atomic_inc(&private->avail);
-
-	return 0;
 }
 
-static int vfio_ccw_mdev_open_device(struct mdev_device *mdev)
+static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 {
 	struct vfio_ccw_private *private =
-		dev_get_drvdata(mdev_parent_dev(mdev));
+		container_of(vdev, struct vfio_ccw_private, vdev);
 	unsigned long events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
 	int ret;
 
 	private->nb.notifier_call = vfio_ccw_mdev_notifier;
 
-	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
+	ret = vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
 				     &events, &private->nb);
 	if (ret)
 		return ret;
@@ -187,15 +204,15 @@ static int vfio_ccw_mdev_open_device(struct mdev_device *mdev)
 
 out_unregister:
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
+	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
 				 &private->nb);
 	return ret;
 }
 
-static void vfio_ccw_mdev_close_device(struct mdev_device *mdev)
+static void vfio_ccw_mdev_close_device(struct vfio_device *vdev)
 {
 	struct vfio_ccw_private *private =
-		dev_get_drvdata(mdev_parent_dev(mdev));
+		container_of(vdev, struct vfio_ccw_private, vdev);
 
 	if ((private->state != VFIO_CCW_STATE_NOT_OPER) &&
 	    (private->state != VFIO_CCW_STATE_STANDBY)) {
@@ -206,8 +223,7 @@ static void vfio_ccw_mdev_close_device(struct mdev_device *mdev)
 
 	cp_free(&private->cp);
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
-				 &private->nb);
+	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY, &private->nb);
 }
 
 static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *private,
@@ -231,15 +247,14 @@ static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *private,
 	return ret;
 }
 
-static ssize_t vfio_ccw_mdev_read(struct mdev_device *mdev,
+static ssize_t vfio_ccw_mdev_read(struct vfio_device *vdev,
 				  char __user *buf,
 				  size_t count,
 				  loff_t *ppos)
 {
+	struct vfio_ccw_private *private =
+		container_of(vdev, struct vfio_ccw_private, vdev);
 	unsigned int index = VFIO_CCW_OFFSET_TO_INDEX(*ppos);
-	struct vfio_ccw_private *private;
-
-	private = dev_get_drvdata(mdev_parent_dev(mdev));
 
 	if (index >= VFIO_CCW_NUM_REGIONS + private->num_regions)
 		return -EINVAL;
@@ -284,15 +299,14 @@ static ssize_t vfio_ccw_mdev_write_io_region(struct vfio_ccw_private *private,
 	return ret;
 }
 
-static ssize_t vfio_ccw_mdev_write(struct mdev_device *mdev,
+static ssize_t vfio_ccw_mdev_write(struct vfio_device *vdev,
 				   const char __user *buf,
 				   size_t count,
 				   loff_t *ppos)
 {
+	struct vfio_ccw_private *private =
+		container_of(vdev, struct vfio_ccw_private, vdev);
 	unsigned int index = VFIO_CCW_OFFSET_TO_INDEX(*ppos);
-	struct vfio_ccw_private *private;
-
-	private = dev_get_drvdata(mdev_parent_dev(mdev));
 
 	if (index >= VFIO_CCW_NUM_REGIONS + private->num_regions)
 		return -EINVAL;
@@ -510,12 +524,12 @@ void vfio_ccw_unregister_dev_regions(struct vfio_ccw_private *private)
 	private->region = NULL;
 }
 
-static ssize_t vfio_ccw_mdev_ioctl(struct mdev_device *mdev,
+static ssize_t vfio_ccw_mdev_ioctl(struct vfio_device *vdev,
 				   unsigned int cmd,
 				   unsigned long arg)
 {
 	struct vfio_ccw_private *private =
-		dev_get_drvdata(mdev_parent_dev(mdev));
+		container_of(vdev, struct vfio_ccw_private, vdev);
 	int ret = 0;
 	unsigned long minsz;
 
@@ -606,37 +620,48 @@ static ssize_t vfio_ccw_mdev_ioctl(struct mdev_device *mdev,
 }
 
 /* Request removal of the device*/
-static void vfio_ccw_mdev_request(struct mdev_device *mdev, unsigned int count)
+static void vfio_ccw_mdev_request(struct vfio_device *vdev, unsigned int count)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(mdev_parent_dev(mdev));
-
-	if (!private)
-		return;
+	struct vfio_ccw_private *private =
+		container_of(vdev, struct vfio_ccw_private, vdev);
+	struct device *dev = vdev->dev;
 
 	if (private->req_trigger) {
 		if (!(count % 10))
-			dev_notice_ratelimited(mdev_dev(private->mdev),
+			dev_notice_ratelimited(dev,
 					       "Relaying device request to user (#%u)\n",
 					       count);
 
 		eventfd_signal(private->req_trigger, 1);
 	} else if (count == 0) {
-		dev_notice(mdev_dev(private->mdev),
+		dev_notice(dev,
 			   "No device request channel registered, blocked until released by user\n");
 	}
 }
 
+static const struct vfio_device_ops vfio_ccw_dev_ops = {
+	.open_device = vfio_ccw_mdev_open_device,
+	.close_device = vfio_ccw_mdev_close_device,
+	.read = vfio_ccw_mdev_read,
+	.write = vfio_ccw_mdev_write,
+	.ioctl = vfio_ccw_mdev_ioctl,
+	.request = vfio_ccw_mdev_request,
+};
+
+struct mdev_driver vfio_ccw_mdev_driver = {
+	.driver = {
+		.name = "vfio_ccw_mdev",
+		.owner = THIS_MODULE,
+		.mod_name = KBUILD_MODNAME,
+	},
+	.probe = vfio_ccw_mdev_probe,
+	.remove = vfio_ccw_mdev_remove,
+};
+
 static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
 	.owner			= THIS_MODULE,
+	.device_driver		= &vfio_ccw_mdev_driver,
 	.supported_type_groups  = mdev_type_groups,
-	.create			= vfio_ccw_mdev_create,
-	.remove			= vfio_ccw_mdev_remove,
-	.open_device		= vfio_ccw_mdev_open_device,
-	.close_device		= vfio_ccw_mdev_close_device,
-	.read			= vfio_ccw_mdev_read,
-	.write			= vfio_ccw_mdev_write,
-	.ioctl			= vfio_ccw_mdev_ioctl,
-	.request		= vfio_ccw_mdev_request,
 };
 
 int vfio_ccw_mdev_reg(struct subchannel *sch)
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index b2c762eb42b9bb..7272eb78861244 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -17,6 +17,7 @@
 #include <linux/eventfd.h>
 #include <linux/workqueue.h>
 #include <linux/vfio_ccw.h>
+#include <linux/vfio.h>
 #include <asm/crw.h>
 #include <asm/debug.h>
 
@@ -67,6 +68,7 @@ struct vfio_ccw_crw {
 
 /**
  * struct vfio_ccw_private
+ * @vdev: Embedded VFIO device
  * @sch: pointer to the subchannel
  * @state: internal state of the device
  * @completion: synchronization helper of the I/O completion
@@ -90,6 +92,7 @@ struct vfio_ccw_crw {
  * @crw_work: work for deferral process of CRW handling
  */
 struct vfio_ccw_private {
+	struct vfio_device vdev;
 	struct subchannel	*sch;
 	int			state;
 	struct completion	*completion;
@@ -121,6 +124,8 @@ extern void vfio_ccw_mdev_unreg(struct subchannel *sch);
 
 extern int vfio_ccw_sch_quiesce(struct subchannel *sch);
 
+extern struct mdev_driver vfio_ccw_mdev_driver;
+
 /*
  * States of the device statemachine.
  */
-- 
2.33.0

