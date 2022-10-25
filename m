Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDD960D416
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8C10E424;
	Tue, 25 Oct 2022 18:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B6410E418;
 Tue, 25 Oct 2022 18:50:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9/jME7YWC/8ByV2DvTWl1RmBYzPlWw6kXKqUZmrgHyVdu/NAEgFPWsUK+gMZP6fV/8WgPJap8gOJkS/5+JvIOEMp/Pp+FqlbAscnIg8Kskz6DqkLhNoyLpB5h0x/ixpW4a0kows9JZ5LzuzuTGFduKWyakVsa4k7oPRnA+vpydep01ZHzToPNUcTecifEI2luZdsTwnfCS4Wc509JJG6NiWwqQNhJpEp5JI9REypCTrgvp8LlYSEe7tZodkZr9GN2vNEYj2lbSyvibZX+QBAKEJh4H1U/OJdfPt7aBnFITnubODiaSyKqiIllh8q1OS2UV+1iJHDYUZlsRRQNvk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdcA1vQ1MJCR5FjZwLhJ/UvwRjM002fRXHTZP4sXRYA=;
 b=L6XALIss6588NE/xJEMjY2jP1gefKTEPT85qZjmKf/4T5h5fssSAqrkCQ95G7NHeILwretLk4nmazjzbkFs6bmUURBtChw2ym8t+4EB3xjT6fAx9agnqfARA9chWJeMIeGoMuqKBtuPdWIFBA9+UcTMtjHZNGpeZ4DQa1NVxbLmGCqVzYeHvcA88qKYl1xEnSfiddo9u+lnHaHCiqonpc+QWF8BRi37m7Q+7FSDa7Do1KvCjNmUPTRXiUKgTUmP4Fext7cQW7NiPjuH5rh+M/i9d44lVAUXxmK9zX+TiWXvmkv2U6H4Ml52dQcWvxDm57aRkKL58WvRIP/eouLgpJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdcA1vQ1MJCR5FjZwLhJ/UvwRjM002fRXHTZP4sXRYA=;
 b=TL+wGHneIB/vajrakZ85/QpfAgyNx1OcJ0MTqQ3Cq97wlAYNsHOF3gNmr0FQtbfUeFL/bT8QhPLn3sdWAKT/88zi6eCiUn2xC8ul21Ro8SOquC1jQX17sH07FsXMT3mTtPKo4jl+HosiAXjIYzZPXBzFTI+w3KUtxSm1ceARfqJUa1/undrmwXBw1WQ74Uh87n/pAHYHJbpAPoDRD7c8Rmk2oMxU3zbuibkWSaYa0ckD9wC8Q02pUUKieNQhqRUgJR2h2AVf11tCVMnKq1AGdfZLsEYgEsZt8uma1d/wzEN/xPOa78U+ADN7FY4OTi5eJXGEGovpMOSP99e7Qo4g3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 18:50:48 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:50:48 +0000
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
Subject: [PATCH 07/10] vfio-iommufd: Support iommufd for physical VFIO devices
Date: Tue, 25 Oct 2022 15:50:42 -0300
Message-Id: <7-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0273.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b20791-6b18-491f-6b3b-08dab6b9d3fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 306yLp6SWtuRt7/LbWduWclMYF+FKXkJdoBKBuiBcocG6VdvNjN3oiJ9dgtAjfxqS60m8UzoIuiajZ18XoRhEUuk+SCuhDOJwNhs9OSb0mFRxALBEq0PtJkSZetcSSpyPpVZGmTlK0Hr8qQyioeWYZUAS6TWigLxupRBCRnCeC5qVYdfzamxu2C6gX+EQXIvustfsNlL+Kf+WMyxby9cn9qWYq0RpK3mGoN8g0hCycQ9WVCVnC39wXW6NUi48T7IEk9VOxGSB0TKefvaaAitcFABakmfL/icA95c4SDVgv4aaPZSMosCPkJ04ePCJaYZ3F2JKCPId9jLetl0XuLkw0yhzZYJoqGpITiCbZ7m8a+ccQWOmPKBRdOiCO04+Z09zztyKA3m658fG8NIC4GX0oNwvDA6Hc8Z96A+lRyKS0JxkYmnuDtGssVmZjQajHu9cN7mSZ5hCz2hDEzCc3GCc1eTSdMUwrA48DmNlRoN83mvphvX1JXN0L/XZHfdA+qtKbsbf9zSYmgly+IMpLEFoHGG7p2rGIP/hljjtkKS/99QGDKEcONkEeSRdh7jHNvjncVtzWcW3D/PYz5xprk8x3Cjwhi+I8vMwyniMLIXJLr9VjyLBeW2krSuO7FurLp7q+xUPwVy3tWdm7lRtRPa95cdIkeEOlNQl3M0AwdLC0EoJb5Nztx5+zN1DvATDUe5LAJKnApwm9Ny2WlLWSbZSsPoB7PVgX0tBmSRJZl02SKTHkaeZuSZU41Bh9cgewr84SutAW6i4au2H2DH5quhmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199015)(86362001)(38100700002)(921005)(30864003)(6486002)(8936002)(7406005)(7416002)(5660300002)(2906002)(478600001)(6666004)(316002)(4326008)(8676002)(66946007)(66476007)(66556008)(110136005)(54906003)(41300700001)(83380400001)(26005)(6512007)(6506007)(2616005)(186003)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pNiOlXsAk6q85gsUeiEJ/WVyTx3XYHAzh5Fm9ZTmyTisj4PDb3PVWO2CjlMo?=
 =?us-ascii?Q?sb42tvA/aft9ypcEwZ6StR2N6R6emqTpkWr6DyWhC++KF3s4tqof8f3Sfs2a?=
 =?us-ascii?Q?8ONgV3EYdiSJ5Jq1AlqagpfhMDfCoxFf2gYAaAee2WeR2MnbIrHRZtF0TLwC?=
 =?us-ascii?Q?KmZoN6LFhURt+XkA6nbDWkiLqGsPnTe7ozmFNZCL8YU7fxBL1iZqutyl3joi?=
 =?us-ascii?Q?m62FHzBSGQMazSnq5O8T7lDar9jre5K2aPtOvFupKaCVai9HTBlw5oeDJc0L?=
 =?us-ascii?Q?m8B3la1Esh7Q5t8/R+TKW6BQ/NtjOS3ARNk0duw0fMecYYmLiDta5k5FpSOP?=
 =?us-ascii?Q?2LmU+fkzJO/hfLMARfMjAbOf2J7oyQVBXk94ypYc9qcAVgowpbMwUHmFVl5I?=
 =?us-ascii?Q?jmGMhcwrC3C4CQXiZPkTcGbAX4fpJPWIxy0Tnu5JUOUODrKKL8Gw/kEYVdAx?=
 =?us-ascii?Q?7IJbJFyCDenCTT0LH0Ue2jL8Nk+GfnOY47GfFGydyvuso0m55gSjz+x1PpFM?=
 =?us-ascii?Q?2NtM2tY7ph55cxldlpNp1GLnhBOm7wC/gIY5hj1qsFu5YHIXAsaW2aF4JUua?=
 =?us-ascii?Q?srG0ykRPUOukuvPzFY6x3Tn930OKwDoYDgsdtjPDBaBahW7Qt6b7XOi6BBOI?=
 =?us-ascii?Q?npJzSODlU8u8hA6CqJgWl7nBM/dSiqISSTvlUFzChYxaIQ7WFoGLsfhggKOj?=
 =?us-ascii?Q?N55BO0/uChD/7mguGU0Bx0Zj4GSLWRPUJ7uFJOkV1BDQQxUPFCtXZZGU2ZVZ?=
 =?us-ascii?Q?A/zKhXEWRwhMRf1aRHsiLLjNBgn/1LnXkuQEWm8inDA+doSkH1Hlsi7N91Vh?=
 =?us-ascii?Q?rvNraSxizK2cUNfkkhP5GKpnxl70hmXr0zYmoifdUbW7xfw+I2lP1qAzQF2W?=
 =?us-ascii?Q?ZyCNanN+WHCmQA8IOtVvJaDa7k2euSFxNeShl3uoaMSPJMzgReQ4s1Rk9qNr?=
 =?us-ascii?Q?4p9mVvQuLH8EtXXL3XxSilTFefLTkzbX8c20Wcb1hsIQo8pwNO10+lMKdKEH?=
 =?us-ascii?Q?vKab1dSfyn8b+vDi+uhlTaVmMFzsMQRbJ/UDUFVP1FMaGaJeUt6hZjmxVlOR?=
 =?us-ascii?Q?jRWgelSJXGeiJdDPbfexcgdRuSls6sNiIPS+jEGpVe3Mt2gIowvYWa7MIPIY?=
 =?us-ascii?Q?csJw4LiMUZBKkOLCuSXO5Q1FCozHYgnz1IkMtHlofk/EBCShXMw4LRuPrVrt?=
 =?us-ascii?Q?BMbia0xiRIUO62XkF4uH9+GsoHzSwKehWLu8a3+DL8jJRVDhpIKL/gm/3ecg?=
 =?us-ascii?Q?xuUYGutLOKAfhwVQRzetGUhMnYMvMY3bhPyUsBS7NUxEW2hOKyTjyzBMARVY?=
 =?us-ascii?Q?z7wvY+NQ6tw/NspN0A8kDKzJMx1dKnqLfz83xXf8xGm3hz3FjBpwwutl9n0I?=
 =?us-ascii?Q?7QrWo+lOlmpjkT4nJnDeI70cIFusuTPz5JNJc9cKJLCehhXLZkU7KaGIQzTF?=
 =?us-ascii?Q?+wVJ/QnDwUWXIKZ52MecZ5AiCFbvRcMewChtvEWKiJk/zXNEXkx1FsLEsCJY?=
 =?us-ascii?Q?eCkJyXYou06OUrr0stb+qltHbvGpgz1Uh6G0DzXiyqURorimJ+Xp32NHlAal?=
 =?us-ascii?Q?WHJW5/XYUruUd6tRHPk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b20791-6b18-491f-6b3b-08dab6b9d3fb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:50:47.5050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgxmCpW9pLR58vcHns2z0jsc1kcIpmAqx+W69I8Q7lPgh8Je+38+EigLwgf0sVO7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938
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
Cc: Yi Liu <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This creates the iommufd_device for the physical VFIO drivers. These are
all the drivers that are calling vfio_register_group_dev() and expect the
type1 code to setup a real iommu_domain against their parent struct
device.

