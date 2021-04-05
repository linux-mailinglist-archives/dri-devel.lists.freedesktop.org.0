Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11835462D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 19:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454DC89EBB;
	Mon,  5 Apr 2021 17:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2414389EBD;
 Mon,  5 Apr 2021 17:42:15 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id y32so5382533pga.11;
 Mon, 05 Apr 2021 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tgo9D0hje3g+WF3fE8utkvq2AhTGNUmeDw54h5VPmLM=;
 b=rj7smkgnlpLC/bTHiifDMhJrEeJ89AG1HOeRjIFbjIs7Lv6uu6et9szKj5V9gH3DuJ
 LUU2GeBZfoq3BnTAUZXy0cOvMNCHLB2Dh7XysYM+46tfZfFbPuqXdP2CkdhxVrxVRNf7
 LYWiSptv6sucT44AMh0VnEffS8tnz5xVTnCKDgybWHNti8+U4yzFMIQEn4bW91xaNNUQ
 z1vPOVM/hgffT6ZaLaI8iNiPYHAuGDh4fdt4qHsFiWY/C5PmEQP/rSm/CD+gY6bEkDDA
 Vnizln7kX3+PD8ISt/LtfG/oMlLNPbIJ2tZyshxwd0aL1NsOZkmUNjIaTY2jx9FqjTFR
 bz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tgo9D0hje3g+WF3fE8utkvq2AhTGNUmeDw54h5VPmLM=;
 b=YVItUBcZ2vwzAp8VG2YAl3LTU/cAwGxC0sJqzDKQ7QOpDiHpo7oFaXrwerOgEknD1A
 T8/mSX6eRm/4Ov0wXiAmW6R9naoqm86EXUb6sylk9hFNOPeQTBcx0wBjqgYgOofxUD8G
 vMETanqvcha4FZRqLXTDL+yBmcYC4Bh8aOVs87Btr/LcUfcAch6LVsgsn1kazrxJXyYH
 LZooKbI6kqTwG96wQER3RNcRn01yoFaDTTM1ZBn0ER405pMfXRlQTJ97KSUBCrJtB/l4
 XtcM3KtNtwXRPzgtsRXBlaEfoG92S4cSK38PVTvfdt++HN8t3kN0F397Oy1qHbuN8D2F
 a/Lg==
X-Gm-Message-State: AOAM5327uRrpYECRAQjiZMOZJm1XxUbSf/fhtGR9+Gy/j5pH/8ZbSgAa
 8DQmU38eU//iJrMe7wR4VEKUjo4Nc3E5WA==
X-Google-Smtp-Source: ABdhPJz6fKeO/l5QlHXYUTnnn6zgKzUbJ7cRbP+y9uy9gEdCqgJHFfHw4BPwA5IULkeOGOVPN4Bxiw==
X-Received: by 2002:a63:2e47:: with SMTP id u68mr24203990pgu.6.1617644534048; 
 Mon, 05 Apr 2021 10:42:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 hi21sm92676pjb.36.2021.04.05.10.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 10:42:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/msm: Add $debugfs/gem stats on resident objects
Date: Mon,  5 Apr 2021 10:45:28 -0700
Message-Id: <20210405174532.1441497-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Currently nearly everything, other than newly allocated objects which
are not yet backed by pages, is pinned and resident in RAM.  But it will
be nice to have some stats on what is unpinned once that is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 7 +++++++
 drivers/gpu/drm/msm/msm_gem.h | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5f0647adc29d..9ff37904ec2b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -902,6 +902,11 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		stats->active.size += obj->size;
 	}
 
+	if (msm_obj->pages) {
+		stats->resident.count++;
+		stats->resident.size += obj->size;
+	}
+
 	switch (msm_obj->madv) {
 	case __MSM_MADV_PURGED:
 		stats->purged.count++;
@@ -991,6 +996,8 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 			stats.all.count, stats.all.size);
 	seq_printf(m, "Active:   %4d objects, %9zu bytes\n",
 			stats.active.count, stats.active.size);
+	seq_printf(m, "Resident: %4d objects, %9zu bytes\n",
+			stats.resident.count, stats.resident.size);
 	seq_printf(m, "Purgable: %4d objects, %9zu bytes\n",
 			stats.purgable.count, stats.purgable.size);
 	seq_printf(m, "Purged:   %4d objects, %9zu bytes\n",
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 917af526a5c5..e13a9301b616 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -162,13 +162,13 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt);
 __printf(2, 3)
 void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
-#ifdef CONFIG_DEBUG_FS
 
+#ifdef CONFIG_DEBUG_FS
 struct msm_gem_stats {
 	struct {
 		unsigned count;
 		size_t size;
-	} all, active, purgable, purged;
+	} all, active, resident, purgable, purged;
 };
 
 void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
