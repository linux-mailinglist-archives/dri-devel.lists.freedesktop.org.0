Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1D50FD89
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EE210EAFD;
	Tue, 26 Apr 2022 12:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D7210EACF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:46:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 129so1426925wmz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7BXUq0vj8KoqiCfdmoJA1YRh5B//+tg+SsjJvRIdEH4=;
 b=iuDsd1y2jI5fQI29K4wTwdDcxoV4P6L6PB/puaNSFy8v84JYzCdxFMY9XlABMkhpbK
 1OTW+FEn68QaOsemJ9OfdsPiNgstRQeAHTYsYPYiYcqucst8BFOQIMBcfQZpFTiVsmOt
 t8vmR1PfDZHEnYfuehOnWe51yLtVhAIrdZtnP84JE1nu8QCauhigUvTGuobG9l6S8tLO
 9P1YeSQszZFF6JfGBQ4uB5rgeJ/SR+Q876pfAIcp7Rq5XWoxjfhd5JpIlfcvWB2nMeDT
 zNRybmlgWxoHJ08m9t2tSuoztXJszO7iK+cWHiAX4/iz72w3H7ERGxq1uT0NUNUiWlKN
 2ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7BXUq0vj8KoqiCfdmoJA1YRh5B//+tg+SsjJvRIdEH4=;
 b=feI7cxRsxNqCxs/uY7CAsgGAB+WabvPI53xsGNd1P7Wd8wF6s/kvp/kNZgurOeZ8Z8
 /1QTsMumY3Rx+xpA8Z52s3nFTJ7eIWAMmL6Tgm5YkCt3EP7yQ2O9+2bjYoFUkg+IqNqK
 iR3xo97CZcf/y2voEe9I8gMY4AYCwqYIlCzMmNmNskyR5dsXWtN0Cqs0zzmwuL4JoGdS
 06S+pPhgd81PABNWI4mU+T6NrIEOZFwUT/kCoZ0iij3ZhHL05Gxhu8Qf16mueKAc20Tn
 c0ecVTWYnb5qpxu93b8Jk6V6F6GAq14oo6CWR9AU6cOmsbCsIh5UEgHS3wB57X8F9yC8
 aEDg==
X-Gm-Message-State: AOAM530CN5z+19fXCXwtQWErAuitpUKPz0wtZe0IVWRiGOaXIubyrQom
 cQHayr5Yx4EPEuDTE8q+j9k=
X-Google-Smtp-Source: ABdhPJwKn4CvOBZ/cyMB8CU835KLoTbqBbS3Z43xUVydAp2yc1vsY3UTn8RFvu/8rzTwiQvcOLmpvQ==
X-Received: by 2002:a05:600c:2d93:b0:393:fbf7:5a58 with SMTP id
 i19-20020a05600c2d9300b00393fbf75a58mr894901wmg.101.1650977201897; 
 Tue, 26 Apr 2022 05:46:41 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 s10-20020adf978a000000b0020ae0154f1esm3641025wrb.5.2022.04.26.05.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 05:46:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	gustavo@padovan.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 3/3] dma-buf: generalize fence merging
Date: Tue, 26 Apr 2022 14:46:37 +0200
Message-Id: <20220426124637.329764-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426124637.329764-1-christian.koenig@amd.com>
References: <20220426124637.329764-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a dma_fence_merge() macro which allows to unwrap fences which
potentially can be containers as well and then merge them back together
into a flat dma_fence_array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c    |  95 ++++++++++++++++++++
 drivers/dma-buf/st-dma-fence-unwrap.c |  47 ++++++++++
 drivers/dma-buf/sync_file.c           | 119 ++------------------------
 include/linux/dma-fence-unwrap.h      |  24 ++++++
 4 files changed, 172 insertions(+), 113 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 711be125428c..c9becc74896d 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -11,6 +11,7 @@
 #include <linux/dma-fence-array.h>
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-fence-unwrap.h>
+#include <linux/slab.h>
 
 /* Internal helper to start new array iteration, don't use directly */
 static struct dma_fence *
@@ -57,3 +58,97 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
 	return __dma_fence_unwrap_array(cursor);
 }
 EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
+
+/* Implementation for the dma_fence_merge() marco, don't use directly */
+struct dma_fence *__dma_fence_merge(unsigned int num_fences,
+				    struct dma_fence **fences,
+				    struct dma_fence_unwrap *iter)
+{
+	struct dma_fence_array *result;
+	struct dma_fence *tmp, **array;
+	unsigned int i, count;
+
+	count = 0;
+	for (i = 0; i < num_fences; ++i) {
+		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
+			if (!dma_fence_is_signaled(tmp))
+				++count;
+	}
+
+	if (count == 0)
+		return dma_fence_get_stub();
+
+	if (count > INT_MAX)
+		return NULL;
+
+	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
+	if (!array)
+		return NULL;
+
+	/*
+	 * We can't guarantee that inpute fences are ordered by context, but
+	 * it is still quite likely when this function is used multiple times.
+	 * So attempt to order the fences by context as we pass over them and
+	 * merge fences with the same context.
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
+			if (!next || dma_fence_is_signaled(next))
+				continue;
+
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
+EXPORT_SYMBOL_GPL(__dma_fence_merge);
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 59628add93f5..23ab134417ed 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -240,6 +240,52 @@ static int unwrap_chain_array(void *arg)
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
+	f3 = dma_fence_merge(f1, f2);
+	if (!f3) {
+		err = -ENOMEM;
+		goto error_put_f2;
+	}
+
+	dma_fence_unwrap_for_each(fence, &iter, f3) {
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
@@ -247,6 +293,7 @@ int dma_fence_unwrap(void)
 		SUBTEST(unwrap_array),
 		SUBTEST(unwrap_chain),
 		SUBTEST(unwrap_chain_array),
+		SUBTEST(unwrap_merge),
 	};
 
 	return subtests(tests, NULL);
diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 0fe564539166..fe149d7e3ce2 100644
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
+	fence = dma_fence_merge(a->fence, b->fence);
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
index e7c219da4ed7..7c0fab318301 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -48,4 +48,28 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
 	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
 	     fence = dma_fence_unwrap_next(cursor))
 
+struct dma_fence *__dma_fence_merge(unsigned int num_fences,
+				    struct dma_fence **fences,
+				    struct dma_fence_unwrap *cursors);
+
+/**
+ * dma_fence_merge - unwrap and merge fences
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
+#define dma_fence_merge(...)					\
+	({							\
+		struct dma_fence *__f[] = { __VA_ARGS__ };	\
+		struct dma_fence_unwrap __c[ARRAY_SIZE(__f)];	\
+								\
+		__dma_fence_merge(ARRAY_SIZE(__f), __f, __c);	\
+	})
+
 #endif
-- 
2.25.1

