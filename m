Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE857A4F1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F3C91042;
	Tue, 19 Jul 2022 17:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F90C91027;
 Tue, 19 Jul 2022 17:19:14 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so625308pjl.0; 
 Tue, 19 Jul 2022 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFWCPQ026Vm0ssc92OEIjelADHl+en2PNRs5WLmvYxM=;
 b=d5p1DKgFJK5ocgl5j7a/xuyGPSpf9br86Y47dsdKhDlhDTxJ+/teIhBdG43BMWGbnr
 4MrZgmjt95TKM8bURo82WnHISJvEM4B9eQbSfNlPl/GfozUUo5MRiOOML08CowZOaH0j
 rWSnZZ0m6XOzoMgj/Yg+5Dmz/8VdraFVcm87xTBXSmsH/mI5g+LTiU9+1pYmn2MX3y3A
 eAzSi+bQ1l7uQ9AVJMYgDhjsm6A71rrDCKWohDrKthoLBYNQXH8spVWZ52ZXN0WIt/l0
 z2FqSfjcbydBSE50zTJLLqqNSapRUDj3wtmGkJWWbAtnhaInSgL77i4qeWK++tDkmK6L
 l4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFWCPQ026Vm0ssc92OEIjelADHl+en2PNRs5WLmvYxM=;
 b=EB+50iMGiVzZ9O2RxZ3NKYM58rIeXrCIdnSxtZ9YSoRS+Z119SR8M4f9WFDuOZS+l2
 z2btGnG6p5huxML/qDvAzIPfkvsdtDIu8te8tI+S3yKNiICp3hBrU5Pn2qEaM4Y0pGG4
 SilitMnFP4NR9CfUU2zTCgp4d9yMrfMirAYniQMrgQRVV31ophUxSCNb/H4g/IpQnCBI
 G2lhQ0h21cjehssVLY+87tXFMe9ucsHB7+p6hvp2pVRd3fSEiKxWLHO/7cNxrSNBUbSE
 BCkh/F6TsfUGMvG9/pi3nYqJuVUu9PVGIrnkQaO3pr/igzfcDKiyPuQ6V9a/80j+DfJw
 5hww==
X-Gm-Message-State: AJIora+R11qmdQODoigXriOUMcRTAi2j9ZWHwvdYuHtuGneoZo6eQMVA
 uRpg3TOVw0+6I3xffVtonL6AKJWErSs=
X-Google-Smtp-Source: AGRyM1vMj72JXulUYuZJFzA60brwT7i+vZCtisHt/9lNHjAaA9i6+14x189DXlhP36gp/RDvXviHKg==
X-Received: by 2002:a17:90a:e7cd:b0:1f0:2304:f579 with SMTP id
 kb13-20020a17090ae7cd00b001f02304f579mr417553pjb.212.1658251153211; 
 Tue, 19 Jul 2022 10:19:13 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y20-20020aa79af4000000b00518764d09cdsm11816762pfp.164.2022.07.19.10.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:19:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/13] drm/msm/gem: Evict active GEM objects when necessary
Date: Tue, 19 Jul 2022 10:18:57 -0700
Message-Id: <20220719171900.289265-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719171900.289265-1-robdclark@gmail.com>
References: <20220719171900.289265-1-robdclark@gmail.com>
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

v2: Check for __GFP_ATOMIC before blocking

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 70 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gpu_trace.h    | 16 +++---
 2 files changed, 68 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5cc05d669a08..f31054d25314 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -24,6 +24,13 @@ static bool can_swap(void)
 	return enable_eviction && get_nr_swap_pages() > 0;
 }
 
+static bool can_block(struct shrink_control *sc)
+{
+	if (sc->gfp_mask & __GFP_ATOMIC)
+		return false;
+	return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
+}
+
 static unsigned long
 msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
@@ -65,26 +72,65 @@ evict(struct drm_gem_object *obj)
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

