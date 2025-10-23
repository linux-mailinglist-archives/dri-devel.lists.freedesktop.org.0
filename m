Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77344C03C5C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0B410E9A8;
	Thu, 23 Oct 2025 23:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J3m7iA2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012026.outbound.protection.outlook.com
 [40.93.195.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEA410E98F;
 Thu, 23 Oct 2025 23:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDEySIP8t4amomqAJusCHu5Llfq0zZdzBGZu43dyb4qRyOM/YqCta3QkcC9pgBdIRvatocW8i1+wMDJAXlo3uQbs2JQ2tRCvCz4XpsqxKGxFkhKRHuHwdhK+PnrR+bo1Xx73kXM+lyCVmtYEyMjMGXCtvOAafE7CgbzjGcQ0sdXVw9R5ldXYbu0R/p7XSqBGvhWcQymIYU+Sps+ZZZug57nAm1UO4/oE8hlLhGeUM8ak4DhUgGTz2mTjo6hZCOFD0V4DDlqlr1nhCzdp2NcZSyF/JGgDapf/25OAdjbhBzAQTCrB+DG8R1OSkMcOcYXtz6ft/Ca/ZkjgTp0yUosfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPhBVupTrtWP871ZBN/hZgHzB4kO+fu0JOpNwq73jlE=;
 b=VnW8aPywgzvhQbXgMqOAbdA5wnwEHTZV7l17B8zmzJw4A0rEdUmCO5Z1SJNYkILc/fnQE+3kW0ywnePWzwxl5zxAlOgnbKRDANorVw9nYCZKZzy45az8lWJ3eVNU6kDj/gMx6dlfs+YCZe9+oWC8Fkz1B4URkIyIC2bwy2+EFXj4qep4Zx37v8ysvm5hycS24S61rCefJOAyKgTcVNB745Tij4HWxuKAGru8rvawporYdoXJTR11g5ABRf1/666bvz0JGARukaQV+qO1uDU64wZq41LYBA/c6gQAsH6jC+nNW93FitWHWgAJJg6TR7OJl/xS5I+TcgDWYT62+iFZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPhBVupTrtWP871ZBN/hZgHzB4kO+fu0JOpNwq73jlE=;
 b=J3m7iA2g+6kCTbbzJx7e+H6vjKRc1ntBtG1MjZyhm5Ik/pouGfXPb0o2qFIlBkhXmShIPGy6T/tofz6fCLC1KGkz0nwdCf9DlQOJrlwcuH8OkzkA1pQQmH13S3I3RoTnlHOdTkP52M5q9nbn+JChYU4wMvfscUEKuCbC9IVHeozVMMpg7KxKDzY3kT0HzuinZKvqcKxa/CRX0nenbWGfiXSQP5IlmlQKEuwUXF6P+VJSC6tXz7UeJf9Tsw0/sfxswY+AebU7CqQ0v1jNW/w48v9SSm8Tk5FFw+7lahzGbO+nzEC8hcvgTMB3iSOKTWs8M+tMfM3bQZAEdSO8jDBU/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:46 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:46 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pranjal Shrivastava <praan@google.com>,
 qat-linux@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 20/22] vfio/platform: Convert to get_region_info_caps
