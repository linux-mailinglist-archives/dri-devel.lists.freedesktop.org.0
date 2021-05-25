Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55056390B2A
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 23:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DAE6EB50;
	Tue, 25 May 2021 21:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362046EB4D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 21:18:07 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d16so24585685pfn.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AL5uNnVtUk1C+mH/6NWLJWmNdaxYP0PjQJbDEuxpySk=;
 b=Ips17hc7MmLO98L0dy/V0AU1V8nE0dVv+kG0bCGj7sw+lKob4YKDVH3SnE7SlXOTs9
 ovBF76lHY2xIt1dJkpVr/BWyLolgE+D7zCwDUqwy2vw8JLDFdLPPA9lDn0bfxGEuXL02
 nUmgX6P+xwUuB+IcNpuVEJEx1diCAnveB/E1Ia3cNUpc6RB9aW3O2REA+fNv5VaKuFHy
 4N/TCoLUGpT4ZRhEnMzE4uWBzdWpBKKbZc4dMZ9OC/2OvaGk49J5V/1+yTxw7bgM3/vk
 Tgi6MM46bN06NQfz4DZ2wUm642M/jr+MSWg+vDLcrgsx8s+0ch4FqmHKLL+09hHU26qc
 QWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AL5uNnVtUk1C+mH/6NWLJWmNdaxYP0PjQJbDEuxpySk=;
 b=DARpfhg74I6pepc5gZFPULd+IKAp3UI6m8OMiZyEtsrwy1XkIkt9sKMx/zLCg1a9q8
 0BX3E5RhiY67oom0aEKiEkDmkP8wZEBtF/gW+F3oDufe10EiUBv1XH4ga5TT05zDmZN6
 fQD9TUUiTZxW6hjNRokCYYo922CBLfs17MfHhBvfPWU5/6lZXPs5ZI8iOZZ0wFhiOWb4
 U8xexn5swJnpvED7+MzajXIHGeBpR3mS8+JbiihYbpoPDHUvrqIaKowMgPLMyDsqFFyQ
 h+eQMGbbISWn2xsEVsBJTV2jB3lVpVbWnzA16N7Z0rA27nS0z9B3J8hug2dJLoHdGbVK
 Cn4A==
X-Gm-Message-State: AOAM5312tqrOTMSmFVlAtYlwoIcvrPIcVEbKSlseMMvfT3NuomGbBWIH
 CPp9IcGNksCybWudVNRdIuThNSfEZh1bfA==
X-Google-Smtp-Source: ABdhPJxncSd9JR6bFaeenqN0OOWlRPCuzBhpn4lfcwfCHKIL+Cg/qQq3nO4vOihovDpDz6VCpwh94Q==
X-Received: by 2002:a63:224d:: with SMTP id t13mr21209550pgm.283.1621977486263; 
 Tue, 25 May 2021 14:18:06 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id e186sm14342278pfa.145.2021.05.25.14.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 14:18:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/7] dma-buf: Add dma_resv_get_singleton_unlocked (v5)
Date: Tue, 25 May 2021 16:17:49 -0500
Message-Id: <20210525211753.1086069-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525211753.1086069-1-jason@jlekstrand.net>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
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
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-resv.c | 92 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  2 +
 2 files changed, 94 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index d6f1ed4cd4d55..23db2181c8ad8 100644
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
 
@@ -517,6 +524,91 @@ int dma_resv_get_fences_unlocked(struct dma_resv *obj,
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences_unlocked);
 
+/**
+ * dma_resv_get_singleton_unlocked - get a single fence for the dma_resv object
+ * @obj: the reservation object
+ *
+ * Get a single fence representing all unsignaled fences in the dma_resv object
+ * plus the given extra fence. If we got only one fence return a new
+ * reference to that, otherwise return a dma_fence_array object.
+ *
+ * RETURNS
+ * The singleton dma_fence on success or an ERR_PTR on failure
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
index 99cfb7af966b8..c5fa09555eca5 100644
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

