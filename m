Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446BC6C152B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B56910E5AD;
	Mon, 20 Mar 2023 14:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F66D10E5A7;
 Mon, 20 Mar 2023 14:44:47 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id h8so12646977plf.10;
 Mon, 20 Mar 2023 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=weYL3fqvUQCe/MGsBiphMuUm7IiUfAgwOkX0hsG5azI=;
 b=XoB4+mM4oASSRnco8nkZwARRG9zcXJcuiyLTtkB1/Em3LEQ2A1GcFBX4c9QpNQQF1j
 NODZTXwBb1ZsRgqzzncmT68xS+JsVOMXu4/yL4tqZacnngCN5gnrIyIgLpg67GCQaWu2
 3RGsxmBtiA8aCU5oOdtb6AigAsxMRRyYT/P3Xh3WrVDvz6jvLttylpc7USgWWQ44GVqe
 rYzg55l+AaLbimu//o2q7VRZZJ2UA2rlR+D7WRutg8GbWIEPrBcIPRitI3OqhFoohqaA
 20Pha7DZD60SGbvPicWbg+l+r5k+WAzhnRYWrhfrBafJ9eHbu4hwWd94ZwQX/0whZg/7
 88jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=weYL3fqvUQCe/MGsBiphMuUm7IiUfAgwOkX0hsG5azI=;
 b=6IF75KjvG8j+CrL5d+quqcLqsyjymTcLa2Iv/kVUHRUTnolJ2KK1HF3ZxVtFW0ny7d
 Dh47N4Kc+wgMWOFmLe1KoWDzseGXOtVkQQ1OAJ9aFDxZKTZiQFvyBWLzJ/nDsptfvQjb
 /PrLPBn6jssH9Zkn4az3AM2VzVWaJcrlwnTSLJ5AYVytoKxLDhOyHd+951lsdU0g1Q9J
 qmRA7KofkyhEb63JsaY5kLdl2QSOQwCNPO0KUDCyM/QXFUid7Ag0Y5ldYo/QOpzmDmvo
 Dqfz09P4e4ZM6C3279i5WezCghIJiN3q4iQQCaRazqJovtaddpnY73fgT7UhylTHaM6L
 t4jg==
X-Gm-Message-State: AO0yUKVuDsRbSAx6EzcLEe3xKqXNVxPG+SMySlLJ++jDVNS2y4qwO3A8
 6cDY8ZT7u7Uypi7X8+eop3G4l8k2Aqg=
X-Google-Smtp-Source: AK7set/q6mxFL2SNpoyCJqlGoIsp6zXx5THF6Tar0/8ALnqXrSzyWxWyrmITe8Cih+IgIxzET11mjA==
X-Received: by 2002:a17:902:d2ca:b0:19d:1c6e:d31e with SMTP id
 n10-20020a170902d2ca00b0019d1c6ed31emr21226848plc.60.1679323487099; 
 Mon, 20 Mar 2023 07:44:47 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a170902934700b0019d397b0f18sm6777259plp.214.2023.03.20.07.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/23] drm/msm/gem: Avoid obj lock in job_run()
Date: Mon, 20 Mar 2023 07:43:31 -0700
Message-Id: <20230320144356.803762-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that everything that controls which LRU an obj lives in *except* the
backing pages is protected by the LRU lock, add a special path to unpin
in the job_run() path, we we are assured that we already have backing
pages and will not be racing against eviction (because the GEM object's
dma_resv contains the fence that will be signaled when the submit/job
completes).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        | 44 +++++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem.h        |  1 +
 drivers/gpu/drm/msm/msm_ringbuffer.c |  4 +--
 3 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d0ac3e704b66..9628e8d8dd02 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -61,18 +61,14 @@ static void sync_for_cpu(struct msm_gem_object *msm_obj)
 	dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
 }
 
-static void update_lru_locked(struct drm_gem_object *obj)
+static void update_lru_active(struct drm_gem_object *obj)
 {
 	struct msm_drm_private *priv = obj->dev->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	msm_gem_assert_locked(&msm_obj->base);
-
-	if (!msm_obj->pages) {
-		GEM_WARN_ON(msm_obj->pin_count);
+	GEM_WARN_ON(!msm_obj->pages);
 
-		drm_gem_lru_move_tail_locked(&priv->lru.unbacked, obj);
-	} else if (msm_obj->pin_count) {
+	if (msm_obj->pin_count) {
 		drm_gem_lru_move_tail_locked(&priv->lru.pinned, obj);
 	} else if (msm_obj->madv == MSM_MADV_WILLNEED) {
 		drm_gem_lru_move_tail_locked(&priv->lru.willneed, obj);
@@ -83,6 +79,22 @@ static void update_lru_locked(struct drm_gem_object *obj)
 	}
 }
 
+static void update_lru_locked(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	msm_gem_assert_locked(&msm_obj->base);
+
+	if (!msm_obj->pages) {
+		GEM_WARN_ON(msm_obj->pin_count);
+
+		drm_gem_lru_move_tail_locked(&priv->lru.unbacked, obj);
+	} else {
+		update_lru_active(obj);
+	}
+}
+
 static void update_lru(struct drm_gem_object *obj)
 {
 	struct msm_drm_private *priv = obj->dev->dev_private;
@@ -489,6 +501,24 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
 	mutex_unlock(&priv->lru.lock);
 }
 
+/* Special unpin path for use in fence-signaling path, avoiding the need
+ * to hold the obj lock by only depending on things that a protected by
+ * the LRU lock.  In particular we know that that we already have backing
+ * and and that the object's dma_resv has the fence for the current
+ * submit/job which will prevent us racing against page eviction.
+ */
+void msm_gem_unpin_active(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	mutex_lock(&priv->lru.lock);
+	msm_obj->pin_count--;
+	GEM_WARN_ON(msm_obj->pin_count < 0);
+	update_lru_active(obj);
+	mutex_unlock(&priv->lru.lock);
+}
+
 struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
 					   struct msm_gem_address_space *aspace)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0057e8e8fa13..2bd6846c83a9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -128,6 +128,7 @@ struct msm_gem_object {
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
+void msm_gem_unpin_active(struct drm_gem_object *obj);
 struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
 					   struct msm_gem_address_space *aspace);
 int msm_gem_get_iova(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 31b4fbf96c36..b60199184409 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -24,9 +24,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
 		msm_gem_vma_unpin_fenced(submit->bos[i].vma, fctx);
-		msm_gem_lock(obj);
-		msm_gem_unpin_locked(obj);
-		msm_gem_unlock(obj);
+		msm_gem_unpin_active(obj);
 		submit->bos[i].flags &= ~(BO_VMA_PINNED | BO_OBJ_PINNED);
 	}
 
-- 
2.39.2

