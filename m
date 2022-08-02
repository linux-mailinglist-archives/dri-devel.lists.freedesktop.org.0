Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E204587F7E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 17:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A69904CE;
	Tue,  2 Aug 2022 15:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011C08DD69;
 Tue,  2 Aug 2022 15:51:50 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id y15so13822949plp.10;
 Tue, 02 Aug 2022 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CHnA8EA1zYWAltmKrCqgpnviThEUlN7Pg3SwIn6d3WM=;
 b=fP9YsqHrJUAD0NhV3Le0o57xbD7BFv8FZLg9ePwdwZdhWLvo+bJrPMJsHOs+QrwnZT
 kjQFGd2MJkmuTw4gjjBn+EG+ipUZv1rH6YMXiSG6DSbGXm1V2pddU1p77Iu9ob8eOJ2A
 mjs7THLbV2gMKVdVE50Jy//J8ZIB16y0tHOWMeIg3wu0ggLUJyMueKJ2V/r73qqyqkI5
 jZW2KiLFaM+Ywt660i2TP2RqIHFCW8gCgBINNLd6FeUtm7jB+2NxHjKZXHadwQCSqNcD
 3PviYFrtJDOsJx5hISLXBqPXBSX/NkBgpPq+lyYahHNrty9wp7NbAI25ttaigACtCYt2
 sRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CHnA8EA1zYWAltmKrCqgpnviThEUlN7Pg3SwIn6d3WM=;
 b=xqTV8KZfsc3paHFrhXoACQsz+FpW1mkHUEhYAnOyXtSMXH/h5wKnF0Rdm58GWcOShB
 iOxVC5Sfb9oDbVrMQthAadIUSn+87nq2zsr4Bv99D7N5kYUUBh/qU6emosRqJk6TmEWw
 F9XB4UsAGlow2xEmLi8YCHqJuJcnw2zTxZwEs78BNPiV4qb05ebpSlArvTT1LHUWPBb2
 6YXKu1Atad6BKKzJx8bI8ujgjtYyZrtwZI3lv1b3mBU7u4/Ikp7S3Vkfo5RsEFSOky8Z
 TMMs8e9M5RBx77PpFH8OI52OmMAhvfU5FEjuoabqQIhrXBCCzryitz5SmN/B4G4m3mT5
 b1bQ==
X-Gm-Message-State: ACgBeo2wIO6EXcKXSnwsMLqZg1SzAqF2KTaLc1TQxG+HdCjAqkENbHDV
 K3jMzJeTGHIFb2WUEkQ9XjrDNPjPAsA=
X-Google-Smtp-Source: AA6agR4MoUqcOxvlaJDRZuPmLwFSY6Z3PzL0UzcR3mDRU/8Zo+wehtehFU9tTUKLFHqqEZIscAs4rQ==
X-Received: by 2002:a17:90b:3149:b0:1f0:3539:e7ae with SMTP id
 ip9-20020a17090b314900b001f03539e7aemr147125pjb.80.1659455509941; 
 Tue, 02 Aug 2022 08:51:49 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a631c12000000b0041c49af8156sm2577055pgc.6.2022.08.02.08.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 08:51:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 12/15] drm/msm/gem: Consolidate shrinker trace
Date: Tue,  2 Aug 2022 08:51:45 -0700
Message-Id: <20220802155152.1727594-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220802155152.1727594-1-robdclark@gmail.com>
References: <20220802155152.1727594-1-robdclark@gmail.com>
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

