Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D510351CD75
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 02:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CBB10FDF9;
	Fri,  6 May 2022 00:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC87510FDC9;
 Fri,  6 May 2022 00:08:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1UoZeBlXwslVK1vQ1bbf3hrCzkAAzitfGiQWEAMNABkqlrMs0zKrOnu9crMYVzisMLm+EUqO/yYEM+ac1DlACY6JK5dQjJiQF2mBUtPBMWKiArUK39J0cAXv6IeahRLaBEh2qjagutY1QwCHziUpi4atDjWwanXJNWCLGuUvkPY5LB709LBY7pZi1Xngzt9x6/tGhcduxk4MTw3fcsv8dqN7DoswfHQHQbCnS1OKhwooDeM3H6DTF+m+F3BArKPJ42VIMCvyIVRZfmHeR8jE08qYBBM0Xjr5GiNOHAE5NnLBlZ8C5xG3f9wHSM1PS0ls22MaH9Wq4QfQAeBnnF0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=007v1D6OZ6VdXRrP2OlGA8BaIYAWfzduE7Z598Jqj6s=;
 b=iM2I2S2yMbFySK5qFmSYgh9y2Kx8n+yewT9n6mgW/Q8hbZOEU3I4UQRLpb5T+65IuBuyO+y1fwuPVra8RLH/EZAK4Rx27v9Xj0hf6MP0FpGTxE2mk6XAIfobMsUv/Grqyj5K8v1ku3hapabK+2UPByYsGGICBEBvEwadrEMy/TjPlFVZqL7zNc/XyxttwbqBLbiA3fyFy+WhVeoeNnhjxUn2r0w/Qta6ok0HHSU9XctPai2ohSVgP6TMiq9GFlWuOJJc8xM3J81d66frk5uB9JnRT9Ma7sxyBQ5ZGRmAfxN0DcLLUZT6Lr5KFOnU9exvkH5xgy0aMyS9HxL7Y5nkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=007v1D6OZ6VdXRrP2OlGA8BaIYAWfzduE7Z598Jqj6s=;
 b=cm04q43ORbqfEkXErSOMwFhoGnSouEF/EaxRjV7Ey+Ex/jElfBwCIUm1pP8nh75w4L9P6pheTjXGjgJ2nTzrvC5E7HtZnFRX02G324sfiqsjEDarRwZqKBUmvrDu+rspO7hWfwqzFTHqI2tIFTJK6cPu1afvLDpzNXww7OR6jTJwl6QvBg5dMozXtmGjMp1S5K72T+lkMMXJz6eiRlgAvWMps6Bw8ERynUZOGxzrVqffgZs/PbneNtavBDfPNiBNkcM7iZJJ2YIc+M8h4S/+ef7X12ysek8kjMRuN3DJKuzXHI9nifRxqw5HQ2y86uN1xe+kTArX4EmklM2WzfQ7aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 00:08:48 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 00:08:46 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v4 3/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
