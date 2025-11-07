Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A2C41329
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F3D10EB59;
	Fri,  7 Nov 2025 18:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p7DgXPyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F245310EB49;
 Fri,  7 Nov 2025 18:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap37xBp5R9/dMaQ/VNvzQdDPTV2lktybyW4tblrZhcHp6uYfpnTZ8rEIRrpuiPh/RZcERA99qh1tv1A0fBXMV2wZbtqKx/HlNvHeHfw7HJTt3SWv68QYigWZLQ2Q+m8mHVvXW6UXneKqMnXc2tqH9QfL7o9T14SLhRle/eSblBHG0oV+y1mr5/fFBxpQMRIvAp9D0VUTFA818WXVt3aBchRhdP9Gf+e+RTqxwSQAQ1F5BhnI5DKFw8LfHsZSvU9yS2LCXP/T9BwayIbzVPjBoIKlntYdAbC7jtGSfHDW0M/hsc+GN4oYrKqOlNjbqSnRp+P3O3DnFCucs6F+v51uHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpGHjI0W4fzM1miYYbZ+Jf7thGXNLAfpezqhXLyNP2g=;
 b=VMM9aHaYkpyrrDNVJgP7Yo/G09baSUt1N5Wpbtj8ObklgOZtjrYbxliReK22L9xBbkKPbRiIAfg1oPeMOmyREwdMhHPmo8JsekViMo5BkSgUSeZN64mNzG+uHOiY19HyEXpNfHpFgEQYr8ZaaGal8IU4oPHnkQ8LEKOC1Zw9rG1TNgN0osQk8ZVbZj27Is1GEP/8U4ARP7VVU/oVwLd2My88sVa3gmAUnXm+U70rvP4MIXIiINSvqXu+br9hRtVEzUSZ5i/IKIT6kuBN1PxnO4ksnI7pSFpNgzz8fPKy732C4tfgqcctrOz3GnS/UUK403F70fSbvGwKLwUG09tMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpGHjI0W4fzM1miYYbZ+Jf7thGXNLAfpezqhXLyNP2g=;
 b=p7DgXPyk3gfmxT+KK6pUc946gESIhDgaIs6nei1T/Sgq3qz9LUyda5BpuS5SswiwioEyNb1FDDY04Hkbauy2Bw+uDSHN463Jznf3PMJmS06V01CINl/o6KXa7pSDZXaENFiPwambNRXrcE9LpBuz4wMi7reiKbn7XyNUXiLYsZVSMkIjT3XVMmoThSzT4bE+meXeqj0nWLbWovmfiLKRYLXYg/XSBerbSOdUcEsQGMzb7gn4Md97PiUW6K00YVT5QPb25jrig3nlwwuCzDTSULvqzTGKuLGCUI9A4vLedqsCLalTXUt/NOLZzUVmj2sE5MMyHyK1/WZOAoX0LcYt4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 18:03:31 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 18:03:29 +0000
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 01/22] vfio: Provide a get_region_info op
Date: Fri,  7 Nov 2025 13:41:17 -0400
Message-ID: <1-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::12) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 0607551a-8480-424e-56ff-08de1e27f500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zTrWRRWQTFjnWBxezobhRQvUOlgCgsmhQsaSR09+Vf9wyepqPe8aBHRPvF+i?=
 =?us-ascii?Q?K17v94oTjfgme35M25Q4MGf6PCVxbCele/KmML9zSK9gnldB4tABu7uALfrB?=
 =?us-ascii?Q?bqF9N/o/ioy5YzjzuI+wPeoqTKxajWwpfsSv5HYqvmOZHJPMtrptZ6pXBWXy?=
 =?us-ascii?Q?s48CHZjGFqjLwbI8Pe7GTGb9ouVjH6ufCbgdjIyqiEkCfoAldyuoZ+d+qbuN?=
 =?us-ascii?Q?1yI/0ltdg5pFN8Nljia+huQjIErD9ZPq5IPZCjJO2lFdaxmfqao/J/rmk/0j?=
 =?us-ascii?Q?QkUFMuvUlxcuzhT51Bfi9SDP4eZ06p0pTvGgVSI3AlcvGJpdii4r1SrLHJxy?=
 =?us-ascii?Q?x84+0NCcYH0DgZa9VquaJIKzpUBnwFcf0U/oW8eoRYH3f0QxvqINNGziuBFT?=
 =?us-ascii?Q?3iI8aXhJxa3BYRDIVa+lrz4QdBJ++uhOUBX13me2bpqyOQ31K9cbnZCXQLpw?=
 =?us-ascii?Q?gAxu2tXmXnNmgzmMOfBDhCs0wrCeospUIxBNV7p7p15QTPMV6knVz5D5GtRT?=
 =?us-ascii?Q?gPJBBSpmYZtgUFmubTbP4Zj68YNSayOSUU6hA6R45v4vMfYKoQCONXCqLumN?=
 =?us-ascii?Q?NJQD+2bjP0w4Pn6gUFe4+tYlL9/0ccTfxze0oVx4wKUDgU2sYlZovtn2qNm1?=
 =?us-ascii?Q?wuoSYHHU3p8IPDreu1MZflN5DWQnsL5TlYkF5WcnrsDn8Xriqfht/tY9dyPd?=
 =?us-ascii?Q?F64f1/4JSJpbhVrE2cPONHe5K2zQ8eOOGN4W+nzVmmfuxYIXgllEHKerfdel?=
 =?us-ascii?Q?voGXfHRkCK7ehdF7iG22f0Oo3zJrRHqETbV0INW2i08MykvuyP7ZvOdwBoTa?=
 =?us-ascii?Q?6oGNfr/lXzMO6s0rUyWNOdbKCWiYVfj1a1h89yi8PwvGd8nEp8GyE0MlU1va?=
 =?us-ascii?Q?ddaFiWSukKqtfPgkNXXiuiez74mZ26P4T3ismxJ0ZFHuc7Ge0KocwUnyix0P?=
 =?us-ascii?Q?wsZRwNvcsttHoTDhlgpzTMKorbcdjpSJFLEB3ixnslwPj/8Rz3M8VmHOaqsu?=
 =?us-ascii?Q?hh4zCiEsktRk9WF4VWp7MO3MsITS/Z0O+9QMHobAFxkLAEnETCYJnGTfoELr?=
 =?us-ascii?Q?eiYX/kS2HE0od/knfL2c1jKKJV5TK3yJuJV9EIitQHC1B34bAN06qfePyOpq?=
 =?us-ascii?Q?ydg/nQHv0OchAK+iCc3U3dp25MY/0R309WGxgundSJblqne5f091hMZqL7ZV?=
 =?us-ascii?Q?UrTvi4Nz3U+fj1zb00+H2tWLyPW5Zyy/xYAJu4lqhU8yXh+JlTG87cgQUcsh?=
 =?us-ascii?Q?kRGrSQWgIkCBRosOBFp/0CNGKrIolgtLi6Y7kiPuaUla+i/UEtIGOU3lrpEi?=
 =?us-ascii?Q?hWB8f2qh5bhxRdo0Hgsy4luWLpYpShGsEfLxUcAn24bcKSpUoD+hUnQPV1SI?=
 =?us-ascii?Q?rgL4EQ7RVaAzfga83KdfJLk/rnQcw81LH0vRKqLCsNZYqF7VToShk1A76eXq?=
 =?us-ascii?Q?K68szMDT/KeZ9lCnqe2Avj+E8KYW8EKeAAITudpf3QLARf1YZDKrQFHZGVid?=
 =?us-ascii?Q?XIgLf+MXrMDbFJc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PZpxRfBE9b+4Z2yXzQf6bh0UpOnZbrx2X8kadFgn1WOyzRHua3IErO/6dSFu?=
 =?us-ascii?Q?MrXoFpQ2tWXItTa7PuF66sI8WEpEfpTiXB993Qa+S1tpehxy5ha3xvzr8Vas?=
 =?us-ascii?Q?5a9iWvTOlBI1Vjgi0Yoc2L0NZw8DuZN2r1dp7u2hPNEFjkfNd7IOyzAnCLVK?=
 =?us-ascii?Q?xSoDMVKqhUYBXrhbM8vPRRT0HUOC6u9DH+aPXY6BEvKYD0ltlL0zzDdFYFdb?=
 =?us-ascii?Q?bR7rF/SJdFJrtwC6gBhs5AWDmgw/VGwlEqlj635B1jCJC2zAo+7qkW3KlgBK?=
 =?us-ascii?Q?c98g/K7IDplwdwT1G+Bc3kjCHOtTRPcoL54ls2wnwaGmCshaMJq2REztxApd?=
 =?us-ascii?Q?qLK3AXwF/aczRRh58WgqA0ayF/e9GXCwVSXpnRSbFB2P/PycRa7cb2Z+FBon?=
 =?us-ascii?Q?o4EhIF3Kw6D7zbEBCzwnK47Eusj08Nh68eutdNpGnbbmEFB1yVP3UUa2nsEl?=
 =?us-ascii?Q?cmA7noZR73P+QRxfxkuT9NChoR39vAke9ZQvyP9odzUCzFc8KXVhrPRQ1ZOb?=
 =?us-ascii?Q?mtlrLCy7KPTvQVijQtC7Q/HG0a7zPkZd3ak4ynUdmBdvZqw/dXXzGTElC1N2?=
 =?us-ascii?Q?qvZ6O5OS+/H65iIdJg4z/EDa+AOSRR7U33DcPy/QX5hgq5zE56S5mRmaxH++?=
 =?us-ascii?Q?enf7FPEHJZWT53DLs+R0T7z9VfK6rHpW9IiuTgwH9qfPVTBz0hqqQwdiAaYF?=
 =?us-ascii?Q?F+bqvRXyvdSh9PsoFbpCfda56jdj9gF1Feife//ReiII8aGbKn1WHOhXb2rd?=
 =?us-ascii?Q?xPWStJE2CPU1zkNZf064XEeVWmKERAxR8k6ToY0mXs+CQ3M0AtTmZenzMByB?=
 =?us-ascii?Q?A8K4YiIFwZYfNzQmNYX8QShElwa6rxz1BJkvj/Kz3gzBtLBs13gIOQFqLCLy?=
 =?us-ascii?Q?U2DFDdxxN2spto8nuf/BU627qN3eW6Kz5fVAxHc0KHXcmojf3Ecb4dHW1hfj?=
 =?us-ascii?Q?IBeZywHqTlj3JKDwEC5oUJtTtXuTqLLqyLQVlcocw69Fx8NwCiCoUfNcJ5ag?=
 =?us-ascii?Q?/xEDqg4u+++ddvrwLZmPuLPq3l7uM3ncU2d1lAHQXr5uqmjjt6LybsCamEDA?=
 =?us-ascii?Q?0xn6IVIerJa3IpPyKfvD/67+rgCJcK6kW8pdi99K3OUr2XThYY2NUKTcZ2C4?=
 =?us-ascii?Q?LoOONgEXkscgF8OMoNkevzjuKBAQa2p2oJ+2rs/ntO0vjKUqqgNlrOKUKoUF?=
 =?us-ascii?Q?40kHWI3NBexp0W9WTPYfB4P/V8gvZbFEuy3K9FJntGHJWMtXvDYCfYjWzoFd?=
 =?us-ascii?Q?0JbbflK1PoDTUsoC05Qcjwi+eriKmDwlWmN/EELhgnJ2fXs/RA+uxCEgm4f6?=
 =?us-ascii?Q?1hjYnxxts49NiARGmszIHWhF/+oZA2MP86ejUIttKWLfH7Y7/EacIlBzLmGk?=
 =?us-ascii?Q?oSxzZINQdIwMubHTEtBB9F0p57ViUnAxcjAcVY0cZzYK62XY/6tLD3Ry+lQv?=
 =?us-ascii?Q?KKUJ/yDjg4hSz9AAmKa8RwP7rNm2o04fekWCRuB5iIFvMGSxwc5dwFwhbeop?=
 =?us-ascii?Q?FvJYGntbeQaEe0FFc992n7B9C3nQPzd+QsSLRUrgGMtm+qFIoK5nhZdHDHJa?=
 =?us-ascii?Q?CTmOZdkDpMi6ETCR0Ew=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0607551a-8480-424e-56ff-08de1e27f500
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:03:29.7527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfCRODbV/iHSa48CLxGCGa4XEuKrKjSWhXT9gmog3rYwEpBvetQSgmmvSZwdTEGV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
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

