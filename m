Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD06B5818EB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE31F963BA;
	Tue, 26 Jul 2022 17:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F720963B8;
 Tue, 26 Jul 2022 17:50:27 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id bf13so13734639pgb.11;
 Tue, 26 Jul 2022 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6E5wGlWgwtmRN55cq/vUaSJZuL1NyuRgvoYtJGWwhUY=;
 b=I6TrnqzGLU8Wf3TA6F1MQYzTQa84tF+RBUNCPmEwcKxAm1IhUepiQRpBJBj47oj30O
 vUieVbVD4FZUI1Ik6fD9+t9sHMqG+mg60pW4KXGXxlhFMU07+iURe9UjS35iuenNealj
 Sh0KfVZ2WhxqofgVCHjPSUDLte7xjDhmkL4xgCIYVVZvYqMptrlBr5udaYVqRjwJ6/AT
 RRC8lgmRAawFuk+gITQ8eOUS3x3J/l3/aaXzW4AW0p0kBf8Brxq1JwCN0zK6cyBIvEXw
 fiX6EhU9ecHIZdNXvkuWqTFwtsSivBc8S9JQTXYT8iXcafprX7WN6L3YuACD7IPK2/jh
 7pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6E5wGlWgwtmRN55cq/vUaSJZuL1NyuRgvoYtJGWwhUY=;
 b=Npl5fMoDsBdVwmBO0y31WqOmBpqUZndFJZdTCOoUt6uKwHQBDeBFwk2J110cnXZcnD
 CJ6AhaYC8jkbIZcGpvA8ytKb6uDV874FstGxZR5zvvhtA3nLAbFeqToFZw0S2jb+Q+i3
 CQp6PFaVh5eu2EIgsZEAG8I4H3dTZ/lQeuhEITrgkGWx1px1wYzN/OZ9Bp3nYZXf0pnG
 O2nVZXScl1cbNgxokAWcAvL2PANl6za6ZYRFzMbjnwEYxrR2OFD5uLn7P4n3wQkBVm8q
 GOyDIBvVlkYEgcZkv9aGavZq/BHebp0+cCf+UxGUdGSy+K4M3z37S5z6miRBlLEt8qkO
 7xuw==
X-Gm-Message-State: AJIora9kjOXqKZmRyft2kL6lDwc+FbI8V47YZNPyB6xexlKjGcAMpxYK
 Vw12huxwci7wI3dNt0nGFyNTBcMvUmU=
X-Google-Smtp-Source: AGRyM1v60uBR/7d9lI9MPwuXCKfxtHlJMImYLsPoMUgmUzrznjI7tzuzUaPiTsEizY7S5glKV3qWrA==
X-Received: by 2002:a65:6398:0:b0:415:7d00:c1de with SMTP id
 h24-20020a656398000000b004157d00c1demr16203732pgv.610.1658857826229; 
 Tue, 26 Jul 2022 10:50:26 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a170902d4c800b0016be9fa6807sm11807467plg.284.2022.07.26.10.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:50:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/15] drm/msm/gem: Check for active in shrinker path
Date: Tue, 26 Jul 2022 10:50:28 -0700
Message-Id: <20220726175043.1027731-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726175043.1027731-1-robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
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

Currently in our shrinker path we shouldn't be encountering anything
that is active, but this will change in subsequent patches.  So check
if there are unsignaled fences.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gem.h          |  1 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  6 ++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 8ddbd2e001d4..b55d252aef17 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -870,6 +870,16 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 	mutex_unlock(&priv->mm_lock);
 }
 
+bool msm_gem_active(struct drm_gem_object *obj)
+{
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
+
+	if (to_msm_bo(obj)->pin_count)
+		return true;
+
+	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+}
+
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
 {
 	bool write = !!(op & MSM_PREP_WRITE);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 432032ad4aed..0ab0dc4f8c25 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -173,6 +173,7 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj);
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
 void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
 void msm_gem_active_put(struct drm_gem_object *obj);
+bool msm_gem_active(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 6e39d959b9f0..ea8ed74982c1 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -43,6 +43,9 @@ purge(struct msm_gem_object *msm_obj)
 	if (!is_purgeable(msm_obj))
 		return false;
 
+	if (msm_gem_active(&msm_obj->base))
+		return false;
+
 	/*
 	 * This will move the obj out of still_in_list to
 	 * the purged list
@@ -58,6 +61,9 @@ evict(struct msm_gem_object *msm_obj)
 	if (is_unevictable(msm_obj))
 		return false;
 
+	if (msm_gem_active(&msm_obj->base))
+		return false;
+
 	msm_gem_evict(&msm_obj->base);
 
 	return true;
-- 
2.36.1

