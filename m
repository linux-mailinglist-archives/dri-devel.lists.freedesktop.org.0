Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D341A3D9A7A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7096EB94;
	Thu, 29 Jul 2021 00:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989B76EB7E;
 Thu, 29 Jul 2021 00:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSKveLdfbBr0H+1m9xZVRMoXzDUdZMXvvSZhg14o1vKZnKy5s+hkqR3PWh6fULrB/FZxZPSVDEvG+XWncf1pWvred5nEsGQ51zawzaxyo4eX79UrHNr0jYk/BD0HGjISfKjYuhNPecybDE1Qrc/0t8Lzd2JRzItN1DMR6YIKMXtHNqUrjVi7hmhmXAioSrHFPir/OlU+5Q0Lczhf+K2rXvO80dJEjy5XJhmi9uqDKxTAEGRcKSweX0Ikysig6+YtmFtcwIRD/Lw3QNbXGVxcm872fPCpIxmceUSNGlb1kZNkWJB5AIQ01AVnue0V31DMUABObFFXqWddrgfhhkh3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkfoAJ4xhECdssjZdObBWe1NiwTtUKJep2eYcqBo5UI=;
 b=ALu+IBXLlkL3B5KV6spTWARelJZqKIoa3J/8JtDpXuR/t0nJPqFMdOnOOZ0zmGli0i+4n86kppB1MidJR3nTUlNl4WCpOAs7fSfWGhWwCduAFEYGJveDQJWfe2RNUyHoceg5D12Fb3QiQDUM1J2qIoeZaB5qWGqaTqfNx7WiXj4svhFL6BhSTvTsiE2GmC1QiN1GCB84Jr+D2CTUfPAZVtxyJtt+xML4aIh0iw8mPPoMGkjtT46hIOlFGyntdnfbLRW31HtIXaDTIHf+lO5S/7uP2QldWabpTk3YJiVA3c5ZDLfGlHLyzmZBsjsBHQ5TQUpLf7HEt9HXmLUPkeOajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkfoAJ4xhECdssjZdObBWe1NiwTtUKJep2eYcqBo5UI=;
 b=GOmNsQl0YIpzoBf4v5rJN0T8bqc9mOz7bYQaEnHvOuNpmOHRdPjkZukM/dQjNcOioo3zcSWKiNI/NmtjohVJ5wX1VcbyY4my7sXXIH04KQj1xFsOyj/Xu85MI7fFf94wNrFpK9Vw0JmROtC4hsJGw3TxiJcc4z+s2NKPYaTJqZjJkDg/nEFlb5VL6/KtkOcI4b/5KbTq2DQ9/beNWwuR2C8MZtCZV0xbqEN1VoswrgwSEXjjekOWDjxKw+xpAbcONvYDPxdqAyJxjnQFreVEVHY5AcQNkTO51fC9qMJvIe8sIrVH1ebszAbwxUbd5bE7OfbcT9AcvVyhlmCuSzIKXw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:32 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:32 +0000
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
Subject: [PATCH v3 06/14] vfio/fsl: Move to the device set infrastructure
Date: Wed, 28 Jul 2021 21:49:15 -0300
Message-Id: <6-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 00:49:29 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEm-009pn1-0Z; Wed, 28 Jul 2021 21:49:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 778d2109-2b3e-4b27-7f9a-08d9522ab919
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51601BC223DD131A2358862FC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ny+JkgMsYJj7UwyIuRujhIZsXrGep2YOgYUWJ7uF1Pn/jpSog3/mafTGQslH54CcC8NKWxjcyGJUjmW2PB4siuBNToz7C4bD5NozOMwQj4qnQIFnhlfNzfGCRflyJNEPsHTTy1ia+7/xB2KufEe3pd9F8nAGpAlBUNRyxwfbLyGouZrtbLk+EVUvkUXG4FisVvvxsqR8xPNWZdwy2tW30MotRVFGcvIUsl8AYjyxO/mzcCAf3viDLYegttH22O6mvn6u+Uh/wTnTRDfmiZEwYiIJVYTPGxJHjfzUW0FMR4ftUmkr24w6xqO52GPQvKpbNVJqfqr5PsyJuqQbhu82Jubm6diXErrTVUZLmM7mKQdtHRXDl7AukEElR48wUBxzKkjdZaDS8dUL+C4lRaK/t5gZEWnPMOxsbBg6h5dnseblzyfJmjibeBtfmAOJR1K+lmdWzuOYI+JOaXsfaXRPE+Gj13yTbMzLn4XdNY82NtEMHuwJYkf3cMb6SUDF/ItPpm9LnR0/jn3fSI6YQSWBzvu95n2F64WhIRx6REzMrI6taPGoa2DFMP9TPLtt1wLL8srRE4Gi5Zdl7l3m/xTkXU810W21q/zVUEZ3/wjAUy/q9yXHWiufY/eVMM6XUJCEk5FEvDqA9ytceiIYvPcxaXfmsxHY7BRSIzzbzpM94PI/6rSm44CANpH1BC3Jbtozr+hurU8HU41RkzPK29cM5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MwUYxrzyLDh5tczP/RoovqhHRnZ0TgYWVXLm01/etwWQlxPwDY4W7Ib7sz5N?=
 =?us-ascii?Q?agk2BWCQsQHNPoq6Gwhytk1ypg3tnc3cVPcA5jYSr7WtaASTcvcrPqtX7i3M?=
 =?us-ascii?Q?xZu421B5qTvSaKKNa4P9HDPGx3Jzw5W96Ya9f0RIXsCmrL6/3tKd7VkYdS6Z?=
 =?us-ascii?Q?WQWGYrSvmJDeojUuREOhoMSSpsvp2S3U6Vc45D/Mazf5ikezZw4XdG1aDSY2?=
 =?us-ascii?Q?MRiJLOKkc0Ut3XLP127WWsawMQc4waRuZM7duDptfnvxW+OjHY57KkAXXeTE?=
 =?us-ascii?Q?JmBzlSooYfCyK/NMSAIjqtGVF4+vztRKf4GsVk8nMd+wpVTSAWIVDrda2wFH?=
 =?us-ascii?Q?YJr+e5mhRCIaD1sASa5iVbHpMe7QCb10VXR6m/qxXlfOg7HeRGX52NLpmfSg?=
 =?us-ascii?Q?W+OpZ3bgJaLCJT2HhxzceFo8lSHj3bnnoDJ5CIlFd23Z8MIuYSgjteXDfH+V?=
 =?us-ascii?Q?/Dgc3j9a8kVfhwMIUzzqxT997d19wVkr2T9SvOLQs63XznEHP3APSX2hjVOj?=
 =?us-ascii?Q?r9Q3PRLnRkf6RJxT6HaiuqdlsPRXMYx+KJLfRxidHFoh0epKdc8r5UOYDOcK?=
 =?us-ascii?Q?w5l4cEYIWLckMCGjldk6jBHXp/u6r7lKZ0PixqDY0fTYWidPX1M491Y0EhTL?=
 =?us-ascii?Q?KA0zDYk5L9vd6z83Qb5O3TSM8n3tXAlnezX/GIOlnSb5xVnR0hQTTGtzy26W?=
 =?us-ascii?Q?R8Fwwgg625Hu8+A/di3u4K0TG/ATjlAr5JjYH+vhw9r5RjhnVRTYv5Xy6thl?=
 =?us-ascii?Q?+WUfralz9BkVuSzuAryYzVttmwVxG/SOAuIcU060vO5nzfES0tMPLIkOanJn?=
 =?us-ascii?Q?+KPA7HVFmWBuyUdMU+0Xy/HBgiN6a59GoGoItm+zaFF1CZLIBsfQ5W5AR+JN?=
 =?us-ascii?Q?SOMSZNPCrvD3aUg+Fa3uRXTON8cqqjHIJt8PCn18a2yNxWopaUs2m4SsI0JH?=
 =?us-ascii?Q?V5PI/+Ga2OT8xvC7WM45ttnU52aSLA8ly6TLQRH+0Hqey0xAGnUEmTv6hy6/?=
 =?us-ascii?Q?wsDtcjQ8y1MaF6HMRmeRAq0Ebi6KXzVtTUzceNlO5MN8+0CpHCchZF2eXtNH?=
 =?us-ascii?Q?qWrLD48FNgt7dLoY6viv634cssK8rr541fWvFCQGRZylm80mT6PXq/oL3BQC?=
 =?us-ascii?Q?DMizY8or467r+lIYcOtTopvT8LxDT8DrC8AuSneFu40d9hP1qNYCILM1s5fb?=
 =?us-ascii?Q?H4Kt1ixQf/4Hfz0JNXSjnp3vQUZaSaFHRw1vislHFAlm2It5drz7pOzniPwq?=
 =?us-ascii?Q?KqlVsnqhxN1sKyF+hAm7emTwo9zEDlKGoYVBBLuBu3xmZb9vIgIqvJg6QbFh?=
 =?us-ascii?Q?naP8zrhXZcx2VSmCBhf1uKDt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778d2109-2b3e-4b27-7f9a-08d9522ab919
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:29.9615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XzF93ii8zQnv3IBZgN6tgBVMOSTpw0CsIEnO2zihyNXx48ZzAnSDpzEsgR6y0l1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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

