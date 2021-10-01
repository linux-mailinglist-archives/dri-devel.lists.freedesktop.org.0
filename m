Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63741F3D6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E976EE99;
	Fri,  1 Oct 2021 17:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF24A6EE8E;
 Fri,  1 Oct 2021 17:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Af552iG898c5YqGxVVeudiaOpp5Pcgyhvm8L7n94fEAKtKFKYi9hEyDumj3h+aRkclZeFOclRlC8aEM2LD1IAoaLcFwtkFJIo1+agUKhm87nMQvbpwiqdETBgB5Qx03XIeMJrkvDqRKppT2rzDtrBTUkRiyyTu7W16QNWxNqMuVUCF5DRVrzHhHlgOhB/TLfveqhaYNrcGMtDDEWGYm0jbdoB78NtIA73s5dRrCjJaWolgUpYonSFm8OCCYYdzrhBz44FnzG7uA7UeiuykH+NkVongGmrHlIxVf8MNaHTIL3WkxKz3t7upNr+NPjbrFgH6dOCDsXPJspbsXMX+KJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdC4E8yZ8e1Iko3PPF8d683FmazY5roIrUlwq/k3ghw=;
 b=MsJVrlKjnmpRgX4oDeuSUgHUpHCXl8qi34hhIBpNS79zomIvFKHhMG5mzTMrq4RRz2yeK1bbb47DBST+9oDvyC9Q/c8u5Sie2LHhb64ypq307ZD9NMzhB/Fie6k4aNDg97Vnkrjg4aI2TXdTS4wv9+fCdgd1//cZurwTA/1HhealS//0pjdYmV3zXFONOLnxs+oFylD8eBBJo+yRZf7rODVMrSDnCa15V1VNUcubSn/V5BSEi3qZXuNNoQfOD4FJ54VUvbDNBcIxJs5JNi3bsG8WXmJB1O4aRIUG3G9cEdm1zIBlN6jVXTcA423qHbJF5uwf5InBgTVtVeZZLTc6EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdC4E8yZ8e1Iko3PPF8d683FmazY5roIrUlwq/k3ghw=;
 b=MwfYkaS9WYDimhWdDP3KtHPR/D0Cp+534epVDmwto/LBNmX4L/h3jMrv7K9kOUiiS9KL5R+lEy0djEaH44lvp5GCATIagJh5Q9dm5ddoi3A3UWZcpwMmc71VhD+bcARPimqh5Bcuig7b+eZcEFJUbmV9et1GDsKDOvk9Wn4E0EQ/iicmp8V/QDLOUBtvuPaum6GeJAMArmG8WA/l3lBZqbfj+Jdu0qzhLtw7wkzVtYOpqCkPdG7JVylHIYVjsH7exetfoDCPcIQ8uY+h+izzaJ3RLwKu2rBonUUGRF4WDbQdP6/j21lOP1ohb16vpnhoDu5UyNlOd16uZCIBbiKueQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 17:52:55 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 17:52:55 +0000
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
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 04/10] vfio/ccw: Convert to use
 vfio_register_emulated_iommu_dev()
