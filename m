Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62073D7BA6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66B46E877;
	Tue, 27 Jul 2021 17:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D1F6E4FB;
 Tue, 27 Jul 2021 17:07:35 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so5740966pji.5; 
 Tue, 27 Jul 2021 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=Y26suS2zv/ne/rmL5xGeK7mrZrZekL/BY237YS4TKXBIWvMYtXlM6hv4YcSIfH3JE7
 oKHVEtcK9zuQ3gaRCuTNwGXkowGwD9mTKdZsMZTKy1HJnv3JK6boDHpU17na6ISt69/h
 0Ay0fy1MDrD2ZPV1fDfPrUsYOR5kTQ6sRPsrY2pQ0qBBGRQU/msLnXPKh/4Nxi5kqDvq
 A02h+J8GOh/BKmExs7s4LpXf/mVPKdj2/XL7SGtwhL8JCAOvjiAOW3vXHZ6bGE9hpKEN
 5FoyrXzXAam5Qa4CgVK/5xzcL/xBil5pnhFoKZnsmAD9m2zCnMk/qKtEewop2A+Z6dcJ
 8BxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=m/cV4Lon2BJ7XYKlTxnhvzKuvyEZRFMQfhYwnB2OYUvlYVD9kU4jtdYPbr1eu+P9J+
 b8cTqyaspzz1J70qZ5tnLJP73ypmFCAYn5CoaYn/1pfssiQJtA0gXPQHRpTi+bIi/mUe
 5oS2om5wHtmN4zXD9pnW463oifmsgR/xEk4RnLJm9NZy4DIyL0g3iEQSCnMVYcXWo7us
 dEV6P7uwoIprhHPwaUpAkiP+qHeCW2Iuouw53NGIz5Vf6zljINJYImvbmFjvd/hCu5jY
 oPwV20uwrDNa9EB+Pi0sC8ypFtiSv/i1y8BwKW+4tfUbzyBj2jBTRXUW7UDvd3A9XzNh
 QdnQ==
X-Gm-Message-State: AOAM533zTnIYJOwrljFl2rZznwFNzv02Q5sDmH1skdDap1pEYwHmVCOO
 dYBjvKs2UfHoQVZKUB2LMTwKRClfIMFUEw==
X-Google-Smtp-Source: ABdhPJzzUAGDhGif/HDsMRU/cfM3CYj8pqTG9EUxuBzeUsh0jVyUcDWZ27u+jQDf/4zEVRvRe6Is3w==
X-Received: by 2002:a17:902:e8d8:b029:117:8e2c:1ed5 with SMTP id
 v24-20020a170902e8d8b02901178e2c1ed5mr19663772plg.39.1627405654576; 
 Tue, 27 Jul 2021 10:07:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id k5sm4445325pfu.142.2021.07.27.10.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/13] drm/msm: Small submitqueue creation cleanup
Date: Tue, 27 Jul 2021 10:11:18 -0700
Message-Id: <20210727171143.2549475-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
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

