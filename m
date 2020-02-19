Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADA71641B2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B916EB63;
	Wed, 19 Feb 2020 10:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92F56EB69
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so6157785wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xMlgdU1cYExkP2QmLXd1n53OowDsHqDIXTQr8j/y3Q8=;
 b=T+x49BUuQM7M/z3U38Vqp7Kmd4NXSMDNcFJe991R5bZt0s8aChJvrMmz7fsDCSLOhp
 jv8FE72a5MrrcrFuHDqXOz/ULMzBBR56wKPlc4NOlK2a5jN35HHmACcATr7QaeAsazY7
 61cbCtIOligGJrJbU0kSCW97mdiqOdjAI1AXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xMlgdU1cYExkP2QmLXd1n53OowDsHqDIXTQr8j/y3Q8=;
 b=mZcg2yX8kiUwq066aacxHmElW+E77ycJI5Jvj2xnIiliEHTvzVItRIqmEM2fNYGCXM
 F2iqisbt/3R3b8AcVHREMyxu/xjUbPx5hMoCCGnoA7phNgoc3bReMzqr8WmfrUKCc6n9
 pBvJ4LNfQHPsMudliifeQrHDSDSjHN25H6G3ETdhUx+pElDf3OvF4YKg3JzBj11pW5dx
 tLu0FGRsOVm7qdgE04Jyo/XXfZKoQNUczdPLh0yZ4SdlbpsRnVJ7oMHgA3eLUmJxl9DY
 BWJzEI1s3+Bj36OaV+Et8Cdl7OsCjSUqXwWAGNP+OrX86jEiLaOg8wHC80AJXn1YddKT
 z7EQ==
X-Gm-Message-State: APjAAAUV1UGkl4YTFtrnbhnQqqfB6cceJnm8rR1HIs/6qnUXjOQO4PrR
 s4Nv7tOQmnJm6RlVo28dViqbDNHLkPc=
X-Google-Smtp-Source: APXvYqymi9589CDsGB+zjTSFgOOAfFLrPZpKIiRrm56SLHkI/2PZysDoDOjkW1ClCmBMu5VkiuS1AA==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr9512518wmc.9.1582107740163;
 Wed, 19 Feb 2020 02:22:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:19 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 41/52] drm/mtk: Drop explicit drm_mode_config_cleanup call
Date: Wed, 19 Feb 2020 11:21:11 +0100
Message-Id: <20200219102122.1607365-42-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's right above the drm_dev_put().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0563c6813333..947b2cbe2836 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -162,7 +162,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 	private->mutex_dev = &pdev->dev;
 
-	drm_mode_config_init(drm);
+	ret = drm_mode_config_init(drm);
+	if (ret)
+		return ret;
 
 	drm->mode_config.min_width = 64;
 	drm->mode_config.min_height = 64;
@@ -179,7 +181,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)
-		goto err_config_cleanup;
+		return ret;
 
 	/*
 	 * We currently support two fixed data streams, each optional,
@@ -255,8 +257,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		dma_dev->dma_parms = NULL;
 err_component_unbind:
 	component_unbind_all(drm->dev, drm);
-err_config_cleanup:
-	drm_mode_config_cleanup(drm);
 
 	return ret;
 }
@@ -272,7 +272,6 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 		private->dma_dev->dma_parms = NULL;
 
 	component_unbind_all(drm->dev, drm);
-	drm_mode_config_cleanup(drm);
 }
 
 static const struct file_operations mtk_drm_fops = {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
