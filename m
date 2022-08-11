Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F125901F7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768A9B49FF;
	Thu, 11 Aug 2022 16:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF8AB49F7;
 Thu, 11 Aug 2022 16:01:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AD0961378;
 Thu, 11 Aug 2022 16:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B46AC433D7;
 Thu, 11 Aug 2022 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233715;
 bh=5FJntoiGAy4FKurYXXyOYgeeCYPluPQ7jBivwhv82Vk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IRPnX1+8fIBudYbPaa4sHaQj2GuLevfqGoNATnAc6FW5R8W5wvwfySvCDtU1cFYXO
 uWlxtYZB29DdJA3emN/7DDT13QmM4rIQ8aVfKZPzZWFJEFq6Weng5w8v769+oJdSqi
 oEKhlMduuaGXn3qzsmcrS2cC0EDOtC6/GHqgAy4dhfjF26PVlxKwDZR5u42Q1V6oI+
 PUyVDMRZW20iBcYQXQV0yemvpD99wUKQoLYdvy2MKuYbyMkM91KDI4dzeSzdIKwfls
 6uQp7pWNeQhIBsdxOWDAvxBxlRnQhHiqypTciceDwoPrYfSORFj15rZEm9p+7HBS3K
 T9inrvWR7yBfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 46/69] drm/msm/gem: Drop obj lock in
 msm_gem_free_object()
Date: Thu, 11 Aug 2022 11:55:55 -0400
Message-Id: <20220811155632.1536867-46-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811155632.1536867-1-sashal@kernel.org>
References: <20220811155632.1536867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit a414fe3a2129b490e1e9b8ad66f0364f4f961887 ]

The only reason we grabbed the lock was to satisfy a bunch of places
that WARN_ON() if called without the lock held.  But this angers lockdep
which doesn't realize no one else can be holding the lock by the time we
end up destroying the object (and sees what would otherwise be a locking
inversion between reservation_ww_class_mutex and fs_reclaim).

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/14
Signed-off-by: Rob Clark <robdclark@chromium.org>
Patchwork: https://patchwork.freedesktop.org/patch/489364/
Link: https://lore.kernel.org/r/20220613205032.2652374-1-robdclark@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_gem.c |  8 --------
 drivers/gpu/drm/msm/msm_gem.h | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d280dd64744d..0d84bdd4a0a8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1017,8 +1017,6 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
-	msm_gem_lock(obj);
-
 	/* object should not be on active list: */
 	GEM_WARN_ON(is_active(msm_obj));
 
@@ -1034,17 +1032,11 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 
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
index e39a8e7ad843..fdd9b1a08009 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -193,7 +193,19 @@ msm_gem_unlock(struct drm_gem_object *obj)
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
2.35.1

