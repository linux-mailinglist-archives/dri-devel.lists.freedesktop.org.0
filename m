Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D63A357B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4DD6EDEF;
	Thu, 10 Jun 2021 21:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC30C6EDEF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 21:09:46 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id v11so1711993ply.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 14:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4fPE5Sx2h6McvFTYLoODKxJxEcCsANcHt+fbkGFhYQ=;
 b=VHhvSEQgWC/D2FHUDo95Gf2GWe3nJ/NxwtnUDUqPTfElplTPa/FVVP7jdROZmWmfr3
 +KjoedsA5skC73sbSB6eDpybf+hAtXrvzDUP6k92KoU4BSVxa/rB4ZcJdsnsiPa8SS0B
 HQL1to6P5wgq5RnETHegd5hig7px6OTdHGhzVpvT/CSPBk/3J8zfjnSfHkQh3Iv/J77Z
 dpSa6kLXLdyqdP9nVq7/+w6ro5VWBSLLO7yteVKxhX4SZFsxiFj1O+bRyZubl0246FbG
 gX/xI5Ng8nYsKem8t5n98X6yCmewH9d7vyCKqLAlmTi4ACp2nk4ewmPulOyC1x3j2TBv
 na9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4fPE5Sx2h6McvFTYLoODKxJxEcCsANcHt+fbkGFhYQ=;
 b=EVKfdeO/GhhC1HmcPqLh+tv6ZiCCyXuAxGO3fflZ8YujwnDVWVabyu4d0N8HWBAUhu
 ViFtFb1rvT6c2aS1T+BNveqrgm/22Q7KpTGvLLXC9U4P9Yh2luGJJL7ldyOmjRX6jfYt
 w5uwSY4vrnEyZ/rNUemlPZ8hEA7RQR3Z4opz/howE44ybIyjw5RUxrubJ4sMlOg3dhKJ
 wohwGtNuGnDNHe/ze1uPYD0feqeWTmDEUXS8bER69KLc4Xgz8GZGscBjIuEpW3x7y6K8
 H27RqqcAU/CRtV0AxtVsSFX3GobYKEoJhJ1hdi/7mtd+jBPachHkYFu4mikLl7/y7mCL
 nV4g==
X-Gm-Message-State: AOAM533pEXSd3WIHVGdeJnJ62fnPC8u5CxtFD0olhumGODooELJyXzDk
 s3zvU4y31da6gX2Gn/Bxf45PYFDlY44lsg==
X-Google-Smtp-Source: ABdhPJwJueevL19aJJQenqO8j9D0AMYvcELFy/Nisb3vkhhEvdutekX651HkBKDtEQxL3WaX+ljoKg==
X-Received: by 2002:a17:90b:3749:: with SMTP id
 ne9mr5166863pjb.77.1623359386091; 
 Thu, 10 Jun 2021 14:09:46 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id o16sm3145288pfu.75.2021.06.10.14.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:09:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] dma-buf: Add dma_resv_get_singleton (v6)
Date: Thu, 10 Jun 2021 16:09:21 -0500
Message-Id: <20210610210925.642582-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610210925.642582-1-jason@jlekstrand.net>
References: <20210610210925.642582-1-jason@jlekstrand.net>
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

v6 (Jason Ekstrand):
 - Rename to dma_resv_get_singleton to match the new naming convention
   for dma_resv helpers which work without taking a lock.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-resv.c | 91 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  1 +
 2 files changed, 92 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f26c71747d43a..1b26aa7e5d81c 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -34,6 +34,8 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -50,6 +52,10 @@
  * write-side updates.
  */
 
+#define dma_fence_deep_dive_for_each(fence, chain, index, head)	\
+	dma_fence_chain_for_each(chain, head)			\
+		dma_fence_array_for_each(fence, index, chain)
+
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
@@ -495,6 +501,91 @@ int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
+/**
+ * dma_resv_get_singleton - get a single fence for the dma_resv object
+ * @obj: the reservation object
+ *
+ * Get a single fence representing all unsignaled fences in the dma_resv object
+ * plus the given extra fence. If we got only one fence return a new
+ * reference to that, otherwise return a dma_fence_array object.
+ *
+ * RETURNS
+ * The singleton dma_fence on success or an ERR_PTR on failure
+ */
+struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
+{
+	struct dma_fence *result, **resv_fences, *fence, *chain, **fences;
+	struct dma_fence_array *array;
+	unsigned int num_resv_fences, num_fences;
+	unsigned int err, i, j;
+
+	err = dma_resv_get_fences(obj, NULL, &num_resv_fences, &resv_fences);
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
+	fences = kmalloc_array(num_fences, sizeof(struct dma_fence *),
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
+EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
+
 /**
  * dma_resv_wait_timeout - Wait on reservation's objects
  * shared and/or exclusive fences.
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 562b885cf9c3d..d60982975a786 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -275,6 +275,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 			unsigned *pshared_count, struct dma_fence ***pshared);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
+struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
-- 
2.31.1

