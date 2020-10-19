Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63824292FDD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535116EA7D;
	Mon, 19 Oct 2020 20:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88A86EABF;
 Mon, 19 Oct 2020 20:46:11 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t4so401321plq.13;
 Mon, 19 Oct 2020 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dS6hhGeeNo+o5stc1m3klvV0MU6/9n7XgjyibfTeKXY=;
 b=OJA+wyn6JLDMhTDG8WBs5XhLEe+X/qKDVSrazR34UOgIx3ndbLBu0K4nMx9XTq+BvL
 stx+uZloX5mxvTaRfAG3QyomeD2JM5nfXfqLP+i66IwToKfmXgQU0ke3NcyxY2Nfwt8P
 Q2nom7x7JnBoZa+2BBHPbFHEt34vdYCpkNC3Pq+NID7HLLtY+D4V7ZdPkTNLFbSHliPO
 mcflihkizr6cjRY48OVU97eerG9StIrxFZuN3jDX+4Iv4PidM/FBT5m6z9omtu6xRvA5
 oqnP7ZQ1pzIgjM2mmlJR5fvtc23X6dksKe0PZO/ne//8W/nUBzp/Pnwf2rT6vnNXXVG0
 cECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dS6hhGeeNo+o5stc1m3klvV0MU6/9n7XgjyibfTeKXY=;
 b=KeRlKPNCz3G60Xrx6AZck3WiB6yKq/f80PT/Zz7LErZAn4KF2ZDdOIByD/zQE5/PiJ
 kRKHe2RbG9pjD6IuoKCujy2DKNt34izBFUp8kGJcL4BJcOzsvOpt0vs5EEgebC7PirCX
 qP7tAupM9MHK+ej+2aQGu+bMNYoS4mNY7Z5TWFHU09lWXH9REaZZEkk4JGHZoBBJR9qm
 gby7Zfs4+I0LIl8DSCjI7W+RYmbIaAxauxLoFrMwmi5DpgtAywBdE+jhaJI6XTiXdgfT
 14vps9tyEAm5/XkEdk8o0GADGle7Wra75/6kqQv4Gmh+aNAhkqKBDgHoIVYfdAojAKmS
 4E7g==
X-Gm-Message-State: AOAM530XQ/zDfPN2yh2P120UfGq9sxYuK4jolLchXonmJBZe7aLctxnO
 H/+b9+rYAx8SKyMf2ZBVRq941etbDxmv7w==
X-Google-Smtp-Source: ABdhPJz2M/XIYWLX70uK3IG3ufRB/qD6L5QWHxAYEGC47AuIcoKtxDnfwWscnnNh8cWb5PKS+LXQiA==
X-Received: by 2002:a17:90b:ecb:: with SMTP id
 gz11mr1215247pjb.25.1603140370892; 
 Mon, 19 Oct 2020 13:46:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n139sm600427pfd.167.2020.10.19.13.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:46:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 17/23] drm/msm: Remove obj->gpu
Date: Mon, 19 Oct 2020 13:46:18 -0700
Message-Id: <20201019204636.139997-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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

It cannot be atomically updated with obj->active_count, and the only
purpose is a useless WARN_ON() (which becomes a buggy WARN_ON() once
retire_submits() is not serialized with incoming submits via
struct_mutex)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 --
 drivers/gpu/drm/msm/msm_gem.h | 1 -
 drivers/gpu/drm/msm/msm_gpu.c | 5 -----
 3 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 092ed152999e..e4876498be47 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -775,7 +775,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = gpu;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
 		mutex_unlock(&priv->mm_lock);
@@ -791,7 +790,6 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 
 	if (!atomic_dec_return(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = NULL;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
 		mutex_unlock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 2f289c436ddd..f4e73c6f07bf 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -64,7 +64,6 @@ struct msm_gem_object {
 	 *
 	 */
 	struct list_head mm_list;
-	struct msm_gpu *gpu;     /* non-null if active */
 
 	/* Transiently in the process of submit ioctl, objects associated
 	 * with the submit are on submit->bo_list.. this only lasts for
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index bcd9b4fa98b2..d0f625112a97 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -810,11 +810,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		struct drm_gem_object *drm_obj = &msm_obj->base;
 		uint64_t iova;
 
-		/* can't happen yet.. but when we add 2d support we'll have
-		 * to deal w/ cross-ring synchronization:
-		 */
-		WARN_ON(is_active(msm_obj) && (msm_obj->gpu != gpu));
-
 		/* submit takes a reference to the bo and iova until retired: */
 		drm_gem_object_get(&msm_obj->base);
 		msm_gem_get_and_pin_iova_locked(&msm_obj->base, submit->aspace, &iova);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
