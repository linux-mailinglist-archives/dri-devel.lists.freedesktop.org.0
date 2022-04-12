Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B1F4FE544
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DA310E697;
	Tue, 12 Apr 2022 15:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160E110E37F;
 Tue, 12 Apr 2022 15:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6Ia3JQ6d5uRBIkY1fVpAVTIgEG9mORn1b5AMy0DCvVynu8WWY5TTotX7ma8QATHo2kK/udQe3hL+dny7/bxE9GyAal1kUrjPehiB7VfbphM+dv+9hefKwmRdp7G8bQWdfm4+vxJ7X7EMRX5SIPzN9t5NGZB4RsRQ4hI/5OpVmzKF99eUkruJzeVIrVHkfP6nO06oS3x65O8+NQaHo+tLkjia5NrHSb/OUH7XGfPRfZLGhr0PByzde0h6AUKkii08uiF68z88igNohYrK4h4RVic4djRw1fOTOw2dzrSbgTWfXAakNOiKCg+8urvEDDOJJAlruULLsEGXdR5fBkgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhaO8AuSVmWbnf6E1oY44JxzaoPb5BuPccs9/AMBcBs=;
 b=PUU1P2Bcd46hxofgxygeuVv1jbqRY8i5XtYMK7H92qzYDDRsXhxLQdCtDuzxgA5+/g1cEQlIrH/sdDhM9ZxpBfRZhGPDqXdSJLDK6SQIWYRxkS/9SaPLKxWMfpClUXK1U+jPVsyYG9YNw5rReGOUSERfCBlIsUt9Ajv71sC8PjAgV5zlCOPHP1Zk5j71hjtNHRz6yVsVFkutmLJ1iavEwV5gBc4VmqYdRg7i6SSRH0XHwP9D0h/lR4md9/QTRE0BFg+1igZ2i9M3dIg+MOOExQGTRAxrdtNtjXlnx2XKMw67ZLVOwj2i631SY7h8k9xn2bPnyFMsSKsApdwFB41jcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhaO8AuSVmWbnf6E1oY44JxzaoPb5BuPccs9/AMBcBs=;
 b=HJ8uA72j8sqzUQ5mBYy4hwkl3YtIllrqRWzZkz732rrOMh5dgiACVK2ZZU1d1qp8hKY4qNy8+hO/YmAnr61o246eUCup5NUsIPumO1WvVjpo6xOtIHnivjWUhJHJEbhz9aZily2Pf7+zMLiEOleWlEukR23vsOScVw9C2+cjOT/62wT9fCwbYNb/psz+fCT6ND8mnWvXumNPSD0tmlVqQEyGSYZHxnp+auotT4nhu8rgXhkbnM0WdQ7moexVSHFPmx/UbmnSA7lUYV+lk6qfGfWMND7o/mFg48xJUkShXqmxziPCfHplk2Gs1yIfdH4L1q6e5AXByOcb2FvFM6Kaqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:53:38 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 15:53:38 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 3/9] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