Date: Thu,  5 May 2022 21:08:41 -0300
Message-Id: <3-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:208:120::17) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d8aa6d9-bb34-4f78-5909-08da2ef496f7
X-MS-TrafficTypeDiagnostic: BYAPR12MB2934:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB29349BC213C02C6127A139B9C2C59@BYAPR12MB2934.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y3RS2vDMjBKCcSvwuVbV+46AhVhujKOdjhfzh47rPeCCFwt4NBdDYDMCL5OpARpAvzA0haDGwZD6fnjtSDuHG4ZOqR1q7pwC+KCp19lSJWO8hTINB1XrYG30AJze43v3bPFRPiTUIuJyb1LDo708FVzGzHkMFnCb9hDdBnXsrpm34BX9RjanH4+Byu0QkJrfW5t+OQJzzHf36JwOwUoKeiLdaFd7AgIoMb4NvlCYZ11Dc+NCargcC9jfsyvTnBCbPjV+c5cBwxMndGfw3GkK5G9syLYvNci7Br5fJ6tLc1y4vcaGubD+eeNh2lLTx295cgBsu7+Xp3B9CST1gHy3k6pAg3M6W81icL1yN1xLwo/S0BvLfwzlwhsFh0HipVZtn8hawXr2mxUQ8wSgAN0BMVRhiHxf2OjSOfigf4S0LE/Ewg8FgpsvQ3gjKRIKS9dsOAIslMdSqBpjUX1y1+3fHeGzAP0+DTlfWFg3gBCOEqoPqobI7umQ3YfkEVKVy57HN5MBdHTVCu5QeA6q6BD7La3F2UvcSkAOp9xYPKoVjR2iZ5uuGB1TFv5udRAUSzRhSpGmNEQJvnmzu6Vw0FPRECO1vXHyeXei6fHtWwVi3TikCQ9Y5QNHKYVU+bCA+o+RX8iMpW0o5PfCo88scfSNbRsHoSA/a9SVCjnQi41imRfvb8xVpR+0hbVsaUYUIIR2DjA3dym9HS7CZcVQC1yDfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(66946007)(66556008)(54906003)(8676002)(86362001)(110136005)(4326008)(6486002)(38100700002)(508600001)(316002)(66476007)(6666004)(6512007)(6506007)(186003)(2616005)(921005)(26005)(7416002)(8936002)(83380400001)(7406005)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o3Bpl9JqnGFxs5pxG0hCmV4ZJoLg9PUtCGK4cn88aF6wvERCa8T9I/xOn1AT?=
 =?us-ascii?Q?2JPAw74vlmD5GBusho6FF1sdzXRALKrm2+BkxisWSqLoq2UK3DpQInpWeQc8?=
 =?us-ascii?Q?2cW+3qSUmQAImSuwsXBF4M7t+UNk0g4p5t4NukACInUE94OhLvdqGr7uLGbL?=
 =?us-ascii?Q?jqYJ+3R+PpgNJxJstv+Vm9uV1wUnOoOeaa/mJYvuSOIs0+yVB2LI1GRPTq/0?=
 =?us-ascii?Q?SEuRPiA5vxBKmKxAaq2sB81oAh0BplsBObu9ew2H3cQIpmvrI8BmHPPw5uup?=
 =?us-ascii?Q?9eL5WLxaH7nI15YOqwJf8wa9D8NL9ynFHy2nhFnluw51ZBlWyf3HxG0vQeIN?=
 =?us-ascii?Q?BrjbNBbjyCOMYpnyB6tB+VGB8JLlmc27NShAmakMl9k/hZ3WdA1v4ROLl9/j?=
 =?us-ascii?Q?PDHUqq0pMI9sIM9af9K+rL+2Z4WkJGmpnOdxoaxOYuL1V/L/1FexFx4O6RpY?=
 =?us-ascii?Q?Cjb4iOELDLQgD0li5wVkZjL4WUP0fZtdE9/Xy8IzuSW1wz2tIiUacV5p4mA0?=
 =?us-ascii?Q?L6toCDSGf4I1Cu89lX+zi9sevrRtONmic9/R7McHLrtK46Cwt6kDBSoAjky6?=
 =?us-ascii?Q?zsyc0ejvSMGrytxTg9dIxkHy2lnMc05+V/v+mdAfknm24OgOYFBrn7vYJ2ZI?=
 =?us-ascii?Q?HFoO2qvFxPE4/VgSwwlzcVt7UbSMzaqQAf1XLmgrUQnqge9e/0f5Fj/x9jNH?=
 =?us-ascii?Q?Vl8Qt1ZxS6vWmFTKwiPnP7pW2hFjKiCGynBnCDFAsKoYTZG/Z8c+bmCPF3t9?=
 =?us-ascii?Q?VU0S1ZRHkkoHnbGgjc5Xqv53y03Df4qxCLMV7zWm1jbhQXAnNQcub5UURdRz?=
 =?us-ascii?Q?grG5JcIv3M+5G9+oT5rThzeUZFlWFJ785AglQqADqmLXksX9gySmTsM+h7pY?=
 =?us-ascii?Q?xhBBcADsvwttbGR9OYBkBfXgMJzpgX6opVM3tXqCSmrJjuAH2wbxY99+f0H3?=
 =?us-ascii?Q?gOnGOqMpoD+lDz+lrVn17uSTAmYVdVUT6W1WMF6U5wH6veD/HWlZT/woBr91?=
 =?us-ascii?Q?ZqecoALjUNA1ysDQQjy29HpJ1oHxwnqik1tIDGBuomTH6aOzi9ikrDex6ibP?=
 =?us-ascii?Q?neU6JF5Yg8kmXE/aFNp8LiqKL5jac87NYmWzdj8WVVruVqs4h3EdIlAPH6La?=
 =?us-ascii?Q?B+h7jt4zRCIl/tNPCu1k7sZsBuH4VckrHm/yAjfYOLQ22aR3MU4bXXgBCOLg?=
 =?us-ascii?Q?U62yrgZcj6T7uuwCrA1P35ElEOoOI38YfYLjQ/NIjH6X9s+mQLXd3S2JEe9H?=
 =?us-ascii?Q?vz+bQ7EKYtoIpYkBqdzbtzo6svKiNdeGm+iwaiFQ6BbPV5auNfGjdchKacRi?=
 =?us-ascii?Q?NDn3jO2cnGMOM8+6Uev0LyO4PTLIA8+eIooJOrSWoCPhXFnEwYFOIjCtP+Cs?=
 =?us-ascii?Q?pY9GXE9vROu/K/9IY8hoB7OowcmWRi5glxPSYUpbu08gxE9liFK+3ekblTUH?=
 =?us-ascii?Q?yTZBAvn280pSzYb1KHKfLMob72NQweprbZJv1rKZML4TUaQ0iRL6Nbl6BmEL?=
 =?us-ascii?Q?MMw46iqqb8L4kdjDETEQDge5FjfKAUuCZfMkEtL9TKgm8kmaTQdjcHsurmFY?=
 =?us-ascii?Q?x09iab5rwvX8zaONzjLNv6aAG99v7UUN4Qh8y3fK2I24vVp5i/3oHiA/F9dn?=
 =?us-ascii?Q?qsVgwtVDIOmpIl1JKW9DQ+hNoX53ZBCG5m33W1iiBNDimHDBXpgApou8sgn7?=
 =?us-ascii?Q?TO+GF0UWal7llqKhVQyV+Wiwr07h18tpq/D9mRBpPF9DyW2jPLi6hUf0qy8O?=
 =?us-ascii?Q?cAtaxRsPFw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8aa6d9-bb34-4f78-5909-08da2ef496f7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 00:08:46.9029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MREoh2h6HWmtvX7NJqLPsXDjMBUzKb8nmglfq40KTA/p3sTpXAPv/V4D7Ezksv67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every caller has a readily available vfio_device pointer, use that instead