Instead of hooking the general ioctl op, have the core code directly
decode VFIO_DEVICE_GET_REGION_INFO and call an op just for it.

This is intended to allow mechanical changes to the drivers to pull their
VFIO_DEVICE_GET_REGION_INFO int oa function. Later patches will improve
the function signature to consolidate more code.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 9 ++++++---
 drivers/vfio/vfio_main.c         | 7 +++++++
 include/linux/vfio.h             | 2 ++
 include/linux/vfio_pci_core.h    | 2 ++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 7dcf5439dedc9d..1dc350003f075c 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -996,9 +996,11 @@ static int vfio_pci_ioctl_get_info(struct vfio_pci_core_device *vdev,
 	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 }
 
-static int vfio_pci_ioctl_get_region_info(struct vfio_pci_core_device *vdev,
-					  struct vfio_region_info __user *arg)
+int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
+				   struct vfio_region_info __user *arg)
 {
+	struct vfio_pci_core_device *vdev =
+		container_of(core_vdev, struct vfio_pci_core_device, vdev);
 	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
 	struct pci_dev *pdev = vdev->pdev;
 	struct vfio_region_info info;
@@ -1132,6 +1134,7 @@ static int vfio_pci_ioctl_get_region_info(struct vfio_pci_core_device *vdev,
 
 	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 }
+EXPORT_SYMBOL_GPL(vfio_pci_ioctl_get_region_info);
 
 static int vfio_pci_ioctl_get_irq_info(struct vfio_pci_core_device *vdev,
 				       struct vfio_irq_info __user *arg)
@@ -1458,7 +1461,7 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 	case VFIO_DEVICE_GET_PCI_HOT_RESET_INFO:
 		return vfio_pci_ioctl_get_pci_hot_reset_info(vdev, uarg);
 	case VFIO_DEVICE_GET_REGION_INFO:
-		return vfio_pci_ioctl_get_region_info(vdev, uarg);
+		return vfio_pci_ioctl_get_region_info(core_vdev, uarg);
 	case VFIO_DEVICE_IOEVENTFD:
 		return vfio_pci_ioctl_ioeventfd(vdev, uarg);
 	case VFIO_DEVICE_PCI_HOT_RESET:
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 38c8e9350a60ec..a390163ce706c4 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1296,7 +1296,14 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 		ret = vfio_ioctl_device_feature(device, uptr);
 		break;
 
+	case VFIO_DEVICE_GET_REGION_INFO:
+		if (!device->ops->get_region_info)
+			goto ioctl_fallback;
+		ret = device->ops->get_region_info(device, uptr);
+		break;
+
 	default:
+ioctl_fallback:
 		if (unlikely(!device->ops->ioctl))
 			ret = -EINVAL;
 		else
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index eb563f538dee51..be5fcf8432e8d5 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -132,6 +132,8 @@ struct vfio_device_ops {
 			 size_t count, loff_t *size);
 	long	(*ioctl)(struct vfio_device *vdev, unsigned int cmd,
 			 unsigned long arg);
+	int	(*get_region_info)(struct vfio_device *vdev,
+				   struct vfio_region_info __user *arg);
 	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
 	void	(*request)(struct vfio_device *vdev, unsigned int count);
 	int	(*match)(struct vfio_device *vdev, char *buf);
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index f541044e42a2ad..160bc2e31ece75 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -115,6 +115,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 		unsigned long arg);
 int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 				void __user *arg, size_t argsz);
+int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
+				   struct vfio_region_info __user *arg);
 ssize_t vfio_pci_core_read(struct vfio_device *core_vdev, char __user *buf,
 		size_t count, loff_t *ppos);
 ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *buf,
-- 
2.43.0

