Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 705484EB65F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684AB10F1A3;
	Tue, 29 Mar 2022 23:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF8F10F184;
 Tue, 29 Mar 2022 23:00:40 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id i11so7658835plg.12;
 Tue, 29 Mar 2022 16:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=05mUL8FeeCXWVDafJ6OfP4ybn8WOOy9jUdlt3AmYSNs=;
 b=fKlNNMkRV9JAJa79pLSdfzUYCRGcD2eqa/6dszKIqzDMEHLBcyjO++1LjW/eFp/d85
 cLG+Qxyx+izd2WvoLiOystHb9xH8HK6HefT8MshJoSItT/k3fH4TUojKmE9qajEpCa/D
 8vSVQEPzSiyWyueiXy5y4bLwGtz+ZYQAHEoilQTubwQJNYxudbJRyR/zpkMN46b2umlf
 Q58od5hRDOY4q6DK9gR8zhSU0++cjSG39+dSQrGJNb3Ojvk13azYoVE8TDPFtLUfjjBb
 pilXGg+c5mXBY2Exqk9S90BXEyKrQ1macZaIydQJRVIEdwpjWH11Pbr4QMjncSMF3J6Y
 /nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05mUL8FeeCXWVDafJ6OfP4ybn8WOOy9jUdlt3AmYSNs=;
 b=0/nRa2x6kfgMMzXEGYpmKiqSgmuEVY3+xeaRxBGlWotXQMOgWg215NFUKrKGoJ9bNk
 GGCmbFEYV8bnWAcKW7gfvT0qOlJdlGoY4FVyeyiTgLXUnvNQzuycAVTHyd2Fr+SajfAl
 ah8BLmhF8KWP7/B0GFxMH9RXwwiQ/m/t6GBEoF2EC8pO7k6z3+gfHLKVsli7iURYIpLu
 dOqZiIMvruL7HnFYlWCtrMj9cPW5DcVF2poausA8uz5E0z1rzP4ufFCW8UUhVcmlzA7q
 IirZJjNKi8oy25v2a8XJDvg7I/tTZm+l0fHLGrrT35o0kyh/T1wQezL04Dj8y254n338
 +rfw==
X-Gm-Message-State: AOAM530AKUUMeLiH6pamyDGQUsvzTWkI/swnvPDck55UF9a3Vlue75+z
 P0sM91Gg3VgMimhoBL/abhz+jvgmYC8=
X-Google-Smtp-Source: ABdhPJwz4uDeu4LMtckK1ph/x+oETjBD9BGaF/He4X2GUDvzqGup6brVXuM5nuc/vYvmhFpla5wzVA==
X-Received: by 2002:a17:902:be18:b0:153:2444:9c1a with SMTP id
 r24-20020a170902be1800b0015324449c1amr33060835pls.152.1648594839645; 
 Tue, 29 Mar 2022 16:00:39 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056a00088a00b004f7ceff389esm22547276pfj.152.2022.03.29.16.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:00:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/msm/gem: Split vma lookup and pin
Date: Tue, 29 Mar 2022 16:00:55 -0700
Message-Id: <20220329230105.601666-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329230105.601666-1-robdclark@gmail.com>
References: <20220329230105.601666-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This way we only lookup vma once per object per submit, for both the
submit and retire path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        | 60 +++++++++++++---------------
 drivers/gpu/drm/msm/msm_gem.h        |  9 +++--
 drivers/gpu/drm/msm/msm_gem_submit.c | 17 +++++---
 3 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 218744a490a4..e8107a22c33a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -407,7 +407,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-static int msm_gem_pin_iova(struct drm_gem_object *obj, struct msm_gem_vma *vma)
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct page **pages;
@@ -439,6 +439,26 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 	return ret;
 }
 
