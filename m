Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59CA620568
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FAF10E3B0;
	Tue,  8 Nov 2022 00:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1174710E20D;
 Tue,  8 Nov 2022 00:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+9L9GfDhdrsre2bEqaD83OZ+3VTChkUxVJow3p4g3lanH/KMComygMU6M2hmLG6Kjn+byacSrNv4ol+Ww4mwC+/QJNBsfQn36/dmSq9MKdJR4AvWNDlvne71cJT2GhxR+9HWnBHfebNwu6eAJ1kNZQs+pfsap5UHvJjtMU39E0zt7KZNkqO/mZvaUTvfTC7lm2B9q302Uh6nhUgQ0U383cXeKHFM9BuNQBytbCNXDVASCqqxQzb+qtHvBtBc4Kfi/8BHtC0k5PQwVZbKJBonUP9XE/JKsZz3XVmZd6kqc2hkWQpQTfgPg+Iet+x6u/EVO9OyS1Wa2p0sB6lWxYxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4T4MLqsKg3/+4ObGb1Tbs9qV612P+v8UaQLUpTOvq+c=;
 b=hkWoCAqEkVt3j4mpafZq9SQrGjMBNlFTEJ+BNwW8lfZIW4Oh5L/CtUhbyMCuY+uf4/EVkbHWAuVScmIDp7iyA9zkd0V//TWVN+dgnYHPjAeaOh5Xm1LPEYJhwF5nbHY8ZU9cvesw6UMO0p/Pm8yVA1PXjxIbG35uEfEeGpSenGbc2zY6udX5j5HTLn9pF5RyMsl9t+Qxn4yTNNfBZdRV4dWaglCG1V/n1u0eWOTtpcK8dBFulcKhn6QNSUbcEV9LoTwA2hSw/OFf+5q/0ERaoAElb+QZPGsetupIcKMGdG0KTbepzHPZW/2EMUAhdd2vDN1mq6BWuWkvpcNef8jeLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T4MLqsKg3/+4ObGb1Tbs9qV612P+v8UaQLUpTOvq+c=;
 b=JsyWFBBDqOwo4R3utPb4Cd01j8FzavfVYIBsXCQURk5K9OuPLdto8N37NdWDfc2oN5d+bb9R9G6k9mD7pxNtHOBgVrb2OIpQIE7H+LN22C0NM233qyKZnXAjHTk0Y+4A5/9uPEnlUqhkbpweuJju9GpXROF28WdmRzzkWHr+F7+YBRPg/An2fiExanJnN11axzut1w9oi/bg8cqVuffvDyPaUTiLeesbg2jjhqjP6Gu+pqsSGhDi6SkC5/VBS6uXpQnRt41juC01f87BbFiyQgaSrZaxS4z7fZuVzXCW2ciRiF6ccYsfttQEb+v6VokqGwU1Y2hPwHAC5aLPMkkDLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 00:52:57 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:52:57 +0000
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
Subject: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Date: Mon,  7 Nov 2022 20:52:51 -0400
Message-Id: <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5a4fe8-4c60-4901-0a17-08dac1239331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ldb3eioa1hMbOcdTvK3eDF1XulJqAYtlxoXZ9lEXQ0fOXrw0kn+VX6q/xWGi7LJdKjeEzucSIcCxQX/MXUTWINfxNghPlwyPtP7XdU4qZrYiCXlnQLEPOWgtMBhuJFhM5iVduGM5qWp7Vp/Z/5zTlMmI4rNimEYqUKmg4HVnjbDeLs7pxRaFJ6aMtT4QfEmWqUZBavgn8UOWZg45zWvCvwQuorVe5LChbXeFnqneaJ2eAyR+Ddv87XxIgznvD7FLiPVEAwy+StQ59NBFT+IqZKbVCnkFfeVWwW8K19tOLYn0pIL5pLiajOKN8rqWvl5V3/ywdIYr2MON7bUjzJBlDvb7p/fBYy8hzZ1JgBJwnUjX1/ZCMTFqlL6MrgFRvInmWIC4KcHIAigclM/0d25DxPhZwIcr1n7LvnIn8c3re0cRxhPoWziUF+lAIrYmocDT4e6aGX3xNEM68F7IqIQC30BiTEsn3VL4BxVF7EtlW9LTtjfBoc4IyJZR+pbR10jVQHX0q9TNeWrs0qPxLKj2EirxvNEpNSuVxY/xmIJdEESzWSacwChb+xCNnQ877LNr40XtB/2P+Q1fIf1v05SVwwMiXYbJP3XOv8cCkWmH7sDJl7l98Z60gWm1y4n20cQSOu9LDSTmdd+IqkhXLE5zkjEWyvgtBXmZmdVW/TatjHj+/coFxRUKYgWC5zd5ePWcPyH0NRr+27ZPHuVFqbHoCl/x0x5nRRoeh9PJAR/SmpvIvTqYHPSEhWLY22ISyFP2FI9TD6AM8X3l/Ddy3bMH8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(2616005)(921005)(83380400001)(38100700002)(186003)(2906002)(30864003)(7416002)(7406005)(8936002)(86362001)(5660300002)(478600001)(6666004)(6486002)(26005)(6512007)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(41300700001)(110136005)(54906003)(66946007)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t1u5PxB0/PToljlGYGrmh81qMXYBlnk04dQsHhS7P4tnDdAQXCuwIzB0BuNd?=
 =?us-ascii?Q?A7GIkoT/f9qxdI6nXw2uNB3YV570tTETf0rJltZ/d4n68rnHMFgRaLyTW/1j?=
 =?us-ascii?Q?exajqAbQDzOfuBrHx9aUDBQ3/drM1F4c923htwDr3e27F1+MUD5i7ezhpm9B?=
 =?us-ascii?Q?YrTZCrn+VUZTUJ2eNZHajksU8teHP3yYrqeP0Evf8BrrD+VpzpBghl1pz+YI?=
 =?us-ascii?Q?RC+hWBMP5dUKg450jIaKVCvrMor/M4jXZukFTg3o9aC7zGMBSY9QDRdASJU0?=
 =?us-ascii?Q?Fen0RAzE9yESTd6oH8TJKItrz7H3Q4r2BtBWtIHDNOitQqehIAaqokpTixM6?=
 =?us-ascii?Q?OW3egjfcb4VkRUrvHzAyOVNd155yqJhY3mv0wXy77x1D9fxTUjw4gyTH9h24?=
 =?us-ascii?Q?KstdxssQDeIrFa1hIxfCy8aRdZ7sv0TFdp69CAZemxfBtO424Arqh22bMgrE?=
 =?us-ascii?Q?CVBILGxFAed14EGwIyKYsJxkhPnEHJvDyID0I3PQFOhT+5QRy+qjhT4eJXcc?=
 =?us-ascii?Q?iuqYKkuF7W5s/fMmO73GmZrLHpFNiiAdXGYh9IWNeawwxl8riQxZCubEBW6Q?=
 =?us-ascii?Q?wsDKgYMMsVBdTbiUAgqKFtVMXuf6b2vyEiZHlYYL1Qad7X7RJHTIav9PkX+r?=
 =?us-ascii?Q?CjQoBjQxWLGAEhNfAhexcWeSKCXtRt+e3QF/zxQqbRVsjrMkBfirpNk4J6rx?=
 =?us-ascii?Q?L0Rs0LXbA2nI+eNCuuo3XryaRnWjOXAgK84lq/BYNC+up6HBFm1Q7X6koxvS?=
 =?us-ascii?Q?S2oY9X/oag1zVbW0WbiezEw6n2Gmj7uCzseP/2SYrGvXdWrH8xR72zq7vWr5?=
 =?us-ascii?Q?oOvuktNiM8NvoniXyS+sZRRtMzPQYwZMDVnUBZ+3l3K2udnetIW8omfA4A4g?=
 =?us-ascii?Q?Tto3tnaVEIP/FkUcnianIx88Qp+zsV4MqgAfO6hhugXenFGb6yfaJ35OD2NG?=
 =?us-ascii?Q?ec1q+zuIsAGHtZT553M1MRFDQBIxG+kLoD9MCWzmjQm0oU3i//SdPISoedhn?=
 =?us-ascii?Q?xoyS1fhdw8vRo88NuFHPPU3ND7DZcJl3QL6Dk0tFu1WX2ShGEafVKf62/4zF?=
 =?us-ascii?Q?P9cTULlAh/SV8e+pmcYKw/V7msxfKwRyBrCkhOLbUA2FzqHcIX7LYypckIQv?=
 =?us-ascii?Q?avH/GOZHRkGMp5JuGW6agZLD9auwGdaXyNK9TSGZxtpY/jiLZSNnmB4dqa2u?=
 =?us-ascii?Q?+3I8fLHftN6X6AhwXwszCTva1LuZ143vMug6ksG2rD6MlVP7G0jOkkVhatbD?=
 =?us-ascii?Q?VtY/fyKcwrRqg8G6wAL3ugcXJ+qjDs9Ri9Ke7e0ozSOvAhokyH/WAD6YRllo?=
 =?us-ascii?Q?TSE5z1kbqih7eQngIO+Y4b48tyIhJhAlayKY7DwUvScU2cU32D5znK4LVL5T?=
 =?us-ascii?Q?hzzXEAR+OrKcbcVSvLDwXgzbJdWg2Tcw6e5mUpXBV1RYeRm8aRD19hBUKxyD?=
 =?us-ascii?Q?5fOiDBH6Q2JO0J46gN9PX7oFTDvuHhgu2T2fWhDxANmAltnXz8+TOfpgZ9CH?=
 =?us-ascii?Q?dEXIS2n2EV/UOHoUq0LvkU57j1gvBZroxxz0ad+DumBKvFD3jHoacM22Eh8I?=
 =?us-ascii?Q?hn98WhPhCdWonMRhgLQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5a4fe8-4c60-4901-0a17-08dac1239331
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:56.6169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mS7D4WORgf1/plkrpbGeMBK/bMQogHQVev0u6RMCuhI/ijyVxgWKrI1SM9AAJp22
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

