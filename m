Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DA4D6053
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 12:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C1010E909;
	Fri, 11 Mar 2022 11:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410C610E909
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 11:02:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id c192so4904769wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 03:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GFp62pGudTaAvJCQbs/e68j4lgVVveBITWzF5FI2cio=;
 b=mY5b6auw+fLSBfJsiVWN8aPcW/cROWCyRbyjwtKw3Wm740m1fqoT+fRsAGAue/+WVy
 JLBoFTHAgSliLtogVwFXDZ7YgMto+ZxaTjl5LxiCClliB0akrTmc6WnXJA0b+H5zzDbb
 QtcnN/nIKLFdldn92ktNz/Yn9N7NE+SGj6s+8/Wkl2gA6vSKx3/23sM4AZjViF7U1gKE
 oaBfilvTQwHKVOvmX4K+9bQykcOBpgN6I4Uy2u6975UN7a5hHB/tPH4mhP7rlvhFlxcH
 jdzyOoklBK0DmCPTXRrUWZA/ZGzK04PPSfNGUjkNw0drJKD0CGk66g2WrM08J0ws/sGC
 pxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GFp62pGudTaAvJCQbs/e68j4lgVVveBITWzF5FI2cio=;
 b=JAq1AlhPbBR7DGp1RVnjDSWxOHm/fc9+zkU1bKhtvxXIDCRyU4cwJNmfy21wCxfwnW
 qtXf8hyVRlrUbGvkQBb2F//ofTTCDgXeIxEjbD1g4I4gZBkgpkaxSrBnEALUG3tx91ee
 J8Z1A7F8kbHrIrPK8YIYKeT8uWLMov3bdxbr9cxlBxgX+vIusgiOM8yewcOW6vgc81mz
 eZJZZGmgMIryllfcwcuf8ekB4a1wSeHm5AVycQ7eIC0LsuLxl49pNH2YOroUj3s2apgj
 fVcVo1hNDkECpSE4gCQuX5oKy8k9ePKks3uHOt4Np7UroO4JbC9vlOzSaRSy34OXFgxy
 hxyQ==
X-Gm-Message-State: AOAM533AdNm7IqmodH4+0Wh+wI2EsuF8w7UiGjHTEL5YVPDfkGbrtlwR
 71/j7Frp5ZWNxd9vuB2R1Vs=
X-Google-Smtp-Source: ABdhPJyk4yIn1WFbf96nZxzhOJ3I+drGMsJY0s8+/LEosCFddwYZ7RIwF4aZnr2+6CN5MudvPun/NQ==
X-Received: by 2002:a05:600c:3c9c:b0:389:cc3b:9462 with SMTP id
 bg28-20020a05600c3c9c00b00389cc3b9462mr12281996wmb.105.1646996566458; 
 Fri, 11 Mar 2022 03:02:46 -0800 (PST)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 9-20020a1c0209000000b003868897278asm10170918wmc.23.2022.03.11.03.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 03:02:45 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Date: Fri, 11 Mar 2022 12:02:43 +0100
Message-Id: <20220311110244.1245-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a general purpose helper to deep dive into dma_fence_chain/dma_fence_array
structures and iterate over all the fences in them.

This is useful when we need to flatten out all fences in those structures.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/driver-api/dma-buf.rst  |   6 +
 drivers/dma-buf/Makefile              |   1 +
 drivers/dma-buf/selftests.h           |   1 +
 drivers/dma-buf/st-dma-fence-unwrap.c | 279 ++++++++++++++++++++++++++
 include/linux/dma-fence-unwrap.h      |  99 +++++++++
 5 files changed, 386 insertions(+)
 create mode 100644 drivers/dma-buf/st-dma-fence-unwrap.c
 create mode 100644 include/linux/dma-fence-unwrap.h

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 2cd7db82d9fe..7209500f08c8 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -194,6 +194,12 @@ DMA Fence Chain
 .. kernel-doc:: include/linux/dma-fence-chain.h
    :internal:
 
+DMA Fence unwrap
+~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/linux/dma-fence-unwrap.h
+   :internal:
+
 DMA Fence uABI/Sync File
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 511805dbeb75..4c9eb53ba3f8 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -12,6 +12,7 @@ dmabuf_selftests-y := \
 	selftest.o \
 	st-dma-fence.o \
 	st-dma-fence-chain.o \
+	st-dma-fence-unwrap.o \
 	st-dma-resv.o
 
 obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
index 97d73aaa31da..851965867d9c 100644
--- a/drivers/dma-buf/selftests.h
+++ b/drivers/dma-buf/selftests.h
@@ -12,4 +12,5 @@
 selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
 selftest(dma_fence, dma_fence)
 selftest(dma_fence_chain, dma_fence_chain)