The design gives the driver a choice in how it gets connected to iommufd
by providing bind_iommufd/unbind_iommufd/attach_ioas callbacks to
implement as required. The core code provides three default callbacks for
physical mode using a real iommu_domain. This is suitable for drivers
using vfio_register_group_dev()

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/Makefile                         |   1 +
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |   3 +
 drivers/vfio/iommufd.c                        | 104 ++++++++++++++++++
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |   6 +
 drivers/vfio/pci/mlx5/main.c                  |   3 +
 drivers/vfio/pci/vfio_pci.c                   |   3 +
 drivers/vfio/platform/vfio_amba.c             |   3 +
 drivers/vfio/platform/vfio_platform.c         |   3 +
 drivers/vfio/vfio.h                           |  15 +++
 drivers/vfio/vfio_main.c                      |  13 ++-
 include/linux/vfio.h                          |  25 +++++
 11 files changed, 177 insertions(+), 2 deletions(-)
 create mode 100644 drivers/vfio/iommufd.c

diff --git a/drivers/vfio/Makefile b/drivers/vfio/Makefile
index b693a1169286f8..3863922529ef20 100644
--- a/drivers/vfio/Makefile
+++ b/drivers/vfio/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_VFIO) += vfio.o
 vfio-y += vfio_main.o \
 	  iova_bitmap.o \
 	  container.o
