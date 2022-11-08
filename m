Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E7D620555
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AEC10E38D;
	Tue,  8 Nov 2022 00:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C1210E377;
 Tue,  8 Nov 2022 00:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX/sq74LT/VXUxGL04fTT4LhGBcPz+1oX0zRGrO0G5PQRfozc4cY8gwsnbk59CJIesFQxmKACNH9rqeq8pieOACxG5uZF8cT+1tEse4fmZkCPvnSb0L4skle1HdFDBJ5sDP5SQ6rMF5xK0DrYBlILFm2unPMWLNnKku5NKuSiSFdi7Jda536Zu1Tj8lz7T44frjFHrbswZmSGQPT7xNy8xLDSjfDf4InXA0cSjqRLF5B2vcPtzXWQ780PaNkQA6YxYHrZVWMYew1a/R9ZY75OSyx3+LW5VcpMPquCzTZ4we96wfmP3HPFOWhnAXQIBFc3c9osBcB3GSdUM166dJumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMPVjdp/yeQqS9T3S/+MSPh/DWIP0PGaWHsUyjLwwrk=;
 b=PLvMDF4PEXV0YkAWccrZrxGAna7r0z34kfvjMku55f5kwiaXWo1/90yDiErAjT1cXYBzgN5BAOdwEbDwFPf+r7dBCSCzHOAAwqMlWQfyI3gLhvrfOOUYNc/TmKpcXODNN04VQba9D1etR/OvIQxLRIb4zyR3a2ed0x03CGc9IbHnVA8JN33pLBXcyxGt+7FTdC9vb9T28/aJN+zOAxg/e2E+egHeaPOWfAo5DIGLUdzLtwLPAZ2qBc8t+cHpwnXy3/Pnijkh6hzeDjwhBtqKNzgFGUVq9ClND4ZCg8JUeV28q+zThoYFhXXsDMNl/qyeQiBqhxh3IwwEhhtTdIPQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMPVjdp/yeQqS9T3S/+MSPh/DWIP0PGaWHsUyjLwwrk=;
 b=ua3rX1ENClsypLxzdx7m9wCAofrYEKCUP5Sb88vhtpxmDirp0GMkTzis/wxVWoceQ/ft0lPmwTzsMYlxgSaOGkbMTUH/k5N81Ynffn+5Er6J/FpghJCIpvPZ0uyllgpuJwdYeBF0jK/IhYDH2XAelRsNA59y75UDTvPeYVlUS2vNp3Jm53axcUfftTSUHBU0HgS/nOt9WsO+yj+PuBxSdQEhCbTAHvLcdxNw6Pb5WRA0bb1FkswhuUGhm3fxtYFXsa1VFOCkqFYMgskNxPbI6unaufXmvPYWrJILqzQs16/tdJMSPO8FE02gfN3zj3IMTrDuA001TlOIdc+qpH2yzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 00:52:58 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:52:58 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Diana Craciun <diana.craciun@oss.nxp.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 iommu@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 06/11] vfio-iommufd: Allow iommufd to be used in place of a
 container fd
