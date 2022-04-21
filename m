Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0093A50A56F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DB110E60E;
	Thu, 21 Apr 2022 16:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0193310E0AC;
 Thu, 21 Apr 2022 16:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqN9i545f53xemf6ZToPIiqgh4IiHhP2TpV6glzkKToOngSuTk3lwpngb7YqdoY7UqIY6e36qSIy6VDA/ecajYHuwd67tomOGD6l5lfVPS9rtnB1dwRre+q2BACG+8shelhJ9srBUQLO/MnV/nptWv8172Tj6HO4XLSFUgf9ftGXhBnqoXDoeZInku1nW1ihL8s/LowgOp1f5KUIXllmawRHDxL/8cq4mI7h0dl3uAr3Kx1jG3I3vvt2LlGQWa5FqfV4jfcUFJq31dM7JY/5R641uFTYv05RebkgddzI362rCPRgbAn7F3Em2rf6y5dL6GoVffLZOg8h4MrbOVX05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NEYJK82QmtEanx58uPYmKNxmLd164TLMmaLlgdRsqU=;
 b=E7fQ/viuDuV7j4XHLW5AXimW7NCc6sV9GTs3s9MZNlxbL7xDIHwVDoDP5GiVUOEHc3oaAswMzUQtFbiTt0shro7UJLK4zayuID2PCyBLk53mbaZZ4cqjiaWFzGah2HF7V6vsQNX1jqOZY1d5duht444tshaTG2efAvjEcprkzu8Lq1WQ1mXJO7SL9IvmIRH9Jlin4etJS02ZlbH9AlipBmsvv7YSkfyYxS8Fd8zC/lP61qGomHfJfCZwP7li+ZMewJtkMY26fZAe+bFJRKpOw3P7WZOKkjB7KVaOTaw7ObF0z8AhTVzxGF1BKoR6uw/wDlMtTDwcwos8HqKehFhEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NEYJK82QmtEanx58uPYmKNxmLd164TLMmaLlgdRsqU=;
 b=USLv/4p+TrKJBMJ1ACtQTWnWnRcKxc+soQeF2pGZOLfKbBCSdncCt6v+QLH8GMaqt6XtnBSWLHEk4Y4iSE8kAvdE2u+ord0ucal+hcwIs2XBJ6t42yOGH0EWvyP0vb7hdQqw3/9/XHqW8q0W4rGq/KrURQpTTnYuXnCR/rGo3HkRdawPg8J2ThUb3xPLAKpbL9SRMPMmHQqvKpx7+BGJfLVTfxT927jY9Mu5qLgSGJBZBGGjUYcXKq+2ajesDnfjL/Cmq9r99advGFAxvZu9SDg8VjH9x8tn/z+Gdtc+vXy6U7YfddNzc7Jcavm1Hl8QRHxM5rR7uf2j6RvULSdcUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB2907.namprd12.prod.outlook.com (2603:10b6:5:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 16:28:39 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:28:39 +0000
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
Subject: [PATCH v2 3/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
Date: Thu, 21 Apr 2022 13:28:34 -0300
Message-Id: <3-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0144.namprd02.prod.outlook.com
 (2603:10b6:208:35::49) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de85efc4-a3a8-49f0-0542-08da23b3fdd4
X-MS-TrafficTypeDiagnostic: DM6PR12MB2907:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2907AF0AF057F79A4676FAAFC2F49@DM6PR12MB2907.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X70ayCC9E8+brqHH7wN816l8RgyTQ2GDmTlurKre15Vr3dazYZG5UkZw6J7bJib2Vlwp29UWEVkxw7qvpRVuY7c5l6tW6P9ALdr7zJnoqMrTHzvM9OEIDpG0ZcC2/oXY/a0CneuCjGreI1dWGrxPqEdmZ4mX4NVhAtE+aVoQQQdB6zaw2hIXqkVytbdSb8Qwpr9qSQFHt2HhNyzuILRvuAZAxmRYVALl2by9sxw1OZE4hW5GlliN7DXSpfqF4g06yJTUhPwQdh0c3MEvBazESy//CI41hqUF4E07ZazJOzlUfZTlzh+bs/+FX0lNRNXoyD7oVxYF6A0cpX2ZPvaOOzg8OzxPRncj/EIYrqbIPV4khUxUowFp5YBc/LgER4uvkrFCOFt1qQJYci/k/zj20RvgHgywc+q6OvJdYyPNAjN7e/aOh4g55aZLU6QS3n4oL7wmsrtLt7XETpFwOR97xFaNEf1CSqMl64jHSk1Hi8xXcbMIeYAvgotuRWSjUC7mUH39FDysfZhwiaAAFPhvAN//1VydSM3daShFi9s5kQ5srAaNpmP6X2TlG4WGF3mxC8vTdpOqVfZCqapixqoJ3FR1Xqeg05MkT62RXzuKJMEwYQIXCFkb0oBvR/XFVUnXCp1In40qlwkldf3oWtFzpg/aE47Sy1OQlKdyHjgyIblUhaXQDzBQ8IU3wOTX0vh8ItQBNzn/osTFNdXFi3ys/e/hJbXMoQHbkPyAga8i5Yk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(316002)(5660300002)(38100700002)(6512007)(54906003)(36756003)(66946007)(86362001)(186003)(921005)(110136005)(508600001)(8936002)(6666004)(2616005)(83380400001)(8676002)(7416002)(7406005)(66556008)(4326008)(26005)(2906002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6EXfiXhGOtSEXjKc7WyztEelfiAANjZB+td5QKBnuzlNxEMB3hGURfDbqjk1?=
 =?us-ascii?Q?l69OYUegANdNHN68v4/5JgefRblbD9mP9Dl3IWJgVu+Er8c3MycBjDSyHLFk?=
 =?us-ascii?Q?zs3bVQvuHf7+4Z+tPxjZij5b14WwsCqCbhSvibIk+uikKIo/WgqvyC93isvS?=
 =?us-ascii?Q?XmJM1BsNFYjnX6W959dN1nywyUbxtWv6IU470xKAVmUXPRIpxcx/JiE8BaFV?=
 =?us-ascii?Q?9KZ+l1I4KMXDm9C/0m+Kov+wGykOTmL91qNgc+d8J+AVrmGvBx9Q8l8NUF2S?=
 =?us-ascii?Q?/UD2sV7uLP1LPEttWk1cNqxYcQX26qIEb31hBPGnwE1fH/olaouMssW5fYeD?=
 =?us-ascii?Q?a3bMtdakRbbHO90MXfowrZaq9w/CK5f83nTxPIFqO2d/e8xDcdUsM4hJEinM?=
 =?us-ascii?Q?Iln7XJKTx316HuceQjGud8+vzeJI9ZQGiL99YTfeon7d9hcN8aqkcrs9N7m8?=
 =?us-ascii?Q?U2gKAXc1p83QQqQf3r92J+Sc8fcdO7wBh09wcOJH7iDXswXDnQq/5uUUtTAZ?=
 =?us-ascii?Q?96pBofOnNtWswBnRNRKsOvq8X6DvqrMTEF3ZHccJyt79Fds+qXlPSPm/OfUR?=
 =?us-ascii?Q?8oKILRVhA/cMCtgu2uK+LHZCkDJ9V9wpGjUttH97nIknKBoY+eQY5u7NFnYK?=
 =?us-ascii?Q?rbWxkqcLEogViRN6Zb+QHZQEYr0B2tBCDacgV2AqO2sZ3ZLostYhPox0lw/p?=
 =?us-ascii?Q?GAV8cNbbr4lzgcRpmup33sjpYAXwZ7mwMqrJBcaCBKhhbYetTRiuCFCkI+M4?=
 =?us-ascii?Q?E01xmWmNb3LsxCSDNub9JsKeH3NYIV9FMpYXasJVVBEDtNIiubEHEvZEeNO+?=
 =?us-ascii?Q?eBsPlvM3JmEZepbBpQ2qHBR4b+PiuvpQZ2J35OfYaRGRf0MaMYzOxdS/fepC?=
 =?us-ascii?Q?vet89mtz5BbhC9U4YxLRXhv58ytYdEDfC2IuCsjynGhC7YkIYWsgPayw0Vdl?=
 =?us-ascii?Q?g2jLlYeldyjue4FHjkJkOdXTozXWlZxogrLOcum/f0pfdROJ+zO/O/Hlnvib?=
 =?us-ascii?Q?dEsuffITvxBXwb8Tb23AGIRgdyZR4M9xf/OZAAvK798aA4mLPdxGOdypTq9g?=
 =?us-ascii?Q?LTdjbfSjyIUftTSqvdInUrgRVmpMT/MiPHx7HMmGqQiL7R3XZLDErGPdOHMG?=
 =?us-ascii?Q?bQOWXk5Nk6j+5e+LpZ2DNCMnO5TFWZsQn14O2Uvx3rOzpbVW9zLkGN3MoiEm?=
 =?us-ascii?Q?6WKkbXa/AVMJ/41L4+WMhR3lMdfIjcH/rC8n21bLWiXl/gGcPMIoT5pOc2VH?=
 =?us-ascii?Q?2NxRdi7M4pfIw5J06jlMKSr+cj3ORiHsbhCraFkjiMM/zEVvgXwD4Dt5c1tl?=
 =?us-ascii?Q?ol5wsu0H6gvi0qiaHlPU/fC3NrbA2bfhSqlsKW/1HekkXuMD1LlEVnSCPbpk?=
 =?us-ascii?Q?h+n4UQXCSrbSVGOGekASPgF+kl3EpgqDe+1Nhz9VabeikPexW0NT892UfiQ6?=
 =?us-ascii?Q?V6I4NvGCtdjeMWEnUJgZkobXDfwMenup18NamL9y68ZLkFRU7PmPhwXwi6vk?=
 =?us-ascii?Q?sHs4wdizvt8xdAhUAjU0LRphtDVu9wQddP487mGN/L+I9rBwtt2nMqoNCTDk?=
 =?us-ascii?Q?U18NFshy8t7pf+x+DPjKzD3RwEDyZOEAZ9rI/fpwN4hZENktrE2F13JPi8qv?=
 =?us-ascii?Q?C4tmvMavwedGbR+l+ej3UqO6ijl+yX+ZdmoBPgz6AIjGXX4M83K9Q6vvkTWf?=
 =?us-ascii?Q?IJLORAy3YWWZ58uBp1vLn0FtOf+DicGe4K3Nk1uboXofFJd8b0CMeQBDKI3o?=
 =?us-ascii?Q?mWzSUuS5gw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de85efc4-a3a8-49f0-0542-08da23b3fdd4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:28:39.2882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0orIB6zNpe1XirQW6rqLbPydbFWHYeItVZTFZKJoRAuN2QkxXrogRgBJOA12K3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2907
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
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
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  4 +-
 drivers/s390/cio/vfio_ccw_cp.c                |  6 +--
 drivers/s390/crypto/vfio_ap_ops.c             |  9 ++---
 drivers/vfio/vfio.c                           | 40 ++++++-------------
 include/linux/vfio.h                          |  4 +-
 5 files changed, 24 insertions(+), 39 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 784bbeb22adcf5..2f9e6025eb2fe1 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -262,10 +262,10 @@ Translation APIs for Mediated Devices
 The following APIs are provided for translating user pfn to host pfn in a VFIO
 driver::
 
-	extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
+	int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 				  int npage, int prot, unsigned long *phys_pfn);
 
-	extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
+	int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
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
index 8a5c46aa2bef61..24b92a45cfc8f1 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -2142,32 +2142,26 @@ EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
  * @phys_pfn[out]: array of host PFNs
  * Return error or number of pages pinned.
  */
-int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
+int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn, int npage,
 		   int prot, unsigned long *phys_pfn)
 {
 	struct vfio_container *container;
-	struct vfio_group *group;
+	struct vfio_group *group = vdev->group;
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
@@ -2180,8 +2174,6 @@ int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
 
 	vfio_group_try_dissolve_container(group);
 
-err_pin_pages:
-	vfio_group_put(group);
 	return ret;
 }
 EXPORT_SYMBOL(vfio_pin_pages);
@@ -2195,28 +2187,24 @@ EXPORT_SYMBOL(vfio_pin_pages);
  *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
  * Return error or number of pages unpinned.
  */
-int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
+int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
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
+	ret = vfio_group_add_container_user(vdev->group);
 	if (ret)
-		goto err_unpin_pages;
+		return ret;
 
-	container = group->container;
+	container = vdev->group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unpin_pages))
 		ret = driver->ops->unpin_pages(container->iommu_data, user_pfn,
@@ -2224,10 +2212,8 @@ int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
 	else
 		ret = -ENOTTY;
 
-	vfio_group_try_dissolve_container(group);
+	vfio_group_try_dissolve_container(vdev->group);
 
-err_unpin_pages:
-	vfio_group_put(group);
 	return ret;
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 748ec0e0293aea..8f2a09801a660b 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -150,9 +150,9 @@ extern long vfio_external_check_extension(struct vfio_group *group,
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
+extern int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 			  int npage, int prot, unsigned long *phys_pfn);
-extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
+extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 			    int npage);
 
 extern int vfio_group_pin_pages(struct vfio_group *group,
-- 
2.36.0

