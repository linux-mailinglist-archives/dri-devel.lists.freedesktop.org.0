Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677496E1C0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 20:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3676310E909;
	Thu,  5 Sep 2024 18:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="FpbLybXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9617210E909
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 18:17:35 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-20573eb852aso15174045ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 11:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725560254; x=1726165054;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KkpqUFAZ/Hl7QsOxL+C0tDMWvG5/p/xrV5VIwX3XFNw=;
 b=FpbLybXsC7N3opys0lYXo516c2P+0HCe+/Afx1YDVHSS435k3Uj2xCvfHSB9fpY1Uc
 fZggBxX9e4Fo/xWkw0AFd5CgeMcXFlIeLVqOVmlrtyGTtlFAyliJd2e5NbaqbDgTp+gf
 Ou1IyaEfUm8zI8VgeSEE5JP8PgxNgljbg7LuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725560254; x=1726165054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KkpqUFAZ/Hl7QsOxL+C0tDMWvG5/p/xrV5VIwX3XFNw=;
 b=eOzgxpKwLhYtol2Ko9eS7EO/KiYvJpMjttBOlVHrKmfnFEIjg1A+kJT5lWWbq92leI
 YlUz19XUuM5Rotjgw8cNzQhOO17N3CcXCw1UjA5YRJizrdgdBtp3RK4bQRAwq52cJ4l6
 yf2ecYoFqZUe/yWRuVqneiAD/Y5fT9yO3prPuSMuVW1R/rAMJbNR2qgDt6lHJwictUg2
 szSU1pgQQtx4XkCSEVzSCPtweBFxvnOE1R3DdETX14iaf/WqLHNuwF0OyR/qhGoU6tpX
 dd6A9ZYNfZ6ZrqqJQQTwU72xHMWt87kcup8659ImRhzVm77vm2GxTXMRTy/rFBJ6vWWj
 lSMw==
X-Gm-Message-State: AOJu0YxY7iM4fhzKSpsEMAhE7b7B5WDlgcOe9laMSK4qwpcvxNhHpeCD
 jOB6i14FvYc9d+fRIWHSzP+2u66FriRFuE8HXtc4Gitwpsn8kwqDxCYYDYESVcWoIgvxxyqHXk5
 o22iIe/cIP2NPM4wZmKfQ9S65hyYpvGAtZut1/o8DTPKgNc+YHF3XSzBYzFXTpBaaQwUHRvkTfo
 td1cIKbblrZ4XlPB3yVBnNQURWluacZCNP6A9PE6EwjWzzvcGOjYqu
X-Google-Smtp-Source: AGHT+IFReGxzvPlxfMGPFW/8+E8X2gAMu7mYwPeLsOr3lfOzJB7gjIBD/i56Nc84I7/0wW+eQZCwig==
X-Received: by 2002:a17:902:f68a:b0:1fc:4acb:3670 with SMTP id
 d9443c01a7336-206ee9540d9mr2511095ad.12.1725560254422; 
 Thu, 05 Sep 2024 11:17:34 -0700 (PDT)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea76213sm31586275ad.305.2024.09.05.11.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 11:17:33 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, zack.rusin@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Add tracepoints
Date: Thu,  5 Sep 2024 13:17:10 -0500
Message-Id: <20240905181710.154732-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Adds the necessary files to create tracepoints for the vmwgfx driver.

Adds a single tracepoint for command buffer completion. This tracepoint
can be used to time command buffer execution time and to decode command
buffer errors. The submission time is also now recorded when the command
buffer is submitted to hardware.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/Makefile        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |  9 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_trace.c  | 32 +++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_trace.h  | 62 ++++++++++++++++++++++++++
 4 files changed, 102 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_trace.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_trace.h

diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index 46a4ab688a7f..482c1935bde6 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -10,6 +10,6 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
 	    vmwgfx_simple_resource.o vmwgfx_va.o vmwgfx_blit.o \
 	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
 	    vmwgfx_devcaps.o ttm_object.o vmwgfx_system_manager.o \