+selftest(dma_fence_unwrap, dma_fence_unwrap)
 selftest(dma_resv, dma_resv)
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
new file mode 100644
index 000000000000..d821faaebe93
--- /dev/null
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: MIT
+
+/*
+ * Copyright (C) 2022 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/dma-fence-unwrap.h>
+#if 0
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/mm.h>
+#include <linux/sched/signal.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/random.h>
+#endif
+
+#include "selftest.h"
+
+#define CHAIN_SZ (4 << 10)
+
+static struct kmem_cache *slab_fences;
+
+static inline struct mock_fence {
+	struct dma_fence base;
+	spinlock_t lock;
+} *to_mock_fence(struct dma_fence *f) {
+	return container_of(f, struct mock_fence, base);
+}
+
+static const char *mock_name(struct dma_fence *f)
+{
+	return "mock";
+}
+
+static void mock_fence_release(struct dma_fence *f)
+{
+	kmem_cache_free(slab_fences, to_mock_fence(f));
+}
+
+static const struct dma_fence_ops mock_ops = {
+	.get_driver_name = mock_name,
+	.get_timeline_name = mock_name,
+	.release = mock_fence_release,
+};
+
+static struct dma_fence *mock_fence(void)
+{
+	struct mock_fence *f;
+
+	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
+	if (!f)
+		return NULL;
+
+	spin_lock_init(&f->lock);
+	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
+
+	return &f->base;
+}
+
+static struct dma_fence *mock_array(unsigned int num_fences, ...)
+{
+	struct dma_fence_array *array;
+	struct dma_fence **fences;
+	va_list valist;
+	int i;
+
+	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
+	if (!fences)
+		return NULL;
+
+	va_start(valist, num_fences);
+	for (i = 0; i < num_fences; ++i)
+		fences[i] = va_arg(valist, typeof(*fences));
+	va_end(valist);
+
+	array = dma_fence_array_create(num_fences, fences,
+				       dma_fence_context_alloc(1),
+				       1, false);
+	if (!array)
+		goto cleanup;
+	return &array->base;
+
+cleanup:
+	for (i = 0; i < num_fences; ++i)
+		dma_fence_put(fences[i]);
+	kfree(fences);
+	return NULL;
+}
+
+static struct dma_fence *mock_chain(struct dma_fence *prev,
+				    struct dma_fence *fence)
+{
+	struct dma_fence_chain *f;
+
+	f = dma_fence_chain_alloc();
+	if (!f) {
+		dma_fence_put(prev);
+		dma_fence_put(fence);
+		return NULL;
+	}
+
+	dma_fence_chain_init(f, prev, fence, 1);
+	return &f->base;
+}
+
+static int sanitycheck(void *arg)
+{
+	struct dma_fence *f, *chain, *array;
+	int err = 0;
+
+	f = mock_fence();
+	if (!f)
+		return -ENOMEM;
+
+	array = mock_array(1, f);
+	if (!array)
+		return -ENOMEM;
+
+	chain = mock_chain(NULL, array);
+	if (!chain)
+		return -ENOMEM;
+
+	dma_fence_signal(f);
+	dma_fence_put(chain);
+	return err;
+}
+
+static int unwrap_array(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *array;
+	struct dma_fence_unwrap iter;
+	int err = 0;
+
+	f1 = mock_fence();
+	if (!f1)
+		return -ENOMEM;
+
+	f2 = mock_fence();
+	if (!f2) {
+		dma_fence_put(f1);
+		return -ENOMEM;
+	}
+
+	array = mock_array(2, f1, f2);
+	if (!array)
+		return -ENOMEM;
+
+	dma_fence_unwrap_for_each(fence, &iter, array) {
+		if (fence == f1) {
+			f1 = NULL;
+		} else if (fence == f2) {
+			f2 = NULL;
+		} else {
+			pr_err("Unexpected fence!\n");
+			err = -EINVAL;
+		}
+	}
+
+	if (f1 || f2) {
+		pr_err("Not all fences seen!\n");
+		err = -EINVAL;
+	}
+
+	dma_fence_signal(f1);
+	dma_fence_signal(f2);
+	dma_fence_put(array);
+	return 0;
+}
+
+static int unwrap_chain(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *chain;
+	struct dma_fence_unwrap iter;
+	int err = 0;
+
+	f1 = mock_fence();
+	if (!f1)
+		return -ENOMEM;
+
+	f2 = mock_fence();
+	if (!f2) {
+		dma_fence_put(f1);
+		return -ENOMEM;
+	}
+
+	chain = mock_chain(f1, f2);
+	if (!chain)
+		return -ENOMEM;
+
+	dma_fence_unwrap_for_each(fence, &iter, chain) {
+		if (fence == f1) {
+			f1 = NULL;
+		} else if (fence == f2) {
+			f2 = NULL;
+		} else {
+			pr_err("Unexpected fence!\n");
+			err = -EINVAL;
+		}
+	}
+
+	if (f1 || f2) {
+		pr_err("Not all fences seen!\n");
+		err = -EINVAL;
+	}
+
+	dma_fence_signal(f1);
+	dma_fence_signal(f2);
+	dma_fence_put(chain);
+	return 0;
+}
+
+static int unwrap_chain_array(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *array, *chain;
+	struct dma_fence_unwrap iter;
+	int err = 0;
+
+	f1 = mock_fence();
+	if (!f1)
+		return -ENOMEM;
+
+	f2 = mock_fence();
+	if (!f2) {
+		dma_fence_put(f1);
+		return -ENOMEM;
+	}
+
+	array = mock_array(2, f1, f2);
+	if (!array)
+		return -ENOMEM;
+
+	chain = mock_chain(NULL, array);
+	if (!chain)
+		return -ENOMEM;
+
+	dma_fence_unwrap_for_each(fence, &iter, chain) {
+		if (fence == f1) {
+			f1 = NULL;
+		} else if (fence == f2) {
+			f2 = NULL;
+		} else {
+			pr_err("Unexpected fence!\n");
+			err = -EINVAL;
+		}
+	}
+
+	if (f1 || f2) {
+		pr_err("Not all fences seen!\n");
+		err = -EINVAL;
+	}
+
+	dma_fence_signal(f1);
+	dma_fence_signal(f2);
+	dma_fence_put(chain);
+	return 0;
+}
+
+int dma_fence_unwrap(void)
+{
+	static const struct subtest tests[] = {
+		SUBTEST(sanitycheck),
+		SUBTEST(unwrap_array),
+		SUBTEST(unwrap_chain),
+		SUBTEST(unwrap_chain_array),
+	};
+	int ret;
+
+	slab_fences = KMEM_CACHE(mock_fence,
+				 SLAB_TYPESAFE_BY_RCU |
+				 SLAB_HWCACHE_ALIGN);
+	if (!slab_fences)
+		return -ENOMEM;
+
+	ret = subtests(tests, NULL);
+
+	kmem_cache_destroy(slab_fences);
+	return ret;
+}
diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
new file mode 100644
index 000000000000..54963df00c98
--- /dev/null
+++ b/include/linux/dma-fence-unwrap.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * fence-chain: chain fences together in a timeline
+ *
+ * Copyright (C) 2022 Advanced Micro Devices, Inc.
+ * Authors:
+ *	Christian König <christian.koenig@amd.com>
+ */
+
+#ifndef __LINUX_DMA_FENCE_UNWRAP_H
+#define __LINUX_DMA_FENCE_UNWRAP_H
+
+#include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-array.h>
+
+/**
+ * struct dma_fence_unwrap - cursor into the container structure
+ */
+struct dma_fence_unwrap {
+	/**
+	 * @chain: potential dma_fence_chain, but can be other fence as well
+	 */
+	struct dma_fence *chain;
+	/**
+	 * @array: potential dma_fence_array, but can be other fence as well
+	 */
+	struct dma_fence *array;
+	/**
+	 * @index: last returned index if @array is really a dma_fence_array
+	 */
+	unsigned int index;
+};
+
+/**
+ * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
+ * @cursor: cursor to initialize
+ *
+ * Helper function to unwrap dma_fence_array containers, don't touch directly.
+ * Use dma_fence_unwrap_first/next instead.
+ */
+static inline struct dma_fence *
+dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
+{
+	cursor->array = dma_fence_chain_contained(cursor->chain);
+	cursor->index = 0;
+	return dma_fence_array_first(cursor->array);
+}
+
+/**
+ * dma_fence_unwrap_first - return the first fence from fence containers
+ * @head: the entrypoint into the containers
+ * @cursor: current position inside the containers
+ *
+ * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
+ * first fence.
+ */
+static inline struct dma_fence *
+dma_fence_unwrap_first(struct dma_fence *head, struct dma_fence_unwrap *cursor)
+{
+	cursor->chain = dma_fence_get(head);
+	return dma_fence_unwrap_array(cursor);
+}
+
+/**
+ * dma_fence_unwrap_next - return the next fence from a fence containers
+ * @cursor: current position inside the containers
+ *
+ * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
+ * the next fence from them.
+ */
+static inline struct dma_fence *
+dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
+{
+	struct dma_fence *tmp;
+
+	++cursor->index;
+	tmp = dma_fence_array_next(cursor->array, cursor->index);
+	if (tmp)
+		return tmp;
+
+	cursor->chain = dma_fence_chain_walk(cursor->chain);
+	return dma_fence_unwrap_array(cursor);
+}
+
+/**
+ * dma_fence_unwrap_for_each - iterate over all fences in containers
+ * @fence: current fence
+ * @cursor: current position inside the containers
+ * @head: starting point for the iterator
+ *
+ * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
+ * potential fences in them. If @head is just a normal fence only that one is
+ * returned.
+ */
+#define dma_fence_unwrap_for_each(fence, cursor, head)			\
+	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
+	     fence = dma_fence_unwrap_next(cursor))
+
+#endif
-- 
2.25.1

