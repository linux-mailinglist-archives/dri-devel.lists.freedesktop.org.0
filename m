Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111EB177124
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D5B6EA14;
	Tue,  3 Mar 2020 08:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919C66E26F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 12:15:39 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y5so5478291pfb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 04:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDVKWN8XWWDBkIxhOMDWJ8WNqkbJxq41FKX/p0TJDsQ=;
 b=RbeH33OKo6ex4yBiWGoHZuPQZDFiMdnr74+jO7xV8RBZ/HBqXUwdgRgeWFajr7tksx
 nkaHJorAAEdADlX0fiP8/9c5+GvwCWUWeQ4VEYBE6+cMhEG6KMgTVJkGriOPtN/faamn
 kQPWVhol1Rc4kvzN1WSkWTuwQMD/+N+ZL/elI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDVKWN8XWWDBkIxhOMDWJ8WNqkbJxq41FKX/p0TJDsQ=;
 b=VsN74SH4laKo0FjS6Nk5aWDOt+6V6RIHu+2I9YOICfoGEL50FtuARMkP0qBeYk5sdR
 5ymjgOcH7ygCi/wDDY0KC9tqXHq9rbxC9g8dXo7P2gU+eDjkrDcAu5zfBYbIV7O/Hq/v
 HvJXsahyGZNE1bhWTAgL8T2pXJG8XrzMbdZLlde6NRTCUKIwmWl73HnN3S5kdrrWKY8+
 eG9DGLe52bpexE4aewuaVNGiN/YTURkDFD/h1xqWHB+iV6r3XdZ09VgWC+GD9d/9GW6J
 Mi5kqZYFDARtxBQ9ux4vuWPpbKF3KP+Itvg4P5f5PffL8qTLlHMFkhKKK9EZV/Z51rrD
 yWJg==
X-Gm-Message-State: APjAAAVP3sUXNGi66pdK36AXtEUDBb+Z05FZOVg9DJvCHXfwinCl091z
 DVhxJKeZulouuYexhNIYPKz8PA==
X-Google-Smtp-Source: APXvYqxZ1YfM7I9O5uFy/PJVuxbZj1mE7Mg7Fm9ZeSEO9i+JiSLEETE1w1UTUusb8qRcUt3IahS3Fw==
X-Received: by 2002:a65:53c9:: with SMTP id z9mr17640332pgr.405.1583151339181; 
 Mon, 02 Mar 2020 04:15:39 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id e9sm12708987pjt.16.2020.03.02.04.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 04:15:38 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 1/4] dma-buf: add support for virtio exported objects
Date: Mon,  2 Mar 2020 21:15:21 +0900
Message-Id: <20200302121524.7543-2-stevensd@chromium.org>
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

This change adds a new dma-buf operation that allows dma-bufs to be used
by virtio drivers to share exported objects. The new operation allows
the importing driver to query the exporting driver for the UUID which
identifies the underlying exported object.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/dma-buf/dma-buf.c | 14 ++++++++++++++
 include/linux/dma-buf.h   | 22 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d4097856c86b..a04632284ec2 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1158,6 +1158,20 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
 }
 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 
+#ifdef CONFIG_VIRTIO
+int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid)
+{
+	if (WARN_ON(!dmabuf) || !uuid)
+		return -EINVAL;
+
+	if (!dmabuf->ops->get_uuid)
+		return -ENODEV;
+
+	return dmabuf->ops->get_uuid(dmabuf, uuid);
+}
+EXPORT_SYMBOL_GPL(dma_buf_get_uuid);
+#endif
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index abf5459a5b9d..f5fecf8abe6a 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -251,6 +251,23 @@ struct dma_buf_ops {
 
 	void *(*vmap)(struct dma_buf *);
 	void (*vunmap)(struct dma_buf *, void *vaddr);
+
+#ifdef CONFIG_VIRTIO
+	/**
+	 * @get_uuid
+	 *
+	 * This is called by dma_buf_get_uuid to get the UUID which identifies
+	 * the buffer to virtio devices.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on failure. On success uuid
+	 * will be populated with the buffer's UUID.
+	 */
+	int (*get_uuid)(struct dma_buf *dmabuf, uuid_t *uuid);
+#endif
 };
 
 /**
@@ -444,4 +461,9 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 void *dma_buf_vmap(struct dma_buf *);
 void dma_buf_vunmap(struct dma_buf *, void *vaddr);
+
+#ifdef CONFIG_VIRTIO
+int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid);
+#endif
+
 #endif /* __DMA_BUF_H__ */
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
