Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C332494EE9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2095110E7FD;
	Thu, 20 Jan 2022 13:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DC410E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:27:54 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so13702752wms.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hl1UMcxmP8FLB7cw6V/gbH+Ejf4SrQDiUJfaKHttF6Q=;
 b=Txl7wMMQ3BoEO4cPZl65D2wlNQrEaK4pg0+zuA1PPU6G2IraDAOZgenSijzgUfH8ch
 hH4J7nAzlyeNUQ76HSSrQrMW+YztkehT47S4LVl30rX+9pAwQmt8OyQcxh7XyIs2akct
 O6hn5yQm+C/OwbBpSMipNOf0ovonJdoQWRTjij8cj1SiouhPengkWdEX4nrLtFCs6r57
 JpDRp0jBrEU9i7x5uxV+ze4zk3iZ7SX8sHAQ+xmz2+rqF0gn5eWBnFhIusL1EJveprxE
 +PAHBejnZeM/34u3Cn6xt++/px/V6XbWxIeMvwwGpFl6+QLqWiVBhUMIHklmONALkKIj
 a9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hl1UMcxmP8FLB7cw6V/gbH+Ejf4SrQDiUJfaKHttF6Q=;
 b=EUHKq8hYYOy3cYOCPp5vKQRJ6MyXlvbCn0OyUDa0CXLpbGfLAsJqCoITIJ3o1T3WEY
 /9TJJ4Um/kaFumeceySrgZX5tQ6blG+jgh5bDp8BCe7CRdk8S1Rp+pqBNifUhsqtsC6E
 +khQ8vXfyFcV0TEuT+UNmiXQiX6Ou/LcaM8CMJTyRVMTvkDZSqU3wYkKYYx6akw5XMna
 AJDR2MUbYc69+yuImsWRVzo8iDOUqjF9cRs4rCip1olLGfIOhxIdokgEaYGQMkSwixrC
 1a1F3aOAbRcYqNIFB351IJHUGY/wnQUd9ps8Fks0TijHXIT+WSZyBhF0Z4wRN9tymuFU
 R0Xg==
X-Gm-Message-State: AOAM533UTD5AK9oLZLrUZUGpJN9rNeTYMDBIiZ/qVQ4kC0Dak0O+evjJ
 EB1NWj3u94TX6AguNlEKsyA=
X-Google-Smtp-Source: ABdhPJwUUA420JOIPmLu0OB5fMKudNXZNoroit0+VxJhZJ3dVkASmGV6wlLZ7btbcydXz4OaXnNu5w==
X-Received: by 2002:a05:6000:1886:: with SMTP id
 a6mr29359225wri.158.1642685273502; 
 Thu, 20 Jan 2022 05:27:53 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:27:53 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 5/9] dma-buf: Add dma_fence_array_for_each (v2)
Date: Thu, 20 Jan 2022 14:27:43 +0100
Message-Id: <20220120132747.2348-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Add a helper to iterate over all fences in a dma_fence_array object.

v2 (Jason Ekstrand)
 - Return NULL from dma_fence_array_first if head == NULL.  This matches
   the iterator behavior of dma_fence_chain_for_each in that it iterates
   zero times if head == NULL.
 - Return NULL from dma_fence_array_next if index > array->num_fences.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
 include/linux/dma-fence-array.h   | 17 +++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 4bfbcb885bbc..eb517b3914f7 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -218,3 +218,30 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
 	return true;
 }
 EXPORT_SYMBOL(dma_fence_match_context);
+
+struct dma_fence *dma_fence_array_first(struct dma_fence *head)
+{
+	struct dma_fence_array *array;
+
+	if (!head)
+		return NULL;
+
+	array = to_dma_fence_array(head);
+	if (!array)
+		return head;
+
+	return array->fences[0];
+}
+EXPORT_SYMBOL(dma_fence_array_first);
+
+struct dma_fence *dma_fence_array_next(struct dma_fence *head,
+				       unsigned int index)
+{
+	struct dma_fence_array *array = to_dma_fence_array(head);
+
+	if (!array || index >= array->num_fences)
+		return NULL;
+
+	return array->fences[index];
+}
+EXPORT_SYMBOL(dma_fence_array_next);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index fec374f69e12..e34dcb0bb462 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -61,6 +61,19 @@ to_dma_fence_array(struct dma_fence *fence)
 	return container_of(fence, struct dma_fence_array, base);
 }
 
+/**
+ * dma_fence_array_for_each - iterate over all fences in array
+ * @fence: current fence
+ * @index: index into the array
+ * @head: potential dma_fence_array object
+ *
+ * Test if @array is a dma_fence_array object and if yes iterate over all fences
+ * in the array. If not just iterate over the fence in @array itself.
+ */
+#define dma_fence_array_for_each(fence, index, head)			\
+	for (index = 0, fence = dma_fence_array_first(head); fence;	\
+	     ++(index), fence = dma_fence_array_next(head, index))
+
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
 					       u64 context, unsigned seqno,
@@ -68,4 +81,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
+struct dma_fence *dma_fence_array_first(struct dma_fence *head);
+struct dma_fence *dma_fence_array_next(struct dma_fence *head,
+				       unsigned int index);
+
 #endif /* __LINUX_DMA_FENCE_ARRAY_H */
-- 
2.25.1