Date: Thu, 23 Oct 2025 20:09:34 -0300
Message-ID: <20-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db62dc7-f02e-4f69-a9ef-08de128940f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tbe5OZbHndV7w0bZgt91ukUG5AZ+fCZBcMgn2pnJ4qw08dI5bK3p1IqgPr2p?=
 =?us-ascii?Q?oRfzgVa4eaHo0+o9J6rSsKeOuaguidYNltUJpn1vLknAry7LJukbyuUG9sE8?=
 =?us-ascii?Q?VAZgzEreunxzwr8Y5uOgc+9liVVXHPkJiK5NlvLu+bp4aguwLnMO6orWxbh1?=
 =?us-ascii?Q?aL0afZrpiIxJ1vNhG1coGjMUT8E+B7NiAn4gHdoyHT8I7jAiHFgm+Y5NtvD5?=
 =?us-ascii?Q?U91L90CYgrFoeftrRSgRtdfW/Z+oSquaizpk9TPemShHC9IR/U4U6HMJ2BLH?=
 =?us-ascii?Q?GtIM8vw92srNEKys4d80y0SqXfXCxmCy71iYyiCOE7+ogLjB2r8DM+pIP9+9?=
 =?us-ascii?Q?8qaZM/Tup3h/YviFjaJvJmxxe/3+NYB8NwJLoMeFsYy8mgYGWoUYGook0C+Y?=
 =?us-ascii?Q?mHkmS7+wHdav4HT4aq7oUBOZKtVooxyXWo3EbzFpTcFCPbz47wgDte6q5o2J?=
 =?us-ascii?Q?UwHcmDn58aMBD9NDOt042qsPgPWOBNSZTnLYafesgYk8+hHmlqwtldnYXKyl?=
 =?us-ascii?Q?cT9Ae3g8baG6NV7lawE4SgBUyucVtM6iYgdhE48V0oTIYl46vRqE0syVZngD?=
 =?us-ascii?Q?FVZF+SZEPKNu5qZZV+LLaHtkws0nZTtJpanmG9xKwW7ehw2wk0Vsh8d6Eb9h?=
 =?us-ascii?Q?aAwmpt1Q0fyIayh7uI3l1MkYYnU/R1QTw6GwN7w0wlQ7OkodJtTRoKT76nzi?=
 =?us-ascii?Q?ZgOAoo2twFqgdfrNW9Lfz6zckdcVfLa8LXNxth9Kf/ih1TuHUpj/5+c1OTrA?=
 =?us-ascii?Q?PWfnDLL6XC70nDzoiQvy1Dlr8zbw12q0pQjSktczfRVxhSgQtoRIoTbnhUOr?=
 =?us-ascii?Q?wYTWO7H787KBWqmneWNXozo0gP1mBufRv3ukeRLe69JxWbjYd9nfEERcBlhI?=
 =?us-ascii?Q?DGFSxGq+ZBSW8/DYFoowBM0QYVxQ1nkMBjMZ1FfX3eEyHSEJGS+LS8wxZ0pH?=
 =?us-ascii?Q?fJxdUk8U04gQbfCV/VjpvENd0pNPV3sj9qBZjLgvfN/6jfZ+APlGQQmX5my0?=
 =?us-ascii?Q?wHtg8Y5GoVyfH7Rcv7NoIj+ef/q9U+Mk+IIdf155+df1Ek6EzwLIWj3KILca?=
 =?us-ascii?Q?y4JYGxeeeLnMjtxg6b57a1+D5LWU4jHs5pu8CFQWccUAnYh+PFQLgZ/IJDc3?=
 =?us-ascii?Q?MEXnFxEzF3JYPMXtKZajDUk2tqFFKka6glPkSXccjc0V0J6N6CHD8BBPgyYv?=
 =?us-ascii?Q?6xpkuyK7o8OIiRaWDF3v7/fRoe3/E89/K9oXuzqv9qNtYWUPWT2pWB3mwh9E?=
 =?us-ascii?Q?6pzT1zAK0Bqb5NSl5hFDs3Y5l7VqlLat4DjHdsmvJigeZc0WvR4CpGImg3wv?=
 =?us-ascii?Q?UMOSWWZU3/4FgtoqK63Z7f6NZeCseCquYYwSmIIFj/N2y729iIfxN9Z72Dz4?=
 =?us-ascii?Q?orqC7zoE7DcFm/F/A3UE86qOKJhEjn+6F1zT9paxB/6zzivhNB3O/14dMcb1?=
 =?us-ascii?Q?JXm7R/wJ4fqUhBTi6qWdXNeoWSsaQ9JmTFHxP+f4mJ59cWsf4kcEyh32GjJF?=
 =?us-ascii?Q?bXkpq06WKhq8ayI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?88eerABZCJdtiuBbBnuYpjVoP5STlM7e8ESC6ADwz2Lgm43u51C9Emx+zfjb?=
 =?us-ascii?Q?if6Yd1D1kpEOP/Z7p5rRtpusQ2UmXHHe6gPcqRXudmCC682z7xLT0ynApDV1?=
 =?us-ascii?Q?BajvhOuBKPmhugMzhNNr+cFUhiyHMJs8TH3uWKVNGGN3aUtX0mBZua1ReOxq?=
 =?us-ascii?Q?IcXcmg6jJIYZmTHHPNeDHYJwydc8SOp78Y0tyv5AQ6PnaXys/+hfcNVcOe6E?=
 =?us-ascii?Q?u9UWqFiwV/DYbk7l/hyk47w35czYUxuO6/4A7KkOOQrsDB4WRgigusLq5WRR?=
 =?us-ascii?Q?0q4bRcsV+RR7oJawKORXFsjuDwefbtNP1ieKhm/ouvduTeBq/GRCS4x48xND?=
 =?us-ascii?Q?MQhYZCj/astoJaejopTkZemcRwAqdqcbZ809KJbEsuN/2ffGcRO3jxkisDYe?=
 =?us-ascii?Q?oe+/ITbjuSjxzSN2qrhF/HgToYmklSPRTvvVeDbGX59IqN6q7OYhdsfASuIU?=
 =?us-ascii?Q?YtBIJXlJsB8/QwxzNdJbAxRdWt9H6NYdjzI3fgZo76+INAo3t9KwqTmYMoDk?=
 =?us-ascii?Q?ya1GrVExfIK2TYvQ/u8sJTd7WOSpP6oXeMXXF1j9yZiYNXvqeLCROLeDV5l7?=
 =?us-ascii?Q?ol8GpuO2lZn8Np0JmwsmN8WQ6WMuMuBeliRv/3DvtTmVankQ+xkAmrePXEw8?=
 =?us-ascii?Q?pEAL8rRjAGcdSWsIlK/xgGteTmFN6zq6aO+8+e7ZJn3ALjqfqyiJ+PcZNsaX?=
 =?us-ascii?Q?cfoOu3Oj9N2cE2BJUTOuJhCOtGcm0Bo/fO+UqW+UizIGAv0Pocw/B8lG0DnC?=
 =?us-ascii?Q?NvOjkYyVGCcMBiKxfqJRcKSLlIBq9SI+I4hnWqgQNEtsrO0UA4hpu6mzVDOJ?=
 =?us-ascii?Q?DTkFmlC74JRizHz6rRXnucWc60KbYsJ5ShSZkHFW16GjZRrzZdOSQ59GIzIs?=
 =?us-ascii?Q?ZLANmKLjpe3Ll0hoZNfDWIOzkaNzehcDFS5lXgiKNBEE0AUnuSwTGdpIvwyg?=
 =?us-ascii?Q?SLjTuHrfksE/g+QHx2cwLXTI2t48tnhQhY0/peG+jYEXPmf5Sg9beew8jhs0?=
 =?us-ascii?Q?Nlji6J+qNZbCdwA07IprD0raL1Q1yAC1iOBoIyIM/+cGmoCfsNHUHSfI11c6?=
 =?us-ascii?Q?7EolMZRSchlF6ehUCrsWOuqYczJsvDD6LM7B6DeK7JSoOaSNn5PKHrRWPEUX?=
 =?us-ascii?Q?6abNuS69U4ONJGkcbC9VRQPQ45kEmjOcKtlEz9HisAxb4DFlrurUYmk7bvQ4?=
 =?us-ascii?Q?+kcWwJnWrZmDkfCEs13RcVHNrlWg0+NYoa+Fxp1I6IAUCHyWgMoMHIs+xpEQ?=
 =?us-ascii?Q?HSgME+mbDNJ2Yp6Do45zTToeeWWfKz7iXQhNNyrjY7wTVK2gbfUogZuj7IDb?=
 =?us-ascii?Q?67WveMFpHWfepsdkF6ehMCIUvx//1xeTrmbygbRQQPULndwD/LjYWnpCwIyo?=
 =?us-ascii?Q?0BCA8Q7JY7OJUCc/o/1XhbBLgZApTiLTE9T8rnXmkZBn0pLWoIZSadDniEtg?=
 =?us-ascii?Q?SO6W7YXYtmgZ2f8Pr3oXBUloKTxhrirdBhVeDFq0ZpTV77SsVPZmLD+0Lca+?=
 =?us-ascii?Q?4n+P0PaRJlBwhPzOBFPyeQdTzu7rsOy12uni8kQL6t9DaRhO/zY8mLrixXq0?=
 =?us-ascii?Q?KM6tG6nc7tlEzBWIIJWkP0+9WGJKBGloxGXHuPro?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db62dc7-f02e-4f69-a9ef-08de128940f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:44.4028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIp/Leivc2fjcFnKYxwBMsBpSKh2HXqZfxUmC8D5UTUMSxcbCZwkG4LodT20bdWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138
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

