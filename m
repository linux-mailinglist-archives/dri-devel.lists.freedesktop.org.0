Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB9638F4AA
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 23:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B5D6E95C;
	Mon, 24 May 2021 21:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D436E95B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:00:10 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id h12so3089804plf.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9QA2gacsjSb9O8RWGnCdjII3ht0ANX+ui30IfOJeiRQ=;
 b=u5QJ1aJWTsdACkjSnLxq2efxwb+Af0KIRBL7bsmlbI7C3eCa35CB2+rDlgVhOADxv8
 dwbwnfJ5VFNU9868FoUF/gZ46w0LUvhIGNw96zOiY6SAsgeO16uXRZjL6hHaKncz9mGv
 gRpRi3ha0zluger5x4uzbfksEklAif2IKfNR3I3iOjNN8ZYqGKauSCLZMa0s8jT++AU8
 T03HbgIVTZ/Uv48lRXX5X39Y1V09TOMix6rfr0cgxAjrj2KmypZ5KhDFBaXBJ6j6XAeG
 eoAdxV36QhvmPOL4zQIbRiVYc0TaiJERUuvPH68laqXvYUPZ6DeK8NKI1V/eMELF1i5U
 iuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QA2gacsjSb9O8RWGnCdjII3ht0ANX+ui30IfOJeiRQ=;
 b=h5wxTMiNuGg8OJjfwplffGJtf6WxRjFtVbflTUsQeSQjxuL5p9EdiJEmtm0XoWbbhM
 nOxz+PzyjBKjkZYIj/YyQJZskJ+KpU6XK7lPh1QeqQFK/zbJH0m+jyME+ABsYdV574Ik
 1T4qJQhHOyUT1F+AjmigSDFaEpQiEfZPOBgX+3+LpmLPWRATe/21SBczfAx/KZW2RRhk
 oMuQxOW/iWMK4gTSHcX94vbmKy4Va8e3Il96bMpyb0ACWLvZ98ScZcLKbjepOpzpx8EA
 xKDVmO4KCyzSzz5ow1jIHOT0lVWvUziUCR61e85vfyjwa+rOfiEWFEJI8M3YhdtO8GDM
 RoKg==
X-Gm-Message-State: AOAM530W6DtE6k2iRVdaUg6sAVN3pGLOmdIi9O1qcAiBaqwnD+tBKpYG
 HBofPijLCcZyI0+TRQTVa6aB3eOP6E91Ag==
X-Google-Smtp-Source: ABdhPJz23Af8/WpFea9vPKKUUiSGgVWzwQ5SCv2CX7qRu9ipESHuzr6Ad3EGMQiPT/K/RIigR1/NuQ==
X-Received: by 2002:a17:90a:284a:: with SMTP id
 p10mr27140499pjf.198.1621890009134; 
 Mon, 24 May 2021 14:00:09 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id c195sm12354958pfb.144.2021.05.24.14.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 14:00:08 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] dma-buf: add dma_resv_get_singleton_unlocked (v4)
Date: Mon, 24 May 2021 15:59:51 -0500
Message-Id: <20210524205954.872814-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524205954.872814-1-jason@jlekstrand.net>
References: <20210524205954.872814-1-jason@jlekstrand.net>
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
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function to get a single fence representing
all fences in a dma_resv object.

This fence is either the only one in the object or all not
signaled fences of the object in a flatted out dma_fence_array.

v2 (Jason Ekstrand):
 - Take reference of fences both for creating the dma_fence_array and in
   the case where we return one fence.
 - Handle the case where dma_resv_get_list() returns NULL

v3 (Jason Ekstrand):
 - Add an _rcu suffix because it is read-only
 - Rewrite to use dma_resv_get_fences_rcu so it's RCU-safe
 - Add an EXPORT_SYMBOL_GPL declaration
 - Re-author the patch to Jason since very little is left of Christian
   König's original patch
 - Remove the extra fence argument

v4 (Jason Ekstrand):
 - Restore the extra fence argument

