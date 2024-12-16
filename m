Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B049F494E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A23410E8FA;
	Tue, 17 Dec 2024 10:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="AfP4AYg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA7B10E571
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:05:52 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG7uhPx031750
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:56:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=facebook; bh=F
 ViO/GG+RK+U6PNdQVar6FXzIzCS7v+deFT5xR57T6M=; b=AfP4AYg4Sz3/7aA6u
 +hzjsWTqthnJ0udiHqECM3aYSJgleIxzZ8ngJPjAxFafOAoRbfl8v7dzruGeJIiB
 akiwC1K/uL4dC46wsewb8woI4FLjseEawWEZxnKNXzOMsVJqrQNIbt6SZmNukbL6
 5sOX5VZm4Quj5P9WQQG4DiRQNc=
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 43jg8pghx4-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:56:07 -0800 (PST)
Received: from twshared11082.06.ash8.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.11; Mon, 16 Dec 2024 09:56:05 +0000
Received: by devvm12370.nha0.facebook.com (Postfix, from userid 624418)
 id D8AB610A1F00A; Mon, 16 Dec 2024 01:55:55 -0800 (PST)
From: Wei Lin Guay <wguay@fb.com>
To: <alex.williamson@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <kvm@vger.kernel.org>, <linux-rdma@vger.kernel.org>
CC: <jgg@nvidia.com>, <vivek.kasireddy@intel.com>, <dagmoxnes@meta.com>,
 <kbusch@kernel.org>, <nviljoen@meta.com>, Wei Lin Guay <wguay@meta.com>
Subject: [PATCH 4/4] vfio/pci: Allow export dmabuf without move_notify from
 importer
Date: Mon, 16 Dec 2024 01:54:18 -0800
Message-ID: <20241216095429.210792-5-wguay@fb.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241216095429.210792-1-wguay@fb.com>
References: <20241216095429.210792-1-wguay@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: wr0pHo9lAKgNJYXBUAoreICzGQYQw7Oh
X-Proofpoint-ORIG-GUID: wr0pHo9lAKgNJYXBUAoreICzGQYQw7Oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
X-Mailman-Approved-At: Tue, 17 Dec 2024 10:55:20 +0000
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

From: Wei Lin Guay <wguay@meta.com>

Summary:
Support vfio to export dmabuf to importer such as RDMA NIC that does
not support move_notify callback, since not all RDMA driver support
on-demand-paging (ODP).

There are some use-cases such as bind accelerator that always pinned
the device memory via vfio and export it to RDMA NIC such as EFA, BNXT_RE
or IRDMA that does not support ODP.

Signed-off-by: Wei Lin Guay <wguay@meta.com>
Reviewed-by: Dag Moxnes <dagmoxnes@meta.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Nic Viljoen <nviljoen@meta.com>
---
 drivers/vfio/pci/dma_buf.c       | 32 +++++++++++++++++++++++++++-----
 drivers/vfio/pci/vfio_pci_core.c | 16 ++++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h |  7 +++++++
 3 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/pci/dma_buf.c b/drivers/vfio/pci/dma_buf.c
index fd772b520cd7..8017f48296cb 100644
--- a/drivers/vfio/pci/dma_buf.c
+++ b/drivers/vfio/pci/dma_buf.c
@@ -17,6 +17,7 @@ struct vfio_pci_dma_buf {
 	unsigned int orig_nents;
 	size_t offset;
 	bool revoked;
+	bool pinned;
 };

 static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
@@ -32,17 +33,38 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dm=
abuf,
 	return 0;
 }

+bool vfio_pci_dma_buf_pinned(struct vfio_pci_core_device *vdev)
+{
+	struct vfio_pci_dma_buf *priv;
+	struct vfio_pci_dma_buf *tmp;
+	bool pinned =3D false;
+
+	down_write(&vdev->memory_lock);
+	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
+		if (!dma_buf_try_get(priv->dmabuf))
+			continue;
+		if (priv->pinned) {
+			pinned =3D true;
+			break;
+		}
+	}
+	up_write(&vdev->memory_lock);
+	return pinned;
+}
+
 static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment=
)
 {
+	struct vfio_pci_dma_buf *priv =3D attachment->dmabuf->priv;
+
+	priv->pinned =3D false;
 }

 static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
 {
-	/*
-	 * Uses the dynamic interface but must always allow for
-	 * dma_buf_move_notify() to do revoke
-	 */
-	return -EINVAL;
+	struct vfio_pci_dma_buf *priv =3D attachment->dmabuf->priv;
+
+	priv->pinned =3D true;
+	return 0;
 }

 static struct sg_table *
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci=
_core.c
index bb97b4d94eb7..db28fa2cc9a8 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1246,6 +1246,13 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_co=
re_device *vdev,
 	 */
 	vfio_pci_set_power_state(vdev, PCI_D0);

+	/*
+	 * prevent reset if dma_buf is pinned to avoid stale pinned
+	 * expose to the dmabuf exporter.
+	 */
+	if (vfio_pci_dma_buf_pinned(vdev))
+		return -EINVAL;
+
 	vfio_pci_dma_buf_move(vdev, true);
 	ret =3D pci_try_reset_function(vdev->pdev);
 	if (__vfio_pci_memory_enabled(vdev))
@@ -2444,6 +2451,15 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_=
device_set *dev_set,
 			break;
 		}

+		/*
+		 * prevent reset if dma_buf is pinned to avoid stale pinned
+		 * expose to the dmabuf exporter.
+		 */
+		if (vfio_pci_dma_buf_pinned(vdev)) {
+			ret =3D -EINVAL;
+			break;
+		}
+
 		/*
 		 * Take the memory write lock for each device and zap BAR
 		 * mappings to prevent the user accessing the device while in
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci=
_priv.h
index 09d3c300918c..43c40dc4751c 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -107,6 +107,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_cor=
e_device *vdev, u32 flags,
 				  size_t argsz);
 void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
 void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revok=
ed);
+bool vfio_pci_dma_buf_pinned(struct vfio_pci_core_device *vdev);
 #else
 static int
 vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 fla=
gs,
@@ -115,6 +116,12 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_d=
evice *vdev, u32 flags,
 {
 	return -ENOTTY;
 }
+
+static inline bool vfio_pci_dma_buf_pinned(struct vfio_pci_core_device *=
vdev)
+{
+	return false;
+}
+
 static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device =
*vdev)
 {
 }
--
2.43.5
