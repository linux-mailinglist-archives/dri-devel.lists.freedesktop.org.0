Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C2C03C68
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D27810E9A9;
	Thu, 23 Oct 2025 23:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MYv01RfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011061.outbound.protection.outlook.com
 [40.93.194.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8F410E99D;
 Thu, 23 Oct 2025 23:10:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfHe/o1ZLQXJWzRqrSqrQVLDrOmP6TMTacbvQ8qLsy5MWI7jaCBQedDA3rATXOFjdNsMI6gq8J67Of5B/gzkI3u6iTnvj6qKbauNGeRAGQT9d6HPU/DhLwH8dI+Ay1pRHWaIscQTz9rDG7RGqHDs4qyov6oFZ3gCdb5pNfYUDp/+ys9P/qcR8GTGjoU5yBsrul84ogLbEMFEwdJ4vkBptajN/6gFapeKNVlNDH8FsBIspCkFFNxg37oHs3XycZ28avXmvVjcHSwkNdCefInbMLjT1Izl+Q1ngN9IOhRUwOENj7xGdjetGr1lqIcQqeEMNH3mX/BjRLTV4HFk04hfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCX3FU6TnLNrI4i//iKQQ7+MzC3aPbCUIhJ4QmlZFss=;
 b=G5EcyIDfWGN9DWWNZ9zS1SFNuDRgBNsuKvm+nWvSxuWZw3tslpDKkZuWw8CkX418Xn9OfpR1H4LQJpyhE+JUkpRqiv3Zhj+zcWEzCkWcLcRxVrHhhXVHEskOFbA4982LIUYWohzcFhpQrhnnLh25o67frt9kCrOch2llQ2FQpOIYcPopNiuHJ8mzevoWtf3zmOZEHzNJeyYwtbojBj9xFLQoFYnoDEeD9BF6c+9GJ0ThenxJt/mGEoIoHQDVZEnrTy2c4ullX17q4ePXnqzxlcpNoelKLq5HXmG4NdEcUDQamF5x1W3kwWT/uCXax8i2qEvAPJ2HK3/O21X+950/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCX3FU6TnLNrI4i//iKQQ7+MzC3aPbCUIhJ4QmlZFss=;
 b=MYv01RfMhT5vrNN7NiWIaIDx0FOjTHv21okzqo9eFF6g5Z1SRZVtpMhNfLw5QTrAdm+v0TYfKVzrGRMvSoXLppbNelMzhJnqRRY7DyU5tHnAz6rSLXcDymdWiswdvpUNfuKX3UHVsr4cE7cNqaKS/D7uURS3gO+7Gwv0gi+5eaehte48JaNVME93NXSNn08YGCB8HJAAUtB+akFLGHlUx1ivvrLSLBCeY5PF5i7N8NZCWqeIIPVlOJPAPLt0UlaYTxRHSMFoo4vlMdVdV+ayoErnZuv0wkttcxFvMQJiPevhth3eZJotMUYXv6ezm0YMQynXbVQUNoxQ/3tCRT/cuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 23:09:55 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:55 +0000
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
Subject: [PATCH 19/22] vfio/pci: Convert all PCI drivers to
 get_region_info_caps
Date: Thu, 23 Oct 2025 20:09:33 -0300
Message-ID: <19-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: a5473682-155d-440c-949b-08de128942e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?po//iFFr09nl5y6qrw9EjtrIwPeUzrBnArr52vfCxdIrTLz7IfZagQq676gD?=
 =?us-ascii?Q?A3WZs5STj2A3hdq/d2zDTp735RKTL3Y9zWkpUuMc+qVSY0jazaQtni/x3zEB?=
 =?us-ascii?Q?JXZb2ti6wioJbrldUVuzITIaoxC2DRZK5fYOhfKb9QK7PH38BaweifGtEBL8?=
 =?us-ascii?Q?Y2kbwpXjMPp0lNYhzqD2qEmJxm+nqfVpybrIZiiloWE1INPJ/td6gOxwo1TH?=
 =?us-ascii?Q?G5PxVidBZ7prJ16BRcTBIO9uzuWzRLFqLKmTQqSLbGyuoshwiHEP3ozDQtnD?=
 =?us-ascii?Q?l7cwR+DHPsrmn/fqIJwdouh1i5axQRSvlvNR7SJS5bgS76CG2sL0kvP3/FWa?=
 =?us-ascii?Q?VJzUv1g8maXnho1K5p8M9qqGa5jTyAG4Ywxu8SIbOYq5USqqfvu5gxrSkV1F?=
 =?us-ascii?Q?YSfUp+eJbhQqNq/p9vrNPnNsAs+REgbGiEGgok7SBiLcBEvf8M9xBvEK+OBF?=
 =?us-ascii?Q?//mUk/SeixdggfaWuh1dbjMJFSURPgQVYvYJ9fmc6E+aYD46mQUlx7kV75oL?=
 =?us-ascii?Q?N0BrctfTTsGr9uSewVci7LmSqEE6fbC0fnQzwFVlNX0xXxAYWVE13q2gxYHY?=
 =?us-ascii?Q?DCC4SwcWs+yEAQUjTgJLLB/WR5yfPJbJGHjTSIs5x9BXoOmyMgkuq6jWWZoQ?=
 =?us-ascii?Q?HDwec8HawOkb8LZujiO6AGs0q2jAYABe9Mso9RGSjfERQhhtS5lrXzER5xEP?=
 =?us-ascii?Q?oR4OOe7bO3tgOmmZnclEpXONBV8QHijoeRU8VW2NS0gMh9jdQNNglPkG18mW?=
 =?us-ascii?Q?YM+18RPvCwgVs/a8XPxJZMZzH/knP4sdMCs3YB7QKVyXalHbJmZ0HpHszFI2?=
 =?us-ascii?Q?SvmieuxPPEs0Zj7Lgiv35u5brjI78sF/M6qkWxV67uzdipiQfuK4NHit0/be?=
 =?us-ascii?Q?BWzsA/jdW6Xx4wpNH+aCYBUBefdiTeux4o3h2eoykZd97FaSvkW8U5RCNZKm?=
 =?us-ascii?Q?lOla0/vZLA3+tb8SREr4/OxRzKjSfyzwcnYmv6hgckPpVSwCv4lmhunwqVRB?=
 =?us-ascii?Q?HrobzJwwBAgNxmZT/CvLyxnIgPcR3K8Vzr7eZYwx233Jjq+69BQMmBLE4s34?=
 =?us-ascii?Q?6cEdNpyoJZorTmWD2/UuWlPdWLxEWrmdrcFED+gTe4RrnWCmqeCtZoYQir3E?=
 =?us-ascii?Q?X3m+bGEyz/9821ldbE365h2DmiDXZoPcTuzd9/00+SLQr09qipkvi0nYU9/l?=
 =?us-ascii?Q?XeZeKu1rA33mHGBpoqtqZRxQOiTYEF0z06n9BEW6P+LPM1OLEGxIfnMiuxT0?=
 =?us-ascii?Q?pcxxMVTHajn14KIKGbf1IBIOVDl8wKfJiaOTw1ZAq3YKbIw2WNDsTh6nRGZt?=
 =?us-ascii?Q?Wr26oqN1SlY3wGcmpa95uKIIBwtHL56zfhx0ZMh8ojsTgX41mvPY3ecI4lu1?=
 =?us-ascii?Q?KUNFtzyE83e+RiTTQDyaerpIq5mMxOn7Krv9LLFTqfYIozAXV2z8cTv4xBy7?=
 =?us-ascii?Q?ttzHhQcAdGD+y3MZTiM268Y8QazccYhGdU9dpMbZopV9yZ+KmV+TXJl7zOZN?=
 =?us-ascii?Q?WMZg8Q+xryO1TMs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F29CQToBDRNmreX75AVSihaxrBC98+3UEXRZVxtd/AJUw9y3qQzOlYe0xZKZ?=
 =?us-ascii?Q?uv1kaS+AXoNJazySWAKFhtALx3yAD0tQ4T+RXJpciuaMcZ8XQw08jwpmkYS8?=
 =?us-ascii?Q?NyEZG5G9JEuSw5PCaAFHri7AOdB5X/m4rzbXr32cDrLoip4md9Ot8xVu8bSI?=
 =?us-ascii?Q?MIN2Wk2HV00Q0GhCAtXANQwlc9+yJZpjeLR2j0aHfQFJ8a9hyhsvdFsP0ws8?=
 =?us-ascii?Q?w0Qp4AhBbjE64Qpr2ovlllwrxQ6EomGUENtmbQxTl0F9xw6vUWW6+oGnJYSm?=
 =?us-ascii?Q?ht7t6tHJPEtOwpmhqp4NzXAFY3+DqB4GTKOFnixsB8H88294W3TNQsSYnWp7?=
 =?us-ascii?Q?dwD6l+6av0jwFfTCkB5SEgJSa8OQDb5ikIAvTm4KjiWq1JGfTnOgKSEimfyB?=
 =?us-ascii?Q?bADAF/x9K3oqk6Btvn2S2xScwHHBVY9bmzoS0P7W6Z2xQIZmdUoO8Kazf9Y+?=
 =?us-ascii?Q?Qlk0ZMNZmgA2XJKDGZn1Fs6SLmNug1cIB4g38+KkuSMxvWH2AKyrdMNAcJhK?=
 =?us-ascii?Q?KPsh1sAEU7EqcHFVCtBI8OjbtQtakxQFcvX+3XZLUwULgTVsA5zjQMT7f2n9?=
 =?us-ascii?Q?xMusPf7el/f8GOQzDaD/v1w8CJpWgm44j/gIaYg5e+MdOpE6flApL9gwob9p?=
 =?us-ascii?Q?Xleh8xppl1RARj7Oa0BkU5dq4g9Eg1KIxBPMaSwT6s+2xlf22tm5r1HZDIEn?=
 =?us-ascii?Q?1hymzEdk+xy0PYpefyWm3W+pfeHja457v+l8kNzTFtggmZdh8k1UUY77DwdL?=
 =?us-ascii?Q?YZ9N7dVnjpchxkq6z515lj9TRcTv9UxH7BOcpc/R3VjAHj2wxPI00AHpVO+e?=
 =?us-ascii?Q?cNI7vC/zmtpUzJQhndqT9XEaxxVDUEP4prV/NzO+e2ibnSgfICRrebdiqYxQ?=
 =?us-ascii?Q?C6mVONHL1RC9rAN/trzud74Dmyx6LdvFAw3aEdR7we/Tcspt8D7bjTeckq4m?=
 =?us-ascii?Q?wlvgN0kHu5AYQUXAofWLkLGK9kRx8VBPuBg8/kWSCcaO7D6eRi6WqhfsYRpF?=
 =?us-ascii?Q?IpaImhGiQ5bfbtapmqpg2PpBx4a0Lf0jLvNEhprmNJwGvlnaS/fZEAb3cb6M?=
 =?us-ascii?Q?HputXQUXQRPcK38iCeSWs+ZxWXnZcykjKY9KlWuE3Wwwxmw+xIAtlD5AJWJu?=
 =?us-ascii?Q?hy3vPXhtKd7MiQq78hl0PnivLse7jy9ULgV//tmYBUjp9iljbhYhSKJFEY/G?=
 =?us-ascii?Q?ISc9+3APBeTK1GZ1DBtRQBdteFu0l8J9sYUywxu4WIMP4HzYEng5h3mb5gU3?=
 =?us-ascii?Q?1CagAcjwsChHRMhaZ1GsgLTBu4Dn6Tb6JZXQ64Zt7q0rpL2ob8Uce9G4YL7z?=
 =?us-ascii?Q?f6zfzFit9gC97rDuKK+z6S6XhwZ+ef8Yjp5zBYqf+iyz2IZxdxUbKGK2mFkz?=
 =?us-ascii?Q?I0wckP1k7SD+RfwFKbjZKG+5V3AOTKq8Xmpb2R/OT58QwoETcEUiMbDhYfm3?=
 =?us-ascii?Q?yWAjzQhvLMQnW4zHIheZTuPAl1lFTVH4CqbRAjt/0gxx+ivuO6lfGZoIxZzv?=
 =?us-ascii?Q?YTym0q0jVpeXoQdKpl3lJCt4E1vQy7io0wRxuBtguOpa4aDQ0tya2ui1HYjz?=
 =?us-ascii?Q?wqldVsyGTBdMoac3xGdE7FFGRSn3rQ3njJuU3pkN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5473682-155d-440c-949b-08de128942e9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:48.2210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/Uy2d9lBEKFDsVIdiEJ9kgmzv/6BcmOp4Asb3BiKlbP+ihFsdJ/GxTbbvR3P9fw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652
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

Since the core function signature changes it has to flow up to all
drivers.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  30 ++---
 drivers/vfio/pci/mlx5/main.c                  |   2 +-
 drivers/vfio/pci/nvgrace-gpu/main.c           |  51 ++-------
 drivers/vfio/pci/pds/vfio_dev.c               |   2 +-
 drivers/vfio/pci/qat/main.c                   |   2 +-
 drivers/vfio/pci/vfio_pci.c                   |   2 +-
 drivers/vfio/pci/vfio_pci_core.c              | 103 +++++++-----------
 drivers/vfio/pci/virtio/common.h              |   3 +-
 drivers/vfio/pci/virtio/legacy_io.c           |  26 ++---
 drivers/vfio/pci/virtio/main.c                |   6 +-
 include/linux/vfio_pci_core.h                 |   3 +-
 11 files changed, 80 insertions(+), 150 deletions(-)

diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
index 99e67e3dda3498..0d575bd5ce67c4 100644
--- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
+++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
@@ -1325,38 +1325,28 @@ static ssize_t hisi_acc_vfio_pci_read(struct vfio_device *core_vdev,
 }
 
 static int hisi_acc_vfio_get_region(struct vfio_device *core_vdev,
-				    struct vfio_region_info __user *arg)
+				    struct vfio_region_info *info,
+				    struct vfio_info_cap *caps)
 {
 	struct vfio_pci_core_device *vdev =
 		container_of(core_vdev, struct vfio_pci_core_device, vdev);
 	struct pci_dev *pdev = vdev->pdev;
-	struct vfio_region_info info;
-	unsigned long minsz;
 
-	minsz = offsetofend(struct vfio_region_info, offset);
+	if (info->index != VFIO_PCI_BAR2_REGION_INDEX)
+		return vfio_pci_ioctl_get_region_info(core_vdev, info, caps);
 
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	if (info.index != VFIO_PCI_BAR2_REGION_INDEX)
-		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
-
-	info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+	info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
 
 	/*
 	 * ACC VF dev BAR2 region consists of both functional
 	 * register space and migration control register space.
 	 * Report only the functional region to Guest.
 	 */
-	info.size = pci_resource_len(pdev, info.index) / 2;
+	info->size = pci_resource_len(pdev, info->index) / 2;
 
-	info.flags = VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_WRITE |
+	info->flags = VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_WRITE |
 		     VFIO_REGION_INFO_FLAG_MMAP;
-
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+	return 0;
 }
 
 static int hisi_acc_vf_debug_check(struct seq_file *seq, struct vfio_device *vdev)