FSL uses the internal reflck to implement the open_device() functionality,
conversion to the core code is straightforward.

The decision on which set to be part of is trivially based on the
is_fsl_mc_bus_dprc() and we use a 'struct device *' pointer as the set_id.

The dev_set lock is protecting the interrupts setup. The FSL MC devices
are using MSIs and only the DPRC device is allocating the MSIs from the
MSI domain. The other devices just take interrupts from a pool. The lock
is protecting the access to this pool.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Tested-by: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c         | 154 ++++------------------
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c    |   6 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc_private.h |   7 -
 3 files changed, 28 insertions(+), 139 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 122997c61ba450..0ead91bfa83867 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -19,81 +19,10 @@
 
 static struct fsl_mc_driver vfio_fsl_mc_driver;
 
-static DEFINE_MUTEX(reflck_lock);
-
-static void vfio_fsl_mc_reflck_get(struct vfio_fsl_mc_reflck *reflck)
-{
-	kref_get(&reflck->kref);
-}
-
-static void vfio_fsl_mc_reflck_release(struct kref *kref)
-{
-	struct vfio_fsl_mc_reflck *reflck = container_of(kref,
-						      struct vfio_fsl_mc_reflck,
-						      kref);
-
-	mutex_destroy(&reflck->lock);
-	kfree(reflck);
-	mutex_unlock(&reflck_lock);
-}
-
-static void vfio_fsl_mc_reflck_put(struct vfio_fsl_mc_reflck *reflck)
-{
-	kref_put_mutex(&reflck->kref, vfio_fsl_mc_reflck_release, &reflck_lock);
-}
-
-static struct vfio_fsl_mc_reflck *vfio_fsl_mc_reflck_alloc(void)
-{
-	struct vfio_fsl_mc_reflck *reflck;
-
-	reflck = kzalloc(sizeof(*reflck), GFP_KERNEL);
-	if (!reflck)
-		return ERR_PTR(-ENOMEM);
-
-	kref_init(&reflck->kref);
-	mutex_init(&reflck->lock);
-
-	return reflck;
-}
-
-static int vfio_fsl_mc_reflck_attach(struct vfio_fsl_mc_device *vdev)
-{
-	int ret = 0;
-
-	mutex_lock(&reflck_lock);
-	if (is_fsl_mc_bus_dprc(vdev->mc_dev)) {
-		vdev->reflck = vfio_fsl_mc_reflck_alloc();
-		ret = PTR_ERR_OR_ZERO(vdev->reflck);
-	} else {
-		struct device *mc_cont_dev = vdev->mc_dev->dev.parent;
-		struct vfio_device *device;
-		struct vfio_fsl_mc_device *cont_vdev;
-
-		device = vfio_device_get_from_dev(mc_cont_dev);
-		if (!device) {
-			ret = -ENODEV;
-			goto unlock;
-		}
-
-		cont_vdev =
-			container_of(device, struct vfio_fsl_mc_device, vdev);
-		if (!cont_vdev || !cont_vdev->reflck) {
-			vfio_device_put(device);
-			ret = -ENODEV;
-			goto unlock;
-		}
-		vfio_fsl_mc_reflck_get(cont_vdev->reflck);
-		vdev->reflck = cont_vdev->reflck;
-		vfio_device_put(device);
-	}
-
-unlock:
-	mutex_unlock(&reflck_lock);
-	return ret;
-}
-
-static int vfio_fsl_mc_regions_init(struct vfio_fsl_mc_device *vdev)
+static int vfio_fsl_mc_open_device(struct vfio_device *core_vdev)
 {
+	struct vfio_fsl_mc_device *vdev =
+		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
 	struct fsl_mc_device *mc_dev = vdev->mc_dev;
 	int count = mc_dev->obj_desc.region_count;
 	int i;
@@ -136,58 +65,30 @@ static void vfio_fsl_mc_regions_cleanup(struct vfio_fsl_mc_device *vdev)
 	kfree(vdev->regions);
 }
 
