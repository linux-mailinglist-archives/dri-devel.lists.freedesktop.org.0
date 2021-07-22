Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601783D2374
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 14:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72166EBA6;
	Thu, 22 Jul 2021 12:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9548E6EB1F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:41:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso2884152wmm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XYV11JNFtJ0LNfxBmV5PWTKY/7bs5I54vT7aSueO5Gk=;
 b=XdUmVEHNMFKle3u2/C8o0Cc5iLY6L+F1tUbbuCvV1LKW/R1lScWpMyXP4FHXnX1TeK
 YjwvOIn4z7/U25JOotUR6n4Cn+P/10Lz8BibZIZdAf88ib5JHN3Y2GuJ2UJ17bFS+Qha
 588giRgcnQ5AsYpuYexKoroktXPgQnSnot+wiGvWPdoYPjed9UBfx1ymfNTNiFwO0YMM
 yPoRtCXiJIXeBI01lwDC73/O0ESHCiVOe7txB2WL4+hkJRGsYIIt18TcwyCc8tJPSrjd
 cHw4Ltm+DmbqXpmZ9IE8BSbc9dBJzxgVZzGaHUJ8JK6giLwJZp1MlVwZDkv/XPyY5szR
 tZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XYV11JNFtJ0LNfxBmV5PWTKY/7bs5I54vT7aSueO5Gk=;
 b=HFy7B3MY4ypUq7Kwq1LvC2gAAyD3jNkM8Dp99mmI16+5aor2QiRXiZrE9SWcPONeZE
 7VfmFCK/TuhYb6Em2Gu0gqiDtvu3HZVV0/n3wu69sLiC6gP09FBr3bZ9jmCkSAXv+Lpw
 ahwaBRU3JgBsZQWj5ETFHXJu0D813zD4RYw7R8FSc79dxCyXUGMyrdJ5EJAtdS2y0PSk
 tVWIRShsSr9u7zXhSm07MkDf34cY47sHUImRNF1F2K5ChRnO4PIk5INPuAkOcFGpZKeb
 y5EOKv7Jte6jVWO4z1uU8pbxZiQHib2f/keM4owm/fxurE7mmTuMFUDP7njDMdXVkROs
 c94Q==
X-Gm-Message-State: AOAM5308AOn9bxikny9nmG/vyBU6i/jW7dpB5cqt1uzF/6XMloEDBaGB
 h6HMJVgsE3vd1m6bzpRvs8l0S++YwUM=
X-Google-Smtp-Source: ABdhPJzsJKvY/0g/MV5B2d1OgQJ+eNwoi70/R6XyL5EUmT22+OmfMUTtElvQm5dkfigPT+HDcmpwjg==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr8708953wma.145.1626957690335; 
 Thu, 22 Jul 2021 05:41:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6c5:784c:9ce7:760b])
 by smtp.gmail.com with ESMTPSA id w8sm18545133wrk.10.2021.07.22.05.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 05:41:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 3/5] drm/nouveau: unbind in nouveau_ttm_tt_unpopulate
Date: Thu, 22 Jul 2021 14:41:25 +0200
Message-Id: <20210722124127.17901-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722124127.17901-1-christian.koenig@amd.com>
References: <20210722124127.17901-1-christian.koenig@amd.com>
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
index 085023624fb0..5f309a4ec211 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1276,6 +1276,8 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
 	if (slave)
 		return;
 
+	nouveau_ttm_tt_unbind(bdev, ttm);
+
 	drm = nouveau_bdev(bdev);
 	dev = drm->dev->dev;
 
@@ -1289,7 +1291,6 @@ nouveau_ttm_tt_destroy(struct ttm_device *bdev,
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

