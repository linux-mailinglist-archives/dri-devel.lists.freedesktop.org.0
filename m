Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC5247FE3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5BF89CBA;
	Tue, 18 Aug 2020 07:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8749E89B84
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:13:56 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f5so8782709plr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 00:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5MYXjVP95LN5hlNIE/pQ1OZM/AE4CZm8fKDojaa4DCU=;
 b=Wea53WvQ/Xmk90IJutfEYenWAtKjdGoiPL3XDCaqijJ1mGlUUbtjQgUOg+Vlz82q99
 GvspdgXCMc5SO8bF5RgbuR1hTnn3M7pi6Y/DLGG4koAAt8zeu5xFKMCcOVRAfdIs2COh
 a+CMZQBg4CXaBaofEdTDl3CCIWoDv/Ri8nXWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5MYXjVP95LN5hlNIE/pQ1OZM/AE4CZm8fKDojaa4DCU=;
 b=gchkpa8DETKS+1QleR7+vP/YCIHerxGrGN+5P166RbdqXGepvkmd7hBB8jI1R0yvtT
 cGbEYjKXIOkUGmoxSXLwUeIFE0vXILOS6s7dEao2xX3w3FhASnula01Ys9vWSE+jOnwi
 HClO0hC6d8JlMn3xL/YeI2aNjR0wtpknKaKZfGgA8Z4HJY9XfyBQ2SyjXj1QldyVoirS
 3toF22rCkCkJL/mHTXvO/g1IvKP+Wh8lYU6jXlyhhI4ZU4GoE3JQIs3/v3pqRr6xqLZ0
 QDbRSp+gGrkvEO5WL3IYT+JRqeBnHAMJEK0pd/Mdregv9n8YCtI54IvQicMH9jwfDoat
 PaQQ==
X-Gm-Message-State: AOAM530WRkAJKqjXckJm5ghWXpcKsnhqnc6DEWtrL/B3NFeZtabaOSUF
 bFdaOmtGsTQiYaTeSp/i1rmDkw==
X-Google-Smtp-Source: ABdhPJyEAfdhg2W2J3ktxF3D8mK8FCl6Sytw4kWwxUkP1H0MkEAfjfgXA+UTGberm2E7fWECQYIt+Q==
X-Received: by 2002:a17:90a:630c:: with SMTP id
 e12mr15099304pjj.17.1597734836088; 
 Tue, 18 Aug 2020 00:13:56 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
 by smtp.gmail.com with ESMTPSA id b22sm23209690pfb.213.2020.08.18.00.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 00:13:55 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v7 1/3] virtio: add dma-buf support for exported objects
Date: Tue, 18 Aug 2020 16:13:41 +0900
Message-Id: <20200818071343.3461203-2-stevensd@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
In-Reply-To: <20200818071343.3461203-1-stevensd@chromium.org>
References: <20200818071343.3461203-1-stevensd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 David Stevens <stevensd@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change adds a new flavor of dma-bufs that can be used by virtio
drivers to share exported objects. A virtio dma-buf can be queried by
virtio drivers to obtain the UUID which identifies the underlying
exported object.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/virtio/Makefile         |  2 +-
 drivers/virtio/virtio.c         |  6 +++
 drivers/virtio/virtio_dma_buf.c | 85 +++++++++++++++++++++++++++++++++
 include/linux/virtio.h          |  1 +
 include/linux/virtio_dma_buf.h  | 37 ++++++++++++++
 5 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 29a1386ecc03..ecdae5b596de 100644
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
index 000000000000..45d6e8647dcf
--- /dev/null
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -0,0 +1,85 @@
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
+struct dma_buf *virtio_dma_buf_export
+	(const struct dma_buf_export_info *exp_info)
+{
+	const struct virtio_dma_buf_ops *virtio_ops =
+		container_of(exp_info->ops,
+			     const struct virtio_dma_buf_ops, ops);
+
+	if (!exp_info->ops ||
+	    exp_info->ops->attach != &virtio_dma_buf_attach ||
+	    !virtio_ops->get_uuid) {
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
+	const struct virtio_dma_buf_ops *ops =
+		container_of(dma_buf->ops,
+			     const struct virtio_dma_buf_ops, ops);
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
+ * virtio_dma_buf_get_uuid - gets a virtio dma-buf's exported object's uuid
+ * @dma_buf: [in] buffer to query
+ * @uuid: [out] the uuid
+ *
+ * Returns: 0 on success, negative on failure.
+ */
+int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
+			    uuid_t *uuid)
+{
+	const struct virtio_dma_buf_ops *ops =
+		container_of(dma_buf->ops,
+			     const struct virtio_dma_buf_ops, ops);
+
+	if (!is_virtio_dma_buf(dma_buf))
+		return -EINVAL;
+
+	return ops->get_uuid(dma_buf, uuid);
+}
+EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 15f906e4a748..9397e25616c4 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -128,6 +128,7 @@ static inline struct virtio_device *dev_to_virtio(struct device *_dev)
 void virtio_add_status(struct virtio_device *dev, unsigned int status);
 int register_virtio_device(struct virtio_device *dev);
 void unregister_virtio_device(struct virtio_device *dev);
+bool is_virtio_device(struct device *dev);
 
 void virtio_break_device(struct virtio_device *dev);
 
diff --git a/include/linux/virtio_dma_buf.h b/include/linux/virtio_dma_buf.h
new file mode 100644
index 000000000000..a2fdf217ac62
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
+struct dma_buf *virtio_dma_buf_export
+	(const struct dma_buf_export_info *exp_info);
+bool is_virtio_dma_buf(struct dma_buf *dma_buf);
+int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf, uuid_t *uuid);
+
+#endif /* _LINUX_VIRTIO_DMA_BUF_H */
-- 
2.28.0.220.ged08abb693-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