Date: Fri,  1 Oct 2021 14:52:45 -0300
Message-Id: <4-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0059.namprd19.prod.outlook.com
 (2603:10b6:208:19b::36) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR19CA0059.namprd19.prod.outlook.com (2603:10b6:208:19b::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-00989D-3V; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7f91251-5575-4337-d682-08d985044ae0
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB520798E92A4589F9A0FC3D8FC2AB9@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/heFFRQg4DuHGnjn4k+qAam3mggCwkgGvyuH2kDT8kDj2TBdJvE39i+9Esj6JyZrgf2/perzFGooWqA/kyv+Anlt0OpfwLXlMMdWsaZ0bNl0jXN3G+r/vFZ4QhsA6CkN+GfSBP66yVGbam9k5H7oqxUQrjHuNmIe66vejl0zjLX8WoaJpWqcL1TftFh1B7UHiwJb7RWVYYXizy+9abkjk8PE27vGvfIWXSuwsABhRXiGlE7sRFYZQxV2EYgIWHVysadCFJbO29CBnSe+5AkerXy0yfxPCR/g0TALQPdKIJoMv3TDfPHqnzgWtAs4gE1WOmbNdhIuMtLW1JKgs3iU4wiYm5adHkbGrpRcLyXs0xBP1VvuFX/gPBwnD4ThIlIMWPc3Occ1QHieLxhuFC/hA5o6N5J+rHg6nZ+6pUjFWYnVaZhyHdllsJERmkNsI+kmIuXzsAgVSVQuysAe/HMJtwPvZGNkIZfaxb5AVjBr2KEvpYbmeSHU7KkEVeMBnzKiy43f1EgeU2cnuxlQjy3LyhAngV6JW+6zTSOQlkp+70j25ntVKQVAHmWzdKfJVHJfuD+bp7PFa8fkm7eEn1qlgw9f3TGkfz3QUBdF7Pf7KRx5WmRlPcT9wZue4/S+5Pm7ZsSkDM7rwLXnVRxa3CSqsDPYE900AOeCU0iWzR9XZq0A9n+99Of+vpZgxEUlG4Wm6+Yamox0hGWca67kc2v/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(83380400001)(66556008)(8676002)(38100700002)(66476007)(5660300002)(2616005)(508600001)(426003)(9786002)(26005)(186003)(6666004)(9746002)(54906003)(36756003)(7416002)(4326008)(110136005)(86362001)(8936002)(921005)(30864003)(316002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aHTAhoMrxd3CwIejBkop3m0y08UgVydX7EOWhCzdwJXbQh9czbO8YYrgfWrM?=
 =?us-ascii?Q?U/1erMxoQZUeWaM6eQXWA65OKojNs9vfZSx51f+NoF5VBmhwcrGQKadKTIQJ?=
 =?us-ascii?Q?TWU4IvRKWPT5pHMeBD9QYREawS+lDM0gxHf08CnKwGz/n/e6ijd1xCDZyq11?=
 =?us-ascii?Q?ywUg2CYrsHXh2cLO8Dw0fhiawZ24Zg8fY42DGQNTtXjGFLnL4NVGIiSPUCvH?=
 =?us-ascii?Q?xOmUAXth5mt41e5R3cW8jowwPKekt44QH1nKO5MFfruwgFlGv+qzF/4LcAK8?=
 =?us-ascii?Q?6IhQIn+HiwZZ9DXH0o5w8KET6yV8yRxtavn7U2NRLsDrtBuQtRKP2KwlMD0V?=
 =?us-ascii?Q?Ke7syt804B2CVYhKXc80dSSrlEJP8u2vzaPsWbUiV/TItzJNWDB9qE6ZXwWx?=
 =?us-ascii?Q?p/sb8j9J/TQ9sJuJxWBqP120yvfmPnlvtL8Mo7p8oqIOOTZXHdt7uLIM1rpK?=
 =?us-ascii?Q?TqCZHM8yjUEzWmQw0uKF7yeimRkIcVUHATRxAuLKgnKZNyh56wIJQeInTwTH?=
 =?us-ascii?Q?GThiVAoR9YQ82SPVLzGFXQDjnbEIw8B5WjStu1Qyz7Xy6HuHSn0UKNhReoHz?=
 =?us-ascii?Q?mf3CqyqhmooflWE3cCfDSea8JpWugOfFbA4GsL4mGwBcOplWZqKckxDJi4gS?=
 =?us-ascii?Q?9ZgmvbBpFDKF5BSrS18Apr0ZO4bQnZPMy2c6nIjzsJCMUjfoHh34izguMcbg?=
 =?us-ascii?Q?PfAQHdCKONP/+yfiAzUKzzomFskDqItI/Mnysy7vvRUU5DC81hPH9lCfegTn?=
 =?us-ascii?Q?/BTBs2JdcbkFt9E3EG2g8mzPBfd52I2VlbUvJNuljIE/b00+T/3iENvHpnIk?=
 =?us-ascii?Q?hyAVDqOXvJCHfppshMdx4TLAjMOIziS1npJD/ny13c1sz4ZD2DAIsuFgktEj?=
 =?us-ascii?Q?dUys2QGxHKaW0sZ+/hzz+8vmlhrRr78StcUAVkgfxpFWM3f2eUw4KwLkPI22?=
 =?us-ascii?Q?6imC7IRAhNMu4irOFv6J5Ah+NOrW/iRh0TX9kUFwvIUjMPCrGzRNGZKdBH8w?=
 =?us-ascii?Q?2Ld+Sq7x2Oq35pAiTUZBMiKOJxXQTsFWU4q5Kmjy2O1o75Cl1oN2/sX9sRks?=
 =?us-ascii?Q?B/BzJPCFBz7zu5XbyvQ8jNn2m1b8VRVmrrmgpdNNzdxVnY19ahPUOVeVL4tU?=
 =?us-ascii?Q?M3zAJloeBjPOGVr6X3mSFFo7vm9BLaFnBLSvMUsECVmnWVD2l6wHvxVTMu+4?=
 =?us-ascii?Q?SS6l+cTJSMBzY8p1G19e4QEhkQeY3jmyJp4hTBIwWsF/tOlz2B1Zw14ipdR6?=
 =?us-ascii?Q?nQFTdPCBMWgnWm7dbt4GoWhfmMy0YuGaQhM2GY4xZAIGgnVEXGnRAVyPZWEn?=
 =?us-ascii?Q?9aTj2QIwqB5a46jnNqUMtFEw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f91251-5575-4337-d682-08d985044ae0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:53.4249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+fPTCRa65nJafn/C1pTR3NjAqS/eg/UA12DZ7rv6hGJ4PlAG5PJIGukFxiGsgPv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
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
index e32678a71644fb..0407427770955d 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -468,7 +468,7 @@ static int __init vfio_ccw_sch_init(void)
 	vfio_ccw_work_q = create_singlethread_workqueue("vfio-ccw");
 	if (!vfio_ccw_work_q) {
 		ret = -ENOMEM;
-		goto out_err;
+		goto out_regions;
 	}
 
 	vfio_ccw_io_region = kmem_cache_create_usercopy("vfio_ccw_io_region",
@@ -477,7 +477,7 @@ static int __init vfio_ccw_sch_init(void)
 					sizeof(struct ccw_io_region), NULL);
 	if (!vfio_ccw_io_region) {
 		ret = -ENOMEM;
-		goto out_err;
+		goto out_regions;
 	}
 
 	vfio_ccw_cmd_region = kmem_cache_create_usercopy("vfio_ccw_cmd_region",
@@ -486,7 +486,7 @@ static int __init vfio_ccw_sch_init(void)
 					sizeof(struct ccw_cmd_region), NULL);
 	if (!vfio_ccw_cmd_region) {
 		ret = -ENOMEM;
-		goto out_err;
+		goto out_regions;
 	}
 
 	vfio_ccw_schib_region = kmem_cache_create_usercopy("vfio_ccw_schib_region",
@@ -496,7 +496,7 @@ static int __init vfio_ccw_sch_init(void)
 
 	if (!vfio_ccw_schib_region) {
 		ret = -ENOMEM;
-		goto out_err;
+		goto out_regions;
 	}
 
 	vfio_ccw_crw_region = kmem_cache_create_usercopy("vfio_ccw_crw_region",
@@ -506,19 +506,25 @@ static int __init vfio_ccw_sch_init(void)
 
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
 	css_driver_unregister(&vfio_ccw_sch_driver);
+	mdev_unregister_driver(&vfio_ccw_mdev_driver);
 	isc_unregister(VFIO_CCW_ISC);
 	vfio_ccw_destroy_regions();
 	destroy_workqueue(vfio_ccw_work_q);
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 1edbea9de0ec42..d8589afac272f1 100644
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
 
+	ret = vfio_register_emulated_iommu_dev(&private->vdev);
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

