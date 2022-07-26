Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169358191A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6A010F495;
	Tue, 26 Jul 2022 17:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8E79639D;
 Tue, 26 Jul 2022 17:50:49 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id y141so13841452pfb.7;
 Tue, 26 Jul 2022 10:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHnA8EA1zYWAltmKrCqgpnviThEUlN7Pg3SwIn6d3WM=;
 b=F60WIj/uTtME9EX4c1JB2hRYNKbac6fm2EIYX3+LEqk9HDAoxblwEjxWP8gDTeyR7K
 FcIVdOs44c7rUVmROw1XvQ5kkiASj6gY8JzClMhW/GhajiHp4kMQXdkj0xmMixUIfwg0
 J5ffyOVozmJavK8q4rFo0Nf/5r397Gtn+8Elryh34p16FsubXvntjOHtXzF2YBi3auJ6
 uRY7Zz4Ri9uc94DM+GWiUUhiEHj8rOr/vTw/jf2JtnpK6UrFupXG9J2nqR2Wue9g3N/q
 ZMbyr24GOVhhpw+x9ycN60ndr5PbZGUZZibIj0+LD0FaudrSLb3vDpmpar+IVoYXjKQy
 eltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHnA8EA1zYWAltmKrCqgpnviThEUlN7Pg3SwIn6d3WM=;
 b=qvVsPOFIJUCoDIC5jJLvEhHmcsDoc3LKsPNwLuZAjjMWpdujTW/9dU1psvUSbVow5G
 z8XWKansXq8rH5cqsVEGoV0ZDqL5YLlbXZNdXrfLpvkUTpjF66JPT6mqv9NmynkUchfM
 qcEC32QkbcOacNBTzpxT0O8+ZgEDqsx+tMhFVHilmizC6xr4F0h062rsaE2Z3btaLpr4
 bZLpY7UTxeEW9x7x17iTssfXKeESYtDvrFzdxKK6CyT8FOa+wvgepPj4pUGiENx2fR2F
 dWIURK1EekSplokcK70QFhL64ZsLaQFbjLNdS00qDe7BYOM5ztXoEuQ7AQ7CCMTIWZCr
 JlfA==
X-Gm-Message-State: AJIora/yVsVdXJu95TX3VduUaRFbw9HkFK0o9OPBga0wPPIgl7/A4ca6
 KYpl9Rq7N3zfhT8tZG3tacjcsE1dB/E=
X-Google-Smtp-Source: AGRyM1vGrRy1t9T5ipbkSuK1HJLICCwsiZge34eMCXypdQMGhFjj9tVKMIKDlefv/7ztUb0cTrdlPg==
X-Received: by 2002:a05:6a00:1590:b0:52a:eb00:71dc with SMTP id
 u16-20020a056a00159000b0052aeb0071dcmr18651904pfk.64.1658857848447; 
 Tue, 26 Jul 2022 10:50:48 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090322d000b0016c4fb6e0b2sm12067334plg.55.2022.07.26.10.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:50:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 12/15] drm/msm/gem: Consolidate shrinker trace
Date: Tue, 26 Jul 2022 10:50:36 -0700
Message-Id: <20220726175043.1027731-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726175043.1027731-1-robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
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

