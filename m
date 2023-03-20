Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 338436C151B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F57D10E1F1;
	Mon, 20 Mar 2023 14:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F49F10E1F1;
 Mon, 20 Mar 2023 14:44:40 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id o11so12680118ple.1;
 Mon, 20 Mar 2023 07:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmpOBRevcWufl9+ZPvYmrN7HY3DEyxJ7D+2z8txKnGY=;
 b=QJDUUDwrP9t1D0nGIJK5gSCB/5iP/M2PNO7hkTIuenIDr5wOAdLaLWvmdhSrAoP/Zn
 B0qM1MmtBAJr1CyCWUOKfjFjWfXiPohphc2rf4b+HHRa3dnAPQaj2dN5SytZOLW1aBjm
 wU7c8/Rm1GCxHMXyEgPQUNkZ0f7Qm514ozSU9oM0jiEtQd0nParCwFrrGGCOhuKTXOEv
 qbGIpvuvl0cREN8lGQyEnOoCu+t6B0413wo/TgUKr2RJMEJhpIoCyG/4vn19q+rnv8IP
 ybxZ27mbTr37mHchmTQe59dNGfiGprzmckYERDAUkWEsIp34IcYsjDydR3Yyvk6NWB/X
 +qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmpOBRevcWufl9+ZPvYmrN7HY3DEyxJ7D+2z8txKnGY=;
 b=PuemlVfgdkbMAPI6d6kvKRzOcwzTL3WwKr6YX/RATFg9F/HZygb2tgBD90YH1ivoTd
 qC+3tnsG6d6GJGXmp/b9RqeqeVjIaqG0822bWWPLMXFv2/P3OSSV+Pv7dyhmxqVbjWYH
 xiNnhB9ecmul4x5kGi/LkYJgg81KN2gkSpQczV+4Pqmn14Y4Rnzqd5+gHM8DGuvksEqm
 7efey/jjNhX80RgtIcpnB/SLSDytWQHtUWm5/KlSDVdGBNIUJVBcM8T5jKhQ6JJhF5dr
 VUW4OzW2neBCt84DJ+fRPDko+n9My8YNjTyVdKjiE2bNkj1sEVl92sZcmpTfFkRKJai4
 +0PQ==
X-Gm-Message-State: AO0yUKXpp0JLG2tR6r+BLpHd4NGqnV+H24bQY4KGT8+zlQdK1mG0eddG
 fRu2xoY32wtJnjrdyusfzbg35/eqBwE=
X-Google-Smtp-Source: AK7set8xl+EwAB385uyueRZZJelsCmcMVEJo9Hgr+BjmAy9/CkKpfcsmJ83hqOSj+Zn0Gh1/n/okSA==
X-Received: by 2002:a05:6a20:7a81:b0:d9:240c:acdd with SMTP id
 u1-20020a056a207a8100b000d9240cacddmr5912063pzh.40.1679323479922; 
 Mon, 20 Mar 2023 07:44:39 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a63fd16000000b00502f9fba637sm6180061pgh.68.2023.03.20.07.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/23] drm/msm/gem: Simplify vmap vs LRU tracking
Date: Mon, 20 Mar 2023 07:43:27 -0700
Message-Id: <20230320144356.803762-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

vmap'ing is just pinning in disguise.  So treat it as such and simplify
the LRU tracking.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 6734aecf0703..009a34b3a49b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -626,6 +626,7 @@ int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
 	int ret = 0;
 
 	msm_gem_assert_locked(obj);
@@ -639,6 +640,10 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 		return ERR_PTR(-EBUSY);
 	}
 
+	pages = msm_gem_pin_pages_locked(obj);
+	if (IS_ERR(pages))
+		return ERR_CAST(pages);
+
 	/* increment vmap_count *before* vmap() call, so shrinker can
 	 * check vmap_count (is_vunmapable()) outside of msm_obj lock.
 	 * This guarantees that we won't try to msm_gem_vunmap() this
@@ -648,25 +653,19 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	msm_obj->vmap_count++;
 
 	if (!msm_obj->vaddr) {
-		struct page **pages = get_pages(obj);
-		if (IS_ERR(pages)) {
-			ret = PTR_ERR(pages);
-			goto fail;
-		}
 		msm_obj->vaddr = vmap(pages, obj->size >> PAGE_SHIFT,
 				VM_MAP, msm_gem_pgprot(msm_obj, PAGE_KERNEL));
 		if (msm_obj->vaddr == NULL) {
 			ret = -ENOMEM;
 			goto fail;
 		}
-
-		update_lru(obj);
 	}
 
 	return msm_obj->vaddr;
 
 fail:
 	msm_obj->vmap_count--;
+	msm_gem_unpin_locked(obj);
 	return ERR_PTR(ret);
 }
 
@@ -705,6 +704,7 @@ void msm_gem_put_vaddr_locked(struct drm_gem_object *obj)
 	GEM_WARN_ON(msm_obj->vmap_count < 1);
 
 	msm_obj->vmap_count--;
+	msm_gem_unpin_locked(obj);
 }
 
 void msm_gem_put_vaddr(struct drm_gem_object *obj)
@@ -813,10 +813,9 @@ static void update_lru(struct drm_gem_object *obj)
 
 	if (!msm_obj->pages) {
 		GEM_WARN_ON(msm_obj->pin_count);
-		GEM_WARN_ON(msm_obj->vmap_count);
 
 		drm_gem_lru_move_tail(&priv->lru.unbacked, obj);
-	} else if (msm_obj->pin_count || msm_obj->vmap_count) {
+	} else if (msm_obj->pin_count) {
 		drm_gem_lru_move_tail(&priv->lru.pinned, obj);
 	} else if (msm_obj->madv == MSM_MADV_WILLNEED) {
 		drm_gem_lru_move_tail(&priv->lru.willneed, obj);
-- 
2.39.2

