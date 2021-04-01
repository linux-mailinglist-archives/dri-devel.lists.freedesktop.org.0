Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82331350BD6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 03:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0731E6EC00;
	Thu,  1 Apr 2021 01:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AEB6EC00;
 Thu,  1 Apr 2021 01:24:04 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so3902849pjb.0; 
 Wed, 31 Mar 2021 18:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsCSqM7YP3RCVWsP5WM5Atj6TW8UyCzrw8pSRQkMoNc=;
 b=LMbTOJkEXOm6POeA3AvN2jWp+gm7OYjAEInVGJH/FBXpQgQexNOAfHPhPH1blrp+Hk
 QfxUXb88N0cw1YHrVpuNOlBjs2SQs4pfqX7CgsNyL9By5Yir/XkzzxoFPDLRzNQm9vXK
 G7MVU+v9lw15hwZfxLV87elkv2gpj0x9gDfnWfvf5F4/uRJw/U1dkjX19wm+/AXQlTnL
 wrj4qnT3SN83ShjI9YUEFf6qsgcElJh10iAodoEJZTbuRRBjrDvJUl/ihho7RDVa0uTx
 /R/efHGHsCCddrUS4tDSCMqDECdYvdrut1Z8vxKVtEV0ICXwwnnoijt7jWhtb2Fs/kW7
 z60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsCSqM7YP3RCVWsP5WM5Atj6TW8UyCzrw8pSRQkMoNc=;
 b=DuLTddt1Wt6hdp1FXo3kS8nscfPG5M5ifi0jUmCGTrO699voKB054GJNZDiN5IaG9A
 92MuNrZtLmQ5OaxnnBct5sG7+D42M8+6gv7V2uxAwBhT1bro4shtXAW0SpJK7Hi84C5b
 4RBDtv7oSWyGbycSpsuzA+yBPo9cDPXIAHWPuMUJ68XPytRmt/lW6VLvPdu7/kKWPsYb
 xy6A258T5TRGLWY8ijDArc2Df0vo2Fkd8G1Qk0PJZG5ust2zMS1uBU//rIc88/6Arek1
 UmZdSc/q0/iiXGnHgeBxgFPcs8L2V2MPhLX/7FMsL/ZXFU4T/g5orLfPlz9iueLZ8UhY
 2NOw==
X-Gm-Message-State: AOAM530DYCCIQ3OlNhMxz4AIkkHxRxhMHTJgKXGk19yRQI+iOWan7lm5
 0J08PsIhVeo+ET9S3816UotiXSqeXt+J8Q==
X-Google-Smtp-Source: ABdhPJy+Ipg5FOivJlIvHzZ6cboe/AYEvu38Avnp5oGumsFN75ULhelm0LN9Knlc4dEZiTXcaaUkhg==
X-Received: by 2002:a17:90a:b293:: with SMTP id
 c19mr6227917pjr.193.1617240243491; 
 Wed, 31 Mar 2021 18:24:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id y12sm3520619pfq.118.2021.03.31.18.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 18:24:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/msm: Improved debugfs gem stats
Date: Wed, 31 Mar 2021 18:27:21 -0700
Message-Id: <20210401012722.527712-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401012722.527712-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
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
 Douglas Anderson <dianders@chromium.org>,
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
Tested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/msm_fb.c  |  3 ++-
 drivers/gpu/drm/msm/msm_gem.c | 31 ++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gem.h | 11 ++++++++++-
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index d42f0665359a..91c0e493aed5 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -33,6 +33,7 @@ static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 {
+	struct msm_gem_stats stats = {};
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
index 7ca30e362222..2ecf7f1cef25 100644
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
+	struct msm_gem_stats stats = {};
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
index e6b28edb1db9..7c7d54bad189 100644
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
