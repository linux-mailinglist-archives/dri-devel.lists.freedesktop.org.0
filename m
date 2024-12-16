Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE47A9F4951
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE3C10E8FC;
	Tue, 17 Dec 2024 10:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="IJsgqDVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C19F10E130
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:04:57 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG6pq1w019847
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:56:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=facebook; bh=m
 eDzT4/s9GyG+b4UGf4Pc9/eUyW/IdIjw2Jt7BPCD5E=; b=IJsgqDVyGqq6LQEdf
 7td+cX6CV0vkDHElvrYtASXlGW7r9bShq7RczX+S9BU0yVWOaSOmOifpBLe8Qwct
 taVRB1bllmbhCJs1rYRv4aG8c00H73ILORrB2sfGeR0CmgBVnuery7/7dane/5ft
 qrodDhI0e8EDMPqTog8mqWmgK4=
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 43jfa28tch-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:56:08 -0800 (PST)
Received: from twshared9216.15.frc2.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.11; Mon, 16 Dec 2024 09:56:06 +0000
Received: by devvm12370.nha0.facebook.com (Postfix, from userid 624418)
 id D686E10A1F007; Mon, 16 Dec 2024 01:55:55 -0800 (PST)
From: Wei Lin Guay <wguay@fb.com>
To: <alex.williamson@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <kvm@vger.kernel.org>, <linux-rdma@vger.kernel.org>
CC: <jgg@nvidia.com>, <vivek.kasireddy@intel.com>, <dagmoxnes@meta.com>,
 <kbusch@kernel.org>, <nviljoen@meta.com>, Wei Lin Guay <wguay@meta.com>
Subject: [PATCH 3/4] vfio/pci: Allow MMIO regions to be exported through
 dma-buf
Date: Mon, 16 Dec 2024 01:54:17 -0800
Message-ID: <20241216095429.210792-4-wguay@fb.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241216095429.210792-1-wguay@fb.com>
References: <20241216095429.210792-1-wguay@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: LFZEcLQ4IPk49WXPVNexLQDamsUAl_XW
X-Proofpoint-ORIG-GUID: LFZEcLQ4IPk49WXPVNexLQDamsUAl_XW
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

From: Jason Gunthorpe <jgg@nvidia.com>

Summary:
dma-buf has become a way to safely acquire a handle to non-struct page
memory that can still have lifetime controlled by the exporter. Notably
RDMA can now import dma-buf FDs and build them into MRs which allows for
PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
from PCI device BARs.

The patch design loosely follows the pattern in commit
db1a8dd916aa ("habanalabs: add support for dma-buf exporter") except this
does not support pinning.

Instead, this implements what, in the past, we've called a revocable
attachment using move. In normal situations the attachment is pinned, as =
a
BAR does not change physical address. However when the VFIO device is
closed, or a PCI reset is issued, access to the MMIO memory is revoked.

Revoked means that move occurs, but an attempt to immediately re-map the
memory will fail. In the reset case a future move will be triggered when
MMIO access returns. As both close and reset are under userspace control
it is expected that userspace will suspend use of the dma-buf before doin=
g
these operations, the revoke is purely for kernel self-defense against a
hostile userspace.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Wei Lin Guay <wguay@meta.com>
Reviewed-by: Dag Moxnes <dagmoxnes@meta.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Nic Viljoen <nviljoen@meta.com>
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
index cf00c0a7e55c..0cfdc9ede82f 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -2,6 +2,7 @@

 vfio-pci-core-y :=3D vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vf=
io_pci_config.o
 vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) +=3D vfio_pci_zdev.o
+vfio-pci-core-$(CONFIG_DMA_SHARED_BUFFER) +=3D dma_buf.o
 obj-$(CONFIG_VFIO_PCI_CORE) +=3D vfio-pci-core.o

 vfio-pci-y :=3D vfio_pci.o
