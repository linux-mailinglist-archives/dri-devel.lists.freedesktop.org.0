Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BDE55AD3D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1C610F365;
	Sat, 25 Jun 2022 22:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CA310F387;
 Sat, 25 Jun 2022 22:55:39 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id h192so5677280pgc.4;
 Sat, 25 Jun 2022 15:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HjlEl5/qplLjRvIbiPqkIivzE1Th3OTP/5G9Lv59zyE=;
 b=E72ZEUw2YWzfnLk/27KVEoTDLtge0CRcNEoC/mqAONxPi0JsNZ9fiBOe0IY5kajcqH
 g6FKr24mvvmRaE4vOTYx0IioJJV9qhGmbxjgSFu4ERDCpHUIMLoviOT1269r6jNHkKVa
 ESbrTtC4Uh9t1QvGXKl7tZmIv2VKBNlg17fsS9drKz4J2nc8c9KZIueB50wz9KFLEXo1
 gXFEiHWWvdXmAQ9nOjKG2Cq3WHO/VMmr5HvQxJLnemyqDsA7KNigLXrf9zqWw8ovAF5v
 DPp+AeWSifVAyylX5Vs7XVxF36vWDJePqPIe6csHg8E4istzhhrxWncSQUZ6vvXIxs5v
 r+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HjlEl5/qplLjRvIbiPqkIivzE1Th3OTP/5G9Lv59zyE=;
 b=WJ+gvYOXZ7B5jpQVdNAdzgCiA8Yy7nhnP74XI0CG+GUKxjFpzo6KOeX95/KBB1Fm69
 oauGtAPoI1iXA1rDuHcpBnRWarg6xNvnrH4iN+IrwQHYMTID/99a/bVseYcUB06rWYFn
 p+KjpjuLkf0Ll5SW6p+Cxqg80K6dFi+RVrVcFFC0n8ITyWb6NZ4JSuxD2jh14gX99DW5
 VPZl05DYkA4NRdVX428RvjkEUfaZUFWAb9dQ0NfJpooI9VgmQszNDNjlIyq/sYaFgEDF
 zZfSXo/G6gzQzUqjtXiUQjnnbCOb9jU2FR5mSQpk4HDEDJfNcypMMHYTCFO3ncR1Se35
 mccg==
X-Gm-Message-State: AJIora8N7RkUSbmQwsOb7Tocf3bjOBFoJSSQN0jIX6RUkYvSHeBzz6zF
 5RnHQM/L3hlrjbvxUkTSYB1rifyAxrE=
X-Google-Smtp-Source: AGRyM1vCt6HT5LWm6qTqal3dUZABGCG9BONuwExyWOu7jF0JXgiSJ8MGot8F0KRFX0PO9YNBj6xmiw==
X-Received: by 2002:a63:1d04:0:b0:40d:a3e5:aa3a with SMTP id
 d4-20020a631d04000000b0040da3e5aa3amr5320398pgd.248.1656197738487; 
 Sat, 25 Jun 2022 15:55:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a62e813000000b005252adb89b3sm4137123pfi.32.2022.06.25.15.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:55:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/15] drm/msm/gem: Evict active GEM objects when necessary
Date: Sat, 25 Jun 2022 15:54:50 -0700
Message-Id: <20220625225454.81039-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625225454.81039-1-robdclark@gmail.com>
References: <20220625225454.81039-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If we are under enough memory pressure, we should stall waiting for
active buffers to become idle in order to evict.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 68 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gpu_trace.h    | 16 +++---
 2 files changed, 66 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5cc05d669a08..b0bee040432a 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -24,6 +24,11 @@ static bool can_swap(void)
 	return enable_eviction && get_nr_swap_pages() > 0;
 }
 
+static bool can_block(struct shrink_control *sc)
+{
+	return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
+}
+
 static unsigned long
 msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
@@ -65,26 +70,65 @@ evict(struct drm_gem_object *obj)
 	return true;
 }
 
