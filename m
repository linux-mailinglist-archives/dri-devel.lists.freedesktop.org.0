Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFF9351C10
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 20:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D9C6ECFA;
	Thu,  1 Apr 2021 18:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F996E037;
 Thu,  1 Apr 2021 18:42:22 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id gb6so1638624pjb.0;
 Thu, 01 Apr 2021 11:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A0jPq7oBqGITolTSnl7ZMGU4PvMaBmY5cqqCges5rWg=;
 b=f037o79fvjG/fGHOzCKWrvJIWGn4ndKqXQ1DMektS8xvrV9D+d8MbDlyGtNsqICeIp
 OOyLIyiZlSRcC75hEuVOF5Z5NXk5iPra5eo3rh4OIFmZ7gLohgAhZzYH9MTw7VptUoFm
 mG3wLFwiMWFfocE+umCw9bgrhQdtuEr+HObUUbjWGbw88eerKEjwGu4702nKr4TSv4ug
 cA7Khi8+ZezDGSK1Z1ouQ9EpdDSgaRMKttpEHe7ZJcpfot+xGENk+gX0q+h9mHzHsSTG
 2ZjOSfViOgkmM5DkUDJUl95VjdyNktE7xiYJYPgq+YjzNXfo37W0W2H4RznDpSEYHaql
 H3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A0jPq7oBqGITolTSnl7ZMGU4PvMaBmY5cqqCges5rWg=;
 b=CNH9QtFeIE8aBdoWQZWcQZZxWrnIWbvAm/byEm8vpX06b2BN+/bIFtOD5UYoonby6B
 ljXjQTSwqRmd9RJYAdPPjzE9wGNetDg1/BKAul6X6jfSpqVj1DgLuyxolu2xKmF/O0FK
 yQ7PiiyXVOwY0deSF4gh3RAzkPhaOlGQuKR2mcO+es8byCGqH43g3sQllVtVI9bYohMF
 oddVagf6vX/SG6La727wfN4V66drrScgAkAV217UPsWlaqvvL/YNTCrMUh0Sm/vrQvxl
 Ak2hIKZTW6LUMZogWNZ3QRKqgTATdSujO0WMOSoWVSba1v11FdytWvErRmbUMHkwsASG
 MdDQ==
X-Gm-Message-State: AOAM533gqAADt5CTcGCmj+vTT3bZDshEtDNsS3DG5s1kAxVvg165yl3W
 ScbN7PApxSOsu0X3LzJ+kUxsUMQUhUt0aw==
X-Google-Smtp-Source: ABdhPJxqKj8FXOu6Mvpt738kHa3uzJMpx0LOQcgPxCj0vmA4usPnrGQw8pmX/T9SfeL51k3SBTwZDA==
X-Received: by 2002:a17:90b:358:: with SMTP id
 fh24mr10182148pjb.109.1617302541369; 
 Thu, 01 Apr 2021 11:42:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id m7sm6406936pjc.54.2021.04.01.11.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:42:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Drop mm_lock in scan loop
Date: Thu,  1 Apr 2021 11:45:48 -0700
Message-Id: <20210401184548.607663-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gem.c          |  2 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 48 ++++++++++++++++++++++----
 2 files changed, 43 insertions(+), 7 deletions(-)

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
index f3e948af01c5..6bbb15d64861 100644
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
+		 * Now that we own a reference, we can move it to our own
+		 * private temporary list and drop mm_lock for the rest of
+		 * the loop body, to reduce contention with the retire_submit
+		 * path (which could make more objects available to purge)
+		 */
+		list_move_tail(&msm_obj->mm_list, &still_in_list);
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
