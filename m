Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74A3D8511
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5316EC19;
	Wed, 28 Jul 2021 01:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886826EC19;
 Wed, 28 Jul 2021 01:02:59 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id m1so2661720pjv.2;
 Tue, 27 Jul 2021 18:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AalGnabDB7Im6YINFnvZpIxn3mHmji1LafcDFuypRwQ=;
 b=Jm5GHmOLJb0emkQnwjVIxauCTaZ9bp4cSnUJI/3s1PMKUzxubA+LRtl9tCm95FwjuB
 t+3LBk5DHX9QeLoZdrRu5HfG7UcTvuUQCQjKK6UpkN1UJWzV1YH4HRMNblKUdlFKz79u
 g3pQRfs3vGXNTsOsNl8K7XnweHDr3FyW6VQjHPuMMtAA7G+ssFRryS1z12DPMm6rS2p1
 9bzw01zGKfQheShtM5IwKGBUoFTZoNjTAJYwkTfQzgvOjYkZJCKjpagHh6g/n1Mvc7M/
 5X2vC0vqWnRab5FO890Q+DIvyJo3p6rD97/so1M6zqemyJh+FdhPMlQHOGtVmoG7MEDh
 hZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AalGnabDB7Im6YINFnvZpIxn3mHmji1LafcDFuypRwQ=;
 b=oyXMfGiCxcf7w9GFIRnaKGZ6SEqxon4WRe/DXwUtSjRm1Fx00/r0sPvameIlwY19LO
 uxCg3mnHJ+VdT4SYX5w5gh2fua6cCFwzlXC9B2Sn9PRWOB7OQADegmdNFLnTD9rMr/2h
 JYqoERJqPhu7p9UEbEik0C29GzamtcDuHRc29++hF7o631bTAoa1taGU7I0/tFbtAwKv
 1ZbugcxRzeuaF5uhfNSb9Tg/Xdbc/lU63vezLVRQ04If0M1wBOOzZxfa3CgyfYiUhr6W
 DMeHWaSvYGdKcIASfMd+mqIqLLpbzZK4cWto0DsNmIhG+wvTY4Tg6JmSWlh3oaqBcQLV
 OhsA==
X-Gm-Message-State: AOAM530FTCLSt2xjdnzTUP2Mems+VmBoXjtL8fLV96zGYysXWHPC/PYc
 NkqISur1f8e86UaFKxUQb4CZixP6S+kgTg==
X-Google-Smtp-Source: ABdhPJx+ihtG30Yv0Ih/TtNp1Oa9ZaRW6x2mWK2PWUgcxnD2FM2IuyED9jDxUUu4+S3+2v1ZB1w6nw==
X-Received: by 2002:a62:dd83:0:b029:2e8:e511:c32f with SMTP id
 w125-20020a62dd830000b02902e8e511c32fmr25668115pff.49.1627434178476; 
 Tue, 27 Jul 2021 18:02:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 a23sm4900109pff.43.2021.07.27.18.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/13] drm/msm: Drop submit bo_list
Date: Tue, 27 Jul 2021 18:06:15 -0700
Message-Id: <20210728010632.2633470-11-robdclark@gmail.com>
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

This was only used to detect userspace including the same bo multiple
times in a submit.  But ww_mutex can already tell us this.

When we drop struct_mutex around the submit ioctl, we'd otherwise need
to lock the bo before adding it to the bo_list.  But since ww_mutex can
already tell us this, it is simpler just to remove the bo_list.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  1 -
 drivers/gpu/drm/msm/msm_gem.h        |  8 --------
 drivers/gpu/drm/msm/msm_gem_submit.c | 28 +++++++++++++---------------
 3 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a527a6b1d6ba..af199ef53d2f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1151,7 +1151,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	msm_obj->flags = flags;
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
-	INIT_LIST_HEAD(&msm_obj->submit_entry);
 	INIT_LIST_HEAD(&msm_obj->vmas);
 
 	*obj = &msm_obj->base;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a48114058ff9..f9e3ffb2309a 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -88,13 +88,6 @@ struct msm_gem_object {
 	 */
 	struct list_head mm_list;
 
-	/* Transiently in the process of submit ioctl, objects associated
-	 * with the submit are on submit->bo_list.. this only lasts for
-	 * the duration of the ioctl, so one bo can never be on multiple
-	 * submit lists.
-	 */
-	struct list_head submit_entry;
-
 	struct page **pages;
 	struct sg_table *sgt;
 	void *vaddr;
@@ -316,7 +309,6 @@ struct msm_gem_submit {
 	struct msm_gpu *gpu;
 	struct msm_gem_address_space *aspace;
 	struct list_head node;   /* node in ring submit list */
-	struct list_head bo_list;
 	struct ww_acquire_ctx ticket;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 2b158433a6e5..e11e4bb63695 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -63,7 +63,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->fault_dumped = false;
 
 	INIT_LIST_HEAD(&submit->node);
-	INIT_LIST_HEAD(&submit->bo_list);
 
 	return submit;
 }
@@ -143,7 +142,6 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 	for (i = 0; i < args->nr_bos; i++) {
 		struct drm_gem_object *obj;
-		struct msm_gem_object *msm_obj;
 
 		/* normally use drm_gem_object_lookup(), but for bulk lookup
 		 * all under single table_lock just hit object_idr directly:
@@ -155,20 +153,9 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 			goto out_unlock;
 		}
 
-		msm_obj = to_msm_bo(obj);
-
-		if (!list_empty(&msm_obj->submit_entry)) {
-			DRM_ERROR("handle %u at index %u already on submit list\n",
-					submit->bos[i].handle, i);
-			ret = -EINVAL;
-			goto out_unlock;
-		}
-
 		drm_gem_object_get(obj);
 
-		submit->bos[i].obj = msm_obj;
-
-		list_add_tail(&msm_obj->submit_entry, &submit->bo_list);
+		submit->bos[i].obj = to_msm_bo(obj);
 	}
 
 out_unlock:
@@ -299,6 +286,12 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	return 0;
 
 fail:
+	if (ret == -EALREADY) {
+		DRM_ERROR("handle %u at index %u already on submit list\n",
+				submit->bos[i].handle, i);
+		ret = -EINVAL;
+	}
+
 	for (; i >= 0; i--)
 		submit_unlock_unpin_bo(submit, i);
 
@@ -315,6 +308,12 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 			slow_locked = contended;
 			goto retry;
 		}
+
+		/* Not expecting -EALREADY here, if the bo was already
+		 * locked, we should have gotten -EALREADY already from
+		 * the dma_resv_lock_interruptable() call.
+		 */
+		WARN_ON_ONCE(ret == -EALREADY);
 	}
 
 	return ret;
@@ -508,7 +507,6 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
 		submit_cleanup_bo(submit, i, cleanup_flags);
-		list_del_init(&msm_obj->submit_entry);
 		if (error)
 			drm_gem_object_put(&msm_obj->base);
 	}
-- 
2.31.1

