Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOhwFexOoGmIiAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:47:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2771A6EB0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C767310E93D;
	Thu, 26 Feb 2026 13:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3557010E936
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:47:04 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 87E2A1A2550;
 Thu, 26 Feb 2026 14:41:03 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 773541A2559;
 Thu, 26 Feb 2026 14:41:03 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com
 [10.162.246.145])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id BFD5D2035B;
 Thu, 26 Feb 2026 14:41:01 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Thu, 26 Feb 2026 15:40:44 +0200
Subject: [PATCH 5/9] accel/neutron: Add GEM buffer object support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-neutron-v1-5-46eccb3bb50a@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
In-Reply-To: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=9299;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=Gm6zpMS/O0KecyGAyBqqHMpvs6vSpEpvKk7wEge/k7Y=;
 b=rUusO9TFRzN9pG9c1CNh8YOm96d5xwQDBjY3QjlGRPNoyHfgHzGrwd9XEGxDb9qUVcXIHrSlD
 zLpx9QNarv3BhIyUaIf8saTHCCehxewAtIdbGnuH+2Qoty1DHwdnIA/
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:ruxandra.radulescu@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: EC2771A6EB0
X-Rspamd-Action: no action

Add the following IOCTLs:
- CREATE_BO - for creating a new buffer object and passing BO info
back to user
- SYNC_BO - for explicit DMA sync operations on the BO memory, since
Neutron isn't guaranteed to be cache coherent. User controls which
portions of the buffer memory to sync and the direction.

The Neutron device requires contiguous DMA buffers, so use the GEM DMA
helpers for creating and managing the BOs. Depending on the platform
it is integrated on, Neutron device may or may not be cache coherent. On
i.MX95, the first platform for which we add Neutron support, it is not.

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 drivers/accel/neutron/Makefile         |   3 +-
 drivers/accel/neutron/neutron_driver.c |  13 +++-
 drivers/accel/neutron/neutron_gem.c    | 115 +++++++++++++++++++++++++++++++++
 drivers/accel/neutron/neutron_gem.h    |  14 ++++
 include/uapi/drm/neutron_accel.h       |  79 ++++++++++++++++++++++
 5 files changed, 222 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/neutron/Makefile b/drivers/accel/neutron/Makefile
index 7592e318dd83..d4298c7a8535 100644
--- a/drivers/accel/neutron/Makefile
+++ b/drivers/accel/neutron/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_DRM_ACCEL_NXP_NEUTRON) := neutron.o
 
 neutron-y := \
 	neutron_driver.o \
-	neutron_device.o
+	neutron_device.o \
+	neutron_gem.o
diff --git a/drivers/accel/neutron/neutron_driver.c b/drivers/accel/neutron/neutron_driver.c
index 7f34785216cf..c9a18bf52037 100644
--- a/drivers/accel/neutron/neutron_driver.c
+++ b/drivers/accel/neutron/neutron_driver.c
@@ -14,12 +14,19 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_gem.h>
+#include <drm/neutron_accel.h>
 
 #include "neutron_device.h"
 #include "neutron_driver.h"
+#include "neutron_gem.h"
 
 #define NEUTRON_SUSPEND_DELAY_MS 1000
 
