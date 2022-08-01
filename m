Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8690586F3C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 19:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A397B8BF55;
	Mon,  1 Aug 2022 17:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D7111B85B;
 Mon,  1 Aug 2022 17:04:32 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id t2so11040279ply.2;
 Mon, 01 Aug 2022 10:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=TkCavpnUSJ7vycAkcy6P7E6qdN3Z1ej/wDjztPEV1Xs=;
 b=mcZ6MXoEnw1JToD2hyRhIZ7pGnefjHTTti+cjwuy9wEhPI6rOCmXGKRxCCyNgpQVGQ
 8ESBynZewyeP+SZ1jLeB8wARO2Qg6Ez0lCcZ4hW5Ad8Ij6Gv9RiSk4lnu4tQPos6Vs8t
 Wvq0L05TVB+4rbq4F2Qbli+EVXlKvq50rJMQBYzqGnXZ4V7U37sqyIGaTCR+TY+fWwKF
 OOkDDbKQsUeSAysdawliNu53PRsS1Ms5xw86ZQOU9y+IdzyNh61KweuH7ZDuCKbTwsxq
 HD4OvuUg7ZP692EA+mU+yv7FDvEb1AXFoMHE+NNT9MVfirvSgmZL52BvG/lfo29jqZoD
 uHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=TkCavpnUSJ7vycAkcy6P7E6qdN3Z1ej/wDjztPEV1Xs=;
 b=Ffh8jfPnYnNgLGohKZESRSa4UjxAL6SXa5Jgo8vx3i25h0bKGlCiTO6WV76VPBaTHM
 krjX1dknjSG+a14YwHlR0LZj4ScpaaN9QpwDiE8g5VMv+grRjxRRZtDy+rtVYVArw7r7
 CTIVPsstGbOITuCRITocnkDe4iiJ/d9AxPV0A7TT6WqPogzNuizUX2Sz9I6LjqvxYQtH
 grh8AlgGOILgQV4nPWtTctnmcna1EMi069ZBcXVQzL358ziQ2wlSDNMUvVtA8L7oBZE8
 HpXaDpM5qgJ/KJm0kP0pObYQwauZ9aTDttXolAK8oYHTUH+bnHZ3RxHXcHiU1lwNSgxs
 yKDQ==
X-Gm-Message-State: ACgBeo31485WeO4DLBYm6W5NZU5uQpf/GtF5QBYzQjMbbAuWFDd/8B3r
 5eia/shhl4wCnu6ZN3BZZuTTpW4FrQQ=
X-Google-Smtp-Source: AA6agR52MvgLOLsM9cuZ5dMaC0PMt05gnbIz5aCroJo5wVmxWfOtz0BXNBd1TvyuExGOeaD5YCdI6Q==
X-Received: by 2002:a17:903:22cb:b0:16e:e31f:5197 with SMTP id
 y11-20020a17090322cb00b0016ee31f5197mr7430704plg.23.1659373470488; 
 Mon, 01 Aug 2022 10:04:30 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ce8d00b0016d5626af4fsm10105279plg.21.2022.08.01.10.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:04:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap info
Date: Mon,  1 Aug 2022 10:04:55 -0700
Message-Id: <20220801170459.1593706-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220801170459.1593706-1-robdclark@gmail.com>
References: <20220801170459.1593706-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This is a fairly narrowly focused interface, providing a way for a VMM
in userspace to tell the guest kernel what pgprot settings to use when
mapping a buffer to guest userspace.

For buffers that get mapped into guest userspace, virglrenderer returns
a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
pages into the guest VM, it needs to report to drm/virtio in the guest
the cache settings to use for guest userspace.  In particular, on some
architectures, creating aliased mappings with different cache attributes
is frowned upon, so it is important that the guest mappings have the
same cache attributes as any potential host mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2. fix compiler warning

 drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
 include/linux/dma-buf.h      |  7 +++++++
 include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 32f55640890c..87c52f080274 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return 0;
 }
 
+static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
+{
+	struct dma_buf_info arg;
+
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+
+	switch (arg.param) {
+	case DMA_BUF_INFO_VM_PROT:
+		if (!dmabuf->ops->mmap_info)
+			return -ENOSYS;
+		arg.value = dmabuf->ops->mmap_info(dmabuf);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (copy_to_user(uarg, &arg, sizeof(arg)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long dma_buf_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long arg)
 {
@@ -369,6 +392,9 @@ static long dma_buf_ioctl(struct file *file,
 	case DMA_BUF_SET_NAME_B:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
+	case DMA_BUF_IOCTL_INFO:
+		return dma_buf_info(dmabuf, (void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 71731796c8c3..6f4de64a5937 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -283,6 +283,13 @@ struct dma_buf_ops {
 	 */
 	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
 
+	/**
+	 * @mmap_info:
+	 *
+	 * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_PROT.
+	 */
+	int (*mmap_info)(struct dma_buf *);
+
 	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 };
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index b1523cb8ab30..a41adac0f46a 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -85,6 +85,32 @@ struct dma_buf_sync {
 
 #define DMA_BUF_NAME_LEN	32
 
+
+/**
+ * struct dma_buf_info - Query info about the buffer.
+ */
+struct dma_buf_info {
+
+#define DMA_BUF_INFO_VM_PROT      1
+#  define DMA_BUF_VM_PROT_WC      0
+#  define DMA_BUF_VM_PROT_CACHED  1
+
+	/**
+	 * @param: Which param to query
+	 *
+	 * DMA_BUF_INFO_BM_PROT:
+	 *     Query the access permissions of userspace mmap's of this buffer.
+	 *     Returns one of DMA_BUF_VM_PROT_x
+	 */
+	__u32 param;
+	__u32 pad;
+
+	/**
+	 * @value: Return value of the query.
+	 */
+	__u64 value;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -95,4 +121,6 @@ struct dma_buf_sync {
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, __u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
 
+#define DMA_BUF_IOCTL_INFO	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
+
 #endif
-- 
2.36.1

