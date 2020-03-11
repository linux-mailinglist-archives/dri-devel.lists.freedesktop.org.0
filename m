Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D07182AC4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9A16EA8B;
	Thu, 12 Mar 2020 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B265B6E975
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:20:28 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t3so948944plz.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbNivqIBs4pO6i4JqhZUJefImajxMHo9WsbKwRa5KuU=;
 b=BLZlM4VsvKYHd4VLsroG9x3pc9BkKgFIdNxhZjBjjm/+j1sEDSnWY3afVjyUu7R6PM
 bisd04NTMJZyGDEK6+/B/pplIvIEPM5REXLbhgmATI7bvqLjrR1V4s3Oo7De/j21DCt2
 p3alVM4+Krbfjf5UHngcmpJiWwKY/s217aLkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbNivqIBs4pO6i4JqhZUJefImajxMHo9WsbKwRa5KuU=;
 b=nWI8XHEcsdpl4WDogplG4CqZU6Z3eAYrll4KKvd40AT2PsBF8GdjVDnLxVY2C2dTfo
 hAQrVCQkme+OA8r1fF6J2BGp+MxFzEeX/FwXtR97OOd4VdqrGnHUrqDdLu9zKQUUhZDl
 1pXU8Z8JTWG6Km0U+Mc5YpVBSxW4+7MaAI8ZjK03KWMs+qXFtiw4T1b5U9x+A9J3fNkC
 0q/qiFs/mza4yYdUO6zFBBqKWOKyZft57WBW1s44zfp8ahpxjjNXCbjPtMq5u4l9W2BD
 cxH/vmetzdNA/inm9IRIcq0huDT3EQPBU6pFMzEhBuIvtu4BYqZja3fapHbvA3XCAVqM
 HeXg==
X-Gm-Message-State: ANhLgQ1Wl4CwrLfU7QdDAVjX3MtexkN5UohwqjQ+yb1JIM4IbWzYDfMg
 hBKiV9J4TxkNxDr7BUuSoIHs3g==
X-Google-Smtp-Source: ADFU+vtvpxb5f2yDL72gUW/DV61OyipUNCKf7TWHyZgzhYWvjtGBXk+7g0gih+9tvtIh3gj1Ol64hA==
X-Received: by 2002:a17:902:aa44:: with SMTP id
 c4mr2543611plr.73.1583925628333; 
 Wed, 11 Mar 2020 04:20:28 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id i72sm23110641pgd.88.2020.03.11.04.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 04:20:27 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v3 2/4] drm/prime: add support for virtio exported objects
Date: Wed, 11 Mar 2020 20:20:02 +0900
Message-Id: <20200311112004.47138-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311112004.47138-1-stevensd@chromium.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, David Stevens <stevensd@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change exposes dma-buf's get_uuid callback to PRIME drivers.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 23 +++++++++++++++++++++++
 include/drm/drm_drv.h       | 10 ++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 86d9b0e45c8c..50fed8497d3c 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -779,6 +779,28 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 
+/**
+ * drm_gem_dmabuf_get_uuid - dma_buf get_uuid implementation for GEM
+ * @dma_buf: buffer to query
+ * @uuid: uuid outparam
+ *
+ * Queries the buffer's virtio UUID. This can be used as the
+ * &dma_buf_ops.get_uuid callback. Calls into &drm_driver.gem_prime_get_uuid.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_gem_dmabuf_get_uuid(struct dma_buf *dma_buf, uuid_t *uuid)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct drm_device *dev = obj->dev;
+
+	if (!dev->driver->gem_prime_get_uuid)
+		return -ENODEV;
+
+	return dev->driver->gem_prime_get_uuid(obj, uuid);
+}
+EXPORT_SYMBOL(drm_gem_dmabuf_get_uuid);
+
 static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.cache_sgt_mapping = true,
 	.attach = drm_gem_map_attach,
@@ -789,6 +811,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
+	.get_uuid = drm_gem_dmabuf_get_uuid,
 };
 
 /**
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 77685ed7aa65..61e3ff341844 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -29,6 +29,7 @@
 
 #include <linux/list.h>
 #include <linux/irqreturn.h>
+#include <linux/uuid.h>
 
 #include <drm/drm_device.h>
 
@@ -639,6 +640,15 @@ struct drm_driver {
 	int (*gem_prime_mmap)(struct drm_gem_object *obj,
 				struct vm_area_struct *vma);
 
+	/**
+	 * @gem_prime_get_uuid
+	 *
+	 * get_uuid hook for GEM drivers. Retrieves the virtio uuid of the
+	 * given GEM buffer.
+	 */
+	int (*gem_prime_get_uuid)(struct drm_gem_object *obj,
+				  uuid_t *uuid);
+
 	/**
 	 * @dumb_create:
 	 *
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