+static const struct drm_ioctl_desc neutron_drm_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(NEUTRON_CREATE_BO, neutron_ioctl_create_bo, 0),
+	DRM_IOCTL_DEF_DRV(NEUTRON_SYNC_BO, neutron_ioctl_sync_bo, 0),
+};
+
 static int neutron_open(struct drm_device *drm, struct drm_file *file)
 {
 	struct neutron_device *ndev = to_neutron_device(drm);
@@ -45,7 +52,7 @@ static void neutron_postclose(struct drm_device *drm, struct drm_file *file)
 DEFINE_DRM_ACCEL_FOPS(neutron_drm_driver_fops);
 
 static const struct drm_driver neutron_drm_driver = {
-	.driver_features	= DRIVER_COMPUTE_ACCEL,
+	.driver_features	= DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
 	.name			= "neutron",
 	.desc			= "NXP Neutron driver",
 	.major			= 1,
@@ -54,6 +61,10 @@ static const struct drm_driver neutron_drm_driver = {
 	.fops			= &neutron_drm_driver_fops,
 	.open			= neutron_open,
 	.postclose		= neutron_postclose,
+	.ioctls			= neutron_drm_ioctls,
+	.num_ioctls		= ARRAY_SIZE(neutron_drm_ioctls),
+
+	.gem_create_object      = neutron_gem_create_object,
 };
 
 static irqreturn_t neutron_irq_handler_thread(int irq, void *data)
diff --git a/drivers/accel/neutron/neutron_gem.c b/drivers/accel/neutron/neutron_gem.c
new file mode 100644
index 000000000000..9b5460d9bcc6
--- /dev/null
+++ b/drivers/accel/neutron/neutron_gem.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025-2026 NXP */
+
+#include <linux/sizes.h>
+#include <linux/align.h>
+#include <linux/dma-map-ops.h>
+#include <drm/drm_device.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
+#include <drm/neutron_accel.h>
+
+#include "neutron_device.h"
+#include "neutron_gem.h"
+
+#define NEUTRON_BO_ALIGN SZ_1M
+
+struct drm_gem_object *neutron_gem_create_object(struct drm_device *drm, size_t size)
+{
+	struct neutron_device *ndev = to_neutron_device(drm);
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_gem_object *gem_obj;
+
+	dma_obj = kzalloc_obj(*dma_obj);
+	if (!dma_obj)
+		return ERR_PTR(-ENOMEM);
+
+	dma_obj->map_noncoherent = !dev_is_dma_coherent(ndev->dev);
+	dma_obj->map_bidirectional = true;
+	gem_obj = &dma_obj->base;
+
+	return gem_obj;
+}
+
+int neutron_ioctl_create_bo(struct drm_device *drm, void *data, struct drm_file *filp)
+{
+	struct drm_neutron_create_bo *args = data;
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_gem_object *gem_obj;
+	size_t size;
+	int ret;
+
+	if (!args->size || args->pad)
+		return -EINVAL;
+
+	size = ALIGN(args->size, NEUTRON_BO_ALIGN);
+
+	dma_obj = drm_gem_dma_create(drm, size);
+	if (IS_ERR(dma_obj))
+		return PTR_ERR(dma_obj);
+
+	/* We expect correctly aligned buffers, but double-check */
+	if (drm_WARN_ON(drm, !IS_ALIGNED(dma_obj->dma_addr, NEUTRON_BO_ALIGN))) {
+		ret = -EFAULT;
+		goto out_put;
+	}
+
+	gem_obj = &dma_obj->base;
+	ret = drm_gem_handle_create(filp, gem_obj, &args->handle);
+	if (ret)
+		goto out_put;
+
+	args->map_offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+	args->size = gem_obj->size;
+
+out_put:
+	/* No need to keep a reference of the GEM object. Freeing is handled by user */
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int neutron_ioctl_sync_bo(struct drm_device *drm, void *data, struct drm_file *filp)
+{
+	struct drm_neutron_sync_bo *args = data;
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_gem_object *gem_obj;
+	dma_addr_t start_addr;
+	int ret = 0;
+
+	gem_obj = drm_gem_object_lookup(filp, args->handle);
+	if (!gem_obj) {
+		dev_dbg(drm->dev, "Invalid BO handle %u\n", args->handle);
+		return -ENOENT;
+	}
+
+	dma_obj = to_drm_gem_dma_obj(gem_obj);
+
+	if (!args->size || args->offset >= gem_obj->size ||
+	    args->size > gem_obj->size - args->offset) {
+		dev_dbg(drm->dev, "Invalid offset/size for BO sync\n");
+		ret = -EINVAL;
+		goto out_put;
+	}
+
+	start_addr = dma_obj->dma_addr + args->offset;
+
+	switch (args->direction) {
+	case DRM_NEUTRON_SYNC_TO_DEVICE:
+		dma_sync_single_for_device(drm->dev, start_addr, args->size,
+					   DMA_BIDIRECTIONAL);
+		break;
+	case DRM_NEUTRON_SYNC_FROM_DEVICE:
+		dma_sync_single_for_cpu(drm->dev, start_addr, args->size,
+					DMA_BIDIRECTIONAL);
+		break;
+	default:
+		dev_dbg(drm->dev, "Invalid direction for BO sync\n");
+		ret = -EINVAL;
+	}
+
+out_put:
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
diff --git a/drivers/accel/neutron/neutron_gem.h b/drivers/accel/neutron/neutron_gem.h
new file mode 100644
index 000000000000..95ba2fe96617
--- /dev/null
+++ b/drivers/accel/neutron/neutron_gem.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright 2025-2026 NXP */
+
+#ifndef __NEUTRON_GEM_H__
+#define __NEUTRON_GEM_H__
+
+#include <drm/drm_gem.h>
+
+struct drm_gem_object *neutron_gem_create_object(struct drm_device *drm, size_t size);
+
+int neutron_ioctl_create_bo(struct drm_device *drm, void *data, struct drm_file *filp);
+int neutron_ioctl_sync_bo(struct drm_device *drm, void *data, struct drm_file *filp);
+
+#endif /* __NEUTRON_GEM_H__ */
diff --git a/include/uapi/drm/neutron_accel.h b/include/uapi/drm/neutron_accel.h
new file mode 100644
index 000000000000..2f5639f2e0e8
--- /dev/null
+++ b/include/uapi/drm/neutron_accel.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/* Copyright 2025-2026 NXP */
+
+#ifndef __NEUTRON_ACCEL_H__
+#define __NEUTRON_ACCEL_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/**
+ * enum drm_neutron_ioctl - Neutron IOCTL IDs
+ *
+ * @DRM_NEUTRON_CREATE_BO: Create a buffer object
+ * @DRM_NEUTRON_SYNC_BO: Sync (parts of) the buffer object memory
+ */
+enum drm_neutron_ioctl {
+	DRM_NEUTRON_CREATE_BO = 0,
+	DRM_NEUTRON_SYNC_BO,
+};
+
+/**
+ * struct drm_neutron_create_bo - Create a buffer object and return buffer
+ *                                info to user
+ *
+ * @size: Size in bytes of requested buffer. May be updated by driver
+ *        if allocated size different than requested
+ * @handle: Returned handle for the new buffer object
+ * @pad: MBZ
+ * @map_offset: Returned offset for mmap() calls
+ */
+struct drm_neutron_create_bo {
+	__u64 size;
+	__u32 handle;
+	__u32 pad;
+	__u64 map_offset;
+};
+
+/**
+ * enum drm_neutron_sync_dir - Direction of buffer object synchronization
+ *
+ * @DRM_NEUTRON_SYNC_TO_DEVICE: Sync from CPU to device
+ * @DRM_NEUTRON_SYNC_FROM_DEVICE: Sync from device to CPU
+ */
+enum drm_neutron_sync_dir {
+	DRM_NEUTRON_SYNC_TO_DEVICE = 0,
+	DRM_NEUTRON_SYNC_FROM_DEVICE,
+};
+
+/**
+ * struct drm_neutron_sync_bo - Sync buffer object memory
+ *
+ * @handle: Handle of buffer object to sync
+ * @direction: Direction of sync, can be one of enum drm_neutron_sync_dir
+ * @size: Size of the memory to sync, in bytes
+ * @offset: Offset inside the buffer, in bytes
+ */
+struct drm_neutron_sync_bo {
+	__u32 handle;
+	__u32 direction;
+	__u64 size;
+	__u64 offset;
+};
+
+#define DRM_IOCTL_NEUTRON_CREATE_BO \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_CREATE_BO, \
+		 struct drm_neutron_create_bo)
+
+#define DRM_IOCTL_NEUTRON_SYNC_BO \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_SYNC_BO, \
+		 struct drm_neutron_sync_bo)
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __NEUTRON_ACCEL_H__ */

-- 
2.34.1