@@ -1554,7 +1544,7 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_migrn_ops = {
 	.open_device = hisi_acc_vfio_pci_open_device,
 	.close_device = hisi_acc_vfio_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
-	.get_region_info = hisi_acc_vfio_get_region,
+	.get_region_info_caps = hisi_acc_vfio_get_region,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = hisi_acc_vfio_pci_read,
 	.write = hisi_acc_vfio_pci_write,
@@ -1574,7 +1564,7 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_ops = {
 	.open_device = hisi_acc_vfio_pci_open_device,
 	.close_device = vfio_pci_core_close_device,
 	.ioctl = vfio_pci_core_ioctl,
-	.get_region_info = vfio_pci_ioctl_get_region_info,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
diff --git a/drivers/vfio/pci/mlx5/main.c b/drivers/vfio/pci/mlx5/main.c
index b7f941f8047ea4..9c5970411d07a1 100644
--- a/drivers/vfio/pci/mlx5/main.c
+++ b/drivers/vfio/pci/mlx5/main.c
@@ -1366,7 +1366,7 @@ static const struct vfio_device_ops mlx5vf_pci_ops = {
 	.open_device = mlx5vf_pci_open_device,
 	.close_device = mlx5vf_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
-	.get_region_info = vfio_pci_ioctl_get_region_info,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
index cab743a30dc35d..5a6f77d5c81e0f 100644
--- a/drivers/vfio/pci/nvgrace-gpu/main.c
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c
@@ -205,34 +205,25 @@ static int nvgrace_gpu_mmap(struct vfio_device *core_vdev,
 	return 0;
 }
 
-static int
-nvgrace_gpu_ioctl_get_region_info(struct vfio_device *core_vdev,
-				  struct vfio_region_info __user *arg)
+static int nvgrace_gpu_ioctl_get_region_info(struct vfio_device *core_vdev,
+					     struct vfio_region_info *info,
+					     struct vfio_info_cap *caps)
 {
 	struct nvgrace_gpu_pci_core_device *nvdev =
 		container_of(core_vdev, struct nvgrace_gpu_pci_core_device,
 			     core_device.vdev);
-	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
-	struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
 	struct vfio_region_info_cap_sparse_mmap *sparse;
-	struct vfio_region_info info;
 	struct mem_region *memregion;
 	u32 size;
 	int ret;
 
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
 	/*
 	 * Request to determine the BAR region information. Send the
 	 * GPU memory information.
 	 */
-	memregion = nvgrace_gpu_memregion(info.index, nvdev);
+	memregion = nvgrace_gpu_memregion(info->index, nvdev);
 	if (!memregion)
-		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
+		return vfio_pci_ioctl_get_region_info(core_vdev, info, caps);
 
 	size = struct_size(sparse, areas, 1);
 
@@ -251,40 +242,22 @@ nvgrace_gpu_ioctl_get_region_info(struct vfio_device *core_vdev,
 	sparse->header.id = VFIO_REGION_INFO_CAP_SPARSE_MMAP;
 	sparse->header.version = 1;
 
-	ret = vfio_info_add_capability(&caps, &sparse->header, size);
+	ret = vfio_info_add_capability(caps, &sparse->header, size);
 	kfree(sparse);
 	if (ret)
 		return ret;
 
-	info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+	info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
 	/*
 	 * The region memory size may not be power-of-2 aligned.
 	 * Given that the memory is a BAR and may not be
 	 * aligned, roundup to the next power-of-2.
 	 */
-	info.size = memregion->bar_size;
-	info.flags = VFIO_REGION_INFO_FLAG_READ |
+	info->size = memregion->bar_size;
+	info->flags = VFIO_REGION_INFO_FLAG_READ |
 		     VFIO_REGION_INFO_FLAG_WRITE |
 		     VFIO_REGION_INFO_FLAG_MMAP;
-
-	if (caps.size) {
-		info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
-		if (info.argsz < sizeof(info) + caps.size) {
-			info.argsz = sizeof(info) + caps.size;
-			info.cap_offset = 0;
-		} else {
-			vfio_info_cap_shift(&caps, sizeof(info));
-			if (copy_to_user((void __user *)arg +
-					 sizeof(info), caps.buf,
-					 caps.size)) {
-				kfree(caps.buf);
-				return -EFAULT;
-			}
-			info.cap_offset = sizeof(info);
-		}
-		kfree(caps.buf);
-	}
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+	return 0;
 }
 
 static long nvgrace_gpu_ioctl(struct vfio_device *core_vdev,
@@ -686,7 +659,7 @@ static const struct vfio_device_ops nvgrace_gpu_pci_ops = {
 	.open_device	= nvgrace_gpu_open_device,
 	.close_device	= nvgrace_gpu_close_device,
 	.ioctl		= nvgrace_gpu_ioctl,
-	.get_region_info = nvgrace_gpu_ioctl_get_region_info,
+	.get_region_info_caps = nvgrace_gpu_ioctl_get_region_info,
 	.device_feature	= vfio_pci_core_ioctl_feature,
 	.read		= nvgrace_gpu_read,
 	.write		= nvgrace_gpu_write,
@@ -707,7 +680,7 @@ static const struct vfio_device_ops nvgrace_gpu_pci_core_ops = {
 	.open_device	= nvgrace_gpu_open_device,
 	.close_device	= vfio_pci_core_close_device,
 	.ioctl		= vfio_pci_core_ioctl,
-	.get_region_info = vfio_pci_ioctl_get_region_info,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
 	.device_feature	= vfio_pci_core_ioctl_feature,
 	.read		= vfio_pci_core_read,
 	.write		= vfio_pci_core_write,
diff --git a/drivers/vfio/pci/pds/vfio_dev.c b/drivers/vfio/pci/pds/vfio_dev.c
index 1946bc75d99b49..be103c74e96957 100644
--- a/drivers/vfio/pci/pds/vfio_dev.c
+++ b/drivers/vfio/pci/pds/vfio_dev.c
@@ -195,7 +195,7 @@ static const struct vfio_device_ops pds_vfio_ops = {
 	.open_device = pds_vfio_open_device,
 	.close_device = pds_vfio_close_device,
 	.ioctl = vfio_pci_core_ioctl,
-	.get_region_info = vfio_pci_ioctl_get_region_info,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
diff --git a/drivers/vfio/pci/qat/main.c b/drivers/vfio/pci/qat/main.c
index 8452d9c1d11d3a..8fbdf7c6d666e1 100644
--- a/drivers/vfio/pci/qat/main.c
+++ b/drivers/vfio/pci/qat/main.c
@@ -609,7 +609,7 @@ static const struct vfio_device_ops qat_vf_pci_ops = {
 	.open_device = qat_vf_pci_open_device,
 	.close_device = qat_vf_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
-	.get_region_info = vfio_pci_ioctl_get_region_info,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
 	.mmap = vfio_pci_core_mmap,
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 2d9122efc10baa..a3e49d42c771bc 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -132,7 +132,7 @@ static const struct vfio_device_ops vfio_pci_ops = {
 	.open_device	= vfio_pci_open_device,
 	.close_device	= vfio_pci_core_close_device,
 	.ioctl		= vfio_pci_core_ioctl,
-	.get_region_info = vfio_pci_ioctl_get_region_info,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read		= vfio_pci_core_read,
 	.write		= vfio_pci_core_write,
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index f21d9026068c37..57c0766fb9f80f 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -997,43 +997,35 @@ static int vfio_pci_ioctl_get_info(struct vfio_pci_core_device *vdev,
 }
 
 int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
-				   struct vfio_region_info __user *arg)
+				   struct vfio_region_info *info,
+				   struct vfio_info_cap *caps)
 {
 	struct vfio_pci_core_device *vdev =
 		container_of(core_vdev, struct vfio_pci_core_device, vdev);
-	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
 	struct pci_dev *pdev = vdev->pdev;
-	struct vfio_region_info info;
-	struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
 	int i, ret;
 
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	switch (info.index) {
+	switch (info->index) {
 	case VFIO_PCI_CONFIG_REGION_INDEX:
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = pdev->cfg_size;
-		info.flags = VFIO_REGION_INFO_FLAG_READ |
-			     VFIO_REGION_INFO_FLAG_WRITE;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = pdev->cfg_size;
+		info->flags = VFIO_REGION_INFO_FLAG_READ |
+			      VFIO_REGION_INFO_FLAG_WRITE;
 		break;
 	case VFIO_PCI_BAR0_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = pci_resource_len(pdev, info.index);
-		if (!info.size) {
-			info.flags = 0;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = pci_resource_len(pdev, info->index);
+		if (!info->size) {
+			info->flags = 0;
 			break;
 		}
 
-		info.flags = VFIO_REGION_INFO_FLAG_READ |
-			     VFIO_REGION_INFO_FLAG_WRITE;
-		if (vdev->bar_mmap_supported[info.index]) {
-			info.flags |= VFIO_REGION_INFO_FLAG_MMAP;
-			if (info.index == vdev->msix_bar) {
-				ret = msix_mmappable_cap(vdev, &caps);
+		info->flags = VFIO_REGION_INFO_FLAG_READ |
+			      VFIO_REGION_INFO_FLAG_WRITE;
+		if (vdev->bar_mmap_supported[info->index]) {
+			info->flags |= VFIO_REGION_INFO_FLAG_MMAP;
+			if (info->index == vdev->msix_bar) {
+				ret = msix_mmappable_cap(vdev, caps);
 				if (ret)
 					return ret;
 			}
@@ -1045,9 +1037,9 @@ int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
 		size_t size;
 		u16 cmd;
 
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.flags = 0;
-		info.size = 0;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->flags = 0;
+		info->size = 0;
 
 		if (pci_resource_start(pdev, PCI_ROM_RESOURCE)) {
 			/*
@@ -1057,16 +1049,17 @@ int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
 			cmd = vfio_pci_memory_lock_and_enable(vdev);
 			io = pci_map_rom(pdev, &size);
 			if (io) {
-				info.flags = VFIO_REGION_INFO_FLAG_READ;
+				info->flags = VFIO_REGION_INFO_FLAG_READ;
 				/* Report the BAR size, not the ROM size. */
-				info.size = pci_resource_len(pdev, PCI_ROM_RESOURCE);
+				info->size = pci_resource_len(pdev,
+							      PCI_ROM_RESOURCE);
 				pci_unmap_rom(pdev, io);
 			}
 			vfio_pci_memory_unlock_and_restore(vdev, cmd);
 		} else if (pdev->rom && pdev->romlen) {
-			info.flags = VFIO_REGION_INFO_FLAG_READ;
+			info->flags = VFIO_REGION_INFO_FLAG_READ;
 			/* Report BAR size as power of two. */
-			info.size = roundup_pow_of_two(pdev->romlen);
+			info->size = roundup_pow_of_two(pdev->romlen);
 		}
 
 		break;
@@ -1075,10 +1068,10 @@ int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
 		if (!vdev->has_vga)
 			return -EINVAL;
 
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = 0xc0000;
-		info.flags = VFIO_REGION_INFO_FLAG_READ |
-			     VFIO_REGION_INFO_FLAG_WRITE;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = 0xc0000;
+		info->flags = VFIO_REGION_INFO_FLAG_READ |
+			      VFIO_REGION_INFO_FLAG_WRITE;
 
 		break;
 	default: {
@@ -1087,52 +1080,34 @@ int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
 			.header.version = 1
 		};
 
-		if (info.index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions)
+		if (info->index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions)
 			return -EINVAL;
-		info.index = array_index_nospec(
-			info.index, VFIO_PCI_NUM_REGIONS + vdev->num_regions);
+		info->index = array_index_nospec(
+			info->index, VFIO_PCI_NUM_REGIONS + vdev->num_regions);
 
-		i = info.index - VFIO_PCI_NUM_REGIONS;
+		i = info->index - VFIO_PCI_NUM_REGIONS;
 
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = vdev->region[i].size;
-		info.flags = vdev->region[i].flags;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = vdev->region[i].size;
+		info->flags = vdev->region[i].flags;
 
 		cap_type.type = vdev->region[i].type;
 		cap_type.subtype = vdev->region[i].subtype;
 
-		ret = vfio_info_add_capability(&caps, &cap_type.header,
+		ret = vfio_info_add_capability(caps, &cap_type.header,
 					       sizeof(cap_type));
 		if (ret)
 			return ret;
 
 		if (vdev->region[i].ops->add_capability) {
 			ret = vdev->region[i].ops->add_capability(
-				vdev, &vdev->region[i], &caps);
+				vdev, &vdev->region[i], caps);
 			if (ret)
 				return ret;
 		}
 	}
 	}
-
-	if (caps.size) {
-		info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
-		if (info.argsz < sizeof(info) + caps.size) {
-			info.argsz = sizeof(info) + caps.size;
-			info.cap_offset = 0;
-		} else {
-			vfio_info_cap_shift(&caps, sizeof(info));
-			if (copy_to_user(arg + 1, caps.buf, caps.size)) {
-				kfree(caps.buf);
-				return -EFAULT;
-			}
-			info.cap_offset = sizeof(*arg);
-		}
-
-		kfree(caps.buf);
-	}
-
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(vfio_pci_ioctl_get_region_info);
 
diff --git a/drivers/vfio/pci/virtio/common.h b/drivers/vfio/pci/virtio/common.h
index a10f2d92cb6238..cb3d5e57d3a3e9 100644
--- a/drivers/vfio/pci/virtio/common.h
+++ b/drivers/vfio/pci/virtio/common.h
@@ -110,7 +110,8 @@ void virtiovf_migration_reset_done(struct pci_dev *pdev);
 #ifdef CONFIG_VIRTIO_VFIO_PCI_ADMIN_LEGACY
 int virtiovf_open_legacy_io(struct virtiovf_pci_core_device *virtvdev);
 int virtiovf_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
-				       struct vfio_region_info __user *arg);
+				       struct vfio_region_info *info,
+				       struct vfio_info_cap *caps);
 ssize_t virtiovf_pci_core_write(struct vfio_device *core_vdev,
 				const char __user *buf, size_t count,
 				loff_t *ppos);
diff --git a/drivers/vfio/pci/virtio/legacy_io.c b/drivers/vfio/pci/virtio/legacy_io.c
index d735d5c4bd7775..1ed349a556291b 100644
--- a/drivers/vfio/pci/virtio/legacy_io.c
+++ b/drivers/vfio/pci/virtio/legacy_io.c
@@ -281,29 +281,19 @@ ssize_t virtiovf_pci_core_write(struct vfio_device *core_vdev, const char __user
 }
 
 int virtiovf_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
-				       struct vfio_region_info __user *arg)
+				       struct vfio_region_info *info,
+				       struct vfio_info_cap *caps)
 {
 	struct virtiovf_pci_core_device *virtvdev = container_of(
 		core_vdev, struct virtiovf_pci_core_device, core_device.vdev);
-	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
-	struct vfio_region_info info = {};
 
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
+	if (info->index != VFIO_PCI_BAR0_REGION_INDEX)
+		return vfio_pci_ioctl_get_region_info(core_vdev, info, caps);
 
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	switch (info.index) {
-	case VFIO_PCI_BAR0_REGION_INDEX:
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = virtvdev->bar0_virtual_buf_size;
-		info.flags = VFIO_REGION_INFO_FLAG_READ |
-			     VFIO_REGION_INFO_FLAG_WRITE;
-		return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
-	default:
-		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
-	}
+	info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+	info->size = virtvdev->bar0_virtual_buf_size;
+	info->flags = VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_WRITE;
+	return 0;
 }
 
 static int virtiovf_set_notify_addr(struct virtiovf_pci_core_device *virtvdev)
diff --git a/drivers/vfio/pci/virtio/main.c b/drivers/vfio/pci/virtio/main.c
index d68096bc525215..d2e5cbca13c857 100644
--- a/drivers/vfio/pci/virtio/main.c
+++ b/drivers/vfio/pci/virtio/main.c
@@ -88,7 +88,7 @@ static const struct vfio_device_ops virtiovf_vfio_pci_lm_ops = {
 	.open_device = virtiovf_pci_open_device,
 	.close_device = virtiovf_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
-	.get_region_info = vfio_pci_ioctl_get_region_info,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
@@ -110,7 +110,7 @@ static const struct vfio_device_ops virtiovf_vfio_pci_tran_lm_ops = {
 	.open_device = virtiovf_pci_open_device,
 	.close_device = virtiovf_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
-	.get_region_info = virtiovf_pci_ioctl_get_region_info,
+	.get_region_info_caps = virtiovf_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = virtiovf_pci_core_read,
 	.write = virtiovf_pci_core_write,
@@ -132,7 +132,7 @@ static const struct vfio_device_ops virtiovf_vfio_pci_ops = {
 	.open_device = virtiovf_pci_open_device,
 	.close_device = vfio_pci_core_close_device,
 	.ioctl = vfio_pci_core_ioctl,
-	.get_region_info = vfio_pci_ioctl_get_region_info,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index 160bc2e31ece75..e74f94c17fbeb6 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -116,7 +116,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 				void __user *arg, size_t argsz);
 int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
-				   struct vfio_region_info __user *arg);
+				   struct vfio_region_info *info,
+				   struct vfio_info_cap *caps);
 ssize_t vfio_pci_core_read(struct vfio_device *core_vdev, char __user *buf,
 		size_t count, loff_t *ppos);
 ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *buf,
-- 
2.43.0

