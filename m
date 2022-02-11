Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ADF4B264D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9B510EBD8;
	Fri, 11 Feb 2022 12:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEF010EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:17 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id eg42so16284117edb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Yay/VxJwhQ+6QL2I4LYhz/KfSYkFqXmsl3nlTDInv5M=;
 b=VU+hTo5oKOnYsyAbBzArPTNcH6+3Q11UJAofYKxXCrzMF6EirPfgvZdGTx8d+w+Uha
 BykO2UtGUZH/NmcdzWBknRVJi/UgYPJe0Wy59A4RtqK16k6d/9rik9+D1x4HnYqDtOKZ
 tw0rQYF9z3Z1dA0c7brnbnOYfKVGZ03cON7N7w8LheggvoIRqzu6yfseXynTVz3W4c6L
 0bSbGxDVO//HdvfZaJINbAgPG68INoKTwmI/LX5M7tvEYMHEMPPG5R4Yndrc3VY2Dsu5
 rtfqNBoEmSYNfKa/qKg+79Y0Kc5jfvn2VkMJt50A3dVZn1H7itVSzxoJRDTNLRbMqoRt
 YWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yay/VxJwhQ+6QL2I4LYhz/KfSYkFqXmsl3nlTDInv5M=;
 b=5HEVr0MsvVB61tpRuHE6zFbQkH66K5DTGUkl7mhVSdOyAKpjdJkuEjyF4YkreBEEHK
 4j8mBQeOnGxe9JH5XT0M84QJ60VKvCmGvqARi2h+MZ8PGxTQ9bClKFoZe/cXUB4Mzhrs
 cpB8MAxFuPZ2vjHi96x80o6YY374IolP5jTLvpXckNm/cKr1syQeuk2uIfB/0/OVJQmF
 xXVRYVoKu4G3B85xkZvEqx3W6a5jNNSmjlbihcX2jss+XH8VDugTOXosxe4zAGBea1s4
 S+pXmWPEVEOifKBHOUEaFs/3vACZv2/Xh5BgbdRIRX7hf9bdYetwahMNaRvrTWwhdoSF
 uJXw==
X-Gm-Message-State: AOAM533PGSGAvun5zdWEfcK9sa325hz2AqL9oMiCYnxwTxd5qfE35JDe
 mENnMBS/RmeZUdAPbllyBAg=
X-Google-Smtp-Source: ABdhPJzkbbqjaVbLwDQgYTyZZgWqwnOiZRzk8w0uZp3Ag5aOWaG7Qp7RVhB+66V+1eceh465wjH+BA==
X-Received: by 2002:a05:6402:43ca:: with SMTP id
 p10mr1731206edc.212.1644583816092; 
 Fri, 11 Feb 2022 04:50:16 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:15 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 11/23] dma-buf: drop the DAG approach for the dma_resv object
Date: Fri, 11 Feb 2022 13:49:51 +0100
Message-Id: <20220211125003.918447-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 16 +---------------
 include/linux/dma-resv.h   | 22 +++++-----------------
 2 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 16ad98fd3130..e04afc30bc0a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -356,35 +356,21 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
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

