Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24BAAD3870
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B9210E10B;
	Tue, 10 Jun 2025 13:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bKOmF4/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5374E10E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749561174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwNvAxSsZLHPNJHICSvYXU8WtA4BAcBKIAsdjIZgB+Y=;
 b=bKOmF4/raXzYyew0pK3958+oziCvznq6gyK2n0+W2UabgJhdAKwjy7pYqZlPPr13O3minv
 osVHESDmwEc5LYJ/yye+7qn1WKXQGVp1zl15nuXECqD/vHxUZ8vtcBoD0qj64iV3wRC9sE
 4igx1Xy8EkTFetlevxtGbi6pm8CxlzA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-su00MgejOHmjEj3wbUgwCw-1; Tue, 10 Jun 2025 09:12:53 -0400
X-MC-Unique: su00MgejOHmjEj3wbUgwCw-1
X-Mimecast-MFC-AGG-ID: su00MgejOHmjEj3wbUgwCw_1749561172
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fac45de153so83937716d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561172; x=1750165972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fwNvAxSsZLHPNJHICSvYXU8WtA4BAcBKIAsdjIZgB+Y=;
 b=UPhFyEU1ihYYqye13JOgpPXJ2SUPhrXb/PVaaOVCDJqeHKloRkZopt9PB1j8ERoMsT
 vzqo4iYxSNKV8XhQ1PPGUMzqCacm+YhaFzmJ3I4Xf2C2zpOAzJt6qcQw57owqTIMZIFy
 V+ruJz4utI6OEZvUI7vkqcy3/Oy6yuHDFcHzGMGXX9GT19sDxEu4E7N3FjqI4P8dwyHt
 HF3udWS3A+eg7yJfGIXIqBrTcrCAYa/McmfvwBn4NQfVNSoxkz4N/faken7/s9nzCdWf
 KwvNEvlWnU5L3OGhKEI0fIhMpZZzXaWEXLiSwINGusVaPGZMCPQEtFTYHxks0JbbjMsB
 shfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA/NTn8naQtlpmNwxiTEb07iElycs9+kqRNG6MchuVkKngjQI0L83x4c4bg0hjYbutQBtb0CGcbF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrnOx6zi+BstPjSkhTA2C7u6NYRpMa04Lh/vYGCAEa9yYcR7Xm
 1lHL6vBha2RlsOU7cFPckmhbVWPY/8dkuc8PQ+4I+GD3d9FVU7/JX65toBjlyz8klDMdcpRYWgy
 U5nVzxU9lE4yCScmByJPlfeHV9sWt+y7EUVR3Vru7BPf83BLvcqWDtRkJF1jwpBEg0y45CQ==
X-Gm-Gg: ASbGncsg3vQd8M5tU5hqMp2gEjCPg3VLh3XTMYk9mNrIWVTaYaVYIG/67j0Itlq+4+K
 xQ/g8AJjB4ExOYf6Sg54tNgL+5AiJvdQVe8In/a03tWwMu7HyJGrJ+L/SnmGrQBUQq7S1WnLcay
 BwihinTMSQ1F/shyaHRF7vpby95dd4DK1IPW0L2NooEps1gGr00fk28CpE0PNKOmZwlAO1hgtQY
 sjrTUjx0h1Xj+0OZNtw0v81E0DttaahhOgye/jqf1Z0Mc9RThAzDOWq7ulzoqROlxMI5Vxce8hy
 hsqaxPCG0vYkHQb2qGjtoGlOHfwY8STbJvT93YZeIox/1NNmNDEEQA==
X-Received: by 2002:a05:6214:2501:b0:6f4:c742:7a7b with SMTP id
 6a1803df08f44-6fb24cc1827mr35155826d6.43.1749561172559; 
 Tue, 10 Jun 2025 06:12:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhwjqEuOk/V8BHIoXELyZMwDXwVFYf4ATZsDCoOS8jLuVTpHJJBi7SBGtQfW7GqBV1/L6ZsQ==
X-Received: by 2002:a05:6214:2501:b0:6f4:c742:7a7b with SMTP id
 6a1803df08f44-6fb24cc1827mr35155466d6.43.1749561172028; 
 Tue, 10 Jun 2025 06:12:52 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:12:51 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v4 3/3] dma-buf: heaps: Give default CMA heap a fixed name
Date: Tue, 10 Jun 2025 06:12:31 -0700
Message-ID: <20250610131231.1724627-4-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
References: <20250610131231.1724627-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DDu354Ux3OvAzrMdDqYo5UnpLcJFueIrkRu0d9hKQeo_1749561172
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

The CMA heap's name in devtmpfs can vary depending on how the heap is
defined. Its name defaults to "reserved", but if a CMA area is defined
in the devicetree, the heap takes on the devicetree node's name, such as
"default-pool" or "linux,cma". To simplify naming, unconditionally name
it "default_cma_region", but keep a legacy node in place backed by the
same underlying allocator for backwards compatibility.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst |  7 +++++--
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
 drivers/dma-buf/heaps/cma_heap.c              | 20 ++++++++++++++++++-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 23bd0bd7b0654..1dfe5e7acd5a3 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -21,5 +21,8 @@ following heaps:
    usually created either through the kernel commandline through the
    ``cma`` parameter, a memory region Device-Tree node with the
    ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
-   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
-   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
+   ``default_cma_region``. For backwards compatibility, when the
+   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
+   created following legacy naming conventions; the legacy name might be
+   ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c42264..bb369b38b001a 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CMA_LEGACY
+	bool "Legacy DMA-BUF CMA Heap"
+	default y
+	depends on DMABUF_HEAPS_CMA
+	help
+	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
+	  from the CMA area's devicetree node, or "reserved" if the area is not
+	  defined in the devicetree. This uses the same underlying allocator as
+	  CONFIG_DMABUF_HEAPS_CMA.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index e998d8ccd1dc6..0df0071119754 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -9,6 +9,9 @@
  * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  */
+
+#define pr_fmt(fmt) "cma_heap: " fmt
+
 #include <linux/cma.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
@@ -22,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#define DEFAULT_CMA_NAME "default_cma_region"
 
 struct cma_heap {
 	struct dma_heap *heap;
@@ -394,15 +398,29 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
+	const char *legacy_cma_name;
 	int ret;
 
 	if (!default_cma)
 		return 0;
 
-	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
 	if (ret)
 		return ret;
 
+	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY)) {
+		legacy_cma_name = cma_get_name(default_cma);
+		if (!strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
+			pr_warn("legacy name and default name are the same, skipping legacy heap\n");
+			return 0;
+		}
+
+		ret = __add_cma_heap(default_cma, legacy_cma_name);
+		if (ret)
+			pr_warn("failed to add legacy heap: %pe\n",
+				ERR_PTR(ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0

