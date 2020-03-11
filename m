Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E01182ABF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3262E6EA6F;
	Thu, 12 Mar 2020 08:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B00A6E972
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:20:23 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i13so1155428pfe.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dwWKWsLEV24axZ5LPi6+9EofRSocDQnNjSMdJCwyg/k=;
 b=DiECrG1ChFrIsdnCWJkiiijV0Oa2bLJvHMESQKerzpeZrJBihyO27UbVoCHaNyHPMH
 3Zf0FXl3wUuI7rGKr3W7raEbt/GKRIAgNwv8jRHu9xBi2qAhYsfvrS6rwyKm2U7mBDtZ
 SzR6JVH7cbDV7RKvMFAbM3cWCfSEgVFtW7rTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dwWKWsLEV24axZ5LPi6+9EofRSocDQnNjSMdJCwyg/k=;
 b=gMn0tuZ590lNpTtxfARtbPhrtxGdcUT9h+Rb5SDIpqbJYWs42lHZjE1CLEmPwSxmrI
 y/F37r0a3kLmSh7ucrEQiPPPgobEkDOQXFQT0PT2AKMtfI/Sg8d25zRkTtbtS+QpecPi
 oti3LHsWSy/Xx3G5AMCz4JPmKZ1vNKo0MbAUNwCsWzWOHu1257fBUOCMqHq6M7taw1aN
 bVoAu/TK/7hwtZ254W01u5T7PhUoeTB8f/CBfGbGjZohGjnk4X1VjxNFvFSYxQkuFu2n
 IrT1yM4BKYpv++jTjX2oTW8L1se1Zvb1S71PnMPfxflckG9+18dRpEgg9t0XRN6YogC8
 pBmA==
X-Gm-Message-State: ANhLgQ3nT6mtQ0BMw6nSxOZx+YjAUGkjRVfRQ+g6kc8Mb3vQu8a31ACo
 idzDe9lGOXXzzZxCkiIOTih7ug==
X-Google-Smtp-Source: ADFU+vsqTKXWkUwlZU65GnXLcGQeIusImXSF6/071PjPajjV9Zy+d6+78zX7Xm4MNtky83+YtZg6Ow==
X-Received: by 2002:aa7:94b5:: with SMTP id a21mr295803pfl.290.1583925623087; 
 Wed, 11 Mar 2020 04:20:23 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id q43sm4280776pjc.40.2020.03.11.04.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 04:20:22 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Date: Wed, 11 Mar 2020 20:20:01 +0900
Message-Id: <20200311112004.47138-2-stevensd@chromium.org>
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

This change adds a new dma-buf operation that allows dma-bufs to be used
by virtio drivers to share exported objects. The new operation allows
the importing driver to query the exporting driver for the UUID which
identifies the underlying exported object.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/dma-buf/dma-buf.c | 12 ++++++++++++
 include/linux/dma-buf.h   | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d4097856c86b..fa5210ba6aaa 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1158,6 +1158,18 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
 }
 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 
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
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index abf5459a5b9d..00758523597d 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -251,6 +251,21 @@ struct dma_buf_ops {
 
 	void *(*vmap)(struct dma_buf *);
 	void (*vunmap)(struct dma_buf *, void *vaddr);
+
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
 };
 
 /**
@@ -444,4 +459,7 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 void *dma_buf_vmap(struct dma_buf *);
 void dma_buf_vunmap(struct dma_buf *, void *vaddr);
+
+int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid);
+
 #endif /* __DMA_BUF_H__ */
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