Date: Mon,  7 Nov 2022 20:52:50 -0400
Message-Id: <6-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: edf24265-2c26-4e70-2d2f-08dac1239338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5D1+pM7EIQl8yBhRWhdi4K6ZGpPprK9bwp+6kAoHE3BXFugmbvvEpI7q/HFNHBJicbAQPvweNg80QVMrTUcb1fEQQ/6EGMvP3XMKtTZWaFyVrkYQzYlR/m3X7pTF+8RLJhz8cSzCHA3g44/zv3H2fBEVO0s+BtcFYJDNWs7GvBB5zHSF+48NzT7WUWEr/UxuAKqQy/+0J+f3D7+rCXLPuEKIAfyhbGT+i4fGvN80HmYligjzE8E7zJ222oh1w6Qt59Qubr6UsBY17FL9QRqGzXyufDvh+gXaEaE23Dbl0DI1HiIzZONAEnzTbuBL892coGki8rSZPuoCjtw2QytYfG+x8LB0Q7tB9OLwtVGora3MhT+7Y8KqHhyjCTMwTbQLws7saWSCc1ijQGVhBKAyBtFJC8xiZ93Mpdw329W9j1RSxISm5wGjua99yYr//bGWqtPgqCM+aq0uF7ID0diy5Q3PvCFGhoqok8cAq8r01yS4H3L1Eab9Fdq2VuLG5CZm/GOukiyHgl/62KwEfBJc4uWxBi8iPUy+FyEu62zStsGnTsd7SMtJrb+e+OCzetglOmv71l82ocTbU4jmBopaMPCfTFF/qhH6ej0H8ZqRyjwz/XdHcu0GyCI+q442JvtCWIQ15M6q/Cf3Tso+Ff6je1SPgVUy8c/chHVul5z9uIDs/OxNNQ31V9zklHY0EKc59q+T7tZnzcHthvzXHRLbyUahw2G5jSWswehpv2LksvLOGtbdlBoSzT03G6C6dg53joXos/KdkAUmBzPT0UGQVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(2616005)(921005)(83380400001)(38100700002)(186003)(2906002)(7416002)(7406005)(8936002)(86362001)(5660300002)(478600001)(6666004)(6486002)(26005)(6512007)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(41300700001)(110136005)(54906003)(66946007)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3UJywDDN5reSrpnKGyjTP3TBfXe15oDw5ULf+SL4tZEvhKawXex2C+8VYlt5?=
 =?us-ascii?Q?ydSFiHxLouowtxDq4P0PMbB61qcYZbUKncY9SMI/z+vHFtPQsE14pjebYIkD?=
 =?us-ascii?Q?Zgb2B06D7WmBrUl8SiDEBc9ePOE5MQOr2OhxycZx+QavZhBD7Ht0XWgWSTWd?=
 =?us-ascii?Q?sSf4MQUW11wGr087pFnQzGw6gEH0jRoxGbJ+iSElQLrk1MYAIWa1LpAyza10?=
 =?us-ascii?Q?RjnRKIaLAMC08lNRxGLLGHUFFjnYpflsLue009RvfbzN8KAnZAUIGrPzovaE?=
 =?us-ascii?Q?QCgmw0VvQ8Bot6CpWQ0TG1QmD4xpUYmGJfxAWhkgi4KYtsfssoumu2qVX5EB?=
 =?us-ascii?Q?ihyzrP65Pxl/8/5WQnADPInn8Jkqe5V4uTD1X5ARAj9Bl4O7kmEugia99cMl?=
 =?us-ascii?Q?UuuO656NsxhH94Jl3dNHfIzUuoPb01IaHB+emYxc0vyfPu0vtH9CNq5bzfiN?=
 =?us-ascii?Q?ADDf6qtQkQabfbKBrJbjP3cXi9RYJT223RcO61P9zoeYf4HfrjHC7Idyr8Ce?=
 =?us-ascii?Q?c3MUB9qjzzWCCF6Ma5QdnS/J4hN9sEa0RNwS1pech8OXQr8eDC6MEXZp8ZVx?=
 =?us-ascii?Q?lUEzAwpRwSe7iQ/pwzRrHprpoJ4vKI4vbjAxF38KErMsizQJoGLFdISBbzig?=
 =?us-ascii?Q?KO1M7068p4aAro5XVNkbcDFAyLLtRULUz2yqh1d8aZvoI/wDeXbhZQsEbaxS?=
 =?us-ascii?Q?1rZ5r70kMdE2VKP2sH+l/ZvHPN7VEBlaBqzCJqLRHavis8iAbvt6L0O45SHI?=
 =?us-ascii?Q?a1cUnLVj+INcHD73KfCa6rIXQECyWRDPwhBtAy3sHo1cVeHnRVv5zSoqAlKu?=
 =?us-ascii?Q?xUMW2ieAHvMDx9pYy20Cwj7RCD4ouW4ZwtwxFUmQ/Qx7UUUqaGcVa4oRkFl0?=
 =?us-ascii?Q?wGS9Pmy5seZINwXhx2JCiL1YXx70LWbCC5uMTvAqDlJEaChcJf+D6O+KwIf/?=
 =?us-ascii?Q?iEQfavmSZmO0+W6kkO0BmTYZoaRz4CGWQAQm5EM00u49PhnmVgkdh5D8qnpc?=
 =?us-ascii?Q?/LySy2iQVIsRxUa1ujaH83q/N0TtXpatwZcvv/TeAx0suVdufMZ1q5ggAb/w?=
 =?us-ascii?Q?aAJaSO2p2y32SmA+ZRDth4+DSYkJXzngpht62us1U9jxv5iYjNLl/tlzzVgo?=
 =?us-ascii?Q?2x6SQUkD6rhkEcEOab2rfJEPSbmzt8oDcwwcDIrcufkap5CTrZH2uYxOXG1A?=
 =?us-ascii?Q?7tNRleErccEf8RgxcmPLhbDXxNPlMRoHdzjpRMnoxmUYYSylR4bfHGXskAYb?=
 =?us-ascii?Q?TZjzL58e4xfTtEPXPKKBplgxrqsk/3FSjHfE1TfuzP/AUf0Yf0Qz+9VJGRBt?=
 =?us-ascii?Q?s0kkxSoA5SnHNsJKfEiR+TtsHtir6q88G2E7AksPlzVStbA1QGmispaPD8bB?=
 =?us-ascii?Q?ysG/OXulNU+Bfyi6UJaWm5Sx8suDhOIksP3HJi5jgGvfVi6ck5be/gL73Pcf?=
 =?us-ascii?Q?RU+7ZCzf/PZnAQao38dX5CviGsZIDXL0SGbMMqMmykiTcARGwqXJd0gafNDy?=
 =?us-ascii?Q?Q3aLTuF87PYFyoIjr0QCZ6OGx3ILD794dNgTDGShTMRsXWq3kh2pbm0F/rDY?=
 =?us-ascii?Q?xiL+PoKzDbPRad509EY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf24265-2c26-4e70-2d2f-08dac1239338
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:56.6638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adWENP0Ay32usNvgVjAFndnF7XuxhYlEXl+vKVZMpFBVzR6hIPmO59rjGwgRz/UH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6686
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes VFIO_GROUP_SET_CONTAINER accept both a vfio container FD and an
iommufd.