diff --git a/drivers/vfio/pci/dma_buf.c b/drivers/vfio/pci/dma_buf.c
new file mode 100644
index 000000000000..fd772b520cd7
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
+	struct vfio_pci_dma_buf *priv =3D dmabuf->priv;
+	int rc;
+
+	rc =3D pci_p2pdma_distance_many(priv->vdev->pdev, &attachment->dev, 1,
+				      true);
+	if (rc < 0)
+		attachment->peer2peer =3D false;
+	return 0;
+}
+
+static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment=
)
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
+	size_t sgl_size =3D dma_get_max_seg_size(attachment->dev);
+	struct vfio_pci_dma_buf *priv =3D attachment->dmabuf->priv;
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
+	sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	nents =3D DIV_ROUND_UP(priv->dmabuf->size, sgl_size);
+	ret =3D sg_alloc_table(sgt, nents, GFP_KERNEL);
+	if (ret)
+		goto err_kfree_sgt;
+
+	/*
+	 * Since the memory being mapped is a device memory it could never be i=
n
+	 * CPU caches.
+	 */
+	dma_addr =3D dma_map_resource(
+		attachment->dev,
+		pci_resource_start(priv->vdev->pdev, priv->index) +
+			priv->offset,
+		priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	ret =3D dma_mapping_error(attachment->dev, dma_addr);
+	if (ret)
+		goto err_free_sgt;
+
+	/*
+	 * Break the BAR's physical range up into max sized SGL's according to
+	 * the device's requirement.
+	 */
+	sgl =3D sgt->sgl;
+	for (offset =3D 0; offset !=3D priv->dmabuf->size;) {
+		size_t chunk_size =3D min(priv->dmabuf->size - offset, sgl_size);
+
+		sg_set_page(sgl, NULL, chunk_size, 0);
+		sg_dma_address(sgl) =3D dma_addr + offset;
+		sg_dma_len(sgl) =3D chunk_size;
+		sgl =3D sg_next(sgl);
+		offset +=3D chunk_size;
+	}
+
+	/*
+	 * Because we are not going to include a CPU list we want to have some
+	 * chance that other users will detect this by setting the orig_nents t=
o
+	 * 0 and using only nents (length of DMA list) when going over the sgl
+	 */
+	priv->orig_nents =3D sgt->orig_nents;
+	sgt->orig_nents =3D 0;
+	return sgt;
+
+err_free_sgt:
+	sg_free_table(sgt);
+err_kfree_sgt:
+	kfree(sgt);
+	return ERR_PTR(ret);
+}
+
+static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment=
,
+				   struct sg_table *sgt,
+				   enum dma_data_direction dir)
+{
+	struct vfio_pci_dma_buf *priv =3D attachment->dmabuf->priv;
+
+	sgt->orig_nents =3D priv->orig_nents;
+	dma_unmap_resource(attachment->dev, sg_dma_address(sgt->sgl),
+			   priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct vfio_pci_dma_buf *priv =3D dmabuf->priv;
+
+	/*
+	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
+	 * The refcount prevents both.
+	 */
+	if (priv->vdev) {
+		down_write(&priv->vdev->memory_lock);
+		list_del_init(&priv->dmabufs_elm);
+		up_write(&priv->vdev->memory_lock);
+		vfio_device_put_registration(&priv->vdev->vdev);
+	}
+	kfree(priv);
+}
+
+static const struct dma_buf_ops vfio_pci_dmabuf_ops =3D {
+	.attach =3D vfio_pci_dma_buf_attach,
+	.map_dma_buf =3D vfio_pci_dma_buf_map,
+	.pin =3D vfio_pci_dma_buf_pin,
+	.unpin =3D vfio_pci_dma_buf_unpin,
+	.release =3D vfio_pci_dma_buf_release,
+	.unmap_dma_buf =3D vfio_pci_dma_buf_unmap,
+};
+
+int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32=
 flags,
+				  struct vfio_device_feature_dma_buf __user *arg,
+				  size_t argsz)
+{
+	struct vfio_device_feature_dma_buf get_dma_buf;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct vfio_pci_dma_buf *priv;
+	int ret;
+
+	ret =3D vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
+				 sizeof(get_dma_buf));
+	if (ret !=3D 1)
+		return ret;
+
+	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
+		return -EFAULT;
+
+	/* For PCI the region_index is the BAR number like everything else */
+	if (get_dma_buf.region_index >=3D VFIO_PCI_ROM_REGION_INDEX)
+		return -EINVAL;
+
+	exp_info.ops =3D &vfio_pci_dmabuf_ops;
+	exp_info.size =3D pci_resource_len(vdev->pdev, get_dma_buf.region_index=
);
+	if (!exp_info.size)
+		return -EINVAL;
+	if (get_dma_buf.offset || get_dma_buf.length) {
+		if (get_dma_buf.length > exp_info.size ||
+		    get_dma_buf.offset >=3D exp_info.size ||
+		    get_dma_buf.length > exp_info.size - get_dma_buf.offset ||
+		    get_dma_buf.offset % PAGE_SIZE ||
+		    get_dma_buf.length % PAGE_SIZE)
+			return -EINVAL;
+		exp_info.size =3D get_dma_buf.length;
+	}
+	exp_info.flags =3D get_dma_buf.open_flags;
+
+	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&priv->dmabufs_elm);
+	priv->offset =3D get_dma_buf.offset;
+	priv->index =3D get_dma_buf.region_index;
+
+	exp_info.priv =3D priv;
+	priv->dmabuf =3D dma_buf_export(&exp_info);
+	if (IS_ERR(priv->dmabuf)) {
+		ret =3D PTR_ERR(priv->dmabuf);
+		kfree(priv);
+		return ret;
+	}
+
+	/* dma_buf_put() now frees priv */
+
+	down_write(&vdev->memory_lock);
+	dma_resv_lock(priv->dmabuf->resv, NULL);
+	priv->revoked =3D !__vfio_pci_memory_enabled(vdev);
+	priv->vdev =3D vdev;
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
+void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revok=
ed)
+{
+	struct vfio_pci_dma_buf *priv;
+	struct vfio_pci_dma_buf *tmp;
+
+	lockdep_assert_held_write(&vdev->memory_lock);
+
+	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
+		if (!dma_buf_try_get(priv->dmabuf))
+			continue;
+		if (priv->revoked !=3D revoked) {
+			dma_resv_lock(priv->dmabuf->resv, NULL);
+			priv->revoked =3D revoked;
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
+		priv->vdev =3D NULL;
+		priv->revoked =3D true;
+		dma_buf_move_notify(priv->dmabuf);
+		dma_resv_unlock(priv->dmabuf->resv);
+		vfio_device_put_registration(&vdev->vdev);
+		dma_buf_put(priv->dmabuf);
+	}
+	up_write(&vdev->memory_lock);
+}
diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_p=
ci_config.c
index 97422aafaa7b..c605c5cb0078 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -585,10 +585,12 @@ static int vfio_basic_config_write(struct vfio_pci_=
core_device *vdev, int pos,
 		virt_mem =3D !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
 		new_mem =3D !!(new_cmd & PCI_COMMAND_MEMORY);

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
@@ -623,6 +625,8 @@ static int vfio_basic_config_write(struct vfio_pci_co=
re_device *vdev, int pos,
 		*virt_cmd &=3D cpu_to_le16(~mask);
 		*virt_cmd |=3D cpu_to_le16(new_cmd & mask);

+		if (__vfio_pci_memory_enabled(vdev))
+			vfio_pci_dma_buf_move(vdev, false);
 		up_write(&vdev->memory_lock);
 	}

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci=
_core.c
index ba0ce0075b2f..bb97b4d94eb7 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -700,6 +700,8 @@ void vfio_pci_core_close_device(struct vfio_device *c=
ore_vdev)
 #endif
 	vfio_pci_core_disable(vdev);

+	vfio_pci_dma_buf_cleanup(vdev);
+
 	mutex_lock(&vdev->igate);
 	if (vdev->err_trigger) {
 		eventfd_ctx_put(vdev->err_trigger);
@@ -1244,7 +1246,10 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_co=
re_device *vdev,
 	 */
 	vfio_pci_set_power_state(vdev, PCI_D0);

+	vfio_pci_dma_buf_move(vdev, true);
 	ret =3D pci_try_reset_function(vdev->pdev);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
 	up_write(&vdev->memory_lock);

 	return ret;
@@ -1490,11 +1495,10 @@ long vfio_pci_core_ioctl(struct vfio_device *core=
_vdev, unsigned int cmd,
 }
 EXPORT_SYMBOL_GPL(vfio_pci_core_ioctl);

-static int vfio_pci_core_feature_token(struct vfio_device *device, u32 f=
lags,
-				       uuid_t __user *arg, size_t argsz)
+static int vfio_pci_core_feature_token(struct vfio_pci_core_device *vdev=
,
+				       u32 flags, uuid_t __user *arg,
+				       size_t argsz)
 {
-	struct vfio_pci_core_device *vdev =3D
-		container_of(device, struct vfio_pci_core_device, vdev);
 	uuid_t uuid;
 	int ret;

@@ -1521,6 +1525,9 @@ static int vfio_pci_core_feature_token(struct vfio_=
device *device, u32 flags,
 int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 				void __user *arg, size_t argsz)
 {
+	struct vfio_pci_core_device *vdev =3D
+		container_of(device, struct vfio_pci_core_device, vdev);
+
 	switch (flags & VFIO_DEVICE_FEATURE_MASK) {
 	case VFIO_DEVICE_FEATURE_LOW_POWER_ENTRY:
 		return vfio_pci_core_pm_entry(device, flags, arg, argsz);
@@ -1530,7 +1537,9 @@ int vfio_pci_core_ioctl_feature(struct vfio_device =
*device, u32 flags,
 	case VFIO_DEVICE_FEATURE_LOW_POWER_EXIT:
 		return vfio_pci_core_pm_exit(device, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
-		return vfio_pci_core_feature_token(device, flags, arg, argsz);
+		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
+	case VFIO_DEVICE_FEATURE_DMA_BUF:
+		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
 	default:
 		return -ENOTTY;
 	}
@@ -2083,6 +2092,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core=
_vdev)
 	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
 	init_rwsem(&vdev->memory_lock);
 	xa_init(&vdev->ctx);
+	INIT_LIST_HEAD(&vdev->dmabufs);

 	return 0;
 }
@@ -2463,11 +2473,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio=
_device_set *dev_set,
 	 * cause the PCI config space reset without restoring the original
 	 * state (saved locally in 'vdev->pm_save').
 	 */
-	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
+	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list) {
+		vfio_pci_dma_buf_move(vdev, true);
 		vfio_pci_set_power_state(vdev, PCI_D0);
+	}

 	ret =3D pci_reset_bus(pdev);

+	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
+		if (__vfio_pci_memory_enabled(vdev))
+			vfio_pci_dma_buf_move(vdev, false);
+
 	vdev =3D list_last_entry(&dev_set->device_list,
 			       struct vfio_pci_core_device, vdev.dev_set_list);

diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci=
_priv.h
index 5e4fa69aee16..09d3c300918c 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -101,4 +101,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev *p=
dev)
 	return (pdev->class >> 8) =3D=3D PCI_CLASS_DISPLAY_VGA;
 }

+#ifdef CONFIG_DMA_SHARED_BUFFER
+int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32=
 flags,
+				  struct vfio_device_feature_dma_buf __user *arg,
+				  size_t argsz);
+void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
+void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revok=
ed);
+#else
+static int
+vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 fla=
gs,
+			      struct vfio_device_feature_dma_buf __user *arg,
+			      size_t argsz)
+{
+	return -ENOTTY;
+}
+static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device =
*vdev)
+{
+}
+static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vd=
ev,
+					 bool revoked)
+{
+}
+#endif
+
 #endif
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.=
h
index fbb472dd99b3..da5d8955ae56 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -94,6 +94,7 @@ struct vfio_pci_core_device {
 	struct vfio_pci_core_device	*sriov_pf_core_dev;
 	struct notifier_block	nb;
 	struct rw_semaphore	memory_lock;
+	struct list_head	dmabufs;
 };

 /* Will be exported for vfio pci drivers usage */
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 2b68e6cdf190..8812b4750cc5 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1458,6 +1458,24 @@ struct vfio_device_feature_bus_master {
 };
 #define VFIO_DEVICE_FEATURE_BUS_MASTER 10

+/**
+ * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
+ * region selected.
+ *
+ * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOE=
XEC,
+ * etc. offset/length specify a slice of the region to create the dmabuf=
 from.
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
+#define VFIO_DEVICE_FEATURE_DMA_BUF 11
+
 /* -------- API for Type1 VFIO IOMMU -------- */

 /**
--
2.43.5
