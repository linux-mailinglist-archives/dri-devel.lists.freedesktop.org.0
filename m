Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A318244313
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FE86E2CF;
	Fri, 14 Aug 2020 02:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA966E2CD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:05 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id f9so3693282pju.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Xh5sA3yJ0C+6PJ4xPUNRCYkt0FF3IplxawT8Hae5Y0=;
 b=Tl7734wiSORNd/kBa86lYjLvy7caS5fh8/9gb+kRBtUR4lp6/HxRutd77vhj8mdncG
 1T9s0BPQqQXAr1OwAlwrFsmzH8V3CVkeO87jkOkPNllS7p5Uxpw8jTmoLvFLdZR0IeLZ
 PD4R1QDlNXYrgaHVlHSy/4ApK+1obUDlQ9WXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Xh5sA3yJ0C+6PJ4xPUNRCYkt0FF3IplxawT8Hae5Y0=;
 b=gU20sr8O+bH87nq17zcRs1qbQlb9LBL95KWOLUsCMGPpA4qI82eJrtC6u8+7iG6kB1
 ZQ135qzhOEQBS9in2JltnXogfGpGYunh8snIS5Q4eEbsnMwTlydbF7aUZo2EMUKtymBv
 /6SkdxsyZReglPwiu1sNpVRPBfyoH9M62y3VZ5s/x6O/9UnsDN4cRP3PXdiG2GOm+KBy
 2fT1w2G3rOVYqjoxPiheS8w0ko/v3S1J2vHlmP3U3eYt2XSoWb3mX05Z48eIc22HPTsS
 lyCNoHfzWa4Jaxg/G6kG4MzLXChFQG5hy5kYKUGiWxC4APEHj0FZu9vdqorT9MlsBqNY
 M1Ew==
X-Gm-Message-State: AOAM533WVnFWVJRSwQFc0uw/d8K6LuRoR/q6pNWZNThbn3nGxPzmteIz
 h1LJrV7GRiJKWEJ6raUeGowyyXPik9Lv0Q==
X-Google-Smtp-Source: ABdhPJyBljWHIA/e2d/LXLm861GNjwOrLPPa3RKJSdXUV0rqmv67Q9k2UimzDVmChdkmo2jMMoHHFQ==
X-Received: by 2002:a17:902:9b96:: with SMTP id
 y22mr555925plp.86.1597372805184; 
 Thu, 13 Aug 2020 19:40:05 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:04 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 02/24] virtio: add dma-buf support for exported objects
Date: Thu, 13 Aug 2020 19:39:38 -0700
Message-Id: <20200814024000.2485-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Stevens <stevensd@chromium.org>

This change adds a new flavor of dma-bufs that can be used by virtio
drivers to share exported objects. A virtio dma-buf can be queried by
virtio drivers to obtain the UUID which identifies the underlying
exported object.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/virtio/Makefile         |  2 +-
 drivers/virtio/virtio.c         |  6 +++
 drivers/virtio/virtio_dma_buf.c | 82 +++++++++++++++++++++++++++++++++
 include/linux/virtio.h          |  1 +
 include/linux/virtio_dma_buf.h  | 37 +++++++++++++++
 5 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 4d993791f2d7..49da768ee7fd 100644
--- a/drivers/virtio/Makefile
+++ b/drivers/virtio/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
+obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
 obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
 obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
 virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index a977e32a88f2..5d46f0ded92d 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
 }
 EXPORT_SYMBOL_GPL(register_virtio_device);
 