In iommufd mode an IOAS will exist after the SET_CONTAINER, but it will
not be attached to any groups.

For VFIO this means that the VFIO_GROUP_GET_STATUS and
VFIO_GROUP_FLAGS_VIABLE works subtly differently. With the container FD
the iommu_group_claim_dma_owner() is done during SET_CONTAINER but for
IOMMUFD this is done during VFIO_GROUP_GET_DEVICE_FD. Meaning that
VFIO_GROUP_FLAGS_VIABLE could be set but GET_DEVICE_FD will fail due to
viability.

As GET_DEVICE_FD can fail for many reasons already this is not expected to
be a meaningful difference.

Reorganize the tests for if the group has an assigned container or iommu
into a vfio_group_has_iommu() function and consolidate all the duplicated
WARN_ON's etc related to this.

Call container functions only if a container is actually present on the
group.

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/Kconfig     |  1 +
 drivers/vfio/container.c |  7 +++-
 drivers/vfio/vfio.h      |  2 +
 drivers/vfio/vfio_main.c | 86 +++++++++++++++++++++++++++++++++-------
 4 files changed, 80 insertions(+), 16 deletions(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index 86c381ceb9a1e9..1118d322eec97d 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -2,6 +2,7 @@
 menuconfig VFIO
 	tristate "VFIO Non-Privileged userspace driver framework"
 	select IOMMU_API
+	depends on IOMMUFD || !IOMMUFD
 	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
 	select INTERVAL_TREE
 	help
diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index d97747dfb05d02..8772dad6808539 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -516,8 +516,11 @@ int vfio_group_use_container(struct vfio_group *group)
 {
 	lockdep_assert_held(&group->group_lock);
 
-	if (!group->container || !group->container->iommu_driver ||
-	    WARN_ON(!group->container_users))
+	/*
+	 * The container fd has been assigned with VFIO_GROUP_SET_CONTAINER but
+	 * VFIO_SET_IOMMU hasn't been done yet.
+	 */
+	if (!group->container->iommu_driver)
 		return -EINVAL;
 
 	if (group->type == VFIO_NO_IOMMU && !capable(CAP_SYS_RAWIO))
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 247590334e14b0..985e13d52989ca 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -10,6 +10,7 @@
 #include <linux/cdev.h>
 #include <linux/module.h>
 
+struct iommufd_ctx;
 struct iommu_group;
 struct vfio_device;
 struct vfio_container;
@@ -60,6 +61,7 @@ struct vfio_group {
 	struct kvm			*kvm;
 	struct file			*opened_file;
 	struct blocking_notifier_head	notifier;
+	struct iommufd_ctx		*iommufd;
 };
 
 /* events for the backend driver notify callback */
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 5c0e810f8b4d08..8c124290ce9f0d 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -35,6 +35,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/interval_tree.h>
 #include <linux/iova_bitmap.h>
+#include <linux/iommufd.h>
 #include "vfio.h"
 
 #define DRIVER_VERSION	"0.3"
@@ -665,6 +666,16 @@ EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 /*
  * VFIO Group fd, /dev/vfio/$GROUP
  */
+static bool vfio_group_has_iommu(struct vfio_group *group)
+{
+	lockdep_assert_held(&group->group_lock);
+	if (!group->container)
+		WARN_ON(group->container_users);
+	else
+		WARN_ON(!group->container_users);
+	return group->container || group->iommufd;
+}
+
 /*
  * VFIO_GROUP_UNSET_CONTAINER should fail if there are other users or
  * if there was no container to unset.  Since the ioctl is called on
@@ -676,15 +687,21 @@ static int vfio_group_ioctl_unset_container(struct vfio_group *group)
 	int ret = 0;
 
 	mutex_lock(&group->group_lock);
-	if (!group->container) {
+	if (!vfio_group_has_iommu(group)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-	if (group->container_users != 1) {
-		ret = -EBUSY;
-		goto out_unlock;
+	if (group->container) {
+		if (group->container_users != 1) {
+			ret = -EBUSY;
+			goto out_unlock;
+		}
+		vfio_group_detach_container(group);
+	}
+	if (group->iommufd) {
+		iommufd_ctx_put(group->iommufd);
+		group->iommufd = NULL;
 	}
-	vfio_group_detach_container(group);
 
 out_unlock:
 	mutex_unlock(&group->group_lock);
@@ -695,6 +712,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 					  int __user *arg)
 {
 	struct vfio_container *container;
+	struct iommufd_ctx *iommufd;
 	struct fd f;
 	int ret;
 	int fd;
@@ -707,7 +725,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 		return -EBADF;
 
 	mutex_lock(&group->group_lock);
-	if (group->container || WARN_ON(group->container_users)) {
+	if (vfio_group_has_iommu(group)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -717,12 +735,28 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 	}
 
 	container = vfio_container_from_file(f.file);
-	ret = -EINVAL;
 	if (container) {
 		ret = vfio_container_attach_group(container, group);
 		goto out_unlock;
 	}
 
+	iommufd = iommufd_ctx_from_file(f.file);
+	if (!IS_ERR(iommufd)) {
+		u32 ioas_id;
+
+		ret = iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);
+		if (ret) {
+			iommufd_ctx_put(group->iommufd);
+			goto out_unlock;
+		}
+
+		group->iommufd = iommufd;
+		goto out_unlock;
+	}
+
+	/* The FD passed is not recognized. */
+	ret = -EBADFD;
+
 out_unlock:
 	mutex_unlock(&group->group_lock);
 	fdput(f);
@@ -752,9 +786,16 @@ static int vfio_device_first_open(struct vfio_device *device)
 	 * during close_device.
 	 */
 	mutex_lock(&device->group->group_lock);
-	ret = vfio_group_use_container(device->group);
-	if (ret)
+	if (!vfio_group_has_iommu(device->group)) {
+		ret = -EINVAL;
 		goto err_module_put;
+	}
+
+	if (device->group->container) {
+		ret = vfio_group_use_container(device->group);
+		if (ret)
+			goto err_module_put;
+	}
 
 	device->kvm = device->group->kvm;
 	if (device->ops->open_device) {
@@ -762,13 +803,15 @@ static int vfio_device_first_open(struct vfio_device *device)
 		if (ret)
 			goto err_container;
 	}
-	vfio_device_container_register(device);
+	if (device->group->container)
+		vfio_device_container_register(device);
 	mutex_unlock(&device->group->group_lock);
 	return 0;
 
 err_container:
 	device->kvm = NULL;
-	vfio_group_unuse_container(device->group);
+	if (device->group->container)
+		vfio_group_unuse_container(device->group);
 err_module_put:
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
@@ -780,11 +823,13 @@ static void vfio_device_last_close(struct vfio_device *device)
 	lockdep_assert_held(&device->dev_set->lock);
 
 	mutex_lock(&device->group->group_lock);
-	vfio_device_container_unregister(device);
+	if (device->group->container)
+		vfio_device_container_unregister(device);
 	if (device->ops->close_device)
 		device->ops->close_device(device);
 	device->kvm = NULL;
-	vfio_group_unuse_container(device->group);
+	if (device->group->container)
+		vfio_group_unuse_container(device->group);
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
 }
@@ -900,7 +945,14 @@ static int vfio_group_ioctl_get_status(struct vfio_group *group,
 		return -ENODEV;
 	}
 
-	if (group->container)
+	/*
+	 * With the container FD the iommu_group_claim_dma_owner() is done
+	 * during SET_CONTAINER but for IOMMFD this is done during
+	 * VFIO_GROUP_GET_DEVICE_FD. Meaning that with iommufd
+	 * VFIO_GROUP_FLAGS_VIABLE could be set but GET_DEVICE_FD will fail due
+	 * to viability.
+	 */
+	if (group->container || group->iommufd)
 		status.flags |= VFIO_GROUP_FLAGS_CONTAINER_SET |
 				VFIO_GROUP_FLAGS_VIABLE;
 	else if (!iommu_group_dma_owner_claimed(group->iommu_group))
@@ -983,6 +1035,10 @@ static int vfio_group_fops_release(struct inode *inode, struct file *filep)
 	WARN_ON(group->notifier.head);
 	if (group->container)
 		vfio_group_detach_container(group);
+	if (group->iommufd) {
+		iommufd_ctx_put(group->iommufd);
+		group->iommufd = NULL;
+	}
 	group->opened_file = NULL;
 	mutex_unlock(&group->group_lock);
 	return 0;
@@ -1881,6 +1937,8 @@ static void __exit vfio_cleanup(void)
 module_init(vfio_init);
 module_exit(vfio_cleanup);
 
+MODULE_IMPORT_NS(IOMMUFD);
+MODULE_IMPORT_NS(IOMMUFD_VFIO);
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR(DRIVER_AUTHOR);
-- 
2.38.1

