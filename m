Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5B54144A2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F776EB29;
	Wed, 22 Sep 2021 09:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAE56EB26;
 Wed, 22 Sep 2021 09:10:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t18so4878175wrb.0;
 Wed, 22 Sep 2021 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x1EZ5a4Rj+mMoRpUgqbEak+dkFTY6Kg0AbX6Tr4henc=;
 b=h8VEXI8FtHJUIs0xvutWhwZLAUkIPPy+fZHUxGI8jominFn4K2uAo+OOhxp5KrREGJ
 1s6GpJxNEkQoNuK2kUSAXlb8dOH6rdkxBX05yHIuSyD9IK0eCmorG5iYlCfboZrg1RcT
 dFSr4GVev781Y9k/iHQVSsEKGCnG8jlqveTfZAiKrreXc0ZKOz9dsoY25bPYYSHJBPLM
 hRcb9E4AG59CQr7eJa8EUNfnLu4vXGJMtDZU2dCstJlc8FTNhGwaG8nm7Mb/UaAsFWUd
 I1VMpGaqfJlk52UhvM81DIMEGSCVcFcCoMtQWWNUKBP19iVifk8s9jMPxV0s1b+LPRn/
 wg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x1EZ5a4Rj+mMoRpUgqbEak+dkFTY6Kg0AbX6Tr4henc=;
 b=L+M2IaTptPXyVIfPBgVQxClsfRR9Eh/cTK7jPgnpwK7V4HcZmXt6dMuZ4fNaENt8uH
 bwMmIUHUA5ZN8JJQLYW/lh6O7lHYQsa45Hqkyt5F+u82MyOwkQNyvrwxN2A7WiqiTgMi
 V5/wUPqu8V8xbQcmaDdSrFYrteNZoX7C7DC+EWK/wejC3Ndk11NsuiPCvBXxaGGYniRc
 EahS3Cn01fsTEkAJzD/TFZ/DBHyZA6rO9mW4nPVVnEjoaAhog4Hd0PvfvimcNjWt/OZA
 twMlflWlU3PL9/txYhNkcIUaGLBpOQpIhIk7Kn89sYN+r4UvbzsYuF/EtEE/sZScWV5R
 a9kw==
X-Gm-Message-State: AOAM532G8nXLmw3XsksnCCjG0euJj7IPYnjcg/ZTMUFfV+TNCtNtilZ9
 mX0wgCo0HyWOUYT9v4cWiS4=
X-Google-Smtp-Source: ABdhPJzs/97yw4TFKRKBsWt51mE3mq/Rn9g2gAXwmlCJN6bIqBT/0jw5dDGN0WIz74bXMbVW8fPsLg==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr40409206wrd.24.1632301847810; 
 Wed, 22 Sep 2021 02:10:47 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:10:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v4
Date: Wed, 22 Sep 2021 11:10:19 +0200
Message-Id: <20210922091044.2612-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

Abstract the complexity of iterating over all the fences
in a dma_resv object.

The new loop handles the whole RCU and retry dance and
returns only fences where we can be sure we grabbed the
right one.

v2: fix accessing the shared fences while they might be freed,
    improve kerneldoc, rename _cursor to _iter, add
    dma_resv_iter_is_exclusive, add dma_resv_iter_begin/end

v3: restructor the code, move rcu_read_lock()/unlock() into the
    iterator, add dma_resv_iter_is_restarted()

v4: fix NULL deref when no explicit fence exists, drop superflous
    rcu_read_lock()/unlock() calls.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 95 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 95 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 84fbe60629e3..7768140ab36d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,101 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_iter_restart_unlocked - restart the unlocked iterator