of passing in a generic struct device. The struct vfio_device already
contains the group we need so this avoids complexity, extra refcountings,
and a confusing lifecycle model.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  4 +-
 drivers/s390/cio/vfio_ccw_cp.c                |  6 +--
 drivers/s390/crypto/vfio_ap_ops.c             |  9 ++--
 drivers/vfio/vfio.c                           | 46 +++++++------------
 include/linux/vfio.h                          |  4 +-
 5 files changed, 27 insertions(+), 42 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 784bbeb22adcf5..eded8719180fba 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -262,10 +262,10 @@ Translation APIs for Mediated Devices
 The following APIs are provided for translating user pfn to host pfn in a VFIO
 driver::
 
-	extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
+	int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 				  int npage, int prot, unsigned long *phys_pfn);
 
-	extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
+	int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 				    int npage);
 
 These functions call back into the back-end IOMMU module by using the pin_pages
diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 7a1cf3091cd647..0c2be9421ab78f 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -103,13 +103,13 @@ static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
 {
 	int ret = 0;
 
-	ret = vfio_pin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr,
+	ret = vfio_pin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr,
 			     IOMMU_READ | IOMMU_WRITE, pa->pa_pfn);
 
 	if (ret < 0) {
 		goto err_out;
 	} else if (ret > 0 && ret != pa->pa_nr) {
-		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, ret);
+		vfio_unpin_pages(vdev, pa->pa_iova_pfn, ret);
 		ret = -EINVAL;
 		goto err_out;
 	}
@@ -127,7 +127,7 @@ static void pfn_array_unpin_free(struct pfn_array *pa, struct vfio_device *vdev)
 {
 	/* Only unpin if any pages were pinned to begin with */
 	if (pa->pa_nr)
-		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr);
+		vfio_unpin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr);
 	pa->pa_nr = 0;
 	kfree(pa->pa_iova_pfn);
 }
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index bfa7ee6ef532d9..e8914024f5b1af 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -124,8 +124,7 @@ static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
 		q->saved_isc = VFIO_AP_ISC_INVALID;
 	}
 	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
-		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev),
-				 &q->saved_pfn, 1);
+		vfio_unpin_pages(&q->matrix_mdev->vdev, &q->saved_pfn, 1);
 		q->saved_pfn = 0;
 	}
 }
@@ -258,7 +257,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 		return status;
 	}
 
