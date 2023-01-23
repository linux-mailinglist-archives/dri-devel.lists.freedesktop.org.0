Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4526678601
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 20:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FCE10E1F4;
	Mon, 23 Jan 2023 19:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1151710E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 19:18:04 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 w14-20020a25ac0e000000b007d519140f18so14008547ybi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 11:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9WOZzSEfhu/PT9TWBWMQDCCNsrofWV34oFDU/0sj1mQ=;
 b=CLJ2JxK/Tm4oa2T67r1/7AoCewa4cPoaCpXx/gVHbZ1m+FYlbdBISpcie92wke9qiT
 ywnZGTRRWgUyvtV2GeIN6CSF1A1BpACoPsOvCJSqkdka36IG7lwA9jHJB0/1Y37BiDn6
 UZyz4QR44eh7OHGKOjLnRuXG7qELlMRlfRNYaxnDlTMYAnQZZAKF7GLGFraikV5q7pPa
 PqEGE55YfXGgQoOaL42PCJmSLM5OLIrr2pXTamoSK+ZBJQZ3xablgI1e6ZxykShX+C1V
 OGCeujU9/+VSQurUIb0N4LKyFw0PX0Xvt3l2bOlWDy6qNiZqzVXsJcA5m/zeCrF4rUUR
 ohNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9WOZzSEfhu/PT9TWBWMQDCCNsrofWV34oFDU/0sj1mQ=;
 b=j/7LGHVAACKVQR09XvFTXTzLnRf6y2p7Rackd2LcUN8BNhSCd99HreEQi3hoKJBWIs
 vK8bta/o3TpZmHGQKyKI9pTJ9MC4AwGGSYq2AgclMW7gPmDee20j0AXO4uFK5vRAcj+j
 UwIICatq9Ww4g6nvjMQqSC8OvdA0BHCj8mwpyyrAxyth3oOwCmwGyvNIQlvFe/SH154v
 ir+RPfocL4dNxNyn4tx7s97bWchSKKk/0hzR8jAp4h8NwR7f0JBaicP9lRlkz6vuuWpr
 7TcapUARrfjG00M3jHQoonA3SaRp6lsyXPRp+N3nCIIthGf8RfAfOlCqme34AlFnlj8X
 0RqQ==
X-Gm-Message-State: AFqh2kqoLieFQ8h2qPCGql6jcPqH2gsghIZlLvSD16EyB8eZUvy5wXjB
 aEUYWdN1rQS5P+N0jffRAIWK2xynKQHA6V0=
X-Google-Smtp-Source: AMrXdXt5UsJV8XnGROzCqwUjMEtxGJTY0AAa2SUnm4rAwiP8wDQKiwcGvs1ceYITQIG6UCVtpU2h3/VNxLbuwi8=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a25:dc92:0:b0:7b0:3379:9c00 with SMTP id
 y140-20020a25dc92000000b007b033799c00mr3149691ybe.359.1674501483256; Mon, 23
 Jan 2023 11:18:03 -0800 (PST)
Date: Mon, 23 Jan 2023 19:17:24 +0000
In-Reply-To: <20230123191728.2928839-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20230123191728.2928839-1-tjmercier@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230123191728.2928839-3-tjmercier@google.com>
Subject: [PATCH v2 2/4] dmabuf: Add cgroup charge transfer function
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
Cc: android-mm@google.com, selinux@vger.kernel.org, daniel.vetter@ffwll.ch,
 hannes@cmpxchg.org, cmllamas@google.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-security-module@vger.kernel.org, jstultz@google.com, jeffv@google.com,
 cgroups@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma_buf_transfer_charge function provides a way for processes to
transfer charge of a buffer to a different cgroup. This is essential
for the cases where a central allocator process does allocations for
various subsystems, hands over the fd to the client who requested the
memory, and drops all references to the allocated memory.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/dma-buf.c  | 56 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h    |  1 +
 include/linux/memcontrol.h |  5 ++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a6a8cb5cb32d..ac3d02a7ecf8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -11,6 +11,7 @@
  * refining of this idea.
  */
 
+#include <linux/atomic.h>
 #include <linux/fs.h>
 #include <linux/slab.h>
 #include <linux/dma-buf.h>
@@ -1626,6 +1627,61 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
 
+/**
+ * dma_buf_transfer_charge - Change the cgroup to which the provided dma_buf is charged.
+ * @dmabuf_file:	[in]	file for buffer whose charge will be migrated to a different cgroup
+ * @target:		[in]	the task_struct of the destination process for the cgroup charge
+ *
+ * Only tasks that belong to the same cgroup the buffer is currently charged to
+ * may call this function, otherwise it will return -EPERM.
+ *
+ * Returns 0 on success, or a negative errno code otherwise.
+ */
+int dma_buf_transfer_charge(struct file *dmabuf_file, struct task_struct *target)
+{
+	struct mem_cgroup *current_cg, *target_cg;
+	struct dma_buf *dmabuf;
+	unsigned int nr_pages;
+	int ret = 0;
+
+	if (!IS_ENABLED(CONFIG_MEMCG))
+		return 0;
+
+	if (WARN_ON(!dmabuf_file) || WARN_ON(!target))
+		return -EINVAL;
+
+	if (!is_dma_buf_file(dmabuf_file))
+		return -EBADF;
+	dmabuf = dmabuf_file->private_data;
+
+	nr_pages = PAGE_ALIGN(dmabuf->size) / PAGE_SIZE;
+	current_cg = mem_cgroup_from_task(current);
+	target_cg = get_mem_cgroup_from_mm(target->mm);
+
+	if (current_cg == target_cg)
+		goto skip_transfer;
+
+	if (!mem_cgroup_charge_dmabuf(target_cg, nr_pages, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto skip_transfer;
+	}
+
+	if (cmpxchg(&dmabuf->memcg, current_cg, target_cg) != current_cg) {
+		/* Only the current owner can transfer the charge */
+		ret = -EPERM;
+		mem_cgroup_uncharge_dmabuf(target_cg, nr_pages);
+		goto skip_transfer;
+	}
+
+	mem_cgroup_uncharge_dmabuf(current_cg, nr_pages);
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
index 1f0ffb8e4bf5..f25eb8e60fb2 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -634,4 +634,5 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
 int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
+int dma_buf_transfer_charge(struct file *dmabuf_file, struct task_struct *target);
 #endif /* __DMA_BUF_H__ */
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index c10b8565fdbf..009298a446fe 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1335,6 +1335,11 @@ struct mem_cgroup *mem_cgroup_from_css(struct cgroup_subsys_state *css)
 	return NULL;
 }
 
+static inline struct mem_cgroup *mem_cgroup_from_task(struct task_struct *p)
+{
+	return NULL;
+}
+
 static inline void obj_cgroup_put(struct obj_cgroup *objcg)
 {
 }
-- 
2.39.0.246.g2a6d74b583-goog

