Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 149425A896F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 01:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861DB10E532;
	Wed, 31 Aug 2022 23:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95EB10E532
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 23:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA/4IGEDCV28MQeLJHYtzdLSjkvPAwP195NM0zkLa8FU5UuPN+XGx6Ee1dZeJeJzE+fcoJSpMuB1UQcWnVVi/OIFb+kX4c27ZeD4mVaICkNhhawa9cvQUg5Dz8HyOMjmNCYJsA+XEtQhwh3gtQCDFiVCp1shS2crxpsw7C86alVJ7z5GhFOPJmRdwNUpm40a90wHWwbKzwsUr+dtH4SricedwC263KJA7h4zBH0xKE1Ty4vHJIARPh8B5Y35rvIX0T/eYUfgjieKlo16aKbErl5IARIJ3yy8nd0dufq4bhrahnppUI88Xyu6UL+MoU6xkivRpFNvymeOJfYoT0ItNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0LtB51y7BNdbWk/1aFxhV0QoCkBIuNZay7KZllwrDE=;
 b=kR7xh9Gm1MPnV0L8I4YQSEbCyi2Mkfkr8pKJUmS80spHQw2j7ZPpp4TAru85MoaJZybR47sz9Igp4oiU/wOO068osN47eVqM9J0BBxWntfgtYWKemYnTFkDyKRWcRKc683IX/h5TbORiDGWbbb4G7oLaW4IC4qkopoG/CyIx9npzLiLDfUbVuPJRX7n64BA+LAcSq6XOygSPkNbubOqjgyTUkPmdUwU/hQYQxJiLxRdgPKnpxWh7fnjYkV09nd7CpllE+m/gdEeOAi+FEhLQpVQSzFoLvf+xsbDB0I2PH8cwdvkw2eEAzi7JlqPAOybnFmUdYrWWAIvHiHRK5Pu5+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0LtB51y7BNdbWk/1aFxhV0QoCkBIuNZay7KZllwrDE=;
 b=WfJigUJKri2149y+JAR8iNnxuiqSQDnXV385/Zbm/BmXW+SKC7EsmffeSbJ5XfVk5qn7n3iHwP80mvZTqBKNMJWRfhShV9k0KZYBaXICRINS367H4b2PW9wAW/11Ou+2uQyMnVQKaT4Lz4OvxiF7114iS+KBEtqiOWmWKjB1usQT3oLfFInLXkwK4OoxoAK+F1ZBnaIKD3BhZb7mGA3ZCNM6cG8bYMrYDJjIDQUU2NTlthRkY4qHjUze+azFiMKWbjWm3S+EE1UB9xw5VZAc6i9qCQvL+tZGdiFqQqm8LEBvpli+zNZFkOPSfRa2nQ3eP/71tpIULwbXzzuaj5fwww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 23:12:47 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 23:12:47 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported through
 dma-buf
