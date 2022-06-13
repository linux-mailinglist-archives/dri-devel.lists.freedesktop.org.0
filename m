Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94854A024
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4EA10F9A5;
	Mon, 13 Jun 2022 20:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEB410F9A5;
 Mon, 13 Jun 2022 20:50:22 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id x4so6762356pfj.10;
 Mon, 13 Jun 2022 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZmwXvgLLBC7TADCPkXTU2hZQHv34ij//8HIDEtsV3fg=;
 b=d4SK5QkUQl4YuJ5khcaFrQapCV8SM63zlqRjeOcI9zoh06FmMqpOvdLTMXBdxba3Gp
 KUnYizKkLIF419F1zA6l4tHwGs0rDfnMp9sWokkyqAUHQ6i23NSuOzFZkwzTnnem7M3Z
 C4SRDjxVroJVNHZbdGP5H5tW5ILZSO5vpca7JWzFw3UIl4+t9a2qEoWGvQ2Q+JIGnCaU
 Xocf8oekLGO2iA1zStcBA4ruy69//oC9IZ2z9xRCLQxlXY7HfD8LGUgn+agiTmVTboaQ
 zxa9rxnZonyLUvKJBBII++QCt3dI3TIr12x3YJ/BGFO0g6kjVtBAi+7Uogl+2PQHP7it
 +LAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZmwXvgLLBC7TADCPkXTU2hZQHv34ij//8HIDEtsV3fg=;
 b=jRYVa8dzEa4glgvbD2oJ9CKWE6w/UrC28BmABsS5Pcf39psO9RU/3FmAgWbo4jsfqY
 nK5muXnXcI0DWuXoCxTqyVBYAQJ/nOsDJAgoH/rFueviaOQdN6nzaQxn6Cx4/KXZX/dO
 K64S7EhjFWszTMGgUlZ5DYjnaNiMyZEQZ0Q1OPgjCLcfcjTovpu97fVM0H4WtcgYSN0q
 Namor37jVTPFHOaAWeZ2yHrLIGZIOpz/oN5ZhVVrD0y4Cu9FVF3YoMgbsklfDqGlyyLq
 r6/OkuYzycE/jrvy3ndEEsj/ZGDhcjj43LwEHf0ODFkyI9PixsU6CL17TwCCBZpXOIfQ
 GwSA==
X-Gm-Message-State: AOAM531/hFMwQcBw1AULyc8tchaSOkOgDlXeuBv5m0LBzO3LnPuTXkyR
 waNKXBQYEx1K6nKMKorlDjfWytXR72U=
X-Google-Smtp-Source: ABdhPJzm1ncJI/Zv5ZahCXdnEdUzbwnLxSHxpjYu4I8xjvCMgyZ73IgE2hbkPio67Zoi84w6qPuTJw==
X-Received: by 2002:a65:6b92:0:b0:39c:c97b:1b57 with SMTP id
 d18-20020a656b92000000b0039cc97b1b57mr1281744pgw.517.1655153421701; 
 Mon, 13 Jun 2022 13:50:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090264c200b0016641a37e71sm5509262pli.225.2022.06.13.13.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 13:50:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gem: Drop obj lock in msm_gem_free_object()
Date: Mon, 13 Jun 2022 13:50:32 -0700
Message-Id: <20220613205032.2652374-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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

The only reason we grabbed the lock was to satisfy a bunch of places
that WARN_ON() if called without the lock held.  But this angers lockdep
which doesn't realize no one else can be holding the lock by the time we
end up destroying the object (and sees what would otherwise be a locking
inversion between reservation_ww_class_mutex and fs_reclaim).

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/14
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c |  8 --------
 drivers/gpu/drm/msm/msm_gem.h | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3ef7ada59392..ccc7e6d8cc30 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1020,8 +1020,6 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
-	msm_gem_lock(obj);
-
 	/* object should not be on active list: */
 	GEM_WARN_ON(is_active(msm_obj));
 
@@ -1037,17 +1035,11 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 
 		put_iova_vmas(obj);
 
-		/* dma_buf_detach() grabs resv lock, so we need to unlock
-		 * prior to drm_prime_gem_destroy
-		 */
-		msm_gem_unlock(obj);
-
 		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	} else {
 		msm_gem_vunmap(obj);
 		put_pages(obj);
 		put_iova_vmas(obj);
-		msm_gem_unlock(obj);
 	}
 
 	drm_gem_object_release(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d608339c1643..432032ad4aed 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -229,7 +229,19 @@ msm_gem_unlock(struct drm_gem_object *obj)
 static inline bool
 msm_gem_is_locked(struct drm_gem_object *obj)
 {
-	return dma_resv_is_locked(obj->resv);
+	/*
+	 * Destroying the object is a special case.. msm_gem_free_object()
+	 * calls many things that WARN_ON if the obj lock is not held.  But
+	 * acquiring the obj lock in msm_gem_free_object() can cause a
+	 * locking order inversion between reservation_ww_class_mutex and
+	 * fs_reclaim.
+	 *
+	 * This deadlock is not actually possible, because no one should
+	 * be already holding the lock when msm_gem_free_object() is called.
+	 * Unfortunately lockdep is not aware of this detail.  So when the
+	 * refcount drops to zero, we pretend it is already locked.
+	 */
+	return dma_resv_is_locked(obj->resv) || (kref_read(&obj->refcount) == 0);
 }
 
 static inline bool is_active(struct msm_gem_object *msm_obj)
-- 
2.36.1

