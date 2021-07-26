Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BEB3D5C4C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525846EC13;
	Mon, 26 Jul 2021 14:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FEF6EA93;
 Mon, 26 Jul 2021 14:56:31 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso355078pjf.4; 
 Mon, 26 Jul 2021 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=JiIaaMCMbRm9mnJqUkFsfhJqfx6YQtWOcgTgsY7B0MQSf2dCUJ6fDDh2OdEKoM29XW
 QE+0jeQMIxKphuKIDCJEOqXn4g1B53buWNFtI5BkjhpBXV6OQP+gMbAR8C2ryOJYkoze
 y97CGRS3CFKLf7T/6IXO/NPSLPSlDBGTDhKQxHUMtAbvZaPl0j0EXA/38rjqUGvVGMeu
 NU2HHPINv2C8My3S0ihjsrW7uxgV62D6Zn650OWpTcTsZNzlWkO/6Kal3lx8L/k1dnTL
 wUCZqmMfk+FiY/cdwpOOnAR2WD2UcH5H2/pexZt3DsNJSOgV6bOtXc4Iw5mprG/7zPtv
 FsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=ckS/NTNwZJJi8pGxrSL1ZQiFri+OgjaQ2LwDRuGz+DbZpDN9YliGDeuvFX3xgiGkr2
 T65vGolwWguLS6hNXdz6if+nkjxCz01hv5aKk4CgbLkWo9ZC9bgiGtq77J3htSug+HOu
 ZjZUK9Fg0hhpsTjQdAp0QPkUw4oxiO8w3KUyaH5qxtuTEang13xY4Fztl0jEGKluFQAT
 bCUBj6cDubbADr+FpTvvz2xan0AUFvJ0L0IrBcQB7F2bJ9wDuqP4ClK6xSk85vIS3HZw
 nKv9anDBrKJN/rmtYkESzeUrEDqGCgJxEy+V4GLQBCt1yYvskb97np18hX+EbL9VNNFS
 obUQ==
X-Gm-Message-State: AOAM532zLuasKn/8IayCDj+6267F+vNtmcB2/40QUgj/ieAOqMDPnY3V
 d1zCV3xBRh9LcUqUApXZB8rnlqys9Ivf9Q==
X-Google-Smtp-Source: ABdhPJz86h6PCUyD51DoJndCL8qycP19c2HgrDfDXD+QrXL7gt+CAfAJRBeyCjnSVSAo7Xas4LT+qw==
X-Received: by 2002:a05:6a00:1503:b029:395:f05c:e073 with SMTP id
 q3-20020a056a001503b0290395f05ce073mr6929303pfu.80.1627311390171; 
 Mon, 26 Jul 2021 07:56:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id h30sm242101pfr.191.2021.07.26.07.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:56:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/12] drm/msm: Small submitqueue creation cleanup
Date: Mon, 26 Jul 2021 08:00:16 -0700
Message-Id: <20210726150038.2187631-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
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