Date: Wed, 31 Aug 2022 20:12:44 -0300
Message-Id: <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
In-Reply-To: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0413.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::28) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1604cc42-2018-420c-fb4f-08da8ba650b2
X-MS-TrafficTypeDiagnostic: MW5PR12MB5650:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ail4+rZWtNLviKzYUdQfWU9WXYM6C7MV0VbocUG2//YUYShu5NPw6jVqHpolSwp4cwYrEEgkSjz9WvCfBUPofbg/DC4ZxlccJRIHiOGi09tVb9PZAUhP3SQFDmK/ccxHH3U2lvY/ueR+ZZMjd4+ThbXCBP6x35ONI+u5uTVW4NCKmfmMpjG/ZX+WDfpKnLDuhQ/taVVqBFQa2AbYDURn4eOhTr0uQn7/GkVn8cbFRU6FmSUTdcwOdIt7knb0S+mbCLZ+3D5hqgHR16KhNQWTeX8QZ5SuwpYlhskNOP7xxVYxrEHp+twEoXPigiLfeOd4CizxmzXViQn9zcgp/EUtgkvZdZAPsyi7NkOOx/nKyGJ/VljV46SvCs152UnH0F3IOeCb4KbN+v8hw1e9Uz/PMOJhV+d2ZjJhhrnzs9WHBArPIBaxnAWN3b9utjwQFpPqLiJORfyemU9v4Wfxa+bZthzjJBApdntXdOAqmcLp1ovr4XxyUoy4GN0TwH7DWqRtZcx5Sl3rVu+lfnFdgLJswEuf7J6Tm21tsvFsiva+v8dDnpwefn0veOtFl4SubWSTLT/oWqBuKxZWf5JDGb712bpb+2WWFawjHNfTqWXJN8co+DdClSEjubkTmrwN+7H7xi1+E03/mHC5jp/Ypzn1UUb4bu//wfvu/1XpFNXjH08dqc4feMIals1S2vTAZTu8yDtYr8KWIRISr3e+4l+Yo3wnKMDi5YOn9qAA6OIoLszexr9Fs886/mDGAMJHFRuy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(8936002)(6512007)(26005)(6666004)(86362001)(110136005)(478600001)(6486002)(38100700002)(54906003)(41300700001)(186003)(2906002)(66946007)(7416002)(2616005)(36756003)(83380400001)(30864003)(5660300002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KSHHbXYJR2F8l3ViJKgSwfOF7XbvTsU9utqlmmaROuf+2Ilq46UfZPJTmQAT?=
 =?us-ascii?Q?KHtQkV465sCUs5+wf9yI7ybSh2jXycf3Jj1/thdYshAJ1fRWtqb/eQRRe4Bs?=
 =?us-ascii?Q?EsGV23EAaFaj1m28TDMbzop9FDFbrWUd7Geb628huyGQOcs/Ks53KiXxxrb/?=
 =?us-ascii?Q?oo1yCLVREQkSHr/eMGEIf/Y/yMIogHUKrlWqmS9PGQNdXWwic9P/GaqpQGSH?=
 =?us-ascii?Q?YAmd0ZzBppQivamASyMvyCNBg1vXU8DLWilYm3qr1sKVsyh25CxQGWI6YTXL?=
 =?us-ascii?Q?dmv+EZlDKAQYOqnyIH3/cWcvMI3EjRVuBF0FF297dtS8jAdmQ4WTOKar6uyG?=
 =?us-ascii?Q?Cfk41LS5FOpNLwvkj3OM/fA93uzOO9OFoBtF/bmnc7m3zJxgCPX7oB+aGoS4?=
 =?us-ascii?Q?MbNRJigrREiFXE4azquX2vXpML4tfN8qnWjFfhPLU1bMCKpibkX1ZhPAlJtQ?=
 =?us-ascii?Q?xvdD/5JXhwAUllE4LHBXMvSVZSWHOxYHD207Fmpjo5DsYED8XBapRxmhLG9X?=
 =?us-ascii?Q?e8nA8kxwoEoyJBkpBdrmFGwNoPmIH4n/nWC6JaUA1ZPXkSjzV0ohYtHn68iO?=
 =?us-ascii?Q?XALRFCfRJQgshAoH6L1TEAEG7BxLKX0/rH4Bfrcz7h+f7nkBBldIWBVdzLLo?=
 =?us-ascii?Q?yehUnqUPZVU+jd/aqwl/IwH2WhgSIRtl5uwfqvyGeK0I6YLCo0DGHzwtAYHX?=
 =?us-ascii?Q?dgpwxauILGDOLVKeDBjjYVzSwfRIE4L3+XNBxq6SjmsMCTXVbb9yumk8asua?=
 =?us-ascii?Q?2YhidIAYQ17Py0vz5kjfjVBFXGPyUvp7/l++//a916tEL3w7RguLIjn1J2Th?=
 =?us-ascii?Q?gM+cr2rJRjdPkNslcWSeM3O1M/B+UsNZRlrZTMCTPj0awWAWuij8ClUQ3K1k?=
 =?us-ascii?Q?im6g9yXRIAsAOvlvBoWdtYL99GHfsSjcXpiH12K6XiHQsk6QyULq1E3phjSe?=
 =?us-ascii?Q?J40m8V7T9PBAZk80OBlUoDmJUMm4FczIr8Yku3Mx/YXx9qNHfiUQ8sVIcnKg?=
 =?us-ascii?Q?LvBjHnDVTawtmy28hwcVfQMYvviK/Nus1uAthf0W4jKN/vJ3z8VJwTCVIRES?=
 =?us-ascii?Q?1PDUHt4wmz6jdApTTLwzJ3szoJLg9VhduhuLr1wED51DoLmXovxNfLXKy0VA?=
 =?us-ascii?Q?qSLW/sGvQ2+pkMPjEbJ730FZfApyg5nJkHQIheq/cioWh2eViDaBc0iiQjbk?=
 =?us-ascii?Q?0Ad7cyHSTLbbcgM0cx53kRCeiwnWgs0+iP3aQDc8ebGP3B3k4WZlyjUzp5cZ?=
 =?us-ascii?Q?0151HzSBxBCGMM/oOvj6QHFiMfNFRJvqwoXVl2OOENUV3dTISOXUOIfRBzYb?=
 =?us-ascii?Q?xvjAVQUcs869U9qrkO7w/7vsKTUouTXKSLdeQxin8+S+M+5e/6PsZYZT+Uaf?=
 =?us-ascii?Q?ApB2s4o5o/5+R46Iwp4/l+xAiWCUQORNnTG64t8CpJfsfi5MKeXY43Rw2tuY?=
 =?us-ascii?Q?cqfK99iSRVHleL1cbti5OLYTUlVusUeawYHoA54y2M+FVw/wFuL+WDReay+M?=
 =?us-ascii?Q?CEMCVUsHGJ4Ok1fW/TjW4Fue9W/dqqrChhhNU1kXQOO9HwMdyBfW0cjEfGMU?=
 =?us-ascii?Q?HeyV1bycbrEKmKYgcG/ZiXTYmBTjPeUxUmOE1jIz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1604cc42-2018-420c-fb4f-08da8ba650b2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 23:12:46.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TATP70VUGp+Ui9uJzTJRMpbZ8CsCIddUFKP2S3vYRc46HsTJkk/XAo5pDQ9QP2L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma-buf has become a way to safely acquire a handle to non-struct page