Remove the duplicate code and change info to a pointer. caps are not used.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/platform/vfio_amba.c             |  2 +-
 drivers/vfio/platform/vfio_platform.c         |  2 +-
 drivers/vfio/platform/vfio_platform_common.c  | 24 ++++++-------------
 drivers/vfio/platform/vfio_platform_private.h |  3 ++-
 4 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
index d600deaf23b6d7..fa754f203b2dfc 100644
--- a/drivers/vfio/platform/vfio_amba.c
+++ b/drivers/vfio/platform/vfio_amba.c
@@ -115,7 +115,7 @@ static const struct vfio_device_ops vfio_amba_ops = {
 	.open_device	= vfio_platform_open_device,
 	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
-	.get_region_info = vfio_platform_ioctl_get_region_info,
+	.get_region_info_caps = vfio_platform_ioctl_get_region_info,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
index 0e85c914b65105..a4d3ace3e02dda 100644
--- a/drivers/vfio/platform/vfio_platform.c
+++ b/drivers/vfio/platform/vfio_platform.c
@@ -101,7 +101,7 @@ static const struct vfio_device_ops vfio_platform_ops = {
 	.open_device	= vfio_platform_open_device,
 	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
-	.get_region_info = vfio_platform_ioctl_get_region_info,
+	.get_region_info_caps = vfio_platform_ioctl_get_region_info,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index 3ebd50fb78fbb7..c2990b7e900fa5 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -273,30 +273,20 @@ int vfio_platform_open_device(struct vfio_device *core_vdev)
 EXPORT_SYMBOL_GPL(vfio_platform_open_device);
 
 int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
-					struct vfio_region_info __user *arg)
+					struct vfio_region_info *info,
+					struct vfio_info_cap *caps)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
-	struct vfio_region_info info;
-	unsigned long minsz;
 