+ * @cursor: The dma_resv_iter object to restart
+ *
+ * Restart the unlocked iteration by initializing the cursor object.
+ */
+static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
+{
+	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
+	cursor->index = -1;
+	if (cursor->all_fences)
+		cursor->fences = dma_resv_shared_list(cursor->obj);
+	else
+		cursor->fences = NULL;
+	cursor->is_restarted = true;
+}
+
+/**
+ * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
+ * @cursor: cursor to record the current position
+ *
+ * Return all the fences in the dma_resv object which are not yet signaled.
+ * The returned fence has an extra local reference so will stay alive.
+ * If a concurrent modify is detected the whole iterration is started over again.
+ */
+static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
+{
+	struct dma_resv *obj = cursor->obj;
+
+	do {
+		/* Drop the reference from the previous round */
+		dma_fence_put(cursor->fence);
+
+		if (cursor->index++ == -1) {
+			cursor->fence = dma_resv_excl_fence(obj);
+
+		} else if (!cursor->fences ||
+			   cursor->index >= cursor->fences->shared_count) {
+			cursor->fence = NULL;
+
+		} else {
+			struct dma_resv_list *fences = cursor->fences;
+			unsigned int idx = cursor->index;
+
+			cursor->fence = rcu_dereference(fences->shared[idx]);
+		}
+		if (cursor->fence)
+			cursor->fence = dma_fence_get_rcu(cursor->fence);
+	} while (cursor->fence && dma_fence_is_signaled(cursor->fence));
+}
+
+/**
+ * dma_resv_iter_first_unlocked - first fence in an unlocked dma_resv obj.
+ * @cursor: the cursor with the current position
+ *
+ * Returns the first fence from an unlocked dma_resv obj.
+ */
+struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
+{
+	rcu_read_lock();
+	do {
+		dma_resv_iter_restart_unlocked(cursor);
+		dma_resv_iter_walk_unlocked(cursor);
+	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
+	rcu_read_unlock();
+
+	return cursor->fence;
+}
+EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
+
+/**
+ * dma_resv_iter_next_unlocked - next fence in an unlocked dma_resv obj.
+ * @cursor: the cursor with the current position
+ *
+ * Returns the next fence from an unlocked dma_resv obj.
+ */
+struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
+{
+	bool restart;
+
+	rcu_read_lock();
+	cursor->is_restarted = false;
+	restart = read_seqcount_retry(&cursor->obj->seq, cursor->seq);
+	do {
+		if (restart)
+			dma_resv_iter_restart_unlocked(cursor);
+		dma_resv_iter_walk_unlocked(cursor);
+		restart = true;
+	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
+	rcu_read_unlock();
+
+	return cursor->fence;
+}
+EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 9100dd3dc21f..baf77a542392 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -149,6 +149,101 @@ struct dma_resv {
 	struct dma_resv_list __rcu *fence;
 };
 
+/**
+ * struct dma_resv_iter - current position into the dma_resv fences
+ *
+ * Don't touch this directly in the driver, use the accessor function instead.
+ */
+struct dma_resv_iter {
+	/** @obj: The dma_resv object we iterate over */
+	struct dma_resv *obj;
+
+	/** @all_fences: If all fences should be returned */
+	bool all_fences;
+
+	/** @fence: the currently handled fence */
+	struct dma_fence *fence;
+
+	/** @seq: sequence number to check for modifications */
+	unsigned int seq;
+
+	/** @index: index into the shared fences */
+	unsigned int index;
+
+	/** @fences: the shared fences */
+	struct dma_resv_list *fences;
+
+	/** @is_restarted: true if this is the first returned fence */
+	bool is_restarted;
+};
+
+struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
+struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
+
+/**
+ * dma_resv_iter_begin - initialize a dma_resv_iter object
+ * @cursor: The dma_resv_iter object to initialize
+ * @obj: The dma_resv object which we want to iterator over
+ * @all_fences: If all fences should be returned or just the exclusive one
+ */
+static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
+				       struct dma_resv *obj,
+				       bool all_fences)
+{
+	cursor->obj = obj;
+	cursor->all_fences = all_fences;
+	cursor->fence = NULL;
+}
+
+/**
+ * dma_resv_iter_end - cleanup a dma_resv_iter object
+ * @cursor: the dma_resv_iter object which should be cleaned up
+ *
+ * Make sure that the reference to the fence in the cursor is properly
+ * dropped.
+ */
+static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
+{
+	dma_fence_put(cursor->fence);
+}
+
+/**
+ * dma_resv_iter_is_exclusive - test if the current fence is the exclusive one
+ * @cursor: the cursor of the current position
+ *
+ * Returns true if the currently returned fence is the exclusive one.
+ */
+static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
+{
+	return cursor->index == -1;
+}
+
+/**
+ * dma_resv_iter_is_restarted - test if this is the first fence after a restart
+ * @cursor: the cursor with the current position
+ *
+ * Return true if this is the first fence in an interation after a restart.
+ */
+static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
+{
+	return cursor->is_restarted;
+}
+
+/**
+ * dma_resv_for_each_fence_unlocked - unlocked fence iterator
+ * @cursor: a struct dma_resv_iter pointer
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object without holding the
+ * &dma_resv.lock and using RCU instead. The cursor needs to be initialized
+ * with dma_resv_iter_begin() and cleaned up with dma_resv_iter_end(). Inside
+ * the iterator a reference to the dma_fence is hold and the RCU lock dropped.
+ * When the dma_resv is modified the iteration starts over again.
+ */
+#define dma_resv_for_each_fence_unlocked(cursor, fence)			\
+	for (fence = dma_resv_iter_first_unlocked(cursor);		\
+	     fence; fence = dma_resv_iter_next_unlocked(cursor))
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-- 
2.25.1

