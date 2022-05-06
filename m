Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E251DA14
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 16:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6422910EE3F;
	Fri,  6 May 2022 14:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661F110ED8B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 14:10:16 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id p18so8854420edr.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vefTnLmZ1hRjfFT+wM4LObjotAMbQOwWtxRJQRE0yXw=;
 b=j8KVGH2GHcMJ1ywj+cjz7pamBQLXExx8mmlGN6PbeSlm/kg++H2qKPy19AUZrDjN0Z
 o8FHJEp9fS1xdrFOQhSl9cXB2IJU4D7vQlMOewun/H7B6oHQ11No5Scm2xOpkcxDdT7H
 1TECQagWPIl96unP5+2bTbHhUnBnRS8y3kLYliVxg05CyWXc1xqSMVIBefKaUQMGvI8B
 4YYizgE1ioczKXABvNTntR0tKAty5FnafWl08Aw1pDKl3Wc6q3ZJjsBZHhA46HU8sflS
 TMcKOlIP0TG4W2/GqjtjLxHsjwvXYlmG4ZhVmO/TKJjur5dp/UnDEv2B/+zc40e/yr4p
 h7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vefTnLmZ1hRjfFT+wM4LObjotAMbQOwWtxRJQRE0yXw=;
 b=GK84Wl8OL4doe45V3lbqzHLTXPEHQ4lyfn4a9JPB6a1erXa6vyGsXL+rXOLLHzGNsJ
 NKftkeWW95Uyl8+ATGtztj1lVifVoL19UoJmjob6TQCVTfbzMKQlku8hETwT6EvWl4QC
 re1gzIwtbf1xx8Xgni2uutJQLvwS0e9YVt2cTXXpL1TeM2s5kSSuOyc3jO5dOKN//Rz3
 5Dm06X1kqnuy9fes2vkBVxYriAQhMdmZ85lZLmA8h5aynKYn1a0S3H3BdEow9xw3sR/T
 Gddd3FKU+gBMlYTNvYiid8U5SbrpbTz2HKj47DQ97g8marZStB3LaGNtJCZFgA9Gp0k/
 Xjdw==
X-Gm-Message-State: AOAM5319n2V40J93DAM0/lxyhyFkS8cCP9uMN43XL3wlw+q4bSaRkYGj
 td6QylgAc0+HTBGFtUV7d0U=
X-Google-Smtp-Source: ABdhPJwxAnRnqAaKfldxjBs/gMSK370De63PnkL12J/y9NEBXjJENsVHF+C8jsEr0H/sNCoxeRjgGw==
X-Received: by 2002:a50:ed13:0:b0:426:4939:45a9 with SMTP id
 j19-20020a50ed13000000b00426493945a9mr3701112eds.303.1651846214835; 
 Fri, 06 May 2022 07:10:14 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 jx3-20020a170907760300b006f3ef214e22sm1915415ejc.136.2022.05.06.07.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 07:10:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: [PATCH 4/5] dma-buf: generalize dma_fence unwrap & merging v2
Date: Fri,  6 May 2022 16:10:08 +0200
Message-Id: <20220506141009.18047-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506141009.18047-1-christian.koenig@amd.com>
References: <20220506141009.18047-1-christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a dma_fence_unwrap_merge() macro which allows to unwrap fences
which potentially can be containers as well and then merge them back
together into a flat dma_fence_array.

v2: rename the function, add some more comments about how the wrapper is
    used, move filtering of signaled fences into the unwrap iterator,
    add complex selftest which covers more cases.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-fence-unwrap.c    |  99 +++++++++++++++++++++
 drivers/dma-buf/st-dma-fence-unwrap.c | 109 +++++++++++++++++++++++
 drivers/dma-buf/sync_file.c           | 119 ++------------------------
 include/linux/dma-fence-unwrap.h      |  24 ++++++
 4 files changed, 238 insertions(+), 113 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 711be125428c..0e51547bbabd 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -11,6 +11,7 @@
 #include <linux/dma-fence-array.h>
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-fence-unwrap.h>
+#include <linux/slab.h>
 
 /* Internal helper to start new array iteration, don't use directly */
 static struct dma_fence *
@@ -57,3 +58,101 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
 	return __dma_fence_unwrap_array(cursor);
 }
 EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
