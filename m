Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8598E3D2030
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592546E49D;
	Thu, 22 Jul 2021 08:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408746EB50
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 08:55:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so1089167wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 01:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k5pyEiZy6H21OAqkLHh7c3rEazNmSQ7bzyJoXwub770=;
 b=qpNmfMn87fGq2PsYCMmZw4PftJjzcpMiAGCa27weUqO/NWQzbhsfNjytbcciM6S9tN
 5Rt0WU2ezMt+VK1Da3QMOl8pMwJAPFGPLreQdc+kCSeX6hoQ5bPv6EJ7wYfvS+R/JwjR
 enPmCnF0HcQi0uNcxBen7U2O5UaucFI5fm3fkhASS/sWiP4cjW01Unm9kfko32NO1oAa
 OBqjM0WxfrS+lHkMSyjKWbytoI1kaWNZfHYgK+SHI3a7IGXobIY2I+Xh3m96JgNfTY+m
 RCbs8lmX8luhqfypWRNrrkenfqiyKSuxJvLnUows6DVlgN1aK5S89Y6Cz1A+2WfOOqbH
 AF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k5pyEiZy6H21OAqkLHh7c3rEazNmSQ7bzyJoXwub770=;
 b=KZkmtFuQGDJzrcFsXch5jxiLSQvKnf5xT2/HHDEh0gNatb2wuVe/xiiP8/IAXC3ay/
 WFERZjd80sHLCnPbkwWq1YytLk/b3okjZS+4lFDViVOvLPFZ7CRulNfQ+7cCPgcdJnoh
 yzFBimvtXUZAw5z8xYE3P5cgnu/uxBDPGa1Ckqf11m+40YClQBPyw0dzYgtkdx7qPe3k
 NcBhmmv/lNDMkuVoyPVFFFW3LYm5R9aKCEHbu9oyscTJyrMCWLUBgF0qkrUjB1SC+RLL
 ffUraHux3AX8vBqhCb2i+a9fH7Ul66NTmuAB5M4oIuaMfrUzTo16WAoK7FVunx8Sw0ol
 GOrg==
X-Gm-Message-State: AOAM533Pk2mfQjXUrYBIrgCC4C56NwZv4SsDnNa/JF/uacYVZ4//FPaO
 upM2HMwh2OextT79p3r70wlk8KEbQNc=
X-Google-Smtp-Source: ABdhPJx6HuT58Y/TMhwVvYYUMVpx1ls2jTBo/L1I3SK/4hMtgWc9Y+2tyOfsd2dcjBha23U+dHo6bA==
X-Received: by 2002:a05:600c:1ca3:: with SMTP id
 k35mr7906828wms.174.1626944157010; 
 Thu, 22 Jul 2021 01:55:57 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:ee9:2117:be77:929c])
 by smtp.gmail.com with ESMTPSA id w3sm29130889wrt.55.2021.07.22.01.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 01:55:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com
Subject: [PATCH 3/5] drm/nouveau: unbind in nouveau_ttm_tt_unpopulate
Date: Thu, 22 Jul 2021 10:55:52 +0200
Message-Id: <20210722085554.1537-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722085554.1537-1-christian.koenig@amd.com>
References: <20210722085554.1537-1-christian.koenig@amd.com>
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

Turned out that doing this in nouveau_ttm_tt_destroy()/nouveau_sgdma_destroy()
is to late.

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

