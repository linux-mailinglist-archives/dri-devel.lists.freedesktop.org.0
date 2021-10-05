Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A160C42253E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA2A6EB51;
	Tue,  5 Oct 2021 11:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449916EB51;
 Tue,  5 Oct 2021 11:37:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z2so16086736wmc.3;
 Tue, 05 Oct 2021 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89OOgwIjAdHEsJJAQ88awEfVzr+pvOl73kjL6eCX7Ww=;
 b=SiNJIlyRDB8S933rQ/pr33mZnm1WiqbJBjh0HAXe17Nu7tOVOaHoQewkwzZv/oznh7
 Om2EwiMx5+O/f3sJGq2mGCB+hmCUf1ex1fsJ1lqz5CaRHu8ocD1BkY0j3G1a9+lS3ljL
 gKy28jxSy8v68RYSZuRMj3el+EXbswZfmE8LzwwrJo0CynzZBPtl0q9eh/pReLORFa5v
 6cR1lES5pG4EP2ip3IObJnj9uIwk4VxTI9ehf6j7ZMn3AGotMBtSWTCFVTfEdHHe3enE
 1W10mpW/rcVdVyyPOkUBiT/1bZX5QajGTNnu4kg4NNVgtmPMAf4BmMRLovWxLZrxD/40
 DXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89OOgwIjAdHEsJJAQ88awEfVzr+pvOl73kjL6eCX7Ww=;
 b=a0GLikGaqJKnma+Jg8fsDQq9c4N0HSjZhAZrDAr1UeGU+5Rw/RmhVKTJh/KxrsZUmo
 UVTfVF0Jmk+Td+gNwrDWqLhfHpJfFrYjsJp3K88vH/3u27NwXdB7Gf49a7NZtGV7rrOM
 YxDO1630zByZUeCClXQVyJedBeUc9Rl2byy9TR6CQV3CsscFq4gLfZ5jM5AVT1aETyJ2
 axB2v7bU8YW0rvpIhNMSmj7tp1gCbQTDwIjNxRQCuUBtvUOgeufZEad8Tf38c+w6Q3xg
 6xXucyeNO4YotPdsrGGTsYsfzIh1BTUP7JDJeO5nzR+0yvtY36k2V6j1p/prqqr5zxRD
 ldsQ==
X-Gm-Message-State: AOAM5302zofPvYEOq6LiEDutN4QDOUqahdji7Iy3I63QllaJSCizk9d4
 Ih/6BojHYqizeER3zW0lrDY=
X-Google-Smtp-Source: ABdhPJzZg/MceseoGEW0sugmaYms6S5fcZjZIm7FgSb1h0CIpMpbqjjmpkMblRn9S7jaB3/ba9qXhg==
X-Received: by 2002:a7b:c0c2:: with SMTP id s2mr2859562wmh.179.1633433867837; 
 Tue, 05 Oct 2021 04:37:47 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 03/28] dma-buf: add dma_resv selftest v3
Date: Tue,  5 Oct 2021 13:37:17 +0200
Message-Id: <20211005113742.1101-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

Just exercising a very minor subset of the functionality, but already
proven useful.

v2: add missing locking
v3: some more cleanup and consolidation, add unlocked test as well

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Makefile      |   3 +-
 drivers/dma-buf/selftests.h   |   1 +
 drivers/dma-buf/st-dma-resv.c | 282 ++++++++++++++++++++++++++++++++++
 3 files changed, 285 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dma-buf/st-dma-resv.c

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 1ef021273a06..511805dbeb75 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
 dmabuf_selftests-y := \
 	selftest.o \
 	st-dma-fence.o \
-	st-dma-fence-chain.o
+	st-dma-fence-chain.o \
+	st-dma-resv.o
 
 obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
index bc8cea67bf1e..97d73aaa31da 100644
--- a/drivers/dma-buf/selftests.h
+++ b/drivers/dma-buf/selftests.h
@@ -12,3 +12,4 @@
 selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
 selftest(dma_fence, dma_fence)
 selftest(dma_fence_chain, dma_fence_chain)