+vfio-$(CONFIG_IOMMUFD) += iommufd.o
 
 obj-$(CONFIG_VFIO_VIRQFD) += vfio_virqfd.o
 obj-$(CONFIG_VFIO_IOMMU_TYPE1) += vfio_iommu_type1.o
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index b16874e913e4f5..5cd4bb47644039 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -592,6 +592,9 @@ static const struct vfio_device_ops vfio_fsl_mc_ops = {
 	.read		= vfio_fsl_mc_read,
 	.write		= vfio_fsl_mc_write,
 	.mmap		= vfio_fsl_mc_mmap,
+	.bind_iommufd	= vfio_iommufd_physical_bind,
+	.unbind_iommufd	= vfio_iommufd_physical_unbind,
+	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
 };
 
 static struct fsl_mc_driver vfio_fsl_mc_driver = {
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
new file mode 100644
index 00000000000000..8280bb32ee677c
--- /dev/null
+++ b/drivers/vfio/iommufd.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021-2022, NVIDIA CORPORATION & AFFILIATES
+ */
+#include <linux/vfio.h>
+#include <linux/iommufd.h>
+
+#include "vfio.h"
+
+MODULE_IMPORT_NS(IOMMUFD);
+MODULE_IMPORT_NS(IOMMUFD_VFIO);
+
+int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
+{
+	u32 ioas_id;
+	u32 device_id;
+	int ret;
+
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	/*
+	 * If the driver doesn't provide this op then it means the device does
+	 * not do DMA at all. So nothing to do.
+	 */
+	if (!vdev->ops->bind_iommufd)
+		return 0;
+
+	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
+	if (ret)
+		return ret;
+
+	if (vdev->ops->attach_ioas) {
+		ret = iommufd_vfio_compat_ioas_id(ictx, &ioas_id);
+		if (ret)
+			goto err_unbind;
+		ret = vdev->ops->attach_ioas(vdev, &ioas_id);
+		if (ret)
+			goto err_unbind;
+		vdev->iommufd_attached = true;
+	}
+
+	/*
+	 * The legacy path has no way to return the device id or the selected
+	 * pt_id
+	 */
+	return 0;
+
+err_unbind:
+	if (vdev->ops->unbind_iommufd)
+		vdev->ops->unbind_iommufd(vdev);
+	return ret;
+}
+
+void vfio_iommufd_unbind(struct vfio_device *vdev)
+{
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	if (!vdev->iommufd_device)
+		return;
+
+	if (vdev->ops->unbind_iommufd)
+		vdev->ops->unbind_iommufd(vdev);
+}
+
+/*
+ * The physical standard ops mean that the iommufd_device is bound to the
+ * physical device vdev->dev that was provided to vfio_init_group_dev(). Drivers
+ * using this ops set should call vfio_register_group_dev()
+ */
+int vfio_iommufd_physical_bind(struct vfio_device *vdev,
+			       struct iommufd_ctx *ictx, u32 *out_device_id)
+{
+	struct iommufd_device *idev;
+
+	idev = iommufd_device_bind(ictx, vdev->dev, out_device_id);
+	if (IS_ERR(idev))
+		return PTR_ERR(idev);
+	vdev->iommufd_device = idev;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_physical_bind);
+
+void vfio_iommufd_physical_unbind(struct vfio_device *vdev)
+{
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	if (vdev->iommufd_attached) {
+		iommufd_device_detach(vdev->iommufd_device);
+		vdev->iommufd_attached = false;
+	}
+	iommufd_device_unbind(vdev->iommufd_device);
+	vdev->iommufd_device = NULL;
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_physical_unbind);
+
+int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
+{
+	unsigned int flags = 0;
+
+	if (vfio_allow_unsafe_interrupts)
+		flags |= IOMMUFD_ATTACH_FLAGS_ALLOW_UNSAFE_INTERRUPT;
+	return iommufd_device_attach(vdev->iommufd_device, pt_id, flags);
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
index 39eeca18a0f7c8..40019b11c5a969 100644
--- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
+++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
@@ -1246,6 +1246,9 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_migrn_ops = {
 	.mmap = hisi_acc_vfio_pci_mmap,
 	.request = vfio_pci_core_request,
 	.match = vfio_pci_core_match,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
 };
 
 static const struct vfio_device_ops hisi_acc_vfio_pci_ops = {
@@ -1261,6 +1264,9 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_ops = {
 	.mmap = vfio_pci_core_mmap,
 	.request = vfio_pci_core_request,
 	.match = vfio_pci_core_match,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
 };
 
 static int hisi_acc_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
diff --git a/drivers/vfio/pci/mlx5/main.c b/drivers/vfio/pci/mlx5/main.c
index fd6ccb8454a24a..32d1f38d351e7e 100644
--- a/drivers/vfio/pci/mlx5/main.c
+++ b/drivers/vfio/pci/mlx5/main.c
@@ -623,6 +623,9 @@ static const struct vfio_device_ops mlx5vf_pci_ops = {
 	.mmap = vfio_pci_core_mmap,
 	.request = vfio_pci_core_request,
 	.match = vfio_pci_core_match,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
 };
 
 static int mlx5vf_pci_probe(struct pci_dev *pdev,
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 1d4919edfbde48..29091ee2e9849b 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -138,6 +138,9 @@ static const struct vfio_device_ops vfio_pci_ops = {
 	.mmap		= vfio_pci_core_mmap,
 	.request	= vfio_pci_core_request,
 	.match		= vfio_pci_core_match,
+	.bind_iommufd	= vfio_iommufd_physical_bind,
+	.unbind_iommufd	= vfio_iommufd_physical_unbind,
+	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
 };
 
 static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
index eaea63e5294c58..5a046098d0bdf4 100644
--- a/drivers/vfio/platform/vfio_amba.c
+++ b/drivers/vfio/platform/vfio_amba.c
@@ -117,6 +117,9 @@ static const struct vfio_device_ops vfio_amba_ops = {
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
+	.bind_iommufd	= vfio_iommufd_physical_bind,
+	.unbind_iommufd	= vfio_iommufd_physical_unbind,
+	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
 };
 
 static const struct amba_id pl330_ids[] = {
diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
index 82cedcebfd9022..b87c3b70878341 100644
--- a/drivers/vfio/platform/vfio_platform.c
+++ b/drivers/vfio/platform/vfio_platform.c
@@ -106,6 +106,9 @@ static const struct vfio_device_ops vfio_platform_ops = {
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
+	.bind_iommufd	= vfio_iommufd_physical_bind,
+	.unbind_iommufd	= vfio_iommufd_physical_unbind,
+	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
 };
 
 static struct platform_driver vfio_platform_driver = {
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 985e13d52989ca..809f2e8523968e 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -124,6 +124,21 @@ void vfio_device_container_unregister(struct vfio_device *device);
 int __init vfio_container_init(void);
 void vfio_container_cleanup(void);
 
+#if IS_ENABLED(CONFIG_IOMMUFD)
+int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
+void vfio_iommufd_unbind(struct vfio_device *device);
+#else
+static inline int vfio_iommufd_bind(struct vfio_device *device,
+				    struct iommufd_ctx *ictx)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void vfio_iommufd_unbind(struct vfio_device *device)
+{
+}
+#endif
+
 #ifdef CONFIG_VFIO_NOIOMMU
 extern bool vfio_noiommu __read_mostly;
 #else
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index cf0ea744de931e..bfbda04af1ffda 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -528,6 +528,11 @@ static int __vfio_register_dev(struct vfio_device *device,
 	if (IS_ERR(group))
 		return PTR_ERR(group);
 
+	if (WARN_ON(device->ops->bind_iommufd &&
+		    (!device->ops->unbind_iommufd ||
+		     !device->ops->attach_ioas)))
+		return -EINVAL;
+
 	/*
 	 * If the driver doesn't specify a set then the device is added to a
 	 * singleton set just for itself.
@@ -790,6 +795,10 @@ static int vfio_device_first_open(struct vfio_device *device)
 		ret = vfio_group_use_container(device->group);
 		if (ret)
 			goto err_module_put;
+	} else if (device->group->iommufd) {
+		ret = vfio_iommufd_bind(device, device->group->iommufd);
+		if (ret)
+			goto err_module_put;
 	}
 
 	device->kvm = device->group->kvm;
@@ -806,6 +815,7 @@ static int vfio_device_first_open(struct vfio_device *device)
 err_container:
 	if (device->group->container)
 		vfio_group_unuse_container(device->group);
+	vfio_iommufd_unbind(device);
 	device->kvm = NULL;
 err_module_put:
 	mutex_unlock(&device->group->group_lock);
@@ -825,6 +835,7 @@ static void vfio_device_last_close(struct vfio_device *device)
 	device->kvm = NULL;
 	if (device->group->container)
 		vfio_group_unuse_container(device->group);
+	vfio_iommufd_unbind(device);
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
 }
@@ -1923,8 +1934,6 @@ static void __exit vfio_cleanup(void)
 module_init(vfio_init);
 module_exit(vfio_cleanup);
 
-MODULE_IMPORT_NS(IOMMUFD);
-MODULE_IMPORT_NS(IOMMUFD_VFIO);
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR(DRIVER_AUTHOR);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e7cebeb875dd1a..a7fc4d747dc226 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -17,6 +17,8 @@
 #include <linux/iova_bitmap.h>
 
 struct kvm;
+struct iommufd_ctx;
+struct iommufd_device;
 
 /*
  * VFIO devices can be placed in a set, this allows all devices to share this
@@ -54,6 +56,10 @@ struct vfio_device {
 	struct completion comp;
 	struct list_head group_next;
 	struct list_head iommu_entry;
+#if IS_ENABLED(CONFIG_IOMMUFD)
+	struct iommufd_device *iommufd_device;
+	bool iommufd_attached;
+#endif
 };
 
 /**
@@ -80,6 +86,10 @@ struct vfio_device_ops {
 	char	*name;
 	int	(*init)(struct vfio_device *vdev);
 	void	(*release)(struct vfio_device *vdev);
+	int	(*bind_iommufd)(struct vfio_device *vdev,
+				struct iommufd_ctx *ictx, u32 *out_device_id);
+	void	(*unbind_iommufd)(struct vfio_device *vdev);
+	int	(*attach_ioas)(struct vfio_device *vdev, u32 *pt_id);
 	int	(*open_device)(struct vfio_device *vdev);
 	void	(*close_device)(struct vfio_device *vdev);
 	ssize_t	(*read)(struct vfio_device *vdev, char __user *buf,
@@ -96,6 +106,21 @@ struct vfio_device_ops {
 				  void __user *arg, size_t argsz);
 };
 
+#if IS_ENABLED(CONFIG_IOMMUFD)
+int vfio_iommufd_physical_bind(struct vfio_device *vdev,
+			       struct iommufd_ctx *ictx, u32 *out_device_id);
+void vfio_iommufd_physical_unbind(struct vfio_device *vdev);
+int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
+#else
+#define vfio_iommufd_physical_bind                                      \
+	((int (*)(struct vfio_device *vdev, struct iommufd_ctx *ictx,   \
+		  u32 *out_device_id)) NULL)
+#define vfio_iommufd_physical_unbind \
+	((void (*)(struct vfio_device *vdev)) NULL)
+#define vfio_iommufd_physical_attach_ioas \
+	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
+#endif
+
 /**
  * @migration_set_state: Optional callback to change the migration state for
  *         devices that support migration. It's mandatory for
-- 
2.38.0

