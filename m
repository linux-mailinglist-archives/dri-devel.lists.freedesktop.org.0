Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7316B35309A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 23:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7016E106;
	Fri,  2 Apr 2021 21:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEA76E106;
 Fri,  2 Apr 2021 21:08:54 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id x26so4314645pfn.0;
 Fri, 02 Apr 2021 14:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oLTaIOrTqKkHo1IVoAW0mlBLXAv0Dz4mdCieecndjsM=;
 b=BmzNKXNDZ+83eZJE6CsakJeweXzOjOa/saT/0iK9Ie2/xNwYKrnMJ3Kvjb92zN/n6V
 Ov+Am9UjRtmEiqZPkk57Fncbo2td+exEkQew4QK/avg06ketApNWrol8B0Fda6Gthkjl
 5lXJacDda4uQ94Ix51VolNJ8AWz89tBVlzUwy8+NM+xD2yfiQo7MbBx/avM2/bNad/Vv
 tCKNPhn6sZj48gTv/Y2H0O7hB2ZwhJdVeVB525lfj17YzPwVLIlB3dN1D2Kmcw1QjaLE
 Ds3VZklM2+bBqSEK29lEL9cZmc+XmIisBovnDW4zN8gdnWhuPK4LOYeA6JMZA3oUMJfX
 dHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oLTaIOrTqKkHo1IVoAW0mlBLXAv0Dz4mdCieecndjsM=;
 b=RrUj7QKJiMAPFXKEf7RIsrTF71BELEdmBEz+swtwWF4mijQzU2UGa5L4LJaJbmCBQP
 mYYJCNaj2VZAKP+upowqZe1S2BhXc9myBIoyxXTld+af6d3RicWij7LrbxQGYnHQ2awi
 NQBwpXPMaVoTYrMqHvD8mx8/Tzn1eMfE34GLHMMbzuVJA3cqt0JOvs5ZWq8gOHBn+fdK
 GZJC6P9PComR38/1E2Xa9Yq8tUEesetm11aBH8g0Jpd6XtzQMSRw7ynyB5bCZ+Nwz4VR
 FA8wa6UT+yaAs9NNVPsZvDipTd8fjL3p/+4oqML4ELo/IqhX9eD5mSMXfe2HUTDHebPB
 9/Lg==
X-Gm-Message-State: AOAM533tRoq4FvVEPLKBCFr5udkuJ4Me/YMMOiDDTWp7R+7muYbnVG6c
 hKTSdv+7hpMo35hFR+m3oLQS/70bT0oeTQ==
X-Google-Smtp-Source: ABdhPJxo1Mqx1ORQ+Y7GCG6EwpiBGuCpyJRRZzg0IklZb2e0zjRvQIJ4O9B2QGQmOuNDBxNPp5z3dw==
X-Received: by 2002:a65:56cc:: with SMTP id w12mr13328411pgs.354.1617397732734; 
 Fri, 02 Apr 2021 14:08:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id z14sm2811696pfn.48.2021.04.02.14.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:08:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm: Drop mm_lock in scan loop
Date: Fri,  2 Apr 2021 14:12:26 -0700
Message-Id: <20210402211226.875726-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
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

lock_stat + mmm_donut[1] say that this reduces contention on mm_lock
significantly (~350x lower waittime-max, and ~100x lower waittime-avg)

[1] https://chromium.googlesource.com/chromiumos/platform/microbenchmarks/+/refs/heads/main/mmm_donut.py

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h          |  3 +-
 drivers/gpu/drm/msm/msm_gem.c          |  2 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 48 ++++++++++++++++++++++----
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c84e6f84cb6d..d8d64d34e6e3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -184,7 +184,8 @@ struct msm_drm_private {
 	/**
 	 * Lists of inactive GEM objects.  Every bo is either in one of the
 	 * inactive lists (depending on whether or not it is shrinkable) or
-	 * gpu->active_list (for the gpu it is active on[1])
+	 * gpu->active_list (for the gpu it is active on[1]), or transiently
+	 * on a temporary list as the shrinker is running.
 	 *
 	 * These lists are protected by mm_lock (which should be acquired
 	 * before per GEM object lock).  One should *not* hold mm_lock in
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2ecf7f1cef25..75cea5b801da 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -719,7 +719,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	put_iova_vmas(obj);
 
 	msm_obj->madv = __MSM_MADV_PURGED;
-	mark_unpurgable(msm_obj);
+	update_inactive(msm_obj);
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 	drm_gem_free_mmap_offset(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index f3e948af01c5..33a49641ef30 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -22,26 +22,62 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	struct msm_gem_object *msm_obj;
+	struct list_head still_in_list;
 	unsigned long freed = 0;
 
+	INIT_LIST_HEAD(&still_in_list);
+
 	mutex_lock(&priv->mm_lock);
 
-	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
-		if (freed >= sc->nr_to_scan)
+	while (freed < sc->nr_to_scan) {
+		struct msm_gem_object *msm_obj = list_first_entry_or_null(
+				&priv->inactive_dontneed, typeof(*msm_obj), mm_list);
+
+		if (!msm_obj)
 			break;
-		/* Use trylock, because we cannot block on a obj that
-		 * might be trying to acquire mm_lock
+
+		list_move_tail(&msm_obj->mm_list, &still_in_list);
+
+		/*
+		 * If it is in the process of being freed, msm_gem_free_object
+		 * can be blocked on mm_lock waiting to remove it.  So just
+		 * skip it.
 		 */
-		if (!msm_gem_trylock(&msm_obj->base))
+		if (!kref_get_unless_zero(&msm_obj->base.refcount))
 			continue;
+
+		/*
+		 * Now that we own a reference, we can drop mm_lock for the
+		 * rest of the loop body, to reduce contention with the
+		 * retire_submit path (which could make more objects purgable)
+		 */
+
+		mutex_unlock(&priv->mm_lock);
+
+		/*
+		 * Note that this still needs to be trylock, since we can
+		 * hit shrinker in response to trying to get backing pages
+		 * for this obj (ie. while it's lock is already held)
+		 */
+		if (!msm_gem_trylock(&msm_obj->base))
+			goto tail;
+
 		if (is_purgeable(msm_obj)) {
+			/*
+			 * This will move the obj out of still_in_list to
+			 * the purged list
+			 */
 			msm_gem_purge(&msm_obj->base);
 			freed += msm_obj->base.size >> PAGE_SHIFT;
 		}
 		msm_gem_unlock(&msm_obj->base);
+
+tail:
+		drm_gem_object_put(&msm_obj->base);
+		mutex_lock(&priv->mm_lock);
 	}
 
+	list_splice_tail(&still_in_list, &priv->inactive_dontneed);
 	mutex_unlock(&priv->mm_lock);
 
 	if (freed > 0) {
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
