Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129A663332
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 22:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86EF10E099;
	Mon,  9 Jan 2023 21:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A3C10E490
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 21:38:25 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 z17-20020a25e311000000b00719e04e59e1so10461496ybd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 13:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzZnon9AuhDOmqXXwy+4pPV98gk0DXyzNf2lwwH3FVc=;
 b=MIKhBBBnQ+bqQnJww8/fPsZhi0whxCGIUG6kEGUGMp4FOf1NaJ2uHO5gbQnelxNiQA
 /zZow36TcojzDwPLoUOvG98yay8W+H/pD2HMrI1l93vbQq7yL0EPGLWZQ0R6+VY7DRtV
 JNWPRrorFPERhG5pCoV73P8K4BeUX6WEsXjfyFLgqrSJKvyOp3o0siNMo696W/r6yKXU
 y8RJ2vfZCTDjh6Oi2w1rHjBj4wQlmL0t+ZRPOFSxOTrZS7vGovErpCiunYz6Rey8BJDi
 cncB+zuYtfJ9rQv3FhWwefPz3sWwVINattaPynPAVTeC+nbR6FJw+i6h1qaddB0J7iUL
 VYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzZnon9AuhDOmqXXwy+4pPV98gk0DXyzNf2lwwH3FVc=;
 b=lfWxgxUEf8PKH5R9LedSyeZOVR/0kRv4gFrM9ReIUI58iuEZLxuftk/bEFmtHwYGsd
 zfSF/UUDrNWJUsL/qeVVShqgkxbOSuj+Dv9OMYOwRsFl6sSXtIQmFP3zbpEBBOtO4yvZ
 aUKuUy7wFJUWdGMlzxDlzD9TrCNclkLU3kgDbo29M17dxNBQBc3T+Y//16LAFNYGdj4V
 UPVcMDcUagVgsaRRNMOc1t3xPxjd5DRQyyAfxKAMCGxibWGdxNTGOXsKCAFigoe2IGRf
 G6nBePs4F+sr5OEZVGXEazy2RhRGF26RtAN9ZICdMnDRjJ+is/R7rXnLwzvWcAMXHc6m
 fWJA==
X-Gm-Message-State: AFqh2kr1HCwjhIOh+2zMC+CwBWcXw44ZqU5wZjjghzBwL9WVCBodxl9G
 zULTGWAUpnKj5So0frLXYSF7AOTDqAyAvDA=
X-Google-Smtp-Source: AMrXdXtOrlHW8ygC4EeYcDKs1WQIoeE3W+TEcqNZ/tFdoHO00Cnd/PEn3XI5TMhGx2JhnY0yguaIzWNDLrFIktg=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a81:6784:0:b0:460:c029:6c76 with SMTP id
 b126-20020a816784000000b00460c0296c76mr2274300ywc.515.1673300304313; Mon, 09
 Jan 2023 13:38:24 -0800 (PST)
Date: Mon,  9 Jan 2023 21:38:04 +0000
In-Reply-To: <20230109213809.418135-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109213809.418135-2-tjmercier@google.com>
Subject: [PATCH 1/4] memcg: Track exported dma-buffers
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeelb@google.com>, 
 Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
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
Cc: android-mm@google.com, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, jstultz@google.com,
 cgroups@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a buffer is exported to userspace, use memcg to attribute the
buffer to the allocating cgroup until all buffer references are
released.

Unlike the dmabuf sysfs stats implementation, this memcg accounting
avoids contention over the kernfs_rwsem incurred when creating or
removing nodes.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++++
 drivers/dma-buf/dma-buf.c               | 5 +++++
 include/linux/dma-buf.h                 | 3 +++
 include/linux/memcontrol.h              | 1 +
 mm/memcontrol.c                         | 4 ++++
 5 files changed, 17 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index c8ae7c897f14..538ae22bc514 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1455,6 +1455,10 @@ PAGE_SIZE multiple when read back.
 		Amount of memory used for storing in-kernel data
 		structures.
 
+	  dmabuf (npn)
+		Amount of memory used for exported DMA buffers allocated by the cgroup.
+		Stays with the allocating cgroup regardless of how the buffer is shared.
+
 	  workingset_refault_anon
 		Number of refaults of previously evicted anonymous pages.
 
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e6528767efc7..ac45dd101c4d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -75,6 +75,8 @@ static void dma_buf_release(struct dentry *dentry)
 	 */
 	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
+	mod_memcg_state(dmabuf->memcg, MEMCG_DMABUF, -dmabuf->size);
+	mem_cgroup_put(dmabuf->memcg);
 	dma_buf_stats_teardown(dmabuf);
 	dmabuf->ops->release(dmabuf);
 
@@ -673,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	if (ret)
 		goto err_dmabuf;
 
+	dmabuf->memcg = get_mem_cgroup_from_mm(current->mm);
+	mod_memcg_state(dmabuf->memcg, MEMCG_DMABUF, dmabuf->size);
+
 	file->private_data = dmabuf;
 	file->f_path.dentry->d_fsdata = dmabuf;
 	dmabuf->file = file;
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 6fa8d4e29719..1f0ffb8e4bf5 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -22,6 +22,7 @@
 #include <linux/fs.h>
 #include <linux/dma-fence.h>
 #include <linux/wait.h>
+#include <linux/memcontrol.h>
 
 struct device;
 struct dma_buf;
@@ -446,6 +447,8 @@ struct dma_buf {
 		struct dma_buf *dmabuf;
 	} *sysfs_entry;
 #endif
+	/* The cgroup to which this buffer is currently attributed */
+	struct mem_cgroup *memcg;
 };
 
 /**
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index d3c8203cab6c..1c1da2da20a6 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -37,6 +37,7 @@ enum memcg_stat_item {
 	MEMCG_KMEM,
 	MEMCG_ZSWAP_B,
 	MEMCG_ZSWAPPED,
+	MEMCG_DMABUF,
 	MEMCG_NR_STAT,
 };
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index ab457f0394ab..680189bec7e0 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1502,6 +1502,7 @@ static const struct memory_stat memory_stats[] = {
 	{ "unevictable",		NR_UNEVICTABLE			},
 	{ "slab_reclaimable",		NR_SLAB_RECLAIMABLE_B		},
 	{ "slab_unreclaimable",		NR_SLAB_UNRECLAIMABLE_B		},
+	{ "dmabuf",			MEMCG_DMABUF			},
 
 	/* The memory events */
 	{ "workingset_refault_anon",	WORKINGSET_REFAULT_ANON		},
@@ -1519,6 +1520,7 @@ static int memcg_page_state_unit(int item)
 	switch (item) {
 	case MEMCG_PERCPU_B:
 	case MEMCG_ZSWAP_B:
+	case MEMCG_DMABUF:
 	case NR_SLAB_RECLAIMABLE_B:
 	case NR_SLAB_UNRECLAIMABLE_B:
 	case WORKINGSET_REFAULT_ANON:
@@ -4042,6 +4044,7 @@ static const unsigned int memcg1_stats[] = {
 	WORKINGSET_REFAULT_ANON,
 	WORKINGSET_REFAULT_FILE,
 	MEMCG_SWAP,
+	MEMCG_DMABUF,
 };
 
 static const char *const memcg1_stat_names[] = {
@@ -4057,6 +4060,7 @@ static const char *const memcg1_stat_names[] = {
 	"workingset_refault_anon",
 	"workingset_refault_file",
 	"swap",
+	"dmabuf",
 };
 
 /* Universal VM events cgroup1 shows, original sort order */
-- 
2.39.0.314.g84b9a713c41-goog

