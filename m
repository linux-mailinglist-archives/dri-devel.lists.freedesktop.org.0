Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E585A49805F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C531710EBD9;
	Mon, 24 Jan 2022 13:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB8610E7DE;
 Mon, 24 Jan 2022 13:03:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w11so1308391wra.4;
 Mon, 24 Jan 2022 05:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dl1dUYcNTDp2GOm0X9C0j70YZVM11w1ghZ3iu9NNtok=;
 b=eU0Way/p0gtmxtdXNwIJ0cJ1YMvpXPNq1X9Q84RaqxsLycEgkYVHdXY4vFIX/Ao5tf
 7bdBaz9m2saCHhtUpfULRrmNtvxumofa4Dt9HUTIE20xH3J2cTnrPgakeYBQAyvlK39x
 Ms4E/NygDlHxoieyBlSf8ypfUr9wBulYBzlwb720y2E4+hQ6MhtPENhfZBYjPEJLWwGn
 CXDckfmUJijLv2Ill6jtZd6lpzr8f4OuCCQLrcDXpXhHXUGxcIibtkmZVIiYt2Om26gc
 yQbiijahJ2z1PqVwSDUla0jKeOvdCIP9zO1AHqdYc2EEwi01knXl9kFyw4giBxZkYVul
 puBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dl1dUYcNTDp2GOm0X9C0j70YZVM11w1ghZ3iu9NNtok=;
 b=cu1YNM9n2eu9UthNGDi/cv/iuFXUqT7y4XFZJPgAXhrPxtdkKOhE3mmLThdm5axHa2
 kgsIDhksWI/0IuWJK0Gq6aybYJ7UcVXSNxvqVBYFsr663q5CsshqGozyRXNKLswlTfBW
 GO4GXpwXHg+mI8qfW55j0ZgiqUpgCbryTmG36HDv/lWv6qnyBIZ9oPYCyXzt/hQ8XXjK
 GhR7Jhj4jUasQ5OmA9VTCG+LBRkFW0q3KCPkHkWD4HWWj6OFQuPM2dq4O0o9GYcT+yZv
 6vItHLYenrnwvcn5Zm9Ht79m4bp+WmLSm3iUCArXUFcxScVoWnYKcw0uLaDG5it0GMxa
 u/QA==
X-Gm-Message-State: AOAM531Sfp7HbVbrIGwvPtaGcHlgb+U0s0Pkej3nhv8uy0/63/NufRlK
 OMXTXpf3cCsTSjQlF8je5fo=
X-Google-Smtp-Source: ABdhPJwAu7+U0MqbGH2TAyInUKLCd01EqoEzOU37D1z1qWDfHgZ+sfo/tjzM3H0sQlkYGj3OC6tkOg==
X-Received: by 2002:a05:6000:1861:: with SMTP id
 d1mr12886342wri.497.1643029418557; 
 Mon, 24 Jan 2022 05:03:38 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 05:03:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/11] dma-buf: Add dma_fence_array_for_each (v2)
Date: Mon, 24 Jan 2022 14:03:24 +0100
Message-Id: <20220124130328.2376-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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
index cb1bacb5a42b..52b85d292383 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -219,3 +219,30 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
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

