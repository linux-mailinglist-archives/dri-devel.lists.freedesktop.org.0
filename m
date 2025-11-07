Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73DDC4118B
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C6410EB54;
	Fri,  7 Nov 2025 17:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W9qzh4Rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E7E10EB2F;
 Fri,  7 Nov 2025 17:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okDIwe2Y9sICCrYYNqGlnRGRTQqCH33kGrKyJHQWZhoFY/7qEHgby+F7qCNx2IV27CmErNEfbWBVWWoBEJ1LLUcTFWVKNyJOckV8GT95McgsIKtHBBNg6zA9z9mhCKZRASuYa92s9rqliUQq9Z1W47/oz0xQSkTuAiGRjg/AezLFWTBrGojpkeoLzObveV+BQdTHwY2j528rolasXwSyCXu4xMH4o1eAgBsiJY6qy3nqp+6CbWLOhK/rtpRwjGx1o/pybynzOFGSOfE75VqFkp/1ePu5ax4GvVN9crPNNPDgpD+WiDSaAASKkdzSbfR51OWbo0HaW8Dy7Vs7VLu/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoGWM3vuBG3qbJOry6bqPVajtxceSkw6W3A2YthdofA=;
 b=JTXBt60dNWRA/MN2W1q1z2vNfSdOzS8ModPH7y3K6AKgIdIcJe+AWgkyrX3tU6gEmza+PPXg9TvU2NhP/LBfpkqIQZ4bKvirqDfwHwiof8sus8R1ABJ7xZp/n3OWzSlMngiSR1+UvqzejbhsdLJUswJhksrr4YDN1yQE1mQjIIfgPlY7YuH0UHodQUd1tOFGEcKQyi6QpZ1CId4KPq5qZxJMgPLEHa2hW11W9NO31Sk+l5h3cJ3NCIQ/Zqy0SYcAUAYLlitIdfyb0uaF0tDTWTEmkeRXaU9RQHg3klMuv4Gl9/Q4WQoF6EN1AhjXgUX2tCa0BOwSC1jB8vqlCJgITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoGWM3vuBG3qbJOry6bqPVajtxceSkw6W3A2YthdofA=;
 b=W9qzh4Rx6hAWJvf75WzrXBWHINsjTof3DJkfGL/RJiO8q4jTyegonHO0d6Ts7Ww11Dp2VRPczOdAl/csSoLVMCtIG5AgYP8+qBFhYiRq910m03iPK0M8c8WNyXUNq4Dn7GR8CEvDXrFVysmJ+H+79vOsJ+iCOL9HR+mFITdGW7YwjJjhCkSUnCW94W8m4DTnKdl1ixtbMGGLa254GAJApMktB+TD/7mrvcpmUJfvirLLHB7UhDWGGYti3HbdhcROaDvyDXVjbzKC+n6w9ZmzMg0x2WQGMk04PKcbzgNzfNX9JP+CQjQi/QQOEbPuELfpQBoyJKyF77iOQQLAcRusQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:42 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:42 +0000
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
Subject: [PATCH v2 19/22] vfio/pci: Convert all PCI drivers to
 get_region_info_caps