+static bool
+wait_for_idle(struct drm_gem_object *obj)
+{
+	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	return dma_resv_wait_timeout(obj->resv, usage, false, 1000) > 0;
+}
+
+static bool
+active_purge(struct drm_gem_object *obj)
+{
+	if (!wait_for_idle(obj))
+		return false;
+
+	return purge(obj);
+}
+
+static bool
+active_evict(struct drm_gem_object *obj)
+{
+	if (!wait_for_idle(obj))
+		return false;
+
+	return evict(obj);
+}
+
 static unsigned long
 msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
+	struct {
+		struct drm_gem_lru *lru;
+		bool (*shrink)(struct drm_gem_object *obj);
+		bool cond;
+		unsigned long freed;
+	} stages[] = {
+		/* Stages of progressively more aggressive/expensive reclaim: */
+		{ &priv->lru.dontneed, purge,        true },
+		{ &priv->lru.willneed, evict,        can_swap() },
+		{ &priv->lru.dontneed, active_purge, can_block(sc) },
+		{ &priv->lru.willneed, active_evict, can_swap() && can_block(sc) },
+	};
 	long nr = sc->nr_to_scan;
-	unsigned long freed, purged, evicted = 0;
-
-	purged = drm_gem_lru_scan(&priv->lru.dontneed, nr, purge);
-	nr -= purged;
-
-	if (can_swap() && nr > 0) {
-		evicted = drm_gem_lru_scan(&priv->lru.willneed, nr, evict);
-		nr -= evicted;
+	unsigned long freed = 0;
+
+	for (unsigned i = 0; (nr > 0) && (i < ARRAY_SIZE(stages)); i++) {
+		if (!stages[i].cond)
+			continue;
+		stages[i].freed =
+			drm_gem_lru_scan(stages[i].lru, nr, stages[i].shrink);
+		nr -= stages[i].freed;
+		freed += stages[i].freed;
 	}
 
-	freed = purged + evicted;
-
-	if (freed)
-		trace_msm_gem_shrink(sc->nr_to_scan, purged, evicted);
+	if (freed) {
+		trace_msm_gem_shrink(sc->nr_to_scan, stages[0].freed,
+				     stages[1].freed, stages[2].freed,
+				     stages[3].freed);
+	}
 
 	return (freed > 0) ? freed : SHRINK_STOP;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 8867fa0a0306..ac40d857bc45 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -116,22 +116,26 @@ TRACE_EVENT(msm_gmu_freq_change,
 
 
 TRACE_EVENT(msm_gem_shrink,
-		TP_PROTO(u32 nr_to_scan, u32 purged, u32 evicted),
-		TP_ARGS(nr_to_scan, purged, evicted),
+		TP_PROTO(u32 nr_to_scan, u32 purged, u32 evicted,
+			 u32 active_purged, u32 active_evicted),
+		TP_ARGS(nr_to_scan, purged, evicted, active_purged, active_evicted),
 		TP_STRUCT__entry(
 			__field(u32, nr_to_scan)
 			__field(u32, purged)
 			__field(u32, evicted)
+			__field(u32, active_purged)
+			__field(u32, active_evicted)
 			),
 		TP_fast_assign(
 			__entry->nr_to_scan = nr_to_scan;
 			__entry->purged = purged;
 			__entry->evicted = evicted;
+			__entry->active_purged = active_purged;
+			__entry->active_evicted = active_evicted;
 			),
-		TP_printk("nr_to_scan=%u pages, purged=%u pages, evicted=%u pages",
-			  __entry->nr_to_scan,
-			  __entry->purged,
-			  __entry->evicted)
+		TP_printk("nr_to_scan=%u pg, purged=%u pg, evicted=%u pg, active_purged=%u pg, active_evicted=%u pg",
+			  __entry->nr_to_scan, __entry->purged, __entry->evicted,
+			  __entry->active_purged, __entry->active_evicted)
 );
 
 
-- 
2.36.1

