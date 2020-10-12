Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32ED28ABA7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41456E1F7;
	Mon, 12 Oct 2020 02:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49C66E1F7;
 Mon, 12 Oct 2020 02:08:55 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d23so7761883pll.7;
 Sun, 11 Oct 2020 19:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kS25d5qKVGDZxWvcUI8CruK0rHlMGZPnc/KSyG6rgIQ=;
 b=Vn1vzJFVJFmP0O9FSHMj/0BY5nyOCoW//lFof2um+CcmUcqgekVvZaUYEjr/OleuSI
 wk57WLpqvzk3V315/2nEsIhh2+fD+OD0xpsx759PvRaWk2phS4Hg0xYHrlsZ7RKRWR5b
 oBtDrE49YGIBCEiuEAiLgmra30QcGqPswn8ODBRhWL3bWc8sxuUjSvIMVFAuLwPljMmR
 ToByKGFSPcj5clkw8Ow9fHbJ8LGD7uHjCEhGOLl2CWmUQcHU7cSDNZAvqibNynqIe2R9
 Mv8BcWEAJiunU4DcWZw767KmlULTzmXSAYi0HUbq5lWadz5RfwkGtu8hmMdsKXDRijey
 /i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kS25d5qKVGDZxWvcUI8CruK0rHlMGZPnc/KSyG6rgIQ=;
 b=c8OMMIoihgK0bHLzaZkfszomegfWe4+/3bkSrx3QeqWELUreCI4Rg904R6SJGa+XZ8
 VrqZEeBUlE2sZGjf/jZa0TvS8h10FFaePL1YT4qfi/wsZW90+kcJumHVmq2MYktZhHnS
 HyC7f5ozYuGTeQXUmFAYyOCF4jBhw+lrHnzHinlhoA5EGSacB4n5hRb74GUd4NN+UTpz
 sieV/IgR8yvxYkB5yNpXhhJLQKlB1AVh4nTOav0FkTeay960C6MZFg9r8TRiBVi2pEFc
 udfLw2wafCmfj3//fMnICuKQjnSGyzyJlIbemupzK2d0L22BV1vcvMXWbD0mZYcsI/gZ
 a9HQ==
X-Gm-Message-State: AOAM533ERa/LlxCSFUjaYz/FkyBPPFLpWD5QZV3dBg2TN1g76W6OSxjP
 +0PoXaFYXtTR1dpn9SncBHwnwuETYru3T/YC
X-Google-Smtp-Source: ABdhPJwxSla3igtA9DqgAD5GKP2q0CYqbs7fJho7xFNHP7UMTXM1LmB7nqEkXjoNuhlMAOui6nh3vA==
X-Received: by 2002:a17:902:d68d:b029:d3:dcce:d7f1 with SMTP id
 v13-20020a170902d68db02900d3dcced7f1mr21330798ply.84.1602468534924; 
 Sun, 11 Oct 2020 19:08:54 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q5sm17078811pgh.16.2020.10.11.19.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:08:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/22] drm/msm/gem: Add some _locked() helpers
Date: Sun, 11 Oct 2020 19:09:31 -0700
Message-Id: <20201012020958.229288-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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

When we cut-over to using dma_resv_lock/etc instead of msm_obj->lock,
we'll need these for the submit path (where resv->lock is already held).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 50 +++++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h |  4 +++
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index dec89fe79025..7bca2e815933 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -435,18 +435,14 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 			msm_obj->sgt, obj->size >> PAGE_SHIFT);
 }
 
-/*
- * get iova and pin it. Should have a matching put
- * limits iova to specified range (in pages)
- */
-int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
 	u64 local;
 	int ret;
 
-	msm_gem_lock(obj);
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	ret = get_iova_locked(obj, aspace, &local,
 		range_start, range_end);
@@ -457,10 +453,32 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 	if (!ret)
 		*iova = local;
 
+	return ret;
+}
+
+/*
+ * get iova and pin it. Should have a matching put
+ * limits iova to specified range (in pages)
+ */
+int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova,
+		u64 range_start, u64 range_end)
+{
+	int ret;
+
+	msm_gem_lock(obj);
+	ret = get_and_pin_iova_range_locked(obj, aspace, iova, range_start, range_end);
 	msm_gem_unlock(obj);
+
 	return ret;
 }
 
+int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova)
+{
+	return get_and_pin_iova_range_locked(obj, aspace, iova, 0, U64_MAX);
+}
+
 /* get iova and pin it. Should have a matching put */
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova)
@@ -501,21 +519,31 @@ uint64_t msm_gem_iova(struct drm_gem_object *obj,
 }
 
 /*
- * Unpin a iova by updating the reference counts. The memory isn't actually
- * purged until something else (shrinker, mm_notifier, destroy, etc) decides
- * to get rid of it
+ * Locked variant of msm_gem_unpin_iova()
  */
-void msm_gem_unpin_iova(struct drm_gem_object *obj,
+void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace)
 {
 	struct msm_gem_vma *vma;
 
-	msm_gem_lock(obj);
+	WARN_ON(!msm_gem_is_locked(obj));
+
 	vma = lookup_vma(obj, aspace);
 
 	if (!WARN_ON(!vma))
 		msm_gem_unmap_vma(aspace, vma);
+}
 
+/*
+ * Unpin a iova by updating the reference counts. The memory isn't actually
+ * purged until something else (shrinker, mm_notifier, destroy, etc) decides
+ * to get rid of it
+ */
+void msm_gem_unpin_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace)
+{
+	msm_gem_lock(obj);
+	msm_gem_unpin_iova_locked(obj, aspace);
 	msm_gem_unlock(obj);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index fbad08badf43..016f616dd118 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -103,10 +103,14 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end);
+int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova);
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
 uint64_t msm_gem_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
+void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace);
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
 struct page **msm_gem_get_pages(struct drm_gem_object *obj);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