-	ret = vfio_pin_pages(mdev_dev(q->matrix_mdev->mdev), &g_pfn, 1,
+	ret = vfio_pin_pages(&q->matrix_mdev->vdev, &g_pfn, 1,
 			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
 	switch (ret) {
 	case 1:
@@ -301,7 +300,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 		break;
 	case AP_RESPONSE_OTHERWISE_CHANGED:
 		/* We could not modify IRQ setings: clear new configuration */
-		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev), &g_pfn, 1);
+		vfio_unpin_pages(&q->matrix_mdev->vdev, &g_pfn, 1);
 		kvm_s390_gisc_unregister(kvm, isc);
 		break;
 	default:
@@ -1250,7 +1249,7 @@ static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
 		struct vfio_iommu_type1_dma_unmap *unmap = data;
 		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
 
-		vfio_unpin_pages(mdev_dev(matrix_mdev->mdev), &g_pfn, 1);
+		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
 		return NOTIFY_OK;
 	}
 
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index d70890ab9cea92..93caab1f29dbd7 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1919,7 +1919,7 @@ EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
 /*
  * Pin a set of guest PFNs and return their associated host PFNs for local
  * domain only.
- * @dev [in]     : device
+ * @device [in]  : device
  * @user_pfn [in]: array of user/guest PFNs to be pinned.
  * @npage [in]   : count of elements in user_pfn array.  This count should not
  *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
@@ -1927,32 +1927,26 @@ EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
  * @phys_pfn[out]: array of host PFNs
  * Return error or number of pages pinned.
  */
-int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
-		   int prot, unsigned long *phys_pfn)
+int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
+		   int npage, int prot, unsigned long *phys_pfn)
 {
 	struct vfio_container *container;
-	struct vfio_group *group;
+	struct vfio_group *group = device->group;
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!dev || !user_pfn || !phys_pfn || !npage)
+	if (!user_pfn || !phys_pfn || !npage)
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
 		return -E2BIG;
 
-	group = vfio_group_get_from_dev(dev);
-	if (!group)
-		return -ENODEV;
-
-	if (group->dev_counter > 1) {
-		ret = -EINVAL;
-		goto err_pin_pages;
-	}
+	if (group->dev_counter > 1)
+		return -EINVAL;
 
 	ret = vfio_group_add_container_user(group);
 	if (ret)
-		goto err_pin_pages;
+		return ret;
 
 	container = group->container;
 	driver = container->iommu_driver;
@@ -1965,43 +1959,37 @@ int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
 
 	vfio_group_try_dissolve_container(group);
 
-err_pin_pages:
-	vfio_group_put(group);
 	return ret;
 }
 EXPORT_SYMBOL(vfio_pin_pages);
 
 /*
  * Unpin set of host PFNs for local domain only.
- * @dev [in]     : device
+ * @device [in]  : device
  * @user_pfn [in]: array of user/guest PFNs to be unpinned. Number of user/guest
  *		   PFNs should not be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
  * @npage [in]   : count of elements in user_pfn array.  This count should not
  *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
  * Return error or number of pages unpinned.
  */
-int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
+int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
+		     int npage)
 {
 	struct vfio_container *container;
-	struct vfio_group *group;
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!dev || !user_pfn || !npage)
+	if (!user_pfn || !npage)
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
 		return -E2BIG;
 
-	group = vfio_group_get_from_dev(dev);
-	if (!group)
-		return -ENODEV;
-
-	ret = vfio_group_add_container_user(group);
+	ret = vfio_group_add_container_user(device->group);
 	if (ret)
-		goto err_unpin_pages;
+		return ret;
 
-	container = group->container;
+	container = device->group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unpin_pages))
 		ret = driver->ops->unpin_pages(container->iommu_data, user_pfn,
@@ -2009,10 +1997,8 @@ int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
 	else
 		ret = -ENOTTY;
 
-	vfio_group_try_dissolve_container(group);
+	vfio_group_try_dissolve_container(device->group);
 
-err_unpin_pages:
-	vfio_group_put(group);
 	return ret;
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index a00fd722f044b0..bddc70f88899c3 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -150,9 +150,9 @@ extern long vfio_external_check_extension(struct vfio_group *group,
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
+extern int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 			  int npage, int prot, unsigned long *phys_pfn);
-extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
+extern int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 			    int npage);
 
 extern int vfio_group_pin_pages(struct vfio_group *group,
-- 
2.36.0