+
+/* Implementation for the dma_fence_merge() marco, don't use directly */
+struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
+					   struct dma_fence **fences,
+					   struct dma_fence_unwrap *iter)
+{
+	struct dma_fence_array *result;
+	struct dma_fence *tmp, **array;
+	unsigned int i;
+	size_t count;
+
+	count = 0;
+	for (i = 0; i < num_fences; ++i) {
+		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
+			++count;
+	}
+
+	if (count == 0)
+		return dma_fence_get_stub();
+
+	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
+	if (!array)
+		return NULL;
+
+	/*
+	 * This trashes the input fence array and uses it as position for the
+	 * following merge loop. This works because the dma_fence_merge()
+	 * wrapper macro is creating this temporary array on the stack together
+	 * with the iterators.
+	 */
+	for (i = 0; i < num_fences; ++i)
+		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
+
+	count = 0;
+	do {
+		unsigned int sel;
+
+restart:
+		tmp = NULL;
+		for (i = 0; i < num_fences; ++i) {
+			struct dma_fence *next = fences[i];
+
+			if (!next)
+				continue;
+
+			/*
+			 * We can't guarantee that inpute fences are ordered by
+			 * context, but it is still quite likely when this
+			 * function is used multiple times. So attempt to order
+			 * the fences by context as we pass over them and merge
+			 * fences with the same context.
+			 */
+			if (!tmp || tmp->context > next->context) {
+				tmp = next;
+				sel = i;
+
+			} else if (tmp->context < next->context) {
+				continue;
+
+			} else if (dma_fence_is_later(tmp, next)) {
+				fences[i] = dma_fence_unwrap_next(&iter[i]);
+				goto restart;
+			} else {
+				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+				goto restart;
+			}
+		}
+
+		if (tmp) {
+			array[count++] = dma_fence_get(tmp);
+			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+		}
+	} while (tmp);
+
+	if (count == 0) {
+		tmp = dma_fence_get_stub();
+		goto return_tmp;
+	}
+
+	if (count == 1) {
+		tmp = array[0];
+		goto return_tmp;
+	}
+
+	result = dma_fence_array_create(count, array,
+					dma_fence_context_alloc(1),
+					1, false);
+	if (!result) {
+		tmp = NULL;
+		goto return_tmp;
+	}
+	return &result->base;
+
+return_tmp:
+	kfree(array);
+	return tmp;
+}
+EXPORT_SYMBOL_GPL(__dma_fence_unwrap_merge);
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index e20c5a7dcfe4..4105d5ea8dde 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -238,6 +238,113 @@ static int unwrap_chain_array(void *arg)
 	return err;
 }
 