This creates the iommufd_device for the physical VFIO drivers. These are
all the drivers that are calling vfio_register_group_dev() and expect the
type1 code to setup a real iommu_domain against their parent struct
device.

The design gives the driver a choice in how it gets connected to iommufd
by providing bind_iommufd/unbind_iommufd/attach_ioas callbacks to
implement as required. The core code provides three default callbacks for
physical mode using a real iommu_domain. This is suitable for drivers
using vfio_register_group_dev()

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/Makefile                         |  1 +
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |  3 +
 drivers/vfio/iommufd.c                        | 99 +++++++++++++++++++
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  6 ++
 drivers/vfio/pci/mlx5/main.c                  |  3 +
 drivers/vfio/pci/vfio_pci.c                   |  3 +
 drivers/vfio/platform/vfio_amba.c             |  3 +
 drivers/vfio/platform/vfio_platform.c         |  3 +
 drivers/vfio/vfio.h                           | 15 +++
 drivers/vfio/vfio_main.c                      | 13 ++-
 include/linux/vfio.h                          | 25 +++++
 11 files changed, 172 insertions(+), 2 deletions(-)
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
index 00000000000000..bf755d0f375c5d
--- /dev/null
+++ b/drivers/vfio/iommufd.c
@@ -0,0 +1,99 @@
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
+	ret = iommufd_vfio_compat_ioas_id(ictx, &ioas_id);
+	if (ret)
+		goto err_unbind;
+	ret = vdev->ops->attach_ioas(vdev, &ioas_id);
+	if (ret)
+		goto err_unbind;
+	vdev->iommufd_attached = true;
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
index 8c124290ce9f0d..2f3e35d2f2083d 100644
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
@@ -795,6 +800,10 @@ static int vfio_device_first_open(struct vfio_device *device)
 		ret = vfio_group_use_container(device->group);
 		if (ret)
 			goto err_module_put;
+	} else if (device->group->iommufd) {
+		ret = vfio_iommufd_bind(device, device->group->iommufd);
+		if (ret)
+			goto err_module_put;
 	}
 
 	device->kvm = device->group->kvm;
@@ -812,6 +821,7 @@ static int vfio_device_first_open(struct vfio_device *device)
 	device->kvm = NULL;
 	if (device->group->container)
 		vfio_group_unuse_container(device->group);
+	vfio_iommufd_unbind(device);
 err_module_put:
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
@@ -830,6 +840,7 @@ static void vfio_device_last_close(struct vfio_device *device)
 	device->kvm = NULL;
 	if (device->group->container)
 		vfio_group_unuse_container(device->group);
+	vfio_iommufd_unbind(device);
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
 }
@@ -1937,8 +1948,6 @@ static void __exit vfio_cleanup(void)
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
2.38.1

