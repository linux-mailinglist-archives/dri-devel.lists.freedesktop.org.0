Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F077A4F6D40
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A7610E64F;
	Wed,  6 Apr 2022 21:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F62710E650;
 Wed,  6 Apr 2022 21:46:49 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id m16so3162345plx.3;
 Wed, 06 Apr 2022 14:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=05mUL8FeeCXWVDafJ6OfP4ybn8WOOy9jUdlt3AmYSNs=;
 b=C/htTmoJPwHdsusOkfG+Rwk/o+/FKO4D3LDZS6ygNSErkB/XiVDpeKzRddPa9x7Z+t
 W4lUJMdHW/CEkxuSpZIweiO1glI2u5YB7x/jwQrn69y2lDlw3Ac7iYqt417IYtMHa6kB
 OarTPgwKpNs1vVpbVADkBAcnjhQzFM343X70aEJLjZHHekIed+gZkwTKpViIT9YMfPWj
 Qy96FmRSer5cX9Q5P8SvsI0lkcEg5BoH8oisAHdv7zM0BrL4MjKRgRuBois4QZW55Aue
 iWkiJLNny7syqCAtdIlfPWwMGlJlL0j4MbB+svhqYwCjKbS3cC1rV9K3rhEUIxFENsGE
 GI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05mUL8FeeCXWVDafJ6OfP4ybn8WOOy9jUdlt3AmYSNs=;
 b=swYiWMxWAbK8P5p2Au07kju3virOIHIHmLhFesMnUCtdyEUw4p56mZ5ma71FhH/OpX
 fM/pTTkLIUz1pfA9dsqcO6ytyOcyDi11rGSwLBTL6/iHa87SDV4ef2yz1vYKqHO2ab3J
 USBOOEBF2QvVSsn1ruAvkJAbH/1ysVBFF7IxcyDR+EBK19m3kPSvPGWJZFY+8wepc631
 etX1W1OoO15VvjSHesr0uO/S2F72muG7TmNzcmHs9yHRl1fhcogkYdnlA+KqE1cB9AXF
 +0Dp9HXx3JCINOkCEYeMHBx+PabM/IkGySOGHc2ToINJYXu5qqSuryoPa3pB/zI38FB0
 dz6g==
X-Gm-Message-State: AOAM532+B7bUqkto0S8bKmlV6ypDXiJbmpFH+nvRMTLYZ46H9ILVDr8U
 xZG1nosJnUglBRMGUfmswgyP7+IpCg4=
X-Google-Smtp-Source: ABdhPJxPXOjJ4YTTM3itRDHPef7YTGBTVqEzOTUqnK9JWuqXuLcVqCxfHcfGVgvzJfUS3LNlSGPyVg==
X-Received: by 2002:a17:90b:380b:b0:1ca:c6dd:d75b with SMTP id
 mq11-20020a17090b380b00b001cac6ddd75bmr12330809pjb.146.1649281608126; 
 Wed, 06 Apr 2022 14:46:48 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 q13-20020aa7982d000000b004fb199b9c7dsm21126253pfl.119.2022.04.06.14.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:46:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/10] drm/msm/gem: Split vma lookup and pin
Date: Wed,  6 Apr 2022 14:46:24 -0700
Message-Id: <20220406214636.1156978-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406214636.1156978-1-robdclark@gmail.com>
References: <20220406214636.1156978-1-robdclark@gmail.com>
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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