memory that can still have lifetime controlled by the exporter. Notably
RDMA can now import dma-buf FDs and build them into MRs which allows for
PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
from PCI device BARs.

The patch design loosely follows the pattern in commit
db1a8dd916aa ("habanalabs: add support for dma-buf exporter") except this
does not support pinning.

Instead, this implements what, in the past, we've called a revocable
attachment using move. In normal situations the attachment is pinned, as a
BAR does not change physical address. However when the VFIO device is
closed, or a PCI reset is issued, access to the MMIO memory is revoked.

Revoked means that move occurs, but an attempt to immediately re-map the
memory will fail. In the reset case a future move will be triggered when
MMIO access returns. As both close and reset are under userspace control
it is expected that userspace will suspend use of the dma-buf before doing
these operations, the revoke is purely for kernel self-defense against a
hostile userspace.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/Makefile          |   1 +
 drivers/vfio/pci/dma_buf.c         | 269 +++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_config.c |   8 +-
 drivers/vfio/pci/vfio_pci_core.c   |  28 ++-
 drivers/vfio/pci/vfio_pci_priv.h   |  23 +++
 include/linux/vfio_pci_core.h      |   1 +
 include/uapi/linux/vfio.h          |  18 ++
 7 files changed, 340 insertions(+), 8 deletions(-)
 create mode 100644 drivers/vfio/pci/dma_buf.c

diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index 24c524224da5a3..514c12a81127d6 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -2,6 +2,7 @@
 
 vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
 vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
+vfio-pci-core-$(CONFIG_DMA_SHARED_BUFFER) += dma_buf.o
 obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
 
 vfio-pci-y := vfio_pci.o
