Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD18A4C5F7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCAA10E482;
	Mon,  3 Mar 2025 16:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P1C9o2ia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8361710E482
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:02:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DEB15C5A1B;
 Mon,  3 Mar 2025 16:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E5EC4CED6;
 Mon,  3 Mar 2025 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741017772;
 bh=VloWLNuJy+a+QMiYC5t2AH/V4T4fUJVth/jJq4Qzt9o=;
 h=From:To:Cc:Subject:Date:From;
 b=P1C9o2iawqT4rduu7fga8AP5SQKrG7Dm8sgPxPMbfCjQJK20NYWGKFD1Pk3wFPZSr
 cAGlI2HmWKxlMF+JLUnRHsO3agzJXu9cAHGRdlJPGCeL4J6le57XcnQdOyoFj2d8Cv
 Dk9sj78CCyTpBNcpSue988dENnggywPMpBacGvu9OjBkngYovq2QL9XbZkA70S6Sxe
 CohGyL8n8jY4C+NaNr/O4yR9XWJJfzQPPMGqIhHo78wFqPJtasolzBOlFd+CdxGql1
 dsOp0mRYny4LVhTFGr9a4sE3HWMT7Yt0ByodRxhp6FjaTa8zR6fqlPYv+f9buKHMWW
 t+eyBjgi2wxFg==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, linux-doc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3] Documentation: dma-buf: heaps: Add heap name definitions
Date: Mon,  3 Mar 2025 17:02:49 +0100
Message-ID: <20250303160249.118549-1-mripard@kernel.org>
X-Mailer: git-send-email 2.48.1
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

Following a recent discussion at last Plumbers, John Stultz, Sumit
Sewal, TJ Mercier and I came to an agreement that we should document
what the dma-buf heaps names are expected to be, and what the buffers
attributes you'll get should be documented.

Let's create that doc to make sure those attributes and names are
guaranteed going forward.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Changes from v2:
  - Remove exhaustive list of names for platforms, and just mention the
    alternatives.
  - Add MAINTAINERS entry

Changes from v1:
  - Add the mention that the cma / reserved heap is optional.
---
 Documentation/userspace-api/dma-buf-heaps.rst | 25 +++++++++++++++++++
 Documentation/userspace-api/index.rst         |  1 +
 MAINTAINERS                                   |  1 +
 3 files changed, 27 insertions(+)
 create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
new file mode 100644
index 000000000000..5b92d69646f6
--- /dev/null
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Allocating dma-buf using heaps
+==============================
+
+Dma-buf Heaps are a way for userspace to allocate dma-buf objects. They are
+typically used to allocate buffers from a specific allocation pool, or to share
+buffers across frameworks.
+
+Heaps
+=====
+
+A heap represent a specific allocator. The Linux kernel currently supports the
+following heaps:
+
+ - The ``system`` heap allocates virtually contiguous, cacheable, buffers
+
+ - The ``cma`` heap allocates physically contiguous, cacheable,
+   buffers. Only present if a CMA region is present. Such a region is
+   usually created either through the kernel commandline through the
+   `cma` parameter, a memory region Device-Tree node with the
+   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
+   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
+   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index b1395d94b3fd..9cbe4390c872 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -42,10 +42,11 @@ Devices and I/O
 
 .. toctree::
    :maxdepth: 1
 
    accelerators/ocxl
+   dma-buf-heaps
    dma-buf-alloc-exchange
    gpio/index
    iommufd
    media/index
    dcdbas
diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..ef0364e65aef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6911,10 +6911,11 @@ R:	T.J. Mercier <tjmercier@google.com>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/userspace-api/dma-buf-heaps.rst
 F:	drivers/dma-buf/dma-heap.c
 F:	drivers/dma-buf/heaps/*
 F:	include/linux/dma-heap.h
 F:	include/uapi/linux/dma-heap.h
 F:	tools/testing/selftests/dmabuf-heaps/
-- 
2.48.1

