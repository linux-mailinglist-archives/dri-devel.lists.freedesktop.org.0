Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964ADA972F5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996E610E5ED;
	Tue, 22 Apr 2025 16:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LEjhnfMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2C110E5E2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745340147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Tmv3l4usOA2nic8/HFVk1c3fkYkDEF/+Vvfj6a/0Hk=;
 b=LEjhnfMw/XjWaanO5FmthVjRRulR+NW3tHK4VyLu/Akkr8Se7ppo045uRv8gzE+c4Bcdpx
 LwTEV1BslVyBmqxQ5v26VyJ/afF3RDmQvoN3WbMyPA4srNL/3plaS7hgPGtFZ3m/v37wgx
 R3qoDmYIS4DjueJ9pDopzb9U8m4pOog=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-Nub0ZEfAPfGV3VXe2hhqAA-1; Tue, 22 Apr 2025 12:42:23 -0400
X-MC-Unique: Nub0ZEfAPfGV3VXe2hhqAA-1
X-Mimecast-MFC-AGG-ID: Nub0ZEfAPfGV3VXe2hhqAA_1745340142
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so500064585a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 09:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745340142; x=1745944942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Tmv3l4usOA2nic8/HFVk1c3fkYkDEF/+Vvfj6a/0Hk=;
 b=quQ/Jhkt5lNayVB2IaCmfK1FrvwmzLap/ARtAma7bnnX4Ry84DMo1H1/iZ5gqQEy1b
 o/0BbT3MP5QSHTKH8WgQwGhxC82c7ZJYsXa3Jjqu3adydSoSfBJwT+uQnoAxhMBrR/kI
 55BWORuT0/Mnxg1PZslZ5s7oyZ0jdhCmVqQbl5j4P1NSVUEAypOg3wZOvevCCVSy0ZZJ
 RJun8xcx9waiiJfey63hNtTMs6Rpj9SH63d6uhm6R463C88zFvrxa4xdfr8QnEGRPhi7
 VOFUKmKs5tNal1a5M7d87hWQLN6mcauNDxyPZ8/m/zoglUt144h/di2qwx7c3aURU0Nd
 PCHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc8YCTBG7YfmnZscTmn/+qe+N2fz8o4XZIemDs6kCKrXOVDm+B02LzP5RC3eaCGV9FS/X5GeTBs84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuN6ftgbBMliBs2rAnk10/4v7DSE+qBjYSPOfghQZtjib40HAa
 YLVNMte910CQiTvszbqEMtckCospsV/yOuOn6nkQ2l0QgBTFmoUwodFuNQIkHP5tnwfB1/3fc8s
 mQjHjs2/68mvy2kOO4T2pp+YQEoF/QMHXbfTCnGFdUTqMYK9SUVKldyzhPVW9KXs3zQ==
X-Gm-Gg: ASbGncuQbs8T951wHoG16gt3EtCSpD9C4+vo5ifhaDSxqtJ1FFGdo2M5zqyYKNXzvxn
 usozeeHW2jpE342qFBCM4yGVPhE98MBOQBiX9KCMXk3obsZYWxiGhinB15TqvxOUEBnJ7TtHVL0
 PRBSNhc0TmJRIRtlGqkDrzVxCCJfUjatuvRpgTmdXKCdldCknl/fg1xdf3sSgShkazdYBCKj7AT
 WaBDdQ1I/ex507ayaS5OI2jK5ydMmdGg96+nJQouqnCJw78bT+vEcKySIZ5WEm+8Z9/QnDkNN8N
 69wxKw5SgYabs2RDUDYw0feFc2+Q5Zj8YeaJya6+3Zk=
X-Received: by 2002:a05:6214:c2f:b0:6ea:d604:9e49 with SMTP id
 6a1803df08f44-6f2c464071amr310346496d6.34.1745340142544; 
 Tue, 22 Apr 2025 09:42:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+ZRP1lhsHeFU6VqIk73sz8A2RHJZCwagmzI5I0mu0qrXjlrLozmeOZJ/CtBIvPj+DfegBnA==
X-Received: by 2002:a05:6214:c2f:b0:6ea:d604:9e49 with SMTP id
 6a1803df08f44-6f2c464071amr310346026d6.34.1745340142119; 
 Tue, 22 Apr 2025 09:42:22 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2bfd182sm59451376d6.80.2025.04.22.09.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 09:42:21 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Date: Tue, 22 Apr 2025 09:41:48 -0700
Message-ID: <20250422164148.547798-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422164148.547798-1-jkangas@redhat.com>
References: <20250422164148.547798-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -dvYROTsJnhRN9B8xeWugDRu5UyGB8REWf18kqlvkzU_1745340142
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
"default-pool" or "linux,cma". To simplify naming, just name it
"default_cma", and keep a legacy node in place backed by the same
underlying structure for backwards compatibility.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 11 +++++++----
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
 drivers/dma-buf/heaps/cma_heap.c              | 14 +++++++++++++-
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce64..577de813ba461 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -19,7 +19,10 @@ following heaps:
  - The ``cma`` heap allocates physically contiguous, cacheable,
    buffers. Only present if a CMA region is present. Such a region is
    usually created either through the kernel commandline through the
-   `cma` parameter, a memory region Device-Tree node with the
-   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
-   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
-   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+   ``cma`` parameter, a memory region Device-Tree node with the
+   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
+   ``default_cma``. For backwards compatibility, when the
+   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
+   created following legacy naming conventions; the legacy name might be
+   ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c42264..83f3770fa820a 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CMA_LEGACY
+	bool "DMA-BUF CMA Heap"
+	default y
+	depends on DMABUF_HEAPS_CMA
+	help
+	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
+	  from the CMA area's devicetree node, or "reserved" if the area is not
+	  defined in the devicetree. This uses the same underlying allocator as
+	  CONFIG_DMABUF_HEAPS_CMA.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index e998d8ccd1dc6..5533420d566b0 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#define DEFAULT_CMA_NAME "default_cma"
 
 struct cma_heap {
 	struct dma_heap *heap;
@@ -394,15 +395,26 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
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
 
+	legacy_cma_name = cma_get_name(default_cma);
+
+	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY) &&
+	    strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
+		ret = __add_cma_heap(default_cma, legacy_cma_name);
+		if (ret)
+			pr_warn("cma_heap: failed to add legacy heap: %pe\n",
+			        ERR_PTR(-ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0

