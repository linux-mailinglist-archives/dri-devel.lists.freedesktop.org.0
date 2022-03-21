Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11674E28CD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF1E10E443;
	Mon, 21 Mar 2022 13:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB5610E443
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r13so5776406wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GdC/vNCWav889+tNSaSoAdeBnC2zPesGZ0txSV3PBkg=;
 b=oRwcDwOn6gqkYxo/zIr3tlXTjA9DfkvSdyq/dmeoKLS72/rwb/GESXvgyATTht4297
 IDDHmJZD5kFrKVoHvL3e3c2CZfVT4LuFo2pAj3vEW/89RDip2u3GKdLpuGQFBdOvrVwH
 J7qLu6KF+SfptCQVPylCf77j007kBrJrb/2Qt5fJSZaaDglCTpa4xr/8HwugedstT+mg
 MUjnxrS8S4vqsYeOTGtEOqVmkfZlaVWOyOj8svU8xyuKxNkeoAtkxihJl5zHdVB2tyG/
 ObWqWt+k9jZ5QqJkCQm76rbGGc9w65hpZWxbh872w5PtNvmBApBgJVw2Nbqh7suxECix
 eQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdC/vNCWav889+tNSaSoAdeBnC2zPesGZ0txSV3PBkg=;
 b=RT4hHpTxi2xjaMs/zZlnsqGVEbwd/107N7/a5ddEM1ldqRoQYY4vYwd9mjgEp0SpUp
 xW//0tdTGXWND8m8MxW2/Joziu+p2jq2HnTN0vqW0jPlEpvh8RwjCUBRk1lHOArOQWxV
 Q+4jdO/uF+XjGap1oRkO7QHXroM7W4929x2r01fMMKS/tXyOycul9b5dxdDkncN0oNa6
 GiH+h9OFcNSG66faTLbjrg7MaWggH5NgrESJKLR1JYhD4PqYnTPu7tnKHtASK2mEXz2Z
 /eqgH7hKeBVrZ3DckutSCfi6FoMbb1yRJjkjpapy2EK2GvRacDsy+6NeLUGjQJBmvJQe
 GLRQ==
X-Gm-Message-State: AOAM530kOW3uqP/H8vRZpG2wqwEkhcPfpNfQTZDh8jAb0jdfYi2qiNWx
 /Ng9ELMwQ2FYWMED900SmBU=
X-Google-Smtp-Source: ABdhPJy8kcci98hWJtwC4cYJOYNciC4/yPQrmSOnvgbmJO2nym7K0WD4V3x0nzPcF7kOiBPiNUc4Bg==
X-Received: by 2002:a5d:4892:0:b0:1ed:beaa:778a with SMTP id
 g18-20020a5d4892000000b001edbeaa778amr18461900wrq.35.1647871147701; 
 Mon, 21 Mar 2022 06:59:07 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/23] dma-buf: drop the DAG approach for the dma_resv object
 v2
Date: Mon, 21 Mar 2022 14:58:44 +0100
Message-Id: <20220321135856.1331-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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

So far we had the approach of using a directed acyclic
graph with the dma_resv obj.

This turned out to have many downsides, especially it means
that every single driver and user of this interface needs
to be aware of this restriction when adding fences. If the
rules for the DAG are not followed then we end up with
potential hard to debug memory corruption, information
leaks or even elephant big security holes because we allow
userspace to access freed up memory.

Since we already took a step back from that by always
looking at all fences we now go a step further and stop
dropping the shared fences when a new exclusive one is
added.

v2: Drop some now superflous documentation

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 16 +---------------
 include/linux/dma-buf.h    |  7 -------
 include/linux/dma-resv.h   | 22 +++++-----------------
 3 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 1c9af97fe904..4b12141579e2 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -358,35 +358,21 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
  * @fence: the exclusive fence to add
  *
  * Add a fence to the exclusive slot. @obj must be locked with dma_resv_lock().
- * Note that this function replaces all fences attached to @obj, see also
- * &dma_resv.fence_excl for a discussion of the semantics.
+ * See also &dma_resv.fence_excl for a discussion of the semantics.
  */
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
 	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
-	struct dma_resv_list *old;
-	u32 i = 0;
 
 	dma_resv_assert_held(obj);
 
-	old = dma_resv_shared_list(obj);
-	if (old)
-		i = old->shared_count;
-
 	dma_fence_get(fence);
 
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(obj->fence_excl, fence);
-	if (old)
-		old->shared_count = 0;
 	write_seqcount_end(&obj->seq);
 
-	/* inplace update, no shared fences */
-	while (i--)
-		dma_fence_put(rcu_dereference_protected(old->shared[i],
-						dma_resv_held(obj)));
-
 	dma_fence_put(old_fence);
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 7ab50076e7a6..74083e62e19d 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -420,13 +420,6 @@ struct dma_buf {
 	 * - Dynamic importers should set fences for any access that they can't
 	 *   disable immediately from their &dma_buf_attach_ops.move_notify
 	 *   callback.
-	 *
-	 * IMPORTANT:
-	 *
-	 * All drivers must obey the struct dma_resv rules, specifically the
-	 * rules for updating fences, see &dma_resv.fence_excl and
-	 * &dma_resv.fence. If these dependency rules are broken access tracking
-	 * can be lost resulting in use after free issues.
 	 */
 	struct dma_resv *resv;
 
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 20e13f36710a..ecb697d4d861 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -93,23 +93,11 @@ struct dma_resv {
 	 *
 	 * The exclusive fence, if there is one currently.
 	 *
-	 * There are two ways to update this fence:
-	 *
-	 * - First by calling dma_resv_add_excl_fence(), which replaces all
-	 *   fences attached to the reservation object. To guarantee that no
-	 *   fences are lost, this new fence must signal only after all previous
-	 *   fences, both shared and exclusive, have signalled. In some cases it
-	 *   is convenient to achieve that by attaching a struct dma_fence_array
-	 *   with all the new and old fences.
-	 *
-	 * - Alternatively the fence can be set directly, which leaves the
-	 *   shared fences unchanged. To guarantee that no fences are lost, this
-	 *   new fence must signal only after the previous exclusive fence has
-	 *   signalled. Since the shared fences are staying intact, it is not
-	 *   necessary to maintain any ordering against those. If semantically
-	 *   only a new access is added without actually treating the previous
-	 *   one as a dependency the exclusive fences can be strung together
-	 *   using struct dma_fence_chain.
+	 * To guarantee that no fences are lost, this new fence must signal
+	 * only after the previous exclusive fence has signalled. If
+	 * semantically only a new access is added without actually treating the
+	 * previous one as a dependency the exclusive fences can be strung
+	 * together using struct dma_fence_chain.
 	 *
 	 * Note that actual semantics of what an exclusive or shared fence mean
 	 * is defined by the user, for reservation objects shared across drivers
-- 
2.25.1

