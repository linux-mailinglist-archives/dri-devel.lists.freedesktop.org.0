Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD3E585432
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 19:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FB710E301;
	Fri, 29 Jul 2022 17:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8348B10E301;
 Fri, 29 Jul 2022 17:07:20 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id c3so5120075pfb.13;
 Fri, 29 Jul 2022 10:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2WImMabT+BMkggdA4vU26+hYnskt5BujSBi4wp3YAFI=;
 b=kMnwMW4dyNMbl8O6StUAt/bDDf451l18zZSaEAa6g12ZQ88sijyzpFm3Q2fvlQp474
 TLqTe8J4ixl8FUUOAo1wqAGrelpqJQGi5K3HGZw6TqYI1NI+MHRuDg9CxbiYSabTGzTm
 0/YyVkDGAzKlL8pPmdWmLht+fELLyTIM7S+z2eZ2SoD/aqdMmwvg0WWf3v58fgzwcQnd
 ZUJ2ya4KDGobFeJ3+USUf5V7fph36UTmlmjQQCFL3sX9b1X+j4YdFoFNo1x6hWTlrdKL
 zDZv4WjwQkA5Jo6YCCoicVkQw23QE9JZIe9580/8ghnjxUTfYTXyh1cqqgR1rSAIQsas
 zuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2WImMabT+BMkggdA4vU26+hYnskt5BujSBi4wp3YAFI=;
 b=YRC4e3orkUBa7qy5pgS3s1L6qFrcKcIU32Lpzo+qoeN3nU5+oePMTXNmgl94iVbkhd
 0eXglIEb8ACkI9jYU9L09l4MX0FDVL7fWEih1pHPfbVJvMrWzv5HWN+ySI9dH43lVd7G
 Zex6gbbLcWAlWGuVlYwC94V5EKpGksMGs2yQGyqwYXUG8pniykcJQCG7xmZlGNOAr+C3
 WZklylTP59u3QpaxPvyhdcNSh0AE3a03ZF1iwdpqash70u4ebOPOF8FDSfZx+kzzEfZw
 Q85HoLLdT08ZY1YqKU/WGMoJEtDeU5MjYEcSC96P01aG8gLn8cXUeeAp+rjpc0jR5yA9
 5Jyw==
X-Gm-Message-State: AJIora9aauX5n1BiMdM0m1wLQUYhO6l//8iGP9g/iuhqVpVSgdzd3n3U
 /3+kwYPvoS4pPtVtCnAsLMC8t2EKXVI=
X-Google-Smtp-Source: AGRyM1uqiA5uYpdRF1Kv0pg/4Id474Fcz4gvwkFH0VoZ51lSLrvQSOlfecvBfbl+FZfD2Iymsy3QEw==
X-Received: by 2002:a05:6a00:793:b0:52a:b261:f8e7 with SMTP id
 g19-20020a056a00079300b0052ab261f8e7mr4712172pfu.20.1659114439169; 
 Fri, 29 Jul 2022 10:07:19 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a170902f69000b0016dc240b24bsm3974627plg.95.2022.07.29.10.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 10:07:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Date: Fri, 29 Jul 2022 10:07:40 -0700
Message-Id: <20220729170744.1301044-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729170744.1301044-1-robdclark@gmail.com>
References: <20220729170744.1301044-1-robdclark@gmail.com>
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
 drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
 include/linux/dma-buf.h      |  7 +++++++
 include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 32f55640890c..d02d6c2a3b49 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return 0;
 }
 
+static long dma_buf_info(struct dma_buf *dmabuf, const void __user *uarg)
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
+		return dma_buf_info(dmabuf, (const void __user *)arg);
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