-static int vfio_fsl_mc_open(struct vfio_device *core_vdev)
-{
-	struct vfio_fsl_mc_device *vdev =
-		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
-	int ret = 0;
-
-	mutex_lock(&vdev->reflck->lock);
-	if (!vdev->refcnt) {
-		ret = vfio_fsl_mc_regions_init(vdev);
-		if (ret)
-			goto out;
-	}
-	vdev->refcnt++;
-out:
-	mutex_unlock(&vdev->reflck->lock);
 
-	return ret;
-}
-
-static void vfio_fsl_mc_release(struct vfio_device *core_vdev)
+static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
 {
 	struct vfio_fsl_mc_device *vdev =
 		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
+	struct fsl_mc_device *mc_dev = vdev->mc_dev;
+	struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
+	struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
 	int ret;
 
-	mutex_lock(&vdev->reflck->lock);
-
-	if (!(--vdev->refcnt)) {
-		struct fsl_mc_device *mc_dev = vdev->mc_dev;
-		struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
-		struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
-
-		vfio_fsl_mc_regions_cleanup(vdev);
+	vfio_fsl_mc_regions_cleanup(vdev);
 
-		/* reset the device before cleaning up the interrupts */
-		ret = dprc_reset_container(mc_cont->mc_io, 0,
-		      mc_cont->mc_handle,
-			  mc_cont->obj_desc.id,
-			  DPRC_RESET_OPTION_NON_RECURSIVE);
+	/* reset the device before cleaning up the interrupts */
+	ret = dprc_reset_container(mc_cont->mc_io, 0, mc_cont->mc_handle,
+				   mc_cont->obj_desc.id,
+				   DPRC_RESET_OPTION_NON_RECURSIVE);
 
-		if (ret) {
-			dev_warn(&mc_cont->dev, "VFIO_FLS_MC: reset device has failed (%d)\n",
-				 ret);
-			WARN_ON(1);
-		}
+	if (WARN_ON(ret))
+		dev_warn(&mc_cont->dev,
+			 "VFIO_FLS_MC: reset device has failed (%d)\n", ret);
 
-		vfio_fsl_mc_irqs_cleanup(vdev);
+	vfio_fsl_mc_irqs_cleanup(vdev);
 
-		fsl_mc_cleanup_irq_pool(mc_cont);
-	}
-
-	mutex_unlock(&vdev->reflck->lock);
+	fsl_mc_cleanup_irq_pool(mc_cont);
 }
 
 static long vfio_fsl_mc_ioctl(struct vfio_device *core_vdev,
@@ -504,8 +405,8 @@ static int vfio_fsl_mc_mmap(struct vfio_device *core_vdev,
 
 static const struct vfio_device_ops vfio_fsl_mc_ops = {
 	.name		= "vfio-fsl-mc",
-	.open		= vfio_fsl_mc_open,
-	.release	= vfio_fsl_mc_release,
+	.open_device	= vfio_fsl_mc_open_device,
+	.close_device	= vfio_fsl_mc_close_device,
 	.ioctl		= vfio_fsl_mc_ioctl,
 	.read		= vfio_fsl_mc_read,
 	.write		= vfio_fsl_mc_write,
@@ -625,13 +526,16 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vdev->mc_dev = mc_dev;
 	mutex_init(&vdev->igate);
 
-	ret = vfio_fsl_mc_reflck_attach(vdev);
+	if (is_fsl_mc_bus_dprc(mc_dev))
+		ret = vfio_assign_device_set(&vdev->vdev, &mc_dev->dev);
+	else
+		ret = vfio_assign_device_set(&vdev->vdev, mc_dev->dev.parent);
 	if (ret)
 		goto out_uninit;
 
 	ret = vfio_fsl_mc_init_device(vdev);
 	if (ret)
-		goto out_reflck;
+		goto out_uninit;
 
 	ret = vfio_register_group_dev(&vdev->vdev);
 	if (ret) {
@@ -639,12 +543,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 		goto out_device;
 	}
 
-	/*
-	 * This triggers recursion into vfio_fsl_mc_probe() on another device
-	 * and the vfio_fsl_mc_reflck_attach() must succeed, which relies on the
-	 * vfio_add_group_dev() above. It has no impact on this vdev, so it is
-	 * safe to be after the vfio device is made live.
-	 */
 	ret = vfio_fsl_mc_scan_container(mc_dev);
 	if (ret)
 		goto out_group_dev;
@@ -655,8 +553,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vfio_unregister_group_dev(&vdev->vdev);
 out_device:
 	vfio_fsl_uninit_device(vdev);
-out_reflck:
-	vfio_fsl_mc_reflck_put(vdev->reflck);
 out_uninit:
 	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
@@ -675,7 +571,7 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
 
 	dprc_remove_devices(mc_dev, NULL, 0);
 	vfio_fsl_uninit_device(vdev);
-	vfio_fsl_mc_reflck_put(vdev->reflck);
+
 	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
 	vfio_iommu_group_put(mc_dev->dev.iommu_group, dev);
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c b/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
index 0d9f3002df7f51..77e584093a233d 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
@@ -120,7 +120,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
 	if (start != 0 || count != 1)
 		return -EINVAL;
 
-	mutex_lock(&vdev->reflck->lock);
+	mutex_lock(&vdev->vdev.dev_set->lock);
 	ret = fsl_mc_populate_irq_pool(mc_cont,
 			FSL_MC_IRQ_POOL_MAX_TOTAL_IRQS);
 	if (ret)
@@ -129,7 +129,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
 	ret = vfio_fsl_mc_irqs_allocate(vdev);
 	if (ret)
 		goto unlock;
-	mutex_unlock(&vdev->reflck->lock);
+	mutex_unlock(&vdev->vdev.dev_set->lock);
 
 	if (flags & VFIO_IRQ_SET_DATA_EVENTFD) {
 		s32 fd = *(s32 *)data;
@@ -154,7 +154,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
 	return 0;
 
 unlock:
-	mutex_unlock(&vdev->reflck->lock);
+	mutex_unlock(&vdev->vdev.dev_set->lock);
 	return ret;
 
 }
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h b/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
index 89700e00e77d10..4ad63ececb914b 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
@@ -22,11 +22,6 @@ struct vfio_fsl_mc_irq {
 	char            *name;
 };
 
-struct vfio_fsl_mc_reflck {
-	struct kref		kref;
-	struct mutex		lock;
-};
-
 struct vfio_fsl_mc_region {
 	u32			flags;
 	u32			type;
@@ -39,9 +34,7 @@ struct vfio_fsl_mc_device {
 	struct vfio_device		vdev;
 	struct fsl_mc_device		*mc_dev;
 	struct notifier_block        nb;
-	int				refcnt;
 	struct vfio_fsl_mc_region	*regions;
-	struct vfio_fsl_mc_reflck   *reflck;
 	struct mutex         igate;
 	struct vfio_fsl_mc_irq      *mc_irqs;
 };
-- 
2.32.0