diff --git a/drivers/vfio/pci/dma_buf.c b/drivers/vfio/pci/dma_buf.c
new file mode 100644
index 00000000000000..11396aeabff405
--- /dev/null
+++ b/drivers/vfio/pci/dma_buf.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2022, NVIDIA CORPORATION & AFFILIATES.
+ */
+#include <linux/dma-buf.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/dma-resv.h>
+
+#include "vfio_pci_priv.h"
+
+MODULE_IMPORT_NS(DMA_BUF);
+
+struct vfio_pci_dma_buf {
+	struct dma_buf *dmabuf;
+	struct vfio_pci_core_device *vdev;
+	struct list_head dmabufs_elm;
+	unsigned int index;
+	unsigned int orig_nents;
+	size_t offset;
+	bool revoked;
+};
+
+static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
+				   struct dma_buf_attachment *attachment)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+	int rc;
+
+	rc = pci_p2pdma_distance_many(priv->vdev->pdev, &attachment->dev, 1,
+				      true);
+	if (rc < 0)
+		attachment->peer2peer = false;
+	return 0;
+}
+
+static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
+{
+}
+
+static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
+{
+	/*
+	 * Uses the dynamic interface but must always allow for
+	 * dma_buf_move_notify() to do revoke
+	 */
+	return -EINVAL;
+}
+
+static struct sg_table *
+vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
+		     enum dma_data_direction dir)
+{
+	size_t sgl_size = dma_get_max_seg_size(attachment->dev);
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+	struct scatterlist *sgl;
+	struct sg_table *sgt;
+	dma_addr_t dma_addr;
+	unsigned int nents;
+	size_t offset;
+	int ret;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	if (!attachment->peer2peer)
+		return ERR_PTR(-EPERM);
+
+	if (priv->revoked)
+		return ERR_PTR(-ENODEV);
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	nents = DIV_ROUND_UP(priv->dmabuf->size, sgl_size);
+	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
+	if (ret)
+		goto err_kfree_sgt;
+
+	/*
+	 * Since the memory being mapped is a device memory it could never be in
+	 * CPU caches.
+	 */
+	dma_addr = dma_map_resource(
+		attachment->dev,
+		pci_resource_start(priv->vdev->pdev, priv->index) +
+			priv->offset,
+		priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	ret = dma_mapping_error(attachment->dev, dma_addr);
+	if (ret)
+		goto err_free_sgt;
+
+	/*
+	 * Break the BAR's physical range up into max sized SGL's according to
+	 * the device's requirement.
+	 */
+	sgl = sgt->sgl;
+	for (offset = 0; offset != priv->dmabuf->size;) {
+		size_t chunk_size = min(priv->dmabuf->size - offset, sgl_size);
+
+		sg_set_page(sgl, NULL, chunk_size, 0);
+		sg_dma_address(sgl) = dma_addr + offset;
+		sg_dma_len(sgl) = chunk_size;
+		sgl = sg_next(sgl);
+		offset += chunk_size;
+	}
+
+	/*
+	 * Because we are not going to include a CPU list we want to have some
+	 * chance that other users will detect this by setting the orig_nents to
+	 * 0 and using only nents (length of DMA list) when going over the sgl
+	 */
+	priv->orig_nents = sgt->orig_nents;
+	sgt->orig_nents = 0;
+	return sgt;
+
+err_free_sgt:
+	sg_free_table(sgt);
+err_kfree_sgt:
+	kfree(sgt);
+	return ERR_PTR(ret);
+}
+
+static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
+				   struct sg_table *sgt,
+				   enum dma_data_direction dir)
+{
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+
+	sgt->orig_nents = priv->orig_nents;
+	dma_unmap_resource(attachment->dev, sg_dma_address(sgt->sgl),
+			   priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+
+	/*
+	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
+	 * The refcount prevents both.
+	 */
+	if (priv->vdev) {
+		down_write(&priv->vdev->memory_lock);
+		list_del_init(&priv->dmabufs_elm);
+		up_write(&priv->vdev->memory_lock);
+		vfio_device_put(&priv->vdev->vdev);
+	}
+	kfree(priv);
+}
+
+static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
+	.attach = vfio_pci_dma_buf_attach,
+	.map_dma_buf = vfio_pci_dma_buf_map,
+	.pin = vfio_pci_dma_buf_pin,
+	.unpin = vfio_pci_dma_buf_unpin,
+	.release = vfio_pci_dma_buf_release,
+	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
+};
+
+int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
+				  struct vfio_device_feature_dma_buf __user *arg,
+				  size_t argsz)
+{
+	struct vfio_device_feature_dma_buf get_dma_buf;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct vfio_pci_dma_buf *priv;
+	int ret;
+
+	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
+				 sizeof(get_dma_buf));
+	if (ret != 1)
+		return ret;
+
+	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
+		return -EFAULT;
+
+	/* For PCI the region_index is the BAR number like everything else */
+	if (get_dma_buf.region_index >= VFIO_PCI_ROM_REGION_INDEX)
+		return -EINVAL;
+
+	exp_info.ops = &vfio_pci_dmabuf_ops;
+	exp_info.size = pci_resource_len(vdev->pdev, get_dma_buf.region_index);
+	if (!exp_info.size)
+		return -EINVAL;
+	if (get_dma_buf.offset || get_dma_buf.length) {
+		if (get_dma_buf.length > exp_info.size ||
+		    get_dma_buf.offset >= exp_info.size ||
+		    get_dma_buf.length > exp_info.size - get_dma_buf.offset ||
+		    get_dma_buf.offset % PAGE_SIZE ||
+		    get_dma_buf.length % PAGE_SIZE)
+			return -EINVAL;
+		exp_info.size = get_dma_buf.length;
+	}
+	exp_info.flags = get_dma_buf.open_flags;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&priv->dmabufs_elm);
+	priv->offset = get_dma_buf.offset;
+	priv->index = get_dma_buf.region_index;
+
+	exp_info.priv = priv;
+	priv->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(priv->dmabuf)) {
+		ret = PTR_ERR(priv->dmabuf);
+		kfree(priv);
+		return ret;
+	}
+
+	/* dma_buf_put() now frees priv */
+
+	down_write(&vdev->memory_lock);
+	dma_resv_lock(priv->dmabuf->resv, NULL);
+	priv->revoked = !__vfio_pci_memory_enabled(vdev);
+	priv->vdev = vdev;
+	vfio_device_get(&vdev->vdev);
+	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
+	dma_resv_unlock(priv->dmabuf->resv);
+	up_write(&vdev->memory_lock);
+
+	/*
+	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
+	 * will be released.
+	 */
+	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
+}
+
+void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
+{
+	struct vfio_pci_dma_buf *priv;
+	struct vfio_pci_dma_buf *tmp;
+
+	lockdep_assert_held_write(&vdev->memory_lock);
+
+	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
+		if (!dma_buf_try_get(priv->dmabuf))
+			continue;
+		if (priv->revoked != revoked) {
+			dma_resv_lock(priv->dmabuf->resv, NULL);
+			priv->revoked = revoked;
+			dma_buf_move_notify(priv->dmabuf);
+			dma_resv_unlock(priv->dmabuf->resv);
+		}
+		dma_buf_put(priv->dmabuf);
+	}
+}
+
+void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
+{
+	struct vfio_pci_dma_buf *priv;
+	struct vfio_pci_dma_buf *tmp;
+
+	down_write(&vdev->memory_lock);
+	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
+		if (!dma_buf_try_get(priv->dmabuf))
+			continue;
+		dma_resv_lock(priv->dmabuf->resv, NULL);
+		list_del_init(&priv->dmabufs_elm);
+		priv->vdev = NULL;
+		priv->revoked = true;
+		dma_buf_move_notify(priv->dmabuf);
+		dma_resv_unlock(priv->dmabuf->resv);
+		vfio_device_put(&vdev->vdev);
+		dma_buf_put(priv->dmabuf);
+	}
+	up_write(&vdev->memory_lock);
+}
diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index d22921efa25987..f8a9c24d04aeb7 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -584,10 +584,12 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
 		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
 		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
 
