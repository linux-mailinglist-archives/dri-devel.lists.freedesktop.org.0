Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A51B663333
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 22:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A7E10E510;
	Mon,  9 Jan 2023 21:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671C210E099
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 21:38:27 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 z17-20020a25e311000000b00719e04e59e1so10461641ybd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 13:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jsT6wq4yb7S+NdjklyWb1ngjMGzkBXwNX+64A3lfzpA=;
 b=fvDtcLaeN/uzP3qHT8MCEklfe9OhLf6lmImIfuCacJYjG57XiBued7S3DOodRE/TYJ
 zCKNDg3ctqd3Dd67SPwPhW8ysEt0WGDBME6NGDgBcM5YrM326jXvkSXkPWXqmZwxbxsz
 JlJKx2q3UL/4NVtdfwNCMCP7QlTJxXBQXsxWNIIGkTyzBjhTdHqnlRz7A6SrrXEGohYg
 Y1TskQ4j5YZqdyazr4xhq4xZW9Gypy/dhRHNo7P2nwjIq6XxOhFfSm8keT19RigyoUi+
 Lj952kU65FcH0FMfMGjpPdMsLkeIqjmWXAgeBMVlEt6SVmi5tV7uui22G7kOc9eQRFhz
 T4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jsT6wq4yb7S+NdjklyWb1ngjMGzkBXwNX+64A3lfzpA=;
 b=gweJxW2guGVP2noOrm8/u3LQ9UbkpbN4fsB9mI9EmngZHkg1VzWfyRPIFNfHIsQ7QG
 ppT6bfUnDJdi7QHXx9qUdLfuJUcikz/uePJrCO1Jrsi4am5yiPo6+630CaIvl64CANoK
 SGKULmv1E/IfiKd+LTWrNrCJgf0MZIL/TyBcm9Yr59M4ZzUPT+9LQqHx6bVyzyBIQpjx
 vQyvsaztwO9r1erdkD04BoKWvXCVsCWiyncD4f6lg7u9MNcLBHDkiK/4O1JrPOgB2DuP
 /0rWvr0/7ffxk9kPl2mURvs+4WlQh1nq30mlge6yUCssQc7RcUMvIkLTiO2Bf2nrJnor
 v2jA==
X-Gm-Message-State: AFqh2kqZM0ta+kpzrD85qcTwpDoJ6j9keaZIKjpKacsIfupX2qKOydmT
 ZSdIpuPjxeJXuQ+ZBU3qfd9L8KoynjIuXak=
X-Google-Smtp-Source: AMrXdXtIpfaXFqcDGkNsmQctSMqXPQ/tLvykMkynrX+C5cGc1INOkvBaGX4j41udFUeKmd51zadys8k1Cp1SKbA=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a0d:e241:0:b0:48f:a921:40f2 with SMTP id
 l62-20020a0de241000000b0048fa92140f2mr5685523ywe.275.1673300307137; Mon, 09
 Jan 2023 13:38:27 -0800 (PST)
Date: Mon,  9 Jan 2023 21:38:05 +0000
In-Reply-To: <20230109213809.418135-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109213809.418135-3-tjmercier@google.com>
Subject: [PATCH 2/4] dmabuf: Add cgroup charge transfer function
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: android-mm@google.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 jstultz@google.com, hannes@cmpxchg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma_buf_transfer_charge function provides a way for processes to
transfer charge of a buffer to a different cgroup. This is essential
for the cases where a central allocator process does allocations for
various subsystems, hands over the fd to the client who requested the
memory, and drops all references to the allocated memory.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/dma-buf.c  | 45 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h    |  1 +
 include/linux/memcontrol.h |  6 +++++
 3 files changed, 52 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ac45dd101c4d..fd6c5002032b 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -11,6 +11,7 @@
  * refining of this idea.
  */
 
+#include <linux/atomic.h>
 #include <linux/fs.h>
 #include <linux/slab.h>
 #include <linux/dma-buf.h>
@@ -1618,6 +1619,50 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
 
+/**
+ * dma_buf_transfer_charge - Change the cgroup to which the provided dma_buf is charged.
+ * @dmabuf:	[in]	buffer whose charge will be migrated to a different cgroup
+ * @target:	[in]	the task_struct of the destination process for the cgroup charge
+ *
+ * Only tasks that belong to the same cgroup the buffer is currently charged to
+ * may call this function, otherwise it will return -EPERM.
+ *
+ * Returns 0 on success, or a negative errno code otherwise.
+ */
+int dma_buf_transfer_charge(struct dma_buf *dmabuf, struct task_struct *target)
+{
+	struct mem_cgroup *current_cg, *target_cg;
+	int ret = 0;
+
+	if (!IS_ENABLED(CONFIG_MEMCG))
+		return 0;
+
+	if (WARN_ON(!dmabuf) || WARN_ON(!target))
+		return -EINVAL;
+
+	current_cg = mem_cgroup_from_task(current);
+	target_cg = get_mem_cgroup_from_mm(target->mm);
+
+	if (current_cg == target_cg)
+		goto skip_transfer;
+
+	if (cmpxchg(&dmabuf->memcg, current_cg, target_cg) != current_cg) {
+		/* Only the current owner can transfer the charge */
+		ret = -EPERM;
+		goto skip_transfer;
+	}
+
+	mod_memcg_state(current_cg, MEMCG_DMABUF, -dmabuf->size);
+	mod_memcg_state(target_cg, MEMCG_DMABUF, dmabuf->size);
+
+	mem_cgroup_put(current_cg); /* unref from buffer - buffer keeps new ref to target_cg */
+	return 0;
+
+skip_transfer:
+	mem_cgroup_put(target_cg);
+	return ret;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 1f0ffb8e4bf5..6aa128d76aa7 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -634,4 +634,5 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
 int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
+int dma_buf_transfer_charge(struct dma_buf *dmabuf, struct task_struct *target);
 #endif /* __DMA_BUF_H__ */
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 1c1da2da20a6..e5aec27044c7 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1298,6 +1298,12 @@ struct mem_cgroup *mem_cgroup_from_css(struct cgroup_subsys_state *css)
 	return NULL;
 }
 
+static inline
+struct mem_cgroup *mem_cgroup_from_task(struct task_struct *p)
+{
+	return NULL;
+}
+
 static inline void obj_cgroup_put(struct obj_cgroup *objcg)
 {
 }
-- 
2.39.0.314.g84b9a713c41-goog