Date: Tue, 12 Apr 2022 12:53:30 -0300
Message-Id: <3-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::28) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0ec39e7-6949-4f89-a647-08da1c9c9b61
X-MS-TrafficTypeDiagnostic: DM6PR12MB4172:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB41725104C4C39B7463C2289BC2ED9@DM6PR12MB4172.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihyN3bchJ3Ctm+ldZqfC1RHmDUZkf4c0fRY6OhALj6A5KYB4+bE4T9ZFeylz6PXdxgSKTK4D12ayMUmTk97EOY1wuLA+YV08P80ggWV4UWaImDvLjMDVaMfMlmXEYEBedlg9+jQEEfMM44c9Ct6plwZG1ExxsWO1n8tN9TRzf3knTx3S7vMrAx/q7j5v1ErP4uB6HQW4T25m07Nl/FU2lmPMcLgxXB+6CqHbE1k2/uw8IXMl1r58oj/GvuTVV5kW/54GEcaqHz8M245r70qWkt1cBmFyG0VrpmYHo8AO3Q8QRdXyQ+krKV5mPdXp4196LC8CgnBF9dFl+3bl0S9qXlLIztfvT/1hMj/wBaPBBlaH0ej0wGEDN/Lh9Wno//B7KJCeRGQDT3RZHmwvPq6N2xlRw22JlYKqVYYVtfVfe6WFK8T1XReZGXxKS54iheu7VCtjFEj+0jS0eVlRwJ6XgboYzi4edq/yCiJHC9oXZd5qmWkjs2nk8fW8EH5GipvqgfsVZvht5DWd2Y24viWoQGdtlVd1o+mu/D8lk0dhJV2trWmn+nXAhK1OWNGqKee2s8y2sL2HpLn3dk/V1y2R3kYheWfkWFtm0fWRwYRfLj7mBLjPaHTrykERobCzEHks+QCE6D4P0ZDvpfLLGV3yHb+K2wfFBCrz+Dso4vIiUyXBbbPuD+BszrXaRtJV9S+rFfiWHzLzrVXN+ozbe5FiPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6506007)(6666004)(66946007)(66476007)(4326008)(66556008)(26005)(186003)(36756003)(83380400001)(8676002)(316002)(54906003)(86362001)(8936002)(6512007)(2616005)(921005)(110136005)(7416002)(5660300002)(38100700002)(2906002)(7406005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kkYqN+hCN77JO8WLil/UtA/3aRebl05uo+PK8X1JaxyKg8l64g7rFGRDvJr/?=
 =?us-ascii?Q?1lPt2TzDfVdh8kqVaB6H5TG8rQy4Mvbe5JVx0juoeDLXxD4UUPkAq5JbfMFo?=
 =?us-ascii?Q?WT1HnQIIqNQ20VMwZxAxTqg3AIOIFcFFhaviNIvj+ku6WOvehMADRC07IGRu?=
 =?us-ascii?Q?gJkX8a3fWWmxc4Vp0sWtfZ8X64mHP0wm4mJ47sLDgf5JtJEsyqzTpTZS+PQX?=
 =?us-ascii?Q?buePo4SWjkmqSzUvvFUONy4bWaB5l+lmEsyW/rKPdLtVJIcGfSypd6yOTOFN?=
 =?us-ascii?Q?0Is/i4k25FF51tFTtmQW1exgm6SCYyf6hd5kX1WeQgxFOVX+b/mFOvH1h+eJ?=
 =?us-ascii?Q?Dj1qNeZmmGHosyIgsCtZRVUHCThEQ6W56+h4m92uHzia+3cNV3BSEvXKNMFm?=
 =?us-ascii?Q?EySwbz8VmEH5NmFwky8IOPhB0CSwhz4P7deDqcIeAaRFgzyOICwnyVB7cAJ2?=
 =?us-ascii?Q?dCT7CLZ3EalvmaglPSSYxkUcHZAgrYRDSL8oOwaHIRCB1poZUffQWTOCsfNP?=
 =?us-ascii?Q?lOReOwnpYPj6zKGSsgtqoF5rY0nS7msRB82etAeDXWJpVu20FDyWuwiKcnJJ?=
 =?us-ascii?Q?JXDiNCG+RsjKtf9N6TaoZ/+IrAqaR+s5sm549yU/PHcxwAF5pd6BoUEp4JZm?=
 =?us-ascii?Q?f9KBIvrNr9o2HnlgYMjGzFdSqCdB9EmcpZdbovdymNDJj7SmcAz+Wi9Ht0cr?=
 =?us-ascii?Q?4B6CoyMq2ekxkYLz4LbKxVlJzXC0uD1AyLLEGFSYiRplHr8Lm9RmGKfBTWeN?=
 =?us-ascii?Q?yZv9Czvr6bPDnPJwWUbsbZvY8pM/NJPkPem+sqFbYALngxXYe87tpa8CyO7P?=
 =?us-ascii?Q?kdEt/sP5H6FLXTLENdhVUBsSV9VEGdsYHYWX1cEthMegzJiWsdRsbFX07Zo1?=
 =?us-ascii?Q?wIttjJbokUTNRSM7/p7Hr78ybeiTK+tnBCLPu1xFsphx3x127bWlfDA892/v?=
 =?us-ascii?Q?vVmBvUORxVe/cEOYS7bo7DWIGLrm447prXrsPPlRw7xRJc8FgEw17kT9VYj5?=
 =?us-ascii?Q?KUvUu8TGfCtt/Wc2KRNokphNGkV5e9MsShYXURdh/Pw9vNOI8tBXH+FonqXK?=
 =?us-ascii?Q?4n3W+4nPb9NeyQUBry8bTTq7uvjLfJt+u4+TBo5HQIa4tS2jeIQJB1TBqITo?=
 =?us-ascii?Q?pX5K2ghicWzb3F7NS1gabZWrgVvSF9G+kLZnkBD3gPwwm99JV2Dankp6D2sI?=
 =?us-ascii?Q?LWJ+oigh7J4AW23J1fMEsHkqC21xBr+U4IPkflWJI18w8RhTkvdE09RHfVrD?=
 =?us-ascii?Q?6iMFIIOZ18DO9cZb9M3sFNu1Zye3wZc42eKUWrWjOE97YyoW3aHjTQF86XMP?=
 =?us-ascii?Q?WKKg6/NqM8j9HxyNl17g5oV3FOChhVw2MvDAs69Ydf/1AfS1kYMHVsY3ciBB?=
 =?us-ascii?Q?yJkHiqiA8kpo1iHqo7TIEKCiRM7MUFgg1oLNJPOLB2tA/oMLyJfUkHcjkvXH?=
 =?us-ascii?Q?Pj+frSZeEBBMz5uCHffPpf+hRVb1PyJTm4lOmGvPfqlgfFerou0KyVz9GiLf?=
 =?us-ascii?Q?nu52utpa16JYElzdzaQMCsl2PDbflmyxvCFr3IMCDn4YMBnqVuIQagp2l+Be?=
 =?us-ascii?Q?j3Hk3XMXSk6ECKIV+wE5skp/glwD22j9mqBgtQz+fAb1/wNRcaP3RUjRjCFg?=
 =?us-ascii?Q?vPX5qhKgnrqvTQDMvPuwogCeUNJz/nrfgri/ecFy0eo5sFmVI8RWhi6P7w4e?=
 =?us-ascii?Q?eH7RqeIDD4Ali52VAaTI4j4Oa00VKKU+v/69VqYw9No3xYWlWgoxajkY2l5X?=
 =?us-ascii?Q?qzGgTl7/iQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ec39e7-6949-4f89-a647-08da1c9c9b61
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:37.5721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H35NTmW0Zo3huFL8xVKx0A/Z0BCmhGkge5WwKlrAz9f+Ufzl53v5fm/bIII9IGLZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every caller has a readily available vfio_device pointer, use that instead
of passing in a generic struct device. The struct vfio_device already
contains the group we need so this avoids complexity, extra refcountings,
and a confusing lifecycle model.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  4 +-
 drivers/s390/cio/vfio_ccw_cp.c                |  6 +--
 drivers/s390/crypto/vfio_ap_ops.c             |  8 ++--
 drivers/vfio/vfio.c                           | 40 ++++++-------------
 include/linux/vfio.h                          |  4 +-
 5 files changed, 24 insertions(+), 38 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 9f26079cacae35..6aeca741dc9be1 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -279,10 +279,10 @@ Translation APIs for Mediated Devices
 The following APIs are provided for translating user pfn to host pfn in a VFIO
 driver::
 