Date: Fri,  7 Nov 2025 13:41:35 -0400
Message-ID: <19-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0412.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::27) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: d9358285-cf8a-4a6e-39ef-08de1e24e8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8+ZsM0F8glTtEWzIBiOK3R/ZVNiEIwX5d6hBt97gRa2U2knSPLv7PoovWQgr?=
 =?us-ascii?Q?P9WiBVpeP80yPqeaoJ3wNOW9qN8cfhJAUj792+/sRiAv9tp1AaVYiYhSqkdZ?=
 =?us-ascii?Q?Fpuccwf8wbV1/Yawq798SrqtDkAgYzIV6drM4eGpxSjOnoAZPn1mzqjb4LzW?=
 =?us-ascii?Q?y+jnqwalFnJoBkwHsTYCZNw1/A03IGd8IMku3jqkAr9lP0651w40NCMHhDUj?=
 =?us-ascii?Q?GCeWm5C9Ta/2NTlQ/Cm92CD+LrxqV8w0CbyNImb7JPwxd0uhEn2kvwImugdI?=
 =?us-ascii?Q?1wroSous/Fza/jp/0KfWEdjKi52hk/hWWC89m3W/5SHX4LFaUSLh54bvrgf+?=
 =?us-ascii?Q?YQvVL3V3G1UmuYc7QvR5J9SAMg1+ykwY2xFQHnugDnIRK/yTuUt7PJUokmo+?=
 =?us-ascii?Q?66VY3sVy6GX/rAZuxcxNu0kjkAkz0vsdh6DkFPk+MFwjAmlaX3NRwskVkgYy?=
 =?us-ascii?Q?SxPAoTnffC+2j4f8FIv8uA9SeQFFLi7mAlwsz2B/qRG0nlwupUWTShYMbUJb?=
 =?us-ascii?Q?RKM/zgTnfYPFJzdItDm9U8daHpNF3rebjzgZ4LVQzHKwKjTGWA6v+D9PyYTi?=
 =?us-ascii?Q?+uR2AAOVuD3Yt0kF4AhLfGWBfIcjGqBC5r+8fmBNM6Ac8hLK+G5laqgRR4bq?=
 =?us-ascii?Q?0M3CoQ3xgiiyGsASTLHvMzaji1Q4tqEs2Tk117vrps0AnsiMM4wlwV/BSCMe?=
 =?us-ascii?Q?U8IvwtGo9F3Nb+vjSR/2mEGBfles4BB+WXHpHSliq/Xj+Xe8GcL5qKFvCfTR?=
 =?us-ascii?Q?oEB8dP9YbUfzdmAIzWvErqfjlz13Xfu9VIn2n4ym/MqorLAF/8pk9a9hY4WM?=
 =?us-ascii?Q?Xtwa3TS8cC2pJR7S6FRQ9qSyF363Uf51ana79ckB7rtAVS7+OCfyyACAwkMn?=
 =?us-ascii?Q?PUnWC79cEAwzLnv15X8+W5mTevLe+UgQpTkHG6AVEyGmEgw0X7GiCqbs+Tvu?=
 =?us-ascii?Q?mpuwoNOOe4037j6iaFXcy87b3yO8bLGu0iU1nKgiCh51Z+IuavLUHNyfyHw+?=
 =?us-ascii?Q?b7LG07tJzYle4zOqBPG1Sp+VbWws9xox5DAwZsuwIyn8++HuueSzZiJYUw1f?=
 =?us-ascii?Q?xR0z/8d1LwtimtM93ymbqT07lLduLgtMgcXBM4eKaYEmThEMPN4IP0tdCHWh?=
 =?us-ascii?Q?XjJVhcbsNulF2/IKwBrjM7Sa+8iF2VIXqrC5k9Ipkn4T3OpZuw0UJU8UFQYT?=
 =?us-ascii?Q?CbMi925Noh4uDuGo4kFSsP1UuaBYqEiT0FOqSdPW/ta1k3asEQAZjGx0fiRu?=
 =?us-ascii?Q?e6mGeNxFmmOFiGSGnmUWeCXa+xxvQHylLQgAdk4/f9A9gbiIya7NOAEppIvg?=
 =?us-ascii?Q?Y4TpGGN3Z4qrmOcknKcxsrD0dAAukmhmdS+hp4OFxvuuolgtaLl1o2jgy+tc?=
 =?us-ascii?Q?nRQPkzfudKa6E/DBlBAQuGYTwSv/lsALrQ7RbIL4636V3GHCtuaLERwiDVoa?=
 =?us-ascii?Q?5JawF42nBdBFURiNSn1HvXZcC20/6MbI3N+SQOBb4F02iELSK96bgy5OpU39?=
 =?us-ascii?Q?zPQ8znZD/MI2jr4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FKqRjwHiwOWZSRP4w5AWVjDSGxQx/67RNw8eO4/RUSuqiq4seXlFk9Lceby+?=
 =?us-ascii?Q?1pm8ndSr9VgHTvrAVltMCUBddk2/rU0lu39nwANes416flmBJFaQnnbKCHVO?=
 =?us-ascii?Q?KySaaRCByJEZqfxsj9AuqVqmYjn5EwWzcUuQ199DIFT4HpcyRAfIsGenq69i?=
 =?us-ascii?Q?/0ouYuJ0IeSTwbnF8k9Tof8++R7k9xkgCNSJOjbjC0GineSRBPhW5vn+Uddp?=
 =?us-ascii?Q?LeTkMw6YrhcOCf9jbxvCbbyrMB/W0zzLnVOFEn3tLViZ/G9wTBDRUUXMfJJJ?=
 =?us-ascii?Q?D+B31mzOHG4iAmOt/QXi0csJOqoYt8HzybnCUvYZZB+U7PyjQvOqPFcw9r/r?=
 =?us-ascii?Q?Tv2mdaaNa6kJrUi3oqnCKuUSM9xJdsIGUIPGxGRGLgIPA1XUU+adVk4NBdmN?=
 =?us-ascii?Q?vpbR1iqiU7yJXSODlIw8tV7lHpOTJXxt7U0DNLtIWOixt6r/IT6aUqS8I14o?=
 =?us-ascii?Q?fZrGnWZD+Ruc8uDr30te/Atyrq+dnKdHbjUOIfQhZcraENWpK4GRpkaE/+J8?=
 =?us-ascii?Q?2CNRjLaTZpjVy4LU4fwZycRlKIsx/9HCkD7wWB+eAVk56f5a5r4THKVVMydO?=
 =?us-ascii?Q?JLUVxABqvQF7Ub7NLWy66lwbh3FaqQQ5Rul/WezBk0hGWyJ9euH88/+Hm9gf?=
 =?us-ascii?Q?65PF4XQLFnC/vyeecFjaZHo0L4RULHhHLNcg5iPjal2Vaj98AYVCt3xh4Nei?=
 =?us-ascii?Q?7q5VXEzQv2OKu9L2MobYSdag8ukda4uOyKVTP0qml3oaF/wH3m74WSQzw2US?=
 =?us-ascii?Q?3eTBasezEDZRS+aIHzTWD5x21nSDVfUY1WqsE7X7/wMgMe2tQ1GpAXsKl86+?=
 =?us-ascii?Q?oPvdsh0Xr6Vt9146o+2XN4NCHMGcBra24WsN7qkkcwheKFzI+OS/TW6NEi9G?=
 =?us-ascii?Q?mOULua2xH8Y3uHmEa4vLGiLLFYxHG0DeCavTFV7BjC/CvM4if/dtcCnQLSgR?=
 =?us-ascii?Q?sP73J4boRdvvksRodkp0AMLqlhyptGv0mKg3etiok7cDHabt0EyEGfmkTgfB?=
 =?us-ascii?Q?kfHn0IjPxmjZYyCUQdR4Ygwx86DZ20IdHBTFwYQ/Rf+RdzsSiuCTCBF//Ono?=
 =?us-ascii?Q?vvehhA1bp2qTDwr4m1UmqaN6O7yBhoUwW2glkVvjofv8yAM1gQmx52lRi8Sl?=
 =?us-ascii?Q?zIiOFfjozRtbx9N6rBvsR1/Wf8CEAk+Axaqp9V5clNUY9GrEU7d0nicEJ20O?=
 =?us-ascii?Q?fm00UWJpYpBDEiR+W/JJy6qiCdgEUHDKmEYFBBM1JLIAAcMDXQJLs/FK+58p?=
 =?us-ascii?Q?Poeor7vuIaym4yfVOs6cFcXlnEo+nCfhyTK3R9fNz3Hj9UPjYvTqekNtSYos?=
 =?us-ascii?Q?jzQf6LGnNw4P1Xwstf3MHIEYXQ9KX0qz2vvC2SskVthI2o3B6n8VXdr5WWeZ?=
 =?us-ascii?Q?KZu9Xny0PPNFwTf3WrElVUEy0OcH5AnQ249g+yy74ppFHP0AD/kEW3n092LF?=
 =?us-ascii?Q?HZr453qRR9udyY/gXk3o7jOoJ6NbAkEk59dk7ox9e7yN+/D4pGUcy/NAfAm6?=
 =?us-ascii?Q?NqwysMDG6HxDvhb0cmoubL0ANj/k/rlsGk8GSxaPlnFZKyoJ+jW7ekVTCPd8?=
 =?us-ascii?Q?4SihyIvOJYQdlJkd800=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9358285-cf8a-4a6e-39ef-08de1e24e8b3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:40.7743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTtEHt3PwsopF8KGdguSA+0hqJrwwBHkMor9PWdBOuq7cxaV4bPunBgARIdGJQOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826
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

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Brett Creeley <brett.creeley@amd.com>
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
index 559b12c3d67493..8915eb4943e46a 100644
--- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
+++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
@@ -1325,38 +1325,28 @@ static ssize_t hisi_acc_vfio_pci_read(struct vfio_device *core_vdev,
 }
 
 static int hisi_acc_vfio_ioctl_get_region(struct vfio_device *core_vdev,
-					  struct vfio_region_info __user *arg)
+					  struct vfio_region_info *info,
+					  struct vfio_info_cap *caps)
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
-	.get_region_info = hisi_acc_vfio_ioctl_get_region,
+	.get_region_info_caps = hisi_acc_vfio_ioctl_get_region,
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

