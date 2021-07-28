Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087A43D8528
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729906EBAA;
	Wed, 28 Jul 2021 01:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B526EC1D;
 Wed, 28 Jul 2021 01:03:08 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id j1so2616893pjv.3;
 Tue, 27 Jul 2021 18:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVHgu7P3jLeGAr6c6jiQnBbjUeZUVb7sIei9a5S3h4I=;
 b=dmWlM3T2LTqYy+3H7Q8IfXYrQN8RtqxpPMlevHLVCKuFDRXvD+T+ZwM1TEK8pW+Prr
 6We5ubyhg7wYLfcKM7vgq1QwH2ynVHcNz42fMHHpdb85J4mJ4H8MiDEFrPSlr3+SZi10
 g2bJG+tjik8SeuWOlGdOMhTMaS87qaCYNZCNQt5n/KRc6+fac0XyP9OxDXJiNY1m/KoX
 qF9/C0/hzfJlUUS1jWDSsdmxhIPBM5vHNwaoM73gz+i37bWb8PUg25S6Fldj3T8URgi2
 bDCoi6Fth0RGOqR1e2dkngEMW42co8gvjqn+xhqXBo2BQucSSedGkvhbJO0TlwV3t4R6
 tv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVHgu7P3jLeGAr6c6jiQnBbjUeZUVb7sIei9a5S3h4I=;
 b=NKAtlnuTM9B7lp2nEFDTa11whCM+dUL/hO2qOvlka6Y6sMhj2k8R3C219tlQ/Zo1Nr
 0ZpQ4NZEfxI8vp9WQSJUoK6hGg70R8Op3arkCtPgnMZXhwULJnVa7gWfBth/tEhU2dzd
 s9VUtAiqY9aqG9M0NXeNeGAzihiL5yHVZzpP270qtG7G5hoD2yK9jh7l+XuyTaZuDuUA
 tSVK+fRRXCV1MmMlLWq5kCTxLEDEtpsp+wRDoVBkftOKrPyvXViph3SGqSjp9wUfGCHz
 XQgHY1dZ/ETmgpiWOGouFrA+XjNofmg4FrxVYgwqMcOAEpKgtiOirpnuNpSvoQVofYb+
 OJ4w==
X-Gm-Message-State: AOAM53238NINq88d3QE1YAzHyUtQ1abNX/XfNGJWb5l+GTjx+FnedKpR
 z92ejk40PODGprtvlHqzg+4RI0nBudY44A==
X-Google-Smtp-Source: ABdhPJwLyM6C8RCSNxp9Lhz/fnnARR2n+2V3Q+Mr/oYE0qAQEOLNDhvtsm35CD5Ys48fSh0eT5pTGA==
X-Received: by 2002:a17:902:8bc3:b029:124:919f:6213 with SMTP id
 r3-20020a1709028bc3b0290124919f6213mr21425743plo.51.1627434187298; 
 Tue, 27 Jul 2021 18:03:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 1sm4926456pfv.138.2021.07.27.18.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:03:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 13/13] drm/msm/gem: Mark active before pinning
Date: Tue, 27 Jul 2021 18:06:18 -0700
Message-Id: <20210728010632.2633470-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Mark all the bos in the submit as active, before pinning, to prevent
evicting a buffer in the same submit to make room for a buffer earlier
in the table.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  2 --
 drivers/gpu/drm/msm/msm_gem_submit.c | 28 ++++++++++++++++++++--------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index af199ef53d2f..15b1804fa64e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -131,7 +131,6 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
 			sync_for_device(msm_obj);
 
-		GEM_WARN_ON(msm_obj->active_count);
 		update_inactive(msm_obj);
 	}
 
@@ -815,7 +814,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 	GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 	GEM_WARN_ON(msm_obj->dontneed);
-	GEM_WARN_ON(!msm_obj->sgt);
 
 	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c2ecec5b11c4..fc25a85eb1ca 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -24,7 +24,8 @@
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
 #define BO_VALID    0x8000   /* is current addr in cmdstream correct/valid? */
 #define BO_LOCKED   0x4000   /* obj lock is held */
-#define BO_PINNED   0x2000   /* obj is pinned and on active list */
+#define BO_ACTIVE   0x2000   /* active refcnt is held */
+#define BO_PINNED   0x1000   /* obj is pinned and on active list */
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		struct msm_gpu *gpu,
@@ -239,10 +240,11 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	struct drm_gem_object *obj = &submit->bos[i].obj->base;
 	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
-	if (flags & BO_PINNED) {
+	if (flags & BO_PINNED)
 		msm_gem_unpin_iova_locked(obj, submit->aspace);
+
+	if (flags & BO_ACTIVE)
 		msm_gem_active_put(obj);
-	}
 
 	if (flags & BO_LOCKED)
 		dma_resv_unlock(obj->resv);
@@ -252,7 +254,7 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
 {
-	submit_cleanup_bo(submit, i, BO_PINNED | BO_LOCKED);
+	submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE | BO_LOCKED);
 
 	if (!(submit->bos[i].flags & BO_VALID))
 		submit->bos[i].iova = 0;
@@ -356,6 +358,18 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 
 	submit->valid = true;
 
+	/*
+	 * Increment active_count first, so if under memory pressure, we
+	 * don't inadvertently evict a bo needed by the submit in order
+	 * to pin an earlier bo in the same submit.
+	 */
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+
+		msm_gem_active_get(obj, submit->gpu);
+		submit->bos[i].flags |= BO_ACTIVE;
+	}
+
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 		uint64_t iova;
@@ -367,8 +381,6 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		msm_gem_active_get(obj, submit->gpu);
-
 		submit->bos[i].flags |= BO_PINNED;
 
 		if (iova == submit->bos[i].iova) {
@@ -502,7 +514,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_PINNED;
+		cleanup_flags |= BO_PINNED | BO_ACTIVE;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
@@ -520,7 +532,7 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
 		msm_gem_lock(obj);
-		submit_cleanup_bo(submit, i, BO_PINNED);
+		submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE);
 		msm_gem_unlock(obj);
 		drm_gem_object_put(obj);
 	}
-- 
2.31.1