-		if (!new_mem)
+		if (!new_mem) {
 			vfio_pci_zap_and_down_write_memory_lock(vdev);
-		else
+			vfio_pci_dma_buf_move(vdev, true);
+		} else {
 			down_write(&vdev->memory_lock);
+		}
 
 		/*
 		 * If the user is writing mem/io enable (new_mem/io) and we
@@ -622,6 +624,8 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
 		*virt_cmd &= cpu_to_le16(~mask);
 		*virt_cmd |= cpu_to_le16(new_cmd & mask);
 
+		if (__vfio_pci_memory_enabled(vdev))
+			vfio_pci_dma_buf_move(vdev, false);
 		up_write(&vdev->memory_lock);
 	}
 
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 885706944e4d96..7e27bfc60440c2 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -504,6 +504,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
 	vfio_spapr_pci_eeh_release(vdev->pdev);
 	vfio_pci_core_disable(vdev);
 
+	vfio_pci_dma_buf_cleanup(vdev);
+
 	mutex_lock(&vdev->igate);
 	if (vdev->err_trigger) {
 		eventfd_ctx_put(vdev->err_trigger);
@@ -980,7 +982,10 @@ int vfio_pci_try_reset_function(struct vfio_pci_core_device *vdev)
 	 */
 	vfio_pci_set_power_state(vdev, PCI_D0);
 