+selftest(dma_resv, dma_resv)
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
new file mode 100644
index 000000000000..50d3791ccb8c
--- /dev/null
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -0,0 +1,282 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+* Copyright © 2019 Intel Corporation
+* Copyright © 2021 Advanced Micro Devices, Inc.
+*/
+
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/dma-resv.h>
+
+#include "selftest.h"
+
+static struct spinlock fence_lock;
+
+static const char *fence_name(struct dma_fence *f)
+{
+	return "selftest";
+}
+
+static const struct dma_fence_ops fence_ops = {
+	.get_driver_name = fence_name,
+	.get_timeline_name = fence_name,
+};
+
+static struct dma_fence *alloc_fence(void)
+{
+	struct dma_fence *f;
+
+	f = kmalloc(sizeof(*f), GFP_KERNEL);
+	if (!f)
+		return NULL;
+
+	dma_fence_init(f, &fence_ops, &fence_lock, 0, 0);
+	return f;
+}
+
+static int sanitycheck(void *arg)
+{
+	struct dma_resv resv;
+	struct dma_fence *f;
+	int r;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_fence_signal(f);
+	dma_fence_put(f);
+
+	dma_resv_init(&resv);
+	r = dma_resv_lock(&resv, NULL);
+	if (r)
+		pr_err("Resv locking failed\n");
+	else
+		dma_resv_unlock(&resv);
+	dma_resv_fini(&resv);
+	return r;
+}
+
+static int test_signaling(void *arg, bool shared)
+{
+	struct dma_resv resv;
+	struct dma_fence *f;
+	int r;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_resv_init(&resv);
+	r = dma_resv_lock(&resv, NULL);
+	if (r) {
+		pr_err("Resv locking failed\n");
+		goto err_free;
+	}
+
+	if (shared) {
+		r = dma_resv_reserve_shared(&resv, 1);
+		if (r) {
+			pr_err("Resv shared slot allocation failed\n");
+			goto err_unlock;
+		}
+
+		dma_resv_add_shared_fence(&resv, f);
+	} else {
+		dma_resv_add_excl_fence(&resv, f);
+	}
+
+	if (dma_resv_test_signaled(&resv, shared)) {
+		pr_err("Resv unexpectedly signaled\n");
+		r = -EINVAL;
+		goto err_unlock;
+	}
+	dma_fence_signal(f);
+	if (!dma_resv_test_signaled(&resv, shared)) {
+		pr_err("Resv not reporting signaled\n");
+		r = -EINVAL;
+		goto err_unlock;
+	}
+err_unlock:
+	dma_resv_unlock(&resv);
+err_free:
+	dma_resv_fini(&resv);
+	dma_fence_put(f);
+	return r;
+}
+
+static int test_excl_signaling(void *arg)
+{
+	return test_signaling(arg, false);
+}
+
+static int test_shared_signaling(void *arg)
+{
+	return test_signaling(arg, true);
+}
+
+static int test_for_each(void *arg, bool shared)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *f, *fence;
+	struct dma_resv resv;
+	int r;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_resv_init(&resv);
+	r = dma_resv_lock(&resv, NULL);
+	if (r) {
+		pr_err("Resv locking failed\n");
+		goto err_free;
+	}
+
+	if (shared) {
+		r = dma_resv_reserve_shared(&resv, 1);
+		if (r) {
+			pr_err("Resv shared slot allocation failed\n");
+			goto err_unlock;
+		}
+
+		dma_resv_add_shared_fence(&resv, f);
+	} else {
+		dma_resv_add_excl_fence(&resv, f);
+	}
+
+	r = -ENOENT;
+	dma_resv_for_each_fence(&cursor, &resv, shared, fence) {
+		if (!r) {
+			pr_err("More than one fence found\n");
+			r = -EINVAL;
+			goto err_unlock;
+		}
+		if (f != fence) {
+			pr_err("Unexpected fence\n");
+			r = -EINVAL;
+			goto err_unlock;
+		}
+		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
+			pr_err("Unexpected fence usage\n");
+			r = -EINVAL;
+			goto err_unlock;
+		}
+		r = 0;
+	}
+	if (r) {
+		pr_err("No fence found\n");
+		goto err_unlock;
+	}
+	dma_fence_signal(f);
+err_unlock:
+	dma_resv_unlock(&resv);
+err_free:
+	dma_resv_fini(&resv);
+	dma_fence_put(f);
+	return r;
+}
+
+static int test_excl_for_each(void *arg)
+{
+	return test_for_each(arg, false);
+}
+
+static int test_shared_for_each(void *arg)
+{
+	return test_for_each(arg, false);
+}
+
+static int test_for_each_unlocked(void *arg, bool shared)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *f, *fence;
+	struct dma_resv resv;
+	int r;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_resv_init(&resv);
+	r = dma_resv_lock(&resv, NULL);
+	if (r) {
+		pr_err("Resv locking failed\n");
+		goto err_free;
+	}
+
+	if (shared) {
+		r = dma_resv_reserve_shared(&resv, 1);
+		if (r) {
+			pr_err("Resv shared slot allocation failed\n");
+			dma_resv_unlock(&resv);
+			goto err_free;
+		}
+
+		dma_resv_add_shared_fence(&resv, f);
+	} else {
+		dma_resv_add_excl_fence(&resv, f);
+	}
+	dma_resv_unlock(&resv);
+
+	r = -ENOENT;
+	dma_resv_iter_begin(&cursor, &resv, shared);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (!r) {
+			dma_resv_iter_end(&cursor);
+			pr_err("More than one fence found\n");
+			r = -EINVAL;
+			goto err_free;
+		}
+		if (f != fence) {
+			dma_resv_iter_end(&cursor);
+			pr_err("Unexpected fence\n");
+			r = -EINVAL;
+			goto err_free;
+		}
+		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
+			dma_resv_iter_end(&cursor);
+			pr_err("Unexpected fence usage\n");
+			r = -EINVAL;
+			goto err_free;
+		}
+		r = 0;
+	}
+	dma_resv_iter_end(&cursor);
+	if (r) {
+		pr_err("No fence found\n");
+		goto err_free;
+	}
+	dma_fence_signal(f);
+err_free:
+	dma_resv_fini(&resv);
+	dma_fence_put(f);
+	return r;
+}
+
+static int test_excl_for_each_unlocked(void *arg)
+{
+	return test_for_each_unlocked(arg, false);
+}
+
+static int test_shared_for_each_unlocked(void *arg)
+{
+	return test_for_each_unlocked(arg, true);
+}
+
+int dma_resv(void)
+{
+	static const struct subtest tests[] = {
+		SUBTEST(sanitycheck),
+		SUBTEST(test_excl_signaling),
+		SUBTEST(test_shared_signaling),
+		SUBTEST(test_excl_for_each),
+		SUBTEST(test_shared_for_each),
+		SUBTEST(test_excl_for_each_unlocked),
+		SUBTEST(test_shared_for_each_unlocked),
+	};
+
+	spin_lock_init(&fence_lock);
+	return subtests(tests, NULL);
+}
-- 
2.25.1

