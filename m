Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1E4358D7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BED66EA5D;
	Thu, 21 Oct 2021 03:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CB26E3D8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:10:31 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id f11so4620170pfc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35kmIfN/EN6HlYQAf9OBmO1Wo6icnsDK3CGRODRZcFs=;
 b=UUeH1LXb6bN3bLuXh0yc5nlGW/kyMa8fv56ZqoMpRtyPIbXmyfdDg1uFwBbtNbZatN
 yoY6Go0sEHgri4SrjsUiVHdVC1417EOn1t3zJMooWxqV1thLlfh8NvR12v6Bo8GNry0W
 3ZW6eB+DszzCn7p1dkYJ4HYrvSSm1SXMd/GrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35kmIfN/EN6HlYQAf9OBmO1Wo6icnsDK3CGRODRZcFs=;
 b=oE5rfvDoMwJx1+307yaMC+iI4ZMBFVYn5WaDPzb6XzUZAo2KCfgnhOlqzEL4ESpZaB
 CimR0b4NTb8v2oEKxhkuKEg7gqlf31XEcLRbgvmMq74yLzhn0CLj2lsBIucXSR+FhGs4
 AVuuge527+OCcc7+5PYU9vdpW9ogWb+eTZMYoZbwXlp+lejRAO2dJzlAjKPJAzsdC8hW
 YaFZxlnsZTYeCFJZVpNvtNjIw6pb9UTGCv3TQpuRS0GjOkajW1aTa1f+tMxxp+cA7UX/
 37VUfv8UkqECS9u3yN1Q+BVB5VEHs6KLnaVseZp2q5zWmd2UpdiQLJQyqiGgiYiVuEoy
 Za3Q==
X-Gm-Message-State: AOAM531DcljJ400+tWdupyku/sqcFXEJ1AuIE02h5cKOJI/uAFVq4SYz
 rtz5DuVsd9oF65MmV4NKFE1hcDmtKY72JA==
X-Google-Smtp-Source: ABdhPJyuQs6FWqZJYUVEK9sEdqreefpCYOKDlBOtGfqhMfYK/hwgGFwhqjNkc7Y/joAW9+8XfGOSYg==
X-Received: by 2002:a05:6a00:10c2:b0:44d:d761:48d4 with SMTP id
 d2-20020a056a0010c200b0044dd76148d4mr3152633pfu.0.1634785830815; 
 Wed, 20 Oct 2021 20:10:30 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:21a4:fcf9:f5bb:f740])
 by smtp.gmail.com with ESMTPSA id z1sm4016255pfh.150.2021.10.20.20.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:10:30 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: kaleshsingh@google.com,
	daniel@ffwll.ch,
	rostedt@goodmis.org
Subject: [RFC PATCH 1/8] tracing/gpu: modify gpu_mem_total
Date: Wed, 20 Oct 2021 20:10:20 -0700
Message-Id: <20211021031027.537-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211021031027.537-1-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
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

The existing gpu_mem_total tracepoint [1] is not currently used by
any in-tree consumers, we should add some.

In addition, there's a desire to report imported memory via the
counters too [2].

To do this, we'll have to redefine the event to:

a) Change 'pid' to 'ctx_id'

The reason is  DRM subsystem is created with GEM objects, DRM devices
and DRM files in mind.  A GEM object is associated with DRM device,
and it may be shared between one or more DRM files.

Per-instance (or "context") counters make more sense than per-process
counters for DRM.  For GPUs that per process counters (kgsl), this
change is backwards compatible.

b) add an "import_mem_total" field

We're just appending a field, so no problem here.  Change "size" to
"mem_total" as well (name changes are backwards compatible).

[1] https://lore.kernel.org/r/20200302234840.57188-1-zzyiwei@google.com/
[2] https://www.spinics.net/lists/kernel/msg4062769.html

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 include/trace/events/gpu_mem.h | 61 ++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/include/trace/events/gpu_mem.h b/include/trace/events/gpu_mem.h
index 26d871f96e94..198b87f50356 100644
--- a/include/trace/events/gpu_mem.h
+++ b/include/trace/events/gpu_mem.h
@@ -14,41 +14,66 @@
 #include <linux/tracepoint.h>
 
 /*
- * The gpu_memory_total event indicates that there's an update to either the
- * global or process total gpu memory counters.
+ * The gpu_mem_total event indicates that there's an update to local or
+ * global gpu memory counters.
  *
- * This event should be emitted whenever the kernel device driver allocates,
- * frees, imports, unimports memory in the GPU addressable space.
+ * This event should be emitted whenever a GPU device (ctx_id == 0):
  *
- * @gpu_id: This is the gpu id.
+ *   1) allocates memory.
+ *   2) frees memory.
+ *   3) imports memory from an external exporter.
  *
- * @pid: Put 0 for global total, while positive pid for process total.
+ * OR when a GPU device instance (ctx_id != 0):
  *
- * @size: Size of the allocation in bytes.
+ *   1) allocates or acquires a reference to memory from another instance.
+ *   2) frees or releases a reference to memory from another instance.
+ *   3) imports memory from another GPU device instance.
  *
+ * When ctx_id == 0, both mem_total and import_mem_total total counters
+ * represent a global total.  When ctx_id == 0, these counters represent
+ * an instance specifical total.
+ *
+ * Note allocation does not necessarily mean backing the memory with pages.
+ *
+ * @gpu_id: unique ID of the GPU.
+ *
+ * @ctx_id: an ID for specific instance of the GPU device.
+ *
+ * @mem_total: - total size of memory known to a GPU device, including
+ *		 imports (ctx_id == 0)
+ *	       - total size of memory known to a GPU device instance
+ *		 (ctx_id != 0)
+ *
+ * @import_mem_total: - size of memory imported from outside GPU
+ *			device (ctx_id == 0)
+ *		      - size of memory imported into GPU device instance.
+ *			(ctx_id == 0)
  */
 TRACE_EVENT(gpu_mem_total,
 
-	TP_PROTO(uint32_t gpu_id, uint32_t pid, uint64_t size),
+	TP_PROTO(u32 gpu_id, u32 ctx_id, u64 mem_total, u64 import_mem_total),
 
-	TP_ARGS(gpu_id, pid, size),
+	TP_ARGS(gpu_id, ctx_id, mem_total, import_mem_total),
 
 	TP_STRUCT__entry(
-		__field(uint32_t, gpu_id)
-		__field(uint32_t, pid)
-		__field(uint64_t, size)
+		__field(u32, gpu_id)
+		__field(u32, ctx_id)
+		__field(u64, mem_total)
+		__field(u64, import_mem_total)
 	),
 
 	TP_fast_assign(
 		__entry->gpu_id = gpu_id;
-		__entry->pid = pid;
-		__entry->size = size;
+		__entry->ctx_id = ctx_id;
+		__entry->mem_total = mem_total;
+		__entry->import_mem_total = import_mem_total;
 	),
 
-	TP_printk("gpu_id=%u pid=%u size=%llu",
-		__entry->gpu_id,
-		__entry->pid,
-		__entry->size)
+	TP_printk("gpu_id=%u, ctx_id=%u, mem total=%llu, mem import total=%llu",
+		  __entry->gpu_id,
+		  __entry->ctx_id,
+		  __entry->mem_total,
+		  __entry->import_mem_total)
 );
 
 #endif /* _TRACE_GPU_MEM_H */
-- 
2.25.1