+	vfio_pci_dma_buf_move(vdev, true);
 	ret = pci_try_reset_function(vdev->pdev);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
 	up_write(&vdev->memory_lock);
 
 	return ret;
@@ -1210,11 +1215,10 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 }
 EXPORT_SYMBOL_GPL(vfio_pci_core_ioctl);
 
-static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
-				       uuid_t __user *arg, size_t argsz)
+static int vfio_pci_core_feature_token(struct vfio_pci_core_device *vdev,
+				       u32 flags, uuid_t __user *arg,
+				       size_t argsz)
 {
-	struct vfio_pci_core_device *vdev =
-		container_of(device, struct vfio_pci_core_device, vdev);
 	uuid_t uuid;
 	int ret;
 
@@ -1241,9 +1245,14 @@ static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
 int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 				void __user *arg, size_t argsz)
 {
+	struct vfio_pci_core_device *vdev =
+		container_of(device, struct vfio_pci_core_device, vdev);
+
 	switch (flags & VFIO_DEVICE_FEATURE_MASK) {
 	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
-		return vfio_pci_core_feature_token(device, flags, arg, argsz);
+		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
+	case VFIO_DEVICE_FEATURE_DMA_BUF:
+		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
 	default:
 		return -ENOTTY;
 	}
@@ -1881,6 +1890,7 @@ void vfio_pci_core_init_device(struct vfio_pci_core_device *vdev,
 	INIT_LIST_HEAD(&vdev->vma_list);
 	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
 	init_rwsem(&vdev->memory_lock);
+	INIT_LIST_HEAD(&vdev->dmabufs);
 }
 EXPORT_SYMBOL_GPL(vfio_pci_core_init_device);
 
@@ -2227,11 +2237,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 	 * cause the PCI config space reset without restoring the original
 	 * state (saved locally in 'vdev->pm_save').
 	 */
-	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
+		vfio_pci_dma_buf_move(cur, true);
 		vfio_pci_set_power_state(cur, PCI_D0);
+	}
 
 	ret = pci_reset_bus(pdev);
 
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
+		if (__vfio_pci_memory_enabled(cur))
+			vfio_pci_dma_buf_move(cur, false);
+
 err_undo:
 	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
 		if (cur == cur_mem)
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 5b1cb9a9838442..c295a1166e7a9c 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -102,4 +102,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
 	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
 }
 
+#ifdef CONFIG_DMA_SHARED_BUFFER
+int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
+				  struct vfio_device_feature_dma_buf __user *arg,
+				  size_t argsz);
+void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
+void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
+#else
+static int
+vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
+			      struct vfio_device_feature_dma_buf __user *arg,
+			      size_t argsz)
+{
+	return -ENOTTY;
+}
+static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
+{
+}
+static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
+					 bool revoked)
+{
+}
+#endif
+
 #endif
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index e5cf0d3313a694..fb9769d9e5d149 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -93,6 +93,7 @@ struct vfio_pci_core_device {
 	struct mutex		vma_lock;
 	struct list_head	vma_list;
 	struct rw_semaphore	memory_lock;
+	struct list_head	dmabufs;
 };
 
 /* Will be exported for vfio pci drivers usage */
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 733a1cddde30a5..1dcfad6dcb6863 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -986,6 +986,24 @@ enum vfio_device_mig_state {
 	VFIO_DEVICE_STATE_RUNNING_P2P = 5,
 };
 
+/**
+ * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
+ * region selected.
+ *
+ * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOEXEC,
+ * etc. offset/length specify a slice of the region to create the dmabuf from.
+ * If both are 0 then the whole region is used.
+ *
+ * Return: The fd number on success, -1 and errno is set on failure.
+ */
+struct vfio_device_feature_dma_buf {
+	__u32 region_index;
+	__u32 open_flags;
+	__u32 offset;
+	__u64 length;
+};
+#define VFIO_DEVICE_FEATURE_DMA_BUF 3
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**
-- 
2.37.2