-	    vmwgfx_gem.o vmwgfx_vkms.o
+	    vmwgfx_gem.o vmwgfx_vkms.o vmwgfx_trace.o
 
 obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 94e8982f5616..1ac7f382cdb1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -27,6 +27,7 @@
 
 #include "vmwgfx_bo.h"
 #include "vmwgfx_drv.h"
+#include "vmwgfx_trace.h"
 
 #include <drm/ttm/ttm_bo.h>
 
@@ -141,6 +142,7 @@ struct vmw_cmdbuf_man {
  * @man: The command buffer manager.
  * @cb_header: Device command buffer header, allocated from a DMA pool.
  * @cb_context: The device command buffer context.
+ * @inline_space: Whether inline command buffer space is used.
  * @list: List head for attaching to the manager lists.
  * @node: The range manager node.
  * @handle: The DMA address of @cb_header. Handed to the device on command
@@ -148,19 +150,20 @@ struct vmw_cmdbuf_man {
  * @cmd: Pointer to the command buffer space of this buffer.
  * @size: Size of the command buffer space of this buffer.
  * @reserved: Reserved space of this buffer.
- * @inline_space: Whether inline command buffer space is used.
+ * @submit_time: When the CB was submitted to hardware in jiffies.
  */
 struct vmw_cmdbuf_header {
 	struct vmw_cmdbuf_man *man;
 	SVGACBHeader *cb_header;
 	SVGACBContext cb_context;
+	bool inline_space;
 	struct list_head list;
 	struct drm_mm_node node;
 	dma_addr_t handle;
 	u8 *cmd;
 	size_t size;
 	size_t reserved;
-	bool inline_space;
+	u64 submit_time;
 };
 
 /**
@@ -303,6 +306,7 @@ static int vmw_cmdbuf_header_submit(struct vmw_cmdbuf_header *header)
 	struct vmw_cmdbuf_man *man = header->man;
 	u32 val;
 
+	header->submit_time = get_jiffies_64();
 	val = upper_32_bits(header->handle);
 	vmw_write(man->dev_priv, SVGA_REG_COMMAND_HIGH, val);
 
@@ -391,6 +395,7 @@ static void vmw_cmdbuf_ctx_process(struct vmw_cmdbuf_man *man,
 		list_del(&entry->list);
 		wake_up_all(&man->idle_queue);
 		ctx->num_hw_submitted--;
+		trace_vmwgfx_cmdbuf_done(status, entry);
 		switch (status) {
 		case SVGA_CB_STATUS_COMPLETED:
 			__vmw_cmdbuf_header_free(entry);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_trace.c b/drivers/gpu/drm/vmwgfx/vmwgfx_trace.c
new file mode 100644
index 000000000000..065365fb147f
--- /dev/null
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_trace.c
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/**************************************************************************
+ *
+ * Copyright (c) 2024 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ **************************************************************************/
+
+#ifndef __CHECKER__
+#define CREATE_TRACE_POINTS
+#include "vmwgfx_trace.h"
+#endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_trace.h b/drivers/gpu/drm/vmwgfx/vmwgfx_trace.h
new file mode 100644
index 000000000000..808829321cf7
--- /dev/null
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_trace.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/**************************************************************************
+ *
+ * Copyright (c) 2024 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ **************************************************************************/
+
+#if !defined(_TRACE_VMWGFX_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_VMWGFX_H_
+
+#include <linux/stringify.h>
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM vmwgfx
+
+struct vmw_cmdbuf_header;
+
+TRACE_EVENT(vmwgfx_cmdbuf_done,
+
+	TP_PROTO(int status, struct vmw_cmdbuf_header *header),
+	TP_ARGS(status, header),
+	TP_STRUCT__entry(
+		__field(int, status)
+		__field(struct vmw_cmdbuf_header*, header)
+	),
+	TP_fast_assign(
+		__entry->status = status;
+		__entry->header = header;
+	),
+	TP_printk("status=%d", __entry->status)
+);
+
+#endif /* _TRACE_VMWGFX_H_ */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/vmwgfx
+#define TRACE_INCLUDE_FILE vmwgfx_trace
+#include <trace/define_trace.h>
-- 
2.34.1