-	minsz = offsetofend(struct vfio_region_info, offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	if (info.index >= vdev->num_regions)
+	if (info->index >= vdev->num_regions)
 		return -EINVAL;
 
 	/* map offset to the physical address  */
-	info.offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info.index);
-	info.size = vdev->regions[info.index].size;
-	info.flags = vdev->regions[info.index].flags;
-
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+	info->offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info->index);
+	info->size = vdev->regions[info->index].size;
+	info->flags = vdev->regions[info->index].flags;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(vfio_platform_ioctl_get_region_info);
 
diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
index a6008320e77bae..05084212a76eb6 100644
--- a/drivers/vfio/platform/vfio_platform_private.h
+++ b/drivers/vfio/platform/vfio_platform_private.h
@@ -86,7 +86,8 @@ void vfio_platform_close_device(struct vfio_device *core_vdev);
 long vfio_platform_ioctl(struct vfio_device *core_vdev,
 			 unsigned int cmd, unsigned long arg);
 int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
-					struct vfio_region_info __user *arg);
+					struct vfio_region_info *info,
+					struct vfio_info_cap *caps);
 ssize_t vfio_platform_read(struct vfio_device *core_vdev,
 			   char __user *buf, size_t count,
 			   loff_t *ppos);
-- 
2.43.0

