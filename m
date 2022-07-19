Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D60D57A4FB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B33E91045;
	Tue, 19 Jul 2022 17:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FBC90FAD;
 Tue, 19 Jul 2022 17:19:11 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 72so14108304pge.0;
 Tue, 19 Jul 2022 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHnA8EA1zYWAltmKrCqgpnviThEUlN7Pg3SwIn6d3WM=;
 b=HxFXlJDplzmQ2h/eoq6VJ/iQz8QcdeHyWrbrzwhVTrHkT+aZsj4LrYOJI4xQGBFmU6
 RouW14uwgHYnEdzj6Y4Pz3AC8GzDNnlJhfzkMrRYxR/xMMEM7+XDnZxXBnbo6V+dPBsx
 NasDy4uAilmDAEIf6ESpgA7njGtQ08CI+Vp5V6otgcfCJtBeFYnjFcT5iFbwKIP6P5u5
 el2UCwnKnDyfJVZk/2Ym01QDp4ehgPlEG+YZ9NXbTQQgUQSikrILZ5KsEftO2kQEFBhm
 2YujfFtgO3zo0xGUFyCTWpUQkzhD2V6ZLCLe2+CNa5KPB3sRPMu8pdb4Etys5QiJoHdS
 8LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHnA8EA1zYWAltmKrCqgpnviThEUlN7Pg3SwIn6d3WM=;
 b=Wsx/qk8c9WCzMf6DqZEwEXsZQw7kg8desvXCQNAarPhu0nWBKEfBQN9e8/vuEHJOAG
 XrlXidlmqhizoYRvrl8gdpjgwLvSgyZQjA8t4tgTKAolFTqsYpd9XKl303yz8B4UuqHT
 5Nz4nz3an1OXCAwED6uLenWyVbBh4wp3ZyXGkQQ2U3WvkVKhm0KjgY21S0waIhEfQ02z
 lUYVL1uFqvDLf4kfe7wjVdXB3fr5d1d0KfwMFqF1iAM/sfPzL8SnxbNjrrVBhunF0Yvu
 0rVBWQCm+la5gNJHKujK0Y5C/r82I5p9L/Mxdi/6n56xiOE2a7I7wgFGSLc0W9RPkww7
 lKfA==
X-Gm-Message-State: AJIora/i1twxjtRC9+kAGzj8uUvxajwyafA+RkZ6+fAuTNfn75TQkNDi
 Lshe7zfvEzhE+Zr2BHz4tTx9C94wkV8=
X-Google-Smtp-Source: AGRyM1ubRokMAdpxe40b/813XmRiTeKXFGokevdqztUpJ9LNB9bYSUN0s9MvgeWiCmxv4t/tGZlG4A==
X-Received: by 2002:a63:ff66:0:b0:412:6f4c:1e11 with SMTP id
 s38-20020a63ff66000000b004126f4c1e11mr30096810pgk.396.1658251150723; 
 Tue, 19 Jul 2022 10:19:10 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b005252433bdbdsm12175346pfd.95.2022.07.19.10.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:19:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/13] drm/msm/gem: Consolidate shrinker trace
Date: Tue, 19 Jul 2022 10:18:56 -0700
Message-Id: <20220719171900.289265-13-robdclark@gmail.com>
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

Combine separate trace events for purge vs evict into one.  When we add
support for purging/evicting active buffers we'll just add more info
into this one trace event, rather than adding a bunch more events.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 19 ++++++---------
 drivers/gpu/drm/msm/msm_gpu_trace.h    | 32 +++++++++++---------------
 2 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 530b1102b46d..5cc05d669a08 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -71,25 +71,20 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
 	long nr = sc->nr_to_scan;
-	unsigned long freed;
+	unsigned long freed, purged, evicted = 0;
 
-	freed = drm_gem_lru_scan(&priv->lru.dontneed, nr, purge);
-	nr -= freed;
-
-	if (freed > 0)
-		trace_msm_gem_purge(freed << PAGE_SHIFT);
+	purged = drm_gem_lru_scan(&priv->lru.dontneed, nr, purge);
+	nr -= purged;
 
 	if (can_swap() && nr > 0) {
-		unsigned long evicted;
-
 		evicted = drm_gem_lru_scan(&priv->lru.willneed, nr, evict);
 		nr -= evicted;
+	}
 
-		if (evicted > 0)
-			trace_msm_gem_evict(evicted << PAGE_SHIFT);
+	freed = purged + evicted;
 
-		freed += evicted;
-	}
+	if (freed)
+		trace_msm_gem_shrink(sc->nr_to_scan, purged, evicted);
 
 	return (freed > 0) ? freed : SHRINK_STOP;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index ca0b08d7875b..8867fa0a0306 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -115,29 +115,23 @@ TRACE_EVENT(msm_gmu_freq_change,
 );
 
 
-TRACE_EVENT(msm_gem_purge,
-		TP_PROTO(u32 bytes),
-		TP_ARGS(bytes),
+TRACE_EVENT(msm_gem_shrink,
+		TP_PROTO(u32 nr_to_scan, u32 purged, u32 evicted),
+		TP_ARGS(nr_to_scan, purged, evicted),
 		TP_STRUCT__entry(
-			__field(u32, bytes)
+			__field(u32, nr_to_scan)
+			__field(u32, purged)
+			__field(u32, evicted)
 			),
 		TP_fast_assign(
-			__entry->bytes = bytes;
+			__entry->nr_to_scan = nr_to_scan;
+			__entry->purged = purged;
+			__entry->evicted = evicted;
 			),
-		TP_printk("Purging %u bytes", __entry->bytes)
-);
-
-
-TRACE_EVENT(msm_gem_evict,
-		TP_PROTO(u32 bytes),
-		TP_ARGS(bytes),
-		TP_STRUCT__entry(
-			__field(u32, bytes)
-			),
-		TP_fast_assign(
-			__entry->bytes = bytes;
-			),
-		TP_printk("Evicting %u bytes", __entry->bytes)
+		TP_printk("nr_to_scan=%u pages, purged=%u pages, evicted=%u pages",
+			  __entry->nr_to_scan,
+			  __entry->purged,
+			  __entry->evicted)
 );
 
 
-- 
2.36.1

