Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE6C8D247
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 08:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B59810E776;
	Thu, 27 Nov 2025 07:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VkNHvwYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CF110E776
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 07:41:09 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-297ec50477aso2581335ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 23:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764229269; x=1764834069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6TQCT7eTDg2XHHUkD6C/L3ICqZT3KdP+WG9DmEyMuo0=;
 b=VkNHvwYRakBiqPHXtgTcgtflgSyyBDIoOqrBR9etEh7LmejWmRZG8lAiz7Tikb9yhW
 m75srcE6H19hVuJy1PxlVW8Y9FiHYmUNhxJ9sh9wdZxf/0QHdkwqWxn7CBE1+GY0HhDa
 yl+xCu0p70XpYJPEKSM6EiKCkK/rDBExG1JGsuxOaj63InESRYVS6XLAk047yaU3A/bj
 mCpLJvi/k9/yRw9k2/2H/k4Nh/HhCUmRbaVotLTHMCVJanPapKDW+atsw5rzdqvFQ6FJ
 GAdoIh48KY/yn399AGQEAEYoeepmzM9djjDwslFnj/OA1v3l5XAzwPMUrHDY2FD/xvsh
 UXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764229269; x=1764834069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6TQCT7eTDg2XHHUkD6C/L3ICqZT3KdP+WG9DmEyMuo0=;
 b=XGl4Fxs3lTR8l6nXMs1sOQTDtbdlzzSL2fToFHUBkFVfx6DFDiWmYCcROwOhHV4+Um
 lR+riUuFGBlkgbblxYyIxGtIZWVXB0WnDMtYtX+5ZBIbJOsjeU4yeEqsi7siYzvpQBcg
 czRdYO93VWJgQO56a94C0NB9P8SVxyVbcHJJsjW1YNhVt2YDWhJZ/88lQeSsLWar771Z
 KzHyDBPvK6S0cTLKgKJo4sqcXMrmPUzDPgUDoXvpC8NdePCJEUrIHah4LkWubqLA7oSt
 TCRnoMpO5dA00CoA3Ujl7i8dnCSu4Hc2KsOKkNL9VWyNsbB/w5jASu4KXz/Y3qfo0Egm
 +uqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTfGNgbzNoW2C+tuPLFkYdFz+H7wxE4dd6YJDhBeVE8zyEZNv9odvLzWmzT3x+oNaKn55gTLDTe4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5OfBc7Y9vka8rUDLAT4NY3LnRTL1cSA8ADWAJ0GCOzYF481se
 RDGa89faOPc4gv5e0gQUc4mF7HcRdUObBPlZrfkFBatQk80K6XveMplXsy1TWZae63M=
X-Gm-Gg: ASbGncvy3X8g7LgLTaLjYdts+7bpRCShdeagJmZkA2hKFvZbRigH/UhuhBRAbHSvM58
 4GGGLXRNHbKVDY0N/aPNybnkoI6OXl0c4kiI7or1s4Xv6HFPzS3wvvZne56lJvALMaYuprIF3Yv
 /XCngEhKO7seHJwOJLRDCjJb/BUvI23PaHytdP0ec+EJ75dm1slRZaa3f4nC+xBBh/670q+CIIx
 AE+E0le9Y6ucEmFv2HIUazBNwOBhccDEms/3A1noMufCjFnzAgw71T8sqlleXk29e7GpRwJ2Osm
 2p9Ch4xAHpbAVPPK56TrZTwWk8tfCRMiBfXErDFt7qDQDXq9fuuYOE8THJw4uPUksGNrbcVIkEA
 ETlNQrrMKWnnCxVvkZ50ggHKvTips0LeSZTjpkqH9HwMXi5YKvEJ/37tmAUeuChswJ5jCyGzLD5
 5a1Q1eb6CRazM=
X-Google-Smtp-Source: AGHT+IEBlmzvPfpPZSYziqgyCSQiiLlC/euU1UMGI4AMImrD/tBfX/XLDOjeV/TfCVGjyrfd8/xH/Q==
X-Received: by 2002:a17:903:3c67:b0:29a:69d:acdc with SMTP id
 d9443c01a7336-29b6bffd87amr213892395ad.25.1764229268696; 
 Wed, 26 Nov 2025 23:41:08 -0800 (PST)
Received: from localhost ([122.172.86.94]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bceb54454sm7966145ad.84.2025.11.26.23.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 23:41:08 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is
 disabled
Date: Thu, 27 Nov 2025 13:10:55 +0530
Message-Id: <6202945f4af2d10e0fb6602b25ff9cb454c1ee85.1764229204.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move several dma-buf function declarations under
CONFIG_DMA_SHARED_BUFFER and provide static inline no-op implementations
for the disabled case to allow the callers to build when the feature is
not compiled in.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/dma-buf.h | 116 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d58e329ac0e7..06e494d8f6b0 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -568,6 +568,7 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 	return !!dmabuf->ops->pin;
 }
 
+#ifdef CONFIG_DMA_SHARED_BUFFER
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev);
 struct dma_buf_attachment *
@@ -609,4 +610,119 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
 struct dma_buf *dma_buf_iter_begin(void);
 struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf);
+
+#else
+static inline struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
+							struct device *dev)
+{
+	return NULL;
+}
+
+static inline struct dma_buf_attachment *
+dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
+		       const struct dma_buf_attach_ops *importer_ops,
+		       void *importer_priv)
+{
+	return NULL;
+}
+
+static inline void dma_buf_detach(struct dma_buf *dmabuf,
+				  struct dma_buf_attachment *attach) { }
+
+static inline int dma_buf_pin(struct dma_buf_attachment *attach)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void dma_buf_unpin(struct dma_buf_attachment *attach) { }
+
+static inline struct dma_buf *
+dma_buf_export(const struct dma_buf_export_info *exp_info)
+{
+	return NULL;
+}
+
+
+static inline int dma_buf_fd(struct dma_buf *dmabuf, int flags)
+{
+	return -EOPNOTSUPP;
+}
+
+
+static inline struct dma_buf *dma_buf_get(int fd)
+{
+	return NULL;
+}
+
+static inline void dma_buf_put(struct dma_buf *dmabuf) { }
+
+static inline struct sg_table *
+dma_buf_map_attachment(struct dma_buf_attachment *, enum dma_data_direction)
+{
+	return NULL;
+}
+
+static inline void dma_buf_unmap_attachment(struct dma_buf_attachment *,
+					    struct sg_table *,
+					    enum dma_data_direction) { }
+
+static inline void dma_buf_move_notify(struct dma_buf *dma_buf) { }
+
+static inline int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
+					   enum dma_data_direction dir)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
+					 enum dma_data_direction dir)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct sg_table *
+dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
+				enum dma_data_direction direction)
+{
+	return NULL;
+}
+
+static inline void
+dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
+				  struct sg_table *sg_table,
+				  enum dma_data_direction direction) { }
+
+static inline int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
+			       unsigned long)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{ }
+
+static inline int dma_buf_vmap_unlocked(struct dma_buf *dmabuf,
+					struct iosys_map *map)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf,
+					   struct iosys_map *map) { }
+
+static inline struct dma_buf *dma_buf_iter_begin(void)
+{
+	return NULL;
+}
+
+static inline struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf)
+{
+	return NULL;
+}
+#endif /* CONFIG_DMA_SHARED_BUFFER */
 #endif /* __DMA_BUF_H__ */
-- 
2.31.1.272.g89b43f80a514

