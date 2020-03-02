Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09C1177110
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4007F6E9EE;
	Tue,  3 Mar 2020 08:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC456E271
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 12:15:44 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id l7so5493151pff.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 04:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCeo2KlvghZWVQTpBB2M3t/GqxIcmv4hUXrDyywqjuA=;
 b=KtxIhZ5KSuM307kYGYUjWPph23TtSi3zkl41oYk+e1N7AfE29LJ3C6CKjZkYNgKjpw
 4L7yKKgpbAX7P0xTk/2dEvii1zi6OjS959+FmubaRaysgfdGmCfNOp6qbVyZpA/iBBmT
 psh7VxYuvg7KhzEYy0kpZHTDWLa1eXUASldIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCeo2KlvghZWVQTpBB2M3t/GqxIcmv4hUXrDyywqjuA=;
 b=O7EcUBEoqOYjR0RDSy8XMekaWPK+nBxJ2RmQCPkMgFcVyfsUClb2COnh/7qMTb/Cda
 Hal2LNbx9D6jLM/SzVJDYiCKbn+PWXfU8CjbFCYiF4FKhQYcFcWqoxMGvOLdBVlBeZyH
 tM52be/4+EjA3yiX/iNWEpUkfEb1aKAmDugrffPDKhDYLO5vuG8kINZOg/750oqqZG14
 U+USTk4lIuhj0MjxPLOQmUtTRaENZ8Mr0kK4NkrGv5P69hZLPqCCn2Ri0g8Tq2k2Cua5
 iq+LfW4RwiW+LFEOO+EpSAkA7E9zRxcxzmX3YRS74y8ytQnNesUZqVKM4DW0PJet+B5d
 3ymg==
X-Gm-Message-State: APjAAAWHpxBy4tPIYKYTh6218+0rnThb+hWEutEPr+R3WCeCLUw4SEDc
 Iwo2EBMSTRaPeI7GFR96pNJF2w==
X-Google-Smtp-Source: APXvYqxIIxTmqhb5EzFiF3tO0HTYSibpGKOCSX4H52SA6OGSHfrVeCkQaE0nBxoudGWjDs99vgRxuQ==
X-Received: by 2002:a63:fc62:: with SMTP id r34mr19239431pgk.437.1583151344152; 
 Mon, 02 Mar 2020 04:15:44 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id w26sm21819818pfj.119.2020.03.02.04.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 04:15:43 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 2/4] drm/prime: add support for virtio exported objects
Date: Mon,  2 Mar 2020 21:15:22 +0900
Message-Id: <20200302121524.7543-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302121524.7543-1-stevensd@chromium.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
 drivers/gpu/drm/drm_prime.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_drv.h       | 15 +++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 86d9b0e45c8c..fc6e932a4fa6 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -779,6 +779,30 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 
+#ifdef CONFIG_VIRTIO
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
+#endif
+
 static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.cache_sgt_mapping = true,
 	.attach = drm_gem_map_attach,
@@ -789,6 +813,9 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
+#ifdef CONFIG_VIRTIO
+	.get_uuid = drm_gem_dmabuf_get_uuid,
+#endif
 };
 
 /**
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 77685ed7aa65..3cbe9aa6b44a 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -32,6 +32,10 @@
 
 #include <drm/drm_device.h>
 
+#ifdef CONFIG_VIRTIO
+#include <linux/uuid.h>
+#endif
+
 struct drm_file;
 struct drm_gem_object;
 struct drm_master;
@@ -639,6 +643,17 @@ struct drm_driver {
 	int (*gem_prime_mmap)(struct drm_gem_object *obj,
 				struct vm_area_struct *vma);
 
+#ifdef CONFIG_VIRTIO
+	/**
+	 * @gem_prime_get_uuid
+	 *
+	 * get_uuid hook for GEM drivers. Retrieves the virtio uuid of the
+	 * given GEM buffer.
+	 */
+	int (*gem_prime_get_uuid)(struct drm_gem_object *obj,
+				  uuid_t *uuid);
+#endif
+
 	/**
 	 * @dumb_create:
 	 *
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