-	extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
+	extern int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 				  int npage, int prot, unsigned long *phys_pfn);
 
-	extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
+	extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 				    int npage);
 
 These functions call back into the back-end IOMMU module by using the pin_pages
diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index af5048a1ba8894..e362cb962a7234 100644
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
index 69768061cd7bd9..a10b3369d76c41 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -124,7 +124,7 @@ static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
 		q->saved_isc = VFIO_AP_ISC_INVALID;
 	}
 	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
-		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev),
+		vfio_unpin_pages(&q->matrix_mdev->vdev,
 				 &q->saved_pfn, 1);
 		q->saved_pfn = 0;
 	}
@@ -258,7 +258,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 		return status;
 	}
 
-	ret = vfio_pin_pages(mdev_dev(q->matrix_mdev->mdev), &g_pfn, 1,
+	ret = vfio_pin_pages(&q->matrix_mdev->vdev, &g_pfn, 1,
 			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
 	switch (ret) {
 	case 1:
@@ -301,7 +301,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 		break;
 	case AP_RESPONSE_OTHERWISE_CHANGED:
 		/* We could not modify IRQ setings: clear new configuration */
-		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev), &g_pfn, 1);
+		vfio_unpin_pages(&q->matrix_mdev->vdev, &g_pfn, 1);
 		kvm_s390_gisc_unregister(kvm, isc);
 		break;
 	default:
@@ -1250,7 +1250,7 @@ static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
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
2.35.1