+static int unwrap_merge(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *f3;
+	struct dma_fence_unwrap iter;
+	int err = 0;
+
+	f1 = mock_fence();
+	if (!f1)
+		return -ENOMEM;
+
+	f2 = mock_fence();
+	if (!f2) {
+		err = -ENOMEM;
+		goto error_put_f1;
+	}
+
+	f3 = dma_fence_unwrap_merge(f1, f2);
+	if (!f3) {
+		err = -ENOMEM;
+		goto error_put_f2;
+	}
+
+	dma_fence_unwrap_for_each(fence, &iter, f3) {
+		if (fence == f1) {
+			dma_fence_put(f1);
+			f1 = NULL;
+		} else if (fence == f2) {
+			dma_fence_put(f2);
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
+	dma_fence_put(f3);
+error_put_f2:
+	dma_fence_put(f2);
+error_put_f1:
+	dma_fence_put(f1);
+	return err;
+}
+
+static int unwrap_merge_complex(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5;
+	struct dma_fence_unwrap iter;
+	int err = -ENOMEM;
+
+	f1 = mock_fence();
+	if (!f1)
+		return -ENOMEM;
+
+	f2 = mock_fence();
+	if (!f2)
+		goto error_put_f1;
+
+	f3 = dma_fence_unwrap_merge(f1, f2);
+	if (!f3)
+		goto error_put_f2;
+
+	/* The resulting array has the fences in reverse */
+	f4 = dma_fence_unwrap_merge(f2, f1);
+	if (!f4)
+		goto error_put_f3;
+
+	/* Signaled fences should be filtered, the two arrays merged. */
+	f5 = dma_fence_unwrap_merge(f3, f4, dma_fence_get_stub());
+	if (!f5)
+		goto error_put_f4;
+
+	err = 0;
+	dma_fence_unwrap_for_each(fence, &iter, f5) {
+		if (fence == f1) {
+			dma_fence_put(f1);
+			f1 = NULL;
+		} else if (fence == f2) {
+			dma_fence_put(f2);
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
+	dma_fence_put(f5);
+error_put_f4:
+	dma_fence_put(f4);
+error_put_f3:
+	dma_fence_put(f3);
+error_put_f2:
+	dma_fence_put(f2);
+error_put_f1:
+	dma_fence_put(f1);
+	return err;
+}
+
 int dma_fence_unwrap(void)
 {
 	static const struct subtest tests[] = {
@@ -245,6 +352,8 @@ int dma_fence_unwrap(void)
 		SUBTEST(unwrap_array),
 		SUBTEST(unwrap_chain),
 		SUBTEST(unwrap_chain_array),
+		SUBTEST(unwrap_merge),
+		SUBTEST(unwrap_merge_complex),
 	};
 
 	return subtests(tests, NULL);
diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 0fe564539166..3ebec19a8e02 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -146,50 +146,6 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 	return buf;
 }
 
-static int sync_file_set_fence(struct sync_file *sync_file,
-			       struct dma_fence **fences, int num_fences)
-{
-	struct dma_fence_array *array;
-
-	/*
-	 * The reference for the fences in the new sync_file and held
-	 * in add_fence() during the merge procedure, so for num_fences == 1
-	 * we already own a new reference to the fence. For num_fence > 1
-	 * we own the reference of the dma_fence_array creation.
-	 */
-
-	if (num_fences == 0) {
-		sync_file->fence = dma_fence_get_stub();
-		kfree(fences);
-
-	} else if (num_fences == 1) {
-		sync_file->fence = fences[0];
-		kfree(fences);
-
-	} else {
-		array = dma_fence_array_create(num_fences, fences,
-					       dma_fence_context_alloc(1),
-					       1, false);
-		if (!array)
-			return -ENOMEM;
-
-		sync_file->fence = &array->base;
-	}
-
-	return 0;
-}
-
-static void add_fence(struct dma_fence **fences,
-		      int *i, struct dma_fence *fence)
-{
-	fences[*i] = fence;
-
-	if (!dma_fence_is_signaled(fence)) {
-		dma_fence_get(fence);
-		(*i)++;
-	}
-}
-
 /**
  * sync_file_merge() - merge two sync_files
  * @name:	name of new fence
@@ -203,84 +159,21 @@ static void add_fence(struct dma_fence **fences,
 static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 					 struct sync_file *b)
 {
-	struct dma_fence *a_fence, *b_fence, **fences;
-	struct dma_fence_unwrap a_iter, b_iter;
-	unsigned int index, num_fences;
 	struct sync_file *sync_file;
+	struct dma_fence *fence;
 
 	sync_file = sync_file_alloc();
 	if (!sync_file)
 		return NULL;
 
-	num_fences = 0;
-	dma_fence_unwrap_for_each(a_fence, &a_iter, a->fence)
-		++num_fences;
-	dma_fence_unwrap_for_each(b_fence, &b_iter, b->fence)
-		++num_fences;
-
-	if (num_fences > INT_MAX)
-		goto err_free_sync_file;
-
-	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
-	if (!fences)
-		goto err_free_sync_file;
-
-	/*
-	 * We can't guarantee that fences in both a and b are ordered, but it is
-	 * still quite likely.
-	 *
-	 * So attempt to order the fences as we pass over them and merge fences
-	 * with the same context.
-	 */
-
-	index = 0;
-	for (a_fence = dma_fence_unwrap_first(a->fence, &a_iter),
-	     b_fence = dma_fence_unwrap_first(b->fence, &b_iter);
-	     a_fence || b_fence; ) {
-
-		if (!b_fence) {
-			add_fence(fences, &index, a_fence);
-			a_fence = dma_fence_unwrap_next(&a_iter);
-
-		} else if (!a_fence) {
-			add_fence(fences, &index, b_fence);
-			b_fence = dma_fence_unwrap_next(&b_iter);
-
-		} else if (a_fence->context < b_fence->context) {
-			add_fence(fences, &index, a_fence);
-			a_fence = dma_fence_unwrap_next(&a_iter);
-
-		} else if (b_fence->context < a_fence->context) {
-			add_fence(fences, &index, b_fence);
-			b_fence = dma_fence_unwrap_next(&b_iter);
-
-		} else if (__dma_fence_is_later(a_fence->seqno, b_fence->seqno,
-						a_fence->ops)) {
-			add_fence(fences, &index, a_fence);
-			a_fence = dma_fence_unwrap_next(&a_iter);
-			b_fence = dma_fence_unwrap_next(&b_iter);
-
-		} else {
-			add_fence(fences, &index, b_fence);
-			a_fence = dma_fence_unwrap_next(&a_iter);
-			b_fence = dma_fence_unwrap_next(&b_iter);
-		}
+	fence = dma_fence_unwrap_merge(a->fence, b->fence);
+	if (!fence) {
+		fput(sync_file->file);
+		return NULL;
 	}
-
-	if (sync_file_set_fence(sync_file, fences, index) < 0)
-		goto err_put_fences;
-
+	sync_file->fence = fence;
 	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
 	return sync_file;
-
-err_put_fences:
-	while (index)
-		dma_fence_put(fences[--index]);
-	kfree(fences);
-
-err_free_sync_file:
-	fput(sync_file->file);
-	return NULL;
 }
 
 static int sync_file_release(struct inode *inode, struct file *file)
diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index a4d342fef8e0..390de1ee9d35 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -52,4 +52,28 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
 	     fence = dma_fence_unwrap_next(cursor))			\
 		if (!dma_fence_is_signaled(fence))
 
+struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
+					   struct dma_fence **fences,
+					   struct dma_fence_unwrap *cursors);
+
+/**
+ * dma_fence_unwrap_merge - unwrap and merge fences
+ *
+ * All fences given as parameters are unwrapped and merged back together as flat
+ * dma_fence_array. Useful if multiple containers need to be merged together.
+ *
+ * Implemented as a macro to allocate the necessary arrays on the stack and
+ * account the stack frame size to the caller.
+ *
+ * Returns NULL on memory allocation failure, a dma_fence object representing
+ * all the given fences otherwise.
+ */
+#define dma_fence_unwrap_merge(...)					\
+	({								\
+		struct dma_fence *__f[] = { __VA_ARGS__ };		\
+		struct dma_fence_unwrap __c[ARRAY_SIZE(__f)];		\
+									\
+		__dma_fence_unwrap_merge(ARRAY_SIZE(__f), __f, __c);	\
+	})
+
 #endif
-- 
2.25.1