+void msm_gem_unpin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
+
+	msm_gem_unmap_vma(vma->aspace, vma);
+
+	msm_obj->pin_count--;
+	GEM_WARN_ON(msm_obj->pin_count < 0);
+
+	update_inactive(msm_obj);
+}
+
+struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
+					   struct msm_gem_address_space *aspace)
+{
+	return get_vma_locked(obj, aspace, 0, U64_MAX);
+}
+
 static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
@@ -452,7 +472,7 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
-	ret = msm_gem_pin_iova(obj, vma);
+	ret = msm_gem_pin_vma_locked(obj, vma);
 	if (!ret)
 		*iova = vma->iova;
 
@@ -476,12 +496,6 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 	return ret;
 }
 
-int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova)
-{
-	return get_and_pin_iova_range_locked(obj, aspace, iova, 0, U64_MAX);
-}
-
 /* get iova and pin it. Should have a matching put */
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova)
@@ -511,29 +525,6 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
-/*
- * Locked variant of msm_gem_unpin_iova()
- */
-void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	GEM_WARN_ON(!msm_gem_is_locked(obj));
-
-	vma = lookup_vma(obj, aspace);
-
-	if (!GEM_WARN_ON(!vma)) {
-		msm_gem_unmap_vma(aspace, vma);
-
-		msm_obj->pin_count--;
-		GEM_WARN_ON(msm_obj->pin_count < 0);
-
-		update_inactive(msm_obj);
-	}
-}
-
 /*
  * Unpin a iova by updating the reference counts. The memory isn't actually
  * purged until something else (shrinker, mm_notifier, destroy, etc) decides
@@ -542,8 +533,13 @@ void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace)
 {
+	struct msm_gem_vma *vma;
+
 	msm_gem_lock(obj);
-	msm_gem_unpin_iova_locked(obj, aspace);
+	vma = lookup_vma(obj, aspace);
+	if (!GEM_WARN_ON(!vma)) {
+		msm_gem_unpin_vma_locked(obj, vma);
+	}
 	msm_gem_unlock(obj);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 772de010a669..f98264cf130d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -133,17 +133,17 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma);
+void msm_gem_unpin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma);
+struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
+					   struct msm_gem_address_space *aspace);
 int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end);
-int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova);
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
-void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace);
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
 struct page **msm_gem_get_pages(struct drm_gem_object *obj);
@@ -369,6 +369,7 @@ struct msm_gem_submit {
 			uint32_t handle;
 		};
 		uint64_t iova;
+		struct msm_gem_vma *vma;
 	} bos[];
 };
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c6d60c8d286d..91da05af40ee 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -232,7 +232,7 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
 	if (flags & BO_PINNED)
-		msm_gem_unpin_iova_locked(obj, submit->aspace);
+		msm_gem_unpin_vma_locked(obj, submit->bos[i].vma);
 
 	if (flags & BO_ACTIVE)
 		msm_gem_active_put(obj);
@@ -365,21 +365,26 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
-		uint64_t iova;
+		struct msm_gem_vma *vma;
 
 		/* if locking succeeded, pin bo: */
-		ret = msm_gem_get_and_pin_iova_locked(obj,
-				submit->aspace, &iova);
+		vma = msm_gem_get_vma_locked(obj, submit->aspace);
+		if (IS_ERR(vma)) {
+			ret = PTR_ERR(vma);
+			break;
+		}
 
+		ret = msm_gem_pin_vma_locked(obj, vma);
 		if (ret)
 			break;
 
 		submit->bos[i].flags |= BO_PINNED;
+		submit->bos[i].vma = vma;
 
-		if (iova == submit->bos[i].iova) {
+		if (vma->iova == submit->bos[i].iova) {
 			submit->bos[i].flags |= BO_VALID;
 		} else {
-			submit->bos[i].iova = iova;
+			submit->bos[i].iova = vma->iova;
 			/* iova changed, so address in cmdstream is not valid: */
 			submit->bos[i].flags &= ~BO_VALID;
 			submit->valid = false;
-- 
2.35.1

