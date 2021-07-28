Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C23D84F8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311FE6EBA0;
	Wed, 28 Jul 2021 01:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8C06EB8E;
 Wed, 28 Jul 2021 01:02:28 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id m1so2660073pjv.2;
 Tue, 27 Jul 2021 18:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=t5Wepi5tj1bkE6GOdqqACip3pBBRrwi6TWI4YHUir3fDkwJG/Y90aB/7pCuXLVMaXG
 xcXfnHNtzQ94G3qtgrioXrXCQARLs+bDk4+/Mw0eXmzmCamoyR2wYp8vF1zRjM/W5r4C
 s3qD6Z2hOp6lkz2zxzhespg6qHGuVSoE8qKfi8FT6itW6WIAr1j0Bz3ot/4RfIUJg1Pr
 X90MwzsSlQ42X3B2yDIhmJFDC0KdBbugb3XRBnQT6LAvu6R6pFv/JELl/bvsqnQDPvzw
 zU9GjeAe43U4n7sKvbRzp+1JU/8eSEYiy9N4W+slm0kSfZeOISMcZF8LuWfUZ4GFgp9P
 TBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=Bz7fGfP9necuFomS1UD1RvzsOL60mAkutwRkNtnsiD7aCHY2CkOnVxiMuHiTZOzRzd
 Udhf7cxVHfBVqrwzmutrxGtllJis6N6FzpQW3/YzbhpohmZpjyUj0EqCikS42BeJPP/2
 LSQKya+qmGdfApNoFhjIDIM9ZLpavlITAcFOkE414klyddFrP/Cnk9B0uMHgD0Ig1es9
 UO+XWe0IpGrT7R1KHwuqXOK7W1Ll0qMVJEArrhURWNG4tLWoqTHNwJAKSoJJWQMc0F6q
 v9q0egx6AYB4LUIT0gzjXVWW4A/kihfaHXyEhq5oeM0vSdiF+pP5hAMpAZ+NsVXtUFIi
 0vXA==
X-Gm-Message-State: AOAM532wDHWdPQsDgpfil8VP6oO++nwtdkhMVwkXXKk0/a9++tKlNMkx
 xy6l5SllreK2V1Z67maPXus9IvlCvfBBAQ==
X-Google-Smtp-Source: ABdhPJytSJSEEESLfU0x+zsROI8dDqa9EpfmSYbyQiCyOZ1Lqgg+3Kh2J/NL9/Hikz/+IK8k8yGBXg==
X-Received: by 2002:a17:902:da8d:b029:12c:5241:c24e with SMTP id
 j13-20020a170902da8db029012c5241c24emr2766852plx.35.1627434147978; 
 Tue, 27 Jul 2021 18:02:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p17sm4086712pjg.54.2021.07.27.18.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/13] drm/msm: Small submitqueue creation cleanup
Date: Tue, 27 Jul 2021 18:06:07 -0700
Message-Id: <20210728010632.2633470-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If we don't have a gpu, there is no need to create a submitqueue, which
lets us simplify the error handling and submitqueue creation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index e5eef11ed014..9e9fec61d629 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -66,6 +66,12 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!ctx)
 		return -ENODEV;
 
+	if (!priv->gpu)
+		return -ENODEV;
+
+	if (prio >= priv->gpu->nr_rings)
+		return -EINVAL;
+
 	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
 
 	if (!queue)
@@ -73,15 +79,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-
-	if (priv->gpu) {
-		if (prio >= priv->gpu->nr_rings) {
-			kfree(queue);
-			return -EINVAL;
-		}
-
-		queue->prio = prio;
-	}
+	queue->prio = prio;
 
 	write_lock(&ctx->queuelock);
 
@@ -107,12 +105,14 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio;
 
+	if (!priv->gpu)
+		return -ENODEV;
+
 	/*
 	 * Select priority 2 as the "default priority" unless nr_rings is less
 	 * than 2 and then pick the lowest priority
 	 */
-	default_prio = priv->gpu ?
-		clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1) : 0;
+	default_prio = clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1);
 
 	INIT_LIST_HEAD(&ctx->submitqueues);
 
-- 
2.31.1

