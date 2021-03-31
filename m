Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110B350A04
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 00:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A916EB91;
	Wed, 31 Mar 2021 22:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC7F6EB93;
 Wed, 31 Mar 2021 22:13:17 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so3689340pjb.1; 
 Wed, 31 Mar 2021 15:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/twVewUEHRioHtwiz9JjKLdI4rytxuZV+JNSuxYf/A=;
 b=WwURcB28j30FEOBVX61hypudWbMEaSI0SPCjCFg3LEMQNSTJBpOJt0xXo9i7IJucYu
 uMr6ch5qdCs49e0SXlmOPiJkHgQV1lcWSvFjHLJC9xbb2yK0SFxwGtYdAlEzGRwwqt+L
 Slcj5HazN/XCIFbivaBdz3ahiYXcfM7VFod+nhVvf3CpzymOaEJoQbuAjESvyhx40vVX
 lC5opp8VoghrCd8/Mu5As/Lv6th9hRQjSxJMjv7fO1WGGciLzKiEg6fP3ZUj0XtjtcSG
 d4++1YQjxHvtXNaQpceIe+2dl2wyaEtMDMcM9UXesrTf50cIUPZXqOnhawQI3W4nNRbC
 g93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/twVewUEHRioHtwiz9JjKLdI4rytxuZV+JNSuxYf/A=;
 b=uDHj/4dBHX0oO9b/WE1NBquKVr+tBDAEgE9O5/4RCWn90te4/UN132Xk5bofOA+dEJ
 7pTjTddXqHSy2Z1+xHge2tX7h9wreQ8QOwBWLG9xGxidqZ26K84mGvXnkso3JWf6CPRj
 3uQ+QS1IxwR01Ny2KabiX/WkTJwzsT1tMlpNtrHEvY2stPldxjOPJ6IpVVxT+H3qhJ25
 uqCZPRmRntciqRQhMKjKRMctEYE9R/s4WzZAJHBfR5YNp37ga4ZhydohVdJGHCh0kGTR
 NPlz5rHmA3JDLKfvGIMzxLlJAKHpvQoWzLpG+UKN0sgUrZBmXuN15up8RwuUbpyWkTlM
 FWYA==
X-Gm-Message-State: AOAM532AckOETJJB1katvTFB1VWgw0cGUsizo5nutBBDU9oH48Xo2DrP
 PkwCDheNzas+qNJrNXTE+Q5emltadWDurw==
X-Google-Smtp-Source: ABdhPJz7YvnCdiObstGy4frdYqsgQZf0N+9zQpN9bIuPBWCZbWrOD/8axN4t8KnNzU6hiZaBnEsRmQ==
X-Received: by 2002:a17:90b:4910:: with SMTP id
 kr16mr5481383pjb.26.1617228796563; 
 Wed, 31 Mar 2021 15:13:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 c26sm3302052pfo.97.2021.03.31.15.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 15:13:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm: Improved debugfs gem stats
Date: Wed, 31 Mar 2021 15:16:29 -0700
Message-Id: <20210331221630.488498-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The last patch lost the breakdown of active vs inactive GEM objects in
$debugfs/gem.  But we can add some better stats to summarize not just
active vs inactive, but also purgable/purged to make up for that.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fb.c  |  3 ++-
 drivers/gpu/drm/msm/msm_gem.c | 31 ++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gem.h | 11 ++++++++++-
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index d42f0665359a..887172a10c9a 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -33,6 +33,7 @@ static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 {
+	struct msm_gem_stats stats = {{0}};
 	int i, n = fb->format->num_planes;
 
 	seq_printf(m, "fb: %dx%d@%4.4s (%2d, ID:%d)\n",
@@ -42,7 +43,7 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 	for (i = 0; i < n; i++) {
 		seq_printf(m, "   %d: offset=%d pitch=%d, obj: ",
 				i, fb->offsets[i], fb->pitches[i]);
-		msm_gem_describe(fb->obj[i], m);
+		msm_gem_describe(fb->obj[i], m, &stats);
 	}
 }
 #endif
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c184ea68a6d0..a933ca5dc6df 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -873,7 +873,8 @@ static void describe_fence(struct dma_fence *fence, const char *type,
 				fence->seqno);
 }
 
-void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
+void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
+		struct msm_gem_stats *stats)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
@@ -885,11 +886,23 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 
 	msm_gem_lock(obj);
 
+	stats->all.count++;
+	stats->all.size += obj->size;
+
+	if (is_active(msm_obj)) {
+		stats->active.count++;
+		stats->active.size += obj->size;
+	}
+
 	switch (msm_obj->madv) {
 	case __MSM_MADV_PURGED:
+		stats->purged.count++;
+		stats->purged.size += obj->size;
 		madv = " purged";
 		break;
 	case MSM_MADV_DONTNEED:
+		stats->purgable.count++;
+		stats->purgable.size += obj->size;
 		madv = " purgeable";
 		break;
 	case MSM_MADV_WILLNEED:
@@ -956,20 +969,24 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 
 void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 {
+	struct msm_gem_stats stats = {{0}};
 	struct msm_gem_object *msm_obj;
-	int count = 0;
-	size_t size = 0;
 
 	seq_puts(m, "   flags       id ref  offset   kaddr            size     madv      name\n");
 	list_for_each_entry(msm_obj, list, node) {
 		struct drm_gem_object *obj = &msm_obj->base;
 		seq_puts(m, "   ");
-		msm_gem_describe(obj, m);
-		count++;
-		size += obj->size;
+		msm_gem_describe(obj, m, &stats);
 	}
 
-	seq_printf(m, "Total %d objects, %zu bytes\n", count, size);
+	seq_printf(m, "Total:    %4d objects, %9zu bytes\n",
+			stats.all.count, stats.all.size);
+	seq_printf(m, "Active:   %4d objects, %9zu bytes\n",
+			stats.active.count, stats.active.size);
+	seq_printf(m, "Purgable: %4d objects, %9zu bytes\n",
+			stats.purgable.count, stats.purgable.size);
+	seq_printf(m, "Purged:   %4d objects, %9zu bytes\n",
+			stats.purged.count, stats.purged.size);
 }
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 49956196025e..43510ac070dd 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,7 +158,16 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 __printf(2, 3)
 void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
 #ifdef CONFIG_DEBUG_FS
-void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m);
+
+struct msm_gem_stats {
+	struct {
+		unsigned count;
+		size_t size;
+	} all, active, purgable, purged;
+};
+
+void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
+		struct msm_gem_stats *stats);
 void msm_gem_describe_objects(struct list_head *list, struct seq_file *m);
 #endif
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
