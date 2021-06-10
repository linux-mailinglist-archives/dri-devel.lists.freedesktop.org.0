Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC13A357A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376606EDEE;
	Thu, 10 Jun 2021 21:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD5A6EDF6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 21:09:45 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id y11so731250pgp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 14:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfEYaaEsri34UVrh87VwS0D4/LmhE0dmCO8raqQLSuw=;
 b=cb/gUX1UJOj/PkKlET5gPFkh3r8B1l7eq/vXBoU76h8X5HKfVHjrnZWJNkj+Mx8x/X
 tOXQFoIpSreltYZNT2F9xNym2nc0dlmEY3kY6XUwOjm+7psvT+gTu2EWudPVgCo/ZNWl
 rMxDliItRHyV+MMKiAP7rQvcfPcEL/dPB3pQzSF5ZbpBo4eqXP87sLPsm/dFukSK4oU8
 Yby6/E1ld5+9FnX4qzxqD+9ETU+InjsG3SOQdueAOt5TKstN36n5GNuPwmloiEHRiSQm
 hv2p8bfqaKTSF4DCkWWKJPl7LlNuL/gm0XrhRjNjhZ61KznPuXw7hrpsCxY+dtoBfWjZ
 p43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfEYaaEsri34UVrh87VwS0D4/LmhE0dmCO8raqQLSuw=;
 b=U11IsRCivIiv4Ote0smydLaaGJzrnvhBVmFGfwYbPduUv1+PJWgN14vxuZrhYnbY8n
 NeCdAi3/BK7RoUJvRR6Ml+MJUznmbxefB3j9V1JmiOYs+a0GB4xPVjMIuVR1HmHjWhh2
 RESBQPyT12qTZnQUy/jeV2YQEVGgGdUMQebXdj2evYZYmOIlmnWrW589ybzi9X3ZY3Ru
 yN8ZyZwGdOaRBAQaPh8n9coGjC4av75Ht+vmnBbH1b46BmffKbkEL/rF1vC0glnJZJqi
 mg0rS9PPW20FOdj3VFlhqfD5VnkkACb0g2ILDU1PqQ3uO63mWAGW28xDMS45+4g89s1v
 3MdA==
X-Gm-Message-State: AOAM531QUnu6/W2k/PF2vSAWeiHkMFNs+rxLYZLUmrHItf0WrqJvFMEx
 SYv75u9OpUL9JJG6iDabvEEa9dXV6sGlog==
X-Google-Smtp-Source: ABdhPJzdMLblzio68P2D3rWqMqI760FHMjoxLJcI3+LA/JfIJjLoLGGWg/hNlgBaedTs6KZ315Jp1g==
X-Received: by 2002:a63:4653:: with SMTP id v19mr332452pgk.240.1623359384291; 
 Thu, 10 Jun 2021 14:09:44 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id o16sm3145288pfu.75.2021.06.10.14.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:09:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] dma-buf: Add dma_fence_array_for_each (v2)
Date: Thu, 10 Jun 2021 16:09:20 -0500
Message-Id: <20210610210925.642582-2-jason@jlekstrand.net>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
index d3fbd950be944..2ac1afc697d0f 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -201,3 +201,30 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
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
index 303dd712220fd..588ac8089dd61 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -74,6 +74,19 @@ to_dma_fence_array(struct dma_fence *fence)
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
@@ -81,4 +94,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
+struct dma_fence *dma_fence_array_first(struct dma_fence *head);
+struct dma_fence *dma_fence_array_next(struct dma_fence *head,
+				       unsigned int index);
+
 #endif /* __LINUX_DMA_FENCE_ARRAY_H */
-- 
2.31.1

