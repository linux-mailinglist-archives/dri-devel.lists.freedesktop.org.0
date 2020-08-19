Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446FC24959D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B916B6E1E9;
	Wed, 19 Aug 2020 06:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E443389DA2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 03:10:25 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id e4so465419pjd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 20:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZP9unBwBVeohrLKBc/Zq2xiQK26saplnL8sUr4+GwQ=;
 b=T4MDoNicdDxTxwvMqiBYSuFnlyHyL/rGsoYBRPxff/y+WNrt+kAsyITZXzaiuYafyW
 7epMMZ9F6XTdO+szTWu5cDC6S/p+FgGQHa0E1sDjITZmjuR7XtmDgAt82E6+EaenRZpk
 3xa7M3Ps8k0LvdI4mmCiiNLj/RMt4E5fjaba0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZP9unBwBVeohrLKBc/Zq2xiQK26saplnL8sUr4+GwQ=;
 b=gjS2MpF1iuLie78HKSIshe6/VG3Cu3kAEAIUzA2EcutCCi/1e0kfPhdMS9T3q6WGdS
 7tLdMx4dsZCPinfv2O3Tvs2Q6lw6Frt3A2faKmApHKwb2XhNYHohqk5D11YTUvbGIPba
 5UqCzVUfBAabIpbDanekGzv1mntYPe38xM7yzmVWmWmK54UNoGm8eE4+VL8zmJfX/f2O
 S9HB3YqHrI2ab3v8Se/EjSby/1F9masV9NVtFoDkTp9un7kTEZ+6IHQk4um1XZ8F+Abd
 IzPG0bUs4vLQ+WxdkzDImpu7BpTcKGOKzuIELcnrA7BbCJnNdmbf2yrIB8c9RuAeVXN6
 w4gg==
X-Gm-Message-State: AOAM532hh9YT14Fvf3pff0aqZ95l+h+4qp1GRWbN3G7YzptfMQRxhl4H
 lW9rrGYM6nDZcvtwj++s+Npeog==
X-Google-Smtp-Source: ABdhPJyjAXBFFL6n9n3vEcWkvMYKzJmGJpXBSas0AmhtUdmW6yI0mGfKSHHecZl5wgeQlNAUIJM8zQ==
X-Received: by 2002:a17:90a:f590:: with SMTP id
 ct16mr156505pjb.156.1597806625430; 
 Tue, 18 Aug 2020 20:10:25 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
 by smtp.gmail.com with ESMTPSA id b8sm26347695pfr.57.2020.08.18.20.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 20:10:25 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] virtio: fix build for configs without dma-bufs
Date: Wed, 19 Aug 2020 12:10:11 +0900
Message-Id: <20200819031011.310180-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: virtio-dev@lists.oasis-open.org, David Stevens <stevensd@chromium.org>,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/virtio/Kconfig  | 1 +
 drivers/virtio/Kconfig          | 7 +++++++
 drivers/virtio/Makefile         | 3 ++-
 drivers/virtio/virtio_dma_buf.c | 3 +++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index eff3047052d4..67624423013a 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -4,6 +4,7 @@ config DRM_VIRTIO_GPU
 	depends on DRM && VIRTIO && MMU
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
+	select VIRTIO_DMA_SHARED_BUFFER
 	help
 	   This is the virtual GPU driver for virtio.  It can be used with
 	   QEMU based VMMs (like KVM or Xen).
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 5c92e4a50882..e76e9b9ba93c 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -126,4 +126,11 @@ config VIRTIO_MMIO_CMDLINE_DEVICES
 
 	 If unsure, say 'N'.
 
+config VIRTIO_DMA_SHARED_BUFFER
+	tristate
+	depends on DMA_SHARED_BUFFER
+	help
+	 This option adds a flavor of dma buffers that are backed by
+	 virtio resources.
+
 endif # VIRTIO_MENU
diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 49da768ee7fd..591e6f72aa54 100644
--- a/drivers/virtio/Makefile
+++ b/drivers/virtio/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
+obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
 obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
 obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
 virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
@@ -8,3 +8,4 @@ obj-$(CONFIG_VIRTIO_BALLOON) += virtio_balloon.o
 obj-$(CONFIG_VIRTIO_INPUT) += virtio_input.o
 obj-$(CONFIG_VIRTIO_VDPA) += virtio_vdpa.o
 obj-$(CONFIG_VIRTIO_MEM) += virtio_mem.o
+obj-$(CONFIG_VIRTIO_DMA_SHARED_BUFFER) += virtio_dma_buf.o
diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
index 45d6e8647dcf..5127a2f0c986 100644
--- a/drivers/virtio/virtio_dma_buf.c
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2020 Google, Inc.
  */
 
+#include <linux/module.h>
 #include <linux/virtio_dma_buf.h>
 
 /**
@@ -83,3 +84,5 @@ int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
 	return ops->get_uuid(dma_buf, uuid);
 }
 EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
+
+MODULE_LICENSE("GPL");
-- 
2.28.0.220.ged08abb693-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
