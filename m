Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A649A3D8E83
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BFB6E52A;
	Wed, 28 Jul 2021 13:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697E46E81A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:05:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id b128so1361529wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K++ityza90IN6prFOtdKFjOjcYel7qNILWEbTxpJgDI=;
 b=pPfKgEIaq6w50VyRFE5h2TlqgahzL6myzhQx3jU1+KtmbkUrz4cCiaGP4k1ygm3v/l
 MKQEpCYS0GtrqTYAD2rm2Arqgx9tBabRNBPBNHKazIb518XDzQUk67IAz+dhpM125D4R
 D/EeGDlcZUuHY3lF3QPZG4LIHCFDV6cMcbDktIEvq8/J+lBrLpFI6NBm8wtmuDFWdh4/
 iX+7Cv5uEuS4teexhKac8/j202rW7Eyj7fl/QFlVN+2RlXgfk0LDOEhLHjhwnb+RDp5R
 5yn98N4VkFry/rze9dLLAHLXodGiTUr3f1MPBRPSwdSLglSs/dByd+7giMApjtxRAl3/
 orQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K++ityza90IN6prFOtdKFjOjcYel7qNILWEbTxpJgDI=;
 b=fhSwDGJwnaxl0ZmORYHyUxrgmqPzj10xgbp9OeDm7gG+RLiMHXIj2nXIdixg7iY4No
 1QGwI1NPfoiwvkhCHpCjPgwRMRsdi4uGnmFBfo5RXO1brgW3aEf7ky+uvGUYXz2j9XCD
 1Sv0MQO+EfAjUVUu+FDYaOiqeeTLQMljRs5zGVJre6BKeKs1HubjyAwxDBDMEk0cVNb6
 PlCDTb/3ZDi/8O0Omtbz6uA+i/5a4S6KqRTWc5Q9MVLE1AWVISfkDVBEA+p5JEtv0tqk
 rQJt+f/YRYZEkxUW2S5V5eUNWZzKcaLY8S4PkOiRMu0XH1gZVVnySGVl/jIE+dLqLvaW
 4WUg==
X-Gm-Message-State: AOAM532dtCbpDAyKYRoTUQq1Wmv56buPLtFWv0+kuYv4a1Q77LEGBhwN
 qWALeXBSC8EIZkd1szbPdhbka1oVauw=
X-Google-Smtp-Source: ABdhPJyHWqAzx8F/lVZF+W68NkZj1jLCMAWgG56ggjxh0pG1ZLQBWWaqlvAsduE8XxjEUU7xkTjqeg==
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr276748wmq.71.1627477554944; 
 Wed, 28 Jul 2021 06:05:54 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6a03:ba57:3127:59bd])
 by smtp.gmail.com with ESMTPSA id o17sm5867374wmp.31.2021.07.28.06.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:05:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 3/5] drm/nouveau: unbind in nouveau_ttm_tt_unpopulate
Date: Wed, 28 Jul 2021 15:05:50 +0200
Message-Id: <20210728130552.2074-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728130552.2074-1-christian.koenig@amd.com>
References: <20210728130552.2074-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doing this in nouveau_ttm_tt_destroy()/nouveau_sgdma_destroy() is to late.

It turned out that this is not a good idea at all because it leaves pointers
to freed up system memory pages in the GART tables of the drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 6d07e653f82d..c33a56c2f068 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1277,6 +1277,8 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
 	if (slave)
 		return;
 
+	nouveau_ttm_tt_unbind(bdev, ttm);
+
 	drm = nouveau_bdev(bdev);
 	dev = drm->dev->dev;
 
@@ -1290,7 +1292,6 @@ nouveau_ttm_tt_destroy(struct ttm_device *bdev,
 #if IS_ENABLED(CONFIG_AGP)
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 	if (drm->agp.bridge) {
-		ttm_agp_unbind(ttm);
 		ttm_tt_destroy_common(bdev, ttm);
 		ttm_agp_destroy(ttm);
 		return;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 256ec5b35473..bde92a9dae7a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -21,7 +21,6 @@ nouveau_sgdma_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 
 	if (ttm) {
-		nouveau_sgdma_unbind(bdev, ttm);
 		ttm_tt_destroy_common(bdev, ttm);
 		ttm_tt_fini(&nvbe->ttm);
 		kfree(nvbe);
-- 
2.25.1