+bool is_virtio_device(struct device *dev)
+{
+	return dev->bus == &virtio_bus;
+}
+EXPORT_SYMBOL_GPL(is_virtio_device);
+
 void unregister_virtio_device(struct virtio_device *dev)
 {
 	int index = dev->index; /* save for after device release */
diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
new file mode 100644
index 000000000000..fa0d3a668f53
--- /dev/null
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * dma-bufs for virtio exported objects
+ *
+ * Copyright (C) 2020 Google, Inc.
+ */
+
+#include <linux/virtio_dma_buf.h>
+
+/**
+ * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
+ * @exp_info: [in] see dma_buf_export(). ops MUST refer to a dma_buf_ops
+ *	struct embedded in a virtio_dma_buf_ops.
+ *
+ * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
+ * for an virtio exported object that can be queried by other virtio drivers
+ * for the object's UUID.
+ */
+struct dma_buf *virtio_dma_buf_export(
+		const struct dma_buf_export_info *exp_info)
+{
+	const struct virtio_dma_buf_ops *virtio_ops = container_of(
+			exp_info->ops, const struct virtio_dma_buf_ops, ops);
+
+	if (!exp_info->ops
+		|| exp_info->ops->attach != &virtio_dma_buf_attach
+		|| !virtio_ops->get_uuid) {
+		return ERR_PTR(-EINVAL);
+	}
+
+	return dma_buf_export(exp_info);
+}
+EXPORT_SYMBOL(virtio_dma_buf_export);
+
+/**
+ * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
+ */
+int virtio_dma_buf_attach(struct dma_buf *dma_buf,
+			  struct dma_buf_attachment *attach)
+{
+	int ret;
+	const struct virtio_dma_buf_ops *ops = container_of(
+			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
+
+	if (ops->device_attach) {
+		ret = ops->device_attach(dma_buf, attach);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(virtio_dma_buf_attach);
+
+/**
+ * is_virtio_dma_buf - returns true if the given dma-buf is a virtio dma-buf
+ * @dma_buf: buffer to query
+ */
+bool is_virtio_dma_buf(struct dma_buf *dma_buf)
+{
+	return dma_buf->ops->attach == &virtio_dma_buf_attach;
+}
+EXPORT_SYMBOL(is_virtio_dma_buf);
+
+/**
+ * virtio_dma_buf_get_uuid - gets the uuid of the virtio dma-buf's exported object
+ * @dma_buf: [in] buffer to query
+ * @uuid: [out] the uuid
+ *
+ * Returns: 0 on success, negative on failure.
+ */
+int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
+			    uuid_t *uuid)
+{
+	const struct virtio_dma_buf_ops *ops = container_of(
+			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
+
+	if (!is_virtio_dma_buf(dma_buf))
+		return -EINVAL;
+
+	return ops->get_uuid(dma_buf, uuid);
+}
+EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index a493eac08393..55ea329fe72a 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -127,6 +127,7 @@ static inline struct virtio_device *dev_to_virtio(struct device *_dev)
 void virtio_add_status(struct virtio_device *dev, unsigned int status);
 int register_virtio_device(struct virtio_device *dev);
 void unregister_virtio_device(struct virtio_device *dev);
+bool is_virtio_device(struct device *dev);
 
 void virtio_break_device(struct virtio_device *dev);
 
diff --git a/include/linux/virtio_dma_buf.h b/include/linux/virtio_dma_buf.h
new file mode 100644
index 000000000000..394bf04362d7
--- /dev/null
+++ b/include/linux/virtio_dma_buf.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * dma-bufs for virtio exported objects
+ *
+ * Copyright (C) 2020 Google, Inc.
+ */
+
+#ifndef _LINUX_VIRTIO_DMA_BUF_H
+#define _LINUX_VIRTIO_DMA_BUF_H
+
+#include <linux/dma-buf.h>
+#include <linux/uuid.h>
+#include <linux/virtio.h>
+
+/**
+ * struct virtio_dma_buf_ops - operations possible on exported object dma-buf
+ * @ops: the base dma_buf_ops. ops.attach MUST be virtio_dma_buf_attach.
+ * @device_attach: [optional] callback invoked by virtio_dma_buf_attach during
+ *		   all attach operations.
+ * @get_uid: [required] callback to get the uuid of the exported object.
+ */
+struct virtio_dma_buf_ops {
+	struct dma_buf_ops ops;
+	int (*device_attach)(struct dma_buf *dma_buf,
+			     struct dma_buf_attachment *attach);
+	int (*get_uuid)(struct dma_buf *dma_buf, uuid_t *uuid);
+};
+
+int virtio_dma_buf_attach(struct dma_buf *dma_buf,
+			  struct dma_buf_attachment *attach);
+
+struct dma_buf *virtio_dma_buf_export(
+		const struct dma_buf_export_info *exp_info);
+bool is_virtio_dma_buf(struct dma_buf *dma_buf);
+int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf, uuid_t *uuid);
+
+#endif /* _LINUX_VIRTIO_DMA_BUF_H */
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