v5 (Daniel Vetter):
 - Rename from _rcu to _unlocked since it doesn't leak RCU details to
   the caller
 - Fix docs
 - Use ERR_PTR for error handling rather than an output dma_fence**

v5 (Jason Ekstrand):
 - Drop the extra fence param and leave that to a separate patch

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 93 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  2 +
 2 files changed, 95 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index d6f1ed4cd4d55..312a3a59dac6a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -33,6 +33,8 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -49,6 +51,11 @@
  * write-side updates.
  */
 
+/* deep dive into the fence containers */
+#define dma_fence_deep_dive_for_each(fence, chain, index, head)	\
+	dma_fence_chain_for_each(chain, head)			\
+		dma_fence_array_for_each(fence, index, chain)
+
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
@@ -517,6 +524,92 @@ int dma_resv_get_fences_unlocked(struct dma_resv *obj,
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences_unlocked);
 
+/**
+ * dma_resv_get_singleton_unlocked - get a single fence for the dma_resv object
+ * @obj: the reservation object
+ * @result: resulting dma_fence
+ *
+ * Get a single fence representing all unsignaled fences in the dma_resv object
+ * plus the given extra fence. If we got only one fence return a new
+ * reference to that, otherwise return a dma_fence_array object.
+ *
+ * RETURNS
+ * Returns -NOMEM if allocations fail, zero otherwise.
+ */
+struct dma_fence *dma_resv_get_singleton_unlocked(struct dma_resv *obj)
+{
+	struct dma_fence *result, **resv_fences, *fence, *chain, **fences;
+	struct dma_fence_array *array;
+	unsigned int num_resv_fences, num_fences;
+	unsigned int err, i, j;
+
+	err = dma_resv_get_fences_unlocked(obj, NULL, &num_resv_fences, &resv_fences);
+	if (err)
+		return ERR_PTR(err);
+
+	if (num_resv_fences == 0)
+		return NULL;
+
+	num_fences = 0;
+	result = NULL;
+
+	for (i = 0; i < num_resv_fences; ++i) {
+		dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
+			if (dma_fence_is_signaled(fence))
+				continue;
+
+			result = fence;
+			++num_fences;
+		}
+	}
+
+	if (num_fences <= 1) {
+		result = dma_fence_get(result);
+		goto put_resv_fences;
+	}
+
+	fences = kmalloc_array(num_fences, sizeof(struct dma_fence*),
+			       GFP_KERNEL);
+	if (!fences) {
+		result = ERR_PTR(-ENOMEM);
+		goto put_resv_fences;
+	}
+
+	num_fences = 0;
+	for (i = 0; i < num_resv_fences; ++i) {
+		dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
+			if (!dma_fence_is_signaled(fence))
+				fences[num_fences++] = dma_fence_get(fence);
+		}
+	}
+
+	if (num_fences <= 1) {
+		result = num_fences ? fences[0] : NULL;
+		kfree(fences);
+		goto put_resv_fences;
+	}
+
+	array = dma_fence_array_create(num_fences, fences,
+				       dma_fence_context_alloc(1),
+				       1, false);
+	if (array) {
+		result = &array->base;
+	} else {
+		result = ERR_PTR(-ENOMEM);
+		while (num_fences--)
+			dma_fence_put(fences[num_fences]);
+		kfree(fences);
+	}
+
+put_resv_fences:
+	while (num_resv_fences--)
+		dma_fence_put(resv_fences[num_resv_fences]);
+	kfree(resv_fences);
+
+	return result;
+}
+EXPORT_SYMBOL_GPL(dma_resv_get_singleton_unlocked);
+
 /**
  * dma_resv_wait_timeout_unlocked - Wait on reservation's objects
  * shared and/or exclusive fences.
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 99926680c3964..c529ccee94bc5 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -285,6 +285,8 @@ int dma_resv_get_fences_unlocked(struct dma_resv *obj,
 
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 
+struct dma_fence *dma_resv_get_singleton_unlocked(struct dma_resv *obj);
+
 long dma_resv_wait_timeout_unlocked(struct dma_resv *obj, bool wait_all, bool intr,
 				    unsigned long timeout);
 
-- 
2.31.1

